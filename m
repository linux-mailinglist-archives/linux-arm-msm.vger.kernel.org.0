Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 644A61D3809
	for <lists+linux-arm-msm@lfdr.de>; Thu, 14 May 2020 19:24:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726100AbgENRY5 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 14 May 2020 13:24:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34732 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726027AbgENRY5 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 14 May 2020 13:24:57 -0400
Received: from mail-pj1-x1043.google.com (mail-pj1-x1043.google.com [IPv6:2607:f8b0:4864:20::1043])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1C903C061A0E
        for <linux-arm-msm@vger.kernel.org>; Thu, 14 May 2020 10:24:57 -0700 (PDT)
Received: by mail-pj1-x1043.google.com with SMTP id a5so12811889pjh.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 14 May 2020 10:24:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=LHBsucMd2sTr3HvWbUbdv7RFH1xfljlHMp94He6hhIA=;
        b=jw3JoqZcR+JkpSIRFVF6bzCezMt2ET2v0lnfG4lEuwXpjsAC//cobs0yPbOlb/wEmD
         R2247f4DjnI796d5bBmtgO51BUOwEB/UIblYzqfETbfyf5kdcqSwulnO/KoXXQAs9Fht
         wMuwYjYO/UH8CxTVs5CRx8Hts6qyWazW4DdC6vYV5FqGxK7kG+ingJovqls06Hm9MhCX
         LXIpu0bhRm0+N7WLxcCPO+9oKzTwKWXNpgub58PgRUEE8z34W4Jp7XBIIdy1ssAb0Fjj
         unayclz4Cyu6FEkrJw1MTaxnj4IIRpNvBq/NIqtPjjT50QVB3rTiKDSRaKItdfkCDrrg
         N13A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=LHBsucMd2sTr3HvWbUbdv7RFH1xfljlHMp94He6hhIA=;
        b=FqM4zykE4A+gs9cAHmlbujEy09U0zx0qSnRQU6pLETassexY3nIjHr9YGBTJxzTpiN
         94NTfr3nfBWWz1QMIqZ5dKD+Xs/7LNQDEBQUCZ29sk4FNujh/L/n307LZAoiNoXQWIuj
         aQ7dV0R6wpQGQ2xEt8Ktezcz27yYFbcn1RdvjuArxvZaOuhPOd8opQ6Gk1ZzhBuWJFUw
         bhWO+jRiwjvnkpL6JlVdVxDrwX/+1erifqsB8lMMmWJN3am/7yy9J+A7aWVn0kqtc60N
         nfVtskTc6laBTjsXL7xaEVQY3wr8ZV3WC9R5Q5f1UIkf+KUitv1AEu4xHqacmiU65ss+
         uV5Q==
X-Gm-Message-State: AGi0PuYxZtF0/z7uPPzF8+ZyzvRUe6kA8uLT8EAoraU5kvjSF5oTkwFP
        yWAjregKXH0AaJ4pWLBm9uesIQ==
X-Google-Smtp-Source: APiQypJtsZHdqMh3QbEvlnEnAPVD9kLl8H9v3APnId1I2aEM7HIPo4p7CBOJ4YY+WlIh4C4yplr/PQ==
X-Received: by 2002:a17:90b:888:: with SMTP id bj8mr40059263pjb.91.1589477096443;
        Thu, 14 May 2020 10:24:56 -0700 (PDT)
Received: from builder.lan (104-188-17-28.lightspeed.sndgca.sbcglobal.net. [104.188.17.28])
        by smtp.gmail.com with ESMTPSA id e11sm2753242pfl.85.2020.05.14.10.24.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 May 2020 10:24:55 -0700 (PDT)
Date:   Thu, 14 May 2020 10:23:26 -0700
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     michael.srba@seznam.cz
Cc:     Andy Gross <agross@kernel.org>, Rob Herring <robh+dt@kernel.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht
Subject: Re: [PATCH] arm64: dts: qcom: msm8916-samsung-a3u: add nodes for
 display panel
Message-ID: <20200514172326.GC279327@builder.lan>
References: <20200514170129.10902-1-michael.srba@seznam.cz>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200514170129.10902-1-michael.srba@seznam.cz>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu 14 May 10:01 PDT 2020, michael.srba@seznam.cz wrote:

> From: Michael Srba <michael.srba@seznam.cz>
> 
> This patch wires up display support on Samsung Galaxy A3 2015.
> 
> Signed-off-by: Michael Srba <michael.srba@seznam.cz>
> 
> ---
>  .../qcom/msm8916-samsung-a2015-common.dtsi    | 44 +++++++++++++++
>  .../boot/dts/qcom/msm8916-samsung-a3u-eur.dts | 54 +++++++++++++++++++
>  2 files changed, 98 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/msm8916-samsung-a2015-common.dtsi b/arch/arm64/boot/dts/qcom/msm8916-samsung-a2015-common.dtsi
> index af812f76e8be..2a64aa269f52 100644
> --- a/arch/arm64/boot/dts/qcom/msm8916-samsung-a2015-common.dtsi
> +++ b/arch/arm64/boot/dts/qcom/msm8916-samsung-a2015-common.dtsi
> @@ -72,6 +72,24 @@ phy {
>  			};
>  		};
>  
> +		mdss@1a00000 {
> +			dsi@1a98000 {
> +				#address-cells = <1>;
> +				#size-cells = <0>;
> +
> +				vdda-supply = <&pm8916_l2>;
> +				vddio-supply = <&pm8916_l6>;
> +
> +				pinctrl-names = "default", "sleep";
> +				pinctrl-0 = <&mdss_default>;
> +				pinctrl-1 = <&mdss_sleep>;
> +			};
> +
> +			dsi-phy@1a98300 {
> +				vddio-supply = <&pm8916_l6>;
> +			};
> +		};
> +
>  		wcnss@a21b000 {
>  			status = "okay";
>  		};
> @@ -172,6 +190,32 @@ pinconf {
>  			bias-disable;
>  		};
>  	};
> +
> +	pmx-mdss {
> +		mdss_default: mdss-default {
> +			pinmux {
> +				function = "gpio";
> +				pins = "gpio25";
> +			};
> +			pinconf {
> +				pins = "gpio25";
> +				drive-strength = <8>;
> +				bias-disable;
> +			};
> +		};

Fyi, when you have a state with a single set of properties you don't
need the pinmux/pinconf level here, you can directly do:

		mdss_default: mdss-default {
			pins = "gpio25";
			function = "gpio";

			drive-strength = <8>;
			bias-disable;
		};


But this looks good, applied towards v5.8.

Regards,
Bjorn
