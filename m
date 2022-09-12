Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DE81E5B5EB6
	for <lists+linux-arm-msm@lfdr.de>; Mon, 12 Sep 2022 19:00:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229585AbiILRAZ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 12 Sep 2022 13:00:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52978 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229935AbiILRAW (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 12 Sep 2022 13:00:22 -0400
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com [IPv6:2a00:1450:4864:20::42c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CDA2FFD25
        for <linux-arm-msm@vger.kernel.org>; Mon, 12 Sep 2022 10:00:20 -0700 (PDT)
Received: by mail-wr1-x42c.google.com with SMTP id cc5so6536997wrb.6
        for <linux-arm-msm@vger.kernel.org>; Mon, 12 Sep 2022 10:00:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date;
        bh=rt3yoziUAGWDulBUXGkf7un8lAh62T62yCVwsD4s6kc=;
        b=Wu4ScIG39lXUQrwe6f7oSytrBgwKSE9fimWa6JXY/2WTutxFvhZ1QFiDt0v7vE3FbY
         TsdhAtJYSLhQgdUhmw0Z4dsc6Nfxfjnpq90g0TuLNWRhb1oPnLOoe6L1FFb90gHzNFlQ
         ewS+eCpzo9A7EKzd8coDDQs7FD5POnnbUUHk5ArLH2r8UP17+1o10pyMZ6sXaBYEqwUV
         3FMqSuUy6e9zxsuMzFqkQWEdIpj9hms1dsWDN01sV9jf3q2GEpb9wf6+iEzUg/PhLKgl
         Rm/1G/w12dKItK5FlnpsefKxXnuIPf1NzOhT9OLxKiekkuvYekRKg1zQ6kT4DLUsj4zV
         ECOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date;
        bh=rt3yoziUAGWDulBUXGkf7un8lAh62T62yCVwsD4s6kc=;
        b=J6FhG53IymPMrBOkj3r23ZI5WkqF4eom+axYI+mIUH/4hO5aHXqKSQ5OwZwnwi5l7S
         Fz6s4CHqdupmxtftcBN/RW+h3Z37VQnease4SbJefafLeZ+aZorLIkwHH+2bZMjMORi8
         P8I0DgpBlFsSbnbD3dYhwRKgtcPnLehCN8u8+Mi0kmWXooHlHvjFurNwcReNwYBmykf8
         S79LUEVc7llju5UhtO38JFYs3PGU76jlvDlaaz0ucgMbfNq1iwGjcR7rguF9UXCkJdiT
         JXg/jQtl0o3qLr2KfnaY5gSTyl5QGHd2Y7Ppig5BXaH9Dd/r6lzNLTsUWL6Ifpywckom
         +tSw==
X-Gm-Message-State: ACgBeo3CmvVGo8Y8NNAPYC7nkYw6UhKuPFTYTGRym65LuCN7N2CjfI8b
        IMhGPpjatY3ssi/bsIIZ3BfHDQ==
X-Google-Smtp-Source: AA6agR4CkektO3xwwZTFQDyJ6PwzkdB29gaDQDAXNNQiyn8LnAPMQ8lUqwurq0lrgehoZAWWkjWOhg==
X-Received: by 2002:a5d:5150:0:b0:22a:43a8:145b with SMTP id u16-20020a5d5150000000b0022a43a8145bmr8997168wrt.170.1663002019266;
        Mon, 12 Sep 2022 10:00:19 -0700 (PDT)
Received: from bullseye-11-arm64.lan (cpc141216-aztw34-2-0-cust174.18-1.cable.virginm.net. [80.7.220.175])
        by smtp.gmail.com with ESMTPSA id c19-20020a05600c4a1300b003a1980d55c4sm9520626wmp.47.2022.09.12.10.00.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Sep 2022 10:00:18 -0700 (PDT)
Date:   Mon, 12 Sep 2022 17:00:17 +0000
From:   Daniel Thompson <daniel.thompson@linaro.org>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     Sebastian Reichel <sre@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-pm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH 2/2] power: supply: Add Lenovo Yoga C630 EC driver
Message-ID: <20220912165802.dvlf3eeqx5g3bzdm@maple.lan>
References: <20220810030500.2793882-1-bjorn.andersson@linaro.org>
 <20220810030500.2793882-3-bjorn.andersson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220810030500.2793882-3-bjorn.andersson@linaro.org>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue, Aug 09, 2022 at 10:05:00PM -0500, Bjorn Andersson wrote:
> The Qualcomm Snapdragon-based Lenovo Yoga C630 has some sort of EC
> providing AC-adapter and battery status, as well as USB Type-C altmode
> notifications for Displayport operation.

There's a couple of minor review comments but before we get to that:
woo hoo!


> The Yoga C630 ships with Windows, where these operations primarily are
> implemented in ACPI, but due to various issues with the hardware
> representation therein it's not possible to run Linux on this
> information. As such this is a best-effort re-implementation of these
> operations, based on the register map expressed in ACPI and a fair
> amount of trial and error.
>
> Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
> Reported-by: kernel test robot <lkp@intel.com>
> ---
>  drivers/power/supply/Kconfig        |  11 +
>  drivers/power/supply/Makefile       |   1 +
>  drivers/power/supply/yoga-c630-ec.c | 547 ++++++++++++++++++++++++++++
>  3 files changed, 559 insertions(+)
>  create mode 100644 drivers/power/supply/yoga-c630-ec.c
>
> diff --git a/drivers/power/supply/Kconfig b/drivers/power/supply/Kconfig
> index 1aa8323ad9f6..6e706e948ad2 100644
> --- a/drivers/power/supply/Kconfig
> +++ b/drivers/power/supply/Kconfig
> @@ -897,4 +897,15 @@ config BATTERY_UG3105
>  	  device is off or suspended, the functionality of this driver is
>  	  limited to reporting capacity only.
>
> +config LENOVO_YOGA_C630_EC
> +	tristate "Lenovo Yoga C630 EC battery driver"
> +	depends on DRM
> +	depends on I2C

This needs a "depends on TYPEC" in order to avoid linker errors.


> +	help
> +	  Driver for the Embedded Controller in the Qualcomm Snapdragon-based
> +	  Lenovo Yoga C630, which provides battery information and USB Type-C
> +	  altmode notifications.
> +
> +	  Say M or Y here to include this support.
> +
>  endif # POWER_SUPPLY
> diff --git a/drivers/power/supply/yoga-c630-ec.c b/drivers/power/supply/yoga-c630-ec.c
> new file mode 100644
> index 000000000000..1fa0b5844e01
> --- /dev/null
> +++ b/drivers/power/supply/yoga-c630-ec.c
> @@ -0,0 +1,547 @@
> <snip>
> +static int yoga_c630_ec_bat_get_property(struct power_supply *psy,
> +					 enum power_supply_property psp,
> +					 union power_supply_propval *val)
> +{
> +	struct yoga_c630_ec *ec = power_supply_get_drvdata(psy);
> +	int rc = 0;
> +
> +	if (ec->bat_present)
> +		yoga_c630_ec_maybe_update_bat_status(ec);
> +	else if (psp != POWER_SUPPLY_PROP_PRESENT)
> +		return -ENODEV;
> +
> +	switch (psp) {
>       <snip>
> +	case POWER_SUPPLY_PROP_TECHNOLOGY:
> +		val->intval = POWER_SUPPLY_TECHNOLOGY_LION;
> +		break;
> +	case POWER_SUPPLY_PROP_MODEL_NAME:
> +		val->strval = "PABAS0241231";
> +		break;
> +	case POWER_SUPPLY_PROP_MANUFACTURER:
> +		val->strval = "Compal";
> +		break;
> +	case POWER_SUPPLY_PROP_SERIAL_NUMBER:
> +		val->strval = "05072018";
> +		break;

I'm a little sceptical that hardcoding a serial number into the
driver provides anybody any benefit (regardless of whether the
AML code does this). AFAICT this is not a commonly implemented property
in other power supplies so I'm not clear why this is needed.


Daniel.
