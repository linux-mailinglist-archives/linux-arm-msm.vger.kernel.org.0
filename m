Return-Path: <linux-arm-msm+bounces-46089-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C3D9A1B666
	for <lists+linux-arm-msm@lfdr.de>; Fri, 24 Jan 2025 13:57:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D61DC188B42A
	for <lists+linux-arm-msm@lfdr.de>; Fri, 24 Jan 2025 12:57:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 606A8CA64;
	Fri, 24 Jan 2025 12:57:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canonical.com header.i=@canonical.com header.b="NMIcrYvW"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp-relay-internal-0.canonical.com (smtp-relay-internal-0.canonical.com [185.125.188.122])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7AA975223
	for <linux-arm-msm@vger.kernel.org>; Fri, 24 Jan 2025 12:57:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.125.188.122
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737723427; cv=none; b=q6yh1XzQhW/tnOpLhHccg54OhT3I5+NV9IZ487kGuUMesjWL7JaAfDzW1o9qYUn9cy/kPEQibFj1fvdTBhVUZblxDEpgCgzpzeTyrAmEMIwsN94+pQ1CWZgoLPC0+PwLg2Jl+gYKrS0lE0ef7nngQxtD84qydVtsFfpWwI9mYZI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737723427; c=relaxed/simple;
	bh=4V+4vpsG4A21tuMIVP9AGHfxXtE2sMXUJPnnthrx07c=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YyAwhowFdOiB+TSES0HzE6ExRPpNggwXwiwL2f/LAeOuXSS8pxjn1TgDbdgTk3JDDnU9U6diJl1uMHs8guzikbK8lN0RjYXBfeuB0B5JaDwKagYULXGSrQdkvWr4dDRQCTJYtgyJBMVaEvPmtz39yyr8BdsVcuAY6TgPX9qxrdA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canonical.com; spf=pass smtp.mailfrom=canonical.com; dkim=pass (2048-bit key) header.d=canonical.com header.i=@canonical.com header.b=NMIcrYvW; arc=none smtp.client-ip=185.125.188.122
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canonical.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canonical.com
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com [209.85.208.72])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id 90EA53FB5C
	for <linux-arm-msm@vger.kernel.org>; Fri, 24 Jan 2025 12:57:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1737723422;
	bh=J6/gN7Pd3B+HSO/sALygzOa6m+gQWzhldSmINAgQzjw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:In-Reply-To;
	b=NMIcrYvWowXeNBDqloszmXWdYWfe6hqztECPAmmOnExvxCCDkxcjea2bV2/+ayDTe
	 qi9LyDEtHUtEgo7/3KSd0W+zAnI/JIeb7A+wZtfBaBv1PROTjohAeAT5Lpf5/qw/4Z
	 g6sb6feEfl8+ADkjg3ACyw4FWZEbQFP2/WiKM4HSkWVjAZVHdRk0ZhpNSuVPCftXd4
	 Lr8nZxcTF9XdxfhkWu0p/lZQxNX3EJsm+gFJDgoBvXeGtw6PUFu7vDpruX9QDHJVlt
	 DdjNNQd7LZaaaPifQ6MZI9EweH2rrqulpEkUuOZ4q72phNYzVPgOZBI7Qc0DvAbFxC
	 +VFQCkpgUKiyA==
Received: by mail-ed1-f72.google.com with SMTP id 4fb4d7f45d1cf-5d3fe991854so2755303a12.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 24 Jan 2025 04:57:02 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737723420; x=1738328220;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=J6/gN7Pd3B+HSO/sALygzOa6m+gQWzhldSmINAgQzjw=;
        b=YSEOnMwRVlkQYKdtoFV0DmEWiuO7uPxJ9gk0U9peXKh/reoHRFiaU61oc8EobKrnmS
         dHI1hc6BgufCMLhoT9Ll7joAAYsewX52GaAwD8D9vhkXVYgD+fM0tCgd9qE5vFrf08RN
         oXuOVqXrD9rdrxQTrremwwTJtq9LJzzp3v3UtRk8amN/enNIUqMvPZI4P34i9e/RXbm6
         Z+K34zZe97R4gdxWyIQf0SxSlMjkLlFL1TCo8XPpXZXEo6MEo7QtEGWJqBbVzLxQZScA
         LKyw5tUUy8A1RkeZMBTnUEVDBhzC7GZyLyMXV/el/BMzhMeVev0ORmW5GErARY4ek7cu
         7ceg==
X-Forwarded-Encrypted: i=1; AJvYcCUS1DN6+5LHfoAclQjcFWwLmnt6rhaZ9ByJCKgEQHyDmMzEaeiyreNMV8qSDPkuq56o7DKCpzmrlPPjMS13@vger.kernel.org
X-Gm-Message-State: AOJu0YxKUmpgqLAZKmYrsDfFWqBL6Y5LptFcSd9paZE7U83oYj0tMYRg
	3o5jVzDGHZ50HFHOObWi7tzi/hLj9xjJeqFmX4YkfKiAriqr6FtCwV9CVdmmbO+b55gmwIG+cr8
	JNh5sFVIMIUArN+9oASbtr+Ip+I972s707rN4Iz8pEr3+1EVodDyoUtGsU/4ErbdG6Z33qeQ6dm
	Y+nrKEuVf/woN/wU7t
X-Gm-Gg: ASbGncs1rz0yLohBk72mvuuMo5AsL5O+wMCnN7BuPB5wzUTu2+BCm48FDwAokaWt8O4
	i4fzQEcUqeDVgXYPW+f4eQGASMdtL/Wx8LLGLWHJGXQqiQDhMdkn9GvcGPY4t79Ab9kWjLf161H
	TK2CCPa7ggQzW/lmILNFhUJlcSW/bE4ohQURlSRs/Rc/KG1vRs9wJ2ta11KBCjXR/S1l0GQnypS
	vr1wr0fBfQUYehgsnJKbnj6W9hIZg9VCygm292C+9faReCpsDAj03qq2zYaK2LUu4MCPyBj12U5
	a704aj+t
X-Received: by 2002:a05:6402:27d1:b0:5d2:be16:de1f with SMTP id 4fb4d7f45d1cf-5db7d354c56mr26760041a12.23.1737723420300;
        Fri, 24 Jan 2025 04:57:00 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHxwoMC4E5bFgk0lVOvdnU3m/sztvq/wJDtKlmQGlFNNL41i/29KpepdAqRvgtNwKN23aPB9w==
X-Received: by 2002:a05:6402:27d1:b0:5d2:be16:de1f with SMTP id 4fb4d7f45d1cf-5db7d354c56mr26760022a12.23.1737723419855;
        Fri, 24 Jan 2025 04:56:59 -0800 (PST)
Received: from shodan.l0w.de ([2001:a61:340a:c401:c512:e163:34d2:a30e])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5dc1863a87fsm1164314a12.38.2025.01.24.04.56.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Jan 2025 04:56:59 -0800 (PST)
Date: Fri, 24 Jan 2025 13:56:56 +0100
From: Tobias Heider <tobias.heider@canonical.com>
To: Johan Hovold <johan+linaro@kernel.org>
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>, 
	Bjorn Andersson <andersson@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Jonathan Marek <jonathan@marek.ca>, 
	linux-arm-msm@vger.kernel.org, linux-rtc@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/7] rtc: pm8xxx: add support for uefi offset
Message-ID: <wkkhlpgqf7vdtsmxqdt6izysj7nmbemmzf3lkclbg5oewn3xz5@oybsmken7s4h>
References: <20250120144152.11949-1-johan+linaro@kernel.org>
 <20250120144152.11949-4-johan+linaro@kernel.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250120144152.11949-4-johan+linaro@kernel.org>

On Mon, Jan 20, 2025 at 03:41:48PM GMT, Johan Hovold wrote:
> On many Qualcomm platforms the PMIC RTC control and time registers are
> read-only so that the RTC time can not be updated. Instead an offset
> needs be stored in some machine-specific non-volatile memory, which the
> driver can take into account.
> 
> Add support for storing a 32-bit offset from the GPS time epoch in a
> UEFI variable so that the RTC time can be set on such platforms.
> 
> The UEFI variable is
> 
>             882f8c2b-9646-435f-8de5-f208ff80c1bd-RTCInfo
> 
> and holds a 12-byte structure where the first four bytes is a GPS time
> offset in little-endian byte order.
> 
> Note that this format is not arbitrary as the variable is shared with
> the UEFI firmware (and Windows).
> 
> Signed-off-by: Johan Hovold <johan+linaro@kernel.org>

Thanks for the great work Johan, seems to work nicely here!

I think you might need to add MODULE_IMPORT_NS(EFIVAR) for the efivar_*
API calls you added.

> ---
>  drivers/rtc/rtc-pm8xxx.c | 125 +++++++++++++++++++++++++++++++++++++--
>  include/linux/rtc.h      |   1 +
>  2 files changed, 121 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/rtc/rtc-pm8xxx.c b/drivers/rtc/rtc-pm8xxx.c
> index 2f32187ecc8d..be1983bf35cd 100644
> --- a/drivers/rtc/rtc-pm8xxx.c
> +++ b/drivers/rtc/rtc-pm8xxx.c
> @@ -5,6 +5,7 @@
>   * Copyright (c) 2010-2011, Code Aurora Forum. All rights reserved.
>   * Copyright (c) 2023, Linaro Limited
>   */
> +#include <linux/efi.h>
>  #include <linux/of.h>
>  #include <linux/module.h>
>  #include <linux/nvmem-consumer.h>
> @@ -16,9 +17,10 @@
>  #include <linux/regmap.h>
>  #include <linux/slab.h>
>  #include <linux/spinlock.h>
> -
>  #include <linux/unaligned.h>
>  
> +#include <asm/byteorder.h>
> +
>  /* RTC_CTRL register bit fields */
>  #define PM8xxx_RTC_ENABLE		BIT(7)
>  #define PM8xxx_RTC_ALARM_CLEAR		BIT(0)
> @@ -46,14 +48,21 @@ struct pm8xxx_rtc_regs {
>  	unsigned int alarm_en;
>  };
>  
> +struct qcom_uefi_rtc_info {
> +	__le32	offset_gps;
> +	u8	reserved[8];
> +} __packed;
> +
>  /**
>   * struct pm8xxx_rtc -  RTC driver internal structure
>   * @rtc:		RTC device
>   * @regmap:		regmap used to access registers
>   * @allow_set_time:	whether the time can be set
> + * @use_uefi:		use UEFI variable as fallback for offset
>   * @alarm_irq:		alarm irq number
>   * @regs:		register description
>   * @dev:		device structure
> + * @rtc_info:		qcom uefi rtc-info structure
>   * @nvmem_cell:		nvmem cell for offset
>   * @offset:		offset from epoch in seconds
>   */
> @@ -61,13 +70,101 @@ struct pm8xxx_rtc {
>  	struct rtc_device *rtc;
>  	struct regmap *regmap;
>  	bool allow_set_time;
> +	bool use_uefi;
>  	int alarm_irq;
>  	const struct pm8xxx_rtc_regs *regs;
>  	struct device *dev;
> +	struct qcom_uefi_rtc_info rtc_info;
>  	struct nvmem_cell *nvmem_cell;
>  	u32 offset;
>  };
>  
> +#ifdef CONFIG_EFI
> +
> +MODULE_IMPORT_NS("EFIVAR");
> +
> +#define QCOM_UEFI_NAME	L"RTCInfo"
> +#define QCOM_UEFI_GUID	EFI_GUID(0x882f8c2b, 0x9646, 0x435f, \
> +				 0x8d, 0xe5, 0xf2, 0x08, 0xff, 0x80, 0xc1, 0xbd)
> +#define QCOM_UEFI_ATTRS	(EFI_VARIABLE_NON_VOLATILE | \
> +			 EFI_VARIABLE_BOOTSERVICE_ACCESS | \
> +			 EFI_VARIABLE_RUNTIME_ACCESS)
> +
> +static int pm8xxx_rtc_read_uefi_offset(struct pm8xxx_rtc *rtc_dd)
> +{
> +	struct qcom_uefi_rtc_info *rtc_info = &rtc_dd->rtc_info;
> +	unsigned long size = sizeof(*rtc_info);
> +	struct device *dev = rtc_dd->dev;
> +	efi_status_t status;
> +	u32 offset_gps;
> +	int rc;
> +
> +	rc = efivar_lock();
> +	if (rc)
> +		return rc;
> +
> +	status = efivar_get_variable(QCOM_UEFI_NAME, &QCOM_UEFI_GUID, NULL,
> +				     &size, rtc_info);
> +	efivar_unlock();
> +
> +	if (status != EFI_SUCCESS) {
> +		dev_dbg(dev, "failed to read UEFI offset: %lu\n", status);
> +		return efi_status_to_err(status);
> +	}
> +
> +	if (size != sizeof(*rtc_info)) {
> +		dev_dbg(dev, "unexpected UEFI structure size %lu\n", size);
> +		return -EINVAL;
> +	}
> +
> +	dev_dbg(dev, "uefi_rtc_info = %*ph\n", (int)size, rtc_info);
> +
> +	/* Convert from GPS to Unix time offset */
> +	offset_gps = le32_to_cpu(rtc_info->offset_gps);
> +	rtc_dd->offset = offset_gps + (u32)RTC_TIMESTAMP_EPOCH_GPS;
> +
> +	return 0;
> +}
> +
> +static int pm8xxx_rtc_write_uefi_offset(struct pm8xxx_rtc *rtc_dd, u32 offset)
> +{
> +	struct qcom_uefi_rtc_info *rtc_info = &rtc_dd->rtc_info;
> +	unsigned long size = sizeof(*rtc_info);
> +	struct device *dev = rtc_dd->dev;
> +	efi_status_t status;
> +	u32 offset_gps;
> +
> +	/* Convert from Unix to GPS time offset */
> +	offset_gps = offset - (u32)RTC_TIMESTAMP_EPOCH_GPS;
> +
> +	rtc_info->offset_gps = cpu_to_le32(offset_gps);
> +
> +	dev_dbg(dev, "efi_rtc_info = %*ph\n", (int)size, rtc_info);
> +
> +	status = efivar_set_variable(QCOM_UEFI_NAME, &QCOM_UEFI_GUID,
> +				     QCOM_UEFI_ATTRS, size, rtc_info);
> +	if (status != EFI_SUCCESS) {
> +		dev_dbg(dev, "failed to write UEFI offset: %lx\n", status);
> +		return efi_status_to_err(status);
> +	}
> +
> +	return 0;
> +}
> +
> +#else	/* CONFIG_EFI */
> +
> +static int pm8xxx_rtc_read_uefi_offset(struct pm8xxx_rtc *rtc_dd)
> +{
> +	return -ENODEV;
> +}
> +
> +static int pm8xxx_rtc_write_uefi_offset(struct pm8xxx_rtc *rtc_dd, u32 offset)
> +{
> +	return -ENODEV;
> +}
> +
> +#endif	/* CONFIG_EFI */
> +
>  static int pm8xxx_rtc_read_nvmem_offset(struct pm8xxx_rtc *rtc_dd)
>  {
>  	size_t len;
> @@ -112,10 +209,13 @@ static int pm8xxx_rtc_write_nvmem_offset(struct pm8xxx_rtc *rtc_dd, u32 offset)
>  
>  static int pm8xxx_rtc_read_offset(struct pm8xxx_rtc *rtc_dd)
>  {
> -	if (!rtc_dd->nvmem_cell)
> +	if (!rtc_dd->nvmem_cell && !rtc_dd->use_uefi)
>  		return 0;
>  
> -	return pm8xxx_rtc_read_nvmem_offset(rtc_dd);
> +	if (rtc_dd->nvmem_cell)
> +		return pm8xxx_rtc_read_nvmem_offset(rtc_dd);
> +	else
> +		return pm8xxx_rtc_read_uefi_offset(rtc_dd);
>  }
>  
>  static int pm8xxx_rtc_read_raw(struct pm8xxx_rtc *rtc_dd, u32 *secs)
> @@ -155,7 +255,7 @@ static int pm8xxx_rtc_update_offset(struct pm8xxx_rtc *rtc_dd, u32 secs)
>  	u32 offset;
>  	int rc;
>  
> -	if (!rtc_dd->nvmem_cell)
> +	if (!rtc_dd->nvmem_cell && !rtc_dd->use_uefi)
>  		return -ENODEV;
>  
>  	rc = pm8xxx_rtc_read_raw(rtc_dd, &raw_secs);
> @@ -167,7 +267,11 @@ static int pm8xxx_rtc_update_offset(struct pm8xxx_rtc *rtc_dd, u32 secs)
>  	if (offset == rtc_dd->offset)
>  		return 0;
>  
> -	rc = pm8xxx_rtc_write_nvmem_offset(rtc_dd, offset);
> +	if (rtc_dd->nvmem_cell)
> +		rc = pm8xxx_rtc_write_nvmem_offset(rtc_dd, offset);
> +	else
> +		rc = pm8xxx_rtc_write_uefi_offset(rtc_dd, offset);
> +
>  	if (rc)
>  		return rc;
>  
> @@ -486,6 +590,17 @@ static int pm8xxx_rtc_probe(struct platform_device *pdev)
>  		if (rc != -ENOENT)
>  			return rc;
>  		rtc_dd->nvmem_cell = NULL;
> +
> +		/* Use UEFI storage as fallback if available */
> +		rtc_dd->use_uefi = of_property_read_bool(pdev->dev.of_node,
> +							 "qcom,uefi-rtc-info");
> +	}
> +
> +	if (rtc_dd->use_uefi && !efivar_is_available()) {
> +		if (IS_ENABLED(CONFIG_EFI))
> +			return -EPROBE_DEFER;
> +		dev_warn(&pdev->dev, "efivars not available\n");
> +		rtc_dd->use_uefi = false;
>  	}
>  
>  	rtc_dd->regs = match->data;
> diff --git a/include/linux/rtc.h b/include/linux/rtc.h
> index 3f4d315aaec9..95da051fb155 100644
> --- a/include/linux/rtc.h
> +++ b/include/linux/rtc.h
> @@ -170,6 +170,7 @@ struct rtc_device {
>  /* useful timestamps */
>  #define RTC_TIMESTAMP_BEGIN_0000	-62167219200ULL /* 0000-01-01 00:00:00 */
>  #define RTC_TIMESTAMP_BEGIN_1900	-2208988800LL /* 1900-01-01 00:00:00 */
> +#define RTC_TIMESTAMP_EPOCH_GPS		315964800LL /* 1980-01-06 00:00:00 */
>  #define RTC_TIMESTAMP_BEGIN_2000	946684800LL /* 2000-01-01 00:00:00 */
>  #define RTC_TIMESTAMP_END_2063		2966371199LL /* 2063-12-31 23:59:59 */
>  #define RTC_TIMESTAMP_END_2079		3471292799LL /* 2079-12-31 23:59:59 */
> -- 
> 2.45.2
> 
> 

