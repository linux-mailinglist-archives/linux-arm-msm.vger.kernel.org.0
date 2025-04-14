Return-Path: <linux-arm-msm+bounces-54251-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 72B85A8842E
	for <lists+linux-arm-msm@lfdr.de>; Mon, 14 Apr 2025 16:14:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3ABAE1900600
	for <lists+linux-arm-msm@lfdr.de>; Mon, 14 Apr 2025 14:08:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C596D27979B;
	Mon, 14 Apr 2025 13:34:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="HomnYs11"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1938827978F;
	Mon, 14 Apr 2025 13:33:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744637641; cv=none; b=hB2i9mcyrTXN3J361WFRXtgqXuVuDEfOghTIAYNZG1iQLdmzYAdAVHEK1bT9WNBm7fmbiD0X56tOSJ3HL3WFaQC0d1sBAeyNdTfaPHOzDf3gjADGXEg9H0ofyzuE9/7qpvFOqlDMlN9sUhA9mRiuGSPcPenuDv5Gm8iuO0fbKng=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744637641; c=relaxed/simple;
	bh=Hr+zd1xsmbMW88pC89OO/C47iv9WES4bCIpHZjhS02g=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=P2hZ20mpHaJjpOQonPjs8TaNWWuomWoUHVxM14tywIQX8x6F5UwexWhrrY+Jdc2o07Rd/lT/yqmVlz2fRJilZikLY64q98GYk8NMZS3GFeyTy9ZV6viKGmmFL8toMeosku13FRjFLCKtDqHx960A7kbGonM1CM9OaA3TAtNEgP8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=HomnYs11; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53E99qQv011401;
	Mon, 14 Apr 2025 13:33:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	mE4uX+vxgpHDarPW+ZqKGnS8M5JEFxG7A6Uzrsnl4xs=; b=HomnYs11I1VybGdH
	/3w+looEIqrXeZvkGch0WAvrShnX+HieLl++HTTpq/stbbXW3yNrhOvzcA7RwfMJ
	i8xrvyv+6KIQzk6oYU0Gc4F2r33cLTmI8hn7SCz3n+UyxQ7I8SSKhO3aP1LdMwkW
	XqPgxo/JYCB+UeM/FgV/gikRM0VXMT6vWQ5Zi3ZKFRkWiM6PB6ayn41COKNE63sm
	G+f8p4WSKYMd+kE59rQUYOs5YvjNVQjai+fRlRLbMJWgVHCTui7hB92RJ6GUy+HD
	7Jboy2sshH6K9qaIZMXoFQKSiN0qvwfArfR/SnlKbW0i8VWfTfqDGxn4f1VAhQPr
	0DyInA==
Received: from nasanppmta05.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45yg8wcnn2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 14 Apr 2025 13:33:43 +0000 (GMT)
Received: from nasanex01c.na.qualcomm.com (nasanex01c.na.qualcomm.com [10.45.79.139])
	by NASANPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 53EDXgQ0023501
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 14 Apr 2025 13:33:43 GMT
Received: from [10.217.219.207] (10.80.80.8) by nasanex01c.na.qualcomm.com
 (10.45.79.139) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Mon, 14 Apr
 2025 06:33:40 -0700
Message-ID: <5ccf0252-c16c-44e6-bfac-7f94597c5493@quicinc.com>
Date: Mon, 14 Apr 2025 19:03:34 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/2] Revert "phy: qcom-qusb2: add QUSB2 support for
 IPQ5424"
To: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>,
        "Vinod
 Koul" <vkoul@kernel.org>,
        Kishon Vijay Abraham I <kishon@kernel.org>,
        "Dmitry
 Baryshkov" <lumag@kernel.org>,
        Varadarajan Narayanan
	<quic_varada@quicinc.com>
CC: <linux-arm-msm@vger.kernel.org>, <linux-phy@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>
References: <20250414-revert_hs_phy_settings-v2-0-25086e20a3a3@oss.qualcomm.com>
 <20250414-revert_hs_phy_settings-v2-1-25086e20a3a3@oss.qualcomm.com>
Content-Language: en-US
From: Mukesh Kumar Savaliya <quic_msavaliy@quicinc.com>
In-Reply-To: <20250414-revert_hs_phy_settings-v2-1-25086e20a3a3@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01c.na.qualcomm.com (10.45.79.139)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Authority-Analysis: v=2.4 cv=E9TNpbdl c=1 sm=1 tr=0 ts=67fd0eb8 cx=c_pps a=JYp8KDb2vCoCEuGobkYCKw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=EUspDBNiAAAA:8 a=QCUm2x46sNXBIlw5B6kA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-ORIG-GUID: QPZG2RSQaSO9qYdVuW0LmrN1ZrrmrxKW
X-Proofpoint-GUID: QPZG2RSQaSO9qYdVuW0LmrN1ZrrmrxKW
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-14_04,2025-04-10_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 adultscore=0
 mlxscore=0 bulkscore=0 clxscore=1011 phishscore=0 lowpriorityscore=0
 suspectscore=0 mlxlogscore=999 spamscore=0 priorityscore=1501
 impostorscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504140098



On 4/14/2025 5:22 PM, Kathiravan Thirumoorthy wrote:
> With the current settings, complaince tests especially eye diagram
compliance
> (Host High-speed Signal Quality) tests are failing. Design team
Write it as "recommended by Hardware design document/guide" instead of 
design team.
> requested to reuse the IPQ6018 settings to overcome this issue.
> 
> So revert the change which introduced the new settings and reuse the
> IPQ6018 settings in the subsequent patch.
> 
> Fixes: 9c56a1de296e ("phy: qcom-qusb2: add QUSB2 support for IPQ5424")
> Signed-off-by: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
> ---
>   drivers/phy/qualcomm/phy-qcom-qusb2.c | 28 ----------------------------
>   1 file changed, 28 deletions(-)
> 
> diff --git a/drivers/phy/qualcomm/phy-qcom-qusb2.c b/drivers/phy/qualcomm/phy-qcom-qusb2.c
> index 1f5f7df14d5a2ff041fe15aaeb6ec5ce52ab2a81..81b9e9349c3ebb4d303cb040b5c913336bb6b6d6 100644
> --- a/drivers/phy/qualcomm/phy-qcom-qusb2.c
> +++ b/drivers/phy/qualcomm/phy-qcom-qusb2.c
> @@ -151,21 +151,6 @@ static const struct qusb2_phy_init_tbl ipq6018_init_tbl[] = {
>   	QUSB2_PHY_INIT_CFG(QUSB2PHY_PLL_AUTOPGM_CTL1, 0x9F),
>   };
>   
> -static const struct qusb2_phy_init_tbl ipq5424_init_tbl[] = {
> -	QUSB2_PHY_INIT_CFG(QUSB2PHY_PLL, 0x14),
> -	QUSB2_PHY_INIT_CFG_L(QUSB2PHY_PORT_TUNE1, 0x00),
> -	QUSB2_PHY_INIT_CFG_L(QUSB2PHY_PORT_TUNE2, 0x53),
> -	QUSB2_PHY_INIT_CFG_L(QUSB2PHY_PORT_TUNE4, 0xc3),
> -	QUSB2_PHY_INIT_CFG(QUSB2PHY_PLL_TUNE, 0x30),
> -	QUSB2_PHY_INIT_CFG(QUSB2PHY_PLL_USER_CTL1, 0x79),
> -	QUSB2_PHY_INIT_CFG(QUSB2PHY_PLL_USER_CTL2, 0x21),
> -	QUSB2_PHY_INIT_CFG_L(QUSB2PHY_PORT_TUNE5, 0x00),
> -	QUSB2_PHY_INIT_CFG(QUSB2PHY_PLL_PWR_CTRL, 0x00),
> -	QUSB2_PHY_INIT_CFG_L(QUSB2PHY_PORT_TEST2, 0x14),
> -	QUSB2_PHY_INIT_CFG(QUSB2PHY_PLL_TEST, 0x80),
> -	QUSB2_PHY_INIT_CFG(QUSB2PHY_PLL_AUTOPGM_CTL1, 0x9f),
> -};
> -
>   static const struct qusb2_phy_init_tbl qcs615_init_tbl[] = {
>   	QUSB2_PHY_INIT_CFG_L(QUSB2PHY_PORT_TUNE1, 0xc8),
>   	QUSB2_PHY_INIT_CFG_L(QUSB2PHY_PORT_TUNE2, 0xb3),
> @@ -359,16 +344,6 @@ static const struct qusb2_phy_cfg ipq6018_phy_cfg = {
>   	.autoresume_en   = BIT(0),
>   };
>   
> -static const struct qusb2_phy_cfg ipq5424_phy_cfg = {
> -	.tbl            = ipq5424_init_tbl,
> -	.tbl_num        = ARRAY_SIZE(ipq5424_init_tbl),
> -	.regs           = ipq6018_regs_layout,
> -
> -	.disable_ctrl   = POWER_DOWN,
> -	.mask_core_ready = PLL_LOCKED,
> -	.autoresume_en   = BIT(0),
> -};
> -
>   static const struct qusb2_phy_cfg qcs615_phy_cfg = {
>   	.tbl            = qcs615_init_tbl,
>   	.tbl_num        = ARRAY_SIZE(qcs615_init_tbl),
> @@ -954,9 +929,6 @@ static const struct phy_ops qusb2_phy_gen_ops = {
>   
>   static const struct of_device_id qusb2_phy_of_match_table[] = {
>   	{
> -		.compatible	= "qcom,ipq5424-qusb2-phy",
> -		.data		= &ipq5424_phy_cfg,
> -	}, {
>   		.compatible	= "qcom,ipq6018-qusb2-phy",
>   		.data		= &ipq6018_phy_cfg,
>   	}, {
> 


