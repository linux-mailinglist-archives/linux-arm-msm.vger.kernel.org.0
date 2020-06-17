Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BC7BF1FD46E
	for <lists+linux-arm-msm@lfdr.de>; Wed, 17 Jun 2020 20:27:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727774AbgFQSYB (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 17 Jun 2020 14:24:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39214 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726835AbgFQSYB (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 17 Jun 2020 14:24:01 -0400
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:e::133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 97C61C06174E;
        Wed, 17 Jun 2020 11:24:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=bombadil.20170209; h=Content-Transfer-Encoding:
        Content-Type:In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:
        Subject:Sender:Reply-To:Content-ID:Content-Description;
        bh=2JxFcdU42ObPBh8Obojgx0LW54eTcsGAMnNoN8L8osU=; b=efU6uev9blzLuor50T8JkcriDD
        q2Ww3RTkU+S32alqB2ewQAXjZG/PV2OAUjPMDEsqlKR88BFzsFshxf5Tu7/rc0KO9ji/0AVHFhdox
        HB1TgBwBCDHx1ydYEy8O405OmEOoBKWG/ZNyJ9nmnmWxljKlTO+TpybST6adg0uNr4U531GdVZKrH
        JGIhyUErq6fpvGTpc9ZSzAW+1KqrcrfPZBq6k57NsxgBx6dR0sJOgekIjXKwxz8l96cqmxII6Mndm
        A0dF/inOIGs8dyYaHWm8dC4EKJH/3KrsAWjuYYdGqbWn1c0xR4ep5Y2REx3yw5gmODbRRFWA11YtE
        IkTerRlQ==;
Received: from [2601:1c0:6280:3f0::19c2]
        by bombadil.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
        id 1jlcjA-00078M-Bn; Wed, 17 Jun 2020 18:24:00 +0000
Subject: Re: [PATCH v3 4/6] regulator: Add support for QCOM PMIC VBUS booster
To:     Wesley Cheng <wcheng@codeaurora.org>,
        heikki.krogerus@linux.intel.com, mark.rutland@arm.com,
        broonie@kernel.org, bjorn.andersson@linaro.org,
        gregkh@linuxfoundation.org, lgirdwood@gmail.com, agross@kernel.org,
        robh+dt@kernel.org
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
        jackp@codeaurora.org, bryan.odonoghue@linaro.org,
        lijun.kernel@gmail.com
References: <20200617180209.5636-1-wcheng@codeaurora.org>
 <20200617180209.5636-5-wcheng@codeaurora.org>
From:   Randy Dunlap <rdunlap@infradead.org>
Message-ID: <60c0f7c9-f986-bf54-6112-1c71a317ae5b@infradead.org>
Date:   Wed, 17 Jun 2020 11:23:57 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
MIME-Version: 1.0
In-Reply-To: <20200617180209.5636-5-wcheng@codeaurora.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi--

On 6/17/20 11:02 AM, Wesley Cheng wrote:
> diff --git a/drivers/regulator/Kconfig b/drivers/regulator/Kconfig
> index 074a2ef55943..79d6b7596f0b 100644
> --- a/drivers/regulator/Kconfig
> +++ b/drivers/regulator/Kconfig
> @@ -797,6 +797,16 @@ config REGULATOR_QCOM_SPMI
>  	  Qualcomm SPMI PMICs as a module. The module will be named
>  	  "qcom_spmi-regulator".
>  
> +config REGULATOR_QCOM_USB_VBUS
> +	tristate "Qualcomm USB Vbus regulator driver"
> +	depends on SPMI || COMPILE_TEST
> +	help
> +	  If you say yes to this option, support will be included for the
> +	  regulator used to enable the VBUS output.
> +
> +	  Say M here if you want to include support for enabling the VBUS output
> +	  as a module. The module will be named "qcom_usb_vbus-regulator".

Since '-' in a module name is converted to '_' when the module is loaded, it
probably makes more sense to tell the user that the module name will be
qcom_usb_vbus_regulator.

> +
>  config REGULATOR_RC5T583
>  	tristate "RICOH RC5T583 Power regulators"
>  	depends on MFD_RC5T583
> diff --git a/drivers/regulator/Makefile b/drivers/regulator/Makefile
> index c0d6b96ebd78..cbab28aa7b56 100644
> --- a/drivers/regulator/Makefile
> +++ b/drivers/regulator/Makefile
> @@ -89,6 +89,7 @@ obj-$(CONFIG_REGULATOR_QCOM_RPM) += qcom_rpm-regulator.o
>  obj-$(CONFIG_REGULATOR_QCOM_RPMH) += qcom-rpmh-regulator.o
>  obj-$(CONFIG_REGULATOR_QCOM_SMD_RPM) += qcom_smd-regulator.o
>  obj-$(CONFIG_REGULATOR_QCOM_SPMI) += qcom_spmi-regulator.o
> +obj-$(CONFIG_REGULATOR_QCOM_USB_VBUS) += qcom_usb_vbus-regulator.o
>  obj-$(CONFIG_REGULATOR_PALMAS) += palmas-regulator.o
>  obj-$(CONFIG_REGULATOR_PFUZE100) += pfuze100-regulator.o
>  obj-$(CONFIG_REGULATOR_PV88060) += pv88060-regulator.o

thanks.
-- 
~Randy

