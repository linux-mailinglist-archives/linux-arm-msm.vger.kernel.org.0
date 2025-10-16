Return-Path: <linux-arm-msm+bounces-77650-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B26B6BE5C39
	for <lists+linux-arm-msm@lfdr.de>; Fri, 17 Oct 2025 01:10:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6DDC85823F8
	for <lists+linux-arm-msm@lfdr.de>; Thu, 16 Oct 2025 23:10:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A09382DF710;
	Thu, 16 Oct 2025 23:10:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="oRyqIqTW"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7118E2E1F00
	for <linux-arm-msm@vger.kernel.org>; Thu, 16 Oct 2025 23:10:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760656220; cv=none; b=CYrn7m0MSa06kUVo3n6GMGGTaFpaux9tKlx5JANGz/sS6zV4QuIkHokrcC8Tw9Lz6CuC2PTYMlsEyil+AY1RLIJhKElugR7peedLLSi1U3uwI46rw252uxakjCoN8R75LkvdahtbEioQ2ChDqn+c5QTPMhJoPbmmpPnKRws16C4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760656220; c=relaxed/simple;
	bh=1XLsS3RAIEx6by2HVEXnSKd0ADVsSaO6quvpcnso1qQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=NcDUKxsTpSmwCwrLZXlQC1SjlsiGvj0AJMOKGzzA0vSUzNAvZIDDopUlgwCOHIJhwyyXoUG4wyRHFA0fe18u+ejGu2OHQIdceSATArIBiiZavxqJaSsKyaYQiLxexXziUBpR3FGpwBid9hgXQ0XzoXuRMKQigvNrbbIin41UMTk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=oRyqIqTW; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59GKLl7S017087
	for <linux-arm-msm@vger.kernel.org>; Thu, 16 Oct 2025 23:10:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	1tPINqjigGOZj9I27QX/968lYU1qIXvwjHcC4xMne5U=; b=oRyqIqTWyxdyqGuj
	hYdayYyK27EPRL20FPIbhGMLjY2VbbaihwV/P5tjc7gbW7akiCAT9giKOmuuwkO5
	qJD+gSv8KTVdUMrxwM3G+noZ11YzBOoreOo6vjrCGAhSemP5WwRAObhwepzKd1yo
	IBs6pqmD0dM2OsgEkn+5W3p5Fb4unQ3Rr7d+8T+AI6MuBq3an1BWQWhe+GZq/9yd
	9kHlABCJIwj6FKBHhjJZvGyKNCNviE5GaCDOwE6i1VLi88urIXFxtz+xwMuOkyof
	bOb/otGCJhYvqF1liU57Scjwf97N0aQxyizarPOqjBwkOquLlXCBNBKgKUOwkzI9
	/D7ChQ==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49qfm5t9sj-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 16 Oct 2025 23:10:17 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-28e538b5f23so15243805ad.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 16 Oct 2025 16:10:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760656216; x=1761261016;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=1tPINqjigGOZj9I27QX/968lYU1qIXvwjHcC4xMne5U=;
        b=irVl+xpffbT6mIsvX8KgnmR06lP3M9BUYHDU62cooEIBvwIQfP85/5ykiAexAkRjnB
         gW9uXqshr0jE2sxkLNQhpBboKvQwgiU2BFUS4j8GONpUO5/7ox4NFc+KMUV4MFrIIZf2
         oOoONtuKr6sQpMz+mEn6IngAFIBdaxXGtSX9wP5QkAQw0WnG4N9ZH0vzxxwQFdEzGKk6
         gEJZrJQhjuGtWbcaFRArhmwFGI3V11tKzkpR87RodNn1xjYEK/2oPOcJx88xD+aJhPat
         NxQ6aq4lsoM8oD3a9TcHKfNGTAmJb+3B0NZeJFcgVF2xi0M1GWG/wXWnxAQSa1EMPYLp
         pwAQ==
X-Forwarded-Encrypted: i=1; AJvYcCUSkJDy9koVfzZl3vkmfqR82+16CUNAFEyIdlKwH30nf3//eDZoChqKyHASkYLN95YeKf/QL4nFlMdzFBQh@vger.kernel.org
X-Gm-Message-State: AOJu0YzoR6xYWf/HXHe7vkyyFYmm2kzZ8qH84fhbI3fvdxy82HEgqB4S
	rahWVBOTGZ1XpYctgPHBTLFe9+EFQteBiU0p0vAymhA7zn0UGELu3KUC32iMBKfudcmNjQyH/jN
	VnY8nGtCUgMcVMLLwxnU5x4rn2AZ3B2vt8vWKMZRV+ftRQ9DymmldD5WnIyyHLO2ZMbyE
X-Gm-Gg: ASbGnctoup36dvucQejM+NVq/yibPVNkuYTdegVWBL0qmqOwB6S85oY+qO8y7Up0jKd
	XGpjVxx/UtSSZKVvyOPRNgZiBEImVvyhwr7lIBgmRe8GFDzohe88z8lSL16qGODdD01yZgc3i++
	SFwyqYKAbwEnwpEMD+KewPbQydm4tFD52j7I5Z7u3O/ewRi5jtZYn5fbqVAIQRBFlJZAVANtV0f
	GuHycXB4yafFdBsi5mbR1M1sF2WM9KoHWoZ+zr6TBbWtBHa8vVv7xcGzawxbkmR2TlkymgARYs3
	2RnSXLySzdNioUG/yqd1Hu8iNCfzZI6Vjnvqar60c/3v0uJ+4eIReGeACvb+pVyq7ApjTV+qGb9
	apdnd+bMkPH9T6BSjUFaiIAv4mgDxdzTLity0Nb3qUwGMnngCS3WLPA==
X-Received: by 2002:a17:903:120c:b0:269:b6c4:1005 with SMTP id d9443c01a7336-290cb94b68emr20083505ad.55.1760656215759;
        Thu, 16 Oct 2025 16:10:15 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHiYfaBWbys9UzgyANLmFAYmV5ZKjYCVGYbDeOmnmvnPv1IKlpNavonKjhTDyi8fNIYCKZCQw==
X-Received: by 2002:a17:903:120c:b0:269:b6c4:1005 with SMTP id d9443c01a7336-290cb94b68emr20083015ad.55.1760656215103;
        Thu, 16 Oct 2025 16:10:15 -0700 (PDT)
Received: from [10.62.37.19] (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29099a7d19dsm42393095ad.71.2025.10.16.16.10.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 16 Oct 2025 16:10:14 -0700 (PDT)
Message-ID: <eb7992e4-f0a8-4266-ac4a-3de7694ac582@oss.qualcomm.com>
Date: Thu, 16 Oct 2025 16:10:13 -0700
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 4/6] media: qcom: camss: csiphy: Add support for v2.4.0
 two-phase CSIPHY
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Robert Foss
 <rfoss@kernel.org>, Andi Shyti <andi.shyti@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Todor Tomov <todor.too@gmail.com>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-i2c@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org, aiqun.yu@oss.qualcomm.com,
        tingwei.zhang@oss.qualcomm.com, trilok.soni@oss.qualcomm.com,
        yijie.yang@oss.qualcomm.com,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
        Atiya Kailany <atiya.kailany@oss.qualcomm.com>
References: <20251014-add-support-for-camss-on-kaanapali-v2-0-f5745ba2dff9@oss.qualcomm.com>
 <20251014-add-support-for-camss-on-kaanapali-v2-4-f5745ba2dff9@oss.qualcomm.com>
 <059a2e7b-f399-44d9-9f32-cd01e573d954@linaro.org>
Content-Language: en-US
From: Vijay Kumar Tumati <vijay.tumati@oss.qualcomm.com>
In-Reply-To: <059a2e7b-f399-44d9-9f32-cd01e573d954@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: N9cxpJUCDtgUI-MBcGRPUV70C42u2kzg
X-Proofpoint-ORIG-GUID: N9cxpJUCDtgUI-MBcGRPUV70C42u2kzg
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDExMDAyMCBTYWx0ZWRfX+Zor4D7FYFmr
 ygiSvT4092mMXwBEq964Gc4Jfrm+G9JfIJgumeMboJff7MaCjhncPWOGxqTts2kpi7mcwgKVB6E
 +bep6dEggmyyE0ue0XQQK4BMd46LBYkN/ya984W4pPJh3kv4aaDjl1l03+4mOf8iOn3OLPA3D0R
 TGoaWDSgY1xVKCK1Ibdpg28u1z8D3VQ60nXjH4Wv+CmVeRHdJy0mQ/sfiB4RCSLZztB68LKo3YZ
 13/0/sN0ektZp4ngBj69f6r/W36MFzP55rJk3NbE8e6G6fqAJTskQlVxBvMGZXltGPUelu1BpIy
 KQLeOmjWCrrMgD8orl2OSAjQTt40eTDY7gvXh9b7LEeUu69TU5U6MUwLv4aUyKrUbivLEKoLOVy
 o92wlIezYef1q7mTLlQZmkffDNaLew==
X-Authority-Analysis: v=2.4 cv=V71wEOni c=1 sm=1 tr=0 ts=68f17b59 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=qluxdjdIzHZhSvtdTZwA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-16_04,2025-10-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 malwarescore=0 spamscore=0 adultscore=0 suspectscore=0
 impostorscore=0 phishscore=0 clxscore=1015 lowpriorityscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2510020000
 definitions=main-2510110020


On 10/16/2025 1:59 AM, Bryan O'Donoghue wrote:
> On 15/10/2025 03:56, Hangxiang Ma wrote:
>> Add more detailed resource information for CSIPHY devices in the camss
>> driver along with the support for v2.4.0 in the 2 phase CSIPHY driver
>> that is responsible for the PHY lane register configuration, module
>> reset and interrupt handling.
>>
>> Add 'common_status_offset' variable in 'csidphy_device_regs' structure,
>> which accommodates the offset between common registers and status
>> registers. Because this specific offset in Kaanapali registers differs
>> from other versions.
>>
>> Signed-off-by: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
>> ---
>>   .../platform/qcom/camss/camss-csiphy-3ph-1-0.c     | 147 
>> ++++++++++++++++++++-
>>   drivers/media/platform/qcom/camss/camss-csiphy.h   |   1 +
>>   drivers/media/platform/qcom/camss/camss.c          | 107 
>> +++++++++++++++
>>   3 files changed, 249 insertions(+), 6 deletions(-)
>>
>> diff --git a/drivers/media/platform/qcom/camss/camss-csiphy-3ph-1-0.c 
>> b/drivers/media/platform/qcom/camss/camss-csiphy-3ph-1-0.c
>> index a229ba04b158..192636d02b32 100644
>> --- a/drivers/media/platform/qcom/camss/camss-csiphy-3ph-1-0.c
>> +++ b/drivers/media/platform/qcom/camss/camss-csiphy-3ph-1-0.c
>> @@ -46,7 +46,8 @@
>>   #define CSIPHY_3PH_CMN_CSI_COMMON_CTRL5_CLK_ENABLE    BIT(7)
>>   #define CSIPHY_3PH_CMN_CSI_COMMON_CTRL6_COMMON_PWRDN_B BIT(0)
>>   #define CSIPHY_3PH_CMN_CSI_COMMON_CTRL6_SHOW_REV_ID    BIT(1)
>> -#define CSIPHY_3PH_CMN_CSI_COMMON_STATUSn(offset, n) ((offset) + 
>> 0xb0 + 0x4 * (n))
>> +#define CSIPHY_3PH_CMN_CSI_COMMON_STATUSn(offset, 
>> common_status_offset, n) \
>> +    ((offset) + (common_status_offset) + 0x4 * (n))
>>     #define CSIPHY_DEFAULT_PARAMS        0
>>   #define CSIPHY_LANE_ENABLE        1
>> @@ -587,6 +588,123 @@ csiphy_lane_regs lane_regs_sm8550[] = {
>>       {0x0C64, 0x7F, 0x00, CSIPHY_DEFAULT_PARAMS},
>>   };
>>   +/* 3nm 2PH v 2.4.0 2p5Gbps 4 lane DPHY mode */
>
> I'll again ask for a declaration of the process node this PHY sequence 
> is fabbed on.
>
@Bryan, sorry, is this something other than "/* 3nm 2PH v 2.4.0 2p5Gbps 
4 lane DPHY mode */" ?
>> +static const struct
>> +csiphy_lane_regs lane_regs_kaanapali[] = {
>> +    /* LN 0 */
>> +    {0x0094, 0x00, 0x00, CSIPHY_DEFAULT_PARAMS},
>> +    {0x00A0, 0x00, 0x00, CSIPHY_DEFAULT_PARAMS},
>> +    {0x0090, 0x0F, 0x00, CSIPHY_DEFAULT_PARAMS},
>> +    {0x0098, 0x08, 0x00, CSIPHY_DEFAULT_PARAMS},
>> +    {0x0094, 0x07, 0xd1, CSIPHY_DEFAULT_PARAMS},
>> +    {0x0030, 0x00, 0x00, CSIPHY_DEFAULT_PARAMS},
>> +    {0x0000, 0x8C, 0x00, CSIPHY_DEFAULT_PARAMS},
>> +    {0x0038, 0xFE, 0x00, CSIPHY_DEFAULT_PARAMS},
>> +    {0x002C, 0x01, 0x00, CSIPHY_DEFAULT_PARAMS},
>> +    {0x0034, 0x0F, 0x00, CSIPHY_DEFAULT_PARAMS},
>> +    {0x001C, 0x0A, 0x00, CSIPHY_DEFAULT_PARAMS},
>> +    {0x0014, 0x60, 0x00, CSIPHY_DEFAULT_PARAMS},
>> +    {0x003C, 0xB8, 0x00, CSIPHY_DEFAULT_PARAMS},
>> +    {0x0004, 0x0C, 0x00, CSIPHY_DEFAULT_PARAMS},
>> +    {0x0020, 0x00, 0x00, CSIPHY_DEFAULT_PARAMS},
>> +    {0x0008, 0x19, 0x00, CSIPHY_SETTLE_CNT_LOWER_BYTE},
>> +    {0x0010, 0x52, 0x00, CSIPHY_DEFAULT_PARAMS},
>> +    {0x0094, 0xD7, 0x00, CSIPHY_SKEW_CAL},
>> +    {0x005C, 0x54, 0x00, CSIPHY_SKEW_CAL},
>> +    {0x0060, 0xFD, 0x00, CSIPHY_SKEW_CAL},
>> +    {0x0064, 0x7F, 0x00, CSIPHY_SKEW_CAL},
>> +
>> +    /* LN 2 */
>> +    {0x0494, 0x00, 0x00, CSIPHY_DEFAULT_PARAMS},
>> +    {0x04A0, 0x00, 0x00, CSIPHY_DEFAULT_PARAMS},
>> +    {0x0490, 0x0F, 0x00, CSIPHY_DEFAULT_PARAMS},
>> +    {0x0498, 0x08, 0x00, CSIPHY_DEFAULT_PARAMS},
>> +    {0x0494, 0x07, 0xd1, CSIPHY_DEFAULT_PARAMS},
>> +    {0x0430, 0x00, 0x00, CSIPHY_DEFAULT_PARAMS},
>> +    {0x0400, 0x8C, 0x00, CSIPHY_DEFAULT_PARAMS},
>> +    {0x0438, 0xFE, 0x00, CSIPHY_DEFAULT_PARAMS},
>> +    {0x042C, 0x01, 0x00, CSIPHY_DEFAULT_PARAMS},
>> +    {0x0434, 0x0F, 0x00, CSIPHY_DEFAULT_PARAMS},
>> +    {0x041C, 0x0A, 0x00, CSIPHY_DEFAULT_PARAMS},
>> +    {0x0414, 0x60, 0x00, CSIPHY_DEFAULT_PARAMS},
>> +    {0x043C, 0xB8, 0x00, CSIPHY_DEFAULT_PARAMS},
>> +    {0x0404, 0x0C, 0x00, CSIPHY_DEFAULT_PARAMS},
>> +    {0x0420, 0x00, 0x00, CSIPHY_DEFAULT_PARAMS},
>> +    {0x0408, 0x19, 0x00, CSIPHY_SETTLE_CNT_LOWER_BYTE},
>> +    {0x0410, 0x52, 0x00, CSIPHY_DEFAULT_PARAMS},
>> +    {0x0494, 0xD7, 0x00, CSIPHY_SKEW_CAL},
>> +    {0x045C, 0x54, 0x00, CSIPHY_SKEW_CAL},
>> +    {0x0460, 0xFD, 0x00, CSIPHY_SKEW_CAL},
>> +    {0x0464, 0x7F, 0x00, CSIPHY_SKEW_CAL},
>> +
>> +    /* LN 4 */
>> +    {0x0894, 0x00, 0x00, CSIPHY_DEFAULT_PARAMS},
>> +    {0x08A0, 0x00, 0x00, CSIPHY_DEFAULT_PARAMS},
>> +    {0x0890, 0x0F, 0x00, CSIPHY_DEFAULT_PARAMS},
>> +    {0x0898, 0x08, 0x00, CSIPHY_DEFAULT_PARAMS},
>> +    {0x0894, 0x07, 0xd1, CSIPHY_DEFAULT_PARAMS},
>> +    {0x0830, 0x00, 0x00, CSIPHY_DEFAULT_PARAMS},
>> +    {0x0800, 0x8C, 0x00, CSIPHY_DEFAULT_PARAMS},
>> +    {0x0838, 0xFE, 0x00, CSIPHY_DEFAULT_PARAMS},
>> +    {0x082C, 0x01, 0x00, CSIPHY_DEFAULT_PARAMS},
>> +    {0x0834, 0x0F, 0x00, CSIPHY_DEFAULT_PARAMS},
>> +    {0x081C, 0x0A, 0x00, CSIPHY_DEFAULT_PARAMS},
>> +    {0x0814, 0x60, 0x00, CSIPHY_DEFAULT_PARAMS},
>> +    {0x083C, 0xB8, 0x00, CSIPHY_DEFAULT_PARAMS},
>> +    {0x0804, 0x0C, 0x00, CSIPHY_DEFAULT_PARAMS},
>> +    {0x0820, 0x00, 0x00, CSIPHY_DEFAULT_PARAMS},
>> +    {0x0808, 0x19, 0x00, CSIPHY_SETTLE_CNT_LOWER_BYTE},
>> +    {0x0810, 0x52, 0x00, CSIPHY_DEFAULT_PARAMS},
>> +    {0x0894, 0xD7, 0x00, CSIPHY_SKEW_CAL},
>> +    {0x085C, 0x54, 0x00, CSIPHY_SKEW_CAL},
>> +    {0x0860, 0xFD, 0x00, CSIPHY_SKEW_CAL},
>> +    {0x0864, 0x7F, 0x00, CSIPHY_SKEW_CAL},
>> +
>> +    /* LN 6 */
>> +    {0x0C94, 0x00, 0x00, CSIPHY_DEFAULT_PARAMS},
>> +    {0x0CA0, 0x00, 0x00, CSIPHY_DEFAULT_PARAMS},
>> +    {0x0C90, 0x0F, 0x00, CSIPHY_DEFAULT_PARAMS},
>> +    {0x0C98, 0x08, 0x00, CSIPHY_DEFAULT_PARAMS},
>> +    {0x0C94, 0x07, 0xd1, CSIPHY_DEFAULT_PARAMS},
>> +    {0x0C30, 0x00, 0x00, CSIPHY_DEFAULT_PARAMS},
>> +    {0x0C00, 0x8C, 0x00, CSIPHY_DEFAULT_PARAMS},
>> +    {0x0C38, 0xFE, 0x00, CSIPHY_DEFAULT_PARAMS},
>> +    {0x0C2C, 0x01, 0x00, CSIPHY_DEFAULT_PARAMS},
>> +    {0x0C34, 0x0F, 0x00, CSIPHY_DEFAULT_PARAMS},
>> +    {0x0C1C, 0x0A, 0x00, CSIPHY_DEFAULT_PARAMS},
>> +    {0x0C14, 0x60, 0x00, CSIPHY_DEFAULT_PARAMS},
>> +    {0x0C3C, 0xB8, 0x00, CSIPHY_DEFAULT_PARAMS},
>> +    {0x0C04, 0x0C, 0x00, CSIPHY_DEFAULT_PARAMS},
>> +    {0x0C20, 0x00, 0x00, CSIPHY_DEFAULT_PARAMS},
>> +    {0x0C08, 0x19, 0x00, CSIPHY_SETTLE_CNT_LOWER_BYTE},
>> +    {0x0C10, 0x52, 0x00, CSIPHY_DEFAULT_PARAMS},
>> +    {0x0C94, 0xD7, 0x00, CSIPHY_SKEW_CAL},
>> +    {0x0C5C, 0x54, 0x00, CSIPHY_SKEW_CAL},
>> +    {0x0C60, 0xFD, 0x00, CSIPHY_SKEW_CAL},
>> +    {0x0C64, 0x7F, 0x00, CSIPHY_SKEW_CAL},
>> +
>> +    /* LN CLK */
>> +    {0x0E94, 0x00, 0x00, CSIPHY_DEFAULT_PARAMS},
>> +    {0x0EA0, 0x00, 0x00, CSIPHY_DEFAULT_PARAMS},
>> +    {0x0E90, 0x0F, 0x00, CSIPHY_DEFAULT_PARAMS},
>> +    {0x0E98, 0x08, 0x00, CSIPHY_DEFAULT_PARAMS},
>> +    {0x0E94, 0x07, 0xd1, CSIPHY_DEFAULT_PARAMS},
>> +    {0x0E30, 0x00, 0x00, CSIPHY_DEFAULT_PARAMS},
>> +    {0x0E28, 0x04, 0x00, CSIPHY_DEFAULT_PARAMS},
>> +    {0x0E00, 0x80, 0x00, CSIPHY_DEFAULT_PARAMS},
>> +    {0x0E0C, 0xFF, 0x00, CSIPHY_DEFAULT_PARAMS},
>> +    {0x0E38, 0x1F, 0x00, CSIPHY_DEFAULT_PARAMS},
>> +    {0x0E2C, 0x01, 0x00, CSIPHY_DEFAULT_PARAMS},
>> +    {0x0E34, 0x0F, 0x00, CSIPHY_DEFAULT_PARAMS},
>> +    {0x0E1C, 0x0A, 0x00, CSIPHY_DEFAULT_PARAMS},
>> +    {0x0E14, 0x60, 0x00, CSIPHY_DEFAULT_PARAMS},
>> +    {0x0E3C, 0xB8, 0x00, CSIPHY_DEFAULT_PARAMS},
>> +    {0x0E04, 0x0C, 0x00, CSIPHY_DEFAULT_PARAMS},
>> +    {0x0E20, 0x00, 0x00, CSIPHY_DEFAULT_PARAMS},
>> +    {0x0E08, 0x19, 0x00, CSIPHY_SETTLE_CNT_LOWER_BYTE},
>> +    {0x0E10, 0x52, 0x00, CSIPHY_DEFAULT_PARAMS},
>> +};
>> +
>>   /* 4nm 2PH v 2.1.2 2p5Gbps 4 lane DPHY mode */
>>   static const struct
>>   csiphy_lane_regs lane_regs_x1e80100[] = {
>> @@ -714,13 +832,21 @@ static void csiphy_hw_version_read(struct 
>> csiphy_device *csiphy,
>>              CSIPHY_3PH_CMN_CSI_COMMON_CTRLn(regs->offset, 6));
>>         hw_version = readl_relaxed(csiphy->base +
>> - CSIPHY_3PH_CMN_CSI_COMMON_STATUSn(regs->offset, 12));
>> +                   CSIPHY_3PH_CMN_CSI_COMMON_STATUSn(
>> +                    regs->offset,
>> +                    regs->common_status_offset, 12));
>>       hw_version |= readl_relaxed(csiphy->base +
>> - CSIPHY_3PH_CMN_CSI_COMMON_STATUSn(regs->offset, 13)) << 8;
>> +                    CSIPHY_3PH_CMN_CSI_COMMON_STATUSn(
>> +                    regs->offset,
>> +                    regs->common_status_offset, 13)) << 8;
>>       hw_version |= readl_relaxed(csiphy->base +
>> - CSIPHY_3PH_CMN_CSI_COMMON_STATUSn(regs->offset, 14)) << 16;
>> +                    CSIPHY_3PH_CMN_CSI_COMMON_STATUSn(
>> +                    regs->offset,
>> +                    regs->common_status_offset, 14)) << 16;
>>       hw_version |= readl_relaxed(csiphy->base +
>> - CSIPHY_3PH_CMN_CSI_COMMON_STATUSn(regs->offset, 15)) << 24;
>> +                    CSIPHY_3PH_CMN_CSI_COMMON_STATUSn(
>> +                    regs->offset,
>> +                    regs->common_status_offset, 15)) << 24;
>
> This change should be separated from the addition of the PHY init 
> sequence into its own patch so we can arbitrate that patch standalone 
> on its merits.
>
> I have questions like "why do this" and "how does this affect other 
> hardware" which a commit log for a change like this should spell out.

There are three offsets in the picture here wrt the CSIPHY instance base 
address

1. First offset to the common registers of the PHY, 'regs->offset' (that 
follows the lane registers)

2. Second offset to the status registers within the common registers . 
This has been historically the same and hard coded 
in 'CSIPHY_3PH_CMN_CSI_COMMON_STATUSn' to 0xb0 but this is now changing 
on Kaanapali.

3. Third set of offsets (12, 13, 14 and 15) are to the version registers 
within the status registers.

This change merely generalizes the CSIPHY_3PH_CMN_CSI_COMMON_STATUSn 
macro for chip sets with different second offset using 
"regs->common_status_offset". There should not be any impact to the 
other chip sets, for which it is set to the same 0xb0 in csiphy_init().

Please advise if you still think it requires a patch series for itself 
and we can do that. Thanks.

>
>>         dev_dbg(dev, "CSIPHY 3PH HW Version = 0x%08x\n", hw_version);
>>   }
>> @@ -749,7 +875,8 @@ static irqreturn_t csiphy_isr(int irq, void *dev)
>>       for (i = 0; i < 11; i++) {
>>           int c = i + 22;
>>           u8 val = readl_relaxed(csiphy->base +
>> - CSIPHY_3PH_CMN_CSI_COMMON_STATUSn(regs->offset, i));
>> +            CSIPHY_3PH_CMN_CSI_COMMON_STATUSn(regs->offset,
>> +                              regs->common_status_offset, i));
>>             writel_relaxed(val, csiphy->base +
>> CSIPHY_3PH_CMN_CSI_COMMON_CTRLn(regs->offset, c));
>> @@ -915,6 +1042,7 @@ static bool csiphy_is_gen2(u32 version)
>>       case CAMSS_845:
>>       case CAMSS_8550:
>>       case CAMSS_8775P:
>> +    case CAMSS_KAANAPALI:
>>       case CAMSS_X1E80100:
>>           ret = true;
>>           break;
>> @@ -989,6 +1117,7 @@ static int csiphy_init(struct csiphy_device 
>> *csiphy)
>>         csiphy->regs = regs;
>>       regs->offset = 0x800;
>> +    regs->common_status_offset = 0xb0;
>>         switch (csiphy->camss->res->version) {
>>       case CAMSS_845:
>> @@ -1023,6 +1152,12 @@ static int csiphy_init(struct csiphy_device 
>> *csiphy)
>>           regs->lane_regs = &lane_regs_sa8775p[0];
>>           regs->lane_array_size = ARRAY_SIZE(lane_regs_sa8775p);
>>           break;
>> +    case CAMSS_KAANAPALI:
>> +        regs->lane_regs = &lane_regs_kaanapali[0];
>> +        regs->lane_array_size = ARRAY_SIZE(lane_regs_kaanapali);
>> +        regs->offset = 0x1000;
>> +        regs->common_status_offset = 0x138;
>> +        break;
>>       default:
>>           break;
>>       }
>> diff --git a/drivers/media/platform/qcom/camss/camss-csiphy.h 
>> b/drivers/media/platform/qcom/camss/camss-csiphy.h
>> index 895f80003c44..2d5054819df7 100644
>> --- a/drivers/media/platform/qcom/camss/camss-csiphy.h
>> +++ b/drivers/media/platform/qcom/camss/camss-csiphy.h
>> @@ -90,6 +90,7 @@ struct csiphy_device_regs {
>>       const struct csiphy_lane_regs *lane_regs;
>>       int lane_array_size;
>>       u32 offset;
>> +    u32 common_status_offset;
>>   };
>>     struct csiphy_device {
>> diff --git a/drivers/media/platform/qcom/camss/camss.c 
>> b/drivers/media/platform/qcom/camss/camss.c
>> index 4a5caf54c116..542122fba825 100644
>> --- a/drivers/media/platform/qcom/camss/camss.c
>> +++ b/drivers/media/platform/qcom/camss/camss.c
>> @@ -34,6 +34,111 @@
>>     static const struct parent_dev_ops vfe_parent_dev_ops;
>>   +static const struct camss_subdev_resources csiphy_res_kaanapali[] = {
>> +    /* CSIPHY0 */
>> +    {
>> +        .regulators = { "vdda-phy0", "vdda-pll" },
>> +        .clock = { "csiphy0", "csiphy0_timer",
>> +               "cam_top_ahb", "cam_top_fast_ahb" },
>> +        .clock_rate = { { 400000000, 480000000 },
>> +                { 400000000 },
>> +                { 0 },
>> +                { 0 } },
>> +        .reg = { "csiphy0" },
>> +        .interrupt = { "csiphy0" },
>> +        .csiphy = {
>> +            .id = 0,
>> +            .hw_ops = &csiphy_ops_3ph_1_0,
>> +            .formats = &csiphy_formats_sdm845
>> +        }
>> +    },
>> +    /* CSIPHY1 */
>> +    {
>> +        .regulators = { "vdda-phy1", "vdda-pll" },
>> +        .clock = { "csiphy1", "csiphy1_timer",
>> +               "cam_top_ahb", "cam_top_fast_ahb" },
>> +        .clock_rate = { { 400000000, 480000000 },
>> +                { 400000000 },
>> +                { 0 },
>> +                { 0 } },
>> +        .reg = { "csiphy1" },
>> +        .interrupt = { "csiphy1" },
>> +        .csiphy = {
>> +            .id = 1,
>> +            .hw_ops = &csiphy_ops_3ph_1_0,
>> +            .formats = &csiphy_formats_sdm845
>> +        }
>> +    },
>> +    /* CSIPHY2 */
>> +    {
>> +        .regulators = { "vdda-phy2", "vdda-pll" },
>> +        .clock = { "csiphy2", "csiphy2_timer",
>> +               "cam_top_ahb", "cam_top_fast_ahb" },
>> +        .clock_rate = { { 400000000, 480000000 },
>> +                { 400000000 },
>> +                { 0 },
>> +                { 0 } },
>> +        .reg = { "csiphy2" },
>> +        .interrupt = { "csiphy2" },
>> +        .csiphy = {
>> +            .id = 2,
>> +            .hw_ops = &csiphy_ops_3ph_1_0,
>> +            .formats = &csiphy_formats_sdm845
>> +        }
>> +    },
>> +    /* CSIPHY3 */
>> +    {
>> +        .regulators = { "vdda-phy3", "vdda-pll" },
>> +        .clock = { "csiphy3", "csiphy3_timer",
>> +               "cam_top_ahb", "cam_top_fast_ahb" },
>> +        .clock_rate = { { 400000000, 480000000 },
>> +                { 400000000 },
>> +                { 0 },
>> +                { 0 } },
>> +        .reg = { "csiphy3" },
>> +        .interrupt = { "csiphy3" },
>> +        .csiphy = {
>> +            .id = 3,
>> +            .hw_ops = &csiphy_ops_3ph_1_0,
>> +            .formats = &csiphy_formats_sdm845
>> +        }
>> +    },
>> +    /* CSIPHY4 */
>> +    {
>> +        .regulators = { "vdda-phy4", "vdda-pll" },
>> +        .clock = { "csiphy4", "csiphy4_timer",
>> +               "cam_top_ahb", "cam_top_fast_ahb" },
>> +        .clock_rate = { { 400000000, 480000000 },
>> +                { 400000000 },
>> +                { 0 },
>> +                { 0 } },
>> +        .reg = { "csiphy4" },
>> +        .interrupt = { "csiphy4" },
>> +        .csiphy = {
>> +            .id = 4,
>> +            .hw_ops = &csiphy_ops_3ph_1_0,
>> +            .formats = &csiphy_formats_sdm845
>> +        }
>> +    },
>> +    /* CSIPHY5 */
>> +    {
>> +        .regulators = { "vdda-phy5", "vdda-pll" },
>> +        .clock = { "csiphy5", "csiphy5_timer",
>> +               "cam_top_ahb", "cam_top_fast_ahb" },
>> +        .clock_rate = { { 400000000, 480000000 },
>> +                { 400000000 },
>> +                { 0 },
>> +                { 0 } },
>> +        .reg = { "csiphy5" },
>> +        .interrupt = { "csiphy5" },
>> +        .csiphy = {
>> +            .id = 5,
>> +            .hw_ops = &csiphy_ops_3ph_1_0,
>> +            .formats = &csiphy_formats_sdm845
>> +        }
>> +    },
>> +};
>> +
>>   static const struct resources_icc icc_res_kaanapali[] = {
>>       /* Based on 4096 x 3072 30 FPS 2496 Mbps mode */
>>       {
>> @@ -4308,8 +4413,10 @@ static void camss_remove(struct 
>> platform_device *pdev)
>>   static const struct camss_resources kaanapali_resources = {
>>       .version = CAMSS_KAANAPALI,
>>       .pd_name = "top",
>> +    .csiphy_res = csiphy_res_kaanapali,
>>       .icc_res = icc_res_kaanapali,
>>       .icc_path_num = ARRAY_SIZE(icc_res_kaanapali),
>> +    .csiphy_num = ARRAY_SIZE(csiphy_res_kaanapali),
>>   };
>>     static const struct camss_resources msm8916_resources = {
>>
>
>

