Return-Path: <linux-arm-msm+bounces-53983-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CB6AA85A59
	for <lists+linux-arm-msm@lfdr.de>; Fri, 11 Apr 2025 12:44:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B7B4C189DBBD
	for <lists+linux-arm-msm@lfdr.de>; Fri, 11 Apr 2025 10:44:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 04DDE20DD47;
	Fri, 11 Apr 2025 10:44:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="ar3TdOu3"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42D1C278E64;
	Fri, 11 Apr 2025 10:43:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744368241; cv=none; b=BNOFyOkE6k1WU9QcawFnDqTpn21/iMKdEEVwQmLt4f+6Rtc33NHhK3ZpRLnu6VnViEj8uax7jaDMrH/IVFYJTuWr/4pAV9HCyzPTk/xoJGWkj+tG5XLJqY1SStJ2oTlY+MMfrzsnP6byGBHj/L7NwZksvcXK/annVX2N6ULn1nM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744368241; c=relaxed/simple;
	bh=OsXt5ZPtUU5DFPKX6r887eK6MnX6m56G1O2IKPgYPww=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=bT6BY6shL0Rb+5VjEWhVKCQL6emJbQkkUwGIxDsUh6NYeCoI/ffND94BwKW7OxRs4kzW2UPdTgyWeDliIK249NZyEg7+xI73cmfyNFIIwhsue1KIuSc6qE9BwcfplROtwyc0v02FucXnCARO5t7V/VByy+dkbWlBn/IXnkqXs6Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=ar3TdOu3; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53B1p6wh007171;
	Fri, 11 Apr 2025 10:42:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	hQuBRqFocG/a44HT7fAMnSaMW1L1udKoeyTx7hSUX1g=; b=ar3TdOu3kbmtIEb6
	nXa6cwwMtcTaA9KBMYMToettNYU1i0TpOYzYob6YEMF8/gpHtyqLPM3fux5PI+m2
	9oZNR5LUJ+129eO2v5VX2XZebjKDGejsQ35YqQTLqhUaXEuc3a0iH/jMEbsXS1sp
	7hOd4t8wGndj+h9RA+qI4is7iV6hTOagERTQTTKCU6MZTAZ/DPVZeAHDfeTOmR4i
	VfDJyelroNxHqGKKhgUggV09N9DC/aIWTFUUsv+9cKiJz2B4IhcPK4MMimhQ4LOF
	9FComdGOMsqATH01YvEiuOaFSCF9jVpndb7XWSnePvN5/s1KiTUg5SGQr7dhiD5J
	C+pq0A==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45xeh3k435-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 11 Apr 2025 10:42:56 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 53BAgsxe023310
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 11 Apr 2025 10:42:54 GMT
Received: from [10.218.7.247] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Fri, 11 Apr
 2025 03:42:49 -0700
Message-ID: <4557abf9-bcd2-4a06-8161-43ad5047b277@quicinc.com>
Date: Fri, 11 Apr 2025 16:12:46 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V3 5/9] phy: qcom-qmp-ufs: Remove qmp_ufs_com_init()
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
 <20250410090102.20781-6-quic_nitirawa@quicinc.com>
 <zvc3gf7mek7u46wlcrjak3j2hihj4vfgdwpdzjhvnxxowuyvsr@hlra5bmz5ign>
Content-Language: en-US
From: Nitin Rawat <quic_nitirawa@quicinc.com>
In-Reply-To: <zvc3gf7mek7u46wlcrjak3j2hihj4vfgdwpdzjhvnxxowuyvsr@hlra5bmz5ign>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Authority-Analysis: v=2.4 cv=VbH3PEp9 c=1 sm=1 tr=0 ts=67f8f230 cx=c_pps a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=COk6AnOGAAAA:8 a=zrGcixpFwRRgDh-WtYsA:9 a=QEXdDO2ut3YA:10
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: we9ozuFQS9tgll9GJNrL-apAvrxpPXbM
X-Proofpoint-ORIG-GUID: we9ozuFQS9tgll9GJNrL-apAvrxpPXbM
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-11_04,2025-04-10_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 phishscore=0 impostorscore=0 suspectscore=0 adultscore=0 spamscore=0
 clxscore=1015 malwarescore=0 priorityscore=1501 bulkscore=0 mlxscore=0
 mlxlogscore=999 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504110067



On 4/11/2025 1:39 AM, Dmitry Baryshkov wrote:
> On Thu, Apr 10, 2025 at 02:30:58PM +0530, Nitin Rawat wrote:
>> Simplify the qcom ufs phy driver by inlining qmp_ufs_com_init() into
>> qmp_ufs_power_on(). This change removes unnecessary function calls and
>> ensures that the initialization logic is directly within the power-on
>> routine, maintaining the same functionality.
> 
> Which problem is this patch trying to solve?

Hi Dmitry,

As part of the patch, I simplified the code by moving qmp_ufs_com_init 
inline to qmp_ufs_power_on, since qmp_ufs_power_on was merely calling 
qmp_ufs_com_init. This change eliminates unnecessary function call.

Regards,
Nitin



> 
>>
>> Signed-off-by: Nitin Rawat <quic_nitirawa@quicinc.com>
>> ---
>>   drivers/phy/qualcomm/phy-qcom-qmp-ufs.c | 44 ++++++++++---------------
>>   1 file changed, 18 insertions(+), 26 deletions(-)
>>
>> diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-ufs.c b/drivers/phy/qualcomm/phy-qcom-qmp-ufs.c
>> index 12dad28cc1bd..2cc819089d71 100644
>> --- a/drivers/phy/qualcomm/phy-qcom-qmp-ufs.c
>> +++ b/drivers/phy/qualcomm/phy-qcom-qmp-ufs.c
>> @@ -1757,31 +1757,6 @@ static void qmp_ufs_init_registers(struct qmp_ufs *qmp, const struct qmp_phy_cfg
>>   	qmp_ufs_init_all(qmp, &cfg->tbls_hs_b);
>>   }
>>
>> -static int qmp_ufs_com_init(struct qmp_ufs *qmp)
>> -{
>> -	const struct qmp_phy_cfg *cfg = qmp->cfg;
>> -	void __iomem *pcs = qmp->pcs;
>> -	int ret;
>> -
>> -	ret = regulator_bulk_enable(cfg->num_vregs, qmp->vregs);
>> -	if (ret) {
>> -		dev_err(qmp->dev, "failed to enable regulators, err=%d\n", ret);
>> -		return ret;
>> -	}
>> -
>> -	ret = clk_bulk_prepare_enable(qmp->num_clks, qmp->clks);
>> -	if (ret)
>> -		goto err_disable_regulators;
>> -
>> -	qphy_setbits(pcs, cfg->regs[QPHY_PCS_POWER_DOWN_CONTROL], SW_PWRDN);
>> -
>> -	return 0;
>> -
>> -err_disable_regulators:
>> -	regulator_bulk_disable(cfg->num_vregs, qmp->vregs);
>> -
>> -	return ret;
>> -}
>>
>>   static int qmp_ufs_com_exit(struct qmp_ufs *qmp)
>>   {
>> @@ -1799,10 +1774,27 @@ static int qmp_ufs_com_exit(struct qmp_ufs *qmp)
>>   static int qmp_ufs_power_on(struct phy *phy)
>>   {
>>   	struct qmp_ufs *qmp = phy_get_drvdata(phy);
>> +	const struct qmp_phy_cfg *cfg = qmp->cfg;
>> +	void __iomem *pcs = qmp->pcs;
>>   	int ret;
>> +
>>   	dev_vdbg(qmp->dev, "Initializing QMP phy\n");
>>
>> -	ret = qmp_ufs_com_init(qmp);
>> +	ret = regulator_bulk_enable(cfg->num_vregs, qmp->vregs);
>> +	if (ret) {
>> +		dev_err(qmp->dev, "failed to enable regulators, err=%d\n", ret);
>> +		return ret;
>> +	}
>> +
>> +	ret = clk_bulk_prepare_enable(qmp->num_clks, qmp->clks);
>> +	if (ret)
>> +		goto err_disable_regulators;
>> +
>> +	qphy_setbits(pcs, cfg->regs[QPHY_PCS_POWER_DOWN_CONTROL], SW_PWRDN);
>> +	return 0;
>> +
>> +err_disable_regulators:
>> +	regulator_bulk_disable(cfg->num_vregs, qmp->vregs);
>>   	return ret;
>>   }
>>
>> --
>> 2.48.1
>>
> 


