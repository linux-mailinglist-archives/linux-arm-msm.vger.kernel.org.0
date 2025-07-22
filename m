Return-Path: <linux-arm-msm+bounces-66164-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 989DAB0E5AD
	for <lists+linux-arm-msm@lfdr.de>; Tue, 22 Jul 2025 23:41:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id BFD10581594
	for <lists+linux-arm-msm@lfdr.de>; Tue, 22 Jul 2025 21:41:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B97F5286D4D;
	Tue, 22 Jul 2025 21:41:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="EFU09Jt6"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18A50286427
	for <linux-arm-msm@vger.kernel.org>; Tue, 22 Jul 2025 21:41:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753220473; cv=none; b=t5jh1FklamNAcsmOBmp0UrnNTBmCl1Zc9P9dQQQARHWX7e9QHchU32uxCzROrXNPidoZK9OaoMv8R57n6Aa9P7YS2VYZVzL2VjrBywbvMZDuGUU03nVnhbDVdK+QTnEDC+v5GYhl/lYzIkDF38fXpiCULUqwk76Z5qxO+alEASk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753220473; c=relaxed/simple;
	bh=1++6CwyVXIhS0UVn0IwIwObfps05A2Vqkiy+jJBxzzA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=RacBBY+B2G4UVNlk8KXDKoJ1sR30HnDuwsMs5nuy2AhCnvwttnlD/j552oiqsScYze4apomN9mSieI8eF58rhEj+S7tccYLjAlSZYJU6/wV9WVE+Adnx5FStlHhs9lhkkMHyb1l+CrjkolFs+DH2wTSrruGFxWXkurxyUd12mQY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=EFU09Jt6; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56MKUsaQ020727
	for <linux-arm-msm@vger.kernel.org>; Tue, 22 Jul 2025 21:41:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	jjqeRMS/46ph8PMRqSc+j1jHH5fh1ltcyKMQO/fuhWo=; b=EFU09Jt6AD+YRXLL
	pLgqiVq0wEeKhRgF5abY5Z0yiZHrPlHbor7i2DdETV0Z3EXMDY/qc51RT/cEOjvx
	MktNxllr1DW/6HMysgzyNTIYJ+k9kOCUiVeka24JsXhrX/tTvUUlygbRKQhAsM97
	0eW6nYR8woBJK9Kewf2BSSyLHigkdwDiAoLDe5TzznK9szmnksJrskPoFNJXmMnk
	yZoNDUyzXJXDHrskBoAmo3Kk07ePvld60vV92H0XUmXRIb8yiB0CWNU75FM0C5EW
	4ajn/hULaAumpB0Tp2AgpsA+NnvRAr/cx1DeQAXfBlts45kaJlOZLzkxZlrUld09
	69/Ncg==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 481t6w43bb-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 22 Jul 2025 21:41:10 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-74943a7cd9aso8941663b3a.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 22 Jul 2025 14:41:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753220469; x=1753825269;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=jjqeRMS/46ph8PMRqSc+j1jHH5fh1ltcyKMQO/fuhWo=;
        b=JoduJSDucvdCWxMz0FsYs1k1K9IDfNoGPFucHbdwxcYuE/fx//2Pnpoc/vhpF8bQTC
         YSH5jTt2gQ2t0ZZsAWWr0FQuNtreqJJejYDV3/1TLo6wU/1aFeyqXLCugIfEHWc4Y+GH
         +bZJjYGF4drU1szNhAi4jBh/Bv5gAFhCfGJ94f+XXsV1CZRiZ0pt9Le4omUW4WscOXyx
         uhTWyW2uKpeKpVA/AXu7w79377ohWKezd5RuKRz56nyRFwitQ3Ml7XWosYRMrIVWqxQ1
         iGHSb+NQ3MDijpnfYCnaHtEJKLgZ0Z+TNguEx/mBIOYADmKQYaOLy4xcQ2tN/tdsvW7B
         gXqQ==
X-Gm-Message-State: AOJu0YzD83r4MierQzDVHveG2Lr+hJ3R/dJUBDlnDxlYYADQ5W7u3eCS
	IpdBf4/ML7j699CmdaU51afVGI+cnDCkC0efnjq7U29XZ/zyf90Rhw3M/MDp2PZcEzR3jCro6gz
	URiVJRL6fUQROEws7+GqIF9PuXiUxmkdzBBRE2cosbNOWOk4c+uaqqofhCvJmj7gt3XVw
X-Gm-Gg: ASbGncvydlwTi9QazMy1FRZC9BPeMjdsaGpuRl0+7Zsb5xQ1sczYL3wwYWagGq5/oKq
	tI6hYrULXSkKqz+1Dv3hfpTXL9mpQvvJvk+ibeiebv1csVqMP9bB+1HSrta23FRw/X1nlXPuQi2
	tFJCUizueLnkdBKoDXYNg+0QMUxZ5iILZMeenrMFfSqOxe5ATnBAQxYXbq4Dh5m9+nbMEqVmbhs
	wgrVJotH1WMF2RJHjh8J5O4Hr1NUC3fc3qSgrLzRLRQ+8Q1zqdxoQIplhxWfvsRNY4nTcQe4HkY
	Y7ebxzu2KkMTABgTSWp9xSLHru4UsrjNIEa9VJ+/f5SVIxhEfRSUDbuQSEYk7XCk
X-Received: by 2002:a05:6a20:9148:b0:217:ff4b:cc57 with SMTP id adf61e73a8af0-23d4915fb8amr590775637.39.1753220469365;
        Tue, 22 Jul 2025 14:41:09 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFAegiXBmz6me1rwnZXHQKFdO1xAzXIAxFFtINhqI1FUmRxyNoREYp9vqjr22X1YmcsF9Ffmg==
X-Received: by 2002:a05:6a20:9148:b0:217:ff4b:cc57 with SMTP id adf61e73a8af0-23d4915fb8amr590746637.39.1753220468954;
        Tue, 22 Jul 2025 14:41:08 -0700 (PDT)
Received: from [192.168.1.4] ([106.222.235.133])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-75ef7510655sm2143552b3a.55.2025.07.22.14.41.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 22 Jul 2025 14:41:08 -0700 (PDT)
Message-ID: <02d1fa2a-0faf-44db-a683-53c5a51e09f1@oss.qualcomm.com>
Date: Wed, 23 Jul 2025 03:11:03 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 16/17] drm/msm/a6xx: Enable IFPC on Adreno X1-85
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20250720-ifpc-support-v1-0-9347aa5bcbd6@oss.qualcomm.com>
 <20250720-ifpc-support-v1-16-9347aa5bcbd6@oss.qualcomm.com>
 <38100984-df2c-4a15-a192-7f38b8671145@oss.qualcomm.com>
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <38100984-df2c-4a15-a192-7f38b8671145@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=SPpCVPvH c=1 sm=1 tr=0 ts=68800576 cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=4dphQItTPUswyQvINXrzgA==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=EUspDBNiAAAA:8 a=wgrHQ5V9N6DtgpC36WEA:9
 a=QEXdDO2ut3YA:10 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzIyMDE4NyBTYWx0ZWRfX3MjtAEPwJ2ma
 pEO4DrftYiyhZjo3Ka3X+B3RGggR4hU6GkHDGXum7vZOmhIlGlxQGJYGNN8p4IAMhgqWy1YWGl+
 je7bEDgobmRgPA7c+hNqCatviSvDtmd5waY+lqU8r/QCuxndCUp1l7jVdoCPqPDCPtMXmtRRcKt
 Q4WOuU8l4/mw5y6xqZmtKC869NbOfQbeL3qkEGe9e4dwULLdk99XD/2P82+EpTCzOKTBhXEeCyg
 6RvIaupx0fbsBZzvJIt+zkCkNwQ9jWo6XWwNtI8eQKXCkpihv2FL681oSRKD2E2k8j1N9apbFyA
 rO10PpKRTBc3HBcEE3HL7YHqj0juzPjNKB4RYXriNm78EDeXsmzzArAsT4hkXLcCCwkXw1QqTry
 lQxyqwSfqtD5gnLPKZTIC3OP3Uzn8o6V1ePEkGgegyBEC24qqVdspA2WtX6F8hNXOjpkyHJz
X-Proofpoint-ORIG-GUID: q_mMGvEaE-mX-HDCuoKYZ5o2sD5i6L9n
X-Proofpoint-GUID: q_mMGvEaE-mX-HDCuoKYZ5o2sD5i6L9n
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-22_03,2025-07-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=0 adultscore=0 phishscore=0 malwarescore=0
 mlxscore=0 bulkscore=0 clxscore=1015 priorityscore=1501 impostorscore=0
 lowpriorityscore=0 mlxlogscore=595 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2507220187

On 7/22/2025 8:25 PM, Konrad Dybcio wrote:
> On 7/20/25 2:16 PM, Akhil P Oommen wrote:
>> Add the IFPC restore register list and enable IFPC support on Adreno
>> X1-85 gpu.
>>
>> Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
>> ---
>>  drivers/gpu/drm/msm/adreno/a6xx_catalog.c | 67 ++++++++++++++++++++++++++++++-
>>  drivers/gpu/drm/msm/adreno/a6xx_gpu.c     | 15 +++++--
>>  drivers/gpu/drm/msm/adreno/a6xx_gpu.h     |  1 +
>>  3 files changed, 78 insertions(+), 5 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_catalog.c b/drivers/gpu/drm/msm/adreno/a6xx_catalog.c
>> index 70f7ad806c34076352d84f32d62c2833422b6e5e..07fcabed472c3b9ca47faf1a8b3f7cf580801981 100644
>> --- a/drivers/gpu/drm/msm/adreno/a6xx_catalog.c
>> +++ b/drivers/gpu/drm/msm/adreno/a6xx_catalog.c
>> @@ -1343,6 +1343,69 @@ static const uint32_t a7xx_pwrup_reglist_regs[] = {
>>  
>>  DECLARE_ADRENO_REGLIST_LIST(a7xx_pwrup_reglist);
>>  
>> +/* Applicable for X185, A750 */
>> +static const u32 a750_ifpc_reglist_regs[] = {
>> +	REG_A6XX_TPL1_BICUBIC_WEIGHTS_TABLE_0,
>> +	REG_A6XX_TPL1_BICUBIC_WEIGHTS_TABLE_1,
>> +	REG_A6XX_TPL1_BICUBIC_WEIGHTS_TABLE_2,
>> +	REG_A6XX_TPL1_BICUBIC_WEIGHTS_TABLE_3,
>> +	REG_A6XX_TPL1_BICUBIC_WEIGHTS_TABLE_4,
>> +	REG_A6XX_TPL1_NC_MODE_CNTL,
>> +	REG_A6XX_SP_NC_MODE_CNTL,
>> +	REG_A6XX_CP_DBG_ECO_CNTL,
>> +	REG_A6XX_CP_PROTECT_CNTL,
>> +	REG_A6XX_CP_PROTECT(0),
>> +	REG_A6XX_CP_PROTECT(1),
> 
> Is it fair to assume that we'd like to saverestore all CP_PROT
> registers on all SKUs, always? We can save some space in .rodata
> this way..

Yeah. Makes sense, but lets do that when we duplicate it in future.

-Akhil

> 
> Konrad


