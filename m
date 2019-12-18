Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E180C124400
	for <lists+linux-arm-msm@lfdr.de>; Wed, 18 Dec 2019 11:12:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726710AbfLRKME (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 18 Dec 2019 05:12:04 -0500
Received: from mail25.static.mailgun.info ([104.130.122.25]:53174 "EHLO
        mail25.static.mailgun.info" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1725955AbfLRKMD (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 18 Dec 2019 05:12:03 -0500
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1576663922; h=Content-Transfer-Encoding: Content-Type:
 In-Reply-To: MIME-Version: Date: Message-ID: From: References: Cc: To:
 Subject: Sender; bh=tN/KCchgbZQfHxxDD/+zhjRj7E2mjeMd2UuL8i3v9A0=; b=puQWPhQC443thSfAcjM06owcGYw1/5HuyMnrWjxQ+2VMTic47VLiOGl0OKD6VLc3rH1zU6PY
 Dv05fexQE2mwYGetLyL723WLAxMPNmI5ICtgkTnG3h1clIqfLgm+wgvv0Jvy5Bv5dML3AfN5
 1dDe9kQHW9XrvCw4oDyu9hFYHfI=
X-Mailgun-Sending-Ip: 104.130.122.25
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171])
 by mxa.mailgun.org with ESMTP id 5df9fb71.7f18d1439bc8-smtp-out-n03;
 Wed, 18 Dec 2019 10:12:01 -0000 (UTC)
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 8D754C433A2; Wed, 18 Dec 2019 10:12:00 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE,
        URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from [192.168.0.106] (unknown [106.51.28.102])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: rnayak)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id C0526C433CB;
        Wed, 18 Dec 2019 10:11:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org C0526C433CB
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=none smtp.mailfrom=rnayak@codeaurora.org
Subject: Re: [PATCH] arm64: dts: qcom: sc7180: Fix I2C/UART numbers 2, 4, 7,
 and 9
To:     Douglas Anderson <dianders@chromium.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     linus.walleij@linaro.org, mka@chromium.org,
        Stephen Boyd <swboyd@chromium.org>,
        linux-arm-msm@vger.kernel.org,
        Roja Rani Yarubandi <rojay@codeaurora.org>,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>
References: <20191217130352.1.Id8562de45e8441cac34699047e25e7424281e9d4@changeid>
From:   Rajendra Nayak <rnayak@codeaurora.org>
Message-ID: <15313fe9-87bc-c0f4-f97c-fd21a964471e@codeaurora.org>
Date:   Wed, 18 Dec 2019 15:41:48 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.1
MIME-Version: 1.0
In-Reply-To: <20191217130352.1.Id8562de45e8441cac34699047e25e7424281e9d4@changeid>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org


On 12/18/2019 2:34 AM, Douglas Anderson wrote:
> Commit f4a73f5e2633 ("pinctrl: qcom: sc7180: Add new qup functions")
> has landed which means that we absolutely need to use the proper names
> for the pinmuxing for I2C/UART numbers 2, 4, 7, and 9.  Let's do it.
> 
> For reference:
> - If you get only one of this commit and the pinctrl commit then none
>    of I2C/UART 2, 4, 7, and 9 will work.
> - If you get neither of these commits then I2C 2, 4, 7, and 9 will
>    work but not UART.
> 
> ...but despite the above it should be fine for this commit to land in
> the Qualcomm tree because sc7180.dtsi only exists there (it hasn't
> made it to mainline).
> 
> Fixes: ba3fc6496366 ("arm64: dts: sc7180: Add qupv3_0 and qupv3_1")
> Signed-off-by: Douglas Anderson <dianders@chromium.org>
> ---

Reviewed-by: Rajendra Nayak <rnayak@codeaurora.org>

> 
>   arch/arm64/boot/dts/qcom/sc7180.dtsi | 16 ++++++++--------
>   1 file changed, 8 insertions(+), 8 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sc7180.dtsi b/arch/arm64/boot/dts/qcom/sc7180.dtsi
> index 52a58615ec06..faa9ef733204 100644
> --- a/arch/arm64/boot/dts/qcom/sc7180.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sc7180.dtsi
> @@ -717,7 +717,7 @@ pinmux {
>   			qup_i2c2_default: qup-i2c2-default {
>   				pinmux {
>   					pins = "gpio15", "gpio16";
> -					function = "qup02";
> +					function = "qup02_i2c";
>   				};
>   			};
>   
> @@ -731,7 +731,7 @@ pinmux {
>   			qup_i2c4_default: qup-i2c4-default {
>   				pinmux {
>   					pins = "gpio115", "gpio116";
> -					function = "qup04";
> +					function = "qup04_i2c";
>   				};
>   			};
>   
> @@ -752,7 +752,7 @@ pinmux {
>   			qup_i2c7_default: qup-i2c7-default {
>   				pinmux {
>   					pins = "gpio6", "gpio7";
> -					function = "qup11";
> +					function = "qup11_i2c";
>   				};
>   			};
>   
> @@ -766,7 +766,7 @@ pinmux {
>   			qup_i2c9_default: qup-i2c9-default {
>   				pinmux {
>   					pins = "gpio46", "gpio47";
> -					function = "qup13";
> +					function = "qup13_i2c";
>   				};
>   			};
>   
> @@ -867,7 +867,7 @@ pinmux {
>   			qup_uart2_default: qup-uart2-default {
>   				pinmux {
>   					pins = "gpio15", "gpio16";
> -					function = "qup02";
> +					function = "qup02_uart";
>   				};
>   			};
>   
> @@ -882,7 +882,7 @@ pinmux {
>   			qup_uart4_default: qup-uart4-default {
>   				pinmux {
>   					pins = "gpio115", "gpio116";
> -					function = "qup04";
> +					function = "qup04_uart";
>   				};
>   			};
>   
> @@ -905,7 +905,7 @@ pinmux {
>   			qup_uart7_default: qup-uart7-default {
>   				pinmux {
>   					pins = "gpio6", "gpio7";
> -					function = "qup11";
> +					function = "qup11_uart";
>   				};
>   			};
>   
> @@ -919,7 +919,7 @@ pinmux {
>   			qup_uart9_default: qup-uart9-default {
>   				pinmux {
>   					pins = "gpio46", "gpio47";
> -					function = "qup13";
> +					function = "qup13_uart";
>   				};
>   			};
>   
> 

-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member
of Code Aurora Forum, hosted by The Linux Foundation
