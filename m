Return-Path: <linux-arm-msm+bounces-88755-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id AD191D18107
	for <lists+linux-arm-msm@lfdr.de>; Tue, 13 Jan 2026 11:34:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id AE53D30262B4
	for <lists+linux-arm-msm@lfdr.de>; Tue, 13 Jan 2026 10:34:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8ECE0279DC2;
	Tue, 13 Jan 2026 10:34:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="hQchbHPF";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="enext7/y"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28C2C28469E
	for <linux-arm-msm@vger.kernel.org>; Tue, 13 Jan 2026 10:34:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768300446; cv=none; b=SKlinX9IXUYCO9pa6cqVNsWfB8IzKQ0vBrEa7oxkw491kvKMj0pHUXsNlxYcMWDewn9HPIir7lip7kKSK8OCme1MZblQm5XdixgvLFP3w/zztQq8AvB9rqaMxnCIFORRwXQi2nZBw5PNnpWOqJcDcrmTtuON6i46NQU/JbNRij0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768300446; c=relaxed/simple;
	bh=g/CVOAaWdUPOEwC027HX6BxmrMdy/gydvDQJPZmL8Us=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=m1OXtcHXxaCA56qavrB6qay7GfZuJ8PEcxwqCMiSbz+BcVLkUFskYmUo/ptAD9oocYCGQuVnR3TYdumPP7eqZ8vYjlhMB4T/5UPDKXsdy0UijRHvxxf6CxKfEd0wHtFZVM6l1q4FVpsFkORBl7jEMJbTfNXPGg6gwTW1WHsF2Bc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hQchbHPF; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=enext7/y; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60D75BsW2604538
	for <linux-arm-msm@vger.kernel.org>; Tue, 13 Jan 2026 10:34:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	8mDPaq0hclLjwSYmTrQ6n+kDZ3N8OGbVHga1O58ScVs=; b=hQchbHPF+Uvlvg1y
	CXDUcj8D6h1bepkHTMSbtg1vC968XhvjSJE4qiW5DsW9SaCBEsI3esoUAQdlbYQI
	qKGPy4sSHAwc7Lc+21ue5X79YVxC1CbJfOWibnOCk5E/rvBzH0t4q31aLrJ0yW4n
	kbZCVvzl7h0QfH4EmXq4H7d2A+7qvbw0HKbJLnpOxH5fDYQian5MUmemgxX4hrPq
	//38Dd/VLsx423jfBFqPdLODGwriNqJdE+AJGDTdHJp2lk9xjoR7bQ6EO3MC8ISd
	8+uvP8f+mZeQXflUwfTse+SpNNm2oqDCP1dsigpHVQgsMoA8He7eDc6xBhaepmq4
	LGYaDw==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bn7uyta4g-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 13 Jan 2026 10:34:04 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-8c231297839so266406785a.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 13 Jan 2026 02:34:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1768300443; x=1768905243; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=8mDPaq0hclLjwSYmTrQ6n+kDZ3N8OGbVHga1O58ScVs=;
        b=enext7/yVNaf/K8ONd5BT2g/i1tVUdSH6OaxETnt+Y1jbV/E4w3akXn5yOr8Pib9Kr
         B1Rf3dZZ4pbn6aKVTEkwiAVlZEr/NJAgbAFaKUZSkvUcmFG3hfBXGU8amL4s5q/jdpcj
         sbCm9VmfdjdkkQaQAJLIBnl6myoXTbL63e7Z3QTUkOiW489d+thhQ1ogKqy47JeqIZ+/
         w6Q7uJZbPS5OCzA9UBTMerAgr+zlQ4yoA6F9vWDaci+u5KbZeWQfJi65uJamatn6fIm7
         IFAuxcNPgu7OpyFtelsoDKMCdc2e1QtzfnCLQ7dnrJCnBkqqhH23m1vr4SeRsHk+YN3+
         dPww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768300443; x=1768905243;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8mDPaq0hclLjwSYmTrQ6n+kDZ3N8OGbVHga1O58ScVs=;
        b=vFs+x/WMs/gaEI7TPBUZwIs/t2G4TCOnXILCXRUG1jbuKAo21ATnKGtEZz5Ipg5OH3
         eOTQ2vi0eHZZbn8m/SP9NNZBUsikwynn5tL1ain5D6YThDLtaBxh4giLDt2Mxhffusvi
         JlzcvhBLT6MSsZsLJKmz2s/vT7xg+fwFlhKSpqv26XzZZijy0kEliDJrh/AzBB4Iwq/n
         7EQUZ24nhBGgazfTJ8pFwawuciW9tJ4w8DrJN+bKKqTDN/4I1trQSOI8aoLYhr+84EUu
         0uHjKK0564k56gwTBOc6pQg/EUdOEQGZNLFzDsCVGIai97M553Hfu6NVae61eNc3VFqV
         gwLg==
X-Forwarded-Encrypted: i=1; AJvYcCU8dhHMnWcDQCMxZjx2kmL+jmYxNVejEeaDxFpfTeynDLlDoqqh5AD6udxySrBNhDaUsv3luRH9cYwfUD76@vger.kernel.org
X-Gm-Message-State: AOJu0YyvG+kdTqOegOnVQATg+H53w0qpPjac4pRELeMCeoNJuqc4psYX
	EAdblU0mmlqvCKv2FJOF3N1hmNCodK4/5EDUrYV/T3U3Z5LTeSN/NqtFYNtK3orwX05fug/ZRXG
	13dEig/2gpYelJELCu5VuObUT4ewLI8H8DP89U5/AbGB2XpvrZrvUHYMukMvggYYU8ZY6
X-Gm-Gg: AY/fxX5Oc4xBcB3wwmYhyZn4DP9fMVWrA8KsduxCxm3D7tCO+hDSegNyeDGfBFsrwV+
	xuMFcoJ5GQurtJ9YhDdDr2NfSBabzUCcISMGaCRA9uo4YL3Ag8ES0JKHbxUoIL1S77zmbrK1Fkv
	qLeLOiCGgfvlgvmhrwjK87ryO01/uE+GVZqNIDjNqQgeRn1fpdWGInjyxfgDFcYm/9/MW8dIMJ+
	6hlNaSsORaXTtofKpRgyBAsbqPwlW85BQZHAJd+AIM2QnF+CKTxAss/4yOKUBAJh1vz0LOBQsCE
	dUCyYG/FGJXHlVVTBDIWShe6G69xHllXL8kVD8ASVZr3tN5QvgK/MdPsKVJejkVYRE0d+GH1FSB
	CICoIXQs6JmLAJl8Qp+kKcB/wVamRsUjM4UyTlHI3hxFCqHSPGQ/+x+nFOnQEupDGRVo=
X-Received: by 2002:a05:620a:bcd:b0:8b2:e19c:67cd with SMTP id af79cd13be357-8c3893fd8femr1953528885a.9.1768300443192;
        Tue, 13 Jan 2026 02:34:03 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFJACxFutkrDz6BTVbO+uCz2sZFjD+cOF/xK1HFoRB0R+KXXMAzENrCTjFRt6r4V9cac6GAwA==
X-Received: by 2002:a05:620a:bcd:b0:8b2:e19c:67cd with SMTP id af79cd13be357-8c3893fd8femr1953526085a.9.1768300442628;
        Tue, 13 Jan 2026 02:34:02 -0800 (PST)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b86fee09153sm899209166b.29.2026.01.13.02.34.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 13 Jan 2026 02:34:01 -0800 (PST)
Message-ID: <c5569d62-1dd5-4dec-8cb9-dd1c6e3938c6@oss.qualcomm.com>
Date: Tue, 13 Jan 2026 11:33:59 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v10 2/7] qcom-tgu: Add TGU driver
To: Songwei Chai <songwei.chai@oss.qualcomm.com>, andersson@kernel.org,
        alexander.shishkin@linux.intel.com, mike.leach@linaro.org,
        suzuki.poulose@arm.com, james.clark@arm.com, krzk+dt@kernel.org,
        conor+dt@kernel.org
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-arm-msm@vger.kernel.org, coresight@lists.linaro.org,
        devicetree@vger.kernel.org, gregkh@linuxfoundation.org
References: <20260109021141.3778421-1-songwei.chai@oss.qualcomm.com>
 <20260109021141.3778421-3-songwei.chai@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260109021141.3778421-3-songwei.chai@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: 6ImBkFas0IxVEnHty0uhHFGOOR_GicTZ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTEzMDA4OSBTYWx0ZWRfX/sq01WEG9j13
 OZSfdBdF/jlNDgvkwC52PeFUwNeI8l1ufj9ovF9nZNUJTDcIQrpR3CcSyMAIL/3VWFSFJw5j0Nc
 xAJ5myqArp6apROZ5axtiLMdDXDoJf2om1WpFCyQR3r1lpv3gac+dbHkMV5nfuO92KhblVevGwl
 NBIVFOfKHksmj9L/H0QISaorX8PqzF9C0LaBHQ8VqWaSGT+UeN05apmrKxET4/IU1W/ngVPnPfV
 MqS7rvnyEEpsOlzf1cxC0R8TsKmCVRlLFTsJKpSKO8yUdeq/yAfUV5kE0Yx+tgaw8Jx4G0KI8fs
 +TIV56zd2CWS2rZL5FJ85Bz5LRHkh+rkter3IgFI9qC0vk8AC+Dm/rTgqEKa4UroIA+bwkmz66z
 V1KXddHKDiRt3hiAOSOLr8UimUPBAmthddOc+3e9qwacC2R6b0fb7Uag5Czv3MFS7PNBmIK/SX+
 Jnzz85DRbGgrAUxwidw==
X-Authority-Analysis: v=2.4 cv=bpdBxUai c=1 sm=1 tr=0 ts=69661f9c cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=VZhoWKq-FIP5gklq0E0A:9
 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-GUID: 6ImBkFas0IxVEnHty0uhHFGOOR_GicTZ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-13_02,2026-01-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 priorityscore=1501 lowpriorityscore=0 adultscore=0
 impostorscore=0 clxscore=1015 phishscore=0 spamscore=0 bulkscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2601130089

On 1/9/26 3:11 AM, Songwei Chai wrote:
> Add driver to support device TGU (Trigger Generation Unit).
> TGU is a Data Engine which can be utilized to sense a plurality of
> signals and create a trigger into the CTI or generate interrupts to
> processors. Add probe/enable/disable functions for tgu.
> 
> Signed-off-by: Songwei Chai <songwei.chai@oss.qualcomm.com>
> ---

[...]

> +static void tgu_disable(struct device *dev)
> +{
> +	struct tgu_drvdata *drvdata = dev_get_drvdata(dev);
> +
> +	guard(spinlock)(&drvdata->lock);
> +	if (drvdata->enable) {

if (!drvdata->enabled)
	return


> +		TGU_UNLOCK(drvdata->base);
> +		writel(0, drvdata->base + TGU_CONTROL);
> +		TGU_LOCK(drvdata->base);
> +
> +		drvdata->enable = false;
> +	}
> +}
> +
> +static ssize_t enable_tgu_show(struct device *dev,

'enabled', in all references to this, please

> +				struct device_attribute *attr, char *buf)
> +{
> +	struct tgu_drvdata *drvdata = dev_get_drvdata(dev);
> +	bool enabled;
> +
> +	guard(spinlock)(&drvdata->lock);
> +	enabled = drvdata->enable;
> +
> +	return sysfs_emit(buf, "%d\n", enabled ? 1 : 0);

!!enabled


> +}
> +
> +/* enable_tgu_store - Configure Trace and Gating Unit (TGU) triggers. */
> +static ssize_t enable_tgu_store(struct device *dev,
> +				struct device_attribute *attr,
> +				const char *buf,
> +				size_t size)
> +{
> +	unsigned long val;
> +	int ret = 0;

Drop the initialization, you override it immediately a line below

[...]

> +static int tgu_probe(struct amba_device *adev, const struct amba_id *id)
> +{
> +	struct device *dev = &adev->dev;
> +	struct tgu_drvdata *drvdata;
> +	int ret;
> +
> +	drvdata = devm_kzalloc(dev, sizeof(*drvdata), GFP_KERNEL);
> +	if (!drvdata)
> +		return -ENOMEM;
> +
> +	drvdata->dev = &adev->dev;
> +	dev_set_drvdata(dev, drvdata);
> +
> +	drvdata->base = devm_ioremap_resource(dev, &adev->res);
> +	if (IS_ERR(drvdata->base))
> +		return PTR_ERR(drvdata->base);
> +
> +	spin_lock_init(&drvdata->lock);
> +
> +	ret = sysfs_create_groups(&dev->kobj, tgu_attr_groups);
> +	if (ret) {
> +		dev_err(dev, "failed to create sysfs groups: %d\n", ret);
> +		return ret;
> +	}
> +
> +	drvdata->enable = false;
> +
> +	pm_runtime_put(&adev->dev);
> +	return 0;

Please keep a consistent \n above return as you did in all other places
throughout this file

[...]

> +/* Register addresses */
> +#define TGU_CONTROL 0x0000
> +#define TGU_LAR		0xfb0
> +#define TGU_UNLOCK_OFFSET	0xc5acce55

Please align the values (it's easier with tabs)

> +
> +static inline void TGU_LOCK(void __iomem *addr)
> +{
> +	do {
> +		/* Wait for things to settle */
> +		mb();

What are we waiting for here?

> +		writel_relaxed(0x0, addr + TGU_LAR);

If you do a prompt TGU_LOCK()-TGU_UNLOCK() the writes may arrive in
the order opposite to what you want, I'd say this shouldn't be _relaxed()
and we should probably have a readback here to make sure the effect has
taken place immediately

> +	} while (0);
> +}
> +
> +static inline void TGU_UNLOCK(void __iomem *addr)
> +{
> +	do {
> +		writel_relaxed(TGU_UNLOCK_OFFSET, addr + TGU_LAR);
> +		/* Make sure everyone has seen this */
> +		mb();

I believe this should be a readback instead

> +	} while (0);
> +}
> +
> +/**
> + * struct tgu_drvdata - Data structure for a TGU (Trigger Generator Unit)
> + * @base: Memory-mapped base address of the TGU device
> + * @dev: Pointer to the associated device structure
> + * @lock: Spinlock for handling concurrent access

Concurrent access to what? (presumably the TGU?)

> + * @enable: Flag indicating whether the TGU device is enabled
> + *
> + * This structure defines the data associated with a TGU device,
> + * including its base address, device pointers, clock, spinlock for
> + * synchronization, trigger data pointers, maximum limits for various
> + * trigger-related parameters, and enable status.
> + */
> +struct tgu_drvdata {
> +	void __iomem *base;
> +	struct device *dev;
> +	spinlock_t lock;
> +	bool enable;

"enabled", please

Konrad

