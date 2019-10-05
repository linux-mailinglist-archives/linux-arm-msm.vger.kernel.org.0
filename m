Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2A7D8CC792
	for <lists+linux-arm-msm@lfdr.de>; Sat,  5 Oct 2019 05:59:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726816AbfJED7g (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 4 Oct 2019 23:59:36 -0400
Received: from mail-pf1-f196.google.com ([209.85.210.196]:42498 "EHLO
        mail-pf1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726814AbfJED7g (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 4 Oct 2019 23:59:36 -0400
Received: by mail-pf1-f196.google.com with SMTP id q12so5052291pff.9
        for <linux-arm-msm@vger.kernel.org>; Fri, 04 Oct 2019 20:59:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=gpGqz6qLsuq0UsH1+84/WmkwPkrLAGN7fBYEexcSldM=;
        b=uK++wzGosptpGduXlSUxTUHmlRO1XWli+xCI7im3pB0zG8jAFV2/Qb2ASfjQpbv3OP
         hhX5dlNkKgV8w7EVNVVbAshg+Ep8TLo6MDHeflph1ILzI6HTyk+JVqxsCbrYeUUX8rbk
         p4VF5L7SGVWmZO3N1gNqRBw6n70jg8S7KhWjlxNLhz6LP1reXQGjaPvlyCdUk7kXZp8e
         cYc6XYG8mrLCun653UUFiHKWRnwj9SHtbbc2AzEwJ3UkHTVHssAS8uvTE73JqyByuyo0
         GDFYYaAHekIUKdVLufze88m8V5f4+FKVbOXyEALvi2EGhyOlnKXBaTDYVsZPXezylaOO
         165Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=gpGqz6qLsuq0UsH1+84/WmkwPkrLAGN7fBYEexcSldM=;
        b=cOdTClRHnAftkul+oSnGrz8gvtRJbttrPpKMBGM7oBPldZc7gINXPFHS9CWAyM57U3
         pDKY5m9VsWSQ8TiytM2VUS+bZgbMzmQ2LqUQwkhTgT28Tcmz23boWCt1rl92wOENzZky
         L4UxgswQ7MzG9Zyq6dCepQO2ftiCZjjMwiaNeQcbNQId5Ur2GVlyuhiwcqUieiRap6nC
         DHCKKOsRLxBLFTzbJtbVgTbu3vRFfZpHL3Zk3urMhyWyVIssT9/qYrxYO77Z5DRBEuxR
         2zW5Q05fIxpRwxRqoGJBzuBQ01kdYFGx33nfjyeTawL28WLAX5WM5QymeuOyekJK4zNF
         dR6g==
X-Gm-Message-State: APjAAAUBR4Vah+IqHNnobe6zd44LiTgS+leyQ8nYv93WmzQ+ujJHjli1
        0S5d+qWQnkZ7X+ZUSR0lBGXnKg==
X-Google-Smtp-Source: APXvYqxupw1jvo2pAKkclaXYZJvV74UNrF9j5Q4wH5Pb4D0Yq8va+heTNSZw6zDzEa07ocHUbUr/pA==
X-Received: by 2002:aa7:9216:: with SMTP id 22mr21381031pfo.214.1570247974353;
        Fri, 04 Oct 2019 20:59:34 -0700 (PDT)
Received: from tuxbook-pro (104-188-17-28.lightspeed.sndgca.sbcglobal.net. [104.188.17.28])
        by smtp.gmail.com with ESMTPSA id f15sm7808398pfd.141.2019.10.04.20.59.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Oct 2019 20:59:33 -0700 (PDT)
Date:   Fri, 4 Oct 2019 20:59:31 -0700
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     kholk11@gmail.com
Cc:     linux-arm-msm@vger.kernel.org, marijns95@gmail.com,
        agross@kernel.org, mturquette@baylibre.com, sboyd@kernel.org,
        robh+dt@kernel.org, mark.rutland@arm.com, linus.walleij@linaro.org,
        linux-clk@vger.kernel.org, linux-gpio@vger.kernel.org
Subject: Re: [PATCH 1/5] pinctrl: qcom: Add a pinctrl driver for MSM8976 and
 8956
Message-ID: <20191005035931.GC2999@tuxbook-pro>
References: <20190921101207.65042-1-kholk11@gmail.com>
 <20190921101207.65042-2-kholk11@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190921101207.65042-2-kholk11@gmail.com>
User-Agent: Mutt/1.12.1 (2019-06-15)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Sat 21 Sep 03:12 PDT 2019, kholk11@gmail.com wrote:

> From: "Angelo G. Del Regno" <kholk11@gmail.com>
> 
> Add the pinctrl driver to support pin configuration with the
> pinctrl framework on MSM8976, MSM8956, APQ8056, APQ8076.
> 
> Signed-off-by: Angelo G. Del Regno <kholk11@gmail.com>
> ---
>  .../bindings/pinctrl/qcom,msm8976-pinctrl.txt |  183 +++
>  drivers/pinctrl/qcom/Kconfig                  |   10 +
>  drivers/pinctrl/qcom/Makefile                 |    1 +
>  drivers/pinctrl/qcom/pinctrl-msm8976.c        | 1128 +++++++++++++++++
>  4 files changed, 1322 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/pinctrl/qcom,msm8976-pinctrl.txt
>  create mode 100644 drivers/pinctrl/qcom/pinctrl-msm8976.c
> 
> diff --git a/Documentation/devicetree/bindings/pinctrl/qcom,msm8976-pinctrl.txt b/Documentation/devicetree/bindings/pinctrl/qcom,msm8976-pinctrl.txt
> new file mode 100644
> index 000000000000..4e944f84b7d7
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/pinctrl/qcom,msm8976-pinctrl.txt
> @@ -0,0 +1,183 @@
> +Qualcomm MSM8976 TLMM block

As Linus indicated, please send your the DT bindings in separate
patches.

> +
[..]
> +Example:
> +
> +	tlmm: pinctrl@1000000 {
> +		compatible = "qcom,msm8976-pinctrl";
> +		reg = <0x1000000 0x300000>;
> +		interrupts = <0 208 0>;

<GIC_SPI 208 IRQ_TYPE_LEVEL_HIGH>

> +		gpio-controller;
> +		#gpio-cells = <2>;
> +		gpio-ranges = <&tlmm 0 0 145>;
> +		interrupt-controller;
> +		#interrupt-cells = <2>;
> +
> +		blsp1_uart2_active: blsp1_uart2_active {
> +			mux {
> +				pins = "gpio4", "gpio5", "gpio6", "gpio7";
> +				function = "blsp_uart2";
> +			};
> +
> +			config {
> +				pins = "gpio4", "gpio5", "gpio6", "gpio7";
> +				drive-strength = <2>;
> +				bias-disable;
> +			};
> +		};
> +	};
> diff --git a/drivers/pinctrl/qcom/Kconfig b/drivers/pinctrl/qcom/Kconfig
[..]
> +static struct platform_driver msm8976_pinctrl_driver = {
> +	.driver = {
> +		.name = "msm8976-pinctrl",
> +		.owner = THIS_MODULE,

No need to specify .onwer on platform_drivers anymore.


Apart from that, I think this patch looks good.

Regards,
Bjorn
