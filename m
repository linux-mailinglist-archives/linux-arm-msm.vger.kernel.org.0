Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0635EDF666
	for <lists+linux-arm-msm@lfdr.de>; Mon, 21 Oct 2019 21:59:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730241AbfJUT6z (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 21 Oct 2019 15:58:55 -0400
Received: from mail-pl1-f193.google.com ([209.85.214.193]:35428 "EHLO
        mail-pl1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726672AbfJUT6z (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 21 Oct 2019 15:58:55 -0400
Received: by mail-pl1-f193.google.com with SMTP id c3so7163905plo.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 21 Oct 2019 12:58:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=+CCFRsoMPaJkoqe5k5+I+/ZrLfKKEMEyKEUasuYNxaQ=;
        b=kT1/p+MMrhsBvwcUfPwTBQBgvKHuiHmXXB+LEs4NjKg/7MeHbS1dZWU1VHrrrBWUd7
         jL+3mEy4VWq2r9aNm1UHRDbtThZZH1Wyn0PDEFnO1G0qHlzxCUFJwENMazXh3sILO+Z+
         J/qTXySlrWdgJh1As+PYBxo/ZwoA4M+HX8mMQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=+CCFRsoMPaJkoqe5k5+I+/ZrLfKKEMEyKEUasuYNxaQ=;
        b=Kak1YcfxVoQr6AiLCCKiIOPfB9M5wFkjLoGaDHlI1Kmkj1GNAY1BRIrhx8dtZTnIzB
         xVDlhqqHRraLqMRnMxT24Rle83jdQqTgTrLMgK+Snmohkv4ECwCXUCWr2x48zIgR3uNH
         c/1xIZqtVSeBLLXEWdCjD6qYwivHYS+2NM+xQjyoGPOvS36+SldHIFXuHt/rJSfU87sO
         vCxFr9RNDg7bNPgaIZAaZ8LLMRZ7E3oil6+Q6K5uwlJ7FbwixqWPfwQ0zdY204SkHT9G
         SjffP7TOJcKaGi7ZCNMYQyqufY5NjTExV2E4FgX0ZdJUlViRG0nnKi2RcmtsGlUElZ5h
         ZYRg==
X-Gm-Message-State: APjAAAU4qhnwo618neDP2pUi4oXnABDPr6QvRVGNpVCX1ZXFpWvm7wfo
        Yu9kmmnmwbX6wqkM59rLFXu8pg==
X-Google-Smtp-Source: APXvYqwMkHSCD+15IAY9SXUBSsGV8l9QCxy7M68CH32k3Ie458aX0cqEThbnHUh0u96e8qYaRA8FEA==
X-Received: by 2002:a17:902:bcca:: with SMTP id o10mr5762146pls.46.1571687934282;
        Mon, 21 Oct 2019 12:58:54 -0700 (PDT)
Received: from localhost ([2620:15c:202:1:4fff:7a6b:a335:8fde])
        by smtp.gmail.com with ESMTPSA id j128sm18164308pfg.51.2019.10.21.12.58.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 21 Oct 2019 12:58:52 -0700 (PDT)
Date:   Mon, 21 Oct 2019 12:58:51 -0700
From:   Matthias Kaehlcke <mka@chromium.org>
To:     Jeffrey Hugo <jeffrey.l.hugo@gmail.com>
Cc:     agross@kernel.org, bjorn.andersson@linaro.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] arm64: dts: qcom: msm8998: Fixup uart3 gpio config
 for bluetooth
Message-ID: <20191021195851.GG20212@google.com>
References: <20191021161921.31825-1-jeffrey.l.hugo@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20191021161921.31825-1-jeffrey.l.hugo@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Mon, Oct 21, 2019 at 09:19:21AM -0700, Jeffrey Hugo wrote:
> It turns out that the wcn3990 can float the gpio lines during bootup, etc
> which will result in the uart core thinking there is incoming data.  This
> results in the bluetooth stack getting garbage.  By applying a bias to
> match what wcn3990 would drive, the issue is corrected.
> 
> Signed-off-by: Jeffrey Hugo <jeffrey.l.hugo@gmail.com>
> ---
> 
> v2:
> -split out pinctrl config by pin
> 
>  .../boot/dts/qcom/msm8998-clamshell.dtsi      | 22 ++++++++++++++++
>  arch/arm64/boot/dts/qcom/msm8998-mtp.dtsi     | 22 ++++++++++++++++
>  arch/arm64/boot/dts/qcom/msm8998-pins.dtsi    | 25 ++++++++++++++++---
>  3 files changed, 65 insertions(+), 4 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/msm8998-clamshell.dtsi b/arch/arm64/boot/dts/qcom/msm8998-clamshell.dtsi
> index 38a1c2ba5e83..8c9a3e0f3843 100644
> --- a/arch/arm64/boot/dts/qcom/msm8998-clamshell.dtsi
> +++ b/arch/arm64/boot/dts/qcom/msm8998-clamshell.dtsi
> @@ -37,6 +37,28 @@
>  	};
>  };
>  
> +&blsp1_uart3_on {
> +	rx {
> +		/delete-property/ bias-disable;
> +		/*
> +		 * Configure a pull-up on 45 (RX). This is needed to
> +		 * avoid garbage data when the TX pin of the Bluetooth
> +		 * module is in tri-state (module powered off or not
> +		 * driving the signal yet).
> +		 */
> +		bias-pull-up;
> +	};
> +
> +	cts {
> +		/delete-property/ bias-disable;
> +		/*
> +		 * Configure a pull-down on 47 (CTS) to match the pull
> +		 * of the Bluetooth module.
> +		 */
> +		bias-pull-down;
> +	};
> +};
> +
>  &qusb2phy {
>  	status = "okay";
>  
> diff --git a/arch/arm64/boot/dts/qcom/msm8998-mtp.dtsi b/arch/arm64/boot/dts/qcom/msm8998-mtp.dtsi
> index 8adb4969baec..74c14f50b0f6 100644
> --- a/arch/arm64/boot/dts/qcom/msm8998-mtp.dtsi
> +++ b/arch/arm64/boot/dts/qcom/msm8998-mtp.dtsi
> @@ -37,6 +37,28 @@
>  	};
>  };
>  
> +&blsp1_uart3_on {
> +	rx {
> +		/delete-property/ bias-disable;
> +		/*
> +		 * Configure a pull-up on 45 (RX). This is needed to
> +		 * avoid garbage data when the TX pin of the Bluetooth
> +		 * module is in tri-state (module powered off or not
> +		 * driving the signal yet).
> +		 */
> +		bias-pull-up;
> +	};
> +
> +	cts {
> +		/delete-property/ bias-disable;
> +		/*
> +		 * Configure a pull-down on 47 (CTS) to match the pull
> +		 * of the Bluetooth module.
> +		 */
> +		bias-pull-down;
> +	};
> +};
> +
>  &blsp2_uart1 {
>  	status = "okay";
>  };
> diff --git a/arch/arm64/boot/dts/qcom/msm8998-pins.dtsi b/arch/arm64/boot/dts/qcom/msm8998-pins.dtsi
> index e32d3ab395ea..7c222cbf19d9 100644
> --- a/arch/arm64/boot/dts/qcom/msm8998-pins.dtsi
> +++ b/arch/arm64/boot/dts/qcom/msm8998-pins.dtsi
> @@ -77,13 +77,30 @@
>  	};
>  
>  	blsp1_uart3_on: blsp1_uart3_on {
> -		mux {
> -			pins = "gpio45", "gpio46", "gpio47", "gpio48";
> +		tx {
> +			pins = "gpio45";
>  			function = "blsp_uart3_a";
> +			drive-strength = <2>;

Should the drive-strength really be configured in the .dtsi
of the SoC? I think of it as a board specific property, since it
depends on what is on the other end of the UART.

> +			bias-disable;

This seems reasonable since the SoC drives the TX pin.

>  		};
>  
> -		config {
> -			pins = "gpio45", "gpio46", "gpio47", "gpio48";
> +		rx {
> +			pins = "gpio46";
> +			function = "blsp_uart3_a";
> +			drive-strength = <2>;

'drive-strength' shouldn't be needed for an input pin

> +			bias-disable;

In case of the input pins I'm not sure if this should/needs to be in
the .dtsi of the SoC. If it isn't really needed it would allow to
remove the '/delete-property/ bias-disable;' entries in the board
files.

> +		};
> +
> +		cts {
> +			pins = "gpio47";
> +			function = "blsp_uart3_a";
> +			drive-strength = <2>;

'drive-strength' shouldn't be needed for an input pin

> +			bias-disable;
> +		};
> +
> +		rfr {
> +			pins = "gpio48";
> +			function = "blsp_uart3_a";
>  			drive-strength = <2>;
>  			bias-disable;
>  		};
> -- 
> 2.17.1
> 
