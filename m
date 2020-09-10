Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 85541265596
	for <lists+linux-arm-msm@lfdr.de>; Fri, 11 Sep 2020 01:45:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725290AbgIJXpw (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 10 Sep 2020 19:45:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58296 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725275AbgIJXps (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 10 Sep 2020 19:45:48 -0400
Received: from mail-qv1-xf43.google.com (mail-qv1-xf43.google.com [IPv6:2607:f8b0:4864:20::f43])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0F1EAC061573
        for <linux-arm-msm@vger.kernel.org>; Thu, 10 Sep 2020 16:45:48 -0700 (PDT)
Received: by mail-qv1-xf43.google.com with SMTP id h1so4258355qvo.9
        for <linux-arm-msm@vger.kernel.org>; Thu, 10 Sep 2020 16:45:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=1cv5j35BABg4q2f4/PUHEsEap0GTGj1LrVIdAlf5e5I=;
        b=qGkU2ngtRzd1MnDmFePrSWXuIuG33/CjbOW7gF6fH38AAZidSofTZ4SdeT0s5s4a/9
         bX1NKKOffNfkiv9lf5K8aeMoAfFO+NmlQ1ZcLxSs/U2QLdmuAFauBA9AeGFzx8a+ABR0
         Ze8wJG4i7ZztnJ53Zh2v2JxyEWHMAs1MVXfUzWspSNk0DdKyToJJMwtjPx92K5BJT02M
         D3gFxhIfQiQO8spmv6UqzaqU3cdZBCENZERhgLFy3snm7Ik12B64AT+gCrEekGA6rXLe
         jjAxLweP+D+wLZUJvLyiYhVpw2K10W0JHNjHuo2xPqdDOtbC8WLPCbeJ5ETd2C5mKwGB
         ylnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=1cv5j35BABg4q2f4/PUHEsEap0GTGj1LrVIdAlf5e5I=;
        b=eJ8NA2MoOxBzbQfVv0AhUFZVaPJx7KKUBRr7Y9Bowk5bowOlIDVoEj4t4ULFCtvj3P
         0cYkdecAx8E7j2IB2lqYcSGscT2kwkquy5GvG2e4rhJXL/D6l9NMfBka/Ft5lFZ/EXV9
         bDdmtgp5SpzRgPVTrmR360zyUQF9ruACDh6+Uw8Osp4YM3Vf5mQ6LUNt3JxejaBpnfXg
         nSAQmvMD77+KH9LLTv08e0bZ9Oos3fVhtezghdzX99Rfm+ONXrNDBeYcyalLwEAlg/PB
         Q2Y1MG502kkWvmlId3SSrjOS+3GidDu/mY2hHShkBO6/X6nMNTnuCIPtXxHr7e8/HxR2
         WA7Q==
X-Gm-Message-State: AOAM530oFO7gCE3Sb9DYfB8BzxVMK8NDfTL+CvqSu71/a20Lad+XbKyH
        eOOHKXvLfqLDrpnDRdrK5T4oSw==
X-Google-Smtp-Source: ABdhPJw8zaFnhCta+8BO94bH8EWlMXGJLBrw/PW+lcHMmANnFPR+jOwF9U7s/VpS5KmvZX1sAal6BA==
X-Received: by 2002:ad4:56a6:: with SMTP id bd6mr11148014qvb.22.1599781546904;
        Thu, 10 Sep 2020 16:45:46 -0700 (PDT)
Received: from uller (ec2-34-197-84-77.compute-1.amazonaws.com. [34.197.84.77])
        by smtp.gmail.com with ESMTPSA id g5sm332403qtx.43.2020.09.10.16.45.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Sep 2020 16:45:46 -0700 (PDT)
Date:   Thu, 10 Sep 2020 23:45:44 +0000
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     satya priya <skakit@codeaurora.org>
Cc:     Matthias Kaehlcke <mka@chromium.org>, gregkh@linuxfoundation.org,
        Andy Gross <agross@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, akashast@codeaurora.org,
        rojay@codeaurora.org, msavaliy@qti.qualcomm.com,
        dianders@chromium.org
Subject: Re: [PATCH V5 2/4] arm64: dts: qcom: sc7180: Add necessary pinctrl
 and interrupt config for BT UART
Message-ID: <20200910234544.GC472@uller>
References: <1599742438-16811-1-git-send-email-skakit@codeaurora.org>
 <1599742438-16811-3-git-send-email-skakit@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1599742438-16811-3-git-send-email-skakit@codeaurora.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu 10 Sep 12:53 UTC 2020, satya priya wrote:

> Add a suitable sleep configuration for uart3 to support Bluetooth wakeup.
> 
> If QUP function is selected in sleep state, UART RTS/RFR is pulled high
> during suspend and BT SoC not able to send wakeup bytes. So, configure
> GPIO mode in sleep state to keep it low during suspend.
> 

But patch 4 says that you change this behavior, is that patch really
needed if we switch the pins to GPIO, or if this patch really needed if
we merge patch 4?

Could it be that in lower power states we drop the power to the uart
block and rely on the PDC to wait for the BT chip to start sending the
wakeup bytes on the rx pin?


This commit will become the reference for all other platforms where we
enable the same functionality, so better document it properly.

> Signed-off-by: satya priya <skakit@codeaurora.org>
> Reviewed-by: Akash Asthana <akashast@codeaurora.org>
> ---
> Changes in V2:
>  - This patch adds sleep state for BT UART. Newly added in V2.
> 
> Changes in V3:
>  - Remove "output-high" for TX from both sleep and default states
>    as it is not required. Configure pull-up for TX in sleep state.
> 
> Changes in V4:
>  - As per Matthias's comment, removed drive-strength for sleep state
>    and fixed nit-pick.
> 
> Changes in V5:
>  - As per Matthias's comments, moved pinmux change for sleep state,
>    pinctrl and interrupt config to the board specific file.
> 
>  arch/arm64/boot/dts/qcom/sc7180-idp.dts | 48 +++++++++++++++++++++++++++++++++
>  1 file changed, 48 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sc7180-idp.dts b/arch/arm64/boot/dts/qcom/sc7180-idp.dts
> index 04888df..e529a41 100644
> --- a/arch/arm64/boot/dts/qcom/sc7180-idp.dts
> +++ b/arch/arm64/boot/dts/qcom/sc7180-idp.dts
> @@ -344,6 +344,10 @@
>  };
>  
>  &uart3 {
> +	pinctrl-names = "default", "sleep";
> +	pinctrl-1 = <&qup_uart3_sleep>;
> +	interrupts-extended = <&intc GIC_SPI 604 IRQ_TYPE_LEVEL_HIGH>,
> +				<&tlmm 41 IRQ_TYPE_EDGE_FALLING>;
>  	status = "okay";
>  
>  	bluetooth: wcn3990-bt {
> @@ -545,3 +549,47 @@
>  	};
>  };
>  
> +&tlmm {
> +	qup_uart3_sleep: qup-uart3-sleep {
> +		pinmux {
> +			pins = "gpio38", "gpio39",
> +			       "gpio40", "gpio41";
> +			function = "gpio";
> +		};
> +
> +		pinconf-cts {
> +			/*
> +			 * Configure a pull-down on CTS to match the pull of
> +			 * the Bluetooth module.
> +			 */
> +			pins = "gpio38";
> +			bias-pull-down;
> +		};
> +
> +		pinconf-rts {
> +			/*
> +			 * Configure pull-down on RTS to make sure that the BT SoC can
> +			 * wake up the system by sending wakeup bytes during suspend.

So "request to send" is active low and pulling it low will indicate to
the BT chip that it's allowed to wake us up by pulling rx low?

I would like this comment to really describe what's actually going on.

> +			 */
> +			 pins = "gpio39";
> +			 bias-pull-down;
> +		};
> +
> +		pinconf-tx {
> +			/* Configure pull-up on TX when it isn't actively driven */

Sure, but why? Wouldn't that be to prevent the BT chip from receiving
garbage while the SoC is asleep?

> +			pins = "gpio40";
> +			bias-pull-up;
> +		};
> +
> +		pinconf-rx {
> +			/*
> +			 * Configure a pull-up on RX. This is needed to avoid
> +			 * garbage data when the TX pin of the Bluetooth module is
> +			 * in tri-state (module powered off or not driving the
> +			 * signal yet).
> +			 */

It's nice to avoid "garbage data", but isn't the real reason that the
floating pin on the other side would cause spurious wakeups?

Regards,
Bjorn

> +			pins = "gpio41";
> +			bias-pull-up;
> +		};
> +	};
> +};
> -- 
> QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member 
> of Code Aurora Forum, hosted by The Linux Foundation
> 
