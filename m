Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 248D54651A6
	for <lists+linux-arm-msm@lfdr.de>; Wed,  1 Dec 2021 16:28:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1346117AbhLAPb4 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 1 Dec 2021 10:31:56 -0500
Received: from m-r2.th.seeweb.it ([5.144.164.171]:42869 "EHLO
        m-r2.th.seeweb.it" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S244738AbhLAPbz (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 1 Dec 2021 10:31:55 -0500
Received: from [192.168.1.101] (83.6.166.111.neoplus.adsl.tpnet.pl [83.6.166.111])
        (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by m-r2.th.seeweb.it (Postfix) with ESMTPSA id 6B68F3F74D;
        Wed,  1 Dec 2021 16:28:33 +0100 (CET)
Message-ID: <725e7ac2-c4b1-8908-585f-d05d72bc7a95@somainline.org>
Date:   Wed, 1 Dec 2021 16:28:32 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [PATCH 14/15] arm64: dts: qcom: sm8450: add cpufreq support
Content-Language: en-US
To:     Vinod Koul <vkoul@kernel.org>
Cc:     linux-arm-msm@vger.kernel.org,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
References: <20211201072915.3969178-1-vkoul@kernel.org>
 <20211201072915.3969178-15-vkoul@kernel.org>
From:   Konrad Dybcio <konrad.dybcio@somainline.org>
In-Reply-To: <20211201072915.3969178-15-vkoul@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org


On 01.12.2021 08:29, Vinod Koul wrote:
> From: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
>
> The change adds a description of a SM8450 cpufreq-epss controller and
> references to it from CPU nodes.
>
> Signed-off-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
> Signed-off-by: Vinod Koul <vkoul@kernel.org>
> ---
>  arch/arm64/boot/dts/qcom/sm8450.dtsi | 27 +++++++++++++++++++++++++++
>  1 file changed, 27 insertions(+)
>
[...]


>  
> +			cluster1 {
>  				core4 {
>  					cpu = <&CPU4>;
>  				};
> @@ -182,7 +192,9 @@ core5 {
>  				core6 {
>  					cpu = <&CPU6>;
>  				};
> +			};
>  
> +			cluster2 {
>  				core7 {
>  					cpu = <&CPU7>;
>  				};

Weren't DynamIQ-enabled SoCs supposed to be treated as single-cluster

from the Linux POV? Or has it changed again with the new chips?


[...]


Konrad


