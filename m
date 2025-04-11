Return-Path: <linux-arm-msm+bounces-53985-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id CA38DA85A6F
	for <lists+linux-arm-msm@lfdr.de>; Fri, 11 Apr 2025 12:51:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C3B2F8C1E4B
	for <lists+linux-arm-msm@lfdr.de>; Fri, 11 Apr 2025 10:50:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C11F122126B;
	Fri, 11 Apr 2025 10:51:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="K+D0UzKq"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2DDFE278E41;
	Fri, 11 Apr 2025 10:51:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744368665; cv=none; b=XlCovWn9Vyqze5Hnmn2pu1wy0Mql6Ofsl44F7RrxC4/TUj0sNbWaw1mij9BOknMd5Ahzg1LiqZlnfFDc1/poTfdjlOOKIcms8zdVn7FkIdiheD+tHoMM4O9mH8fMGi+ptm8zHzmcfw/axpTLeBa4XrMc7HL1EhoMGSQwdkTaGi0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744368665; c=relaxed/simple;
	bh=3+JEKCy4BP1TaOEGLWwyzTD79jp9QuYQfNDLnp8rV4Q=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=G6cBZFHPZfjD4N7VG/Nor3PizWAmSE25zz3qgdMqyPrgUkeuuSOtzTrLyahigCowomDlzEceEK9PiIucq/A8DhzFi13gK93QgX1udqlmiwO3D+b7+O1d5YTJZrqDUQ9GIPvZmS4By81it7hS7C2ZyelZ+dryi5bbw1/QNgIkAi4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=K+D0UzKq; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53B1BNYm006840;
	Fri, 11 Apr 2025 10:50:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	BezirZRuneKAc9KEqSsOCqt0YwowOuw6whkhhsdSFKQ=; b=K+D0UzKqwjbAbw7g
	u9kexN6fUSA/15I5rRFEqjNgTu5rswOd5Kp0oUQRExV0bczjkMxXEYakvOur4Q2g
	hTyE3ht7/TNmYtM+rDtckj5838O2rr+giofONDDs8yUFYhcNTOdLWolwZCmB5TBQ
	RuBtmLDgWSETncNcgfOMHWUahgrMQpHqMJPORuoES5LHNGhCcy4Wk6qj2qZaPhsr
	aheKYdXqD6iF8lgbkps64Avpo3kpJ0hZDPTHyVq2nT1QtCTJxMl69ZGQZZhuhi7p
	+eajk2WgDZ9x4HuyOf3RxiZXrTf/hkPUHllc5lre0T/AacLcbYQKbhgcYMeBn39a
	5opLhg==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45xeh3k4m4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 11 Apr 2025 10:50:44 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 53BAohEk025735
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 11 Apr 2025 10:50:43 GMT
Received: from [10.218.7.247] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Fri, 11 Apr
 2025 03:50:37 -0700
Message-ID: <317faeaa-3130-4e28-8c5d-441a76aa79b4@quicinc.com>
Date: Fri, 11 Apr 2025 16:20:33 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V3 4/9] phy: qcom-qmp-ufs: Refactor UFS PHY reset
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
CC: <vkoul@kernel.org>, <kishon@kernel.org>,
        <manivannan.sadhasivam@linaro.org>,
        <James.Bottomley@hansenpartnership.com>, <martin.petersen@oracle.com>,
        <bvanassche@acm.org>, <bjorande@quicinc.com>,
        <neil.armstrong@linaro.org>, <konrad.dybcio@oss.qualcomm.com>,
        <quic_rdwivedi@quicinc.com>, <linux-arm-msm@vger.kernel.org>,
        <linux-phy@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
        <linux-scsi@vger.kernel.org>
References: <20250410090102.20781-1-quic_nitirawa@quicinc.com>
 <20250410090102.20781-5-quic_nitirawa@quicinc.com>
 <pur4y63xhfmqlyymg4pehk37ry4gg22h24zceoqjbsxp3hj4yf@4kptase3c4qp>
Content-Language: en-US
From: Nitin Rawat <quic_nitirawa@quicinc.com>
In-Reply-To: <pur4y63xhfmqlyymg4pehk37ry4gg22h24zceoqjbsxp3hj4yf@4kptase3c4qp>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Authority-Analysis: v=2.4 cv=VbH3PEp9 c=1 sm=1 tr=0 ts=67f8f404 cx=c_pps a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=COk6AnOGAAAA:8 a=pCJWkS2Mr8WjEUJzeJAA:9 a=QEXdDO2ut3YA:10
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: BKyyhwUP6BlbJkbaohdTzq9YC28tcw77
X-Proofpoint-ORIG-GUID: BKyyhwUP6BlbJkbaohdTzq9YC28tcw77
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-11_04,2025-04-10_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 phishscore=0 impostorscore=0 suspectscore=0 adultscore=0 spamscore=0
 clxscore=1015 malwarescore=0 priorityscore=1501 bulkscore=0 mlxscore=0
 mlxlogscore=999 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504110068



On 4/11/2025 1:38 AM, Dmitry Baryshkov wrote:
> On Thu, Apr 10, 2025 at 02:30:57PM +0530, Nitin Rawat wrote:
>> Refactor the UFS PHY reset handling to parse the reset logic only once
>> during probe, instead of every resume.
>>
>> Move the UFS PHY reset parsing logic from qmp_phy_power_on to
>> qmp_ufs_probe to avoid unnecessary parsing during resume.
> 
> How did you solve the circular dependency issue being noted below?

Hi Dmitry,
As part of my patch, I moved the parsing logic from qmp_phy_power_on to 
qmp_ufs_probe to avoid unnecessary parsing during resume. I'm uncertain 
about the circular dependency issue and whether if it still exists.

Regards,
Nitin


> 
>>
>> Co-developed-by: Ram Kumar Dwivedi <quic_rdwivedi@quicinc.com>
>> Signed-off-by: Ram Kumar Dwivedi <quic_rdwivedi@quicinc.com>
>> Signed-off-by: Nitin Rawat <quic_nitirawa@quicinc.com>
>> ---
>>   drivers/phy/qualcomm/phy-qcom-qmp-ufs.c | 61 +++++++++++++------------
>>   1 file changed, 33 insertions(+), 28 deletions(-)
>>
>> diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-ufs.c b/drivers/phy/qualcomm/phy-qcom-qmp-ufs.c
>> index 636dc3dc3ea8..12dad28cc1bd 100644
>> --- a/drivers/phy/qualcomm/phy-qcom-qmp-ufs.c
>> +++ b/drivers/phy/qualcomm/phy-qcom-qmp-ufs.c
>> @@ -1799,38 +1799,11 @@ static int qmp_ufs_com_exit(struct qmp_ufs *qmp)
>>   static int qmp_ufs_power_on(struct phy *phy)
>>   {
>>   	struct qmp_ufs *qmp = phy_get_drvdata(phy);
>> -	const struct qmp_phy_cfg *cfg = qmp->cfg;
>>   	int ret;
>>   	dev_vdbg(qmp->dev, "Initializing QMP phy\n");
>>
>> -	if (cfg->no_pcs_sw_reset) {
>> -		/*
>> -		 * Get UFS reset, which is delayed until now to avoid a
>> -		 * circular dependency where UFS needs its PHY, but the PHY
>> -		 * needs this UFS reset.
>> -		 */
>> -		if (!qmp->ufs_reset) {
>> -			qmp->ufs_reset =
>> -				devm_reset_control_get_exclusive(qmp->dev,
>> -								 "ufsphy");
>> -
>> -			if (IS_ERR(qmp->ufs_reset)) {
>> -				ret = PTR_ERR(qmp->ufs_reset);
>> -				dev_err(qmp->dev,
>> -					"failed to get UFS reset: %d\n",
>> -					ret);
>> -
>> -				qmp->ufs_reset = NULL;
>> -				return ret;
>> -			}
>> -		}
>> -	}
>> -
>>   	ret = qmp_ufs_com_init(qmp);
>> -	if (ret)
>> -		return ret;
>> -
>> -	return 0;
>> +	return ret;
>>   }
>>
>>   static int qmp_ufs_phy_calibrate(struct phy *phy)
>> @@ -2088,6 +2061,34 @@ static int qmp_ufs_parse_dt(struct qmp_ufs *qmp)
>>   	return 0;
>>   }
>>
>> +static int qmp_ufs_get_phy_reset(struct qmp_ufs *qmp)
>> +{
>> +	const struct qmp_phy_cfg *cfg = qmp->cfg;
>> +	int ret;
>> +
>> +	if (!cfg->no_pcs_sw_reset)
>> +		return 0;
>> +
>> +	/*
>> +	 * Get UFS reset, which is delayed until now to avoid a
>> +	 * circular dependency where UFS needs its PHY, but the PHY
>> +	 * needs this UFS reset.
>> +	 */
>> +	if (!qmp->ufs_reset) {
>> +		qmp->ufs_reset =
>> +		devm_reset_control_get_exclusive(qmp->dev, "ufsphy");
> 
> Strange indentation.
> 
>> +
>> +		if (IS_ERR(qmp->ufs_reset)) {
>> +			ret = PTR_ERR(qmp->ufs_reset);
>> +			dev_err(qmp->dev, "failed to get PHY reset: %d\n", ret);
>> +			qmp->ufs_reset = NULL;
>> +			return ret;
>> +		}
>> +	}
>> +
>> +	return 0;
>> +}
>> +
>>   static int qmp_ufs_probe(struct platform_device *pdev)
>>   {
>>   	struct device *dev = &pdev->dev;
>> @@ -2114,6 +2115,10 @@ static int qmp_ufs_probe(struct platform_device *pdev)
>>   	if (ret)
>>   		return ret;
>>
>> +	ret = qmp_ufs_get_phy_reset(qmp);
>> +	if (ret)
>> +		return ret;
>> +
>>   	/* Check for legacy binding with child node. */
>>   	np = of_get_next_available_child(dev->of_node, NULL);
>>   	if (np) {
>> --
>> 2.48.1
>>
> 


