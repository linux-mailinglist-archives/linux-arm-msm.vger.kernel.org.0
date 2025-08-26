Return-Path: <linux-arm-msm+bounces-70869-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C52EEB358FD
	for <lists+linux-arm-msm@lfdr.de>; Tue, 26 Aug 2025 11:33:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 93D0420491E
	for <lists+linux-arm-msm@lfdr.de>; Tue, 26 Aug 2025 09:33:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0F5902FF166;
	Tue, 26 Aug 2025 09:33:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Op29AEhl"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7BD442E2EFC
	for <linux-arm-msm@vger.kernel.org>; Tue, 26 Aug 2025 09:33:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756200833; cv=none; b=rCSOxehwZkYs7Lz+xHXsa6lpeRZzjIx4qZFD2zOsTh7auPdApCsGqlsykwKgRha38IlY2kKF4C5weUJnqmvxWp0iImXn3h7AkpryBVlUtytuj5qIFfraclGxlZ63W6TsuMoS+d/cgs4EsGJqxRST9u+QylwsA+lwEY0a6l2/qVE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756200833; c=relaxed/simple;
	bh=QYV5NwJ7S/Pv6MoEiV/OzrLPtIUTRn+KUFr5Afov3o0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=DD3lWNIlJmNh+cmPaFpc2JwReFfr0Z0DOwCTj+JIw1zOGt9haCRZ2P6DXd5Qyn1NcvR8Yln9LoV93ijFs7+g2G/BTCXG/whQANXbD0aMvlLTNcr46cS4wYP3FfOzaoHCMuKEDwkqBfvZibmAPBxRvI0StqY4wXKWW6pa3MiXCkA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Op29AEhl; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57Q8LUZl018429
	for <linux-arm-msm@vger.kernel.org>; Tue, 26 Aug 2025 09:33:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	7PRqUbPyyCeb0D+drQmqPy+hroCqwBFq8MUVQmpsI88=; b=Op29AEhlNe32ev8n
	pP0Xo6Se44beRsXEF6g2AX2RDuWrPBHIybbgvraTAdpH1fMA9mclyNOm97gtnaBm
	+F+ZJ1tTcrwC76TDHeP6L4bjZJwogYr6L0IxRA5U2mLp+sQnWDo349vm+Znbn0UB
	lQU/xLmzWD+8IqWoo2qQpbNy2AncVVNoo4+YjJmj9abdDqdQg04+8QHet14qeKFd
	Bh5WO8ahS5fzfx/Fuq4dY5eO+jLGc0SXfeDzE1KBNwNhQ21ZhIE0a6oRmBeQhrJi
	N0rMqgIpoUjaZ8oPMgJZP/VxTjcUPWq4PxPJglRAT8fvw/Bh7xsCYYhKlr+WIOBQ
	5sKx9w==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48q5unr5u6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 26 Aug 2025 09:33:50 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-76e395107e2so5090289b3a.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 26 Aug 2025 02:33:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756200829; x=1756805629;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=7PRqUbPyyCeb0D+drQmqPy+hroCqwBFq8MUVQmpsI88=;
        b=Md6/vvc4PUPbGmctDGjMEAxsx1+11rDjbYBHhaic/2AikKtClzC39CMwXyAA69OVd3
         gxNDqodoxbxJGKnR4kia31VEM4jCwPxb/fRYuHnBbziVfUhUhgdrQHBiicuzpyQnxtg3
         Mpw2UIZl05ylkGX+emQldOSLc024DXp7D8p4mLxamKEdNexnTVcmnOUCfaEZ2ABvMIle
         pK3pF6XVPGt30bFH2W2jMQ0VEAOCxP3i3YmbGfh2LCfKRrx7/+fBAmPt7PnMT2oBNNRP
         zhf95hdpQyqaE1+GbrURTcZ6DJ5ACoVi8+e9XhDU8PDUly8OQhL6hMM4Qfnf7zRi3sSm
         bRMg==
X-Forwarded-Encrypted: i=1; AJvYcCUtJlnfDNjHs+8Tp0cWUF0cr2gRWjXdtZZmxiaqkwar012wHZcrg9H8lWwp3NfjtSW4W3EB4BUpHyNPTFQS@vger.kernel.org
X-Gm-Message-State: AOJu0YxnnTo3ByCFq0vcxIj57MpXGYG3/6U70nw7HrW5SrBcXOTryExp
	YvnA5dl+2+diWb1PiWJhDp8BZJCZAsP/X310GW55sloAO7m2+G+gsFFASQMAPNSvROZ+U8tqKHt
	tRgvclt1GbnDBa2Zb8cVI7fkN5Fil15Ru3mET/+yG6kM1N2To47U83BlV2dFKHlyKyuBD
X-Gm-Gg: ASbGnctETxYoz8RU0DisaqKuWZEslOVAlV8mN+WWiWLdIZYDWG4IgAmccRNyUYTpsPc
	o7nB418xCqGz3uHu7T4jyFYDDZQMf0QG5n4dEDORRAell7LR9Ox6PopjnSHA3bulGPlERADT756
	u/fwTgta/8mYNNcRIbbpKVwFUBsM1Tz4h1+GyEqciyLaJWs59NNC/TL0FAfzlQ9LbMvgXj2Xsk8
	1LeHIdXrf1dIZ/sRO0YCg1VfNU/8TXViqYLiN/HiEt4Wh/M2TS3w4oMLLE13gmBbATz5V4Ba1Gk
	1j6BF0OlrUJdi7MUvuurpnSU2NFhm/OHsY+FBTHzkePb+D7K0q5LUG2WxbGNafeMKx1HEqbhuKs
	h2hXVFGZoYEIHbecgFA==
X-Received: by 2002:a05:6a00:1953:b0:771:e4b0:4641 with SMTP id d2e1a72fcca58-771e4b04bbdmr7079020b3a.1.1756200828954;
        Tue, 26 Aug 2025 02:33:48 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEsBgxQWCd0jMdTxGmaxKcluUUwbnejxoC4///CnAcNcxNaawFjaqarQErR5g1XYtLdTugzLg==
X-Received: by 2002:a05:6a00:1953:b0:771:e4b0:4641 with SMTP id d2e1a72fcca58-771e4b04bbdmr7078981b3a.1.1756200828432;
        Tue, 26 Aug 2025 02:33:48 -0700 (PDT)
Received: from [10.133.33.155] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-771ee83092dsm3325259b3a.100.2025.08.26.02.33.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 26 Aug 2025 02:33:48 -0700 (PDT)
Message-ID: <c78a157f-d8d8-4647-8a2b-4409489633db@oss.qualcomm.com>
Date: Tue, 26 Aug 2025 17:33:43 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 2/3] coresight: tpda: add function to configure
 TPDA_SYNCR register
To: James Clark <james.clark@linaro.org>, Jie Gan <jie.gan@oss.qualcomm.com>
Cc: coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        Suzuki K Poulose <suzuki.poulose@arm.com>,
        Mike Leach
 <mike.leach@linaro.org>,
        Alexander Shishkin <alexander.shishkin@linux.intel.com>,
        Tingwei Zhang <tingwei.zhang@oss.qualcomm.com>
References: <20250826070150.5603-1-jie.gan@oss.qualcomm.com>
 <20250826070150.5603-3-jie.gan@oss.qualcomm.com>
 <66cfff9c-e0ec-4171-b62d-80d6139c42f3@linaro.org>
Content-Language: en-US
From: Jie Gan <jie.gan@oss.qualcomm.com>
In-Reply-To: <66cfff9c-e0ec-4171-b62d-80d6139c42f3@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: JRp-dzJpdmFJwo1189JXX1q9EvnBB09h
X-Proofpoint-ORIG-GUID: JRp-dzJpdmFJwo1189JXX1q9EvnBB09h
X-Authority-Analysis: v=2.4 cv=JJo7s9Kb c=1 sm=1 tr=0 ts=68ad7f7e cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=EUspDBNiAAAA:8 a=PWyc2w4wzOwSXG3kJUsA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODIzMDAzMSBTYWx0ZWRfX3+u3+aG6xkzw
 24APqGjJXH7lmvUBnauFc0/LA5V5GnaMQcozwbVyWrycUFQZqTo/MkMFMnC9419TytGSttOhyAl
 N4bcJ1cgRD5CUki4mN/XXiSujU+/Ofxyt5yT8i4EjlCJgMU7zTmis5cxMm6yqk99gTyJfJEO5sy
 RHnnoF+yEgqRUp7xYzoz/aTcHKjxI6t0LrtT15mUGbSJBeywE53b98KuJEJaFOU16L0ZaJ8fVIQ
 klDHRfK2PuqIp6ivpnLqaVew82pd0LgzPLJ15U+vUSgQRnk7Elzrg/SWMlmakIyMD+iY6I+20AJ
 bG7NUholxm+7L3BbHC2dQymD9gcbCwKZFn+37xKx75SlbLecNCHcPwFB1rqxCe8jbXi4/aSlS+N
 BbSkFxLE
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-26_02,2025-08-26_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 adultscore=0 bulkscore=0 spamscore=0 impostorscore=0
 malwarescore=0 clxscore=1015 priorityscore=1501 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508230031



On 8/26/2025 5:20 PM, James Clark wrote:
> 
> 
> On 26/08/2025 8:01 am, Jie Gan wrote:
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
>>   drivers/hwtracing/coresight/coresight-tpda.c | 15 +++++++++++++++
>>   drivers/hwtracing/coresight/coresight-tpda.h |  1 +
>>   2 files changed, 16 insertions(+)
>>
>> diff --git a/drivers/hwtracing/coresight/coresight-tpda.c b/drivers/ 
>> hwtracing/coresight/coresight-tpda.c
>> index cc254d53b8ec..9e623732d1e7 100644
>> --- a/drivers/hwtracing/coresight/coresight-tpda.c
>> +++ b/drivers/hwtracing/coresight/coresight-tpda.c
>> @@ -189,6 +189,18 @@ static void tpda_enable_pre_port(struct 
>> tpda_drvdata *drvdata)
>>           writel_relaxed(0x0, drvdata->base + TPDA_FPID_CR);
>>   }
>> +static void tpda_enable_post_port(struct tpda_drvdata *drvdata)
>> +{
>> +    uint32_t val;
> 
> Minor nit: this is inconsistent with u32 used elsewhere in this file.

Will fix it in next version.

> 
>> +
>> +    val = readl_relaxed(drvdata->base + TPDA_SYNCR);
>> +    /* Clear the mode */
>> +    val = val & ~TPDA_MODE_CTRL;
> 
> &=

Will fix.

> 
>> +    /* Program the counter value */
>> +    val = val | 0xFFF;
> 
> |=

Will fix.

> 
> Defining a field would be a bit nicer here. Like:
> 
> val |= FIELD_PREP(TPDA_SYNCR_COUNTER, UINT32_MAX);

That's better, forgot to use the proper Macro. I will re-check all codes 
again to update all possible fixes.

> 
> Assuming you wanted to set all bits, and 0xFFF isn't some specific value.

Yes, this field has 12 bits and we prefer the max value to prevent to 
generate too many ASYNC packets. This field indicates a count value for 
number of bytes. Once the the count reaches the number, a ASYNC packet 
will be generated.

> 
>> +    writel_relaxed(val, drvdata->base + TPDA_SYNCR);
>> +}
>> +
>>   static int tpda_enable_port(struct tpda_drvdata *drvdata, int port)
>>   {
>>       u32 val;
>> @@ -227,6 +239,9 @@ static int __tpda_enable(struct tpda_drvdata 
>> *drvdata, int port)
>>           tpda_enable_pre_port(drvdata);
>>       ret = tpda_enable_port(drvdata, port);
>> +    if (!drvdata->csdev->refcnt)
>> +        tpda_enable_post_port(drvdata);
> 
> Any reason this can't be done on tpda_enable_pre_port()? It has the same 
> logic where it's only done once for the first port.
> 
> If it can't be done there you should add a comment saying why it must be 
> done after enabling the first port.

This register only affect the port which already be enabled. That's why 
we add it to enable_post_port. But as you mentioned, we can put the 
logic into enable_pre_port without side effect.

I think it's ok to move the logic to enable_pre_port to simply codes here.

Thanks,
Jie

> 
>> +
>>       CS_LOCK(drvdata->base);
>>       return ret;
>> diff --git a/drivers/hwtracing/coresight/coresight-tpda.h b/drivers/ 
>> hwtracing/coresight/coresight-tpda.h
>> index b651372d4c88..00d146960d81 100644
>> --- a/drivers/hwtracing/coresight/coresight-tpda.h
>> +++ b/drivers/hwtracing/coresight/coresight-tpda.h
>> @@ -9,6 +9,7 @@
>>   #define TPDA_CR            (0x000)
>>   #define TPDA_Pn_CR(n)        (0x004 + (n * 4))
>>   #define TPDA_FPID_CR        (0x084)
>> +#define TPDA_SYNCR        (0x08C)
>>   /* Cross trigger FREQ packets timestamp bit */
>>   #define TPDA_CR_FREQTS        BIT(2)
> 
> 


