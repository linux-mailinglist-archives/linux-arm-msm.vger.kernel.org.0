Return-Path: <linux-arm-msm+bounces-77283-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 36460BDC5D7
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Oct 2025 05:41:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 8939E1884ECA
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Oct 2025 03:41:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B77F52BF01E;
	Wed, 15 Oct 2025 03:41:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Ra7m50OX"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3DD72BE622
	for <linux-arm-msm@vger.kernel.org>; Wed, 15 Oct 2025 03:41:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760499673; cv=none; b=epLB4BrXSnpIyu8GXV6C9H1iFcsuPz2NijgCLj/ER3IkzgcK9XDSjz3a27xZQfrNHUfltQcX6cGsGomH0q9t8VZF1MBlZ/7jvGu2ygsKacNIhNxnoHqMXC96/rlgDhucajCNa0oL4MWZRYyE16DN9Yv2NvJ2H/EbIjSya82I/Qs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760499673; c=relaxed/simple;
	bh=mv+NNDJq8lmEqH3M97ToKZgf7ondCsaePpng7UQJjkM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=YtuAV2tfXJ7oDcVy+YGW/xJ1PvLICbLJbT+zlS/Ae+caqIjsD8WWJF2w56nKIn2X+llai/42TnYnQPsWwglvxZqe5kIsJlbNQfy7hfsgnjneVIn7cse3/K0f256JJsd3fCq/A++EAyJNL5uWHZTMz8L/ZC6P3qvFiviqI3/w77Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Ra7m50OX; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59F2s7dq002561
	for <linux-arm-msm@vger.kernel.org>; Wed, 15 Oct 2025 03:41:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	2EB7lbGy33x6kUiQ2w3K09v0kV2sk9eBoD76swGwLnk=; b=Ra7m50OXkt14rBaq
	F6HHs6mYuOue7pw2wN9NkSEyLZFQeQGRVRzKAmWlzYc/mN/3AWh02SoyI+DQrkI4
	MugtH7Rf/CHdp3b1PI9WkXOLIKsvkYMeFoACZIrhpFvN5oNXQCaIVxuspZLFw2Ci
	ZFT0wz1+U6zbHQxUhYH4r9LKu70Qf1MmWHrF4bqnI7L7n04LwaIdwiDWl1owfRFe
	1OqL2mac3czyi8+8W1jnQj0+2sJLiI22zYn2h0eORTDE8J49dy7F6TV4F4pIkf3D
	DWFZhFHWW6LCKT/UsTg4lgUpoPoHx5QDdURRbB61qTVvSHjYWSGSshQxvgfcyeje
	4+49zg==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49qfd9302h-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 15 Oct 2025 03:41:10 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-b471737e673so13157990a12.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 14 Oct 2025 20:41:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760499669; x=1761104469;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=2EB7lbGy33x6kUiQ2w3K09v0kV2sk9eBoD76swGwLnk=;
        b=eBRuHhs8dNXUk3Nzs9y/uD7Nf/Q/O+tupZMvxqIuz2cGoY3TyRpO1R06qgPilEqSFb
         bQvZ/3ivuNLEdd661K0lDUrp3AXkph45Va/kqYoIAeRhqDHBbkGSv542uJ0K+kJGkY7N
         C31tYpJ1VeVEwFLljJeMK4TJ6za6dGpcLIOdRj4lx8ClLkKcNVcVi2BuQTXk30jJDzND
         ldqxJERprSPOAg/CtmBhV+CcXteqDmDODOe+n1H2l9GhPdb9B602+BO26HL5td9q8BWA
         +vPggiMLd0ajmHDxsKMYgU0v1lyGaGP3LBE49Nf79P7y1KRXCTNGaN4EAVQUtiYXbkq8
         8gzQ==
X-Forwarded-Encrypted: i=1; AJvYcCWYwlPk4ilrcKBYBfuCN1YwMEsMwJgPbE4+gVyUiPasdsp4fbyC5VRmMK95Qgey1Ax1BfUCqPC2kW+oooi0@vger.kernel.org
X-Gm-Message-State: AOJu0YybkoUWQ7LzwpnsKVRhAMHVQhU+E9sRA/ure1LQaC8dY7S/gK9h
	wLDNZz8uzZYdIy0g3PxtAntIE243OnkvoO62y2y1mMpU3BVHYg4o6RNShndV5vpQetUcPFsESlk
	7t3C+KX3BGajYY9hUImP5qasT1T650Pp/fUGbMq3IVuTwkgII4/JnHC/Bjuq00LYRhz4y
X-Gm-Gg: ASbGncvbpoqLy6aOUo0jETX5gWi0N+NSP0IDKpkvkSCPL1TD/kzrRPFzJD73Nqy5+gw
	T7xnanVIO88ZKqrNj6SAzTOMjCb4XWyUnWIABipLHPzHOvFsgBLzzo7nOXnzCswvU85EU9AB40u
	nWqe+iuZXx0G0a6LDjanHLE3dXWGGig8MBnfezAGe5n3rfj2xqwLToBFZF7mo3yVU9g+7/Q93Ej
	ZLp9lLF4xLv37REhA3SfnGiNR0p8/OHQaAT2jEhZ4wxbfidCfiRJztN2VDCnN3nLQk3qhoi2vyw
	iUXbD9zXBrCLtTD4xjd3+TucY9xsTNn1jmzYN3LlyoRh25QZRaTKM9p/jVWWBI9KkqVuXekgrGU
	kkbg053pWuzRwSJjgW3KDWCJ2cH2nIKgrnRA=
X-Received: by 2002:a05:6a20:4303:b0:322:4b69:b6ea with SMTP id adf61e73a8af0-32da83db831mr39689787637.28.1760499668978;
        Tue, 14 Oct 2025 20:41:08 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEUpZSkDFoirzZEs8SDi0R53Xwx2btcDwqsTQiR0SAZnDhqU1pe/wPADgPxeW2HxCi+b4HAxQ==
X-Received: by 2002:a05:6a20:4303:b0:322:4b69:b6ea with SMTP id adf61e73a8af0-32da83db831mr39689730637.28.1760499668314;
        Tue, 14 Oct 2025 20:41:08 -0700 (PDT)
Received: from [10.133.33.56] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-33b61aab6c1sm17809395a91.13.2025.10.14.20.41.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 14 Oct 2025 20:41:07 -0700 (PDT)
Message-ID: <53ae7338-e5db-40dd-9fac-f06a97584cef@oss.qualcomm.com>
Date: Wed, 15 Oct 2025 11:41:02 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/6] media: qcom: camss: csiphy: Add support for v2.4.0
 two-phase CSIPHY
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
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
        yijie.yang@oss.qualcomm.com
References: <20250924-knp-cam-v1-0-b72d6deea054@oss.qualcomm.com>
 <9cVxYzExtV_uysqXmZcP03jBKVwb9fRH7EuJPSeLUS-Juqq3JdoISB_wwBeiJUTBFr0ZuGTg2sSXn8NjSi11Pg==@protonmail.internalid>
 <20250924-knp-cam-v1-4-b72d6deea054@oss.qualcomm.com>
 <f7ec862a-d3c5-480b-91bb-e9ff1bb87d4a@linaro.org>
Content-Language: en-US
From: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
In-Reply-To: <f7ec862a-d3c5-480b-91bb-e9ff1bb87d4a@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: MFQY_wGJ2oCRkgBzSWxbjUezNtYaYahX
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDExMDAxOCBTYWx0ZWRfX3HP0w3sbVPXe
 vBYKRz7jThhnDPfuXLD5XsWFgl5EEZJi8c2JSL9aLQputh4CrdschZpq62xDEvHW8kOYcnbplaK
 CzF8rF0dADtxCzBHEBYy6MMz5SqBXpck0ArNI7PC4qq4MVCNsEZLhV1yRcYPs+WbAbEZd7+l792
 lG8F52AMdUKQ7XN4Twx+QeYZfbD7RdgwpRgEpI2MRpj6oK4v9gkMtwp6I41mfJNcpGLf812yu8N
 J6PuQm4+t5AY2D/aCuKEzN95+w4RYrCd95qWH5E7cgBCge0o2bo7PpagmB2/YJb74iZFS0Tujxe
 CxU7lADq5AijBGULthr4uf5XGgDe8f3Can+D8K2LXSO29H59cyDHtvJMnIuIwwiFvdkcNfnqbkv
 XH7Kro7pTGX22DmMOKEp6u6xiEKjbw==
X-Proofpoint-GUID: MFQY_wGJ2oCRkgBzSWxbjUezNtYaYahX
X-Authority-Analysis: v=2.4 cv=PdTyRyhd c=1 sm=1 tr=0 ts=68ef17d6 cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=9dEm_Dpkgd8kDuDKjw8A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=3WC7DwWrALyhR5TkjVHa:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-15_01,2025-10-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0 bulkscore=0 clxscore=1015 adultscore=0
 lowpriorityscore=0 impostorscore=0 priorityscore=1501 spamscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2510020000
 definitions=main-2510110018


On 9/25/2025 8:57 PM, Bryan O'Donoghue wrote:

> On 25/09/2025 01:02, Jingyi Wang wrote:
>> From: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
>>
>> Add more detailed resource information for CSIPHY devices in the camss
>> driver along with the support for v2.4.0 in the 2 phase CSIPHY driver
>> that is responsible for the PHY lane register configuration, module
>> reset and interrupt handling.
>>
>> This change adds 'cmn_status_offset' variable in 'csidphy_device_regs'
>> structure. It helps adapt the offset to the common status registers that
>> is different in v2.4.0 from others.
>>
>> Signed-off-by: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
>> Signed-off-by: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
>> ---
>>   .../platform/qcom/camss/camss-csiphy-3ph-1-0.c     | 138 
>> ++++++++++++++++++++-
>>   drivers/media/platform/qcom/camss/camss-csiphy.h   |   1 +
>>   drivers/media/platform/qcom/camss/camss.c          | 107 
>> ++++++++++++++++
>>   3 files changed, 240 insertions(+), 6 deletions(-)
>>
>> diff --git a/drivers/media/platform/qcom/camss/camss-csiphy-3ph-1-0.c 
>> b/drivers/media/platform/qcom/camss/camss-csiphy-3ph-1-0.c
>> index a229ba04b158..ecb91d3688ca 100644
>> --- a/drivers/media/platform/qcom/camss/camss-csiphy-3ph-1-0.c
>> +++ b/drivers/media/platform/qcom/camss/camss-csiphy-3ph-1-0.c
>> @@ -46,7 +46,7 @@
>>   #define CSIPHY_3PH_CMN_CSI_COMMON_CTRL5_CLK_ENABLE    BIT(7)
>>   #define CSIPHY_3PH_CMN_CSI_COMMON_CTRL6_COMMON_PWRDN_B BIT(0)
>>   #define CSIPHY_3PH_CMN_CSI_COMMON_CTRL6_SHOW_REV_ID    BIT(1)
>> -#define CSIPHY_3PH_CMN_CSI_COMMON_STATUSn(offset, n) ((offset) + 
>> 0xb0 + 0x4 * (n))
>> +#define CSIPHY_3PH_CMN_CSI_COMMON_STATUSn(offset, bias, n) ((offset) 
>> + (bias) + 0x4 * (n))
>
> You need to explain this bias parameter in the commit log.

Ack. Now rename the 'bias' parameter the same as 'common_status_offset' 
to remove ambiguity.

>>
>>   #define CSIPHY_DEFAULT_PARAMS        0
>>   #define CSIPHY_LANE_ENABLE        1
>> @@ -587,6 +587,123 @@ csiphy_lane_regs lane_regs_sm8550[] = {
>>       {0x0C64, 0x7F, 0x00, CSIPHY_DEFAULT_PARAMS},
>>   };
>>
>> +/* GEN2 2.4.0 2PH DPHY mode */
>
> You need to call out the process node in this comment, per the other 
> recent additions.

Ack

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
>> @@ -714,13 +831,13 @@ static void csiphy_hw_version_read(struct 
>> csiphy_device *csiphy,
>>              CSIPHY_3PH_CMN_CSI_COMMON_CTRLn(regs->offset, 6));
>>
>>       hw_version = readl_relaxed(csiphy->base +
>> - CSIPHY_3PH_CMN_CSI_COMMON_STATUSn(regs->offset, 12));
>> +        CSIPHY_3PH_CMN_CSI_COMMON_STATUSn(regs->offset, 
>> regs->cmn_status_offset, 12));
>>       hw_version |= readl_relaxed(csiphy->base +
>> - CSIPHY_3PH_CMN_CSI_COMMON_STATUSn(regs->offset, 13)) << 8;
>> +        CSIPHY_3PH_CMN_CSI_COMMON_STATUSn(regs->offset, 
>> regs->cmn_status_offset, 13)) << 8;
>>       hw_version |= readl_relaxed(csiphy->base +
>> - CSIPHY_3PH_CMN_CSI_COMMON_STATUSn(regs->offset, 14)) << 16;
>> +        CSIPHY_3PH_CMN_CSI_COMMON_STATUSn(regs->offset, 
>> regs->cmn_status_offset, 14)) << 16;
>>       hw_version |= readl_relaxed(csiphy->base +
>> - CSIPHY_3PH_CMN_CSI_COMMON_STATUSn(regs->offset, 15)) << 24;
>> +        CSIPHY_3PH_CMN_CSI_COMMON_STATUSn(regs->offset, 
>> regs->cmn_status_offset, 15)) << 24;
>>
>>       dev_dbg(dev, "CSIPHY 3PH HW Version = 0x%08x\n", hw_version);
>>   }
>> @@ -749,7 +866,8 @@ static irqreturn_t csiphy_isr(int irq, void *dev)
>>       for (i = 0; i < 11; i++) {
>>           int c = i + 22;
>>           u8 val = readl_relaxed(csiphy->base +
>> - CSIPHY_3PH_CMN_CSI_COMMON_STATUSn(regs->offset, i));
>> + CSIPHY_3PH_CMN_CSI_COMMON_STATUSn(regs->offset,
>> +                              regs->cmn_status_offset, i));
>>
>>           writel_relaxed(val, csiphy->base +
>> CSIPHY_3PH_CMN_CSI_COMMON_CTRLn(regs->offset, c));
>> @@ -915,6 +1033,7 @@ static bool csiphy_is_gen2(u32 version)
>>       case CAMSS_845:
>>       case CAMSS_8550:
>>       case CAMSS_8775P:
>> +    case CAMSS_KAANAPALI:
>>       case CAMSS_X1E80100:
>>           ret = true;
>>           break;
>> @@ -989,6 +1108,7 @@ static int csiphy_init(struct csiphy_device 
>> *csiphy)
>>
>>       csiphy->regs = regs;
>>       regs->offset = 0x800;
>> +    regs->cmn_status_offset = 0xb0;
>>
>>       switch (csiphy->camss->res->version) {
>>       case CAMSS_845:
>> @@ -1023,6 +1143,12 @@ static int csiphy_init(struct csiphy_device 
>> *csiphy)
>>           regs->lane_regs = &lane_regs_sa8775p[0];
>>           regs->lane_array_size = ARRAY_SIZE(lane_regs_sa8775p);
>>           break;
>> +    case CAMSS_KAANAPALI:
>> +        regs->lane_regs = &lane_regs_kaanapali[0];
>> +        regs->lane_array_size = ARRAY_SIZE(lane_regs_kaanapali);
>> +        regs->offset = 0x1000;
>> +        regs->cmn_status_offset = 0x138;
>
> I don't think a second offset is warranted
>
> You could acheive the required offset with offset = 0x1138; and a 
> comment.
>
> Perhaps I'm not seeing it but seems like an additional - fixed - fluff 
> variable.
Necessary to add another variable here. The 'offset' parameter denotes 
the address offset between base and the common register. But the 
'common_status_offset' denotes the offset between common registers and 
status registers.



