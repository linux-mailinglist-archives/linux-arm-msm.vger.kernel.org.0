Return-Path: <linux-arm-msm+bounces-22183-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B054902085
	for <lists+linux-arm-msm@lfdr.de>; Mon, 10 Jun 2024 13:41:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A27FF284949
	for <lists+linux-arm-msm@lfdr.de>; Mon, 10 Jun 2024 11:41:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D4D627E0E8;
	Mon, 10 Jun 2024 11:41:13 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2A7A72C190
	for <linux-arm-msm@vger.kernel.org>; Mon, 10 Jun 2024 11:41:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718019673; cv=none; b=SpgUxzwl1Y9IssoUDclN4LasAlPATyPfQXXchG+QPAs+ZX4diNwc/9yXQVlsmOrTksTHSP+7oqR4B/UH2M38Zx8RzfHk6Acysseqvr3m+haKqvm4mgKhrEZKfKPu8pWoxQiuQkt+23Da+cQpQzwEgyqyupVoLEYOCD5gr3W0vrk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718019673; c=relaxed/simple;
	bh=nyqfG2kuYiSkZ7XrIH7o5AupFxSBg0C40ywehmENuIw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jxvcKzdsQJ2c5lDY4FCb1OzBSfkjZph+YMaJk3ThgWA12q66T8BQG+N8xY7D6Wc3nBm3E60q6wHZ8DTIozSeWJNuh5DXLnwcBG7+CKQG5vLUoTjEgiTnPSp3myvB5fxARK1y/X/fxt/s+NxpWvORtNX96t/L3bQQ2/h39SwAAf0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 1AAF41692
	for <linux-arm-msm@vger.kernel.org>; Mon, 10 Jun 2024 04:41:36 -0700 (PDT)
Received: from e110455-lin.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 644433F73B
	for <linux-arm-msm@vger.kernel.org>; Mon, 10 Jun 2024 04:41:11 -0700 (PDT)
Date: Mon, 10 Jun 2024 12:41:00 +0100
From: Liviu Dudau <liviu.dudau@arm.com>
To: Jeff Johnson <quic_jjohnson@quicinc.com>
Cc: Lee Jones <lee@kernel.org>, Andy Shevchenko <andy@kernel.org>,
	Sudeep Holla <sudeep.holla@arm.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	patches@opensource.cirrus.com, linux-kernel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	kernel-janitors@vger.kernel.org
Subject: Re: [PATCH] mfd: add missing MODULE_DESCRIPTION() macros
Message-ID: <ZmbmTEt2cP4tS2Nn@e110455-lin.cambridge.arm.com>
References: <20240609-md-drivers-mfd-v1-1-47cdd0b394e9@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240609-md-drivers-mfd-v1-1-47cdd0b394e9@quicinc.com>

On Sun, Jun 09, 2024 at 07:21:28PM -0700, Jeff Johnson wrote:
> On x86, make allmodconfig && make W=1 C=1 reports:
> WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/mfd/arizona.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/mfd/pcf50633-gpio.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/mfd/timberdale.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/mfd/ssbi.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/mfd/rt4831.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/mfd/intel_soc_pmic_bxtwc.o
> 
> Add the missing invocation of the MODULE_DESCRIPTION() macro to all
> files which have a MODULE_LICENSE().
> 
> This includes mfd-core.c and vexpress-sysreg.c which, although they
> did not produce a warning with the x86 allmodconfig configuration, may
> cause this warning with other configurations.
> 
> Signed-off-by: Jeff Johnson <quic_jjohnson@quicinc.com>
> ---
>  drivers/mfd/arizona-core.c         | 1 +
>  drivers/mfd/intel_soc_pmic_bxtwc.c | 1 +
>  drivers/mfd/mfd-core.c             | 1 +
>  drivers/mfd/pcf50633-gpio.c        | 1 +
>  drivers/mfd/rt4831.c               | 1 +
>  drivers/mfd/ssbi.c                 | 1 +
>  drivers/mfd/timberdale.c           | 1 +
>  drivers/mfd/vexpress-sysreg.c      | 1 +
>  8 files changed, 8 insertions(+)
> 
> diff --git a/drivers/mfd/arizona-core.c b/drivers/mfd/arizona-core.c
> index 19a0adf8ce3d..85ff8717d850 100644
> --- a/drivers/mfd/arizona-core.c
> +++ b/drivers/mfd/arizona-core.c
> @@ -1429,4 +1429,5 @@ int arizona_dev_exit(struct arizona *arizona)
>  }
>  EXPORT_SYMBOL_GPL(arizona_dev_exit);
>  
> +MODULE_DESCRIPTION("Wolfson Arizona core driver");
>  MODULE_LICENSE("GPL v2");
> diff --git a/drivers/mfd/intel_soc_pmic_bxtwc.c b/drivers/mfd/intel_soc_pmic_bxtwc.c
> index 8dac0d41f64f..ba32cacfc499 100644
> --- a/drivers/mfd/intel_soc_pmic_bxtwc.c
> +++ b/drivers/mfd/intel_soc_pmic_bxtwc.c
> @@ -581,5 +581,6 @@ static struct platform_driver bxtwc_driver = {
>  
>  module_platform_driver(bxtwc_driver);
>  
> +MODULE_DESCRIPTION("Intel Broxton Whiskey Cove PMIC MFD core driver");
>  MODULE_LICENSE("GPL v2");
>  MODULE_AUTHOR("Qipeng Zha <qipeng.zha@intel.com>");
> diff --git a/drivers/mfd/mfd-core.c b/drivers/mfd/mfd-core.c
> index 6ad5c93027af..b2742b1dce0c 100644
> --- a/drivers/mfd/mfd-core.c
> +++ b/drivers/mfd/mfd-core.c
> @@ -437,5 +437,6 @@ int devm_mfd_add_devices(struct device *dev, int id,
>  }
>  EXPORT_SYMBOL(devm_mfd_add_devices);
>  
> +MODULE_DESCRIPTION("Core MFD support");
>  MODULE_LICENSE("GPL");
>  MODULE_AUTHOR("Ian Molton, Dmitry Baryshkov");
> diff --git a/drivers/mfd/pcf50633-gpio.c b/drivers/mfd/pcf50633-gpio.c
> index 4d2b53b12eeb..3e368219479a 100644
> --- a/drivers/mfd/pcf50633-gpio.c
> +++ b/drivers/mfd/pcf50633-gpio.c
> @@ -88,4 +88,5 @@ int pcf50633_gpio_power_supply_set(struct pcf50633 *pcf,
>  }
>  EXPORT_SYMBOL_GPL(pcf50633_gpio_power_supply_set);
>  
> +MODULE_DESCRIPTION("NXP PCF50633 GPIO Driver");
>  MODULE_LICENSE("GPL");
> diff --git a/drivers/mfd/rt4831.c b/drivers/mfd/rt4831.c
> index f8d6dc55b558..1ab8870e4ebf 100644
> --- a/drivers/mfd/rt4831.c
> +++ b/drivers/mfd/rt4831.c
> @@ -115,4 +115,5 @@ static struct i2c_driver rt4831_driver = {
>  module_i2c_driver(rt4831_driver);
>  
>  MODULE_AUTHOR("ChiYuan Huang <cy_huang@richtek.com>");
> +MODULE_DESCRIPTION("Richtek RT4831 core driver");
>  MODULE_LICENSE("GPL v2");
> diff --git a/drivers/mfd/ssbi.c b/drivers/mfd/ssbi.c
> index f849f2d34ec7..6e7aff6e2746 100644
> --- a/drivers/mfd/ssbi.c
> +++ b/drivers/mfd/ssbi.c
> @@ -319,6 +319,7 @@ static struct platform_driver ssbi_driver = {
>  };
>  module_platform_driver(ssbi_driver);
>  
> +MODULE_DESCRIPTION("Qualcomm Single-wire Serial Bus Interface (SSBI) driver");
>  MODULE_LICENSE("GPL v2");
>  MODULE_VERSION("1.0");
>  MODULE_ALIAS("platform:ssbi");
> diff --git a/drivers/mfd/timberdale.c b/drivers/mfd/timberdale.c
> index a41e9a3e2064..333d5b874de3 100644
> --- a/drivers/mfd/timberdale.c
> +++ b/drivers/mfd/timberdale.c
> @@ -853,4 +853,5 @@ module_pci_driver(timberdale_pci_driver);
>  
>  MODULE_AUTHOR("Mocean Laboratories <info@mocean-labs.com>");
>  MODULE_VERSION(DRV_VERSION);
> +MODULE_DESCRIPTION("Timberdale FPGA MFD driver");
>  MODULE_LICENSE("GPL v2");
> diff --git a/drivers/mfd/vexpress-sysreg.c b/drivers/mfd/vexpress-sysreg.c
> index eab82619ec31..d34d58ce46db 100644
> --- a/drivers/mfd/vexpress-sysreg.c
> +++ b/drivers/mfd/vexpress-sysreg.c
> @@ -132,4 +132,5 @@ static struct platform_driver vexpress_sysreg_driver = {
>  };
>  
>  module_platform_driver(vexpress_sysreg_driver);
> +MODULE_DESCRIPTION("Versatile Express system registers driver");
>  MODULE_LICENSE("GPL v2");

For the vexpress-sysreg.c:

Acked-by: Liviu Dudau <liviu.dudau@arm.com>

Best regards,
Liviu

> 
> ---
> base-commit: 83a7eefedc9b56fe7bfeff13b6c7356688ffa670
> change-id: 20240609-md-drivers-mfd-ef0e92e2f8da
> 

-- 
====================
| I would like to |
| fix the world,  |
| but they're not |
| giving me the   |
 \ source code!  /
  ---------------
    ¯\_(ツ)_/¯

