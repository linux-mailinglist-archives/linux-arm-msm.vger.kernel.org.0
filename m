Return-Path: <linux-arm-msm+bounces-70847-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id DD773B357C2
	for <lists+linux-arm-msm@lfdr.de>; Tue, 26 Aug 2025 11:00:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C27501B65258
	for <lists+linux-arm-msm@lfdr.de>; Tue, 26 Aug 2025 09:00:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1A592288522;
	Tue, 26 Aug 2025 09:00:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="DmrYqXxz"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A82A22874F5
	for <linux-arm-msm@vger.kernel.org>; Tue, 26 Aug 2025 09:00:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756198824; cv=none; b=T4hluZ9Zd5VLNCWY9DNt043CV1e/bOHkWK010OBFGqi/IFuNWZGi99fkiVJJlYZkbxhuUFzQvAtwbO07prGPR4ng05sJTRMCpR5lkJHMBuZnwQ1hgZ5UNf4PxDd8n7mrQhR0DcQ9UCBXv6Py9NzXXroVzfN3hrYS2sN43narbeM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756198824; c=relaxed/simple;
	bh=Kh53Ix0ybvOYJn1sU8cUK/4G1aafqVzjiekxIIXR4RE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=swga4GKTS/d8uP8mQXpnoBJMjaLQNV4IJT26gr+F4pLcQrZ0CVwqJMptjJtQgP1mmbsDZGTrZGIKK4HkveE/RNXpjVrirCau8mzbzn3OOvVe2uNKft0xkKiE+990JBHiJEYbKoVUMRnxLuMeM6J4T5Y2ifSnb4SgiXMxoL7MvY0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=DmrYqXxz; arc=none smtp.client-ip=209.85.221.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-3c7aa4ce85dso1500982f8f.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 26 Aug 2025 02:00:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1756198820; x=1756803620; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=+7KkN9quivPmpt1BF4RV8411bNcmDhGVsoU9lDrlTTk=;
        b=DmrYqXxzBy14KShcJVA/+h2dxSVVy9expYTiooBT31VUI2ZdlANI5bvHJjaMABJvdy
         VVmYk78MPYQYvva5k/Az8QL16FlBK+JU6+BfWfP1tGCmchCmhyn0VjKS7zpwCC4EMyLr
         +/rVLSVGqycz+rRzF6YGwq2zhacDDn+b/lhg8TBfWcHtC79jGgOlf6P+VC+Rolloy+8S
         lnGJ7dHvHriXUVkB6LEuEESHUSF7yOOOMVUUk44vmNhY4FiOmVaTp/k718TWxmLbl9eR
         nHx8Wcfoupk0KjesWk1C63BQdH61VJu/tZtp5HN5ZaBHbiDHs5C1+RcacrUpECmkeQJM
         t0MQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756198820; x=1756803620;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=+7KkN9quivPmpt1BF4RV8411bNcmDhGVsoU9lDrlTTk=;
        b=MQMjF18IAnQJLapcw18Dm8R+tXn+X26GTxUarJMuQYy3nsWia3O4ttFY/T9coXwZS6
         DKRHYNHQLCnQVni3J2NxbwbGd7C/210An/+vw4nvkwI/Xj/jG9J5+B2WyGP4Uu8XzUkj
         SC1uatNFl7v2IyZstmaukXVFBhfhFiOUiDFzizw4wSogIVHp6rEE5p9pI7wP+xf6J1DA
         21GcYc5VbalJ3c7JilvsrwsxRb6AirRDeDElyhC5bOz0WeU0BhHulT6TP2JLujn1p//U
         EA+XOe3r6AE9H+NAnl80mk4At3zLeox/8v1B1wGS3JsezD7a5+IwVLSGCBB0LvzSlxbf
         6RKw==
X-Forwarded-Encrypted: i=1; AJvYcCWevTMctDYvZc5g+NrimUsiZi4GVj1+CaT8bGMaCOd8y7IGqw9SiK0TE6v5v2iiUIrNGdNvG6w3CgUtfn+1@vger.kernel.org
X-Gm-Message-State: AOJu0Yx/qXvbaWOV92O255Uxhx7oqvk5gdaefvabNAV/Q3kecp8tap8g
	2iMKkBaAwtxENKBaO0u6fwCahL27gUJLsCKsvCUyTuJcfo7ttyePVFWl+Zt5unMvT38=
X-Gm-Gg: ASbGncud7JoSN9RyYyE00Mecvt3+ngrLm1nNk6OxR/xKs+Yc1voLyELp4KrUVzhU5ME
	etiVHd5kJogMZ/7nScFQH1zjcnB9CySJakjBPcG5XHecrW3ebdu7JTha1BAdOyia3YN8T8bmq0I
	P70nix9Ezti6uepFVRpR5ifshrRNNoBpoCCqkx2vAd+JN0lZJKNXL3gX3xkhoTpmrmlQEe5G/MC
	kTq03zOXdunSV3yyNmBhQnA8x/QgHZDAMm1vAWJPxBbZywIKqckFUaITmXd4qfwJp/5g+HkB2kU
	V7WmG9IxG5gzDaKP2yxcmdrI4Xcmn1KaMd7nM1XHL7mOrDg8V9/MnZtU3xhmBPcQdjymYy3xnYD
	N+jj5/9a9/0bpRdN/RFcU7l+KcYXhsnCYYgDjPg==
X-Google-Smtp-Source: AGHT+IH0ru1Ur49X+/9xlJm7QLqjH4kudau0AswpLus2lXUF1Z44bEpFDwsPCy8mGE1wo3XS3RMmAA==
X-Received: by 2002:a5d:5d84:0:b0:3b9:10c4:e99a with SMTP id ffacd0b85a97d-3c5dc734325mr9394468f8f.34.1756198819769;
        Tue, 26 Aug 2025 02:00:19 -0700 (PDT)
Received: from [192.168.1.3] ([185.48.76.109])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3c711abd15asm15402512f8f.56.2025.08.26.02.00.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 26 Aug 2025 02:00:19 -0700 (PDT)
Message-ID: <60355fd1-2126-493f-93fe-a36c198a0b32@linaro.org>
Date: Tue, 26 Aug 2025 10:00:18 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 1/3] coresight: tpda: Add sysfs node for tpda
 cross-trigger configuration
To: Jie Gan <jie.gan@oss.qualcomm.com>
Cc: coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 Suzuki K Poulose <suzuki.poulose@arm.com>, Mike Leach
 <mike.leach@linaro.org>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 Tingwei Zhang <tingwei.zhang@oss.qualcomm.com>
References: <20250826070150.5603-1-jie.gan@oss.qualcomm.com>
 <20250826070150.5603-2-jie.gan@oss.qualcomm.com>
Content-Language: en-US
From: James Clark <james.clark@linaro.org>
In-Reply-To: <20250826070150.5603-2-jie.gan@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 26/08/2025 8:01 am, Jie Gan wrote:
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
>   drivers/hwtracing/coresight/coresight-tpda.c  | 241 ++++++++++++++++++
>   drivers/hwtracing/coresight/coresight-tpda.h  |  27 ++
>   3 files changed, 311 insertions(+)
>   create mode 100644 Documentation/ABI/testing/sysfs-bus-coresight-devices-tpda
> 
> diff --git a/Documentation/ABI/testing/sysfs-bus-coresight-devices-tpda b/Documentation/ABI/testing/sysfs-bus-coresight-devices-tpda
> new file mode 100644
> index 000000000000..e827396a0fa1
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
> +		(RW) Set/unset global (all ports) flush request bit. The bit remains set until a

I don't think you can unset? global_flush_req_store() only does 
something for set.

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
> index 4e93fa5bace4..cc254d53b8ec 100644
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
> +		val = val | TPDA_CR_SRIE;
> +	else
> +		val = val & ~TPDA_CR_SRIE;

val |=
val &=

> +	if (drvdata->trig_flag_ts)
> +		val = val | TPDA_CR_FLRIE;
> +	else
> +		val = val & ~TPDA_CR_FLRIE;
> +	if (drvdata->trig_freq)
> +		val = val | TPDA_CR_FRIE;
> +	else
> +		val = val & ~TPDA_CR_FRIE;
> +	if (drvdata->freq_ts)
> +		val = val | TPDA_CR_FREQTS;
> +	else
> +		val = val & ~TPDA_CR_FREQTS;
> +	if (drvdata->cmbchan_mode)
> +		val = val | TPDA_CR_CMBCHANMODE;
> +	else
> +		val = val & ~TPDA_CR_CMBCHANMODE;
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
> @@ -274,6 +302,217 @@ static const struct coresight_ops tpda_cs_ops = {
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
> +	if (val)
> +		drvdata->trig_async = true;
> +	else
> +		drvdata->trig_async = false;
> +

drvdata->trig_async = !!val

same with all the following ones too

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
> +	if (val)
> +		drvdata->trig_flag_ts = true;
> +	else
> +		drvdata->trig_flag_ts = false;
> +
> +	return size;
> +}
> +static DEVICE_ATTR_RW(trig_flag_ts_enable);
> +
> +static ssize_t trig_freq_enable_show(struct device *dev,
> +					  struct device_attribute *attr,
> +					  char *buf)
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
> +	if (val)
> +		drvdata->trig_freq = true;
> +	else
> +		drvdata->trig_freq = false;
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
> +	if (val)
> +		drvdata->freq_ts = true;
> +	else
> +		drvdata->freq_ts = false;
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
> +	guard(spinlock)(&drvdata->spinlock);
> +	if (!drvdata->csdev->refcnt)
> +		return -EPERM;

-EPERM doesn't seem right, maybe EBUSY or EINVAL?

Also don't you need CS_UNLOCK() for reading? I'm not 100% sure but I 
found one example of it in debug_init_arch_data().

> +
> +	val = readl_relaxed(drvdata->base + TPDA_CR);
> +	return sysfs_emit(buf, "%lx\n", val);
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

if (!val)
   return size;

Check this first, no point in taking the spinlock or checking the 
refcount if you aren't going to do anything.

> +	guard(spinlock)(&drvdata->spinlock);
> +	if (!drvdata->csdev->refcnt)
> +		return -EPERM;

ditto for -EPERM

> +
> +	if (val) {
> +		CS_UNLOCK(drvdata->base);
> +		val = readl_relaxed(drvdata->base + TPDA_CR);
> +		val = val | BIT(0);
> +		writel_relaxed(val, drvdata->base + TPDA_CR);
> +		CS_LOCK(drvdata->base);
> +	}
> +
> +	return size;
> +}
> +static DEVICE_ATTR_RW(global_flush_req);
> +
> +static ssize_t cmbchan_mode_show(struct device *dev,
> +				 struct device_attribute *attr,
> +				 char *buf)
> +{
> +	struct tpda_drvdata *drvdata = dev_get_drvdata(dev->parent);
> +
> +	return sysfs_emit(buf, "%u\n", (unsigned int)drvdata->cmbchan_mode);
> +}
> +
> +static ssize_t cmbchan_mode_store(struct device *dev,
> +				  struct device_attribute *attr,
> +				  const char *buf,
> +				  size_t size)
> +{
> +	struct tpda_drvdata *drvdata = dev_get_drvdata(dev->parent);
> +	bool val;
> +
> +	if (kstrtobool(buf, &val))
> +		return -EINVAL;
> +
> +	guard(spinlock)(&drvdata->spinlock);
> +	if (val)
> +		drvdata->cmbchan_mode = true;
> +	else
> +		drvdata->cmbchan_mode = false;
> +
> +	return size;
> +}
> +static DEVICE_ATTR_RW(cmbchan_mode);
> +
> +static struct attribute *tpda_attrs[] = {
> +	&dev_attr_trig_async_enable.attr,
> +	&dev_attr_trig_flag_ts_enable.attr,
> +	&dev_attr_trig_freq_enable.attr,
> +	&dev_attr_freq_ts_enable.attr,
> +	&dev_attr_global_flush_req.attr,
> +	&dev_attr_cmbchan_mode.attr,
> +	NULL,
> +};
> +
> +static struct attribute_group tpda_attr_grp = {
> +	.attrs = tpda_attrs,
> +};
> +
> +static const struct attribute_group *tpda_attr_grps[] = {
> +	&tpda_attr_grp,
> +	NULL,
> +};
> +
>   static int tpda_init_default_data(struct tpda_drvdata *drvdata)
>   {
>   	int atid;
> @@ -289,6 +528,7 @@ static int tpda_init_default_data(struct tpda_drvdata *drvdata)
>   		return atid;
>   
>   	drvdata->atid = atid;
> +	drvdata->freq_ts = true;
>   	return 0;
>   }
>   
> @@ -332,6 +572,7 @@ static int tpda_probe(struct amba_device *adev, const struct amba_id *id)
>   	desc.ops = &tpda_cs_ops;
>   	desc.pdata = adev->dev.platform_data;
>   	desc.dev = &adev->dev;
> +	desc.groups = tpda_attr_grps;
>   	desc.access = CSDEV_ACCESS_IOMEM(base);
>   	drvdata->csdev = coresight_register(&desc);
>   	if (IS_ERR(drvdata->csdev))
> diff --git a/drivers/hwtracing/coresight/coresight-tpda.h b/drivers/hwtracing/coresight/coresight-tpda.h
> index c6af3d2da3ef..b651372d4c88 100644
> --- a/drivers/hwtracing/coresight/coresight-tpda.h
> +++ b/drivers/hwtracing/coresight/coresight-tpda.h
> @@ -8,17 +8,34 @@
>   
>   #define TPDA_CR			(0x000)
>   #define TPDA_Pn_CR(n)		(0x004 + (n * 4))
> +#define TPDA_FPID_CR		(0x084)
> +
> +/* Cross trigger FREQ packets timestamp bit */
> +#define TPDA_CR_FREQTS		BIT(2)
> +/* Cross trigger FREQ packet request bit */
> +#define TPDA_CR_FRIE		BIT(3)
> +/* Cross trigger FLAG packet request interface bit */
> +#define TPDA_CR_FLRIE		BIT(4)
> +/* Cross trigger synchronization bit */
> +#define TPDA_CR_SRIE		BIT(5)
> +/* Packetize CMB/MCMB traffic bit */
> +#define TPDA_CR_CMBCHANMODE	BIT(20)
> +
>   /* Aggregator port enable bit */
>   #define TPDA_Pn_CR_ENA		BIT(0)
>   /* Aggregator port CMB data set element size bit */
>   #define TPDA_Pn_CR_CMBSIZE		GENMASK(7, 6)
>   /* Aggregator port DSB data set element size bit */
>   #define TPDA_Pn_CR_DSBSIZE		BIT(8)
> +/* Mode control bit */
> +#define TPDA_MODE_CTRL			BIT(12)
>   
>   #define TPDA_MAX_INPORTS	32
>   
>   /* Bits 6 ~ 12 is for atid value */
>   #define TPDA_CR_ATID		GENMASK(12, 6)
> +/* Bits 13 ~ 19 is for mid value */
> +#define TPDA_CR_MID		GENMASK(19, 13)
>   
>   /**
>    * struct tpda_drvdata - specifics associated to an TPDA component
> @@ -29,6 +46,11 @@
>    * @enable:     enable status of the component.
>    * @dsb_esize   Record the DSB element size.
>    * @cmb_esize   Record the CMB element size.
> + * @trig_async:	Enable/disable cross trigger synchronization sequence interface.
> + * @trig_flag_ts: Enable/disable cross trigger FLAG packet request interface.
> + * @trig_freq:	Enable/disable cross trigger FREQ packet request interface.
> + * @freq_ts:	Enable/disable the timestamp for all FREQ packets.
> + * @cmbchan_mode: Configure the CMB/MCMB channel mode.
>    */
>   struct tpda_drvdata {
>   	void __iomem		*base;
> @@ -38,6 +60,11 @@ struct tpda_drvdata {
>   	u8			atid;
>   	u32			dsb_esize;
>   	u32			cmb_esize;
> +	bool			trig_async;
> +	bool			trig_flag_ts;
> +	bool			trig_freq;
> +	bool			freq_ts;
> +	bool			cmbchan_mode;
>   };
>   
>   #endif  /* _CORESIGHT_CORESIGHT_TPDA_H */


