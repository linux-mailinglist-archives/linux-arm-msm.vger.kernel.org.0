Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3BB86301CE3
	for <lists+linux-arm-msm@lfdr.de>; Sun, 24 Jan 2021 16:03:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725798AbhAXPDi (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 24 Jan 2021 10:03:38 -0500
Received: from relay05.th.seeweb.it ([5.144.164.166]:42351 "EHLO
        relay05.th.seeweb.it" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725268AbhAXPDi (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 24 Jan 2021 10:03:38 -0500
Received: from [192.168.1.101] (abaf224.neoplus.adsl.tpnet.pl [83.6.169.224])
        (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by m-r2.th.seeweb.it (Postfix) with ESMTPSA id 4CC393E9BA;
        Sun, 24 Jan 2021 16:02:55 +0100 (CET)
Subject: Re: [PATCH 2/4] ARM: dts: qcom: msm8974-klte: add support for GPU
To:     Iskren Chernev <iskren.chernev@gmail.com>,
        Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     Andy Gross <agross@kernel.org>, Rob Herring <robh+dt@kernel.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        ~postmarketos/upstreaming@lists.sr.ht,
        Samuel Pascua <pascua.samuel.14@gmail.com>,
        Alexey Minnekhanov <alexeymin@postmarketos.org>
References: <20210124135610.1779295-1-iskren.chernev@gmail.com>
 <20210124135610.1779295-2-iskren.chernev@gmail.com>
From:   Konrad Dybcio <konrad.dybcio@somainline.org>
Message-ID: <1c85e5e6-2e98-d0a9-aeaa-6b9b7fb9e68e@somainline.org>
Date:   Sun, 24 Jan 2021 16:02:54 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <20210124135610.1779295-2-iskren.chernev@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org


> +	opp_table {
> +		status = "ok";
> +	};
> +
> +	adreno@fdb00000 {
> +		status = "ok";
> +	};
>  };


Could you use &label instead? Reminds me that I should perhaps finally submit my 8974 cleanups one day..


Konrad

