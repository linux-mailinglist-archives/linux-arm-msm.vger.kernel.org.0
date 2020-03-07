Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E38BD17CAA2
	for <lists+linux-arm-msm@lfdr.de>; Sat,  7 Mar 2020 03:08:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726269AbgCGCIQ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 6 Mar 2020 21:08:16 -0500
Received: from mail-pg1-f195.google.com ([209.85.215.195]:43613 "EHLO
        mail-pg1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726240AbgCGCIQ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 6 Mar 2020 21:08:16 -0500
Received: by mail-pg1-f195.google.com with SMTP id u12so1902343pgb.10
        for <linux-arm-msm@vger.kernel.org>; Fri, 06 Mar 2020 18:08:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=pJwj/Wnf7G/OvgCEBiEPVfsfO5dnRSjL+78IGVllWvA=;
        b=CbcYPatlo5KtrEBdEeZLZ2kISiSSeiPEo63DuhLOaJPokrW/DjIgbLXWbCZFB1Insd
         s2Gs/rmV0bKANdbbhuDH29JNHwkroWv9MYiiCdAmbQm9A+oUCumnZ5OhKVXe2YeusGqd
         HEb3rDUWbQbzO7hR6hU0HxDxTg+uZbylFGEvK65Op0aZ7OUZ6r2h/Kx88jr2AGp8OcXA
         qo6o7dpDy+bn/yVA1u8iyyE5mHiPWwS8gi4gClT1VI2JAAcKtUwSD7FDlwCK1I9vKwnX
         P0hnprY4Fn6Od8ocNZid9eqhe9myEMJiLxwyKAhymQKFXuXJ6/hckIVsEKctzlCr6pEs
         O5bQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=pJwj/Wnf7G/OvgCEBiEPVfsfO5dnRSjL+78IGVllWvA=;
        b=ckH5mTDgdrXcQvQ1vbnkLpM1PLQIbjOc2hOIyP1AuGaByEvX7U327cocGeWJutrJOW
         n1a4GDWA1PintKGRw5/LLqxUlu8xvJAXWbdpT0+ujf/eC96erjJ60LP4jDzbSpdk8b5r
         kAMm1a1sjgFJspn02HoEGEGsI10t7KjSCmFMgffxi8FygyaLcAYY1yLmgDssqbF0dXrn
         K0EnD7yl5ozTXkLIcE4DLVEtbpygQAWfXq4MxX6WkeYZp4AVMTwJs/S84SEYfSnmJbFX
         0DDtRH0gdi5WMho006nUkpUDFmSpcIHdqc8UquvfhbDG48Of6iDqxsuiiCc+IlnpP6uM
         J1lw==
X-Gm-Message-State: ANhLgQ0kFSKMYEwOwePxApDQLyWvIDso9ZwO6b/sGahBc2+IXBaQ4fWh
        XsKRZRLIQQMpzPe0qmAGdnL3qA==
X-Google-Smtp-Source: ADFU+vvA2h8bX3Z1LeV1VGB0CV8xcJ+Fz38FSgT0NnRzTPebWSsqnV7j5ZBY+mGXAWvdJ48CxDAYbA==
X-Received: by 2002:a63:5546:: with SMTP id f6mr6119694pgm.260.1583546893317;
        Fri, 06 Mar 2020 18:08:13 -0800 (PST)
Received: from builder (104-188-17-28.lightspeed.sndgca.sbcglobal.net. [104.188.17.28])
        by smtp.gmail.com with ESMTPSA id k24sm2071894pfg.27.2020.03.06.18.08.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Mar 2020 18:08:12 -0800 (PST)
Date:   Fri, 6 Mar 2020 18:08:10 -0800
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Loic Poulain <loic.poulain@linaro.org>
Cc:     wsa@the-dreams.de, vkoul@kernel.org, robert.foss@linaro.org,
        linux-i2c@vger.kernel.org, linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH v4 3/3] arm64: dts: msm8916: Add CCI node
Message-ID: <20200307020810.GB1094083@builder>
References: <1583515184-9636-1-git-send-email-loic.poulain@linaro.org>
 <1583515184-9636-3-git-send-email-loic.poulain@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1583515184-9636-3-git-send-email-loic.poulain@linaro.org>
User-Agent: Mutt/1.12.2 (2019-09-21)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Fri 06 Mar 09:19 PST 2020, Loic Poulain wrote:

> The msm8916 CCI controller provides one CCI/I2C bus.
> 
> Signed-off-by: Loic Poulain <loic.poulain@linaro.org>
> Reviewed-by: Robert Foss <robert.foss@linaro.org>
> ---
>  v2: add this patch in the series
>  v3: add only cci node for now
>  v4: no change
> 
>  arch/arm64/boot/dts/qcom/msm8916.dtsi | 27 +++++++++++++++++++++++++++
>  1 file changed, 27 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/msm8916.dtsi b/arch/arm64/boot/dts/qcom/msm8916.dtsi
> index 8686e10..985cb5f 100644
> --- a/arch/arm64/boot/dts/qcom/msm8916.dtsi
> +++ b/arch/arm64/boot/dts/qcom/msm8916.dtsi
> @@ -1451,6 +1451,33 @@
>  			};
>  		};
>  
> +		cci@1b0c000 {

Given that this node is status disabled, we should have a label on it so
that we can enable it.

Apart from that,

Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>

Regards,
Bjorn

> +			compatible = "qcom,msm8916-cci";
> +			#address-cells = <1>;
> +			#size-cells = <0>;
> +			reg = <0x1b0c000 0x1000>;
> +			interrupts = <GIC_SPI 50 IRQ_TYPE_EDGE_RISING>;
> +			clocks = <&gcc GCC_CAMSS_TOP_AHB_CLK>,
> +				<&gcc GCC_CAMSS_CCI_AHB_CLK>,
> +				<&gcc GCC_CAMSS_CCI_CLK>,
> +				<&gcc GCC_CAMSS_AHB_CLK>;
> +			clock-names = "camss_top_ahb", "cci_ahb",
> +				      "cci", "camss_ahb";
> +			assigned-clocks = <&gcc GCC_CAMSS_CCI_AHB_CLK>,
> +					  <&gcc GCC_CAMSS_CCI_CLK>;
> +			assigned-clock-rates = <80000000>, <19200000>;
> +			pinctrl-names = "default";
> +			pinctrl-0 = <&cci0_default>;
> +			status = "disabled";
> +
> +			cci0: i2c-bus@0 {
> +				reg = <0>;
> +				clock-frequency = <400000>;
> +				#address-cells = <1>;
> +				#size-cells = <0>;
> +			};
> +		};
> +
>  		camss: camss@1b00000 {
>  			compatible = "qcom,msm8916-camss";
>  			reg = <0x1b0ac00 0x200>,
> -- 
> 2.7.4
> 
