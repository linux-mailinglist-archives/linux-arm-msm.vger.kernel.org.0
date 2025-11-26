Return-Path: <linux-arm-msm+bounces-83494-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id F1D58C8B0C7
	for <lists+linux-arm-msm@lfdr.de>; Wed, 26 Nov 2025 17:48:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 54F703B10DA
	for <lists+linux-arm-msm@lfdr.de>; Wed, 26 Nov 2025 16:48:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5F06533E36C;
	Wed, 26 Nov 2025 16:48:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="AErVJUXl";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ExVJIblv"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6A1533E364
	for <linux-arm-msm@vger.kernel.org>; Wed, 26 Nov 2025 16:48:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764175723; cv=none; b=SLVW5n3HKCZWCvZCjU5/yAJpf9RaQZceEd+UgsFjkNSifAjpaQJgEOruN1HLI1ANQ5s4E89RzMT1ooxxciR1uA2ldQDQSgkJ6NKKJFUG+gEZQNEqQhG8aE+0/Z7rz7ouUPMbR+ytfe83TcMCuAcq0J8wLg0JbvFdILaLbEbpsak=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764175723; c=relaxed/simple;
	bh=kfuqmdCtdxlkixaFK3H5Y4g7IzEnEA9TSYkm7sTsuos=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=dVG8QTBql4eBNy2thhZAMemTA2MEdE/90hY8thw+rjkRlFbA3Bm+e8Iz6omUEU8bDOFwOL3VQ0VbexXIgc7k9rAME1nOogbpfZs5r9Ugv3TW+U8T/dvoSg+MaqkS6ftEJbHXw0TiQd0w0ahUDdiqDMtlFDmBOmlXoe7Q28nbM7w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=AErVJUXl; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ExVJIblv; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AQF52RZ1457049
	for <linux-arm-msm@vger.kernel.org>; Wed, 26 Nov 2025 16:48:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	aHM6jCJNGK0LMOn0tJ544+R1V0yvBIYNFR/1KmRTz9I=; b=AErVJUXl3l8gt3h4
	UQzRkAjsIiEg72eCfsPHd28d/5KdxhQUZe7+VHpGULU4hvJGVcXynkL5ZrnRI21f
	bHTGI9+sG0F0ndDEIdJlFVcSu7eAYU2oCUkojm7iaoCJA7DT6Z94HWzdcURppaa+
	XwS4Eq4QU4OU1vKnT9ZO2zUod2SLWOfTmueAmeclPL3C2wyz3XrHP8yqsQErqa7l
	pUTgqCBwVJCCeS/h1YeItV479Qx92Oe/iQ3o21CcPjYPckxr1d8E+zA9ct/AiMvJ
	kUD7n2g7vFybwdo6IOJZfjjmviG/YIGAZAMeRV4EVv321GTDuNiDfLZVh9xIfaIn
	MfXyyA==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4anvqvhpa1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 26 Nov 2025 16:48:39 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-297dfae179bso174977615ad.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 26 Nov 2025 08:48:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1764175719; x=1764780519; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=aHM6jCJNGK0LMOn0tJ544+R1V0yvBIYNFR/1KmRTz9I=;
        b=ExVJIblv176Pb2E1SVt/wnlOUkTKTG750WyKv1rwHez0dOIptbovavPYvdX0CXduvY
         pJOaTkqkf5GIewhrWxCGojHyPfva/OVuTOg5vvflcp1Az//tcDFfQ6+e2S0oo0qNE7T4
         UEioMAOgMVDhvvvqZoOuMXm/RmqPfZTPZN1zOz6FA5yoQ+6F33fxIqdv05Fwu0C6Uj3C
         aqVm3WDHRQJznyIyaPujSz0OMyFgqbg32sZcsbG+AhflIeWITj8qWFuY22sVEeQJsHBK
         4Tw7WnX5Sx3kVKegb49WZFAGm82eM1Nc/HhOKInFiycT51K+crKiKdmTl5wty7olfbzz
         diBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764175719; x=1764780519;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=aHM6jCJNGK0LMOn0tJ544+R1V0yvBIYNFR/1KmRTz9I=;
        b=JCQcwZxEA3mwHFvzaK8q7tpVVrI1Z7Xi7kAFgf1e/MBE8E7iL1qiua0OjeADTid+Ez
         8m1cs9la6vvaosGR4eEVUuPsNj7NC7DPK3Ra2GbUB29hNhzdVej8e8ygfawV21SEolIL
         dkt/jgFFBe14UZOiJPm5tnSVngP7xfTiS3Ic0XB0AM19d8J8XqcIvzaY4YQLQU8i8RbV
         RHvWffgCuK5+eSSNBYjufa54QCx4Nh+nkyIJzFfu8p3bnzWM+TpcNcA8e+YelFubIgqh
         MFJSJsFqKVrX0W5de6GIeWagDaF2CCHuLB8txdEU51512XQhtbAigDjv9aKyXl8FfEJb
         nGsQ==
X-Forwarded-Encrypted: i=1; AJvYcCXf2CQb8PrT5aVSFadXEZl+IvYt2OvFqczwZV1n+37cG7DLdWRlI7iqSngpULyoKUY4jYSkplTugO4InGy9@vger.kernel.org
X-Gm-Message-State: AOJu0YwYQ8lIoYRirbZGZ+nD5efejjsEBndSlmbF2ztbxh5K0MjdSMMr
	DkcoSTFIdX/BOfhTud1qWR6uxbQOFw688fjfT+3oBByV8zOfw6bvCGgaM6XZLdfccYKdtpzM9dE
	ZTg1ttcCJrz2BowOd9ShTCWa0BM8ZolPjIPPa8V8P/7RMHrISbjmRTH4lYF62Tw0/fpt1lykCZ8
	2O
X-Gm-Gg: ASbGnctajNKwpt3m/DNbA3FQi0dg1VRSFOm5y18IhEHaKiARVe6nOMIWlMfoLuRhsMl
	49aPTt5UE8YX+PACV3Bm806wzFYvuNuh3BDcd4oNEuUJZvN96ufSOT34Jp/DfBq9rT0gUbHZDh+
	32jcRsRt96lUt6z15TRr0qg4vgkMruRQi+L/9Z/OKqgptqucMYJvCZh5fVSP75FD04qg9qRkb/x
	xHOrM08BG6UPGX9f8u4Rx06iV5XnBrZy8bJ//BdfVwd2VjNIRwTxorC8wR8lARity1kht0j2cTz
	pz1tdcKmsa3VXt6YF9+5M0pUhAPp1a55S+MzUGvr0gtOnKMOIDX/ZJw6gvTYEc/+wOdHy01jObo
	zHRzo+C4UepTkbTGEYGgyhYCIgHGvZdgh0asM0zP8unk=
X-Received: by 2002:a17:902:ef45:b0:298:3aa6:c034 with SMTP id d9443c01a7336-29b6bf3bc3fmr212667285ad.32.1764175718592;
        Wed, 26 Nov 2025 08:48:38 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFBWQYDQr9ndJ4Crtqjd3B3u4hFrEFFJmbjhTHPdiH1oJSLqObpmK8vwOjJoIw654wEOyN4xw==
X-Received: by 2002:a17:902:ef45:b0:298:3aa6:c034 with SMTP id d9443c01a7336-29b6bf3bc3fmr212667015ad.32.1764175718074;
        Wed, 26 Nov 2025 08:48:38 -0800 (PST)
Received: from [10.216.6.208] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29b5b138bfdsm198886785ad.22.2025.11.26.08.48.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 26 Nov 2025 08:48:37 -0800 (PST)
Message-ID: <dda61a49-90b1-ef48-5a46-d6953cd5375a@oss.qualcomm.com>
Date: Wed, 26 Nov 2025 22:18:32 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.1
Subject: Re: [PATCH v19 2/2] power: reset: reboot-mode: Expose sysfs for
 registered reboot_modes
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-pm@vger.kernel.org, Sebastian Reichel <sre@kernel.org>,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>
References: <20251122-next-15nov_expose_sysfs-v19-0-4d3d578ad9ee@oss.qualcomm.com>
 <20251122-next-15nov_expose_sysfs-v19-2-4d3d578ad9ee@oss.qualcomm.com>
 <CAMRc=Me=F5gTmkfO+2_3_pqebsz9GvabCK+xv6bfQeGgkSs6Dw@mail.gmail.com>
Content-Language: en-US
From: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
In-Reply-To: <CAMRc=Me=F5gTmkfO+2_3_pqebsz9GvabCK+xv6bfQeGgkSs6Dw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTI2MDEzNyBTYWx0ZWRfX+ZjQuDo+Zi1O
 K8XJGmNpHKqjRmBQeVk/6mZZKWSVFFA7DsgbdXox/ZbiEAGy9XQO//GpmmMyMmJbsbYYlT/plMR
 +b3qWunRNYAMDz4rWy6y9xccYTnmOao/yLltxHijEZuaBqKFAeREwaKv+PT//hmKB4NLTuRwoED
 kuuawqVcMVZ3ydchUjdGVN4/fOVfyE48UyeJtRIjff1FQwAYVYkie4eUA0T2wLFXCDskkYRZsvR
 53XWWgcyem3oj1CduU6Uo7DzaKR5iACHH/lwduVZ0H6mpGPWa6bvNOKI5wiDik2k1RJihDB29eT
 krc65ir6OAsAqC9ZSvFiGV0ccDCwtJ024ubxujWBJ//Et23W3CupjlsNWaYZP0eFPYJ7ydfDkwS
 1XQUy4n4Is308ORwOKAd+wWBtNDvNw==
X-Proofpoint-GUID: 0yY9GHbg_BaTAHoyrW_8Fc6NJNU-UNoV
X-Proofpoint-ORIG-GUID: 0yY9GHbg_BaTAHoyrW_8Fc6NJNU-UNoV
X-Authority-Analysis: v=2.4 cv=feugCkQF c=1 sm=1 tr=0 ts=69272f67 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=s8YR1HE3AAAA:8
 a=k6La1vVAo3GhI961SHcA:9 a=QEXdDO2ut3YA:10 a=GvdueXVYPmCkWapjIL-Q:22
 a=jGH_LyMDp9YhSvY-UuyI:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-25_02,2025-11-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 priorityscore=1501 suspectscore=0 bulkscore=0 clxscore=1015
 impostorscore=0 lowpriorityscore=0 phishscore=0 spamscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511260137



On 11/25/2025 8:14 PM, Bartosz Golaszewski wrote:
> On Sat, 22 Nov 2025 19:05:45 +0100, Shivendra Pratap
> <shivendra.pratap@oss.qualcomm.com> said:
>> Currently, there is no standardized mechanism for userspace to discover
>> which reboot-modes are supported on a given platform. This limitation
>> forces tools and scripts to rely on hardcoded assumptions about the
>> supported reboot-modes.
>>
>> Create a class 'reboot-mode' and a device under it to expose a sysfs
>> interface to show the available reboot mode arguments to userspace. Use
>> the driver_name field of the struct reboot_mode_driver to create the
>> device.  For device-based drivers, configure the device driver name as
>> driver_name.
>>
>> This results in the creation of:
>>   /sys/class/reboot-mode/<driver>/reboot_modes
>>
>> This read-only sysfs file will exposes the list of supported reboot
>> modes arguments provided by the driver, enabling userspace to query the
>> list of arguments.
>>
>> Signed-off-by: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
>> ---
>>  drivers/power/reset/reboot-mode.c | 86 +++++++++++++++++++++++++++++++++++++++
>>  include/linux/reboot-mode.h       |  3 ++
>>  2 files changed, 89 insertions(+)
>>
>> diff --git a/drivers/power/reset/reboot-mode.c b/drivers/power/reset/reboot-mode.c
>> index fba53f638da04655e756b5f8b7d2d666d1379535..71cd97ffb3ee8da530514ab918bc6d58a122b4ce 100644
>> --- a/drivers/power/reset/reboot-mode.c
>> +++ b/drivers/power/reset/reboot-mode.c
>> @@ -13,12 +13,61 @@
>>
>>  #define PREFIX "mode-"
>>
>> +static bool reboot_mode_class_registered;
> 
> You don't need this, please see below.

reboot_mode_class_registered was used for two reason.
one is resolved: will directly call class_unregister.

for second : If class_register fails, we want don't call register device
in reboot_mode_register.

at -
	if (reboot_mode_class_registered)
		reboot_mode_register_device(reboot);
 

> 
>> +
>>  struct mode_info {
>>  	const char *mode;
>>  	u32 magic;
>>  	struct list_head list;
>>  };
>>
>> +static ssize_t reboot_modes_show(struct device *dev, struct device_attribute *attr, char *buf)
>> +{
>> +	struct reboot_mode_driver *reboot;
>> +	struct mode_info *info;
>> +	ssize_t size = 0;
>> +
>> +	reboot = container_of(dev, struct reboot_mode_driver, reboot_mode_device);
>> +	if (!reboot)
>> +		return -ENODATA;
>> +
>> +	list_for_each_entry(info, &reboot->head, list)
>> +		size += sysfs_emit_at(buf, size, "%s ", info->mode);
>> +
> 
> Don't you need locking here? What if we'll end up adding a new reboot mode at
> the same time?

reboot-modes are added only once the time of reboot_mode_register_device. Yes,
there can be a race here if someone read while module load or probe was in progress.
Sure we can add a lock here to protect against the addition in reboot_mode_register_device.

> 
>> +	if (!size)
>> +		return -ENODATA;
>> +
>> +	return size + sysfs_emit_at(buf, size - 1, "\n");
>> +}
>> +static DEVICE_ATTR_RO(reboot_modes);
>> +
>> +static struct attribute *reboot_mode_attrs[] = {
>> +	&dev_attr_reboot_modes.attr,
>> +	NULL,
>> +};
>> +ATTRIBUTE_GROUPS(reboot_mode);
>> +
>> +static const struct class reboot_mode_class = {
>> +	.name = "reboot-mode",
>> +	.dev_groups = reboot_mode_groups,
>> +};
>> +
>> +static void reboot_mode_device_release(struct device *dev)
>> +{
>> +    /* place holder to avoid warning on device_unregister. nothing to free */
>> +}
>> +
>> +static void reboot_mode_register_device(struct reboot_mode_driver *reboot)
>> +{
>> +	reboot->reboot_mode_device.class = &reboot_mode_class;
>> +	reboot->reboot_mode_device.release = reboot_mode_device_release;
>> +	dev_set_name(&reboot->reboot_mode_device, reboot->driver_name);
>> +	if (!device_register(&reboot->reboot_mode_device))
>> +		reboot->reboot_mode_device_registered = true;
>> +	else
>> +		reboot->reboot_mode_device_registered = false;
> 
> Just use device_create(). I would also suggest creating a private structure
> that embeds the pointer to the struct device created by device_create() and
> the pointer to the reboot_mode_driver. If you pass it as driver data to
> device_create(), you'll be able to retrieve it with dev_get_drvdata() in
> sysfs callbacks.

Had made change to use device_create and dev_get_drvdata in below change, and have then
changed it to above as per the reviews on the same.
https://lore.kernel.org/all/qhlxxfsyc42xemerhi36myvil3bf45isgmpugkuqzsvgcc3ifn@njrtwuooij2q/

Should we change to device_create?

> 
>> +}
>> +
>>  static unsigned int get_reboot_mode_magic(struct reboot_mode_driver *reboot,
>>  					  const char *cmd)
>>  {
>> @@ -78,6 +127,9 @@ int reboot_mode_register(struct reboot_mode_driver *reboot)
>>
>>  	INIT_LIST_HEAD(&reboot->head);
>>
>> +	if (reboot_mode_class_registered)
>> +		reboot_mode_register_device(reboot);
>> +
>>  	for_each_property_of_node(np, prop) {
>>  		if (strncmp(prop->name, PREFIX, len))
>>  			continue;
>> @@ -119,6 +171,11 @@ int reboot_mode_register(struct reboot_mode_driver *reboot)
>>  	list_for_each_entry(info, &reboot->head, list)
>>  		kfree_const(info->mode);
>>
>> +	if (reboot->reboot_mode_device_registered) {
>> +		device_unregister(&reboot->reboot_mode_device);
>> +		reboot->reboot_mode_device_registered = false;
>> +	}
>> +
>>  	return ret;
>>  }
>>  EXPORT_SYMBOL_GPL(reboot_mode_register);
>> @@ -136,6 +193,11 @@ int reboot_mode_unregister(struct reboot_mode_driver *reboot)
>>  	list_for_each_entry(info, &reboot->head, list)
>>  		kfree_const(info->mode);
>>
>> +	if (reboot->reboot_mode_device_registered) {
>> +		device_unregister(&reboot->reboot_mode_device);
>> +		reboot->reboot_mode_device_registered = false;
>> +	}
>> +
>>  	return 0;
>>  }
>>  EXPORT_SYMBOL_GPL(reboot_mode_unregister);
>> @@ -162,6 +224,7 @@ int devm_reboot_mode_register(struct device *dev,
>>  	if (!dr)
>>  		return -ENOMEM;
>>
>> +	reboot->driver_name = reboot->dev->driver->name;
>>  	rc = reboot_mode_register(reboot);
>>  	if (rc) {
>>  		devres_free(dr);
>> @@ -199,6 +262,29 @@ void devm_reboot_mode_unregister(struct device *dev,
>>  }
>>  EXPORT_SYMBOL_GPL(devm_reboot_mode_unregister);
>>
>> +static int __init reboot_mode_init(void)
>> +{
>> +	if (class_register(&reboot_mode_class))
>> +		reboot_mode_class_registered = false;
>> +	else
>> +		reboot_mode_class_registered = true;
>> +
>> +	return 0;
>> +}
>> +
>> +static void __exit reboot_mode_exit(void)
>> +{
>> +	if (reboot_mode_class_registered)
>> +		class_unregister(&reboot_mode_class);
> 
> Please take a moment to read the code of the functions you're calling. The
> class_unregister() function will check if the class you're passing as argument
> was previously registered. If not, it will do nothing. You don't need all this
> checking.

Ack. thanks.

> 
>> +}
>> +
>> +#ifdef MODULE
>> +module_init(reboot_mode_init);
>> +module_exit(reboot_mode_exit);
>> +#else
>> +subsys_initcall(reboot_mode_init);
>> +#endif
> 
> You don't need to do this. It's perfectly fine to just do:
> 
> subsys_initcall(reboot_mode_init);
> module_exit(reboot_mode_exit);
> 
> This is handled in the module.h header[1].

Ack. sure. Will remove it.

> 
>> +
>>  MODULE_AUTHOR("Andy Yan <andy.yan@rock-chips.com>");
>>  MODULE_DESCRIPTION("System reboot mode core library");
>>  MODULE_LICENSE("GPL v2");
>> diff --git a/include/linux/reboot-mode.h b/include/linux/reboot-mode.h
>> index 4a2abb38d1d612ec0fdf05eb18c98b210f631b7f..400cfde0e029aef14ff90a11b9d12d0c3ce8dee6 100644
>> --- a/include/linux/reboot-mode.h
>> +++ b/include/linux/reboot-mode.h
>> @@ -5,6 +5,9 @@
>>  struct reboot_mode_driver {
>>  	struct device *dev;
>>  	struct list_head head;
>> +	const char *driver_name;
>> +	struct device reboot_mode_device;
>> +	bool reboot_mode_device_registered;
> 
> No need for this, just use device_is_registered() wherever you need to check
> it.

Ack.

thanks,
Shivendra

