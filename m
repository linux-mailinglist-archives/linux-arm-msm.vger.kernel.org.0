Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id AC30150A6C
	for <lists+linux-arm-msm@lfdr.de>; Mon, 24 Jun 2019 14:09:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727270AbfFXMJZ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 24 Jun 2019 08:09:25 -0400
Received: from smtp.codeaurora.org ([198.145.29.96]:35394 "EHLO
        smtp.codeaurora.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726351AbfFXMJZ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 24 Jun 2019 08:09:25 -0400
Received: by smtp.codeaurora.org (Postfix, from userid 1000)
        id 3907260208; Mon, 24 Jun 2019 12:09:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1561378164;
        bh=MaCUZPA0WBpmhDgF7ZSaI/y5z015e/m1fjbhKVg781k=;
        h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
        b=Igfgu8I/NBL1TodYVMJ+5GKVpkfLUOK5LqJ+IU/yIwencYtSNQ528U/fa1sFDNXqd
         6C3OGjO1vM7SsVPRR+oKnZnpCiD9V3FzwQcfEIE6pxwJLGHJVRXKjeKzDLqjWCx0nw
         bPbywCrvkXL16S8R0jFYUbdCmGMtRJHYxg+wLzgI=
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        pdx-caf-mail.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.7 required=2.0 tests=ALL_TRUSTED,BAYES_00,
        DKIM_INVALID,DKIM_SIGNED,SPF_NONE autolearn=no autolearn_force=no
        version=3.4.0
Received: from [10.201.2.161] (blr-c-bdr-fw-01_globalnat_allzones-outside.qualcomm.com [103.229.19.19])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: sricharan@smtp.codeaurora.org)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 9793E60208;
        Mon, 24 Jun 2019 12:09:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1561378163;
        bh=MaCUZPA0WBpmhDgF7ZSaI/y5z015e/m1fjbhKVg781k=;
        h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
        b=jaTBNKsoLpo9W8/Iaz5NJX3j6OfmtkG4fwro1mR5vQgNwa5IOrKXq8pLP0rU/ZaZx
         3zVNqYdpLJfLDrdyBI7KgStORi5E4rI09SzFq3UX+xxC8MlbdD7Vo49O9u7Ltk2edI
         PzZXkwU6B42ctDicOyFCBRgR5h3V5nmMPo6nwSFc=
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 9793E60208
Authentication-Results: pdx-caf-mail.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: pdx-caf-mail.web.codeaurora.org; spf=none smtp.mailfrom=sricharan@codeaurora.org
Subject: Re: [PATCH v3] ARM: dts: qcom: ipq4019: fix high resolution timer
To:     Christian Lamparter <chunkeey@gmail.com>,
        linux-arm-msm@vger.kernel.org
Cc:     David Brown <david.brown@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Marc Gonzalez <marc.w.gonzalez@free.fr>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Pavel Kubelun <be.dissent@gmail.com>
References: <20190620161308.15936-1-chunkeey@gmail.com>
From:   Sricharan R <sricharan@codeaurora.org>
Message-ID: <d8acc90f-50ec-e6b4-d76b-edf0e309d121@codeaurora.org>
Date:   Mon, 24 Jun 2019 17:39:19 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.2
MIME-Version: 1.0
In-Reply-To: <20190620161308.15936-1-chunkeey@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Christian,

On 6/20/2019 9:43 PM, Christian Lamparter wrote:
> From: Abhishek Sahu <absahu@codeaurora.org>
> 
> The kernel is not switching the timer to the high resolution
> mode and clock source keeps operating in with a just a lousy
> 10ms resolution.
> 
> The always-on property needs to be given for xo clock source
> (which is the sole external oscillator) in the device tree
> node to get to the 1ns high resolution mode.
> 
> Signed-off-by: Abhishek Sahu <absahu@codeaurora.org>
> Signed-off-by: Pavel Kubelun <be.dissent@gmail.com>
> Signed-off-by: Christian Lamparter <chunkeey@gmail.com>
> ---
> 
> v3: fixed empty line, removed changeid reference and fluff,
>     reworded message.
> 
> v2: fixed subject [Abhishek Sahu is bouncing]
> ---
>  arch/arm/boot/dts/qcom-ipq4019.dtsi | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/arch/arm/boot/dts/qcom-ipq4019.dtsi b/arch/arm/boot/dts/qcom-ipq4019.dtsi
> index bbcb7db810f7..0e3e79442c50 100644
> --- a/arch/arm/boot/dts/qcom-ipq4019.dtsi
> +++ b/arch/arm/boot/dts/qcom-ipq4019.dtsi
> @@ -169,6 +169,7 @@
>  			     <1 4 0xf08>,
>  			     <1 1 0xf08>;
>  		clock-frequency = <48000000>;
> +		always-on;

Acked-by: Sricharan R <sricharan@codeaurora.org>

Regards,
 Sricharan

-- 
"QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum, hosted by The Linux Foundation
