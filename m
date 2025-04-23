Return-Path: <linux-arm-msm+bounces-55239-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id C4D21A99C08
	for <lists+linux-arm-msm@lfdr.de>; Thu, 24 Apr 2025 01:29:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E7F581B82F3E
	for <lists+linux-arm-msm@lfdr.de>; Wed, 23 Apr 2025 23:29:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F073D20CCDA;
	Wed, 23 Apr 2025 23:29:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="L4ZWiKd/"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4BE3D2701A3;
	Wed, 23 Apr 2025 23:29:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745450951; cv=none; b=JFiwWBfxcUfgS74/7nhUEiDYPSIOhNFmbnKoZwSY8o4HlZN0l1MtoF5F47/M97IzWM1Z/2QpiXbpmxtGV3IInQ9qecbv85fAdPinMbjtV0TrkvgcIyUqAOJFZ2MPvdNkCbG48+XLJX3Um3plZDu6+p01Hg7uVYJkvxqtKWquMJ8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745450951; c=relaxed/simple;
	bh=DvZwdeg1gjnZ2bnEEsCjDZhllW177XmaR7bRp5eJQCo=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=UXymEQFilgqFyd6ra4QFE75dCcXJB3oxh/94p30KdN77HQH+MqRSYMhf7h5HpCW0bv6VHchKIlVknWvmCykIZ7OuNwspBnN7yYNrnnuYiJCqebjxL7za4/Vg9lfP7UC9oQp1q2Lc51/UkHtalWhzhkRZJjAxZiIBUhmYz9oqExk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=L4ZWiKd/; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53NMTYX0014698;
	Wed, 23 Apr 2025 23:28:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	WplJrvdeqCjaznQVQGVrkmvzyaGuwuO9MWuZjZ0uVX4=; b=L4ZWiKd/knp+ebB9
	oT5PEZzM/yaeX+o+W7X4xm3BDE/2mZ+WhAWAaORNi7ulSvMcwjHnXZhc323SIgNH
	UT0g7AbPRFyVvLye/i4ozHozvcijZG4voI1GUBSKOuM8sHYFWGT6jGZvCl5r3gIZ
	2l27XIsnH0/wGl/oVaZZqSlTEFAi2DcuAiaYdGMemG4YKLVc7uimQsfpQftKy/aY
	HfAILok0k8jjTxY8ns9egDcJ5HK7ebr1Y0qNvjPPwBgn1vQedZboFJAZYjA6E7QA
	K06W9the0S/QTA/u5w3ZBkkJ/KMW1ODmSOGhDugEe+BS9h1C9trclgqg662vgbgx
	Mnog/w==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 466jh0kmbe-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 23 Apr 2025 23:28:50 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 53NNSm60029994
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 23 Apr 2025 23:28:48 GMT
Received: from [10.71.110.123] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Wed, 23 Apr
 2025 16:28:48 -0700
Message-ID: <7cc93a39-3812-43e8-b9d5-c61397528e47@quicinc.com>
Date: Wed, 23 Apr 2025 16:28:47 -0700
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 5/7] drm/msm/mdp4: move move_valid callback to
 lcdc_encoder
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Rob Clark
	<robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten
	<marijn.suijten@somainline.org>,
        Maarten Lankhorst
	<maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Rob Herring <robh@kernel.org>,
        "Krzysztof
 Kozlowski" <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        "Bjorn
 Andersson" <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
CC: <linux-arm-msm@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
        <freedreno@lists.freedesktop.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>,
        Konrad Dybcio
	<konrad.dybcio@oss.qualcomm.com>
References: <20250227-fd-mdp4-lvds-v3-0-c983788987ae@linaro.org>
 <20250227-fd-mdp4-lvds-v3-5-c983788987ae@linaro.org>
Content-Language: en-US
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
In-Reply-To: <20250227-fd-mdp4-lvds-v3-5-c983788987ae@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: 13umqkYPdPPqv0b_hbfEaSkR_iipsBLe
X-Authority-Analysis: v=2.4 cv=ftfcZE4f c=1 sm=1 tr=0 ts=680977b2 cx=c_pps a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=EUspDBNiAAAA:8 a=KKAkSRfTAAAA:8 a=COk6AnOGAAAA:8
 a=DzGNWYmfupfO5EKgpE0A:9 a=QEXdDO2ut3YA:10 a=cvBusfyB2V15izCimMoJ:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: 13umqkYPdPPqv0b_hbfEaSkR_iipsBLe
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDIzMDE1NiBTYWx0ZWRfX3FNgGtCn6TiB aJ6RXsI2UXQoEpQWGYZCkdQC24bXDfsBdFxhkAOpRrWmq66ZF4PtLhd/5uIHT6BqgKnWpLcGHzl az+ivgQqRWESwuKgPo5JQKhIrAQBxOEbHCm7t4WDpkISAeDgAeZIO1Bzro/GMtP2bPMNp8xfJq8
 9QlRbNlluyO59hMbeP7neB7FvpgkOSaazck7m/cU3f6Lez38TFrqnZbPOiWEqe7vscj28+UnrU2 eiHoAooGrLcoLEndmsj+EXm87tqWdiZQ8er3q8C6IZZbZNWy1s5fmir4Dudr3t/lHG+dycQM5ZZ MqBHvYf2PwXXTjCXFmOe96wKwz3n4PRR1RSiGa9PzuJC8V30kBQhUstmCorLneOirsGKmT3KuXu
 XRmswqcNtWKF1UjUN2mo2Zm1MDOEH6F4bZCjCJgi9ESQtsm3ivSz4vQUACqFAnbqv1gV7APi
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.680,FMLib:17.12.80.40
 definitions=2025-04-23_12,2025-04-22_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 mlxscore=0
 suspectscore=0 mlxlogscore=999 lowpriorityscore=0 phishscore=0
 malwarescore=0 impostorscore=0 adultscore=0 spamscore=0 clxscore=1015
 priorityscore=1501 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2504230156



On 2/26/2025 6:25 PM, Dmitry Baryshkov wrote:
> We can check the LCDC clock directly from the LCDC encoder driver, so
> remove it from the LVDS connector.
> 
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>   drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.h           |  1 -
>   drivers/gpu/drm/msm/disp/mdp4/mdp4_lcdc_encoder.c  | 27 ++++++++++++++++------
>   .../gpu/drm/msm/disp/mdp4/mdp4_lvds_connector.c    | 21 -----------------
>   3 files changed, 20 insertions(+), 29 deletions(-)
> 

Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>

