Return-Path: <linux-arm-msm+bounces-104598-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 7KTyEDzO7mnZxwAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-104598-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Apr 2026 04:47:24 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 883C546C3B5
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Apr 2026 04:47:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id BB43E300A638
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Apr 2026 02:47:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6357E346E5A;
	Mon, 27 Apr 2026 02:47:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="iy6anzSa";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ZdFsh9aK"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84EA130F80C
	for <linux-arm-msm@vger.kernel.org>; Mon, 27 Apr 2026 02:47:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777258041; cv=none; b=rzyA8tuqGhV4XVsBRGs0r3JlMwt4Q7Sb+dqoXE1DirLAqqbtC6RJdlR0JzUChDIYuBgYAhCKjy+dAcGTp5optA1RlJIAlAMXHW5jL7j/4paibS5sSX/uVAP/UbsXhQcLEP2wIeiCPQqOdLDTXHWNZlPhMhEbUSnwrrE/n44ljs8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777258041; c=relaxed/simple;
	bh=ZcePOkZQBHiI/P/egChHPO4YcvxpFZMXeKwCAON4904=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=WAiZML8LLBpg3PR+CBZDTqBt0MPX1GNKCiEvxlZnxbTqB5d6LK2LY9tplkBNiKtj19zAxT0AnZ8CQfDzb0TNTVTlZOGRM2vxM0+u8On9B8N+cNIYjZwiuD6HC+87A86BaGmlt6E8mcnksY0KpiBH67gr7Soo6SUpfuBTAWjzdNI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=iy6anzSa; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ZdFsh9aK; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63R0scvA3861830
	for <linux-arm-msm@vger.kernel.org>; Mon, 27 Apr 2026 02:47:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	FPeIfTmza3TkEQ+5+qK0Mp7F66iEi5NlhgKX+eZpa7k=; b=iy6anzSaFEqcA687
	5GPhDkbxq3zlL/kXnzLbqep6zFWnvajtNpfsDE70PFPIkYWxGX77XS8JOh9RGeVG
	HDvAiFR/Xzx1W87LiSAlBlXkvkIfVJAsPc+HA5Lyco4NgaUiMxQLB30ZWp6VtPqS
	xtfh+0HcuZ/TGkSfGKj0fU3VGk1C85xe8A7wqugWpSJVd8iU8kxtoVwaWaaZ8qs7
	rp4r7Em4iihiwT6lMhLEVlDz+G1xKH8TSRpby1Nh3DTa/nWCw7ND2jv36Twyub5R
	bzNMcdW1x8HOomDc06ArqMix5VSAB6Mbb5UhP78HMEqC/j0XHv07uyYTcY0bYIyt
	/SKj2g==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4drnmr435g-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 27 Apr 2026 02:47:18 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2b7c904d476so21631345ad.3
        for <linux-arm-msm@vger.kernel.org>; Sun, 26 Apr 2026 19:47:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777258037; x=1777862837; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=FPeIfTmza3TkEQ+5+qK0Mp7F66iEi5NlhgKX+eZpa7k=;
        b=ZdFsh9aKk3R64qYMjj9iEAhcoocGcckAH1XuyNyzS7PR5/I4swpcOnA5Wfr9L8NlWM
         dyu5+ft9mwCY9Tfqyw0Vzs4Te3VSwo0WCCs2vIP1Ofk3T8hOMjGd0soQZPMEF0Ljlicw
         U2XLSUyijBAhizcyaIsErodCuBaz8g2mLmRn8MVYKQPJMPqU/stzW1PfvrbLI2n4jOxy
         GOyVWDbEEC7igKJnd+dhzaemhS8pbnRgTxNUxH9jq9j8f8c11rys6k0nkR4HWMbhdi76
         ceM+dLogU8Uz3K81Wrlp/PYWMKIYVVfyhLbGkVHetkIZKuUOk7lytArMJS96XKIxzFId
         G+Rg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777258037; x=1777862837;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=FPeIfTmza3TkEQ+5+qK0Mp7F66iEi5NlhgKX+eZpa7k=;
        b=UJAtKSLg1TlUB1dZAtBmWT1fIPhrVGYJvt1iLNdUus88QB8q8Z67mGRujAYGhKfAFf
         rn+yCjetjUGjSwktDDDkIYyIPcRNoJ4JbXcyDd1xpOfuiCvl8sYY+ycfSVdGdc1nVflf
         e1ONEDTMgME0j0tvAovcLK6F/ojeFjAzKaoneHYvknu1DvPDo2Jnfrh4o27ycmfwrZ4D
         Jfeeebima3THyGvT4Ewo1XBrIU90X1SAEutwG5DUGIJrIVanWXkyXwW8nQEMGPIBzEND
         AFCGVPdQoFwM55h1vjIaOLzaO56S6b8d7CCcsuWDGySQp49PqtLcO/lDksHrYnNmiBNc
         MztA==
X-Forwarded-Encrypted: i=1; AFNElJ+M40Ri+YhOEYiIDGA/Ghz+abgGkPxbD56zYH3mIUaTwDLHFVdWRVcN1kKW1wua19sWn/b94/P4hiNV0voh@vger.kernel.org
X-Gm-Message-State: AOJu0Ywlo/5ShHYspBCjmsFeywxlxZTA/dSfGR+gP5W0rNGUDjIdj6yY
	/m2wj3ULl3udbY6/pkfAsbouTpx7L8W/vrYh8S6gp7aOk/8aSTKeywQsg3rScLaE9zQyzz1ylc4
	JwcN0N4Q6dV96Di91tm8xhE85nx6Dr9p/+FznsT/nXsDtYRB2sXspPpjCdfdMsuIuHfpb
X-Gm-Gg: AeBDieuVg20cmql4WIrqIgrhDwxf+oaBsZ7V+iSvGPKmz7HBKxTPtt1NiXrafOCLWTN
	9QaMbaHFkwSWCiuwjPFGD+uLeJhx/FlA5MBGBjjw7ygH/KNvBwoekxcF6PVjk1avHfMZ9ShBdhJ
	rpQ1vD6nkoyAOKVTDHsCc7bBLK43II4cgsz11DzXtjMYr7bzwUWVCJsE0FRfyrnVvNbl9+5Z1u1
	tr7ezcgOKVy3CFH/uNXmbv1id/IeeCyBEvfQ3N5VDTO/5G2dIglpZvxUu3FkxjsrL1B4SyPKyqS
	CUYh9Nnsph0vQlphMSG05QZpnhYSHbqgNp9H3HsfneeHd89T8qeHvRFDJd5CoZ0PE3oiSUoq9fk
	P6AUkLzinnOZCkzNLUUbJYYnmfag+x3sVsrD65FE7LkkV9t4w4pXVWGBfQG2dTsbrarOeHxiYAL
	IlJGxJm1dX6AQ/A57Eyh9B
X-Received: by 2002:a17:902:bf4a:b0:2b2:4e5c:69a9 with SMTP id d9443c01a7336-2b5f9e79fa8mr309628245ad.5.1777258037423;
        Sun, 26 Apr 2026 19:47:17 -0700 (PDT)
X-Received: by 2002:a17:902:bf4a:b0:2b2:4e5c:69a9 with SMTP id d9443c01a7336-2b5f9e79fa8mr309627945ad.5.1777258036840;
        Sun, 26 Apr 2026 19:47:16 -0700 (PDT)
Received: from [10.133.33.62] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b5fa9ff98csm289078485ad.3.2026.04.26.19.47.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 26 Apr 2026 19:47:16 -0700 (PDT)
Message-ID: <34022672-c7ed-4ddc-9bde-9e0bf3eb5105@oss.qualcomm.com>
Date: Mon, 27 Apr 2026 10:47:11 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 1/4] coresight: cti: Convert trigger usage fields to
 dynamic bitmaps and arrays
From: Jie Gan <jie.gan@oss.qualcomm.com>
To: Yingchao Deng <yingchao.deng@oss.qualcomm.com>,
        Suzuki K Poulose <suzuki.poulose@arm.com>,
        Mike Leach <mike.leach@arm.com>, James Clark <james.clark@linaro.org>,
        Leo Yan <leo.yan@arm.com>,
        Alexander Shishkin <alexander.shishkin@linux.intel.com>
Cc: coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        quic_yingdeng@quicinc.com, Jinlong Mao <jinlong.mao@oss.qualcomm.com>,
        Tingwei Zhang <tingwei.zhang@oss.qualcomm.com>
References: <20260426-extended-cti-v8-0-23b900a4902f@oss.qualcomm.com>
 <20260426-extended-cti-v8-1-23b900a4902f@oss.qualcomm.com>
 <1c99a162-475e-4d6c-af85-a16322d31476@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <1c99a162-475e-4d6c-af85-a16322d31476@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=aqCCzyZV c=1 sm=1 tr=0 ts=69eece36 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=A6nXn4D9y4xdd_vbfkIA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-GUID: 62f8PgIaCpXxz8eEOqT99iTPBFLKiSky
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDI3MDAyNyBTYWx0ZWRfX8BafxnKkfQlI
 xm77oZaQ7EUBK1KMAclGqTjtf9ygX5zrBTQvV9gTZiyq6fiB3G8VpT3dPjKsIopgp/2GzudvzUO
 BSvTbEdUdjqhV7cx5C+/fegliF41Ez/UpYCEApOc5vg7qRzjH4YPk/vjmHKSB+TkzbrY0Wv66o3
 OCPVxZLfx3WDJ4Ascvhd9oMc/hI1aqTo8qTOhUVJUj3mmp+lewoXp4L94DTFQhziUSE7oRfmfOL
 kGQStDd5wybAEGQhC9Xg19HAZLRz3F4HkznZ5Dhi+Buh+WHSg1RFkui1yL3zW2Nq+kKG50RwEMt
 c40hgqwI1pHLA8SU81WMIafVVkrMDjq6F01SZbJ7i2CkiCuNYjwIfQc74n5fnn9UyUIKhqHXDtY
 asIETlCq4CIkGSzBiuX4zOfnb0dovVA2uvKyDThf4CyloCjKL5BKcfWNoQZ7XWhleH2XZ/uMFV8
 tC9VTXhea0hzLU0EQ6Q==
X-Proofpoint-ORIG-GUID: 62f8PgIaCpXxz8eEOqT99iTPBFLKiSky
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-26_07,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 phishscore=0 spamscore=0 adultscore=0
 suspectscore=0 malwarescore=0 bulkscore=0 clxscore=1015 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2604270027
X-Rspamd-Queue-Id: 883C546C3B5
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-104598-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCPT_COUNT_TWELVE(0.00)[13];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jie.gan@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]



On 4/27/2026 9:48 AM, Jie Gan wrote:
> 
> 
> On 4/26/2026 5:44 PM, Yingchao Deng wrote:
>> Replace the fixed-size u32 fields in the cti_config and cti_trig_grp
>> structure with dynamically allocated bitmaps and arrays. This allows
>> memory to be allocated based on the actual number of triggers during 
>> probe
>> time, reducing memory footprint and improving scalability for platforms
>> with varying trigger counts.
>>
>> Signed-off-by: Yingchao Deng <yingchao.deng@oss.qualcomm.com>
>> ---
>>   drivers/hwtracing/coresight/coresight-cti-core.c   | 59 ++++++++++++ 
>> +++++-----
>>   .../hwtracing/coresight/coresight-cti-platform.c   | 26 +++++++---
>>   drivers/hwtracing/coresight/coresight-cti-sysfs.c  | 14 ++---
>>   drivers/hwtracing/coresight/coresight-cti.h        | 12 ++---
>>   4 files changed, 76 insertions(+), 35 deletions(-)
>>
>> diff --git a/drivers/hwtracing/coresight/coresight-cti-core.c b/ 
>> drivers/hwtracing/coresight/coresight-cti-core.c
>> index 2f4c9362709a..4e7d12bd2d3e 100644
>> --- a/drivers/hwtracing/coresight/coresight-cti-core.c
>> +++ b/drivers/hwtracing/coresight/coresight-cti-core.c
>> @@ -161,8 +161,8 @@ void cti_write_intack(struct device *dev, u32 ackval)
>>   /* DEVID[19:16] - number of CTM channels */
>>   #define CTI_DEVID_CTMCHANNELS(devid_val) ((int) BMVAL(devid_val, 16, 
>> 19))
>> -static void cti_set_default_config(struct device *dev,
>> -                   struct cti_drvdata *drvdata)
>> +static int cti_set_default_config(struct device *dev,
>> +                  struct cti_drvdata *drvdata)
>>   {
>>       struct cti_config *config = &drvdata->config;
>>       u32 devid;
>> @@ -181,6 +181,26 @@ static void cti_set_default_config(struct device 
>> *dev,
>>           config->nr_trig_max = CTIINOUTEN_MAX;
>>       }
>> +    config->trig_in_use = devm_bitmap_zalloc(dev, config- 
>> >nr_trig_max, GFP_KERNEL);
>> +    if (!config->trig_in_use)
>> +        return -ENOMEM;
>> +
>> +    config->trig_out_use = devm_bitmap_zalloc(dev, config- 
>> >nr_trig_max, GFP_KERNEL);
>> +    if (!config->trig_out_use)
>> +        return -ENOMEM;
>> +
>> +    config->trig_out_filter = devm_bitmap_zalloc(dev, config- 
>> >nr_trig_max, GFP_KERNEL);
>> +    if (!config->trig_out_filter)
>> +        return -ENOMEM;
>> +
>> +    config->ctiinen = devm_kcalloc(dev, config->nr_trig_max, 
>> sizeof(u32), GFP_KERNEL);
>> +    if (!config->ctiinen)
>> +        return -ENOMEM;
>> +
>> +    config->ctiouten = devm_kcalloc(dev, config->nr_trig_max, 
>> sizeof(u32), GFP_KERNEL);
>> +    if (!config->ctiouten)
>> +        return -ENOMEM;
>> +
>>       config->nr_ctm_channels = CTI_DEVID_CTMCHANNELS(devid);
>>       /* Most regs default to 0 as zalloc'ed except...*/
>> @@ -189,6 +209,7 @@ static void cti_set_default_config(struct device 
>> *dev,
>>       config->enable_req_count = 0;
>>       config->asicctl_impl = !!FIELD_GET(GENMASK(4, 0), devid);
>> +    return 0;
>>   }
>>   /*
>> @@ -219,8 +240,10 @@ int cti_add_connection_entry(struct device *dev, 
>> struct cti_drvdata *drvdata,
>>       cti_dev->nr_trig_con++;
>>       /* add connection usage bit info to overall info */
>> -    drvdata->config.trig_in_use |= tc->con_in->used_mask;
>> -    drvdata->config.trig_out_use |= tc->con_out->used_mask;
>> +    bitmap_or(drvdata->config.trig_in_use, drvdata->config.trig_in_use,
>> +          tc->con_in->used_mask, drvdata->config.nr_trig_max);
>> +    bitmap_or(drvdata->config.trig_out_use, drvdata- 
>> >config.trig_out_use,
>> +          tc->con_out->used_mask, drvdata->config.nr_trig_max);
>>       return 0;
>>   }
>> @@ -231,6 +254,8 @@ struct cti_trig_con *cti_allocate_trig_con(struct 
>> device *dev, int in_sigs,
>>   {
>>       struct cti_trig_con *tc = NULL;
>>       struct cti_trig_grp *in = NULL, *out = NULL;
>> +    struct cti_drvdata *drvdata = dev_get_drvdata(dev);
>> +    int n_trigs = drvdata->config.nr_trig_max;
>>       tc = devm_kzalloc(dev, sizeof(struct cti_trig_con), GFP_KERNEL);
>>       if (!tc)
>> @@ -242,12 +267,20 @@ struct cti_trig_con 
>> *cti_allocate_trig_con(struct device *dev, int in_sigs,
>>       if (!in)
>>           return NULL;
>> +    in->used_mask = devm_bitmap_zalloc(dev, n_trigs, GFP_KERNEL);
>> +    if (!in->used_mask)
>> +        return NULL;
>> +
>>       out = devm_kzalloc(dev,
>>                  offsetof(struct cti_trig_grp, sig_types[out_sigs]),
>>                  GFP_KERNEL);
>>       if (!out)
>>           return NULL;
>> +    out->used_mask = devm_bitmap_zalloc(dev, n_trigs, GFP_KERNEL);
>> +    if (!out->used_mask)
>> +        return NULL;
>> +
>>       tc->con_in = in;
>>       tc->con_out = out;
>>       tc->con_in->nr_sigs = in_sigs;
>> @@ -263,7 +296,6 @@ int cti_add_default_connection(struct device *dev, 
>> struct cti_drvdata *drvdata)
>>   {
>>       int ret = 0;
>>       int n_trigs = drvdata->config.nr_trig_max;
>> -    u32 n_trig_mask = GENMASK(n_trigs - 1, 0);
>>       struct cti_trig_con *tc = NULL;
>>       /*
>> @@ -274,8 +306,8 @@ int cti_add_default_connection(struct device *dev, 
>> struct cti_drvdata *drvdata)
>>       if (!tc)
>>           return -ENOMEM;
>> -    tc->con_in->used_mask = n_trig_mask;
>> -    tc->con_out->used_mask = n_trig_mask;
>> +    bitmap_fill(tc->con_in->used_mask, n_trigs);
>> +    bitmap_fill(tc->con_out->used_mask, n_trigs);
>>       ret = cti_add_connection_entry(dev, drvdata, tc, NULL, "default");
>>       return ret;
>>   }
>> @@ -288,7 +320,6 @@ int cti_channel_trig_op(struct device *dev, enum 
>> cti_chan_op op,
>>   {
>>       struct cti_drvdata *drvdata = dev_get_drvdata(dev->parent);
>>       struct cti_config *config = &drvdata->config;
>> -    u32 trig_bitmask;
>>       u32 chan_bitmask;
>>       u32 reg_value;
>>       int reg_offset;
>> @@ -298,18 +329,16 @@ int cti_channel_trig_op(struct device *dev, enum 
>> cti_chan_op op,
>>          (trigger_idx >= config->nr_trig_max))
>>           return -EINVAL;
>> -    trig_bitmask = BIT(trigger_idx);
>> -
>>       /* ensure registered triggers and not out filtered */
>>       if (direction == CTI_TRIG_IN)    {
>> -        if (!(trig_bitmask & config->trig_in_use))
>> +        if (!(test_bit(trigger_idx, config->trig_in_use)))
>>               return -EINVAL;
>>       } else {
>> -        if (!(trig_bitmask & config->trig_out_use))
>> +        if (!(test_bit(trigger_idx, config->trig_out_use)))
>>               return -EINVAL;
>>           if ((config->trig_filter_enable) &&
>> -            (config->trig_out_filter & trig_bitmask))
>> +            test_bit(trigger_idx, config->trig_out_filter))
>>               return -EINVAL;
>>       }
>> @@ -687,7 +716,9 @@ static int cti_probe(struct amba_device *adev, 
>> const struct amba_id *id)
>>       raw_spin_lock_init(&drvdata->spinlock);
>>       /* initialise CTI driver config values */
>> -    cti_set_default_config(dev, drvdata);
>> +    ret = cti_set_default_config(dev, drvdata);
>> +    if (ret)
>> +        return ret;
>>       pdata = coresight_cti_get_platform_data(dev);
>>       if (IS_ERR(pdata)) {
>> diff --git a/drivers/hwtracing/coresight/coresight-cti-platform.c b/ 
>> drivers/hwtracing/coresight/coresight-cti-platform.c
>> index 4eff96f48594..557debbc8ca4 100644
>> --- a/drivers/hwtracing/coresight/coresight-cti-platform.c
>> +++ b/drivers/hwtracing/coresight/coresight-cti-platform.c
>> @@ -136,8 +136,8 @@ static int 
>> cti_plat_create_v8_etm_connection(struct device *dev,
>>           goto create_v8_etm_out;
>>       /* build connection data */
>> -    tc->con_in->used_mask = 0xF0; /* sigs <4,5,6,7> */
>> -    tc->con_out->used_mask = 0xF0; /* sigs <4,5,6,7> */
>> +    bitmap_set(tc->con_in->used_mask, 4, 4); /* sigs <4,5,6,7> */
>> +    bitmap_set(tc->con_out->used_mask, 4, 4); /* sigs <4,5,6,7> */
>>       /*
>>        * The EXTOUT type signals from the ETM are connected to a set 
>> of input
>> @@ -194,10 +194,10 @@ static int cti_plat_create_v8_connections(struct 
>> device *dev,
>>           goto of_create_v8_out;
>>       /* Set the v8 PE CTI connection data */
>> -    tc->con_in->used_mask = 0x3; /* sigs <0 1> */
>> +    bitmap_set(tc->con_in->used_mask, 0, 2); /* sigs <0 1> */
>>       tc->con_in->sig_types[0] = PE_DBGTRIGGER;
>>       tc->con_in->sig_types[1] = PE_PMUIRQ;
>> -    tc->con_out->used_mask = 0x7; /* sigs <0 1 2 > */
>> +    bitmap_set(tc->con_out->used_mask, 0, 3); /* sigs <0 1 2 > */
>>       tc->con_out->sig_types[0] = PE_EDBGREQ;
>>       tc->con_out->sig_types[1] = PE_DBGRESTART;
>>       tc->con_out->sig_types[2] = PE_CTIIRQ;
>> @@ -213,7 +213,7 @@ static int cti_plat_create_v8_connections(struct 
>> device *dev,
>>           goto of_create_v8_out;
>>       /* filter pe_edbgreq - PE trigout sig <0> */
>> -    drvdata->config.trig_out_filter |= 0x1;
>> +    set_bit(0, drvdata->config.trig_out_filter);
>>   of_create_v8_out:
>>       return ret;
>> @@ -257,7 +257,7 @@ static int cti_plat_read_trig_group(struct 
>> cti_trig_grp *tgrp,
>>       if (!err) {
>>           /* set the signal usage mask */
>>           for (idx = 0; idx < tgrp->nr_sigs; idx++)
>> -            tgrp->used_mask |= BIT(values[idx]);
>> +            set_bit(values[idx], tgrp->used_mask);
>>       }
>>       kfree(values);
>> @@ -316,23 +316,33 @@ static int cti_plat_process_filter_sigs(struct 
>> cti_drvdata *drvdata,
>>   {
>>       struct cti_trig_grp *tg = NULL;
>>       int err = 0, nr_filter_sigs;
>> +    int nr_trigs = drvdata->config.nr_trig_max;
>>       nr_filter_sigs = cti_plat_count_sig_elements(fwnode,
>>                                CTI_DT_FILTER_OUT_SIGS);
>>       if (nr_filter_sigs == 0)
>>           return 0;
>> -    if (nr_filter_sigs > drvdata->config.nr_trig_max)
>> +    if (nr_filter_sigs > nr_trigs)
>>           return -EINVAL;
>>       tg = kzalloc_obj(*tg);
>>       if (!tg)
>>           return -ENOMEM;
>> +    tg->used_mask = bitmap_zalloc(nr_trigs, GFP_KERNEL);
>> +    if (!tg->used_mask) {
>> +        kfree(tg);
>> +        return -ENOMEM;
>> +    }
>> +
>>       err = cti_plat_read_trig_group(tg, fwnode, CTI_DT_FILTER_OUT_SIGS);
>>       if (!err)
>> -        drvdata->config.trig_out_filter |= tg->used_mask;
>> +        bitmap_or(drvdata->config.trig_out_filter,
>> +              drvdata->config.trig_out_filter,
>> +              tg->used_mask, nr_trigs);
> 
> The error may be silently ignored when a memory allocation error 
> occured. I think it's better to add a log print to tell user what happened.

My fault here, please ignore this comment.
This error will be handled by probe fail process.

Thanks,
Jie


> 
> Thanks,
> Jie
> 
>> +    bitmap_free(tg->used_mask);
>>       kfree(tg);
>>       return err;
>>   }
>> diff --git a/drivers/hwtracing/coresight/coresight-cti-sysfs.c b/ 
>> drivers/hwtracing/coresight/coresight-cti-sysfs.c
>> index 3fe2c916d228..2bbfa405cb6b 100644
>> --- a/drivers/hwtracing/coresight/coresight-cti-sysfs.c
>> +++ b/drivers/hwtracing/coresight/coresight-cti-sysfs.c
>> @@ -719,12 +719,12 @@ static ssize_t trigout_filtered_show(struct 
>> device *dev,
>>       struct cti_drvdata *drvdata = dev_get_drvdata(dev->parent);
>>       struct cti_config *cfg = &drvdata->config;
>>       int nr_trig_max = cfg->nr_trig_max;
>> -    unsigned long mask = cfg->trig_out_filter;
>> +    unsigned long *mask = cfg->trig_out_filter;
>> -    if (mask == 0)
>> +    if (bitmap_empty(mask, nr_trig_max))
>>           return 0;
>> -    return sysfs_emit(buf, "%*pbl\n", nr_trig_max, &mask);
>> +    return sysfs_emit(buf, "%*pbl\n", nr_trig_max, mask);
>>   }
>>   static DEVICE_ATTR_RO(trigout_filtered);
>> @@ -931,9 +931,9 @@ static ssize_t trigin_sig_show(struct device *dev,
>>       struct cti_trig_con *con = (struct cti_trig_con *)ext_attr->var;
>>       struct cti_drvdata *drvdata = dev_get_drvdata(dev->parent);
>>       struct cti_config *cfg = &drvdata->config;
>> -    unsigned long mask = con->con_in->used_mask;
>> +    unsigned long *mask = con->con_in->used_mask;
>> -    return sysfs_emit(buf, "%*pbl\n", cfg->nr_trig_max, &mask);
>> +    return sysfs_emit(buf, "%*pbl\n", cfg->nr_trig_max, mask);
>>   }
>>   static ssize_t trigout_sig_show(struct device *dev,
>> @@ -945,9 +945,9 @@ static ssize_t trigout_sig_show(struct device *dev,
>>       struct cti_trig_con *con = (struct cti_trig_con *)ext_attr->var;
>>       struct cti_drvdata *drvdata = dev_get_drvdata(dev->parent);
>>       struct cti_config *cfg = &drvdata->config;
>> -    unsigned long mask = con->con_out->used_mask;
>> +    unsigned long *mask = con->con_out->used_mask;
>> -    return sysfs_emit(buf, "%*pbl\n", cfg->nr_trig_max, &mask);
>> +    return sysfs_emit(buf, "%*pbl\n", cfg->nr_trig_max, mask);
>>   }
>>   /* convert a sig type id to a name */
>> diff --git a/drivers/hwtracing/coresight/coresight-cti.h b/drivers/ 
>> hwtracing/coresight/coresight-cti.h
>> index c5f9e79fabc6..ef079fc18b72 100644
>> --- a/drivers/hwtracing/coresight/coresight-cti.h
>> +++ b/drivers/hwtracing/coresight/coresight-cti.h
>> @@ -68,7 +68,7 @@ struct fwnode_handle;
>>    */
>>   struct cti_trig_grp {
>>       int nr_sigs;
>> -    u32 used_mask;
>> +    unsigned long *used_mask;
>>       int sig_types[];
>>   };
>> @@ -145,17 +145,17 @@ struct cti_config {
>>       int enable_req_count;
>>       /* registered triggers and filtering */
>> -    u32 trig_in_use;
>> -    u32 trig_out_use;
>> -    u32 trig_out_filter;
>> +    unsigned long *trig_in_use;
>> +    unsigned long *trig_out_use;
>> +    unsigned long *trig_out_filter;
>>       bool trig_filter_enable;
>>       u8 xtrig_rchan_sel;
>>       /* cti cross trig programmable regs */
>>       u32 ctiappset;
>>       u8 ctiinout_sel;
>> -    u32 ctiinen[CTIINOUTEN_MAX];
>> -    u32 ctiouten[CTIINOUTEN_MAX];
>> +    u32 *ctiinen;
>> +    u32 *ctiouten;
>>       u32 ctigate;
>>       u32 asicctl;
>>   };
>>
> 


