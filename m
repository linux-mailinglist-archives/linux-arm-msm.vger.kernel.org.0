Return-Path: <linux-arm-msm+bounces-48481-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 557EDA3BAF1
	for <lists+linux-arm-msm@lfdr.de>; Wed, 19 Feb 2025 10:58:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 1210B18877B1
	for <lists+linux-arm-msm@lfdr.de>; Wed, 19 Feb 2025 09:58:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 96BD41D79BE;
	Wed, 19 Feb 2025 09:58:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="Y0LRxil+"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 200821D54E9;
	Wed, 19 Feb 2025 09:57:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739959081; cv=none; b=BO9fO8Tzx4Qfvfw+/x/XkrZAeh+LKV8onXZd7/51TUDsLdbpoIUBkfjg9huLpOIRGbCaSyay3j3oS2TINfRjVm7MwdROTz0Su47s12whGkDbjcXanrf01DFSP83yEKR3yxxwLtMiHGH/n+h/W1KftLpGI7iuDUH/GL4XucI8rBE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739959081; c=relaxed/simple;
	bh=IWQTacATixglJV1HkIVQv0kxR85MThPqwYpCD3PVCWA=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=AS3v34AsQGdAOJf6fletoQY55BNJqhaFwhXKaBLGJjqAMj/7yx0i08WeycpMRsuwdkkqrf32rf0kjvzzu74CneHHoSLCd7enpnj5Fon280TupgJetaqgoov00pppFI1Ee9AbnJGXbAIY9kFy9rts+KtjOARdUBY1tAYMppjHFik=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=Y0LRxil+; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51J8NRDi014898;
	Wed, 19 Feb 2025 09:57:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	e+Y6uJd/xXeJBd5CsDTMCofnOrJ10iEDcFO4zAYh/+w=; b=Y0LRxil+C/MqoCkQ
	+ozYGpRzO8xPrWR/2k/uZ1ZnvYfxtZqy6eeMEla2PECOEByIuGHxtvB+SR97v6S4
	4WiGKg5ZzWvvqGpFQuM7T8EMHdRbFRsPxVLfxT/zEMDmxyHM+VYDxgt1AnaCGWhY
	vxoYl7QPhB1OXUvHh7onkfLaTa6hk0+8Vx5F66nYz3Q3U2TR0m+4qcCssZO2MyJ/
	79YCHjbz3TtWkFmuE1V4vRr/T8hGwRBe8STh1QJJwW2PyL1iHgGyZTLiRGfICyO8
	f3Bydt1lBtcpfH/T5Mv8oy1omAuTTm0qrCKE2lND5CI2c+pgaKi7ZZVVk81ilN9q
	W+2y5A==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44vyy120nw-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 19 Feb 2025 09:57:48 +0000 (GMT)
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com [10.47.97.35])
	by NALASPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 51J9vljs022139
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 19 Feb 2025 09:57:47 GMT
Received: from [10.64.68.119] (10.80.80.8) by nalasex01c.na.qualcomm.com
 (10.47.97.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Wed, 19 Feb
 2025 01:57:42 -0800
Message-ID: <584fda76-bc17-47dc-ab9f-9203eab3b3d3@quicinc.com>
Date: Wed, 19 Feb 2025 17:57:39 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/4] dt-bindings: display/msm: Redocument the
 dp-controller for QCS8300
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
CC: Rob Clark <robdclark@gmail.com>,
        Abhinav Kumar
	<quic_abhinavk@quicinc.com>,
        Sean Paul <sean@poorly.run>,
        Marijn Suijten
	<marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, "Simona
 Vetter" <simona@ffwll.ch>,
        Maarten Lankhorst
	<maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Kuogee Hsieh <quic_khsieh@quicinc.com>,
        Bjorn Andersson
	<andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        <linux-arm-msm@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
        <freedreno@lists.freedesktop.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
References: <20250212-mst_qcs8300-v1-0-38a8aa08394b@quicinc.com>
 <20250212-mst_qcs8300-v1-1-38a8aa08394b@quicinc.com>
 <brm43v5kzsum6hc6ahs3lqzgww55kczjzwzxsmx5a6alw3xxvh@3mdqqjvo2b5k>
Content-Language: en-US
From: Yongxing Mou <quic_yongmou@quicinc.com>
In-Reply-To: <brm43v5kzsum6hc6ahs3lqzgww55kczjzwzxsmx5a6alw3xxvh@3mdqqjvo2b5k>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01c.na.qualcomm.com (10.47.97.35)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: QY95XrtDUeGVvXoxLwRIf6L_Ngjtlcwg
X-Proofpoint-ORIG-GUID: QY95XrtDUeGVvXoxLwRIf6L_Ngjtlcwg
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-19_04,2025-02-18_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0
 priorityscore=1501 lowpriorityscore=0 phishscore=0 clxscore=1015
 suspectscore=0 spamscore=0 mlxlogscore=999 mlxscore=0 bulkscore=0
 malwarescore=0 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2502100000 definitions=main-2502190079



On 2025/2/12 18:42, Dmitry Baryshkov wrote:
> On Wed, Feb 12, 2025 at 03:12:24PM +0800, Yongxing Mou wrote:
>> We need to enable mst for qcs8300, dp0 controller will support 2 streams
>> output. So not reuse sm8650 dp controller driver and will add a new driver
>> patch for qcs8300 mst feature. Modify the corresponding dt-bingding file
>> to compatible with the qcs8300-dp.
> 
> Forgot to mention that in the quick response: please fix usage of
> capital or lowercase letters in the commit message. If you are unusure,
> 'git log' will help you.
> 
>>
>> Signed-off-by: Yongxing Mou <quic_yongmou@quicinc.com>
>> ---
>>   Documentation/devicetree/bindings/display/msm/dp-controller.yaml | 5 +----
>>   1 file changed, 1 insertion(+), 4 deletions(-)
>>
> 
Got it , thanks. Will correct it in new patch.


