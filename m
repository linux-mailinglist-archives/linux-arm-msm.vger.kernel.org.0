Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1B95C39666F
	for <lists+linux-arm-msm@lfdr.de>; Mon, 31 May 2021 19:05:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234112AbhEaRH2 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 31 May 2021 13:07:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49188 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231903AbhEaRFJ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 31 May 2021 13:05:09 -0400
Received: from mail-ot1-x334.google.com (mail-ot1-x334.google.com [IPv6:2607:f8b0:4864:20::334])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CB806C068FBF
        for <linux-arm-msm@vger.kernel.org>; Mon, 31 May 2021 08:16:50 -0700 (PDT)
Received: by mail-ot1-x334.google.com with SMTP id h24-20020a9d64180000b029036edcf8f9a6so11390100otl.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 31 May 2021 08:16:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=eJ+dYMSuiwP1+9nN6hX9bLUsV2tE3Lu68y9sPFybEHo=;
        b=FBuH9Rsn1jK9JXcGAjt4pQtwU4I8YQY1NQlarypgBpZtskjQDIOvheGUUY6AFQsqVZ
         H1fpSHlDDPruTNjvMzwXMiioYIus/QZerzEoAqMjRZ3Lb5ymU1rGZTLhjxsHaiakboXJ
         6rtoohTQyZPnU0tD4PZOId/v/V396D46+mYtQ3sW7TubAsL6fCftGrzilcCpAz904BEO
         vvYbTazYT6oBjoxNjKPAo7lPV7HgEtqlaeih0R+BJlTIHwROqVT4PxKLkUNW1DEMbg42
         ARbtq/TP9RHm1YY6hF0YfE1k1Od+TOJDgwQKVLih74QziiSPp0G8v43a7DSy1zAlKNhY
         k8Yw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=eJ+dYMSuiwP1+9nN6hX9bLUsV2tE3Lu68y9sPFybEHo=;
        b=fwc6RtjAtxWc1uEeNziVYKX0irxrYu0g/K0CXNyiuHpbc5Fkz3e4PQkt8NRfDdLLhe
         +7ZbeZZBCC7UdTwK9soBtXCknkjcWKf013sGrtTwWZfCv+mFU40KReTuTwOThnuVCqtK
         tkznHXiVbOjiLCtERf/3wKDTgB662wfOG9UCcdWjn/YQdu/+BdEborMNi9uIm8aLLfWX
         2bsn6/hfrKaM8B8qeTr/7T/H9C1gWwCk4AQPZTv5/8KSY9xBl4norXNxzziYIZV+KA/U
         L9/Xct0SeyzZKaKRWS64a8PHE5mwcXoBux+tLxBp8nZn2P5wOZwVjOJ1ZPBWW2R44WQU
         0CcA==
X-Gm-Message-State: AOAM532XCN8016WYy3X+pit4tYTKtOyYLkf7za+ELCgIh7UakcygyH4i
        szw6QVoL2ZlE3bSfK6Pf/Qs7Yw==
X-Google-Smtp-Source: ABdhPJyGASUipnV6yOcgG/ZyPcO2IslIfjpRJlBl8OAgkcD4GJf/OyADC3dnUHK1WQyRdz/HaCTQ4A==
X-Received: by 2002:a9d:6ace:: with SMTP id m14mr17167910otq.207.1622474210171;
        Mon, 31 May 2021 08:16:50 -0700 (PDT)
Received: from builder.lan (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id k20sm3169469otb.15.2021.05.31.08.16.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 May 2021 08:16:49 -0700 (PDT)
Date:   Mon, 31 May 2021 10:16:47 -0500
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Konrad Dybcio <konrad.dybcio@somainline.org>
Cc:     ~postmarketos/upstreaming@lists.sr.ht, martin.botka@somainline.org,
        angelogioacchino.delregno@somainline.org,
        marijn.suijten@somainline.org, jamipkettunen@somainline.org,
        Andy Gross <agross@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Kees Cook <keescook@chromium.org>,
        Anton Vorontsov <anton@enomsg.org>,
        Colin Cross <ccross@android.com>,
        Tony Luck <tony.luck@intel.com>
Subject: Re: [PATCH v2 3/3] arm64: dts: qcom: Add support for SONY Xperia X
 Performance/XZ/XZs
Message-ID: <YLT934Geo4KOY7XU@builder.lan>
References: <20210527170409.667255-1-konrad.dybcio@somainline.org>
 <20210527170409.667255-3-konrad.dybcio@somainline.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210527170409.667255-3-konrad.dybcio@somainline.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu 27 May 12:04 CDT 2021, Konrad Dybcio wrote:
> diff --git a/arch/arm64/boot/dts/qcom/msm8996-sony-xperia-tone.dtsi b/arch/arm64/boot/dts/qcom/msm8996-sony-xperia-tone.dtsi
[..]
> +&pm8994_gpios {
> +	pinctrl-names = "default";
> +	pinctrl-0 = <&pm8994_gpios_defaults>;
> +	gpio-line-names =
> +		"NC",
> +		"VOL_DOWN_N",
> +		"VOL_UP_N",
> +		"SNAPSHOT_N",
> +		"FOCUS_N",
> +		"NC",
> +		"NFC_VEN",
> +		"NC",
> +		"NC",
> +		"NC",
> +		"NC",
> +		"NC",
> +		"EAR_EN",
> +		"NC",
> +		"PM_DIVCLK1",
> +		"PMI_CLK",
> +		"NC",
> +		"WL_SLEEP_CLK",
> +		"NC",
> +		"PMIC_SPON",
> +		"UIM_BATT_ALARM",
> +		"PMK_SLEEP_CLK";
> +
> +	/*
> +	 * We don't yet know for sure which GPIOs are of our interest, but what
> +	 * we do know is that if a vendor sets the pins to a non-default state, there's
> +	 * probably a reason for it, and just to be on the safe side, we follow suit.
> +	 */
> +	pm8994_gpios_defaults: pm8994-gpios-default-state {
> +		pm8994_gpio1_n: pm8994-gpio1-nc {

Is there a reason for keeping pm8994_gpios_defaults? I presume you won't
be able to select it, because the associated pins are already busy?

> +			pins = "gpio1";
> +			function = PMIC_GPIO_FUNC_NORMAL;
> +			drive-push-pull;
> +			bias-high-impedance;
> +		};
> +
[..]
> +&pmi8994_gpios {
> +	pinctrl-names = "default";
> +	pinctrl-0 = <&pmi8994_gpios_defaults>;
> +
> +	gpio-line-names =
> +		"VIB_LDO_EN",
> +		"NC",
> +		"NC",
> +		"NC",
> +		"NC",
> +		"NC",
> +		"NC",
> +		"NC",
> +		"USB_SWITCH_SEL",
> +		"NC";
> +
> +	pmi8994_gpios_defaults: pmi8994-gpios-default-state {
> +		pmi8994_vib_ldo_en: vib-ldo-en-gpio {

Ditto.

> +			pins = "gpio1";
> +			function = PMIC_GPIO_FUNC_NORMAL;
> +			drive-push-pull;
> +			output-low;
> +			bias-disable;
> +			power-source = <PM8994_GPIO_S4>;
> +		};

Regards,
Bjorn
