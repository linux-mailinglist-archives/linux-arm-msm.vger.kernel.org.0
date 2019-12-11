Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7E37711A387
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Dec 2019 05:37:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726897AbfLKEh6 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 10 Dec 2019 23:37:58 -0500
Received: from a27-185.smtp-out.us-west-2.amazonses.com ([54.240.27.185]:46526
        "EHLO a27-185.smtp-out.us-west-2.amazonses.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726631AbfLKEh6 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 10 Dec 2019 23:37:58 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
        s=zsmsymrwgfyinv5wlfyidntwsjeeldzt; d=codeaurora.org; t=1576039077;
        h=Subject:To:Cc:References:From:Message-ID:Date:MIME-Version:In-Reply-To:Content-Type:Content-Transfer-Encoding;
        bh=TZs1q5iCCLqj3ymqIoenTw7yehpn45zKyXEbFODyeuA=;
        b=bRSo4UIzhLqXSQiMUpCL6p5TDJq4VaLEjlqUjqhTrPat0w1a8hd/HjmmGfBWw8u4
        Pr1gdX4xjYMoPb1veiIVBGPaLz0N2fKmR0qj9oM3rnqR9mxBwjyDj5NEx2KAuyVxefy
        aFxeH3M9MnND7dZ/qBe/KUV+SNQlvuD+N0yAihhM=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
        s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1576039077;
        h=Subject:To:Cc:References:From:Message-ID:Date:MIME-Version:In-Reply-To:Content-Type:Content-Transfer-Encoding:Feedback-ID;
        bh=TZs1q5iCCLqj3ymqIoenTw7yehpn45zKyXEbFODyeuA=;
        b=YE690hR21SN8LgNOB4LCfarF8BEAdo4jAcPMsllIF02VU62kqnd3gabsOUn1CZGl
        HSZ8SFd4NpQhUuSGYAJDytIa5baO1rlCQNWfWgEKOHHzUATjp6XF5ZVQX2OHCz9Ppra
        Os51dMIDt/qKt3czwgKaUGW1iOKUvilx8MCpF6zw=
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE
        autolearn=unavailable autolearn_force=no version=3.4.0
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 35A2EC447AC
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=none smtp.mailfrom=rnayak@codeaurora.org
Subject: Re: [PATCH 2/2] arm64: dts: sc7180: Add a comment to i2c7 about
 external pullup
To:     Douglas Anderson <dianders@chromium.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Andy Gross <agross@kernel.org>
Cc:     mka@chromium.org, Roja Rani Yarubandi <rojay@codeaurora.org>,
        Stephen Boyd <swboyd@chromium.org>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>
References: <20191210163530.1.I69a6c29e08924229d160b651769c84508a07b3c6@changeid>
 <20191210163530.2.I8d4cbb3d7ac5824f8e950c53038df8c27a512905@changeid>
From:   Rajendra Nayak <rnayak@codeaurora.org>
Message-ID: <0101016ef33fd5d9-8367442a-f863-4f64-9787-f49c716156e5-000000@us-west-2.amazonses.com>
Date:   Wed, 11 Dec 2019 04:37:57 +0000
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.1
MIME-Version: 1.0
In-Reply-To: <20191210163530.2.I8d4cbb3d7ac5824f8e950c53038df8c27a512905@changeid>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-SES-Outgoing: 2019.12.11-54.240.27.185
Feedback-ID: 1.us-west-2.CZuq2qbDmUIuT3qdvXlRHZZCpfZqZ4GtG9v3VKgRyF0=:AmazonSES
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org



On 12/11/2019 6:05 AM, Douglas Anderson wrote:
> Make i2c7 symmetric with the other i2c busses and comment that we have
> no internal pull because there is an external one.
> 
> Fixes: ba3fc6496366 ("arm64: dts: sc7180: Add qupv3_0 and qupv3_1")
> Signed-off-by: Douglas Anderson <dianders@chromium.org>
> ---

Reviewed-by: Rajendra Nayak <rnayak@codeaurora.org>

> 
>   arch/arm64/boot/dts/qcom/sc7180-idp.dts | 2 ++
>   1 file changed, 2 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sc7180-idp.dts b/arch/arm64/boot/dts/qcom/sc7180-idp.dts
> index 5eab3a282eba..05d30a56eca9 100644
> --- a/arch/arm64/boot/dts/qcom/sc7180-idp.dts
> +++ b/arch/arm64/boot/dts/qcom/sc7180-idp.dts
> @@ -311,6 +311,8 @@ &qup_i2c7_default {
>   	pinconf {
>   		pins = "gpio6", "gpio7";
>   		drive-strength = <2>;
> +
> +		/* Has external pullup */
>   		bias-disable;
>   	};
>   };
> 

-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member
of Code Aurora Forum, hosted by The Linux Foundation
