Return-Path: <linux-arm-msm+bounces-60547-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F337AD1423
	for <lists+linux-arm-msm@lfdr.de>; Sun,  8 Jun 2025 22:11:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A39963AAAAC
	for <lists+linux-arm-msm@lfdr.de>; Sun,  8 Jun 2025 20:10:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5255725484B;
	Sun,  8 Jun 2025 20:10:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="GJ4Sp6wm"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96351250BEC;
	Sun,  8 Jun 2025 20:10:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749413458; cv=none; b=s+Mf9mx6mqyzr+nFmMsjipX/Q5yuK5suQhln/HP2ZBq1JkvtA0Z158hXs8x9ILz5JYU2JOgMYflXLYiYyXnsifyh5aDks3wJLZ9C6mRDpB3QQq+NfvCgbTqyVNsW4jlSFH46ekrBloVDqAdmu5xoqUli38Z1wm024xb3NSMRNng=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749413458; c=relaxed/simple;
	bh=3f9Ym9Pd0K33b8I/7KW2GFr/TT/wU87P+hjasPRaAAQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=tJXFpxc5cmIwzeQQLkz1V5kj5gNbfr1Vv3SHuH09MoLkFAgMa4DgPiZsb1dmGvdFcwIi0vOmJkSqAJaHxF9MGfvxaG4kakOszX4N4LgjAlmJ51Vv4TGjtu5q0IUJg8/PgYcD9b8++nph5LnU3e17TySdy6XQmuQmALYoscWPmX0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=GJ4Sp6wm; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 558JvfDA013294;
	Sun, 8 Jun 2025 20:10:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	VMqwClsGucxOnCvIC7ieB8B3Zk2MDDXeIyx8pwhbeik=; b=GJ4Sp6wmMdsUKdSu
	7XqPo69suRCI2VnCm7g6IliYhqnccb16OjIL4/cDiRS/25F6MOJ4FbOM2m8VjYpK
	crH+93b0DmUeKWbPssRaBl7g80xquR8lKr4H1UxJHHynbr/8BCsWme20mrrZLC2c
	iWgIn0QICd/exWbG+Kpf3qmds7szksYVVeZ3APJvnHwB78SjaDtuFpJZWzy6RqmJ
	2SCdjM7/gEnwxjdkPwJQw6r3OATzMk2YYw1ouw+ldSQHWl43DxJY1ly+xKWQw6vM
	YlJrvw8xqZhRg9AFpH9yUjFLgS7F9hzODjR6F6WwUI3p0w5H38akCwvjDmK5NJ9L
	h+bUSg==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 474ce9m1rv-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sun, 08 Jun 2025 20:10:36 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 558KAY2n004996
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sun, 8 Jun 2025 20:10:34 GMT
Received: from [10.216.51.238] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Sun, 8 Jun 2025
 13:10:27 -0700
Message-ID: <421aadf3-9e2d-4028-bfe2-e29d2ade8432@quicinc.com>
Date: Mon, 9 Jun 2025 01:40:23 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/3] drm/msm/adreno: Add Adreno X1-45 support
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Akhil P Oommen
	<akhilpo@oss.qualcomm.com>
CC: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
        Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
        "Konrad Dybcio" <konradybcio@kernel.org>,
        Abhinav Kumar
	<abhinav.kumar@linux.dev>,
        Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie
	<airlied@gmail.com>, "Simona Vetter" <simona@ffwll.ch>,
        Bjorn Andersson
	<andersson@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski
	<krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
        <linux-arm-msm@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
        <freedreno@lists.freedesktop.org>, <devicetree@vger.kernel.org>
References: <20250607-x1p-adreno-v1-0-a8ea80f3b18b@oss.qualcomm.com>
 <20250607-x1p-adreno-v1-2-a8ea80f3b18b@oss.qualcomm.com>
 <5xb35clc3wnnwpdnmqfminl4z6ok6nhoxg65hwgyxegxguby5d@fuks7fc2n3pf>
From: Akhil P Oommen <quic_akhilpo@quicinc.com>
Content-Language: en-US
In-Reply-To: <5xb35clc3wnnwpdnmqfminl4z6ok6nhoxg65hwgyxegxguby5d@fuks7fc2n3pf>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: BszDk49latyru2SxwMd1H6DHiNz1f0QD
X-Authority-Analysis: v=2.4 cv=drjbC0g4 c=1 sm=1 tr=0 ts=6845ee3c cx=c_pps
 a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=EUspDBNiAAAA:8
 a=XhjLoxLiZ051MZkV3CIA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-ORIG-GUID: BszDk49latyru2SxwMd1H6DHiNz1f0QD
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjA4MDE2MyBTYWx0ZWRfX7gpHMqsCA/Mu
 SgkW+NQvexJf4ppn59QwKvLVTctgDptCXm1Go0AgfDSQVF90IF7qQZt7UBidbrznfHjyYjNmfea
 BC5/m9zYvXkr7oqpvn/nvX20CMYZ/AxivdZapB0eu5gdQIY6CsPL3dkXvq+KC2VMSOlradtXddu
 iEOyfA2gUvZrQyBjQ9CoNm6Y13MabNwtmoHPojmZ2gOkiRrGh7QyOxBVNPhmz0vPvkiBway6Qtg
 fg5ApBxl+phdBN0AoplyHwBzZIaSXPi8CciPYFHOK39KF4SG0yhEn9pdd9uXb9Hukyt6ECvWvG1
 x/nm6LGK6cCqi8qt+eAmO1o6d3RMt+rRwhr75e6Gm3UCZkJJc/cN0dPa/jpu8RUPrsHxKgTioOi
 K1qG/EJmzaQIuBPXDdVvgNb5OL/d+Rtv8OEjSMYN/mujHypnzbx4un5ICQIDHTPVkbycsbQH
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-08_04,2025-06-05_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 impostorscore=0 lowpriorityscore=0 malwarescore=0 clxscore=1011
 priorityscore=1501 suspectscore=0 bulkscore=0 mlxlogscore=999 adultscore=0
 phishscore=0 mlxscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506080163

On 6/8/2025 1:44 AM, Dmitry Baryshkov wrote:
> On Sat, Jun 07, 2025 at 07:45:00PM +0530, Akhil P Oommen wrote:
>> Add support for Adreno X1-45 GPU present Snapdragon X1P42100
>> series of compute chipsets. This GPU is a smaller version of
>> X1-85 GPU with lower core count and smaller internal memories.
>>
>> Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
>> ---
>>  drivers/gpu/drm/msm/adreno/a6xx_catalog.c | 38 +++++++++++++++++++++++++++++++
>>  1 file changed, 38 insertions(+)
>>
>> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_catalog.c b/drivers/gpu/drm/msm/adreno/a6xx_catalog.c
>> index 70f7ad806c34076352d84f32d62c2833422b6e5e..2db748ce7df57a9151ed1e7f1b025a537bb5f653 100644
>> --- a/drivers/gpu/drm/msm/adreno/a6xx_catalog.c
>> +++ b/drivers/gpu/drm/msm/adreno/a6xx_catalog.c
>> @@ -1474,6 +1474,44 @@ static const struct adreno_info a7xx_gpus[] = {
>>  			},
>>  		},
>>  		.preempt_record_size = 3572 * SZ_1K,
>> +	}, {
>> +		.chip_ids = ADRENO_CHIP_IDS(0x43030c00),
>> +		.family = ADRENO_7XX_GEN2,
>> +		.fw = {
>> +			[ADRENO_FW_SQE] = "gen71500_sqe.fw",
>> +			[ADRENO_FW_GMU] = "gen71500_gmu.bin",
> 
> Any chance of getting these and ZAP into linux-firmware?

Yeah. Haven't got the legal clearance to publish the firmwares yet. Will
post it in a few days.

-Akhil.

> 
> 
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> 
> 


