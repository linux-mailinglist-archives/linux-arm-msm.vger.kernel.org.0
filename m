Return-Path: <linux-arm-msm+bounces-70865-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id B2878B358D7
	for <lists+linux-arm-msm@lfdr.de>; Tue, 26 Aug 2025 11:27:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 1C3254E0684
	for <lists+linux-arm-msm@lfdr.de>; Tue, 26 Aug 2025 09:27:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E30582F90C9;
	Tue, 26 Aug 2025 09:27:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="sdC6WILg"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E935C2D29C8
	for <linux-arm-msm@vger.kernel.org>; Tue, 26 Aug 2025 09:27:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756200470; cv=none; b=jklH2YRKXf5T7+RDzFlzscc3bKFHh+BgtYm8YouCpxEdkDUoEaF8//JiNflI64oxeUD0IpTCD3Hl9bb7tJMwxMwZB0+JsbrD25xFFlEwu1rt1thEa+Y6TT/m2RjzKbtyk6nAJwSYVaMCTeYlcmU3P7lxRTD0i3cCQQSo5vqXouc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756200470; c=relaxed/simple;
	bh=aAmfAPH3Qk6KURQiF4RbC2saNto0/CEB7lS82gjYhfY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=EMLEWo3RNpQcbJ9OXH1KBxahImWmfSpLebUuKuGITI1oX2AwSrs4HFoU3488zwQyVXu2RRNbpsfi3qzXC0Y1uemRR2/5iRDX2Zy8T7t3YPq2Qhi7IirIkIr5pBmIASsosNA1I2aQZ+ZGhvpuKdjKQu7YErjg96Ce3EINUiqTmBU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=sdC6WILg; arc=none smtp.client-ip=209.85.221.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-3c51f0158d8so4024261f8f.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 26 Aug 2025 02:27:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1756200467; x=1756805267; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=qLqmIwK8NZ6hSazvQk4aM7oVEZe5wm9tqFDFQ8D7Dao=;
        b=sdC6WILg11PfURPySM8OuTXOJ1kWPObl4BXh7fT5B5HqVkarxNf8iFfklzf/jW5Yio
         VVYmsQJM7IPFSNgNNux35RTRT/fypFwFhvTOg2KfEPkI6+4HCyKgnobdoJ9/5c7ON1fU
         9hXRZfnAP73R7UemERI9R0QSD2RQx1dGP7Mve2yiXvnvzXr4HizJmlnaUQR73Hv2u2C/
         3Zh1IodCdFWLSIzF4bh66s2y80uLd5zQsx5NzTEXV1d0tbUT85xyLYxnMCS/NO/Y4OAR
         hb5kgEiuj+hCK3Hro+ktvTTTarae25SZ1mLC1xHTooSenTuLYIBFIVyszO5fjzDfl4Qm
         Tosg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756200467; x=1756805267;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=qLqmIwK8NZ6hSazvQk4aM7oVEZe5wm9tqFDFQ8D7Dao=;
        b=XnDU/Tw0iHQKLNnUKRM/XsZRAbTZACLBdQvZ6aksxNMGy6NAi7BkyDJaigNiuhXbKW
         F1xteQyOWer51+KKNwo25dqmfqqMoAyOGUUDW8Sy7IbKaR2MjIBY1XtCsQxOvV8MXR9Z
         6PtFsRzE61kPYhqJcJ7djCzL0Xcv577fD/zvh2JF65aAU9ozsc85Z4mscdnrnxgiWLmk
         XIa1OQG/F9I4lZQ918q8fLlWVaDW7yQrJb+Zqqi6K+Srz48OO00iRlZVnLNe76xoZk+h
         aXhbTShTusuA2kR1HfobjAq89Rr2J9Aaqs7Q6jJNXn76GekE8xumi6I3uqXtVkvJRnnK
         +yIg==
X-Forwarded-Encrypted: i=1; AJvYcCU3grwWlr7+bjjTv8xMOahlrFKU6tau+nkDpk9f9Yur8XBhFf9Qg6/sYUejeYcPN9Kyw/oRcJPPfrtg1+lj@vger.kernel.org
X-Gm-Message-State: AOJu0YydXjK77S/e6HkqLGY8EzKgiODKegHo4gdR8OxrfsUygQ7CSW50
	VEM7a36zAkV/NfuzH2Qs+Sn1PXYTaSm76doNFwc///I+3U03owJdyq0+h3KNvDFIok0=
X-Gm-Gg: ASbGncth8aVYAr8Xx5Wr6uWlfAsoGE/wVJzmu0Y/yVX5f4BIZMXsGCYbVqmuibfFXmY
	RKMDlqb3Zc9xs+s7eZDCW7eTjz6GOq+lwW43XW3uwdwRS0S19d5Yl4VCphkUsCHy8iGTTMt052L
	nGwxx5wtrCSZsVMv6b6jDvfDNRQFuUoMXRVaL8yGPilqBKaUriAfJjnDi4wRRxs2EpDZRgo1Dtn
	4Cs/yZaq6g7NCguCWD30MWuEEoXpBxRddPrEgIqhz0E54Qdpg74IvLJ9F6g6cI9JDH973ubpxrM
	zdjskR1uD9dAuiyIF6AhI6/drxHaAq4MR+1W3xlQpaDyovvVlxpiKzScLRmvEJPT7B0bFJwwlcz
	07zRIVO45LWKEph9zhtBf0Kh2igsCkhBqNlnKjA==
X-Google-Smtp-Source: AGHT+IFbIYlKW54tLzTd2qlLQcjlN/Yji9BCemb4M6ZN8HZ69VKZDUD6dqfqBp/gsz3qgvx86VJf2w==
X-Received: by 2002:a05:6000:4011:b0:3b9:13e4:9693 with SMTP id ffacd0b85a97d-3c5dcc0c457mr10671415f8f.52.1756200467087;
        Tue, 26 Aug 2025 02:27:47 -0700 (PDT)
Received: from [192.168.1.3] ([185.48.76.109])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45b5ef818d3sm86633675e9.12.2025.08.26.02.27.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 26 Aug 2025 02:27:46 -0700 (PDT)
Message-ID: <3ac2954e-5663-4ea0-bc1d-a09e1992af5b@linaro.org>
Date: Tue, 26 Aug 2025 10:27:45 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 3/3] coresight: tpda: add sysfs node to flush specific
 port
To: Jie Gan <jie.gan@oss.qualcomm.com>
Cc: coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 Suzuki K Poulose <suzuki.poulose@arm.com>, Mike Leach
 <mike.leach@linaro.org>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 Tingwei Zhang <tingwei.zhang@oss.qualcomm.com>
References: <20250826070150.5603-1-jie.gan@oss.qualcomm.com>
 <20250826070150.5603-4-jie.gan@oss.qualcomm.com>
Content-Language: en-US
From: James Clark <james.clark@linaro.org>
In-Reply-To: <20250826070150.5603-4-jie.gan@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 26/08/2025 8:01 am, Jie Gan wrote:
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
>   .../testing/sysfs-bus-coresight-devices-tpda  |  7 +++
>   drivers/hwtracing/coresight/coresight-tpda.c  | 45 +++++++++++++++++++
>   drivers/hwtracing/coresight/coresight-tpda.h  |  1 +
>   3 files changed, 53 insertions(+)
> 
> diff --git a/Documentation/ABI/testing/sysfs-bus-coresight-devices-tpda b/Documentation/ABI/testing/sysfs-bus-coresight-devices-tpda
> index e827396a0fa1..8803158ba42f 100644
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
> index 9e623732d1e7..c5f169facc51 100644
> --- a/drivers/hwtracing/coresight/coresight-tpda.c
> +++ b/drivers/hwtracing/coresight/coresight-tpda.c
> @@ -509,6 +509,50 @@ static ssize_t cmbchan_mode_store(struct device *dev,
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
> +	guard(spinlock)(&drvdata->spinlock);
> +	if (!drvdata->csdev->refcnt)
> +		return -EPERM;
> +
> +	val = readl_relaxed(drvdata->base + TPDA_FLUSH_CR);
> +	return sysfs_emit(buf, "%lx\n", val);

Decimal would be better for a port number that goes from 0 - 127. If you 
really want to use hex then don't you need to prefix it with 0x? 
Otherwise you can't tell the difference between decimal 10 and hex 10, 
and it's not documented that it's hex either.

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
> +	/* The valid value ranges from 0 to 127 */
> +	if (val > 127)
> +		return -EINVAL;
> +
> +	guard(spinlock)(&drvdata->spinlock);
> +	if (!drvdata->csdev->refcnt)
> +		return -EPERM;
> +
> +	if (val) {

If 0 - 127 are valid don't you want to write 0 too?

> +		CS_UNLOCK(drvdata->base);
> +		writel_relaxed(val, drvdata->base + TPDA_FLUSH_CR);
> +		CS_LOCK(drvdata->base);
> +	}
> +
> +	return size;
> +}
> +static DEVICE_ATTR_RW(port_flush_req);
> +
>   static struct attribute *tpda_attrs[] = {
>   	&dev_attr_trig_async_enable.attr,
>   	&dev_attr_trig_flag_ts_enable.attr,
> @@ -516,6 +560,7 @@ static struct attribute *tpda_attrs[] = {
>   	&dev_attr_freq_ts_enable.attr,
>   	&dev_attr_global_flush_req.attr,
>   	&dev_attr_cmbchan_mode.attr,
> +	&dev_attr_port_flush_req.attr,
>   	NULL,
>   };
>   
> diff --git a/drivers/hwtracing/coresight/coresight-tpda.h b/drivers/hwtracing/coresight/coresight-tpda.h
> index 00d146960d81..55a18d718357 100644
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


