Return-Path: <linux-arm-msm+bounces-32230-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id D76CA983DAC
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Sep 2024 09:17:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 146481C20FAC
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Sep 2024 07:17:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9684813D278;
	Tue, 24 Sep 2024 07:17:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="GADONGLG"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1E5D1A270;
	Tue, 24 Sep 2024 07:17:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727162226; cv=none; b=ds/cVRRlcQMHP2gJQkL7cTAUOPbb6wkAtjDY0crQD5w/BfQj3SFihWk6OfocPN5EPXv1szqxsHnOP+/vw0x7VTK2G/LFxbx/SjQnIdDUgC7FB3FuVmckSoW+vrK5wNZZ2iDPxgp1jgDyJlYkwKVQPi7eoqD5UfnOc9CqQZrw6qQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727162226; c=relaxed/simple;
	bh=GlWqPVGyfJjTHUigN4P2tB+86Vn7NXTJO6DA+2obKXo=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=tx4R/bAVxu8UtHjlaq4KNWGFv4sgiT6y6MCVR/zXMn0is64JfmGoDc5p4Kk2W8rd2LjwFRVOizMqXESpHaA6evFW8QZHeKQokJfvsxvUgPpFFc5h3i4BUvLeWWw0g2AwqjkFrxaX4/oVwiIuEBFkhGab5sfoDuWok30K2WMREcA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=GADONGLG; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 48NJWFU5021730;
	Tue, 24 Sep 2024 07:16:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	KKyssr1uc6M3Edh6ydcV4gtcPR+09KpLfaDOx33Lq7U=; b=GADONGLGmYWOz0s+
	ztrmq0L23Enkbmai+od+OWRJpvIYbWIm3ljPf8ogzpxwgx5Wjx9jmjUgYyCz47Sm
	foP2DeomiDLzDuTBtYYN1nBwbdXUGDhvPH3WZ8C2O7s9W3m9zTHnjxc/T/TIgcdh
	FF5efEzdi56ExxHjoqOXe8Cvq2W6T+f6dG8WImSUDDnuzqcvhGW4YsI3TFoqwPT5
	bQfV2OvQzmllH8ajg/JjPxGhceol266E26iYZ5uq3HeDAJjyfJRz7IIx+/vEV1nm
	M+/kAlbeFET8Nbsy4j3guueFMZ6T6Hnb0tdXX2TeqhnGvRpppGDFzm379HIR8x6U
	nK5KUg==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 41sqe97918-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 24 Sep 2024 07:16:46 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 48O7Gj2w000900
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 24 Sep 2024 07:16:45 GMT
Received: from [10.204.67.11] (10.80.80.8) by nalasex01b.na.qualcomm.com
 (10.47.209.197) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Tue, 24 Sep
 2024 00:16:37 -0700
Message-ID: <013459fd-fbb0-4225-90e3-a16115154646@quicinc.com>
Date: Tue, 24 Sep 2024 12:46:34 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/5] Add display support for Qualcomm SA8775P platform
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
CC: <robdclark@gmail.com>, <quic_abhinavk@quicinc.com>, <sean@poorly.run>,
        <marijn.suijten@somainline.org>, <airlied@gmail.com>,
        <daniel@ffwll.ch>, <maarten.lankhorst@linux.intel.com>,
        <mripard@kernel.org>, <tzimmermann@suse.de>, <robh@kernel.org>,
        <krzk+dt@kernel.org>, <conor+dt@kernel.org>, <swboyd@chromium.org>,
        <konrad.dybcio@linaro.org>, <danila@jiaxyga.com>,
        <bigfoot@classfun.cn>, <neil.armstrong@linaro.org>,
        <mailingradian@gmail.com>, <quic_jesszhan@quicinc.com>,
        <andersson@kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <dri-devel@lists.freedesktop.org>, <freedreno@lists.freedesktop.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <quic_kalyant@quicinc.com>, <quic_jmadiset@quicinc.com>,
        <quic_vpolimer@quicinc.com>
References: <20240912071437.1708969-1-quic_mahap@quicinc.com>
 <7fcbvouzb7gq6lclrkgs6pxondvj5wvutyw3swg55ugvzfpvd4@2ph7x7ulxoyv>
From: Mahadevan P <quic_mahap@quicinc.com>
In-Reply-To: <7fcbvouzb7gq6lclrkgs6pxondvj5wvutyw3swg55ugvzfpvd4@2ph7x7ulxoyv>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: KzVsAwP5PUX1tTjVWqWecZqXc7n3LxI8
X-Proofpoint-GUID: KzVsAwP5PUX1tTjVWqWecZqXc7n3LxI8
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 mlxlogscore=627 spamscore=0 lowpriorityscore=0 adultscore=0 mlxscore=0
 suspectscore=0 malwarescore=0 phishscore=0 impostorscore=0 clxscore=1015
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2408220000 definitions=main-2409240049


On 9/12/2024 1:26 PM, Dmitry Baryshkov wrote:
> On Thu, Sep 12, 2024 at 12:44:32PM GMT, Mahadevan wrote:
>> Add support for mdss and dpu driver on Qualcomm SA8775P platform.
>>
>> ---
>> This series depends on following series:
>> https://lore.kernel.org/all/20240816-sa8775p-mm-v3-v1-0-77d53c3c0cef@quicinc.com/
> As such, it probably can not be merged before 6.14 (the mentioned series
> will go on 6.13, we usually don't do cross-tree merges into drm). Please
> rework the bindings to drop the dependency (it is possible, use fake
> nodes instead of using dispcc + ID). Then you can specify that only the
> DTS patch depends on the dispcc support, allowing driver changes to go
> in first.


Can we use clocks = <&dummy_dispcc 0>, <&dummy_dispcc 1>,  
<&dummy_dispcc 2>; instead of  clocks =  <&dispcc0 
MDSS_DISP_CC_MDSS_AHB_CLK>, <&dispcc0 MDSS_DISP_CC_MDSS_MDP_LUT_CLK>, 
<&dispcc0 MDSS_DISP_CC_MDSS_MDP_CLK>; in dt bindings?

>
>> ---
>>
>> Mahadevan (5):
>>    dt-bindings: display/msm: Document MDSS on SA8775P
>>    dt-bindings: display/msm: Document the DPU for SA8775P
>>    drm/msm: mdss: Add SA8775P support
>>    drm/msm/dpu: Add SA8775P support
>>    arm64: dts: qcom: sa8775p: add display dt nodes
>>
>>   .../display/msm/qcom,sa8775p-dpu.yaml         | 120 +++++
>>   .../display/msm/qcom,sa8775p-mdss.yaml        | 225 ++++++++
>>   arch/arm64/boot/dts/qcom/sa8775p.dtsi         |  85 +++
>>   .../msm/disp/dpu1/catalog/dpu_8_4_sa8775p.h   | 485 ++++++++++++++++++
>>   .../gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c    |   3 +-
>>   .../gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h    |   3 +-
>>   drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c       |   3 +-
>>   drivers/gpu/drm/msm/msm_mdss.c                |  10 +
>>   8 files changed, 931 insertions(+), 3 deletions(-)
>>   create mode 100644 Documentation/devicetree/bindings/display/msm/qcom,sa8775p-dpu.yaml
>>   create mode 100644 Documentation/devicetree/bindings/display/msm/qcom,sa8775p-mdss.yaml
>>   create mode 100644 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_4_sa8775p.h
>>
>> -- 
>> 2.34.1
>>

