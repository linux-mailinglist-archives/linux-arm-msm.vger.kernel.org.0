Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6950039A38
	for <lists+linux-arm-msm@lfdr.de>; Sat,  8 Jun 2019 05:26:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730241AbfFHD0S (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 7 Jun 2019 23:26:18 -0400
Received: from mail-pf1-f195.google.com ([209.85.210.195]:39931 "EHLO
        mail-pf1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730056AbfFHD0S (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 7 Jun 2019 23:26:18 -0400
Received: by mail-pf1-f195.google.com with SMTP id j2so2205574pfe.6
        for <linux-arm-msm@vger.kernel.org>; Fri, 07 Jun 2019 20:26:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=85fGZyxeIESYVExgLJEz9zbguq3QsyqJkOP+evG9ReA=;
        b=jq1gW6sZNN9W+SZw8GIqmtfSCoc/FhohIUENUFTOmro4SJs00F/gjtrry7bYU3QGK/
         RzmFcbJ978ADB0K3ymaWhxsOYZN6XAiPsG2w4jkhk+kSSNh0D6ewYD581T+ZLHmh1Jbn
         uHfjB5qGiRmr9/xjonUtDPMDWXlsLlQ2hhNKVIE9/NXcF825nnv6hnBLjgJX7HlXWc5G
         t0RVTpcQsfe1liymwWfcbFzVnjI46JhcZxKFOVqqAOcXN4fJMHLvWXwlKRS0Tb36vWnH
         NVA6r++ey7swlBljZo4T7+NSK28k9zJeLH8kCd356ZGymiO+wHbjNfzL08TWwowERqUy
         VHAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=85fGZyxeIESYVExgLJEz9zbguq3QsyqJkOP+evG9ReA=;
        b=oTtVSH7y5EdWE4TjmuIPOOqJIvMOgokkxj2F/0Uuu5B8GmdYYwzhlD8YoZ1yG7K/7e
         ktC8TedwM3QkMB4TiyrSX8FCq3pSXsM2hcAeWMCsIDWU8wET/rlxu8e7WcaSJmQm3sur
         3nLWdun8t3qydKR6YcU/wgUAhTefQ0DNPBjRqY4gg0l/hw+B9IQ2lmLUEAZMt32rBVpZ
         lA95T7FY8jOrgt0lNFqFO1ieMe15X/M4c5ON5yY3HT8CZBvwgkpmwoEvWHKhLTst+hmc
         WKwzUtb3kIg4dNUscHv9CuHDOuUue4wC2zN4DqvggknYqwqbpWoHtc2PdOEOsGoqfZgU
         uhJg==
X-Gm-Message-State: APjAAAXZf+c1g6ZjRWCObmMbUHG4rCx9eylQ0bf5+FRneAuBnxSCncbl
        mUKMs0A3e9r9e/fAzzqvONnnvw==
X-Google-Smtp-Source: APXvYqxE0z2KpZOn+l9dr6k9neNYGoDZ2dl92CSG/dDZ8h4Ozz7buZcUC4AmV1m+V8ZqSGKMWx2LPg==
X-Received: by 2002:a63:490b:: with SMTP id w11mr4312263pga.127.1559964377447;
        Fri, 07 Jun 2019 20:26:17 -0700 (PDT)
Received: from builder (104-188-17-28.lightspeed.sndgca.sbcglobal.net. [104.188.17.28])
        by smtp.gmail.com with ESMTPSA id 124sm430653pfd.63.2019.06.07.20.26.15
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 07 Jun 2019 20:26:16 -0700 (PDT)
Date:   Fri, 7 Jun 2019 20:26:13 -0700
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Sricharan R <sricharan@codeaurora.org>
Cc:     robh+dt@kernel.org, sboyd@codeaurora.org, linus.walleij@linaro.org,
        agross@kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-gpio@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 1/6] pinctrl: qcom: Add ipq6018 pinctrl driver
Message-ID: <20190608032613.GC24059@builder>
References: <1559754961-26783-1-git-send-email-sricharan@codeaurora.org>
 <1559754961-26783-2-git-send-email-sricharan@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1559754961-26783-2-git-send-email-sricharan@codeaurora.org>
User-Agent: Mutt/1.10.0 (2018-05-17)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Wed 05 Jun 10:15 PDT 2019, Sricharan R wrote:

> Add initial pinctrl driver to support pin configuration with
> pinctrl framework for ipq6018.
> 
> Signed-off-by: Sricharan R <sricharan@codeaurora.org>
> Signed-off-by: Rajkumar Ayyasamy <arajkuma@codeaurora.org>
> Signed-off-by: speriaka <speriaka@codeaurora.org>

These should start with the author, then followed by each person that
handled the patch on its way to the list - so your name should probably
be last.  If you have more than one author add Co-developed-by, in
addition to the Signed-off-by.

And please spell our speriaka's first and last name.

[..]
> diff --git a/Documentation/devicetree/bindings/pinctrl/qcom,ipq6018-pinctrl.txt b/Documentation/devicetree/bindings/pinctrl/qcom,ipq6018-pinctrl.txt
[..]
> +- #gpio-cells:
> +	Usage: required
> +	Value type: <u32>
> +	Definition: must be 2. Specifying the pin number and flags, as defined
> +		    in <dt-bindings/gpio/gpio.h>

You're missing the required "gpio-ranges" property.

> +
[..]
> +- function:
> +	Usage: required
> +	Value type: <string>
> +	Definition: Specify the alternative function to be configured for the
> +		    specified pins. Functions are only valid for gpio pins.
> +		    Valid values are:
> +	adsp_ext, alsp_int, atest_bbrx0, atest_bbrx1, atest_char, atest_char0,

Please indent these.

[..]

The rest should be in a separate patch from the binding.

> diff --git a/drivers/pinctrl/qcom/Kconfig b/drivers/pinctrl/qcom/Kconfig
[..]
> +enum ipq6018_functions {
[..]
> +	msm_mux_NA,

I like when these are sorted, and if you make the last entry msm_mux__
the msm_pingroup array becomes easier to read.

> +};
[..]
> +static const struct msm_function ipq6018_functions[] = {
[..]
> +	FUNCTION(gcc_tlmm),

As above, please sort these.

> +};
> +
> +static const struct msm_pingroup ipq6018_groups[] = {
> +	PINGROUP(0, qpic_pad, wci20, qdss_traceclk_b, NA, burn0, NA, NA, NA,
> +		 NA),

Please ignore the 80-char and skip the line breaks.

> +	PINGROUP(1, qpic_pad, mac12, qdss_tracectl_b, NA, burn1, NA, NA, NA,
> +		 NA),
> +	PINGROUP(2, qpic_pad, wci20, qdss_tracedata_b, NA, NA, NA, NA, NA, NA),
> +	PINGROUP(3, qpic_pad, mac01, qdss_tracedata_b, NA, NA, NA, NA, NA, NA),
> +	PINGROUP(4, qpic_pad, mac01, qdss_tracedata_b, NA, NA, NA, NA, NA, NA),
> +	PINGROUP(5, qpic_pad4, mac21, qdss_tracedata_b, NA, NA, NA, NA, NA, NA),

Is there a reason to keep qpic_padN as separate functions from qpic_pad?

[..]
> +static struct platform_driver ipq6018_pinctrl_driver = {
> +	.driver = {
> +		.name = "ipq6018-pinctrl",
> +		.owner = THIS_MODULE,

.owner is populated automagically by platform_driver_register, so please
omit this.

> +		.of_match_table = ipq6018_pinctrl_of_match,
> +	},
> +	.probe = ipq6018_pinctrl_probe,
> +	.remove = msm_pinctrl_remove,
> +};

Regards,
Bjorn
