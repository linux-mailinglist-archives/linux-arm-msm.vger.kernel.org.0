Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7A9DE4431D
	for <lists+linux-arm-msm@lfdr.de>; Thu, 13 Jun 2019 18:30:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2392248AbfFMQ1Y (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 13 Jun 2019 12:27:24 -0400
Received: from mail-pg1-f194.google.com ([209.85.215.194]:37371 "EHLO
        mail-pg1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731247AbfFMQ1X (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 13 Jun 2019 12:27:23 -0400
Received: by mail-pg1-f194.google.com with SMTP id 20so11255158pgr.4
        for <linux-arm-msm@vger.kernel.org>; Thu, 13 Jun 2019 09:27:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=NQYmrsj8AV8YnHDvnoL6Jmy1MveO6P7UOtTrAk+FJtU=;
        b=yO4AmIaXQ8jEDYvjnej2dizXFrABw/5GGic1bFmoCeLgMiI21RZvXx8ybc6Yc1x0kH
         R/w7rB32UJXmBPWuD/ePCmZqrMSllW+M3Rbb4bYj2kXpZ2cNM/bBS31JWdnOrtEBQmqL
         OPpidHLu9chK2Nn+dvm7uxt+6bMt0vCNo9Qi2kFC1aHi8ito1HhRIxadHhoSMmmyCixT
         B++lIaPsd/25L5g476hjPOQ8QzZ7rVomy7sLdRoPFxHretlJCDAw93t4AGvzFpyVlbPm
         iqLwX4dw2ri+6Ke71NESPos5yxr5a0cBsm8U+6ZLFIw00Uk7K7wl+vEwmvUE1dgXVWgk
         hPnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=NQYmrsj8AV8YnHDvnoL6Jmy1MveO6P7UOtTrAk+FJtU=;
        b=tOHWUfcxfO3dCCDI+KZavR13of9T0JNuobYZTc0WU9jXgHEN54ZWfrhWiaRZJxkMZW
         XbsxkZE8AoEnZqZOu8XBdu1lPApg4bh16MPlLb5IhBTYNtqdeiZIQrYH9NWvBh8XJZeA
         bCWQhpIkinJ7StsGxEN6lwzadH3Ts/DBoBVuwB9vTRJ5HzJ44XFD6hq2c1ZI9my/gT45
         0KtfDYULOvpokcOXtkOAhhWKKohKwZGyvpGhK95n3/ij9A27K2TOYYswD96RdJH4xk7/
         /GimCqcq8IMrifwRtizyQmLJnFUfzs4EQLLFPuBEln0WnU4uiPy+K3VT49S0VqO2effz
         bx1g==
X-Gm-Message-State: APjAAAWoPHQ6/G6wlMOAbMLV6hDPk7UHsCRh8PgA5ATjPi3U6HcK4qx9
        pm4oRZsZODRca+E+TOdmxLe+8g==
X-Google-Smtp-Source: APXvYqw8DeauGhoNniVQo5Lh9Z6MXZPPOfZzOmYWbhqYprUiFfiahgtcd/MXXKZMwhaITFMWodIx/w==
X-Received: by 2002:a63:1d4:: with SMTP id 203mr5741866pgb.420.1560443242458;
        Thu, 13 Jun 2019 09:27:22 -0700 (PDT)
Received: from tuxbook-pro (104-188-17-28.lightspeed.sndgca.sbcglobal.net. [104.188.17.28])
        by smtp.gmail.com with ESMTPSA id i3sm124689pfa.175.2019.06.13.09.27.21
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Thu, 13 Jun 2019 09:27:21 -0700 (PDT)
Date:   Thu, 13 Jun 2019 09:28:08 -0700
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Nisha Kumari <nishakumari@codeaurora.org>
Cc:     broonie@kernel.org, robh+dt@kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        agross@kernel.org, lgirdwood@gmail.com, mark.rutland@arm.com,
        david.brown@linaro.org, linux-kernel@vger.kernel.org,
        kgunda@codeaurora.org, rnayak@codeaurora.org
Subject: Re: [PATCH 1/4] dt-bindings: regulator: Add labibb regulator
Message-ID: <20190613162808.GG22737@tuxbook-pro>
References: <1560337252-27193-1-git-send-email-nishakumari@codeaurora.org>
 <1560337252-27193-2-git-send-email-nishakumari@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1560337252-27193-2-git-send-email-nishakumari@codeaurora.org>
User-Agent: Mutt/1.11.4 (2019-03-13)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Wed 12 Jun 04:00 PDT 2019, Nisha Kumari wrote:

> Adding the devicetree binding for labibb regulator.
> 
> Signed-off-by: Nisha Kumari <nishakumari@codeaurora.org>
> ---
>  .../bindings/regulator/qcom-labibb-regulator.txt   | 57 ++++++++++++++++++++++
>  1 file changed, 57 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/regulator/qcom-labibb-regulator.txt
> 
> diff --git a/Documentation/devicetree/bindings/regulator/qcom-labibb-regulator.txt b/Documentation/devicetree/bindings/regulator/qcom-labibb-regulator.txt
> new file mode 100644
> index 0000000..79aad6f4
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/regulator/qcom-labibb-regulator.txt
> @@ -0,0 +1,57 @@
> +Qualcomm's LAB(LCD AMOLED Boost)/IBB(Inverting Buck Boost) Regulator
> +
> +LAB can be used as a positive boost power supply and IBB can be used as a negative
> +boost power supply for display panels.
> +
> +Main node required properties:
> +
> +- compatible:			Must be:
> +				"qcom,lab-ibb-regulator"

In order to handle variations in future LABIBB implementations, make
this "qcom,pmi8998-lab-ibb";

> +- #address-cells:		Must be 1
> +- #size-cells:			Must be 0
> +
> +LAB subnode required properties:
> +
> +- reg:				Specifies the SPMI address and size for this peripheral.
> +- regulator-name:		A string used to describe the regulator.
> +- interrupts:			Specify the interrupts as per the interrupt
> +				encoding.
> +- interrupt-names:		Interrupt names to match up 1-to-1 with
> +				the interrupts specified in 'interrupts'
> +				property.
> +
> +IBB subnode required properties:
> +
> +- reg:				Specifies the SPMI address and size for this peripheral.
> +- regulator-name:		A string used to describe the regulator.
> +- interrupts:			Specify the interrupts as per the interrupt
> +				encoding.
> +- interrupt-names:		Interrupt names to match up 1-to-1 with
> +				the interrupts specified in 'interrupts'
> +				property.
> +
> +Example:
> +	pmi8998_lsid1: pmic@3 {
> +		qcom-labibb-regulator {

We typically want to use generic names here, but as the spmi regulator
binding suggest the use of "regulators" without a unit address that
wouldn't work.

But you can shorten this to either "labibb" or at least
"labibb-regulator".

> +			compatible = "qcom,lab-ibb-regulator";
> +			#address-cells = <1>;
> +			#size-cells = <0>;
> +
> +			lab_regulator: qcom,lab@de00 {

Don't use "qcom," in the node names.

> +				reg = <0xde00>;

Please follow the spmi-regulator and hide these in the driver.

> +				regulator-name = "lab_reg";

We know it's a regulator, so no need for _reg, which means that if you
drop "qcom," from the node name and use the node name as the default
regulator name you don't need this.

> +
> +				interrupts = <0x3 0xde 0x0 IRQ_TYPE_EDGE_RISING>;
> +				interrupt-names = "lab-sc-err";
> +			};
> +
> +			ibb_regulator: qcom,ibb@dc00 {
> +				reg = <0xdc00>;
> +				regulator-name = "ibb_reg";
> +
> +				interrupts = <0x3 0xdc 0x2 IRQ_TYPE_EDGE_RISING>;
> +				interrupt-names = "ibb-sc-err";
> +			};
> +
> +		};
> +	};

Regards,
Bjorn
