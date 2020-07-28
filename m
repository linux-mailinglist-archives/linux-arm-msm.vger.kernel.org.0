Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 38FBE2301EB
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 Jul 2020 07:38:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726857AbgG1Fit (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 28 Jul 2020 01:38:49 -0400
Received: from mail29.static.mailgun.info ([104.130.122.29]:44190 "EHLO
        mail29.static.mailgun.info" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726756AbgG1Fis (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 28 Jul 2020 01:38:48 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1595914728; h=Content-Transfer-Encoding: Content-Type:
 In-Reply-To: MIME-Version: Date: Message-ID: From: References: Cc: To:
 Subject: Sender; bh=L6tv155ue/cM7vpR05om5vGytaUQTI2e5heAOFzZ2iI=; b=NSUnyWdIGyQBIc7FiPYJ9v/QAXm9BwwfyrQuWZPOcZN8wTRPQhgMaJfJxR/X6uMmmt5HbuQf
 R8M2D8mRadiV0lT1VtyShVXhyqVIMsZBsN9061oyQJXPkbDOoHmblaDwp4doOcrBkdaQyfuA
 sf2pLET0r0vMh2dG8tyFiTx0upc=
X-Mailgun-Sending-Ip: 104.130.122.29
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n10.prod.us-west-2.postgun.com with SMTP id
 5f1fb9e735f3e3d3168ffc9f (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Tue, 28 Jul 2020 05:38:47
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id CEB4AC433CB; Tue, 28 Jul 2020 05:38:47 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.8 required=2.0 tests=ALL_TRUSTED,NICE_REPLY_A,
        SPF_NONE,URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from [192.168.0.13] (unknown [183.83.138.47])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: akashast)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id C39CFC433C9;
        Tue, 28 Jul 2020 05:38:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org C39CFC433C9
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=none smtp.mailfrom=akashast@codeaurora.org
Subject: Re: [PATCH V2 2/3] arm64: dts: qcom: sc7180: Add sleep pin ctrl for
 BT uart
To:     satya priya <skakit@codeaurora.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        gregkh@linuxfoundation.org
Cc:     Andy Gross <agross@kernel.org>, Rob Herring <robh+dt@kernel.org>,
        Matthias Kaehlcke <mka@chromium.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, rojay@codeaurora.org,
        msavaliy@qti.qualcomm.com
References: <1595563082-2353-1-git-send-email-skakit@codeaurora.org>
 <1595563082-2353-3-git-send-email-skakit@codeaurora.org>
From:   Akash Asthana <akashast@codeaurora.org>
Message-ID: <d47f055c-50e6-9bbb-2ab9-e76ff6aac1c9@codeaurora.org>
Date:   Tue, 28 Jul 2020 11:08:40 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <1595563082-2353-3-git-send-email-skakit@codeaurora.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org


On 7/24/2020 9:28 AM, satya priya wrote:
> Add sleep pin ctrl for BT uart, and also change the bias
> configuration to match Bluetooth module.


Reviewed-by: Akash Asthana <akashast@codeaurora.org>

> Signed-off-by: satya priya <skakit@codeaurora.org>
> ---
> Changes in V2:
>   - This patch adds sleep state for BT UART. Newly added in V2.
>
>   arch/arm64/boot/dts/qcom/sc7180-idp.dts | 42 ++++++++++++++++++++++++++++-----
>   1 file changed, 36 insertions(+), 6 deletions(-)
>
> diff --git a/arch/arm64/boot/dts/qcom/sc7180-idp.dts b/arch/arm64/boot/dts/qcom/sc7180-idp.dts
> index 26cc491..bc919f2 100644
> --- a/arch/arm64/boot/dts/qcom/sc7180-idp.dts
> +++ b/arch/arm64/boot/dts/qcom/sc7180-idp.dts
> @@ -469,20 +469,50 @@
>   
>   &qup_uart3_default {
>   	pinconf-cts {
> -		/*
> -		 * Configure a pull-down on 38 (CTS) to match the pull of
> -		 * the Bluetooth module.
> -		 */
> +		/* Configure no pull on 38 (CTS) to match Bluetooth module */
>   		pins = "gpio38";
> +		bias-disable;
> +	};
> +
> +	pinconf-rts {
> +		/* We'll drive 39 (RTS), so configure pull-down */
> +		pins = "gpio39";
> +		drive-strength = <2>;
>   		bias-pull-down;
> +	};
> +
> +	pinconf-tx {
> +		/* We'll drive 40 (TX), so no pull */
> +		pins = "gpio40";
> +		drive-strength = <2>;
> +		bias-disable;
>   		output-high;
>   	};
>   
> +	pinconf-rx {
> +		/*
> +		 * Configure a pull-up on 41 (RX). This is needed to avoid
> +		 * garbage data when the TX pin of the Bluetooth module is
> +		 * in tri-state (module powered off or not driving the
> +		 * signal yet).
> +		 */
> +		pins = "gpio41";
> +		bias-pull-up;
> +	};
> +};
> +
> +&qup_uart3_sleep {
> +	pinconf-cts {
> +		/* Configure no-pull on 38 (CTS) to match Bluetooth module */
> +		pins = "gpio38";
> +		bias-disable;
> +	};
> +
>   	pinconf-rts {
> -		/* We'll drive 39 (RTS), so no pull */
> +		/* We'll drive 39 (RTS), so configure pull-down */
>   		pins = "gpio39";
>   		drive-strength = <2>;
> -		bias-disable;
> +		bias-pull-down;
>   	};
>   
>   	pinconf-tx {

-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,\na Linux Foundation Collaborative Project

