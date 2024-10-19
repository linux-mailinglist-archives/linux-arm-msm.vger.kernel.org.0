Return-Path: <linux-arm-msm+bounces-35115-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id DCC2B9A4F51
	for <lists+linux-arm-msm@lfdr.de>; Sat, 19 Oct 2024 17:43:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 4F008B21144
	for <lists+linux-arm-msm@lfdr.de>; Sat, 19 Oct 2024 15:43:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 11D61178CC5;
	Sat, 19 Oct 2024 15:43:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="pFouEEZQ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4FBD612B94;
	Sat, 19 Oct 2024 15:43:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729352630; cv=none; b=lB5IYtofHcSLswqP8PC1BeIpL9pM0keK5zlC0V7sOGM5HLLivEkdC/DNYpXu1WhJtTPRdnOdHkx2zf2pNnrfcPWqLTJM1OYMD28FeRoaGhW4dQRii6V1acll6BcWrmutPVbZS3xBljWcrEQUg2Sjqb4rnwAWmE3BPW0j2iRI5mQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729352630; c=relaxed/simple;
	bh=zcvHzAFsb0sTF2l7ptVtEVd4fXgcNMRnkSM/TIzPMCk=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=T644XzjKsuPjLjNmiwl+k+CUZ4nx5WVXqxesZ/dx8YGjUC1+WZjVqU+3WZiiTJPH8lY0aWZljNHLuDHMX/eBxzI5rxA0ldSFAcVDjFvN6dMsEyp4YQdiudsLKIOifCHx4AUPkfTfl2n7+48T8/FcIhQl8bGW2e7pn6htXHU+tjY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=pFouEEZQ; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49JCfVin013271;
	Sat, 19 Oct 2024 15:43:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	eYQsy39idf+97fnjHtS7qFA5FBRjTSbjegPOxvhnXks=; b=pFouEEZQ171JBp4m
	oN34gEjERbL5fMZK9RwUgiFpivvJGjqmjlZIhqdF6QIQkSg7VdY5Q8j//DqvC3Cv
	ssKmq1n5LzhPO+ugCxxotxNWM0RSS0Hc3O5ois7ZZWum238JT2Jy+Hr8F/9aGlBl
	12ndgGZbeQLTfzvW9MZMjQNFaYOCBQMxBfHvC703u3VOP5oyErGrN8c9FPAe4Ohg
	oHrEJn7U4lzEPhVwCFD/ykOCN6RhNnhZIqtRV0x7vnqYi7eY4aaqycDeIFA9m9OG
	x2ZiRmunuOiFPCCa6bWjgUPdnp0tBRkhb7SR5QBSYqw5j9OrfuabjDoo4Wk0ZkuH
	7kSOUg==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 42c6vc0snd-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sat, 19 Oct 2024 15:43:33 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 49JFhWjg015797
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sat, 19 Oct 2024 15:43:32 GMT
Received: from [10.204.67.11] (10.80.80.8) by nalasex01b.na.qualcomm.com
 (10.47.209.197) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Sat, 19 Oct
 2024 08:43:26 -0700
Message-ID: <85873886-c578-4f42-a46e-728f9a92f837@quicinc.com>
Date: Sat, 19 Oct 2024 21:13:23 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 0/5] Display enablement changes for Qualcomm SA8775P
 platform
Content-Language: en-US
To: Rob Clark <robdclark@gmail.com>,
        Abhinav Kumar
	<quic_abhinavk@quicinc.com>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
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
        "Bjorn
 Andersson" <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>
CC: <linux-arm-msm@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
        <freedreno@lists.freedesktop.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>,
        Kalyan Thota <quic_kalyant@quicinc.com>,
        Jayaprakash Madisetty <quic_jmadiset@quicinc.com>,
        Krzysztof Kozlowski
	<krzysztof.kozlowski@linaro.org>
References: <20241019-patchv3_1-v4-0-a95d8f0eae37@quicinc.com>
From: Mahadevan P <quic_mahap@quicinc.com>
In-Reply-To: <20241019-patchv3_1-v4-0-a95d8f0eae37@quicinc.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: bKxZqD_FWqTdn-wu0h0zCuJfSoSNRG-h
X-Proofpoint-ORIG-GUID: bKxZqD_FWqTdn-wu0h0zCuJfSoSNRG-h
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 clxscore=1015
 priorityscore=1501 impostorscore=0 lowpriorityscore=0 suspectscore=0
 spamscore=0 phishscore=0 bulkscore=0 mlxscore=0 adultscore=0
 mlxlogscore=999 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2410190114

I apologize for the inconvenience caused by uploading the incorrect 
patch (v4). Kindly disregard it.

On 10/19/2024 8:46 PM, Mahadevan wrote:
> This series introduces support to enable the Mobile Display Subsystem (MDSS)
> and Display Processing Unit (DPU) for the Qualcomm SA8775P target. It
> includes the addition of the hardware catalog, compatible string,
> relevant device tree changes, and their YAML bindings.
>
> ---
> In this series
> - PATCH 1: "dt-bindings: display/msm: Document MDSS on SA8775P" depends on dp
>    binding documetion in this change:
>    https://lore.kernel.org/all/20240923113150.24711-5-quic_mukhopad@quicinc.com/
> - PATCH 5: "arm64: dts: qcom: sa8775p: add display dt nodes for MDSS0 and DPU"
>    depends on the clock enablement change:
>    https://lore.kernel.org/all/20240816-sa8775p-mm-v3-v1-0-77d53c3c0cef@quicinc.com/
>
> ---
> [v5]
> - Update clock-name of display-controller in MDSS documentation to align with
>    qcom,sm8650-dpu.yaml. [Rob]
> - Update power-domains of display-controller in DT to do proper voting on MMCX
>    rail. [Internal Review]
>
> [v4]
> - Removed new YAML added for sa8775p dpu dt-binding documention as it is similar
>    to qcom,sm8650-dpu.yaml and added the compatible in same. [Krzysztof]
>
> [v3]
> -Edited copyright for catalog changes. [Dmitry]
> -Fix dt_binding_check tool errors(update reg address as address-cells and
>   size-cells of root node one and maintain the same for child nodes of mdss,
>   added additionalProperties in schema).
>   [Rob, Bjorn, Krzysztof]
> -Add QCOM_ICC_TAG_ACTIVE_ONLY interconnect path tag to mdp0-mem and mdp1-mem
>   path in devicetree. [Dmitry]
> -Update commit subject and message for DT change. [Dmitry]
> -Remove interconnect path tags from dt bindings. (ref sm8450-mdss yaml)
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
> --
> 2.34.1
>
> ---
> Mahadevan (5):
>        dt-bindings: display/msm: Document MDSS on SA8775P
>        dt-bindings: display/msm: Document the DPU for SA8775P
>        drm/msm: mdss: Add SA8775P support
>        drm/msm/dpu: Add SA8775P support
>        arm64: dts: qcom: sa8775p: add display dt nodes for MDSS0 and DPU
>
>   .../bindings/display/msm/qcom,sa8775p-mdss.yaml    | 241 ++++++++++
>   .../bindings/display/msm/qcom,sm8650-dpu.yaml      |   1 +
>   arch/arm64/boot/dts/qcom/sa8775p.dtsi              |  89 ++++
>   .../drm/msm/disp/dpu1/catalog/dpu_8_4_sa8775p.h    | 485 +++++++++++++++++++++
>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c     |   1 +
>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h     |   1 +
>   drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c            |   1 +
>   drivers/gpu/drm/msm/msm_mdss.c                     |  11 +
>   8 files changed, 830 insertions(+)
> ---
> base-commit: e390603cfa79c860ed35e073f5fe77805b067a8e
> change-id: 20240930-patchv3_1-600cbc1549e8
>
> Best regards,

