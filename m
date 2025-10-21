Return-Path: <linux-arm-msm+bounces-78069-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id DD454BF4544
	for <lists+linux-arm-msm@lfdr.de>; Tue, 21 Oct 2025 03:56:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 6EF0A18A74F8
	for <lists+linux-arm-msm@lfdr.de>; Tue, 21 Oct 2025 01:57:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 18EB6137C52;
	Tue, 21 Oct 2025 01:56:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="nljDf+BV"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 080EE15D1
	for <linux-arm-msm@vger.kernel.org>; Tue, 21 Oct 2025 01:56:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761011814; cv=none; b=gX52yNEIC6smBITyc65kxNuavzOeoVxt+qkoBoQH6bXWEpeUXY+Nvyf6kn4mUxrJCh+yUgFFmjvixQZcP4eP/pHI6Ydu6DOLlmanY6FArrCyJSegM0HuyBfvaDEQMrWpvzjJgcyBWRAGXSsfcr3GcrEvbL+z2zBWKPQnZ9EEHqo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761011814; c=relaxed/simple;
	bh=70inpuk6Lse+0W7QP/pc3z5y88uNUueJSX3G89jXTZ4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=LGnNKcF+aM7x6MdBV1P558ykd87RxEXw7IR1ydLTJB8HO8UQk0gzUJjUys6W6dhLokkxV40lmF3PU+yoSOq8wFWt2vV8vvJdl/JPnm20ku7vlnophwuhNlws2oNCpDnS95+ARp+PUUgFT5L7e7SNgjY8yvZIUdHB5EJ/XAf976o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=nljDf+BV; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59KL19HI024879
	for <linux-arm-msm@vger.kernel.org>; Tue, 21 Oct 2025 01:56:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	izhTeIV2e9xijy8tq2CEayUpGN/P5cZH+g7aMRXy4c8=; b=nljDf+BVMHNp6Rvl
	KarIsPrhhyW2mBIOmLBnKAq5faH/3tzjT/mbnfArA5ADGZrXAolo5kN1DbhDmc78
	tZYIfLEgUeUxFDjAthFRr0VyHMHn5bGMzEUZAg2+MWewa1tZgr5/5QJhhJXMD68K
	Sw7P0rob08isnPy1tdagkLRl0TdDdd8mqOzCbfVXsIXJv+jfNLBJg+h/BPjftEv1
	GpxUbxtwpVIyO6MenkYFg4ImqV77WyaHtBk+xW/QNtzBulkH01uH+riFnP3LZox1
	A9CSsstHn38kX5m4MkRQKsKcJHBBI6bvZSdtb7RY4bXFza1hLqXgp2GNpvbogH/p
	lDcExQ==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49wsws1346-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 21 Oct 2025 01:56:50 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-780f914b5a4so4584797b3a.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 20 Oct 2025 18:56:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761011810; x=1761616610;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=izhTeIV2e9xijy8tq2CEayUpGN/P5cZH+g7aMRXy4c8=;
        b=fzP/ccolHfjGIjCFqfiPVCQeR7nvAWVmozE8MZzVfXA86QsFx0a7y8/XShtX815ydv
         EErLilh9fXRWL49sJtzQVOdgMIgXRgl6H6CeYQQq9S8AM3K6eUBL9spLKb21oTdLfmpr
         ROz9ds8//FnEUewmVHWvM9DyGZYKpnVD2fubunh5ieEhEs48G44tNbVFfuIK5GhLa/Mt
         O55fGsUNNR77CN6PoGLYDBT1IpZvMkEedq2vgK7MiC8uZJvkckB45QPIf2zlPA+Na0fJ
         zd5E27HqznBQMOHb1hpfsvYsXn+DoLZePK0lXpR/EyK7maIRvGLX+XHmJRvXaqZhIgm3
         1AMQ==
X-Forwarded-Encrypted: i=1; AJvYcCXcGKdGI74CPHJFQZXiqV0FnV5mREg9ITORsaqnv+guU4OV8+25V5OEc+/QMacDbrEDeuYL9dymurKRSOCY@vger.kernel.org
X-Gm-Message-State: AOJu0YyononkGm75h4xhlDVwd4YvY8rx5v7E4y2IAF7DCbrCC9vytUjw
	T7tZfJ7M2StMB193mDU1Nz7Wp7eEF8FHpJXMREUCCo1uvap8BNyR0S5ejaAoY5f0PuM5fQC+2xP
	AWF5CnZ0xijo3tRwwZitN5QzWUSIE0W4K4T8eSyJN10Bosxz7WAKNgcUlNXzfiC0kw4xh
X-Gm-Gg: ASbGnctpcYBgsP7pEvrNPcuzI9jmhON8DJNZa8R7cLzxFTo55S47XsIJ9/+I8kRNH9c
	XOirkt2IETY3Qcfet+Nft9l9jJ/PTKiKxV3q9qx7OqpuVZyy1nKF99uBU0xPq/aGTueS7LlkHES
	n7ck7ZpG28be9SRttfibhkG8toSnwlKd7RPIqn5gcVZAeXt66goz6ehClQzfn5ALpTZggQL1w5b
	jyPani8BBjVvw3rNOdVu0//wN0r9QHd4FRDhkmbTh0hbYD6LZxVHT09FyMNglbXm8oHV8Qn+Gtz
	PBxeJd35vx9fpyBATqGCBT2LuSXRki1B3WxfJegbSGT2aYIZ/3QRe9Z1Uj/iNp7rl9PFBlFHJ5A
	GGRXbbaqrKjwtbpu7benwFUc4ho165qevbi969tjXqG5tUTs00dDO8AeCQ6wuTBbF
X-Received: by 2002:a05:6a00:2e03:b0:781:17ba:ad76 with SMTP id d2e1a72fcca58-7a220b34252mr18292571b3a.24.1761011809461;
        Mon, 20 Oct 2025 18:56:49 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE3UpsB5sbvHyYTrr9etsD3AraqUiTnb3KgXNq2kLmRCdX0oNZ7KV05IVAcmSlESGas5oeemw==
X-Received: by 2002:a05:6a00:2e03:b0:781:17ba:ad76 with SMTP id d2e1a72fcca58-7a220b34252mr18292534b3a.24.1761011808902;
        Mon, 20 Oct 2025 18:56:48 -0700 (PDT)
Received: from [10.133.33.105] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7a22ff34adasm9601087b3a.19.2025.10.20.18.56.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 20 Oct 2025 18:56:48 -0700 (PDT)
Message-ID: <6e6c3034-221c-4e79-8971-7bfbe26f91a6@oss.qualcomm.com>
Date: Tue, 21 Oct 2025 09:56:43 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] coresight: ETR: Fix ETR buffer use-after-free issue
To: Leo Yan <leo.yan@arm.com>, Xiaoqi Zhuang <xiaoqi.zhuang@oss.qualcomm.com>
Cc: Suzuki K Poulose <suzuki.poulose@arm.com>,
        Mike Leach <mike.leach@linaro.org>,
        James Clark <james.clark@linaro.org>,
        Alexander Shishkin <alexander.shishkin@linux.intel.com>,
        coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
References: <20251020-fix_etr_issue-v1-1-902ab51770b4@oss.qualcomm.com>
 <20251020143718.GH281971@e132581.arm.com>
Content-Language: en-US
From: Jie Gan <jie.gan@oss.qualcomm.com>
In-Reply-To: <20251020143718.GH281971@e132581.arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDIwMDE0OCBTYWx0ZWRfX4uwpOpL8A9MS
 4Ybsjj/GBiWTFfTAYf24qAFXOZcfFw/emfUyaxmY7doCutU8aIZXbrx4drFRK2vyzSPmvgkVMCp
 M/VuWFmqRFmbhVGHhmewWv6jMTwtsBVxjD4k3Tleet1OzD14YfakRv1/NWaCBPh7yJ89OU2gyfE
 1fRM3dpQBlfZKMfPgcbPKWSvVufZK6mmMBeQDUoSaGGDl5RXLZufvrNCG+bmX/tvD0EWO9lk635
 u+0hIfwhLYxU+CgWfLH+/26el4ZObTkscYQnVtWcZNk0OHw2AMPZ4DaZZKkZ0Cc3C7ZA4wIsfL+
 zo6eeHudNcAHAAHWDQ7kIGp6bNj36HmPKJhGNq7KnbvErznZ5KLI5G93IwUk6E1bjRpoHlOR+jI
 wD9nkqK/jqUPptUi7pn3XXqy+DiybQ==
X-Proofpoint-GUID: Pj67YipRqp4OB-g8cHOjSCdbWjUJAGqK
X-Proofpoint-ORIG-GUID: Pj67YipRqp4OB-g8cHOjSCdbWjUJAGqK
X-Authority-Analysis: v=2.4 cv=a+E9NESF c=1 sm=1 tr=0 ts=68f6e862 cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=U0zv61LCSj-UQdD20V0A:9 a=QEXdDO2ut3YA:10 a=IoOABgeZipijB_acs4fv:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-20_07,2025-10-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 spamscore=0 clxscore=1015 priorityscore=1501 phishscore=0
 bulkscore=0 suspectscore=0 malwarescore=0 impostorscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510020000 definitions=main-2510200148



On 10/20/2025 10:37 PM, Leo Yan wrote:
> On Mon, Oct 20, 2025 at 05:06:46PM +0800, Xiaoqi Zhuang wrote:
>> When ETR is enabled as CS_MODE_SYSFS, if the buffer size is changed
>> and enabled again, currently sysfs_buf will point to the newly
>> allocated memory(buf_new) and free the old memory(buf_old). But the
>> etr_buf that is being used by the ETR remains pointed to buf_old, not
>> updated to buf_new. In this case, it will result in a memory
>> use-after-free issue.
> 
> I struggled to understand how to reproduce the issue under the condition
> "if the buffer size is changed and enabled again."
> 
> I don't think the flow below where the trace is re-enabled would cause
> an issue:
> 
>    - Step 1: Enable trace path between ETM0 -> ETR0;
>    - Step 2: Change the buffer size for ETR0;
>    - Step 3: Disable trace path between ETM0 -> ETR0;
>    - Step 4: Enable again trace path between ETM0 -> ETR0.
> 
> In this case, step3 releases the buffer and update "drvdata->etr_buf" to
> NULL, and step 4 allocates a new buffer and assign it to
> "drvdata->etr_buf".
> 
> The problem should occur when operating on two trace paths, E.g.,
> 
>    - Step 1: Enable trace path between ETM0 -> ETR0;
>    - Step 2: Change the buffer size for ETR0;
>    - Step 3: Enable trace path between ETM1 -> ETR0;
> 
> In step3, the driver releases the existed buffer and allocate a new one.
> At the meantime, "drvdata->etr_buf" still holds the buffer allocated in
> step 1.

That's the scenario of the issue. The system will report a segmentation 
error when the driver try to sync the freed etr_buf.

> 
>> Fix this by checking ETR's mode before updating and releasing buf_old,
>> if the mode is CS_MODE_SYSFS, then skip updating and releasing it.

I agree. We should bail out as earlier as possible to gain some 
performance efficiency.

> 
> Given that we now have a couple of reported issues related to ETR mode,
> I'd like to refactor the ETR mode handling and its reference counting
> thoroughly.  I've drafted a large change (it's quite big, but we can
> split it into small patches if we agree to proceed).
> 
> Thanks for reporting the issue!
> 
> Leo
> 
> ---8<---
> 
> diff --git a/drivers/hwtracing/coresight/coresight-tmc-etr.c b/drivers/hwtracing/coresight/coresight-tmc-etr.c
> index b07fcdb3fe1a..d0fac958c614 100644
> --- a/drivers/hwtracing/coresight/coresight-tmc-etr.c
> +++ b/drivers/hwtracing/coresight/coresight-tmc-etr.c
> @@ -1241,6 +1241,8 @@ static struct etr_buf *tmc_etr_get_sysfs_buffer(struct coresight_device *csdev)
>   	struct tmc_drvdata *drvdata = dev_get_drvdata(csdev->dev.parent);
>   	struct etr_buf *sysfs_buf = NULL, *new_buf = NULL, *free_buf = NULL;
>   
> +	WARN_ON(coresight_get_mode(csdev) != CS_MODE_SYSFS);

I think we should check the WARN_ON result and exit if there is an error?

> +
>   	/*
>   	 * If we are enabling the ETR from disabled state, we need to make
>   	 * sure we have a buffer with the right size. The etr_buf is not reset
> @@ -1263,7 +1265,7 @@ static struct etr_buf *tmc_etr_get_sysfs_buffer(struct coresight_device *csdev)
>   		raw_spin_lock_irqsave(&drvdata->spinlock, flags);
>   	}
>   
> -	if (drvdata->reading || coresight_get_mode(csdev) == CS_MODE_PERF) {
> +	if (drvdata->reading) {
>   		ret = -EBUSY;
>   		goto out;
>   	}
> @@ -1292,30 +1294,14 @@ static int tmc_enable_etr_sink_sysfs(struct coresight_device *csdev)
>   	int ret = 0;
>   	unsigned long flags;
>   	struct tmc_drvdata *drvdata = dev_get_drvdata(csdev->dev.parent);
> -	struct etr_buf *sysfs_buf = tmc_etr_get_sysfs_buffer(csdev);
> +	struct etr_buf *sysfs_buf;
>   
> +	sysfs_buf = tmc_etr_get_sysfs_buffer(csdev);
>   	if (IS_ERR(sysfs_buf))
>   		return PTR_ERR(sysfs_buf);
>   
>   	raw_spin_lock_irqsave(&drvdata->spinlock, flags);
> -
> -	/*
> -	 * In sysFS mode we can have multiple writers per sink.  Since this
> -	 * sink is already enabled no memory is needed and the HW need not be
> -	 * touched, even if the buffer size has changed.
> -	 */
> -	if (coresight_get_mode(csdev) == CS_MODE_SYSFS) {
> -		csdev->refcnt++;
> -		goto out;
> -	}
> -
>   	ret = tmc_etr_enable_hw(drvdata, sysfs_buf);
> -	if (!ret) {
> -		coresight_set_mode(csdev, CS_MODE_SYSFS);
> -		csdev->refcnt++;
> -	}
> -
> -out:
>   	raw_spin_unlock_irqrestore(&drvdata->spinlock, flags);
>   
>   	if (!ret)
> @@ -1735,11 +1721,6 @@ static int tmc_enable_etr_sink_perf(struct coresight_device *csdev, void *data)
>   	struct etr_perf_buffer *etr_perf = etm_perf_sink_config(handle);
>   
>   	raw_spin_lock_irqsave(&drvdata->spinlock, flags);
> -	 /* Don't use this sink if it is already claimed by sysFS */
> -	if (coresight_get_mode(csdev) == CS_MODE_SYSFS) {
> -		rc = -EBUSY;
> -		goto unlock_out;
> -	}
>   
>   	if (WARN_ON(!etr_perf || !etr_perf->etr_buf)) {
>   		rc = -EINVAL;
> @@ -1759,18 +1740,14 @@ static int tmc_enable_etr_sink_perf(struct coresight_device *csdev, void *data)
>   	 * No HW configuration is needed if the sink is already in
>   	 * use for this session.
>   	 */
> -	if (drvdata->pid == pid) {
> -		csdev->refcnt++;
> +	if (drvdata->pid == pid)
>   		goto unlock_out;
> -	}
>   
>   	rc = tmc_etr_enable_hw(drvdata, etr_perf->etr_buf);
>   	if (!rc) {
>   		/* Associate with monitored process. */
>   		drvdata->pid = pid;
> -		coresight_set_mode(csdev, CS_MODE_PERF);
>   		drvdata->perf_buf = etr_perf->etr_buf;
> -		csdev->refcnt++;
>   	}
>   
>   unlock_out:
> @@ -1778,17 +1755,76 @@ static int tmc_enable_etr_sink_perf(struct coresight_device *csdev, void *data)
>   	return rc;
>   }
>   
> +static int tmc_acquire_mode(struct coresight_device *csdev, enum cs_mode mode)
> +{
> +	struct tmc_drvdata *drvdata = dev_get_drvdata(csdev->dev.parent);
> +
> +	if (mode != CS_MODE_SYSFS && mode != CS_MODE_PERF)
> +		return -EINVAL;
> +
> +	scoped_guard(raw_spinlock_irqsave, &drvdata->spinlock);
> +
> +	if (coresight_get_mode(csdev) == CS_MODE_DISABLED) {
> +		if (!csdev->refcnt)
> +			coresight_set_mode(csdev, mode);
> +		csdev->refcnt++;
> +	} else if (coresight_get_mode(csdev) != mode) {
> +		ret = -EBUSY;
> +	}
> +
> +	return csdev->refcnt;
> +}
> +
> +static void tmc_release_mode(struct coresight_device *csdev, enum cs_mode mode)
> +{
> +	struct tmc_drvdata *drvdata = dev_get_drvdata(csdev->dev.parent);
> +
> +	scoped_guard(raw_spinlock_irqsave, &drvdata->spinlock);
> +
> +	if (WARN_ON(coresight_get_mode(csdev) != mode))
> +		return;

the mode here could be set to any CS_MODE, so I think it's possible to 
encounter the secenario below:

coresight_get_mode(csdev) == CS_MODE_DISABLED, mode == CS_MODE_DISABLED,

With the condition, the csdev->refcnt will go to negative number?

> +
> +	csdev->refcnt--;
> +	if (!csdev->refcnt)
> +		coresight_set_mode(csdev, CS_MODE_DISABLED);
> +}
> +
>   static int tmc_enable_etr_sink(struct coresight_device *csdev,
>   			       enum cs_mode mode, void *data)
>   {
> +	unsigned long flags;
> +	struct tmc_drvdata *drvdata = dev_get_drvdata(csdev->dev.parent);
> +	int ret;
> +
> +	ret = tmc_acquire_mode(csdev, mode);
> +	if (ret < 0)
> +		return ret;
> +
> +	/*
> +	 * For sysfs mode, the higher level mutex ensures exclusively
> +	 * enabling sink, it is safe to bail out if this is not the
> +	 * first time to enable sink.
> +	 *
> +	 * A perf session can enable the same sink simultaneously, fall
> +	 * through to call tmc_enable_etr_sink_perf() to ensure the sink
> +	 * has been enabled.
> +	 */
> +	if (mode == CS_MODE_SYSFS && ret > 1)
> +		return 0;
> +
>   	switch (mode) {
>   	case CS_MODE_SYSFS:
> -		return tmc_enable_etr_sink_sysfs(csdev);
> +		ret = tmc_enable_etr_sink_sysfs(csdev);
>   	case CS_MODE_PERF:
> -		return tmc_enable_etr_sink_perf(csdev, data);
> +		ret = tmc_enable_etr_sink_perf(csdev, data);
>   	default:
> -		return -EINVAL;
> +		ret = -EINVAL;
>   	}
> +
> +	if (ret)
> +		tmc_release_mode(csdev, mode);
> +
> +	return ret;
>   }
>   
>   static int tmc_disable_etr_sink(struct coresight_device *csdev)
> @@ -1796,30 +1832,20 @@ static int tmc_disable_etr_sink(struct coresight_device *csdev)
>   	unsigned long flags;
>   	struct tmc_drvdata *drvdata = dev_get_drvdata(csdev->dev.parent);
>   
> -	raw_spin_lock_irqsave(&drvdata->spinlock, flags);
> +	tmc_release_mode(csdev, mode);

mode here is undefined?

Thanks,
Jie

>   
> -	if (drvdata->reading) {
> -		raw_spin_unlock_irqrestore(&drvdata->spinlock, flags);
> -		return -EBUSY;
> -	}
> +	scoped_guard(raw_spinlock_irqsave, &drvdata->spinlock);
>   
> -	csdev->refcnt--;
> -	if (csdev->refcnt) {
> -		raw_spin_unlock_irqrestore(&drvdata->spinlock, flags);
> +	if (csdev->refcnt || drvdata->reading)
>   		return -EBUSY;
> -	}
>   
> -	/* Complain if we (somehow) got out of sync */
> -	WARN_ON_ONCE(coresight_get_mode(csdev) == CS_MODE_DISABLED);
> +	if (drvdata->pid == -1)
> +		return 0;
> +
>   	tmc_etr_disable_hw(drvdata);
> -	/* Dissociate from monitored process. */
> -	drvdata->pid = -1;
> -	coresight_set_mode(csdev, CS_MODE_DISABLED);
>   	/* Reset perf specific data */
>   	drvdata->perf_buf = NULL;
>   
> -	raw_spin_unlock_irqrestore(&drvdata->spinlock, flags);
> -
>   	dev_dbg(&csdev->dev, "TMC-ETR disabled\n");
>   	return 0;
>   }
> 


