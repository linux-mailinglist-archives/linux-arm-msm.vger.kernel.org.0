Return-Path: <linux-arm-msm+bounces-44326-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B63EA054AE
	for <lists+linux-arm-msm@lfdr.de>; Wed,  8 Jan 2025 08:37:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 7829E162B80
	for <lists+linux-arm-msm@lfdr.de>; Wed,  8 Jan 2025 07:37:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3280D1ACECE;
	Wed,  8 Jan 2025 07:36:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="dWahy5Ob"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 631391A9B3E;
	Wed,  8 Jan 2025 07:36:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736321819; cv=none; b=m7gE4tzwyVq6eettGi5j1FVEFRBTj/vSfAT2t1ZMv2mtJzHfzhc0lBykvVMmyfTHpZbsiMpu7tso9jr0+s2qUVd6GOM9T0ZzcApQzrZidr+JW1e6IDFPuGczt25Lko3yXy4BnjNNQK6ntwm+l8x9tOklXCQ0WCvxylK77GM2cIQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736321819; c=relaxed/simple;
	bh=5FhRyrUMdcyVDYsOyTWL4UAbkcMexKqZhuyrfivqCPM=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=VM9EzkrQTG9TlxQIaAAwcdT9sfVXlY/R0Nagdy22rxnqj+grRXbB53Lymi1HiL05qRcqze22CPbXbTr73QkTFDGeMdLmFQlHxAbCgH8Ns8YPCQ5KKX6DSySqyHa0cHdT8DJR0HVojg2Tttg8FeLgK/8Ze0ezELAEXGwoJlxm0io=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=dWahy5Ob; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5086kjXx024049;
	Wed, 8 Jan 2025 07:36:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	EleiQ9KInhS+kP4uM/4+xoyRnNn9v0zlwQ2mLXSonv0=; b=dWahy5ObUCCRkYeH
	Rfj9nrmzcyPlMr/6zxeeBoGZrB2pQOLskMZBqQjTP6UvOxq5ya41drjY43qAOV2b
	E8hgyeP98mCmvT/QtG0l9MKUuwHD/uFKYjoCmu95oscQ2aexobXHTSUrAh08Bnwz
	GpYLaS01J84zM6lcFuJNeDnWqsWWp8dsqulkJACC6Q8a9C7kUNGxzu8NAk9Wqa7O
	0gh8JLoNtjJMXBYgJYu6oaxcMy+1ad4ryVUKx341BCNlDNmWVkZP6DK3331bQuJZ
	omzwJCFhQ+ZJ6ruSynaFZrvfRh92qvXCHN+2VKMszlDzoj1f/vHXgRz5VnKFMiT5
	8bY7zQ==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 441md303qq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 08 Jan 2025 07:36:43 +0000 (GMT)
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com [10.47.97.35])
	by NALASPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 5087agt6025001
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 8 Jan 2025 07:36:42 GMT
Received: from [10.64.68.119] (10.80.80.8) by nalasex01c.na.qualcomm.com
 (10.47.97.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Tue, 7 Jan 2025
 23:36:35 -0800
Message-ID: <9b915699-1969-4b84-8eda-3a4080202881@quicinc.com>
Date: Wed, 8 Jan 2025 15:36:32 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/5] Display enablement changes for Qualcomm QCS8300
 platform
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
        Neil Armstrong <neil.armstrong@linaro.org>,
        Kuogee Hsieh
	<quic_khsieh@quicinc.com>, Vinod Koul <vkoul@kernel.org>,
        "Kishon Vijay
 Abraham I" <kishon@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        <linux-arm-msm@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
        <freedreno@lists.freedesktop.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-phy@lists.infradead.org>
References: <20241226-mdssdt_qcs8300-v2-0-acba0db533ce@quicinc.com>
 <mha5mg3yyco2dm6g4nw5xfufuhqataoyiw6arkjalsu5caswth@vblodqj3ldcp>
Content-Language: en-US
From: Yongxing Mou <quic_yongmou@quicinc.com>
In-Reply-To: <mha5mg3yyco2dm6g4nw5xfufuhqataoyiw6arkjalsu5caswth@vblodqj3ldcp>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01c.na.qualcomm.com (10.47.97.35)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: BzHgK2IvYyfe3UOFHv-Z6xeB8WQjkTTY
X-Proofpoint-ORIG-GUID: BzHgK2IvYyfe3UOFHv-Z6xeB8WQjkTTY
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 spamscore=0
 priorityscore=1501 impostorscore=0 bulkscore=0 phishscore=0
 mlxlogscore=999 lowpriorityscore=0 adultscore=0 malwarescore=0
 suspectscore=0 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2501080060



On 2024/12/29 12:44, Dmitry Baryshkov wrote:
> On Thu, Dec 26, 2024 at 05:40:44PM +0800, Yongxing Mou wrote:
>> This series introduces support to enable the Mobile Display Subsystem (MDSS)
>> , Display Processing Unit (DPU), DisplayPort controller and eDP PHY for
>> the Qualcomm QCS8300 target. It includes the addition of the hardware catalog,
>> compatible string, and their YAML bindings.
>>
>> Signed-off-by: Yongxing Mou <quic_yongmou@quicinc.com>
>> ---
>> This series depends on following series:
>> https://lore.kernel.org/all/20241203-qcs8300_initial_dtsi-v4-2-d7c953484024@quicinc.com/
>> https://lore.kernel.org/all/20241106-qcs8300-mm-patches-v3-0-f611a8f87f15@quicinc.com/
>> https://lore.kernel.org/all/20241114-qcs8300-mm-cc-dt-patch-v1-1-7a974508c736@quicinc.com/
>> https://lore.kernel.org/all/20241024-defconfig_sa8775p_clock_controllers-v2-1-a9e1cdaed785@quicinc.com/
> 
> How does it depend on all those series? Does it have any intersection
> point at all? You should have decoupled all bindings from those series.
> If you did, please update your cover letter. If you didn't, please do
> your home work.
> 
Thanks for point it.Yes, we have decouple all bindings from dts 
changes.For binding checks or driver, we no longer need these 
dependencies. I will update the cover letter later. Thanks.
>> ---
>> Changes in v2:Fixed review comments from Krzysztof, Dmitry, Rob.
>> - Decouple the devicetree changes from this series.[Dmitry][Krzysztof]
>> - Drop the dpu driver changes and reuse SA8775P DPU driver.[Dmitry]
>> - Fix compilation issues in MDSS bindings.[Rob][Krzysztof]
>> - Correct formatting errors and remove unnecessary status in MDSS
>>    bindings.[Krzysztof]
>> - Add the the necessary information in MDSS changes commit msg.[Dmitry]
>> - Rebase MDSS driver changes to https://lore.kernel.org/dri-devel/
>>    20241127-msm-mdss-ubwc-v3-0-9782a7c2b023@linaro.org/.[Dmitry]
>> - Package the DisplayPort controller and eDP PHY bindings document to
>>    this patch series.
>> - Collecting MDSS changes reviewd-by Dmitry.
>> - Reuse the sa8775p eDP PHY as a fallback compat.[Dmitry]
>> - Reuse the sm8650 DP controller as a fallback compat.[Dmitry]
>> - Link to v1: https://lore.kernel.org/r/20241127-mdss_qcs8300-v1-0-29b2c3ee95b8@quicinc.com
>> ~
>>
>> ---
>> Yongxing Mou (5):
>>        dt-bindings: display/msm: Document the DPU for QCS8300
>>        dt-bindings: display: msm: dp-controller: document QCS8300 compatible
>>        dt-bindings: display/msm: Document MDSS on QCS8300
>>        dt-bindings: phy: Add eDP PHY compatible for QCS8300
>>        drm/msm: mdss: Add QCS8300 support
>>
>>   .../bindings/display/msm/dp-controller.yaml        |   4 +
>>   .../bindings/display/msm/qcom,qcs8300-mdss.yaml    | 244 +++++++++++++++++++++
>>   .../bindings/display/msm/qcom,sm8650-dpu.yaml      |  13 +-
>>   .../devicetree/bindings/phy/qcom,edp-phy.yaml      |  19 +-
>>   drivers/gpu/drm/msm/msm_mdss.c                     |  11 +
>>   5 files changed, 280 insertions(+), 11 deletions(-)
>> ---
>> base-commit: 8155b4ef3466f0e289e8fcc9e6e62f3f4dceeac2
>> change-id: 20241224-mdssdt_qcs8300-11b7883dc60b
>> prerequisite-message-id: <20241203-qcs8300_initial_dtsi-v4-2-d7c953484024@quicinc.com>
>> prerequisite-patch-id: 33f2488a8eb133431f200e17aac743598508dcf3
>> prerequisite-patch-id: 7b653ebeaf1ca3f87620ccf7d876e3d1fe496c4a
>> prerequisite-patch-id: e1b60af8a64332e5f0ecbd3a4ea2b6e090bd97cf
>> prerequisite-patch-id: b823d744d2fb302e2496eaf0cf0c9c66312dcf2a
>> prerequisite-message-id: <20241106-qcs8300-mm-patches-v3-0-f611a8f87f15@quicinc.com>
>> prerequisite-patch-id: 367d9c742fe5087cfa6fb8e7b05ebe9bc78d68f3
>> prerequisite-patch-id: ee0513c070ab96e63766d235b38ee53ca9b19181
>> prerequisite-patch-id: 970974160bcdc837ccbe5ea3b5dcac582e90bc0d
>> prerequisite-patch-id: 5b2bd9cc44a529b0b9e5d73128dca5d2ff9f2f44
>> prerequisite-patch-id: 6a0a81242e1d0f051e3102533bf0191615c6e96b
>> prerequisite-patch-id: 322540ce6d45c32f813ecef50e5135c6f08d9019
>> prerequisite-message-id: <20241114-qcs8300-mm-cc-dt-patch-v1-1-7a974508c736@quicinc.com>
>> prerequisite-patch-id: 8faad5c6d8ca255935d3e4d317dcbcc32b8261ff
>> prerequisite-message-id: <20241024-defconfig_sa8775p_clock_controllers-v2-1-a9e1cdaed785@quicinc.com>
>> prerequisite-patch-id: 81378ec66ab6e569bd828401c43c4f5af55db32c
>>
>> Best regards,
>> -- 
>> Yongxing Mou <quic_yongmou@quicinc.com>
>>
> 


