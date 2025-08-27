Return-Path: <linux-arm-msm+bounces-70992-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E25FB37E94
	for <lists+linux-arm-msm@lfdr.de>; Wed, 27 Aug 2025 11:17:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C257C685B79
	for <lists+linux-arm-msm@lfdr.de>; Wed, 27 Aug 2025 09:17:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D740A343D87;
	Wed, 27 Aug 2025 09:17:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="D6NvnX7f"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86137343D62
	for <linux-arm-msm@vger.kernel.org>; Wed, 27 Aug 2025 09:17:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756286252; cv=none; b=E2q7LVaEJt6g+lXreO/NAghHgAJ49GMiVZbgeKb+iTVnv8CLjycFJTpZYUNZbfd1w1HDNahA46b8r2grpyACoNFJ4ykQdjAzaYQbw78HFokHVWV25h5ppI8PaSl3SlYR2rtJGjt9oipdLXNT7Umkc1GcYhDZdES4Ps/vgUubRTQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756286252; c=relaxed/simple;
	bh=3TDravvIGkQGSnUlWMkvFFKCrY6S76fdgudXC4G2nrc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=JEBKtvXdN4uOB70GQPHcjc0GDa/iKWod7DTA+v+9igGf9fH2rnlH15Chf8QBAmUpMFfQFOlSDxs6vrefRvT+yDMwC6/6Y47pu3k5s59EDr/bZEIrhHsoL6zVPcvTidUtsTtq9jY65JaFeA8V5016WA46xCzJ5MmrdSprRrlvx2w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=D6NvnX7f; arc=none smtp.client-ip=209.85.221.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-3c79f0a5b8bso3252493f8f.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 27 Aug 2025 02:17:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1756286248; x=1756891048; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=8LoLKtox6RZvVwzEkSmrYfJeFK5b2yBrCHAYLgeBH+8=;
        b=D6NvnX7fRQcHg5dTKHK2eBBYiYnvIwWmkH6IRDnSoQi28OjhGiECZ8i7XnbT/O1CTt
         dfiyeBR3YpeSkVh3HqCzWqGSifzuq4qHHyBNAsscjFrx+Y6YQC+zOuFRRjv01eAKmZ83
         XwCwYE9BzN6DT30httDOPPb43SV0IC+YN/luAMdsfkn7h4NDVehP3ecbFffQaz/jm4hY
         LQRhSfa7xBakf49+XdGygRc4gwWoOCLJy5xHNFpUp84rhxpJxCJRew7AS/80C4NNiJZ6
         a53uFYn5v5gqbDRq49C3ZsU5Bf6xi/cxTbp692PGVkrV5VN8ut3qQBIUuLCar7usx0HK
         YmVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756286248; x=1756891048;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=8LoLKtox6RZvVwzEkSmrYfJeFK5b2yBrCHAYLgeBH+8=;
        b=XumE04dBIUoR8iAwbR20vzO1ksfj5nBHLqSFrCdPrvVsj7yPHfr0rZ6V9T/rOcd2K1
         MLLCkyCJ4VgOs+KysiZ9Y+lX95yxu9EsgVmxcs9cp2kLJTER+Y3iOWysI5JoiD0KBANI
         KlVEOGZ1NGsU7yWS7e3xaSZaH+U7GOoWeL+4JkoHBpvBjFl74CMhpxuSw7KJU8DXxNS8
         6vHr95nFTezzwHli9kH+aU9yLR5sNCNenrYw7PKqjGO5decqyrPtbdVk2bZYcIk/ROee
         qhKUfnGADBcaj/4BdwHx3fknWMGuL5/OpXRz6Tqa+V8mETt66+Yd7t0DtE7UUSIhlgs1
         HtJw==
X-Forwarded-Encrypted: i=1; AJvYcCWEgNLTKfRh/Ohsf8N9a1ebIubQMVTbZbvKz3uVMYsa5HFD8xQy7YmhJD1HPovLyWqXcje2laVfleysVt8l@vger.kernel.org
X-Gm-Message-State: AOJu0YwWOAzOK2cVzSzy4wjZeO2XAJlcVYgjK+BHhDI8S7xf7e55aprL
	WK9zURhpJOyEE1+wOxZvBB3S/3HD3YaXrVK2sYEY8Wtzt3tx44QR5sy0wBL22qcdpg0=
X-Gm-Gg: ASbGnct5Vyy3+PqgHBKgM166Z8ly2MxKE0syoWmNHmK9YjLZ5GaVyTBCtHlqlX7OQhq
	Uf8GaLZCvNhhbxMATFtdUxVMz/qYp6lf+bG8nuOBr5tKNQSNCAU/n3DrnncUJUnfe/v68vCtrBQ
	wk8QW+r9QtxsQAF8JnTDNNs7hu/pL3BwARnTT0yJnYBk3bzJJXAzAyOtgjmTeHOmLN/cDUQU3lc
	am/7rUiEPuZfQlZCxOGd2Oth6zXkkTGYIpPNEmq2wsadliXQ23RIm+aAHLHVkzRSHlgG4Nf2pLI
	EvCG3XWQktAHpbXMDYXtq8cPzcadAWxXkMvL7iine6GBRVvDf8fABOnioEYVWXQbNaL6E1gzF5N
	bVd8Ovu9eY2aIPv/nFU7SI1ZcQcrBCph/JA1u1xpSK3GsjppW
X-Google-Smtp-Source: AGHT+IEn2+Mqlva4eTiz/U9+4k0MFWsfnMZ4oB+8ctPeoze1Xi/Byz7VnuLxX/51r0/UZh1J91oxOg==
X-Received: by 2002:a05:6000:200f:b0:3c9:5df6:de3f with SMTP id ffacd0b85a97d-3c95df6e14fmr8753713f8f.24.1756286247700;
        Wed, 27 Aug 2025 02:17:27 -0700 (PDT)
Received: from [192.168.1.3] ([185.48.76.109])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3cc18f762b1sm3948817f8f.65.2025.08.27.02.17.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 27 Aug 2025 02:17:27 -0700 (PDT)
Message-ID: <b1f79a26-97e1-40f4-b076-51d5c2abe736@linaro.org>
Date: Wed, 27 Aug 2025 10:17:26 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/3] coresight: tpda: add sysfs node to flush specific
 port
To: Jie Gan <jie.gan@oss.qualcomm.com>
Cc: coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 Suzuki K Poulose <suzuki.poulose@arm.com>, Mike Leach
 <mike.leach@linaro.org>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 Tingwei Zhang <tingwei.zhang@oss.qualcomm.com>
References: <20250827042042.6786-1-jie.gan@oss.qualcomm.com>
 <20250827042042.6786-4-jie.gan@oss.qualcomm.com>
Content-Language: en-US
From: James Clark <james.clark@linaro.org>
In-Reply-To: <20250827042042.6786-4-jie.gan@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 27/08/2025 5:20 am, Jie Gan wrote:
> From: Tao Zhang <tao.zhang@oss.qualcomm.com>
> 
> Setting bit i in the TPDA_FLUSH_CR register initiates a flush request
> for port i, forcing the data to synchronize and be transmitted to the
> sink device.
> 
> Signed-off-by: Tao Zhang <tao.zhang@oss.qualcomm.com>
> Co-developed-by: Jie Gan <jie.gan@oss.qualcomm.com>
> Signed-off-by: Jie Gan <jie.gan@oss.qualcomm.com>
> ---
>   .../testing/sysfs-bus-coresight-devices-tpda  |  7 ++++
>   drivers/hwtracing/coresight/coresight-tpda.c  | 42 +++++++++++++++++++
>   drivers/hwtracing/coresight/coresight-tpda.h  |  2 +
>   3 files changed, 51 insertions(+)
> 
> diff --git a/Documentation/ABI/testing/sysfs-bus-coresight-devices-tpda b/Documentation/ABI/testing/sysfs-bus-coresight-devices-tpda
> index fb651aebeb31..2cf2dcfc13c8 100644
> --- a/Documentation/ABI/testing/sysfs-bus-coresight-devices-tpda
> +++ b/Documentation/ABI/testing/sysfs-bus-coresight-devices-tpda
> @@ -41,3 +41,10 @@ Contact:	Jinlong Mao <jinlong.mao@oss.qualcomm.com>, Tao Zhang <tao.zhang@oss.qu
>   Description:
>   		(RW) Configure the CMB/MCMB channel mode for all enabled ports.
>   		Value 0 means raw channel mapping mode. Value 1 means channel pair marking mode.
> +
> +What:		/sys/bus/coresight/devices/<tpda-name>/port_flush_req
> +Date:		August 2025
> +KernelVersion:	6.17
> +Contact:	Jinlong Mao <jinlong.mao@oss.qualcomm.com>, Tao Zhang <tao.zhang@oss.qualcomm.com>, Jie Gan <jie.gan@oss.qualcomm.com>
> +Description:
> +		(RW) Configure the bit i to requests a flush operation of port i on the TPDA.
> diff --git a/drivers/hwtracing/coresight/coresight-tpda.c b/drivers/hwtracing/coresight/coresight-tpda.c
> index 430f76c559f2..8b1fe128881d 100644
> --- a/drivers/hwtracing/coresight/coresight-tpda.c
> +++ b/drivers/hwtracing/coresight/coresight-tpda.c
> @@ -487,6 +487,47 @@ static ssize_t cmbchan_mode_store(struct device *dev,
>   }
>   static DEVICE_ATTR_RW(cmbchan_mode);
>   
> +static ssize_t port_flush_req_show(struct device *dev,
> +				   struct device_attribute *attr,
> +				   char *buf)
> +{
> +	struct tpda_drvdata *drvdata = dev_get_drvdata(dev->parent);
> +	unsigned long val;
> +
> +	if (!drvdata->csdev->refcnt)
> +		return -EINVAL;
> +
> +	guard(spinlock)(&drvdata->spinlock);
> +	CS_UNLOCK(drvdata->base);
> +	val = readl_relaxed(drvdata->base + TPDA_FLUSH_CR);
> +	CS_LOCK(drvdata->base);
> +	return sysfs_emit(buf, "%lx\n", val);

Still missing the 0x prefix

> +}
> +
> +static ssize_t port_flush_req_store(struct device *dev,
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
> +	if (!drvdata->csdev->refcnt || !val)
> +		return -EINVAL;
> +
> +	val |= FIELD_PREP(TPDA_MAX_INPORTS_MASK, val);

Using FIELD_PREP() now that it's the full width of the register makes 
less sense. Especially when there is no corresponding FIELD_FIT() check, 
  which is fine because everything always fits. But if you didn't know 
the mask was the full width you'd wonder if the check is missing.

I would just write val directly to TPDA_FLUSH_CR so it's simpler.

It should also have been val = FIELD_PREP(...)

> +	guard(spinlock)(&drvdata->spinlock);
> +	CS_UNLOCK(drvdata->base);
> +	writel_relaxed(val, drvdata->base + TPDA_FLUSH_CR);
> +	CS_LOCK(drvdata->base);
> +
> +	return size;
> +}
> +static DEVICE_ATTR_RW(port_flush_req);
> +
>   static struct attribute *tpda_attrs[] = {
>   	&dev_attr_trig_async_enable.attr,
>   	&dev_attr_trig_flag_ts_enable.attr,
> @@ -494,6 +535,7 @@ static struct attribute *tpda_attrs[] = {
>   	&dev_attr_freq_ts_enable.attr,
>   	&dev_attr_global_flush_req.attr,
>   	&dev_attr_cmbchan_mode.attr,
> +	&dev_attr_port_flush_req.attr,
>   	NULL,
>   };
>   
> diff --git a/drivers/hwtracing/coresight/coresight-tpda.h b/drivers/hwtracing/coresight/coresight-tpda.h
> index 8e1b66115ad1..56d3ad293e46 100644
> --- a/drivers/hwtracing/coresight/coresight-tpda.h
> +++ b/drivers/hwtracing/coresight/coresight-tpda.h
> @@ -10,6 +10,7 @@
>   #define TPDA_Pn_CR(n)		(0x004 + (n * 4))
>   #define TPDA_FPID_CR		(0x084)
>   #define TPDA_SYNCR		(0x08C)
> +#define TPDA_FLUSH_CR		(0x090)
>   
>   /* Cross trigger FREQ packets timestamp bit */
>   #define TPDA_CR_FREQTS		BIT(2)
> @@ -35,6 +36,7 @@
>   #define TPDA_SYNCR_MAX_COUNTER_VAL	(0xFFF)
>   
>   #define TPDA_MAX_INPORTS	32
> +#define TPDA_MAX_INPORTS_MASK	GENMASK(31, 0)
>   
>   /* Bits 6 ~ 12 is for atid value */
>   #define TPDA_CR_ATID		GENMASK(12, 6)


