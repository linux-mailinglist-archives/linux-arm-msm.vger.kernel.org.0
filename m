Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 364BE182826
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 Mar 2020 06:13:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387777AbgCLFNr (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 12 Mar 2020 01:13:47 -0400
Received: from mail-pf1-f195.google.com ([209.85.210.195]:46642 "EHLO
        mail-pf1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2387776AbgCLFNr (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 12 Mar 2020 01:13:47 -0400
Received: by mail-pf1-f195.google.com with SMTP id c19so2625520pfo.13
        for <linux-arm-msm@vger.kernel.org>; Wed, 11 Mar 2020 22:13:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=YEKIsskQn0GOha6Hy8EBgBpGLBH3R0T+GMiZwuU+3NI=;
        b=RkKn03Z0khNvGV49vae7g0mCMeSWxWcrTOH0vwkME15R5jHgdvGaF1fzrWixZXNhpz
         z7vwuAvDxXAQloCjyaMKOoatk63BYedEcrEQJQYtQ9Qo0RJvlKNIT0BuY5BZGV9jWYdE
         tbUyOmKYr9Zu0BMQouUb52PToIvH+Vqp+mDQ9+QhsF1p5jCu2yo64Q4ChO1Th/IeARhz
         H+AZ89aT9iRKOYdENHRtp5gYS8eWXZ+RYREC9J+2K7+Y+mMKvVcwBYa+Rp70udtd7iTL
         zRSJyuvMLmgnjZXeGC/mLWu75UQXf3rsRgfgYCpSoUCI1T6u0AKc2vmPEpI5UsJ6esnw
         J2HA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=YEKIsskQn0GOha6Hy8EBgBpGLBH3R0T+GMiZwuU+3NI=;
        b=SV49tRuOPRkv+MfW8XFAfAPp6RAd+Q2K5g32jpYuITJyHEDw7EvjblNWbSORVWZVJJ
         wUwinEo8KpM6RpW4Ow0G2HsmjXlfcmGfGicY8tFpYkUKuAjOu26asN7NfJPPd2NgBpLy
         Kkc7uj5cT42mReY3GVbQtqPXKPTkJftSMZtxUBvtzGYSq3UYnCtK2BWTJJ5vM1fOzb9C
         vW5Zduh8o/rfKFfUEJM6ACOg8mOECvB3zcEHU4Z5YxczU8YbcOMlCZ/RBEzTshHy+T4E
         0VOE9hNKvm+eqy3h69nTonFq0zQwhob0FESrTKKsUDltklxjzADc8eWoHKTV8EAYfm/F
         4TXg==
X-Gm-Message-State: ANhLgQ0EgXrYxKdB+b1DGFeDG+v1IQp9x/ycxCmcLAosCNca7WMjOrW6
        fhvqKivArhB9oz+mb8iz1DGRrw==
X-Google-Smtp-Source: ADFU+vtsAgyF9WS4YpdSeSG4o+74qHpCCJl/4A+wZ5CxbopnXAb1FWsKpqQjANUoZkL+SbpxxBJSGQ==
X-Received: by 2002:a63:ae0a:: with SMTP id q10mr6013377pgf.178.1583990026329;
        Wed, 11 Mar 2020 22:13:46 -0700 (PDT)
Received: from yoga (104-188-17-28.lightspeed.sndgca.sbcglobal.net. [104.188.17.28])
        by smtp.gmail.com with ESMTPSA id a18sm136214pfr.109.2020.03.11.22.13.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Mar 2020 22:13:45 -0700 (PDT)
Date:   Wed, 11 Mar 2020 22:13:42 -0700
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Robert Foss <robert.foss@linaro.org>
Cc:     agross@kernel.org, robh+dt@kernel.org, mark.rutland@arm.com,
        catalin.marinas@arm.com, will@kernel.org, shawnguo@kernel.org,
        olof@lixom.net, Anson.Huang@nxp.com, maxime@cerno.tech,
        leonard.crestez@nxp.com, dinguyen@kernel.org,
        marcin.juszkiewicz@linaro.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        Loic Poulain <loic.poulain@linaro.org>
Subject: Re: [v1 4/6] arm64: dts: sdm845-db845c: Add pm_8998 gpio names
Message-ID: <20200312051342.GW264362@yoga>
References: <20200311123501.18202-1-robert.foss@linaro.org>
 <20200311123501.18202-5-robert.foss@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200311123501.18202-5-robert.foss@linaro.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Wed 11 Mar 05:34 PDT 2020, Robert Foss wrote:

> Add pm_8998 GPIO trace names. These names are defined in
> the 96boards db845c mezzanine schematic.
> 
> Signed-off-by: Robert Foss <robert.foss@linaro.org>
> ---
>  arch/arm64/boot/dts/qcom/sdm845-db845c.dts | 30 ++++++++++++++++++++++
>  1 file changed, 30 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sdm845-db845c.dts b/arch/arm64/boot/dts/qcom/sdm845-db845c.dts
> index a6b6837c3d68..e8c056d02ace 100644
> --- a/arch/arm64/boot/dts/qcom/sdm845-db845c.dts
> +++ b/arch/arm64/boot/dts/qcom/sdm845-db845c.dts
> @@ -584,6 +584,36 @@
>  	};
>  };
>  
> +&pm8998_gpio {

Please sort nodes alphabetically by label.

Regards,
Bjorn

> +	gpio-line-names =
> +		"NC",
> +		"NC",
> +		"WLAN_SW_CTRL",
> +		"NC",
> +		"PM_GPIO5_BLUE_BT_LED",
> +		"VOL_UP_N",
> +		"NC",
> +		"ADC_IN1",
> +		"PM_GPIO9_YEL_WIFI_LED",
> +		"CAM0_AVDD_EN",
> +		"NC",
> +		"CAM0_DVDD_EN",
> +		"PM_GPIO13_GREEN_U4_LED",
> +		"DIV_CLK2",
> +		"NC",
> +		"NC",
> +		"NC",
> +		"SMB_STAT",
> +		"NC",
> +		"NC",
> +		"ADC_IN2",
> +		"OPTION1",
> +		"WCSS_PWR_REQ",
> +		"PM845_GPIO24",
> +		"OPTION2",
> +		"PM845_SLB";
> +};
> +
>  &cci {
>  	status = "ok";
>  };
> -- 
> 2.20.1
> 
