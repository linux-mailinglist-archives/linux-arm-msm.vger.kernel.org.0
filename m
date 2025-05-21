Return-Path: <linux-arm-msm+bounces-58964-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 109D2ABFF5D
	for <lists+linux-arm-msm@lfdr.de>; Thu, 22 May 2025 00:19:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 362961BA248B
	for <lists+linux-arm-msm@lfdr.de>; Wed, 21 May 2025 22:20:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 39770238C27;
	Wed, 21 May 2025 22:19:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="SNfrb7RN"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BF212B9A9;
	Wed, 21 May 2025 22:19:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747865987; cv=none; b=jvWaw8SySyl1wO80ZHxgiiEt1Y1kz59BinUzGF/YcryA+OZ5y5JLVJi/KVs5+9TV5Rhxc6JKg4bHBxjwl5+0csO9Il66NJp5ZMkQ49Zn3FcA08EIN5gRHAMyI15/6oxxotwLP76PBEGQd8Dq9vslrxJlMS/ZpWNgv9PSdgl8Uh4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747865987; c=relaxed/simple;
	bh=G8fncPJyGVumgbJ2uYYDWcm7fUUwu7ijOLO5dyyu51s=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=iwhHiiCa6tgQ4dZivb2sFYNxAt26OEEgudNPKJh4d9tceiU5OS5YKLtfwYV+mbftLG0oieQI8CdTyixxIs4yxYSOnB5gke5/cAW036Q3Xn8lqMFqCSnw1r4NLS19k/aPU/1YoGqtzp8sUry6rsC2oZNQgNBgYYakBKse4YQEjag=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=SNfrb7RN; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54LHVTrT016898;
	Wed, 21 May 2025 22:19:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	x25LDKLSmOJpwGOcwBq1G58HSLKR7Uj51LXB+xe0eF4=; b=SNfrb7RNH+ZokwbH
	JHn2AXo27wXOvlloTzXTYoY/a7zVgCpPZWfu2iQ79L3reCxQibTMKsxlahWJfH1m
	jO5F05RoFPZdXuYhV2LF80QEbp3dLiP35G9rtqk4HtJ18yie9IyLeAFdXCPedBe8
	417a67F6C4TtFcM/zitZTIcL972D5ZevPQybL+leuD3uZcoDcesWuJuvT2EMd+Mh
	h+0PI/dZudwQ+c0YcIy4Ra5xy6UN+Gb/nL8Q6jqIWOzEnatZ7itM6NEmJDRjdOlJ
	oN/e2+GFqpyBlE2buGRzl5+CkeznISyFR3R1DuD+18Rptsz7fliorD43IYlsVY13
	Er3/CQ==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46rwf9vbnk-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 21 May 2025 22:19:23 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 54LMJM0A013761
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 21 May 2025 22:19:22 GMT
Received: from [10.216.45.12] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Wed, 21 May
 2025 15:19:16 -0700
Message-ID: <79d2f373-ee53-4cd2-b228-171daf3adcb7@quicinc.com>
Date: Thu, 22 May 2025 03:49:12 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V5 07/11] phy: qcom-qmp-ufs: Remove qmp_ufs_exit() and
 Inline qmp_ufs_com_exit()
To: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
CC: <vkoul@kernel.org>, <kishon@kernel.org>,
        <James.Bottomley@hansenpartnership.com>, <martin.petersen@oracle.com>,
        <bvanassche@acm.org>, <andersson@kernel.org>,
        <neil.armstrong@linaro.org>, <dmitry.baryshkov@oss.qualcomm.com>,
        <konrad.dybcio@oss.qualcomm.com>, <quic_rdwivedi@quicinc.com>,
        <quic_cang@quicinc.com>, <linux-arm-msm@vger.kernel.org>,
        <linux-phy@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
        <linux-scsi@vger.kernel.org>
References: <20250515162722.6933-1-quic_nitirawa@quicinc.com>
 <20250515162722.6933-8-quic_nitirawa@quicinc.com>
 <untqxy76skl53c55bdjz5usk4seuypjqbxkfub2qeqz42mewqr@r4cutmkvy235>
Content-Language: en-US
From: Nitin Rawat <quic_nitirawa@quicinc.com>
In-Reply-To: <untqxy76skl53c55bdjz5usk4seuypjqbxkfub2qeqz42mewqr@r4cutmkvy235>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Authority-Analysis: v=2.4 cv=V9990fni c=1 sm=1 tr=0 ts=682e516b cx=c_pps
 a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=COk6AnOGAAAA:8
 a=EUspDBNiAAAA:8 a=6fX1LCf6JIQ156yZA2MA:9 a=QEXdDO2ut3YA:10
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: GahV2aTMOjd9mM1LvVSig3LXVvNnFOYW
X-Proofpoint-GUID: GahV2aTMOjd9mM1LvVSig3LXVvNnFOYW
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTIxMDIyMiBTYWx0ZWRfX4fxxUo5+nnEv
 WEAe4BXyl2gOfqQx9ZGM/tgL0Gux+fdNhRwequscs4IFayye7AyGzksNZUi7pFbMETyh/mbUheD
 EwEJsVxkgHZHo6WplxaZISijKTWgXbt/P/jWb8UyuXrfDfLD63UPSeSx/wSCK0ohDu4YpwLMoz0
 Nc8XRu3Ui548UcZOc5i+Xn+RneIZunchtGQhdNUQXuCYZW7GFjLsgs+YCkfwwS3iNM8Ly+kj7R4
 NJzLWwpKlFiXT4feHKRQflMyFH+UJumZFVXisoXVpv+z123gpfhzriJXRQpBp/dos9i0bbcvPXS
 7XpTU30XWvXFjkuFy47iFls8WFmYZqyclfFoOYit921nvzifq9csOaZh2jgDS/mFj7Ld9RpA7Pk
 CyJDgSLdHUcuYY/DIvM9DJ/yLc4uEH361+vfV7hb+5H/29K1V1uyl/Ph79ogW/Ng1MYZ9El4
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-21_07,2025-05-20_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=999 bulkscore=0 impostorscore=0 clxscore=1015 priorityscore=1501
 lowpriorityscore=0 mlxscore=0 spamscore=0 phishscore=0 suspectscore=0
 adultscore=0 malwarescore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505160000
 definitions=main-2505210222



On 5/21/2025 7:19 PM, Manivannan Sadhasivam wrote:
> On Thu, May 15, 2025 at 09:57:18PM +0530, Nitin Rawat wrote:
>> qmp_ufs_exit() is a wrapper function. It only calls qmp_ufs_com_exit().
>> Remove it to simplify the ufs phy driver.
>>
> 
> Okay, so you are doing it now...

Yes

> 
>> Additonally partial Inline(dropping the reset assert) qmp_ufs_com_exit
>> into qmp_ufs_power_off function to avoid unnecessary function call.
>>
> 
> Why are you dropping the reset_assert()?

This was not aligning to Phy programming guide .


> 
>> Signed-off-by: Nitin Rawat <quic_nitirawa@quicinc.com>
>> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
>> ---
>>   drivers/phy/qualcomm/phy-qcom-qmp-ufs.c | 19 +++++--------------
>>   1 file changed, 5 insertions(+), 14 deletions(-)
>>
>> diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-ufs.c b/drivers/phy/qualcomm/phy-qcom-qmp-ufs.c
>> index a5974a1fb5bb..fca47e5e8bf0 100644
>> --- a/drivers/phy/qualcomm/phy-qcom-qmp-ufs.c
>> +++ b/drivers/phy/qualcomm/phy-qcom-qmp-ufs.c
>> @@ -1758,19 +1758,6 @@ static void qmp_ufs_init_registers(struct qmp_ufs *qmp, const struct qmp_phy_cfg
>>   		qmp_ufs_init_all(qmp, &cfg->tbls_hs_b);
>>   }
>>   
>> -static int qmp_ufs_com_exit(struct qmp_ufs *qmp)
>> -{
>> -	const struct qmp_phy_cfg *cfg = qmp->cfg;
>> -
>> -	reset_control_assert(qmp->ufs_reset);
>> -
>> -	clk_bulk_disable_unprepare(qmp->num_clks, qmp->clks);
>> -
>> -	regulator_bulk_disable(cfg->num_vregs, qmp->vregs);
>> -
>> -	return 0;
>> -}
>> -
>>   static int qmp_ufs_power_on(struct phy *phy)
>>   {
>>   	struct qmp_ufs *qmp = phy_get_drvdata(phy);
>> @@ -1851,7 +1838,11 @@ static int qmp_ufs_power_off(struct phy *phy)
>>   	qphy_clrbits(qmp->pcs, cfg->regs[QPHY_PCS_POWER_DOWN_CONTROL],
>>   			SW_PWRDN);
>>   
>> -	qmp_ufs_com_exit(qmp);
>> +	/* Turn off all the phy clocks */
> 
> You should drop this and below comment. They add no value.

Comments are actually provided for each operation within 
qmp_ufs_power_off which actually facilitate understanding of all actions 
performed by the function which may not be fully clear by code. Hence
I thought to keep the comments. But If you insist i'll remove.

Thanks.
Nitin


> 
> - Mani
> 


