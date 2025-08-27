Return-Path: <linux-arm-msm+bounces-70996-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 695ADB37F46
	for <lists+linux-arm-msm@lfdr.de>; Wed, 27 Aug 2025 11:52:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 700161BA08B4
	for <lists+linux-arm-msm@lfdr.de>; Wed, 27 Aug 2025 09:52:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 416E828312E;
	Wed, 27 Aug 2025 09:52:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="OswuahoZ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 989FC2989B7
	for <linux-arm-msm@vger.kernel.org>; Wed, 27 Aug 2025 09:52:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756288340; cv=none; b=EgvIzQyaI6QkDRFxIk4zneVIBxEf8FXZPylNjexZ6VCpRL1yIyE2qn2jeEQViUXbRccZkGgtFs58mvGfxXTS/0B+Aw54lrrLfD1DUgfELwxJ8e8hKhtz6zDRDUrSvv8kVJ1YspaN8LAbmdREgcw3ociqepYM+dfNDJwjDDFFbl8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756288340; c=relaxed/simple;
	bh=daSs5MywIp3VryjquzPKMYZx/u/dDjIB7rSQyXJl2Y0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=qD7uaPyVvoGF8f/b0sZHOkM+85wO8fw9PqqWlaSZMocJ8WE27tk4bBHgGCEtZr/DrgldJcnvYLPdAT6kikHLZ/mI3hZWn5hU1yflSwN6SzsmkSoRGWOWyBVBVs1hNMnccFJ9Q81Xp+yusuAZJqKfoHng2GARwlacAgo3MnwPYns=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=OswuahoZ; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57R6kgo2003981
	for <linux-arm-msm@vger.kernel.org>; Wed, 27 Aug 2025 09:52:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	38PuOyK1CwicT9yvnRLkviMk8ANShrxIjK+M3ztAQcI=; b=OswuahoZuzn1yWDT
	TGeW5cKDT02DhGYS3D5gxHZHc90lsAxbIhepSgDP2H63PoOIldu9xeC2/DRPta1i
	HCKGwcMo86CO9RDZ5z36YpRwpuRrNk8ze8pB1R44tcyDH6m82sqAFBk+iUc+VRKa
	czkl1saXIupXon4DvmzlIY7kJp5dGP081+wEJoJShJ0mLB+FRfW6SujKu156LaFQ
	FCqJ0gBvkP2pR5gRh3Mi2xNsWiDC4to+0VhAUhN2Aca6T/jsRKKSc8JIdDcK5i5w
	YCdD+vDZ7wMrvnbBxWxVMbBgUxCcCMWi5uoT5W6205bkQqicPzXa5vPA/+H16bgm
	8pP8sA==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48q6x8ca4s-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 27 Aug 2025 09:52:17 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-244570600a1so8151805ad.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 27 Aug 2025 02:52:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756288337; x=1756893137;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=38PuOyK1CwicT9yvnRLkviMk8ANShrxIjK+M3ztAQcI=;
        b=p09HtkOXdvSAleFtc/vrkLofEPjXiDPgqGa+AS7vKAFaxQsINGxifgdjWhWLIOGTEe
         /A2c9KrMy+k05QmTZDk1jUfq8aGzpqBhP2CDkDj25g+/gNVfdQlJOQlROZabEU0ZrXIO
         eqC31shIe6ry1laWgGsa0a46qmDW+I2KWZOEEir/P3GW2TRPEYlYeWQXabqR+hvt4Pes
         an/G6ttPkBMnCIxyj/Ezn1WQ/2utC8eNmXgkDbZxl4glc4MJCcE2Ckwy0K2I7+lH1E9p
         Ojs7MHMItZ7XMDti9P7Rw8mi9Vm+ifccpWLKYNC5JNh3lD4xaEFjDfycmnsfFaLV+/5x
         NJIA==
X-Forwarded-Encrypted: i=1; AJvYcCXP91I9eG1ri7sMlA36xEU41UK04vxQNY/RRKTz/iXsMVgAW0g7AaFFtuVHlA0e7nClhMn8wh26F2sieYD+@vger.kernel.org
X-Gm-Message-State: AOJu0Yy+d+sZLDyj0QhZ4Gy9fwM1mJgfGgc9ucP2LNf6JbN0ea8Hz0W+
	VOwNeolbooxxzGLAadfg4j0/Fi8Bh5u2GSW8QcVAtLhXVFYiFx+RniUu+w1H/eo6LCkuKPjhkyk
	ZdvUHQ2POC5OYqEMG2TlSJLE1q+7Z5mVyugaECkeoSPJdmE6l/sKRBob4VZPZrxW09Ti4
X-Gm-Gg: ASbGncs4B6yeATzQjJ0rX4rPU4am4pOrk7mR9oeHAMwBe6M+zksbAORSfNQsWMWi+Iv
	qt5FaN082xIb57xJ4ATjH3CEJdO0mgl6DWfxhV0kFRmmnFxKrXTRI/CzD/Zi8YjdXVnPO0hymcM
	b7M1W32tgAalKu3xza8iIcOXAmdFnQ9pbB8r97nwjQOzQCMsP6VGxzs2PMLrDD9jiUQdaSrG2dv
	rD0Vp+1T/i4GpPZBLhYMGEShodINssZiOBJQw0Z9db/wtJ4NU0r/c28wvCDTRWAvAj5uB4F8d4w
	hc6koOkwxqcD3imrp9vGTEx8DJ58GbbWDBeyJcVTplfgV4hU77L1ux+JqbiInr3fqfqEQjpASuK
	wevB40bZ/SZ8kJPdY1OmEKBMioQRdwA==
X-Received: by 2002:a17:902:d4c4:b0:246:570:d7dc with SMTP id d9443c01a7336-248753a2586mr57319425ad.29.1756288336797;
        Wed, 27 Aug 2025 02:52:16 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEMqpv1EtUmfVYvvw4NyCrb2c6aBD9PYVzjyLEAVHsHsPqYt3z3ozhkmwEkYUHJOXvpnFt2iQ==
X-Received: by 2002:a17:902:d4c4:b0:246:570:d7dc with SMTP id d9443c01a7336-248753a2586mr57319045ad.29.1756288336077;
        Wed, 27 Aug 2025 02:52:16 -0700 (PDT)
Received: from [10.133.33.155] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-32745900a2dsm2019828a91.4.2025.08.27.02.52.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 27 Aug 2025 02:52:15 -0700 (PDT)
Message-ID: <2648f422-6bef-4336-bdda-2d1663bc2807@oss.qualcomm.com>
Date: Wed, 27 Aug 2025 17:52:09 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/3] coresight: tpda: add logic to configure TPDA_SYNCR
 register
To: James Clark <james.clark@linaro.org>, Jie Gan <jie.gan@oss.qualcomm.com>
Cc: coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        Suzuki K Poulose <suzuki.poulose@arm.com>,
        Mike Leach
 <mike.leach@linaro.org>,
        Alexander Shishkin <alexander.shishkin@linux.intel.com>,
        Tingwei Zhang <tingwei.zhang@oss.qualcomm.com>
References: <20250827042042.6786-1-jie.gan@oss.qualcomm.com>
 <20250827042042.6786-3-jie.gan@oss.qualcomm.com>
 <4ca657cf-1c8e-4d51-aba9-c894c32a23b3@linaro.org>
Content-Language: en-US
From: Jie Gan <jie.gan@oss.qualcomm.com>
In-Reply-To: <4ca657cf-1c8e-4d51-aba9-c894c32a23b3@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: GLrJvQcPyzTUy1itdA-9_E8Ucuib-xYv
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODIzMDA0NCBTYWx0ZWRfX0v5bMzRP+CJz
 I6RHy05rmvaVdc4Wwx5kfCVa+3UuTwxez61vKWIpZjsod2/DKCy/uhn/TCc3RcOr0/UD/IS3Jfb
 S6nrfQ4GK6YcMqwqvwB1ClKBJ2GLBKpMY+ZOfIDRd7NA7XwaUKPZun+UNwPX4b9zWSmKQvwRpzW
 c807owrP0yERCS9JO6Wpsx9kuLTnwTxCeJHyJFvXwPeaZQm5FZmMCt4RQq0N9YiAyd5e531BMjL
 +UxGTOnE6z10xT2n++6qtII6xCrjFIRLMI9VckZ4Xn3K9WETkmCOiPvr+nTAqKvCk7z6igs+LOe
 lKfUq9yEO1FrFCO6/nr51CM/G2+2F8FYvPiRCUOxwh30Y2J4QgOIyzpzuQON0YSsMjJxWBU/Aay
 xKIlW9ks
X-Proofpoint-GUID: GLrJvQcPyzTUy1itdA-9_E8Ucuib-xYv
X-Authority-Analysis: v=2.4 cv=Ep/SrTcA c=1 sm=1 tr=0 ts=68aed551 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=EUspDBNiAAAA:8 a=fCV0n7f5gNrMv1PFtk0A:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-27_01,2025-08-26_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0 adultscore=0 bulkscore=0 suspectscore=0
 phishscore=0 priorityscore=1501 malwarescore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508230044



On 8/27/2025 5:21 PM, James Clark wrote:
> 
> 
> On 27/08/2025 5:20 am, Jie Gan wrote:
>> From: Tao Zhang <tao.zhang@oss.qualcomm.com>
>>
>> The TPDA_SYNCR register defines the frequency at which TPDA generates
>> ASYNC packets, enabling userspace tools to accurately parse each valid
>> packet.
>>
>> Signed-off-by: Tao Zhang <tao.zhang@oss.qualcomm.com>
>> Co-developed-by: Jie Gan <jie.gan@oss.qualcomm.com>
>> Signed-off-by: Jie Gan <jie.gan@oss.qualcomm.com>
>> ---
>>   drivers/hwtracing/coresight/coresight-tpda.c | 7 +++++++
>>   drivers/hwtracing/coresight/coresight-tpda.h | 6 ++++++
>>   2 files changed, 13 insertions(+)
>>
>> diff --git a/drivers/hwtracing/coresight/coresight-tpda.c b/drivers/ 
>> hwtracing/coresight/coresight-tpda.c
>> index 647ab49a98d7..430f76c559f2 100644
>> --- a/drivers/hwtracing/coresight/coresight-tpda.c
>> +++ b/drivers/hwtracing/coresight/coresight-tpda.c
>> @@ -187,6 +187,13 @@ static void tpda_enable_pre_port(struct 
>> tpda_drvdata *drvdata)
>>        */
>>       if (drvdata->trig_flag_ts)
>>           writel_relaxed(0x0, drvdata->base + TPDA_FPID_CR);
>> +
>> +    /* Program the counter value for TPDA_SYNCR */
>> +    val = readl_relaxed(drvdata->base + TPDA_SYNCR);
>> +    /* Clear the mode */
>> +    val &= ~TPDA_SYNCR_MODE_CTRL;
>> +    val |= FIELD_PREP(TPDA_SYNCR_COUNTER_MASK, 
>> TPDA_SYNCR_MAX_COUNTER_VAL);
> 
> Just use the mask directly if you want to set all the bits. This makes 
> it seem like the MAX_COUNTER_VAL is something different.
> 

You are right. will fix it.

> val |= TPDA_SYNCR_COUNTER_MASK
> 
>> +    writel_relaxed(val, drvdata->base + TPDA_SYNCR);
>>   }
>>   static int tpda_enable_port(struct tpda_drvdata *drvdata, int port)
>> diff --git a/drivers/hwtracing/coresight/coresight-tpda.h b/drivers/ 
>> hwtracing/coresight/coresight-tpda.h
>> index 0be625fb52fd..8e1b66115ad1 100644
>> --- a/drivers/hwtracing/coresight/coresight-tpda.h
>> +++ b/drivers/hwtracing/coresight/coresight-tpda.h
>> @@ -9,6 +9,7 @@
>>   #define TPDA_CR            (0x000)
>>   #define TPDA_Pn_CR(n)        (0x004 + (n * 4))
>>   #define TPDA_FPID_CR        (0x084)
>> +#define TPDA_SYNCR        (0x08C)
>>   /* Cross trigger FREQ packets timestamp bit */
>>   #define TPDA_CR_FREQTS        BIT(2)
>> @@ -27,6 +28,11 @@
>>   #define TPDA_Pn_CR_CMBSIZE        GENMASK(7, 6)
>>   /* Aggregator port DSB data set element size bit */
>>   #define TPDA_Pn_CR_DSBSIZE        BIT(8)
>> +/* TPDA_SYNCR mode control bit */
>> +#define TPDA_SYNCR_MODE_CTRL        BIT(12)
>> +/* TPDA_SYNCR counter mask */
>> +#define TPDA_SYNCR_COUNTER_MASK        GENMASK(11, 0)
>> +#define TPDA_SYNCR_MAX_COUNTER_VAL    (0xFFF)
> 
> No need to define a numeric value that's the same as the mask. It also 
> opens the possibility of making a mistake.
> 

will remove.

Thanks,
Jie

>>   #define TPDA_MAX_INPORTS    32
> 
> 


