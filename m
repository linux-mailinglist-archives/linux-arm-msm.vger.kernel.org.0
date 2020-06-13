Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D05CE1F80B8
	for <lists+linux-arm-msm@lfdr.de>; Sat, 13 Jun 2020 05:28:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726416AbgFMD2Y (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 12 Jun 2020 23:28:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33796 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726392AbgFMD2X (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 12 Jun 2020 23:28:23 -0400
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:e::133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D4BD3C03E96F;
        Fri, 12 Jun 2020 20:28:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=bombadil.20170209; h=Content-Transfer-Encoding:
        Content-Type:In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:
        Subject:Sender:Reply-To:Content-ID:Content-Description;
        bh=HPEdl5A02jMG4MY9KVqcUkeXN5vUrwEPXxu3d5xQjpI=; b=IXD79xACg/wXUc/d1TEJZl+Bi0
        BlDkX2FljHwbWMLfk+pIEOCe6gqXrdZyskyPFWmITsAsYvapdVthF3zAiemSBYLML3oOqAzN9uRPt
        lmF57zZeix7u8AbdTL4wuv3npO/aMQY4jF92IbeCvTCTllCiN20X+X0hmAdOwaNXqomrIq+TX/xtq
        G9Qi83gc9cJDGO4vtVcN1dGUAvp0yDYxIa0OcqKtYSeKF7ZhSIRo0XuyNf7JA0NxNYDSSX5NDxrPC
        ThQaGbCDpASszp1w5w5tRV/3L470FMwhG5qbDifHxWBmUa1fCFiYDCnwpjacmk52ThhBKgXST+LVq
        t9xrD/bw==;
Received: from [2601:1c0:6280:3f0::19c2]
        by bombadil.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
        id 1jjwq8-0001Cf-Hn; Sat, 13 Jun 2020 03:28:16 +0000
Subject: Re: [PATCH v2 4/6] regulator: Add support for QCOM PMIC VBUS booster
To:     Wesley Cheng <wcheng@codeaurora.org>, robh+dt@kernel.org,
        heikki.krogerus@linux.intel.com, gregkh@linuxfoundation.org,
        mark.rutland@arm.com, broonie@kernel.org, lgirdwood@gmail.com,
        agross@kernel.org, bjorn.andersson@linaro.org
Cc:     linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-usb@vger.kernel.org,
        lijun.kernel@gmail.com, jackp@codeaurora.org,
        bryan.odonoghue@linaro.org
References: <20200612231918.8001-1-wcheng@codeaurora.org>
 <20200612231918.8001-5-wcheng@codeaurora.org>
From:   Randy Dunlap <rdunlap@infradead.org>
Message-ID: <6d23c903-abec-e2f8-1e63-c062211748c3@infradead.org>
Date:   Fri, 12 Jun 2020 20:28:14 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <20200612231918.8001-5-wcheng@codeaurora.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 6/12/20 4:19 PM, Wesley Cheng wrote:
> diff --git a/drivers/regulator/Kconfig b/drivers/regulator/Kconfig
> index 074a2ef55943..f9165f9f9051 100644
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
> +	  as a module. The module will be named "qcom_usb-regulator".

Hi,
Shouldn't that module name match what is in the Makefile?


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

