Return-Path: <linux-arm-msm+bounces-58959-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id C5DDFABFF18
	for <lists+linux-arm-msm@lfdr.de>; Wed, 21 May 2025 23:48:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E67F21B65FD1
	for <lists+linux-arm-msm@lfdr.de>; Wed, 21 May 2025 21:48:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7F4151FFC48;
	Wed, 21 May 2025 21:48:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="o1r74McC"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D62F41C32;
	Wed, 21 May 2025 21:48:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747864089; cv=none; b=CUuAAgT+P38gAiZcbQMPG5k2+6aAGhBMdGkw6w9bUXm17pCKtAk3XdgfPnHy6N95aceL93Q6tFbE6FuV/ij95fkxT/c1r6w65UJAetFUXt8xOeV+NlaCPzDjY6ClSlAFoTSgAmdt8x/EcpDmH7vm93OdIvPuELBDNlAxdKloHzo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747864089; c=relaxed/simple;
	bh=HtvXztOjtrz4ob0V/4qCdHmUkdESu4fsijCLRwf5XKU=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=OfAx3ipx4MU3CTDTwg03npIipCMBACKySRcNsdlgPzxqZKanxPzwQklVVM8/XCEbBEakENKjezKzdRwMn56RFslc1U/AuBxVaTLHrkLgTADwUZhKg5S3Rk0vzX7FNqQfhA+NUebZuBKfFhH2dB/ZsYjjs7uvIOO0CNHPEb8BlZ8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=o1r74McC; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54LHPDtu016624;
	Wed, 21 May 2025 21:47:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	wdz9XzN5pJs6FGFMy5umTVMKIyuxhEWQB8gQk5deow8=; b=o1r74McCAevZ3BVe
	QFBe8Ym0QmBeliVXfuqN0gNtUIQAR1YEYZqU329xjYepTRc32nEzMeXNpMXY5teW
	BvsMI0crv/+LToQEq8MnPjB2TBib9+4EL6RK7RvkRTUWpvygGraZtPa2Akt+XHKF
	2dZvQ3IilU6TJj5YumHos+6wlPKFkL8hBt9sKd52xvuDNPjlUK5M7izPSd9+SbEP
	Jfl1jB4L4CysyrbM7CGslDPZup1cP2KzFuiRfb96t2L880T75/3oKMxq1Hc1KRkd
	XZSSC3ddpZwALc95Kb8+WsKqKy3KPSohguKzZJWIYMKNt6uIBpR9dxF43Kk/jHwH
	+GaElQ==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46rwf9va02-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 21 May 2025 21:47:45 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 54LLliQb020894
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 21 May 2025 21:47:44 GMT
Received: from [10.216.45.12] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Wed, 21 May
 2025 14:47:38 -0700
Message-ID: <6eafbd2f-e2cf-4d4b-9432-026eb9c7a01a@quicinc.com>
Date: Thu, 22 May 2025 03:17:33 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V5 04/11] phy: qcom-qmp-ufs: Refactor UFS PHY reset
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
 <20250515162722.6933-5-quic_nitirawa@quicinc.com>
 <mwcqp3mxuheffc6x7w4w5mykqc57ovmvyrmh3ky5czjf54wnag@fxnxgsoi6y2u>
Content-Language: en-US
From: Nitin Rawat <quic_nitirawa@quicinc.com>
In-Reply-To: <mwcqp3mxuheffc6x7w4w5mykqc57ovmvyrmh3ky5czjf54wnag@fxnxgsoi6y2u>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Authority-Analysis: v=2.4 cv=V9990fni c=1 sm=1 tr=0 ts=682e4a01 cx=c_pps
 a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=COk6AnOGAAAA:8
 a=EUspDBNiAAAA:8 a=c8vr_DY3ltGut5BFI0sA:9 a=QEXdDO2ut3YA:10
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: UUjinO3B8ChFEYRBDjMP0nd_uRLtVaXZ
X-Proofpoint-GUID: UUjinO3B8ChFEYRBDjMP0nd_uRLtVaXZ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTIxMDIxNiBTYWx0ZWRfX7daMgzfN39uj
 QjfQZtfv74LamRjrguqu7tS0qjEEQqMZo5J1f5e9ody1U61mRFcH2H2cPny3Xtc6DeC7k39ZArm
 NuDfSWivRuz0SiISEDV8iHmxLqGfKOC1OEyOgn9SgX3s0t4cl/GhK3MkKTGpHIM9FuVA/Av60wv
 uhPK1xIVKrSVmfbwVN1pw63j0j5afnTyoi2XOi7o7PGS05AfI/jzjBsKyKc2J9G52J1puTPav+0
 nJJ8ZuwS1q+7WYt+N5bdnW1tTrrvNCn02czvuHJGSXdd422rkl6CtYdatiWjrAqq/kRK16SAOgk
 2r/5YCZeMlD3QAhG57d8UJxsA1JRk5ExrSR3opUnvkT0PY0H3auD4apphRxqu30td456gI8CzNI
 5+M2mbrdDSbbA2g8P3YOlseiMCrwtPE8agXIN/9A+Z1rv7GWHGA7mXPZAj+/XjiXreMRVScf
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-21_07,2025-05-20_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=999 bulkscore=0 impostorscore=0 clxscore=1015 priorityscore=1501
 lowpriorityscore=0 mlxscore=0 spamscore=0 phishscore=0 suspectscore=0
 adultscore=0 malwarescore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505160000
 definitions=main-2505210216



On 5/21/2025 6:56 PM, Manivannan Sadhasivam wrote:
> On Thu, May 15, 2025 at 09:57:15PM +0530, Nitin Rawat wrote:
>> Refactor the UFS PHY reset handling to parse the reset logic only once
>> during initialization, instead of every resume.
>>
>> As part of this change, move the UFS PHY reset parsing logic from
>> qmp_phy_power_on to the new qmp_ufs_phy_init function.
>>

Sure. I'll update the commit text in next patchset.

> 
> More importantly, you are introducing the phy_ops::init callback, which
> should've been mentioned.
> 
>> Co-developed-by: Ram Kumar Dwivedi <quic_rdwivedi@quicinc.com>
>> Signed-off-by: Ram Kumar Dwivedi <quic_rdwivedi@quicinc.com>
>> Signed-off-by: Nitin Rawat <quic_nitirawa@quicinc.com>
>> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
>> ---
>>   drivers/phy/qualcomm/phy-qcom-qmp-ufs.c | 59 +++++++++++++------------
>>   1 file changed, 31 insertions(+), 28 deletions(-)
>>
>> diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-ufs.c b/drivers/phy/qualcomm/phy-qcom-qmp-ufs.c
>> index ade8e9c4b9ae..33d238cf49aa 100644
>> --- a/drivers/phy/qualcomm/phy-qcom-qmp-ufs.c
>> +++ b/drivers/phy/qualcomm/phy-qcom-qmp-ufs.c
>> @@ -1800,38 +1800,11 @@ static int qmp_ufs_com_exit(struct qmp_ufs *qmp)
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
> 
> This can't be:
> 	return qmp_ufs_com_init; ?

This is already taken care in next patch (#6) of this series.

Thanks,
Nitin


> 
> - Mani
> 


