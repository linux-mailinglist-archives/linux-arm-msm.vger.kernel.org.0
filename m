Return-Path: <linux-arm-msm+bounces-44318-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D0B1A05343
	for <lists+linux-arm-msm@lfdr.de>; Wed,  8 Jan 2025 07:37:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E31D818825DB
	for <lists+linux-arm-msm@lfdr.de>; Wed,  8 Jan 2025 06:37:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4AB8E1A707D;
	Wed,  8 Jan 2025 06:37:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="kHlf+s2+"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B84B419EEBF;
	Wed,  8 Jan 2025 06:37:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736318258; cv=none; b=RuD+eq2ag14OtPV0cDDG3D9XXbzHGi+hmUbo3oEt9EGOFfkztIarlZFC8REf7+uT3c7GlO7HlxH98kDAdi8eEfqDuQ/+yaPQq/jq65FytSTxCDVQN7nsK0Ta8iYFHE1HQLRiaVBArHoVfTg1Xond9odbp97ja+sA+PWI++4HTqw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736318258; c=relaxed/simple;
	bh=ZFjUDzG55yTrSrXvoJ4X/ar8phi9Hg1tYSrL1WVTYRE=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=OiqXOXMZstBA3h6jcyTwrOGzffzyRfP4QrLhzfnDC7a69Nlg9zUef3CQeyzifEPaojf4ZIFkArOyfSOy/+MMZA1kNZTQTIOoh6ZGPW+ED0rgTZshxYabgpxKYCA3qlsr/5Wg8rb6+Un1Z8X6RV7OTvvtS979Sa+1Gy9uBHkOLJU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=kHlf+s2+; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5085HbPk029651;
	Wed, 8 Jan 2025 06:37:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	rBAWxMEQzLDbB6v5Poioh18LeW3jAbE13taGzyFSkLo=; b=kHlf+s2+s291tF2U
	mJnhToUqRrMWQl7bR5uv0ADOYzq2CXtjBaW2fphcdMoVh5VwXf7B/PlglOYxKA1C
	EAtLX0yVpuQ/ASkz+RZos36OH5+qRuU9/w8dqatWxOyWm3jRuj4moZSj9rt7te2u
	KlyNIfKnUpU/n5Idrc2QJXyIMAixIvTeHYUqzVk5MlA6XrtxKAC5bpumOq+8mZCa
	BLVufKZRldssBbiJB97RNs0ZAF51oEg3FApiBimgW5iNDvZCCCeMIFt/S6Cgp9Kx
	Zi3rh+UwqLOIEY+vkUzhcHQeCJi1FN0blIh+yWHFnQdvCkGod2uZuq4zkY+URaoR
	u8Zzyg==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 441k3b85sq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 08 Jan 2025 06:37:19 +0000 (GMT)
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com [10.47.97.35])
	by NALASPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 5086bI1P022863
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 8 Jan 2025 06:37:18 GMT
Received: from [10.64.68.119] (10.80.80.8) by nalasex01c.na.qualcomm.com
 (10.47.97.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Tue, 7 Jan 2025
 22:37:11 -0800
Message-ID: <9388d86e-b3c1-421c-aa3c-e198d108350a@quicinc.com>
Date: Wed, 8 Jan 2025 14:37:08 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/5] dt-bindings: display/msm: Document the DPU for
 QCS8300
To: Krzysztof Kozlowski <krzk@kernel.org>
CC: Rob Clark <robdclark@gmail.com>,
        Abhinav Kumar
	<quic_abhinavk@quicinc.com>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        "Maarten
 Lankhorst" <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard
	<mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        Rob Herring
	<robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
	<conor+dt@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        "Kuogee
 Hsieh" <quic_khsieh@quicinc.com>,
        Vinod Koul <vkoul@kernel.org>,
        "Kishon
 Vijay Abraham I" <kishon@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        <linux-arm-msm@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
        <freedreno@lists.freedesktop.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-phy@lists.infradead.org>
References: <20241226-mdssdt_qcs8300-v2-0-acba0db533ce@quicinc.com>
 <20241226-mdssdt_qcs8300-v2-1-acba0db533ce@quicinc.com>
 <66x4orucj6kenpwetugmng3kmuzjoagjkmctrn727j5hayjhhe@dvzdd6a2ehzn>
Content-Language: en-US
From: Yongxing Mou <quic_yongmou@quicinc.com>
In-Reply-To: <66x4orucj6kenpwetugmng3kmuzjoagjkmctrn727j5hayjhhe@dvzdd6a2ehzn>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01c.na.qualcomm.com (10.47.97.35)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: oqGmcMF_MEYb_3Iw2wUAIyEAPOwRI81A
X-Proofpoint-ORIG-GUID: oqGmcMF_MEYb_3Iw2wUAIyEAPOwRI81A
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 suspectscore=0
 bulkscore=0 phishscore=0 adultscore=0 spamscore=0 clxscore=1015 mlxscore=0
 priorityscore=1501 impostorscore=0 lowpriorityscore=0 mlxlogscore=914
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2411120000
 definitions=main-2501080051



On 2024/12/27 16:41, Krzysztof Kozlowski wrote:
> On Thu, Dec 26, 2024 at 05:40:45PM +0800, Yongxing Mou wrote:
>> Document the DPU for Qualcomm QCS8300 platform.It use the same DPU
> 
> Missing space after full stop.
> 
Got it. thanks, will fix it in next patch.
>> hardware with SA8775P and reuse it's driver.
>>
> 
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> 
> Best regards,
> Krzysztof
> 


