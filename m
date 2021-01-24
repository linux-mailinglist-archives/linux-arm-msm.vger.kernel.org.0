Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B45BA301CDC
	for <lists+linux-arm-msm@lfdr.de>; Sun, 24 Jan 2021 15:57:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725837AbhAXO4y (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 24 Jan 2021 09:56:54 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53172 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725831AbhAXO4x (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 24 Jan 2021 09:56:53 -0500
Received: from relay08.th.seeweb.it (relay08.th.seeweb.it [IPv6:2001:4b7a:2000:18::169])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5FF7EC061573
        for <linux-arm-msm@vger.kernel.org>; Sun, 24 Jan 2021 06:56:12 -0800 (PST)
Received: from [192.168.1.101] (abaf224.neoplus.adsl.tpnet.pl [83.6.169.224])
        (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by m-r2.th.seeweb.it (Postfix) with ESMTPSA id BD1153EBDD;
        Sun, 24 Jan 2021 15:56:07 +0100 (CET)
Subject: Re: [PATCH 1/4] ARM: dts: qcom: msm8974: add gpu support
To:     Iskren Chernev <iskren.chernev@gmail.com>,
        Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     Andy Gross <agross@kernel.org>, Rob Herring <robh+dt@kernel.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        ~postmarketos/upstreaming@lists.sr.ht,
        Samuel Pascua <pascua.samuel.14@gmail.com>,
        Alexey Minnekhanov <alexeymin@postmarketos.org>,
        Brian Masney <masneyb@onstation.org>
References: <20210124135610.1779295-1-iskren.chernev@gmail.com>
From:   Konrad Dybcio <konrad.dybcio@somainline.org>
Message-ID: <f1438c9d-458b-2ff7-cae9-f7bf4228ef4c@somainline.org>
Date:   Sun, 24 Jan 2021 15:56:06 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <20210124135610.1779295-1-iskren.chernev@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi,


> +		gpu_opp_table: opp_table {
> +			status = "disabled";


Is there a good reason to disable this?


> +			opp-800000000 {
> +				opp-hz = /bits/ 64 <800000000>;
> +			};

No. A330 can't go lightspeed (unless there's some secret ultra-binned msm8974pro-v4-ad-5g). [1]


> +
> +			opp-500000000 {
> +				opp-hz = /bits/ 64 <500000000>;
> +			};
> +
> +			opp-275000000 {
> +				opp-hz = /bits/ 64 <275000000>;
> +			};
> +		};

IMHO we should create separate DTs for all revisions of 8974 (sigh) and keep the opp tables in there, only leaving a lowest-common-denominator one here (which according to downstream and the msm/drm driver would be 27000000 /27MHz/) to make it at least probe for everybody..


On a note, max GPU frequencies (based on [1] and grepping for gpu-pwrlevels or qcom,gpu-freq downstream) are:


* 578 MHz for PRO (so -AC)

* 550 MHz is mentioned in [1] but not downstream..

* 450 MHz for everything else (v2.2 has more DVFS steps)


> +			// iommus = <&gpu_iommu 0>;

I *think* you're going to need more gpu contexts (user/priv/spare), but don't quote me on that.


Konrad


[1] https://www.anandtech.com/show/7846/the-difference-between-snapdragon-800-and-801-clearing-up-confusion

