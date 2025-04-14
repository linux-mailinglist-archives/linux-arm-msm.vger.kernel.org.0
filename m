Return-Path: <linux-arm-msm+bounces-54250-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id A3C18A88434
	for <lists+linux-arm-msm@lfdr.de>; Mon, 14 Apr 2025 16:15:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 09BA11900138
	for <lists+linux-arm-msm@lfdr.de>; Mon, 14 Apr 2025 14:08:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 939C6279787;
	Mon, 14 Apr 2025 13:33:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="AZJpG96M"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ECC1E279783;
	Mon, 14 Apr 2025 13:33:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744637639; cv=none; b=S+/Zart15MlsGrcAdHeSyvruWqyvHA/dcwEcXnuTevy/0nPfj5/FXP/GNqOA+havnBdeEQdlq5g+t190rL4b+baaAjiy/GYf+gb9JeSP209c4t6tJjHJEFqIy5vCzpx/g2333j0b/DxLDdvU3dROeDFnG15PJzXlfVJ8AbFH2mo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744637639; c=relaxed/simple;
	bh=pUdy5oAks8+QU+rztgBHjbrfzprlhW3TqYgKj+46luA=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=GlUP+dRhlJaMDR09Fq00WXigcr3cNWq/B0zBNkqYqIkKBO5JyuhLVvwl8mYwooUoF3+jHtNMVmzqzd31qDvByMhgFhlmK/QkuJkpFSwOJGBD6SILfvXKMKPlFYT/lfX4LW8cog1xvsmVgKrKOr/qErvgcL2n6qgSpnbIhYBO5nI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=AZJpG96M; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53E99rtB016341;
	Mon, 14 Apr 2025 13:33:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	oiP4F5nBYcrixH0fT8uFgQZLr0tgY4ObaDAgPgswV0A=; b=AZJpG96MS48glmFa
	34fGEGxJuFHOcEHBB84KI8gkmPSoTrc+/qtUcjj+7gaKZFHnew/Js0blfq3Ni4bt
	jhf/kLV6oKsnED2GP+XzTAddFAYlH6kWiL2zbcwgmgZM4jsBXD6FYUwNPX8/2y59
	ZFt9kcGXQlYMGExkZBo7jIpgmagEYRAo90lYAuExvFDNQaUbxjmjq9cAdripVce3
	NaVKUxajXSQCiHSfCdFPafHjsZCu+RS6xu9EKxsQ/Zfth8Q0UH1wPohi7noNsT9j
	z04zCWCXFbDbFJz96QRioP+5ilyZcsS/NETx73mj9Bx2NvC5PSPu/B9kwfXd9H99
	4E1XHg==
Received: from nasanppmta03.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45yfgjcpnd-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 14 Apr 2025 13:33:51 +0000 (GMT)
Received: from nasanex01c.na.qualcomm.com (nasanex01c.na.qualcomm.com [10.45.79.139])
	by NASANPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 53EDXoKV014556
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 14 Apr 2025 13:33:50 GMT
Received: from [10.217.219.207] (10.80.80.8) by nasanex01c.na.qualcomm.com
 (10.45.79.139) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Mon, 14 Apr
 2025 06:33:48 -0700
Message-ID: <4f7f280b-1808-4b73-990f-7eb3feffb314@quicinc.com>
Date: Mon, 14 Apr 2025 19:03:48 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/2] Reuse the IPQ6018 QUSB2 PHY settings for IPQ5424
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
Content-Language: en-US
From: Mukesh Kumar Savaliya <quic_msavaliy@quicinc.com>
In-Reply-To: <20250414-revert_hs_phy_settings-v2-0-25086e20a3a3@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01c.na.qualcomm.com (10.45.79.139)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: EGW8RGp9lUROjsALpdVWt6hFlhgMiwAt
X-Proofpoint-ORIG-GUID: EGW8RGp9lUROjsALpdVWt6hFlhgMiwAt
X-Authority-Analysis: v=2.4 cv=Cve/cm4D c=1 sm=1 tr=0 ts=67fd0ebf cx=c_pps a=JYp8KDb2vCoCEuGobkYCKw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=r3rtpvNP56FThFkQcqQA:9
 a=QEXdDO2ut3YA:10
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-14_04,2025-04-10_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 clxscore=1015
 malwarescore=0 lowpriorityscore=0 bulkscore=0 spamscore=0 phishscore=0
 suspectscore=0 impostorscore=0 mlxlogscore=610 mlxscore=0
 priorityscore=1501 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504140098



On 4/14/2025 5:22 PM, Kathiravan Thirumoorthy wrote:
> With the current settings, complaince tests are failing, especially eye
compliance
> diagram (Host High-speed Signal Quality) tests. As recommended by the
> design team, reuse the IPQ6018 settings.
> 
> Merge Strategy:
> --------------
> Both the patch in the series should be merged together to avoid breaking
> the USB feature.
> 
> --
> Changes in V2
> 	- Splitted the patch into 2 patches, first revert the commit and
> 	  then reuse the IPQ6018 data (Vinod K)
> 	- Dropped the R-b tag from Dmitry
> 	- Link to v1 -
> 	  https://lore.kernel.org/linux-arm-msm/20250407-revert_hs_phy_settings-v1-1-ec94e316ea19@oss.qualcomm.com/
> 
> ---
> Kathiravan Thirumoorthy (2):
>        Revert "phy: qcom-qusb2: add QUSB2 support for IPQ5424"
>        phy: qcom-qusb2: reuse the IPQ6018 settings for IPQ5424
> 
>   drivers/phy/qualcomm/phy-qcom-qusb2.c | 27 +--------------------------
>   1 file changed, 1 insertion(+), 26 deletions(-)
> ---
> base-commit: b425262c07a6a643ebeed91046e161e20b944164
> change-id: 20250414-revert_hs_phy_settings-47643d2c75ba
> 
> Best regards,


