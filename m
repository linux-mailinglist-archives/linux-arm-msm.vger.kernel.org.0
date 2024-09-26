Return-Path: <linux-arm-msm+bounces-32569-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 990929872C7
	for <lists+linux-arm-msm@lfdr.de>; Thu, 26 Sep 2024 13:25:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id C19A0B22897
	for <lists+linux-arm-msm@lfdr.de>; Thu, 26 Sep 2024 11:25:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A40DC18C90B;
	Thu, 26 Sep 2024 11:25:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="fy/K3EZv"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26ADC18C002;
	Thu, 26 Sep 2024 11:25:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727349935; cv=none; b=Vf/9MI4XRz2M0jIkWdQRLUFv/Uog1Q3bbo6PB1/1pBQeKVdZPiE72hWrzh4Ps7Jk3fGvO395tUIlS05gaINKn+NpyncfQPnkPmFn+hKgCab5OCH7CrQo3aGiB7OElME9H5XjrioeHjpwvHzESsbDcYJlehUb4jzVmGJzSawFX7o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727349935; c=relaxed/simple;
	bh=QSayg/gERl1N3M4Hynsnxi/7KMvYUeOmKG96vzvT41U=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=Kaolu8Bb4BpxuIxe9BfPXVYcLGVkfDg6J/uUp3kWvxHhegAjrj2Vs78DJjz0gmjDj/3oWRdxN1hhFoXPQsFPKH5PuT3ElxWYm9fkoPNk66Rvitq98Q2wAfXfsY0mWm4nBq16uMMo9DO1jFYTcSXL0r8y3hpJap1mmcILJ06PjIg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=fy/K3EZv; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 48Q7EqDs008306;
	Thu, 26 Sep 2024 11:25:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	u4A5clw8rWfBOMmmKrbBe5gQe1QAgockRUeNjkNYMwg=; b=fy/K3EZvKhmXSf7s
	dlb9mQOyup92d2jQxmNSGDw5kii6d2wZotDLWhytuEyvlimmAaDqJqK6av0lv+Fl
	42YLXZNoRuBZg12b4Bf3cSALkNv9U2v1ZIwEf6+F8YHwHeWWi3bvCqP56LoApbqj
	5KAcmh8QSoQXwaFdB1jhwXYfah+CjU+6kVScXr41EGEDlUC9sCAoXpb0TVjztwpa
	R2+oj1cE4n39DkndslKha6hfGtoBvbmUI01xDrRg9Vcmn1wbkgxdc/RGd+f5Zupw
	FxnZc3aXrbnV29oRDILg9QLlRuSzdqR7iN8HdZNFCeuXgjDx9nJB9/a7WfeUC8TV
	Wenkgw==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 41skueyb3b-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 26 Sep 2024 11:25:15 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 48QBPDLi024987
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 26 Sep 2024 11:25:13 GMT
Received: from [10.204.67.11] (10.80.80.8) by nalasex01b.na.qualcomm.com
 (10.47.209.197) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Thu, 26 Sep
 2024 04:25:05 -0700
Message-ID: <46cd6c25-0a82-46c6-9382-167a44a689ba@quicinc.com>
Date: Thu, 26 Sep 2024 16:55:02 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/5] Display enablement changes for Qualcomm SA8775P
 platform
Content-Language: en-US
To: <robdclark@gmail.com>, <quic_abhinavk@quicinc.com>,
        <dmitry.baryshkov@linaro.org>, <sean@poorly.run>,
        <marijn.suijten@somainline.org>, <airlied@gmail.com>,
        <daniel@ffwll.ch>, <maarten.lankhorst@linux.intel.com>,
        <mripard@kernel.org>, <tzimmermann@suse.de>, <robh@kernel.org>,
        <krzk+dt@kernel.org>, <conor+dt@kernel.org>, <swboyd@chromium.org>,
        <konrad.dybcio@linaro.org>, <danila@jiaxyga.com>,
        <bigfoot@classfun.cn>, <neil.armstrong@linaro.org>,
        <mailingradian@gmail.com>, <quic_jesszhan@quicinc.com>,
        <andersson@kernel.org>
CC: <linux-arm-msm@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
        <freedreno@lists.freedesktop.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <quic_kalyant@quicinc.com>,
        <quic_jmadiset@quicinc.com>, <quic_vpolimer@quicinc.com>
References: <20240926110308.2201577-1-quic_mahap@quicinc.com>
From: Mahadevan P <quic_mahap@quicinc.com>
In-Reply-To: <20240926110308.2201577-1-quic_mahap@quicinc.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: F_ctQFztPoh0Bqw2DLrJYcMOzd0SOZ6Q
X-Proofpoint-ORIG-GUID: F_ctQFztPoh0Bqw2DLrJYcMOzd0SOZ6Q
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 spamscore=0
 adultscore=0 clxscore=1015 lowpriorityscore=0 suspectscore=0
 malwarescore=0 impostorscore=0 mlxlogscore=999 bulkscore=0 mlxscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2408220000 definitions=main-2409260077

Sorry, Please ignore this thread/coverletter

On 9/26/2024 4:33 PM, Mahadevan wrote:
> This series introduces support to enable the Mobile Display Subsystem (MDSS)
> and Display Processing Unit (DPU) for the Qualcomm SA8775P target. It
> includes the addition of the hardware catalog, compatible string,
> relevant device tree changes, and their YAML bindings.
>
> ---
>
> In this series PATCH 5: "arm64: dts: qcom: sa8775p: add display dt nodes"
> depends on the clock enablement change:
> https://lore.kernel.org/all/20240816-sa8775p-mm-v3-v1-0-77d53c3c0cef@quicinc.com/
>
> ---
>
> [v2]
> - Updated cover letter subject and message. [Dmitry]
> - Use fake DISPCC nodes to avoid clock dependencies in dt-bindings. [Dmitry]
> - Update bindings by fixing dt_binding_check tool errors (update includes in example),
>    adding proper spacing and indentation in the binding example, droping unused labels,
>    droping status disable, adding reset node. [Dmitry, Rob, Krzysztof]
> - Reorder compatible string of MDSS and DPU based on alphabetical order.[Dmitry]
> - add reg_bus_bw in msm_mdss_data. [Dmitry]
> - Fix indentation in the devicetree. [Dmitry]
>
> ---
>
> Mahadevan (5):
>    dt-bindings: display/msm: Document MDSS on SA8775P
>    dt-bindings: display/msm: Document the DPU for SA8775P
>    drm/msm: mdss: Add SA8775P support
>    drm/msm/dpu: Add SA8775P support
>    arm64: dts: qcom: sa8775p: add display dt nodes
>
>   .../display/msm/qcom,sa8775p-dpu.yaml         | 122 +++++
>   .../display/msm/qcom,sa8775p-mdss.yaml        | 239 +++++++++
>   arch/arm64/boot/dts/qcom/sa8775p.dtsi         |  87 ++++
>   .../msm/disp/dpu1/catalog/dpu_8_4_sa8775p.h   | 485 ++++++++++++++++++
>   .../gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c    |   3 +-
>   .../gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h    |   3 +-
>   drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c       |   3 +-
>   drivers/gpu/drm/msm/msm_mdss.c                |  11 +
>   8 files changed, 950 insertions(+), 3 deletions(-)
>   create mode 100644 Documentation/devicetree/bindings/display/msm/qcom,sa8775p-dpu.yaml
>   create mode 100644 Documentation/devicetree/bindings/display/msm/qcom,sa8775p-mdss.yaml
>   create mode 100644 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_4_sa8775p.h
>

