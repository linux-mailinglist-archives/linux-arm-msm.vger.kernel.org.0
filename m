Return-Path: <linux-arm-msm+bounces-51675-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id EB80AA66AF0
	for <lists+linux-arm-msm@lfdr.de>; Tue, 18 Mar 2025 07:57:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 4443517BFF7
	for <lists+linux-arm-msm@lfdr.de>; Tue, 18 Mar 2025 06:57:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 053951DF251;
	Tue, 18 Mar 2025 06:57:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="ITt+fbPD"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D70A38FA6;
	Tue, 18 Mar 2025 06:57:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742281033; cv=none; b=T2ETqIlezIRwBP3+OTxBVBaK/lZWNMU5F5NRWO7s9at8hnrg4G6iekWrFxx8GG7dSTfUlnWgHqI61fVq9YY5bdhrAOfE62isWjD6jO+1kI9o7GfwRqYJ+2DtHwv3g4Qk4oNRDk5PpjJicPB0JYfJbCWaJrAwNMrBZBQw0FivhnY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742281033; c=relaxed/simple;
	bh=B79hWRC83eGiu5Us8zEC3wzsZMhhRA/WHNbAoSnN/qU=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=CgqvOEaJdbGB/HWN2J0x+4YmtVM/fHChuEcFpHSaYpobp0GHRsVZwxGMZWx6VvzuAF0w4GYmjLhBbClhgOKTeAeCmIgjvoeFnwDVO7RqJewSjqQ4ECb4avE2tcF33bu5b5YrejypZCd2g0uw17VvFKvw4e1srlPx+zUj+oDht5U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=ITt+fbPD; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52HKMeYd019356;
	Tue, 18 Mar 2025 06:57:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	n+7xQ8wAsM+96+JpI461aw5SP7lBsC/LRCDDb2WWtSw=; b=ITt+fbPD3Rn2w1xs
	nIAtYuiRCLxSHtWxSb+UfdEDBkGs+zgzaD0kSNtIrATHf/1zd2HEl6QiGXrJYKO8
	RbBYy3bYgTsQgoGXwERvafMzZ5qJD9o89de8dF+ErJzBt5MgYA2kUNMMxATwp65s
	vrLHVhYg9e99BLrAMSC2F/kg9UqgBrX9Ubzgo5KjubmopbCC5H3X/xscT8RoMpVM
	KR83SRaiPM6RswvR9HkAU6ru7Gi0Y69aOy9Pe0tmT3TCst+VNJ56+gYFGyLXdwVY
	P71GFCnlOHLyVBh2yWluDmY1fRBw3b8ffIapMTx3wSVkZBuNwtiCca063HjvB4+4
	1O5P2w==
Received: from nasanppmta05.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45d1uty60j-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 18 Mar 2025 06:57:00 +0000 (GMT)
Received: from nasanex01c.na.qualcomm.com (nasanex01c.na.qualcomm.com [10.45.79.139])
	by NASANPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 52I6ux0J002503
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 18 Mar 2025 06:56:59 GMT
Received: from [10.233.19.224] (10.80.80.8) by nasanex01c.na.qualcomm.com
 (10.45.79.139) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Mon, 17 Mar
 2025 23:56:55 -0700
Message-ID: <4fc69ebf-1bd4-428b-bae9-a4f67edee0f5@quicinc.com>
Date: Tue, 18 Mar 2025 14:56:51 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 2/2] phy: qcom: qmp-pcie: Add PHY register retention
 support
To: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
CC: <vkoul@kernel.org>, <kishon@kernel.org>, <p.zabel@pengutronix.de>,
        <dmitry.baryshkov@linaro.org>, <abel.vesa@linaro.org>,
        <quic_qianyu@quicinc.com>, <neil.armstrong@linaro.org>,
        <quic_devipriy@quicinc.com>, <konrad.dybcio@oss.qualcomm.com>,
        <linux-arm-msm@vger.kernel.org>, <linux-phy@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>
References: <20250226103600.1923047-1-quic_wenbyao@quicinc.com>
 <20250226103600.1923047-3-quic_wenbyao@quicinc.com>
 <20250314145035.h3nybvvko3ew37wl@thinkpad>
Content-Language: en-US
From: "Wenbin Yao (Consultant)" <quic_wenbyao@quicinc.com>
In-Reply-To: <20250314145035.h3nybvvko3ew37wl@thinkpad>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01c.na.qualcomm.com (10.45.79.139)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Authority-Analysis: v=2.4 cv=H8Pbw/Yi c=1 sm=1 tr=0 ts=67d9193c cx=c_pps a=JYp8KDb2vCoCEuGobkYCKw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=Vs1iUdzkB0EA:10 a=COk6AnOGAAAA:8 a=KKAkSRfTAAAA:8 a=GV8YIVLR6thIHoP4uU0A:9
 a=QEXdDO2ut3YA:10 a=TjNXssC_j7lpFel5tvFf:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: T0rQ1fDVlKvzzSXpiM4jgq6Pz45WpJVT
X-Proofpoint-ORIG-GUID: T0rQ1fDVlKvzzSXpiM4jgq6Pz45WpJVT
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-18_03,2025-03-17_03,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=999
 lowpriorityscore=0 bulkscore=0 adultscore=0 spamscore=0 priorityscore=1501
 mlxscore=0 suspectscore=0 malwarescore=0 clxscore=1015 impostorscore=0
 phishscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2503180048

On 3/14/2025 10:50 PM, Manivannan Sadhasivam wrote:
> On Wed, Feb 26, 2025 at 06:36:00PM +0800, Wenbin Yao wrote:
>> From: Qiang Yu <quic_qianyu@quicinc.com>
>>
>> Some QCOM PCIe PHYs support no_csr reset. Unlike BCR reset which resets the
>> whole PHY (hardware and register), no_csr reset only resets PHY hardware
>> but retains register values, which means PHY setting can be skipped during
>> PHY init if PCIe link is enabled in booltloader and only no_csr is toggled
>> after that.
>>
>> Hence, determine whether the PHY has been enabled in bootloader by
>> verifying QPHY_START_CTRL register. If it's programmed and no_csr reset is
>> available, skip BCR reset and PHY register setting to establish the PCIe
>> link with bootloader - programmed PHY settings.
>>
>> Signed-off-by: Qiang Yu <quic_qianyu@quicinc.com>
>> Signed-off-by: Wenbin Yao <quic_wenbyao@quicinc.com>
> Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
>
> One nit below.
>
>> ---
>>   drivers/phy/qualcomm/phy-qcom-qmp-pcie.c | 69 ++++++++++++++++++++----
>>   1 file changed, 59 insertions(+), 10 deletions(-)
>>
>> diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-pcie.c b/drivers/phy/qualcomm/phy-qcom-qmp-pcie.c
>> index 219266125cf2..c3642d1807e4 100644
>> --- a/drivers/phy/qualcomm/phy-qcom-qmp-pcie.c
>> +++ b/drivers/phy/qualcomm/phy-qcom-qmp-pcie.c
>> @@ -2805,6 +2805,7 @@ struct qmp_pcie {
>>   
>>   	const struct qmp_phy_cfg *cfg;
>>   	bool tcsr_4ln_config;
>> +	bool skip_init;
>>   
>>   	void __iomem *serdes;
>>   	void __iomem *pcs;
>> @@ -3976,18 +3977,38 @@ static int qmp_pcie_init(struct phy *phy)
>>   {
>>   	struct qmp_pcie *qmp = phy_get_drvdata(phy);
>>   	const struct qmp_phy_cfg *cfg = qmp->cfg;
>> +	void __iomem *pcs = qmp->pcs;
>> +	bool phy_initialized = !!(readl(pcs + cfg->regs[QPHY_START_CTRL]));
>>   	int ret;
>>   
>> +	qmp->skip_init = qmp->nocsr_reset && phy_initialized;
>> +	/*
>> +	 * We need to check the existence of init sequences in two cases:
>> +	 * 1. The PHY doesn't support no_csr reset.
>> +	 * 2. The PHY supports no_csr reset but isn't initialized by bootloader.
>> +	 * As we can't skip init in these two cases.
>> +	 */
>> +	if (!qmp->skip_init && !cfg->tbls.serdes_num) {
>> +		dev_err(qmp->dev, "no init sequences are available\n");
> "Init sequence not available\n"
>
>> +		return -EINVAL;
> -ENODATA

Will fix in the next version.

>
> - Mani
>
-- 
With best wishes
Wenbin


