Return-Path: <linux-arm-msm+bounces-57168-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 13BE8AAE3D2
	for <lists+linux-arm-msm@lfdr.de>; Wed,  7 May 2025 17:05:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id F06099A03BD
	for <lists+linux-arm-msm@lfdr.de>; Wed,  7 May 2025 15:05:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DEC30289E1B;
	Wed,  7 May 2025 15:05:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="d02d3X7i"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F2DA145B16;
	Wed,  7 May 2025 15:05:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746630328; cv=none; b=qaAcnRE/bRIy7RJI+Dj2RnQL/4uu7S9aPIuJsq0la0CVpr3xuu9I6ImlObyHfV6DzJrBxCqppkxfkKTZKx4HX3mgShA6p0hNLzTdNhzqB0ZhfelMZz65A1dhA+PZII4oYfCYA1aQHdeO5hsEfVsnU091LWhwIczNdpZw1VHzlyU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746630328; c=relaxed/simple;
	bh=JyV8xkCMJ/2t26KujPnEhLvHfnrJWNgCXzBZHePh3xY=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:CC:References:
	 In-Reply-To:Content-Type; b=VDWBnuPA2lD734uD4mj29xf8uxQW+HOkkYiVgwQShKYjbzgGhawJjJqRKGRM47sFUocKNRnfS5I25u3IG0HECHs8Jm5lsETwm7z/YO0r0/qalT0i0m5AhejBoAFzJPtsDXqJdsgUTjfLow3g401Cej4I9JUpOG0cCTBeMlcMVGE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=d02d3X7i; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 547AKt8J005104;
	Wed, 7 May 2025 15:04:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	cFLfz+n3dUXli7hBsRzY0wxWQxf03ZGrvo/57nmAkAU=; b=d02d3X7imkstiFin
	HSbLBfMEEilFbDvkEqpxopSB89rGhNAuEWladcMgqTSkyoPrleyhATyqUszBqsDY
	xPMDiiNF6vvEYWEM6yZasKy+a5EVo/syJjLUzHCF9u0Nk4Lk2Xkug8uLs6TpHLmD
	NJ0XrnywB7db2GE3V+2khUV6P8yzpNeXZgL/kMXryLr3n2ArnOJTn6HsG5ng/j3n
	rLu8YQUvyRJCd9+GDhdnkZP76HbWZv6D4d5yhIwda91s6utJjrH70G0BtP7u3ryd
	X9L/5cYFeHqIxVy7AxasN9/TioE+2OutWfmNylFJVDYcqQdyUimpL9i+f/MrkM4J
	UIMDvA==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46f5sv69uh-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 07 May 2025 15:04:57 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 547F4ub4023886
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 7 May 2025 15:04:56 GMT
Received: from [10.216.23.216] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Wed, 7 May 2025
 08:04:51 -0700
Message-ID: <9974cf1d-6929-4c7f-8472-fd19c7a40b12@quicinc.com>
Date: Wed, 7 May 2025 20:34:47 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Nitin Rawat <quic_nitirawa@quicinc.com>
Subject: Re: [PATCH V2 1/3] scsi: ufs: dt-bindings: Document UFS Disable LPM
 property
To: Krzysztof Kozlowski <krzk@kernel.org>, <alim.akhtar@samsung.com>,
        <avri.altman@wdc.com>, <bvanassche@acm.org>, <krzk+dt@kernel.org>,
        <robh@kernel.org>, <mani@kernel.org>, <conor+dt@kernel.org>,
        <James.Bottomley@HansenPartnership.com>, <martin.petersen@oracle.com>,
        <beanhuo@micron.com>, <peter.wang@mediatek.com>
CC: <linux-arm-msm@vger.kernel.org>, <linux-scsi@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>
References: <20250506163705.31518-1-quic_nitirawa@quicinc.com>
 <20250506163705.31518-2-quic_nitirawa@quicinc.com>
 <667e43a7-a33c-491b-83ca-fe06a2a5d9c3@kernel.org>
Content-Language: en-US
In-Reply-To: <667e43a7-a33c-491b-83ca-fe06a2a5d9c3@kernel.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: TYTFDam9UZu2-D5HKDMvEKHVDWXLxeQi
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTA3MDE0MCBTYWx0ZWRfX9MA3jKqXIrTN
 3YaW9kKuwWD8utor78J4Y+SqhagKFXkmhvnazIqW/u5zSjHc2L0xUD0sfSFT5XOrjbRffftXFkA
 7AlDdYULYrZ46INmLEpXcapBOLuOm2EDe2X2Su/Aq1thodKzJl7nCGEoIXaJ/qwmmh+mOi0DWKx
 e6ipFhR6e5FsTtvLw46OZOihv/h/OB0oQ9efhDjq7l1SCkRD3500QvaAolGslHYKpI88DFhzh5M
 c99zKpNg7odFR2k6T1XN5QN+IDhMxCXksZKtkpclmagwJioJwL4QrJb6sU13MRR88SFYtGtu4hZ
 4FHNPe/AV1EYmR7gWBBGV5Y7el4iVTWOdvwY3MfcC/5eMAkmmQgYd05whymA53MUEVR09j4k8UQ
 x3OVqle0vWYYwqN+EaUQ3A+LGLBUhYUryCI5fpmqIlHXxG8Ox+pgJRhaEL+cP/+oGAUuvkJH
X-Authority-Analysis: v=2.4 cv=cOXgskeN c=1 sm=1 tr=0 ts=681b7699 cx=c_pps
 a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10
 a=NJ1Z62h-ssRt74_nPL4A:9 a=QEXdDO2ut3YA:10
X-Proofpoint-ORIG-GUID: TYTFDam9UZu2-D5HKDMvEKHVDWXLxeQi
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-07_04,2025-05-06_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 clxscore=1011 suspectscore=0 priorityscore=1501 bulkscore=0
 mlxlogscore=977 adultscore=0 impostorscore=0 malwarescore=0 spamscore=0
 phishscore=0 lowpriorityscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2504070000 definitions=main-2505070140



On 5/6/2025 11:46 PM, Krzysztof Kozlowski wrote:
> On 06/05/2025 18:37, Nitin Rawat wrote:
>> Disable UFS low power mode on emulation FPGA platforms or other platforms
> 
> Why wouldn't you like to test LPM also on FPGA designs? I do not see
> here correlation.

Hi Krzysztof,

Since the FPGA platform doesn't support UFS Low Power Modes (such as the 
AutoHibern8 feature specified in the UFS specification), I have included 
this information in the hardware description (i.e dts).

Thanks,
Nitin

> 
>> where it is either unsupported or power efficiency is not a critical
>> requirement.
> 
> That's a policy, not hardware, thus not suitable for DT.
> 
> Best regards,
> Krzysztof


