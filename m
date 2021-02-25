Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 99DD332575F
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Feb 2021 21:14:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233251AbhBYUOe (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 25 Feb 2021 15:14:34 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43002 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231974AbhBYUOb (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 25 Feb 2021 15:14:31 -0500
Received: from mail-pj1-x1029.google.com (mail-pj1-x1029.google.com [IPv6:2607:f8b0:4864:20::1029])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6BF59C06174A
        for <linux-arm-msm@vger.kernel.org>; Thu, 25 Feb 2021 12:13:51 -0800 (PST)
Received: by mail-pj1-x1029.google.com with SMTP id s23so4247316pji.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 25 Feb 2021 12:13:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=nG+Je6ByEVPOO/bLpwPX3QVU1UNS3MoPZtywT4C/doM=;
        b=cLOzkTVy2jxDbm9nJN91KcIrWUdgxF0xuBhDJ5ySeJluVIyJjw5Ykc36vOfvhcyglo
         CV19lwZM3N8pKeLuLjz1DMo31d9vDMDzKSz8F4nx3v/1KT91PgGw4KRK0SLK4tmwVOP7
         R4ou6dTXOy/aLHTNlLsgWbygeeFHYlZFWaa/Q=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=nG+Je6ByEVPOO/bLpwPX3QVU1UNS3MoPZtywT4C/doM=;
        b=rpG2qc7qK714MY3c126Gsqapn7pzYekfDTTQfmMKdq1rS9raAFWiAxzpvPAwe3CjXu
         ovnGl3FsyCMrUTKvEJXliAwihlF269x/yux3Wf1OqMt0CsMZNV1539E3V/GbNilVZSxY
         DseQ1ryVDbAuFGJlgI/+pnYFGfn8G3xjCkTmjn7Z7dI3X2Stb1QXS/Lpn+QcuoVrzoAG
         Sc8aPX2sOn7VXUbSboOsXB6saoETKUXeamnD4/0m85hFWRVaT1aSSKS0Mfio/W04QUIu
         z78uSVduYrvVNnH2NXGphiChOWEGpOaQgI5zq+Y6crmUVwXLHEUfFEQ5yE7+Fw552dEg
         XS7A==
X-Gm-Message-State: AOAM533K+212tMBl/kj9s5CHealNpqiSFYL7xIvr8u+L7W7aMdkYc6an
        OsWmhoXcAV7LcmSMF2JgYEdeFg==
X-Google-Smtp-Source: ABdhPJzbTeh0e05VOvmXoSmTjAy0aL6OkuncOiPckuNxYHKPjIaufJVQ26CfYmpNmbisQZqS7JxmcA==
X-Received: by 2002:a17:902:c211:b029:e3:88d6:3e0c with SMTP id 17-20020a170902c211b02900e388d63e0cmr4534784pll.68.1614284030943;
        Thu, 25 Feb 2021 12:13:50 -0800 (PST)
Received: from localhost ([2620:15c:202:1:1d8:8d0c:f75e:edd8])
        by smtp.gmail.com with UTF8SMTPSA id u22sm7081813pgh.20.2021.02.25.12.13.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 25 Feb 2021 12:13:50 -0800 (PST)
Date:   Thu, 25 Feb 2021 12:13:49 -0800
From:   Matthias Kaehlcke <mka@chromium.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>
Cc:     devicetree@vger.kernel.org,
        Douglas Anderson <dianders@chromium.org>,
        linux-arm-msm@vger.kernel.org, Stephen Boyd <swboyd@chromium.org>,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/4] arm64: dts: qcom: sc7180: Disable charger thermal
 for lazor
Message-ID: <YDgE/b2/IBkCdVml@google.com>
References: <20210225103330.v2.1.I6a426324db3d98d6cfae8adf2598831bb30bba74@changeid>
 <20210225103330.v2.2.Ia4c1022191d09fe8c56a16486b77796b83ffcae4@changeid>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20210225103330.v2.2.Ia4c1022191d09fe8c56a16486b77796b83ffcae4@changeid>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

> Subject: [PATCH v2 2/4] arm64: dts: qcom: sc7180: Disable charger thermal for lazor

Should be 'Disable charger thermal *zone* for lazor'

Maybe Bjorn can fix this when applying if no respin is needed.

On Thu, Feb 25, 2021 at 10:33:35AM -0800, Matthias Kaehlcke wrote:
> Lazor is stuffed with a 47k NTC as thermistor for the charger
> temperature which currently isn't supported by the PM6150 ADC
> driver. Disable the charger thermal zone to avoid the use of
> bogus temperature values.
> 
> Signed-off-by: Matthias Kaehlcke <mka@chromium.org>
> ---
> 
> Changes in v2:
> - disable the thermal zone instead of deleting the zone and ADC nodes
> - updated subject and commit message
> 
>  arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r0.dts | 9 +++++++++
>  arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r1.dts | 9 +++++++++
>  arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r3.dts | 9 +++++++++
>  3 files changed, 27 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r0.dts b/arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r0.dts
> index 30e3e769d2b4..5c997cd90069 100644
> --- a/arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r0.dts
> +++ b/arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r0.dts
> @@ -14,6 +14,15 @@ / {
>  	compatible = "google,lazor-rev0", "qcom,sc7180";
>  };
>  
> +/*
> + * Lazor is stuffed with a 47k NTC as charger thermistor which currently is
> + * not supported by the PM6150 ADC driver. Disable the charger thermal zone
> + * to avoid using bogus temperature values.
> + */
> +&charger_thermal {
> +	status = "disabled";
> +};
> +
>  &pp3300_hub {
>  	/* pp3300_l7c is used to power the USB hub */
>  	/delete-property/regulator-always-on;
> diff --git a/arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r1.dts b/arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r1.dts
> index c2ef06367baf..d9fbcc7bc5bd 100644
> --- a/arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r1.dts
> +++ b/arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r1.dts
> @@ -14,6 +14,15 @@ / {
>  	compatible = "google,lazor-rev1", "google,lazor-rev2", "qcom,sc7180";
>  };
>  
> +/*
> + * Lazor is stuffed with a 47k NTC as charger thermistor which currently is
> + * not supported by the PM6150 ADC driver. Disable the charger thermal zone
> + * to avoid using bogus temperature values.
> + */
> +&charger_thermal {
> +	status = "disabled";
> +};
> +
>  &pp3300_hub {
>  	/* pp3300_l7c is used to power the USB hub */
>  	/delete-property/regulator-always-on;
> diff --git a/arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r3.dts b/arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r3.dts
> index 1b9d2f46359e..19e69adb9e04 100644
> --- a/arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r3.dts
> +++ b/arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r3.dts
> @@ -13,3 +13,12 @@ / {
>  	model = "Google Lazor (rev3+)";
>  	compatible = "google,lazor", "qcom,sc7180";
>  };
> +
> +/*
> + * Lazor is stuffed with a 47k NTC as charger thermistor which currently is
> + * not supported by the PM6150 ADC driver. Disable the charger thermal zone
> + * to avoid using bogus temperature values.
> + */
> +&charger_thermal {
> +	status = "disabled";
> +};
> -- 
> 2.30.0.617.g56c4b15f3c-goog
> 
