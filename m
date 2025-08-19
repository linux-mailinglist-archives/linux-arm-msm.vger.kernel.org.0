Return-Path: <linux-arm-msm+bounces-69681-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id B431BB2BACA
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 Aug 2025 09:32:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 064746267D5
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 Aug 2025 07:31:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5E4EF26E165;
	Tue, 19 Aug 2025 07:31:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ZSx45hiT"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 721A118DF89
	for <linux-arm-msm@vger.kernel.org>; Tue, 19 Aug 2025 07:31:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755588702; cv=none; b=m9PZFKE5/ZdoD0pcaNGpAnKbz2YBf+7RIVRSP1SGOKV/PCqv2vujBAzSxynp+qDT1PD3xZE2erICUZPxao1J+eipBPvgDqAYZDLDtRacsFdqNwYELT506Uq4ihe4oIFxujjlOHpq5ogSAMykldLfagRIFK3++icSKVLZjQuT+/4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755588702; c=relaxed/simple;
	bh=pzUSDZlkNaxG71LP8uKMzRzJb6tgeaCZfWSzTDyI3Bs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Ypx01oNZHkAVjpiuuWNs61A0DdIRII65zClu0LVt+pAAKWulqCQwK8CW1lkvRX7UN7CeOC2URVDMb5zFvtCNtt/ARnHMhY2N1yG75dpzSLRczERkD4Wbzb74mw8k64bsiBOkJ93AKMUcJlOGnOyUaYDHosOsMUByr3nVpsbH5YY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ZSx45hiT; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57J2K3TH004060
	for <linux-arm-msm@vger.kernel.org>; Tue, 19 Aug 2025 07:31:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	E/5t8BuizRagaIaJmirkWNDHgWBpxUxE/MXsx3vZo/w=; b=ZSx45hiTEp53shwW
	4GGT8kbPMkKdH/UzM1W49QYD3xFH9q1Vze3BxZ4druZ/S5TI9w8+Pyp0mfLRBK9Z
	bLRIGcThdtgjmlrk78fh3G3gmaYlevXPj+NZ3TjseiNzyZRxyjNMCXbmAezpzOT4
	nyHgcgGPaVoclYYwRz+jtXTKlkB34j+6ZzLbHOh7/QpO4lwB/03RGBGn0SedzcOT
	Wjr/L+E92CI2T9zfAVh+CqRBxEdQPJYg3YF/PF7BpKr+CJpV1WJH4ilhbINK7uK8
	++EoZ98pCgjZiFuZWQCsRBHC7lVUYUaagG/N0HE4efYh49gWinCMJ2X2EaOF8jly
	LUq6SA==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48jh077nnf-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 19 Aug 2025 07:31:39 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-24457f440f0so55277025ad.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 19 Aug 2025 00:31:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755588698; x=1756193498;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=E/5t8BuizRagaIaJmirkWNDHgWBpxUxE/MXsx3vZo/w=;
        b=uNBDz1dJ5T03HjAPYYLT6YDRwh54Tetqa7Oruh9rUPGnqB+lskx/cMXbKYvlETkvOo
         RAtNWlRh+kOVrAQVr23nNsuclng1seWTDOWKxxiblFgMY3qg5vom6XUlegZcPT75nOJ1
         oSczueiOdw3aBwj860Ixzslbg/gNa22ZY6I+bFkLh4GPefhehjLf+Vzb9VRjddeLZNoM
         7RL2xo5L17zoZRvCsE9Jp5ep0U0QCfooZOU6aGo+tKjG/2ORxeV6psyyIUULHk7OBGOc
         ysb0sJXczRqa4Q/JA8EEMUwFGn/cFDxm/ECCwwXxoxTcS/WWSf86Y0skDq9f9rDZMkyD
         aSDw==
X-Forwarded-Encrypted: i=1; AJvYcCVmSfNSAKmYzxRdHnuYs5y5AFvTeP3fz6EuogyqMOxPfnUidi5sdWrCefQxrZxpdaEoTzH6opoS50MvWU7W@vger.kernel.org
X-Gm-Message-State: AOJu0Yyx6HFK9XK18Cb8RgT+oQ7jTO3YPWYCJsB/XlCRw8UWB90d+sah
	mkTpESfXdiCfsmMTthQFlpC7+PjyKxlfsKyEXU8xBMq4xT3Lz8I0BpO9tzODw6U3RD1ixrG0ECB
	y26z68mJRSXB+Of49syXYDeNfgVDwpiNEHls2gD7pgE9vuI4+1i4ZdEriL20ekVMEknjW
X-Gm-Gg: ASbGncvnEpJgfg7QC96F9RMyuotkYegL32baVR2wbNq4g4CEMWzG2L6KH3lZ8XwU7ac
	THEyVVgJ9TBPjwF6n7RNhoIEb9qTYW9qKjLMTxACHwnmpFO/Mz89DVg7OVv63vSQmgDEalmS7Ej
	jSVrR2aVwmJ0hzXMHLYpxbeaX5ph55tp9nzVvsAhBnlTX6k97rN8b5r72YcXQ/q0tmSQOzi55I+
	f50CoHNt6jtzPhYC103c7Z3/vsYXX7gGBwQapzCxc49IJqDAKS1ODoreH0xx+rHK4e3RpQN+iIv
	knPyofo9NQyT5KNBJ6AiWIsAbgDK9K+iTlfCnDf6MT722Bq//7IMDAdoWd0z9cW7YVYfeE3gXe7
	p6GqzvrdIUFhx8fFsiWrWZyNI64Yg0qO2
X-Received: by 2002:a17:902:f542:b0:23f:d47a:c9d3 with SMTP id d9443c01a7336-245e02e6404mr21339475ad.15.1755588697563;
        Tue, 19 Aug 2025 00:31:37 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEUC59usn5BICBgrQVO6S4T7O4TqzqEE4hnv1ocermgR8WZzZPykg1VxbPyswM9WQXAHiLH9Q==
X-Received: by 2002:a17:902:f542:b0:23f:d47a:c9d3 with SMTP id d9443c01a7336-245e02e6404mr21339015ad.15.1755588696978;
        Tue, 19 Aug 2025 00:31:36 -0700 (PDT)
Received: from [10.133.33.73] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2446d510774sm100620245ad.88.2025.08.19.00.31.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 19 Aug 2025 00:31:36 -0700 (PDT)
Message-ID: <51f2c3fa-ea6c-42a7-95eb-7737e75ef6db@oss.qualcomm.com>
Date: Tue, 19 Aug 2025 15:31:32 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/3] coresight-tnoc: add platform driver to support
 Interconnect TNOC
To: Leo Yan <leo.yan@arm.com>
Cc: Suzuki K Poulose <suzuki.poulose@arm.com>,
        Mike Leach <mike.leach@linaro.org>,
        James Clark <james.clark@linaro.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Alexander Shishkin <alexander.shishkin@linux.intel.com>,
        kernel@oss.qualcomm.com, coresight@lists.linaro.org,
        linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250815-itnoc-v1-0-62c8e4f7ad32@oss.qualcomm.com>
 <20250815-itnoc-v1-2-62c8e4f7ad32@oss.qualcomm.com>
 <20250818142759.GA8071@e132581.arm.com>
Content-Language: en-US
From: yuanfang zhang <yuanfang.zhang@oss.qualcomm.com>
In-Reply-To: <20250818142759.GA8071@e132581.arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: 6-zcgbXA5FZtd5VBWTpzlvb4X65097Ic
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODE2MDAyMCBTYWx0ZWRfX7H3U6Elc3N2k
 uLMbO2VPEumoNQAt6c1BZ1lheQ9M54s1c9qhFv//5MX4RFtD7o4Z40mRS81krRPgvjNET7dLH8d
 5aPb7s9j7e7pGCoLbqj1cUfK5j/mLAUDnvAE+oCA38qmHfDAsk8ydhZaWgKYXjwwQLaWGllv8n+
 9vy6dzFEfTNbG9Cymq3Bx/9NrUBDunZaaslSn6MEGQv9pTRHytLbH2IC7g9zFK/WX9iBpvzAN75
 07O1nXXjP3281+QmRtfbCgXkug59VK1gRQ96GXxeM5583ygHE+CqJtKXyCNWjraQ/O+i7y/kATs
 98ab8BZpt8iGMO4Z65rqxOMsDlfyROqiag9pnLMK9JQT9ydf8owq5a+pXIRNf0yejdDQh7Pd6YC
 hvGuCDLc
X-Authority-Analysis: v=2.4 cv=a+Mw9VSF c=1 sm=1 tr=0 ts=68a4285b cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=EUspDBNiAAAA:8 a=KKAkSRfTAAAA:8
 a=3YXEkSkIQhp2_XkERTwA:9 a=QEXdDO2ut3YA:10 a=324X-CrmTo6CU4MGRt3R:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: 6-zcgbXA5FZtd5VBWTpzlvb4X65097Ic
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-19_01,2025-08-14_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 malwarescore=0 suspectscore=0 impostorscore=0 phishscore=0
 adultscore=0 priorityscore=1501 clxscore=1015 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508160020



On 8/18/2025 10:27 PM, Leo Yan wrote:
> On Fri, Aug 15, 2025 at 06:18:13AM -0700, Yuanfang Zhang wrote:
>> This patch adds platform driver support for the CoreSight Interconnect
>> TNOC, Interconnect TNOC is a CoreSight link that forwards trace data
>> from a subsystem to the Aggregator TNOC. Compared to Aggregator TNOC,
>> it does not have aggregation and ATID functionality.
> 
> Such kind of driver is not complex, it would be fine to had sent driver
> in one go for support both AMBA and platform devices.
> 
>> Key changes:
>> - Add platform driver `coresight-itnoc` with device tree match support.
>> - Refactor probe logic into a common `_tnoc_probe()` function.
>> - Conditionally initialize ATID only for AMBA-based TNOC blocks.
> 
> An AMBA or platform device is only about device probing; it is not
> necessarily bound to a device feature.
> 
> So I am suspicious of the conclusion that an AMBA-based TNOC always
> supports ATID, while a platform device never supports it.
> 
> Otherwise, you might need to consider using a DT property to indicate
> whether ATID is present or not.
> 

Unlike the AMBA-based design, ITNOC not only lacks ATID support but also does not
include PID registers. This is why a separate platform driver is required to support it.

>> Signed-off-by: Yuanfang Zhang <yuanfang.zhang@oss.qualcomm.com>
>> ---
>>  drivers/hwtracing/coresight/coresight-tnoc.c | 153 +++++++++++++++++++--------
>>  1 file changed, 106 insertions(+), 47 deletions(-)
>>
>> diff --git a/drivers/hwtracing/coresight/coresight-tnoc.c b/drivers/hwtracing/coresight/coresight-tnoc.c
>> index d542df46ea39314605290311f683010337bfd4bd..aa6f48d838c00d71eff22c18e34e00b93755fd82 100644
>> --- a/drivers/hwtracing/coresight/coresight-tnoc.c
>> +++ b/drivers/hwtracing/coresight/coresight-tnoc.c
>> @@ -34,6 +34,7 @@
>>   * @base:      memory mapped base address for this component.
>>   * @dev:       device node for trace_noc_drvdata.
>>   * @csdev:     component vitals needed by the framework.
>> + * @pclk:	APB clock if present, otherwise NULL
>>   * @spinlock:  serialize enable/disable operation.
>>   * @atid:      id for the trace packet.
>>   */
>> @@ -41,6 +42,7 @@ struct trace_noc_drvdata {
>>  	void __iomem		*base;
>>  	struct device		*dev;
>>  	struct coresight_device	*csdev;
>> +	struct clk		*pclk;
>>  	spinlock_t		spinlock;
>>  	u32			atid;
>>  };
>> @@ -51,25 +53,27 @@ static void trace_noc_enable_hw(struct trace_noc_drvdata *drvdata)
>>  {
>>  	u32 val;
>>  
>> -	/* Set ATID */
>> -	writel_relaxed(drvdata->atid, drvdata->base + TRACE_NOC_XLD);
>> -
>> -	/* Set the data word count between 'SYNC' packets */
>> -	writel_relaxed(TRACE_NOC_SYNC_INTERVAL, drvdata->base + TRACE_NOC_SYNCR);
>> -
>> -	/* Set the Control register:
>> -	 * - Set the FLAG packets to 'FLAG' packets
>> -	 * - Set the FREQ packets to 'FREQ_TS' packets
>> -	 * - Enable generation of output ATB traffic
>> -	 */
>> -
>> -	val = readl_relaxed(drvdata->base + TRACE_NOC_CTRL);
>> -
>> -	val &= ~TRACE_NOC_CTRL_FLAGTYPE;
>> -	val |= TRACE_NOC_CTRL_FREQTYPE;
>> -	val |= TRACE_NOC_CTRL_PORTEN;
>> -
>> -	writel(val, drvdata->base + TRACE_NOC_CTRL);
>> +	if (drvdata->atid) {
>> +		/* Set ATID */
>> +		writel_relaxed(drvdata->atid, drvdata->base + TRACE_NOC_XLD);
>> +
>> +		/* Set the data word count between 'SYNC' packets */
>> +		writel_relaxed(TRACE_NOC_SYNC_INTERVAL, drvdata->base + TRACE_NOC_SYNCR);
>> +		/* Set the Control register:
>> +		 * - Set the FLAG packets to 'FLAG' packets
>> +		 * - Set the FREQ packets to 'FREQ_TS' packets
>> +		 * - Enable generation of output ATB traffic
>> +		 */
>> +
>> +		val = readl_relaxed(drvdata->base + TRACE_NOC_CTRL);
>> +
>> +		val &= ~TRACE_NOC_CTRL_FLAGTYPE;
>> +		val |= TRACE_NOC_CTRL_FREQTYPE;
>> +		val |= TRACE_NOC_CTRL_PORTEN;
>> +		writel(val, drvdata->base + TRACE_NOC_CTRL);
>> +	} else {
>> +		writel(0x1, drvdata->base + TRACE_NOC_CTRL);
>> +	}
> 
> Change "atid" type from u32 to int, then you could set it as
> "-EOPNOTSUPP" for non-AMBA device. Here:
> 
>     /* No valid ATID, simply enable the unit */
>     if (drvdata->atid == -EOPNOTSUPP) {
>         writel(TRACE_NOC_CTRL_PORTEN, drvdata->base + TRACE_NOC_CTRL);
>         return;
>     }

sure, will update.
> 
>>  }
>>  
>>  static int trace_noc_enable(struct coresight_device *csdev, struct coresight_connection *inport,
>> @@ -120,19 +124,6 @@ static const struct coresight_ops trace_noc_cs_ops = {
>>  	.link_ops	= &trace_noc_link_ops,
>>  };
>>  
>> -static int trace_noc_init_default_data(struct trace_noc_drvdata *drvdata)
>> -{
>> -	int atid;
>> -
> 
> Don't need to remove this function. Just check AMBA device case:
> 
>     /* ATID is not supported for interconnect TNOC */
>     if (!dev_is_amba(drvdata->dev)) {
>         drvdata->atid = -EOPNOTSUPP;
>         return 0;
>     }
> 
sure, will update.
>> -	atid = coresight_trace_id_get_system_id();
>> -	if (atid < 0)
>> -		return atid;
>> -
>> -	drvdata->atid = atid;
>> -
>> -	return 0;
>> -}
>> -
>>  static ssize_t traceid_show(struct device *dev,
>>  			    struct device_attribute *attr, char *buf)
>>  {
>> @@ -158,13 +149,12 @@ static const struct attribute_group *coresight_tnoc_groups[] = {
>>  	NULL,
>>  };
>>  
>> -static int trace_noc_probe(struct amba_device *adev, const struct amba_id *id)
>> +static int _tnoc_probe(struct device *dev, struct resource *res, bool has_id)
> 
> As a result, no need the parameter "has_id".
> 
sure, will update.
>>  {
>> -	struct device *dev = &adev->dev;
>>  	struct coresight_platform_data *pdata;
>>  	struct trace_noc_drvdata *drvdata;
>>  	struct coresight_desc desc = { 0 };
>> -	int ret;
>> +	int ret, atid = 0;
>>  
>>  	desc.name = coresight_alloc_device_name(&trace_noc_devs, dev);
>>  	if (!desc.name)
>> @@ -173,42 +163,61 @@ static int trace_noc_probe(struct amba_device *adev, const struct amba_id *id)
>>  	pdata = coresight_get_platform_data(dev);
>>  	if (IS_ERR(pdata))
>>  		return PTR_ERR(pdata);
>> -	adev->dev.platform_data = pdata;
>> +	dev->platform_data = pdata;
>>  
>>  	drvdata = devm_kzalloc(dev, sizeof(*drvdata), GFP_KERNEL);
>>  	if (!drvdata)
>>  		return -ENOMEM;
>>  
>> -	drvdata->dev = &adev->dev;
>> +	drvdata->dev = dev;
>>  	dev_set_drvdata(dev, drvdata);
>>  
>> -	drvdata->base = devm_ioremap_resource(dev, &adev->res);
>> +	ret = coresight_get_enable_clocks(dev, &drvdata->pclk, NULL);
>> +	if (ret)
>> +		return ret;
>> +
>> +	drvdata->base = devm_ioremap_resource(dev, res);
>>  	if (IS_ERR(drvdata->base))
>>  		return PTR_ERR(drvdata->base);
>>  
>>  	spin_lock_init(&drvdata->spinlock);
>>  
>> -	ret = trace_noc_init_default_data(drvdata);
>> -	if (ret)
>> -		return ret;
>> +	if (has_id) {
>> +		atid = coresight_trace_id_get_system_id();
>> +		if (atid < 0)
>> +			return atid;
>> +	}
>> +
>> +	drvdata->atid = atid;
> 
> Drop this change and simply keep the code for invoking
> trace_noc_init_default_data().
> 
sure, will update.
>>  	desc.ops = &trace_noc_cs_ops;
>>  	desc.type = CORESIGHT_DEV_TYPE_LINK;
>>  	desc.subtype.link_subtype = CORESIGHT_DEV_SUBTYPE_LINK_MERG;
>> -	desc.pdata = adev->dev.platform_data;
>> -	desc.dev = &adev->dev;
>> +	desc.pdata = pdata;
>> +	desc.dev = dev;
>>  	desc.access = CSDEV_ACCESS_IOMEM(drvdata->base);
>> -	desc.groups = coresight_tnoc_groups;
>> +	if (has_id)
>> +		desc.groups = coresight_tnoc_groups;
> 
> No need to change for groups.
> 
> Just return "-EOPNOTSUPP" in traceid_show() if drvdata->atid is negative.
> Or, you could use the .is_visible() callback to decide if the "trace_id"
> node appears or not.
> 
sure, will updata.
>>  	drvdata->csdev = coresight_register(&desc);
>> -	if (IS_ERR(drvdata->csdev)) {
>> +	if (IS_ERR(drvdata->csdev) && has_id) {
>>  		coresight_trace_id_put_system_id(drvdata->atid);
>>  		return PTR_ERR(drvdata->csdev);
>>  	}
>> -	pm_runtime_put(&adev->dev);
>>  
>>  	return 0;
>>  }
>>  
>> +static int trace_noc_probe(struct amba_device *adev, const struct amba_id *id)
>> +{
>> +	int ret;
>> +
>> +	ret = _tnoc_probe(&adev->dev, &adev->res, true);
>> +	if (!ret)
>> +		pm_runtime_put(&adev->dev);
>> +
>> +	return ret;
>> +}
>> +
>>  static void trace_noc_remove(struct amba_device *adev)
>>  {
>>  	struct trace_noc_drvdata *drvdata = dev_get_drvdata(&adev->dev);
>> @@ -236,7 +245,57 @@ static struct amba_driver trace_noc_driver = {
>>  	.id_table	= trace_noc_ids,
>>  };
>>  
>> -module_amba_driver(trace_noc_driver);
>> +static int itnoc_probe(struct platform_device *pdev)
>> +{
>> +	struct resource *res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
>> +	int ret;
>> +
>> +	pm_runtime_get_noresume(&pdev->dev);
>> +	pm_runtime_set_active(&pdev->dev);
>> +	pm_runtime_enable(&pdev->dev);
>> +
>> +	ret = _tnoc_probe(&pdev->dev, res, false);
>> +	pm_runtime_put(&pdev->dev);
>> +	if (ret)
>> +		pm_runtime_disable(&pdev->dev);
>> +
>> +	return ret;
>> +}
>> +
>> +static void itnoc_remove(struct platform_device *pdev)
>> +{
>> +	struct trace_noc_drvdata *drvdata = platform_get_drvdata(pdev);
>> +
>> +	coresight_unregister(drvdata->csdev);
>> +	pm_runtime_disable(&pdev->dev);
>> +}
>> +
>> +static const struct of_device_id itnoc_of_match[] = {
>> +	{ .compatible = "qcom,coresight-itnoc" },
>> +	{}
>> +};
>> +MODULE_DEVICE_TABLE(of, itnoc_of_match);
>> +
>> +static struct platform_driver itnoc_driver = {
>> +	.probe = itnoc_probe,
>> +	.remove = itnoc_remove,
>> +	.driver = {
>> +		.name = "coresight-itnoc",
>> +		.of_match_table = itnoc_of_match,
> 
> You might need to set:
> 
>     .suppress_bind_attrs = true,
> 
sure, will update.
> Thanks,
> Leo
> 
>> +	},
>> +};
>> +
>> +static int __init tnoc_init(void)
>> +{
>> +	return coresight_init_driver("tnoc", &trace_noc_driver, &itnoc_driver, THIS_MODULE);
>> +}
>> +
>> +static void __exit tnoc_exit(void)
>> +{
>> +	coresight_remove_driver(&trace_noc_driver, &itnoc_driver);
>> +}
>> +module_init(tnoc_init);
>> +module_exit(tnoc_exit);
>>  
>>  MODULE_LICENSE("GPL");
>>  MODULE_DESCRIPTION("Trace NOC driver");
>>
>> -- 
>> 2.34.1
>>
>> _______________________________________________
>> CoreSight mailing list -- coresight@lists.linaro.org
>> To unsubscribe send an email to coresight-leave@lists.linaro.org


