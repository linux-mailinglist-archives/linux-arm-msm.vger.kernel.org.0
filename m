Return-Path: <linux-arm-msm+bounces-54249-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id D4178A883E3
	for <lists+linux-arm-msm@lfdr.de>; Mon, 14 Apr 2025 16:07:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 449E27AB5E6
	for <lists+linux-arm-msm@lfdr.de>; Mon, 14 Apr 2025 14:06:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BB7B927586B;
	Mon, 14 Apr 2025 13:33:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="RSWkZtkW"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BEEDA284663;
	Mon, 14 Apr 2025 13:33:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744637612; cv=none; b=FD/mxM/a64JNchoxEi7YKEWPNmEI5UrLBEjoYkCqW6ugScKFSG3WnWSNKcvKQsosRdXTeBDj6fxE73c4T6YPSYWev6PxA12giqwUnWD5bElRU3gdxG+WoSwz4NIvZ/uxd5KcSHIYILhJNxG8pVxZuOfMicMUmjdyABcjJNdZGHI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744637612; c=relaxed/simple;
	bh=lqW6r23bqwjzU8W+dQYPibsu0Htt43yKptwOLimSSI0=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=dR4UXSebNSPHGCXfrAv3vsFJYwVzwVL+pBV+Kiz6AedXcm2i6ZiXRxRhdKiuAijubcmC8x3pT9BiJJLGcvZaV/I6sXsDpHWBzeZ1VAM3rRvoZ2ZpzBK6XmLQFLcfEsxz/DAU95RonhxcBVywEyhfowm533FuM4tdlsm8ldrgk9M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=RSWkZtkW; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53E99mOh028978;
	Mon, 14 Apr 2025 13:33:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	gajFuDe8TlUWiwwz6npyfgicOLypHaXBz6NQBr/Pqv4=; b=RSWkZtkWtLAh5dMj
	0I0bSVW8q1aMWUwxzskxIyXYk+lFOmc8H9z25jltJ7bEFAF7eUIgN0wx4vh1tyFT
	XP/0I96+oCSSb2gmrEbOs5dmFERjSe2OjCEn71bJ2tpKHDHXufOSBBwgS5562O7V
	Osb2ZoUWipiI27q/b4cXoNIntt/iISebdWcKW/CS0pRUIb/d8FRMlQbVXKJqUXQF
	Pr7Tw4ptvRW3TExaIOEYxjJ7FOjZN9XMNws2CgfZM5xrQQf/IUQ/QQrVhldLJhCV
	xW5Iz0B3F8ZTlDJgtJdffXEjejhnTeUMFB8ZMDV9AB6KfViRsKvQnJ7Wi2LuN6jH
	+MBYTA==
Received: from nasanppmta05.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45yfs14r5k-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 14 Apr 2025 13:33:22 +0000 (GMT)
Received: from nasanex01c.na.qualcomm.com (nasanex01c.na.qualcomm.com [10.45.79.139])
	by NASANPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 53EDXLMu023018
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 14 Apr 2025 13:33:21 GMT
Received: from [10.217.219.207] (10.80.80.8) by nasanex01c.na.qualcomm.com
 (10.45.79.139) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Mon, 14 Apr
 2025 06:33:19 -0700
Message-ID: <08b5187b-0e74-4ba8-9893-4be61c2f9bdf@quicinc.com>
Date: Mon, 14 Apr 2025 19:03:16 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] phy: qcom-qusb2: reuse the IPQ6018 settings for
 IPQ5424
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
 <20250414-revert_hs_phy_settings-v2-2-25086e20a3a3@oss.qualcomm.com>
Content-Language: en-US
From: Mukesh Kumar Savaliya <quic_msavaliy@quicinc.com>
In-Reply-To: <20250414-revert_hs_phy_settings-v2-2-25086e20a3a3@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01c.na.qualcomm.com (10.45.79.139)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Authority-Analysis: v=2.4 cv=P9I6hjAu c=1 sm=1 tr=0 ts=67fd0ea2 cx=c_pps a=JYp8KDb2vCoCEuGobkYCKw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=EUspDBNiAAAA:8 a=zk4drvL23OH2Cl8ndaEA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-GUID: oQJvh3Jsy19-CKRiBkrsx3xET0t4VOIY
X-Proofpoint-ORIG-GUID: oQJvh3Jsy19-CKRiBkrsx3xET0t4VOIY
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-14_04,2025-04-10_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 clxscore=1011 bulkscore=0 impostorscore=0 phishscore=0 suspectscore=0
 mlxscore=0 spamscore=0 malwarescore=0 adultscore=0 priorityscore=1501
 mlxlogscore=999 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504140098



On 4/14/2025 5:22 PM, Kathiravan Thirumoorthy wrote:
> With the settings used in the commit 9c56a1de296e ("phy: qcom-qusb2: add
> QUSB2 support for IPQ5424"), complaince test cases especially
compliance
> eye-diagram (Host High-speed Signal Quality) tests are failing.
> 
> Reuse the IPQ6018 settings for IPQ5424 as suggested by design team,
No mention of team. Write it as generic.
> which helps to meet all the complaince requirement test cases.
compliance
> 
> Fixes: 9c56a1de296e ("phy: qcom-qusb2: add QUSB2 support for IPQ5424")
> Signed-off-by: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
> ---
>   drivers/phy/qualcomm/phy-qcom-qusb2.c | 3 +++
>   1 file changed, 3 insertions(+)
> 
> diff --git a/drivers/phy/qualcomm/phy-qcom-qusb2.c b/drivers/phy/qualcomm/phy-qcom-qusb2.c
> index 81b9e9349c3ebb4d303cb040b5c913336bb6b6d6..49c37c53b38e70db2a1591081a1a12db7092555d 100644
> --- a/drivers/phy/qualcomm/phy-qcom-qusb2.c
> +++ b/drivers/phy/qualcomm/phy-qcom-qusb2.c
> @@ -929,6 +929,9 @@ static const struct phy_ops qusb2_phy_gen_ops = {
>   
>   static const struct of_device_id qusb2_phy_of_match_table[] = {
>   	{
> +		.compatible	= "qcom,ipq5424-qusb2-phy",
> +		.data		= &ipq6018_phy_cfg,
> +	}, {
>   		.compatible	= "qcom,ipq6018-qusb2-phy",
>   		.data		= &ipq6018_phy_cfg,
>   	}, {
> 


