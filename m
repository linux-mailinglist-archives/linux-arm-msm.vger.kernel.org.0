Return-Path: <linux-arm-msm+bounces-70991-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id BD82CB37E52
	for <lists+linux-arm-msm@lfdr.de>; Wed, 27 Aug 2025 11:06:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 7B631163764
	for <lists+linux-arm-msm@lfdr.de>; Wed, 27 Aug 2025 09:06:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1D54A280324;
	Wed, 27 Aug 2025 09:06:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="PLUfNDYG"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9E5A2773E0
	for <linux-arm-msm@vger.kernel.org>; Wed, 27 Aug 2025 09:06:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756285580; cv=none; b=ZMm9ODU2+kF1+eb6HHNExQgC/Sl7F1z6OXt3d+ZTOHmfcW4AT7I56lFf0QECn7eeJERadKDFpbNaLZaSKUj8mfqO5IVL5DuwY46dAyz5RlOxkZxBw8njbtATiJxRv97FTomHqWo2bUQPBLC3vsjDXm2eK4hx1CnaRj0cdw1Uf4I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756285580; c=relaxed/simple;
	bh=WKRUk+IXvuBct3+0Jo+6dMV1t8ega/wFwo0opMB68PA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=KxSCgsI7A3RhY5V13Amrw/yngOB2MCotOYm0sFQCqpfzQv0vDUi1MD3/GsfbJ08hrvrGiiAE0tCtOTNtsrzDksBv8aB6p45TrFyDNgMUhK7poHR2fHx7aHIa2jF+2mSOTXOO9BMGmafISaw1mscMKzMCgL6DUihJiZIy8SBxJVE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=PLUfNDYG; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-45b4a25ccceso39136245e9.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 27 Aug 2025 02:06:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1756285576; x=1756890376; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=xYe7x0kn1tSmo2SrgkQnTv/0D7u1Q2Db+szIg3dqsbA=;
        b=PLUfNDYGY+4ZufkwdA3gi6zJHudNy4zZxkMTUF1Faw8B0kyh1bQNVXS2ehntdPKkp6
         GJj5mXu3s8PCtE65GQy3VHZQaHQgPW9bePwRSZQyILF6eyEJrkgyRHUvZ0jJG2vA6ysn
         Cnc0UOo9i1NqUu3J7yyhsrjEDbzDKiv0HUK1ZeMYmjbAj2Yvi+W2ehTydlMX4DRzXhU2
         WbxivcXszhZQczP8te5T3sfYOkzCDHAg6Ma1uwWyqeBrw9upSelgTYFVY5IJ0NFNRmKG
         3YwUTE/weFCUrL6DbnTUnemL0gG1kcyF07VAHHf+7EXIVWGR7Ot6NErILMMLNppVSBfk
         zNAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756285576; x=1756890376;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=xYe7x0kn1tSmo2SrgkQnTv/0D7u1Q2Db+szIg3dqsbA=;
        b=nWANBHNqBCMapyXzpFpSH6CUtrpITdZrvRrHEPE1TeqMxgqTtthN3OyXuWiOvi3764
         t1tvVfabx7WayJRYZCShKSXCBcEUXbTL/PefA770k9HO4vdU+l5FFVocfT3ZeQr02MaP
         kJDqAr7Doi+5fur0yBXdkPPcjDocY7I6JykLLh7a5CQ/L3cqnn6f5ALdSRPaLZda9oC8
         MiMyJxyIsnYbT0YRIpLSTPFTDCeInIyvej6qDXE1fgxkZlBUzE8jWihS4V3GT6h3fdiK
         fEjdlnawcnH9FBWdeUHNo3YJcRFWi5rJFLhIBZZeD0vBlhyYFpN/9KzgEJccMcHhfrsV
         ZS1Q==
X-Forwarded-Encrypted: i=1; AJvYcCWkQnStVbH4+l2MpG4fBZPlBbKAvcH/8KhUBJ+XImQxn9pgqdYpFEzvRZsKKk37ZXmzvCLvu4yIbZPPwM7Z@vger.kernel.org
X-Gm-Message-State: AOJu0Yz/GfolvBvIaSjVi9q2g4BVr5mXtnT3hmCCXqJ7SdAHCcmFBcxE
	KR/dAkAtkc6ik/kw6qJD4KmfCGTLJEEp404X0PySKH7m9Z00FMZuv9MTWD7fymGbgL0=
X-Gm-Gg: ASbGncv4/HO33eJx6jdF9GK1IJsH5FB5pnYNXiZWJuQ1K2EtDdmn/LrFuxJcidI9v+P
	9JjjpPrX08OxSrDkPetOsBEN15AMX0i77T6uflflJ5B21m0PxbcEDdgvx5dvFszn3tZtxjbQ1ar
	QxdMwGi3HAMezku6OSOpYaRteLsDEz1fT/gFrPHDLNUBmwPFvR3GOsMQJrdEBsEQrNWhPOqi/8+
	3CF4A65bxXhOYze6ikaMZk1h/p2+yx7+su/s8UbC4Ml6rwva3HhxfTBe9yoUmTBuTLDfHXOY8ax
	xgoXe5dVWr1c9knkeIUNIeUoG+YWdm79BGyEa6B9zwVQD7DE3wOBOId5wx8Q4rMmtXlwKcouZAb
	LQ9SK2BZuco4/uddt+F629jMQcb4=
X-Google-Smtp-Source: AGHT+IFofqVkCw866gGpjEjqIIBWlxxrvKIjyyYVRgAv7SZZNZ6pQU8mFL+ekFwhuNKCFcgDAFANOQ==
X-Received: by 2002:a05:600c:630c:b0:456:2b4d:d752 with SMTP id 5b1f17b1804b1-45b517cfe7dmr144985015e9.20.1756285576068;
        Wed, 27 Aug 2025 02:06:16 -0700 (PDT)
Received: from [192.168.1.3] ([185.48.76.109])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45b6f31b02asm21662625e9.21.2025.08.27.02.06.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 27 Aug 2025 02:06:15 -0700 (PDT)
Message-ID: <5acf3562-e69a-49b0-8cb6-9e57c5ad4368@linaro.org>
Date: Wed, 27 Aug 2025 10:06:14 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/3] coresight: tpda: add sysfs nodes for tpda
 cross-trigger configuration
To: Jie Gan <jie.gan@oss.qualcomm.com>
Cc: coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 Suzuki K Poulose <suzuki.poulose@arm.com>, Mike Leach
 <mike.leach@linaro.org>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 Tingwei Zhang <tingwei.zhang@oss.qualcomm.com>
References: <20250827042042.6786-1-jie.gan@oss.qualcomm.com>
 <20250827042042.6786-2-jie.gan@oss.qualcomm.com>
Content-Language: en-US
From: James Clark <james.clark@linaro.org>
In-Reply-To: <20250827042042.6786-2-jie.gan@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 27/08/2025 5:20 am, Jie Gan wrote:
> From: Tao Zhang <tao.zhang@oss.qualcomm.com>
> 
> Introduce sysfs nodes to configure cross-trigger parameters for TPDA.
> These registers define the characteristics of cross-trigger packets,
> including generation frequency and flag values.
> 
> Signed-off-by: Tao Zhang <tao.zhang@oss.qualcomm.com>
> Co-developed-by: Jie Gan <jie.gan@oss.qualcomm.com>
> Signed-off-by: Jie Gan <jie.gan@oss.qualcomm.com>
> ---
>   .../testing/sysfs-bus-coresight-devices-tpda  |  43 ++++
>   drivers/hwtracing/coresight/coresight-tpda.c  | 227 ++++++++++++++++++
>   drivers/hwtracing/coresight/coresight-tpda.h  |  27 ++-
>   3 files changed, 296 insertions(+), 1 deletion(-)
>   create mode 100644 Documentation/ABI/testing/sysfs-bus-coresight-devices-tpda
> 
> diff --git a/Documentation/ABI/testing/sysfs-bus-coresight-devices-tpda b/Documentation/ABI/testing/sysfs-bus-coresight-devices-tpda
> new file mode 100644
> index 000000000000..fb651aebeb31
> --- /dev/null
> +++ b/Documentation/ABI/testing/sysfs-bus-coresight-devices-tpda
> @@ -0,0 +1,43 @@
> +What:		/sys/bus/coresight/devices/<tpda-name>/trig_async_enable
> +Date:		August 2025
> +KernelVersion:	6.17
> +Contact:	Jinlong Mao <jinlong.mao@oss.qualcomm.com>, Tao Zhang <tao.zhang@oss.qualcomm.com>, Jie Gan <jie.gan@oss.qualcomm.com>
> +Description:
> +		(RW) Enable/disable cross trigger synchronization sequence interface.
> +
> +What:		/sys/bus/coresight/devices/<tpda-name>/trig_flag_ts_enable
> +Date:		August 2025
> +KernelVersion:	6.17
> +Contact:	Jinlong Mao <jinlong.mao@oss.qualcomm.com>, Tao Zhang <tao.zhang@oss.qualcomm.com>, Jie Gan <jie.gan@oss.qualcomm.com>
> +Description:
> +		(RW) Enable/disable cross trigger FLAG packet request interface.
> +
> +What:		/sys/bus/coresight/devices/<tpda-name>/trig_freq_enable
> +Date:		August 2025
> +KernelVersion:	6.17
> +Contact:	Jinlong Mao <jinlong.mao@oss.qualcomm.com>, Tao Zhang <tao.zhang@oss.qualcomm.com>, Jie Gan <jie.gan@oss.qualcomm.com>
> +Description:
> +		(RW) Enable/disable cross trigger FREQ packet request interface.
> +
> +What:		/sys/bus/coresight/devices/<tpda-name>/freq_ts_enable
> +Date:		August 2025
> +KernelVersion:	6.17
> +Contact:	Jinlong Mao <jinlong.mao@oss.qualcomm.com>, Tao Zhang <tao.zhang@oss.qualcomm.com>, Jie Gan <jie.gan@oss.qualcomm.com>
> +Description:
> +		(RW) Enable/disable the timestamp for all FREQ packets.
> +
> +What:		/sys/bus/coresight/devices/<tpda-name>/global_flush_req
> +Date:		August 2025
> +KernelVersion:	6.17
> +Contact:	Jinlong Mao <jinlong.mao@oss.qualcomm.com>, Tao Zhang <tao.zhang@oss.qualcomm.com>, Jie Gan <jie.gan@oss.qualcomm.com>
> +Description:
> +		(RW) Set global (all ports) flush request bit. The bit remains set until a
> +		global flush request sequence completes.
> +
> +What:		/sys/bus/coresight/devices/<tpda-name>/cmbchan_mode
> +Date:		August 2025
> +KernelVersion:	6.17
> +Contact:	Jinlong Mao <jinlong.mao@oss.qualcomm.com>, Tao Zhang <tao.zhang@oss.qualcomm.com>, Jie Gan <jie.gan@oss.qualcomm.com>
> +Description:
> +		(RW) Configure the CMB/MCMB channel mode for all enabled ports.
> +		Value 0 means raw channel mapping mode. Value 1 means channel pair marking mode.
> diff --git a/drivers/hwtracing/coresight/coresight-tpda.c b/drivers/hwtracing/coresight/coresight-tpda.c
> index 4e93fa5bace4..647ab49a98d7 100644
> --- a/drivers/hwtracing/coresight/coresight-tpda.c
> +++ b/drivers/hwtracing/coresight/coresight-tpda.c
> @@ -156,9 +156,37 @@ static void tpda_enable_pre_port(struct tpda_drvdata *drvdata)
>   	u32 val;
>   
>   	val = readl_relaxed(drvdata->base + TPDA_CR);
> +	val &= ~TPDA_CR_MID;
>   	val &= ~TPDA_CR_ATID;
>   	val |= FIELD_PREP(TPDA_CR_ATID, drvdata->atid);
> +	if (drvdata->trig_async)
> +		val |= TPDA_CR_SRIE;
> +	else
> +		val &= ~TPDA_CR_SRIE;
> +	if (drvdata->trig_flag_ts)
> +		val |= TPDA_CR_FLRIE;
> +	else
> +		val &= ~TPDA_CR_FLRIE;
> +	if (drvdata->trig_freq)
> +		val |= TPDA_CR_FRIE;
> +	else
> +		val &= ~TPDA_CR_FRIE;
> +	if (drvdata->freq_ts)
> +		val |= TPDA_CR_FREQTS;
> +	else
> +		val &= ~TPDA_CR_FREQTS;
> +	if (drvdata->cmbchan_mode)
> +		val |= TPDA_CR_CMBCHANMODE;
> +	else
> +		val &= ~TPDA_CR_CMBCHANMODE;
>   	writel_relaxed(val, drvdata->base + TPDA_CR);
> +
> +	/*
> +	 * If FLRIE bit is set, set the master and channel
> +	 * id as zero
> +	 */
> +	if (drvdata->trig_flag_ts)
> +		writel_relaxed(0x0, drvdata->base + TPDA_FPID_CR);
>   }
>   
>   static int tpda_enable_port(struct tpda_drvdata *drvdata, int port)
> @@ -274,6 +302,203 @@ static const struct coresight_ops tpda_cs_ops = {
>   	.link_ops	= &tpda_link_ops,
>   };
>   
> +static ssize_t trig_async_enable_show(struct device *dev,
> +				      struct device_attribute *attr,
> +				      char *buf)
> +{
> +	struct tpda_drvdata *drvdata = dev_get_drvdata(dev->parent);
> +
> +	return sysfs_emit(buf, "%u\n", (unsigned int)drvdata->trig_async);
> +}
> +
> +static ssize_t trig_async_enable_store(struct device *dev,
> +				       struct device_attribute *attr,
> +				       const char *buf,
> +				       size_t size)
> +{
> +	struct tpda_drvdata *drvdata = dev_get_drvdata(dev->parent);
> +	unsigned long val;
> +
> +	if (kstrtoul(buf, 0, &val))
> +		return -EINVAL;
> +
> +	guard(spinlock)(&drvdata->spinlock);
> +	drvdata->trig_async = !!val;
> +
> +	return size;
> +}
> +static DEVICE_ATTR_RW(trig_async_enable);
> +
> +static ssize_t trig_flag_ts_enable_show(struct device *dev,
> +					struct device_attribute *attr,
> +					char *buf)
> +{
> +	struct tpda_drvdata *drvdata = dev_get_drvdata(dev->parent);
> +
> +	return sysfs_emit(buf, "%u\n", (unsigned int)drvdata->trig_flag_ts);
> +}
> +
> +static ssize_t trig_flag_ts_enable_store(struct device *dev,
> +					 struct device_attribute *attr,
> +					 const char *buf,
> +					 size_t size)
> +{
> +	struct tpda_drvdata *drvdata = dev_get_drvdata(dev->parent);
> +	unsigned long val;
> +
> +	if (kstrtoul(buf, 0, &val))
> +		return -EINVAL;
> +
> +	guard(spinlock)(&drvdata->spinlock);
> +	drvdata->trig_flag_ts = !!val;
> +
> +	return size;
> +}
> +static DEVICE_ATTR_RW(trig_flag_ts_enable);
> +
> +static ssize_t trig_freq_enable_show(struct device *dev,
> +				     struct device_attribute *attr,
> +				     char *buf)
> +{
> +	struct tpda_drvdata *drvdata = dev_get_drvdata(dev->parent);
> +
> +	return sysfs_emit(buf, "%u\n", (unsigned int)drvdata->trig_freq);
> +}
> +
> +static ssize_t trig_freq_enable_store(struct device *dev,
> +				      struct device_attribute *attr,
> +				      const char *buf,
> +				      size_t size)
> +{
> +	struct tpda_drvdata *drvdata = dev_get_drvdata(dev->parent);
> +	unsigned long val;
> +
> +	if (kstrtoul(buf, 0, &val))
> +		return -EINVAL;
> +
> +	guard(spinlock)(&drvdata->spinlock);
> +	drvdata->trig_freq = !!val;
> +
> +	return size;
> +}
> +static DEVICE_ATTR_RW(trig_freq_enable);
> +
> +static ssize_t freq_ts_enable_show(struct device *dev,
> +				   struct device_attribute *attr,
> +				   char *buf)
> +{
> +	struct tpda_drvdata *drvdata = dev_get_drvdata(dev->parent);
> +
> +	return sysfs_emit(buf, "%u\n", (unsigned int)drvdata->freq_ts);
> +}
> +
> +static ssize_t freq_ts_enable_store(struct device *dev,
> +				    struct device_attribute *attr,
> +				    const char *buf,
> +				    size_t size)
> +{
> +	struct tpda_drvdata *drvdata = dev_get_drvdata(dev->parent);
> +	unsigned long val;
> +
> +	if (kstrtoul(buf, 0, &val))
> +		return -EINVAL;
> +
> +	guard(spinlock)(&drvdata->spinlock);
> +	drvdata->freq_ts = !!val;
> +
> +	return size;
> +}
> +static DEVICE_ATTR_RW(freq_ts_enable);
> +
> +static ssize_t global_flush_req_show(struct device *dev,
> +				     struct device_attribute *attr,
> +				     char *buf)
> +{
> +	struct tpda_drvdata *drvdata = dev_get_drvdata(dev->parent);
> +	unsigned long val;
> +
> +	if (!drvdata->csdev->refcnt)
> +		return -EINVAL;
> +
> +	guard(spinlock)(&drvdata->spinlock);
> +	CS_UNLOCK(drvdata->base);
> +	val = readl_relaxed(drvdata->base + TPDA_CR);
> +	CS_LOCK(drvdata->base);
> +
> +	return sysfs_emit(buf, "%lx\n", val);

I know in practice it's probably only either 0 or 1, but this should 
either be decimal or have the 0x prefix otherwise it looks like a mistake.

> +}
> +
> +static ssize_t global_flush_req_store(struct device *dev,
> +				      struct device_attribute *attr,
> +				      const char *buf,
> +				      size_t size)
> +{
> +	struct tpda_drvdata *drvdata = dev_get_drvdata(dev->parent);
> +	unsigned long val;
> +
> +	if (kstrtoul(buf, 0, &val))
> +		return -EINVAL;
> +
> +	if (!drvdata->csdev->refcnt || !val)
> +		return -EINVAL;
> +
> +	guard(spinlock)(&drvdata->spinlock);
> +	CS_UNLOCK(drvdata->base);
> +	val = readl_relaxed(drvdata->base + TPDA_CR);
> +	val |= BIT(0);

If you only set bit 0 do you only want to show bit 0 in 
global_flush_req_show() above? The sysfs files should be divided up by 
function rather than dumping the whole register, otherwise tools need 
their own copy of the fields to interperet them.



