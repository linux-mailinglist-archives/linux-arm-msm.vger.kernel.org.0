Return-Path: <linux-arm-msm+bounces-54977-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id BC8ACA975C0
	for <lists+linux-arm-msm@lfdr.de>; Tue, 22 Apr 2025 21:45:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 4992D7ABB08
	for <lists+linux-arm-msm@lfdr.de>; Tue, 22 Apr 2025 19:44:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 15E8F298CAC;
	Tue, 22 Apr 2025 19:45:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="TAssYZnu"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27CB22989A2;
	Tue, 22 Apr 2025 19:45:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745351107; cv=none; b=Yf/JGZKGvf8EYo8fsxfnYsDRXalR7xsRYzHw7duqHWpnlJN6ehzpCaMezg+Qf+jyjX++WXFk0yQNV2OdACPh98XFOF60TLSi8hm3DipfNaxUE14RSxjYh4joP9jm45uxRTuFPqtaeGNv6cWrD3cLsoPnhL/3MweoCJKF/WnimHY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745351107; c=relaxed/simple;
	bh=s3Lr4lf1vB+9RkEJnNFa+zXEJDTWvBCZ1oVBfvZG+JA=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=Z7fGeayaiuQQk01ll2QveB19+5NCT4Uzp/Cy8RuldlAxDuGNIQxZkLqnwlE4jAqr/UOVwmc4Me2ZYGCVwbqwXnbfmeRmMGG+vZNO2Ljm7Y6UeXD1IN4VW7EUbRB4ZEPSby/bgEMIGkZVO/VrzPlzYhARM3EtSIBUb5mNIFCXL54=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=TAssYZnu; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53MI7DbQ009773;
	Tue, 22 Apr 2025 19:44:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	N/psXNMM9aBSujd22KKfNIhTd94H1jETnkNjMv5TqcE=; b=TAssYZnuSarhxQkC
	/Qh7+v3u8yhYNFW9gooe26YtZ/iZcPQgY+gA6oBt/f1l71muC8ahnULkonbGNHQb
	nvACxwJj9EjGsUrDeeBY8aCDgCF7TmyVZPIOPl6IN04YxEwgZTrYtaA+v2vi+vmQ
	OZ9XPgC2K/2iAN9FJTxWf109b+Q1hMiTMM/py4bkOFtP4uTTwkYPxkcgPTSwILGS
	xo3PxPm++FSMsmQxp0L0Me9anvf6jlZovSMVzm1vFmFU4YGemOliVjFxcPYi3Dsl
	zEF4l2MBGZbIfmCuGb2sN9uqI0bDrc3xrxm/jaqxQJEyxjqdMKf9rOcW9RAb3rBf
	k+3YaQ==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46416r140t-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 22 Apr 2025 19:44:37 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 53MJiaUu010785
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 22 Apr 2025 19:44:36 GMT
Received: from [10.216.16.5] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Tue, 22 Apr
 2025 12:44:30 -0700
Message-ID: <06c6c892-c597-4d1f-9d28-52455d6471f9@quicinc.com>
Date: Wed, 23 Apr 2025 01:14:27 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V1 3/3] scsi: ufs: qcom: Add support to disable UFS LPM
 Feature
To: Rob Herring <robh@kernel.org>
CC: <alim.akhtar@samsung.com>, <avri.altman@wdc.com>, <bvanassche@acm.org>,
        <krzk+dt@kernel.org>, <mani@kernel.org>, <conor+dt@kernel.org>,
        <James.Bottomley@hansenpartnership.com>, <martin.petersen@oracle.com>,
        <beanhuo@micron.com>, <peter.wang@mediatek.com>,
        <linux-arm-msm@vger.kernel.org>, <linux-scsi@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>
References: <20250417124645.24456-1-quic_nitirawa@quicinc.com>
 <20250417124645.24456-4-quic_nitirawa@quicinc.com>
 <20250422124546.GB896279-robh@kernel.org>
Content-Language: en-US
From: Nitin Rawat <quic_nitirawa@quicinc.com>
In-Reply-To: <20250422124546.GB896279-robh@kernel.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Authority-Analysis: v=2.4 cv=N7UpF39B c=1 sm=1 tr=0 ts=6807f1a5 cx=c_pps a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=COk6AnOGAAAA:8 a=-gv2gWxiaCq5dd6O6JYA:9 a=QEXdDO2ut3YA:10
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: UN9IgCGR2EtWi2cTf4Ak96mN88GN_031
X-Proofpoint-ORIG-GUID: UN9IgCGR2EtWi2cTf4Ak96mN88GN_031
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-22_09,2025-04-22_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 phishscore=0
 mlxscore=0 clxscore=1015 lowpriorityscore=0 priorityscore=1501
 mlxlogscore=999 impostorscore=0 bulkscore=0 spamscore=0 malwarescore=0
 suspectscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504220148



On 4/22/2025 6:15 PM, Rob Herring wrote:
> On Thu, Apr 17, 2025 at 06:16:45PM +0530, Nitin Rawat wrote:
>> There are emulation FPGA platforms or other platforms where UFS low
>> power mode is either unsupported or power efficiency is not a critical
>> requirement.
>>
>> Disable all low power mode UFS feature based on the "disable-lpm" device
>> tree property parsed in platform driver.
>>
>> Signed-off-by: Nitin Rawat <quic_nitirawa@quicinc.com>
>> ---
>>   drivers/ufs/host/ufs-qcom.c | 15 ++++++++-------
>>   1 file changed, 8 insertions(+), 7 deletions(-)
>>
>> diff --git a/drivers/ufs/host/ufs-qcom.c b/drivers/ufs/host/ufs-qcom.c
>> index 1b37449fbffc..1024edf36b68 100644
>> --- a/drivers/ufs/host/ufs-qcom.c
>> +++ b/drivers/ufs/host/ufs-qcom.c
>> @@ -1014,13 +1014,14 @@ static void ufs_qcom_set_host_caps(struct ufs_hba *hba)
>>
>>   static void ufs_qcom_set_caps(struct ufs_hba *hba)
>>   {
>> -	hba->caps |= UFSHCD_CAP_CLK_GATING | UFSHCD_CAP_HIBERN8_WITH_CLK_GATING;
>> -	hba->caps |= UFSHCD_CAP_CLK_SCALING | UFSHCD_CAP_WB_WITH_CLK_SCALING;
>> -	hba->caps |= UFSHCD_CAP_AUTO_BKOPS_SUSPEND;
>> -	hba->caps |= UFSHCD_CAP_WB_EN;
>> -	hba->caps |= UFSHCD_CAP_AGGR_POWER_COLLAPSE;
>> -	hba->caps |= UFSHCD_CAP_RPM_AUTOSUSPEND;
>> -
>> +	if (!hba->disable_lpm) {
>> +		hba->caps |= UFSHCD_CAP_CLK_GATING | UFSHCD_CAP_HIBERN8_WITH_CLK_GATING;
>> +		hba->caps |= UFSHCD_CAP_CLK_SCALING | UFSHCD_CAP_WB_WITH_CLK_SCALING;
>> +		hba->caps |= UFSHCD_CAP_AUTO_BKOPS_SUSPEND;
>> +		hba->caps |= UFSHCD_CAP_WB_EN;
>> +		hba->caps |= UFSHCD_CAP_AGGR_POWER_COLLAPSE;
>> +		hba->caps |= UFSHCD_CAP_RPM_AUTOSUSPEND;
>> +	}
> 
> Doesn't RuntimePM already have userspace controls? And that's a Linux
> feature that shouldn't really be controlled by DT. I think this property
> should still to things defined by the UFS spec.

Hi Rob,
Yes userspace has runtime PM control but by the time UFS driver probes 
completes and userspace is up, there are chances runtime PM may get 
kicked in.

Regards,
Nitin

> 
> Rob


