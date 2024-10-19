Return-Path: <linux-arm-msm+bounces-35109-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7097D9A4F2A
	for <lists+linux-arm-msm@lfdr.de>; Sat, 19 Oct 2024 17:38:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 91CB71C215AC
	for <lists+linux-arm-msm@lfdr.de>; Sat, 19 Oct 2024 15:38:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AED95149C61;
	Sat, 19 Oct 2024 15:38:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="CtnDC+a4"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0A4412B94;
	Sat, 19 Oct 2024 15:38:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729352301; cv=none; b=lAaWCPUElFjqNB4JhVF2IZpHIfSxA3+6YtRpuyrNI4ayUSnm8BZyvA6ApNLMfFZdRtMSPoCbpJ0oktZ8Ql6Cpgoy9IqmAAKbNYrhyDC6FEWIoN6SBUkBp3Nl5xwTiydPbdZUU4hlV69Ak8cSi156f0hupDgiAipeV/nImL2fexI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729352301; c=relaxed/simple;
	bh=Cu7yHmohtP/E8jkXxeHzgFg4vscebnXSd6FQEfOAmN0=;
	h=From:Subject:Date:Message-ID:MIME-Version:Content-Type:To:CC; b=WwqxvWMletfl5LLtH66q7nosjHOYDflyfYi/zLdGPtTpVzqu4tbQ2LPQi0QYRcVMCctK48g1z/NFabaytNkTx214/bblRfzI7lxT0LhBpp55yYef/CL8wYLVhNnx+OmH5SbvwN/ue645KLUI8xvZOhmeTbc8UlA6OKtETBJ+YSk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=CtnDC+a4; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49JDB847023912;
	Sat, 19 Oct 2024 15:38:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=qs8Q+il509YMyUfeoH1F98
	25BtzaHdk2l9pbd9/cZeY=; b=CtnDC+a4y2JhHzi8WIzPbvfnTnIfF6IQmjsqkV
	R5qgbFOoXew3q12t3dHQjQjAkjunSeKisehEbQCnJJA22TkLZCEUdwvPvbgbrblv
	46ZA8A2PdbTwPBr2kbKSwd+vQZ4YaxkNP3+2e7yA3jhv4PYhc80mmD2BXZ+WIHn9
	VDIPyRxTNSn0Pn6erf/IdT7gvitVPP/EgyHN44kdJFOGbmEeQ6cJKg4dyYLVtgnV
	6sAVSBXmpIkrkknOK0nFRJ1c00bb9QQpos+GwDqC1XYNQ2BNbZSujbA4R+6pN2hK
	i/t2omeGuNaIUEOwy6ch+oUG3/45eC5KrjGi5PhYLSLbJhWQ==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 42c6sj8sxe-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sat, 19 Oct 2024 15:38:03 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 49JFc1tA024767
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sat, 19 Oct 2024 15:38:01 GMT
Received: from hu-mahap-hyd.qualcomm.com (10.80.80.8) by
 nalasex01b.na.qualcomm.com (10.47.209.197) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Sat, 19 Oct 2024 08:37:54 -0700
From: Mahadevan <quic_mahap@quicinc.com>
Subject: [PATCH v4 0/5] Display enablement changes for Qualcomm SA8775P
 platform
Date: Sat, 19 Oct 2024 20:46:34 +0530
Message-ID: <20241019-patchv3_1-v4-0-a95d8f0eae37@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAFLNE2cC/03Myw6CMBCF4Vchs7ZkplwEV76HMaSOg50FFAsSE
 8K7W125O19y8m8wS1SZ4ZRtEGXVWcOYUB4yYO/Ghxi9J4NFW2JboJncwn4tOjI1It+YqrKVBtJ
 /itLr+9e6XJP7GAaz+Cjur2BrIqTimFuLSFVjyDxfyt3gvJvO36kj5xwG2PcPpH4Cz50AAAA=
X-Change-ID: 20240930-patchv3_1-600cbc1549e8
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
        Mahadevan <quic_mahap@quicinc.com>,
        Neil Armstrong
	<neil.armstrong@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        "Konrad
 Dybcio" <konrad.dybcio@linaro.org>
CC: <linux-arm-msm@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
        <freedreno@lists.freedesktop.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>,
        Kalyan Thota <quic_kalyant@quicinc.com>,
        Jayaprakash Madisetty <quic_jmadiset@quicinc.com>,
        Krzysztof Kozlowski
	<krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1729352274; l=3206;
 i=quic_mahap@quicinc.com; s=20241001; h=from:subject:message-id;
 bh=Cu7yHmohtP/E8jkXxeHzgFg4vscebnXSd6FQEfOAmN0=;
 b=pO+Vfk6/rP8Oh8sBi03D1cgOAqn1zafX5LdB3b32mzL7xaACVpDU0620Kc89mD3rAzLMmBoU4
 b9lW5wIyvrhADy4YwZ6IgS3slpc2/+Wdhja/Zj3l/aDDB/KsNklx+Cg
X-Developer-Key: i=quic_mahap@quicinc.com; a=ed25519;
 pk=Xc9CA438o9mZKp4uZ8vZMclALnJ8XtlKn/n3Y42mMBI=
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: goaCu0HOL00icKSPx1FxtaqXuDba6h7N
X-Proofpoint-ORIG-GUID: goaCu0HOL00icKSPx1FxtaqXuDba6h7N
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 adultscore=0
 bulkscore=0 phishscore=0 mlxlogscore=999 clxscore=1015 priorityscore=1501
 lowpriorityscore=0 malwarescore=0 suspectscore=0 spamscore=0 mlxscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2409260000
 definitions=main-2410190113

This series introduces support to enable the Mobile Display Subsystem (MDSS)
and Display Processing Unit (DPU) for the Qualcomm SA8775P target. It
includes the addition of the hardware catalog, compatible string,
relevant device tree changes, and their YAML bindings.

---
In this series
- PATCH 1: "dt-bindings: display/msm: Document MDSS on SA8775P" depends on dp
  binding documetion in this change:
  https://lore.kernel.org/all/20240923113150.24711-5-quic_mukhopad@quicinc.com/
- PATCH 5: "arm64: dts: qcom: sa8775p: add display dt nodes for MDSS0 and DPU"
  depends on the clock enablement change:
  https://lore.kernel.org/all/20240816-sa8775p-mm-v3-v1-0-77d53c3c0cef@quicinc.com/

---
[v5]
- Update clock-name of display-controller in MDSS documentation to align with
  qcom,sm8650-dpu.yaml. [Rob]
- Update power-domains of display-controller in DT to do proper voting on MMCX
  rail. [Internal Review]

[v4]
- Removed new YAML added for sa8775p dpu dt-binding documention as it is similar
  to qcom,sm8650-dpu.yaml and added the compatible in same. [Krzysztof]

[v3]
-Edited copyright for catalog changes. [Dmitry]
-Fix dt_binding_check tool errors(update reg address as address-cells and
 size-cells of root node one and maintain the same for child nodes of mdss,
 added additionalProperties in schema).
 [Rob, Bjorn, Krzysztof]
-Add QCOM_ICC_TAG_ACTIVE_ONLY interconnect path tag to mdp0-mem and mdp1-mem
 path in devicetree. [Dmitry]
-Update commit subject and message for DT change. [Dmitry]
-Remove interconnect path tags from dt bindings. (ref sm8450-mdss yaml)

[v2]
- Updated cover letter subject and message. [Dmitry]
- Use fake DISPCC nodes to avoid clock dependencies in dt-bindings. [Dmitry]
- Update bindings by fixing dt_binding_check tool errors (update includes in example),
  adding proper spacing and indentation in the binding example, droping unused labels,
  droping status disable, adding reset node. [Dmitry, Rob, Krzysztof]
- Reorder compatible string of MDSS and DPU based on alphabetical order.[Dmitry]
- add reg_bus_bw in msm_mdss_data. [Dmitry]
- Fix indentation in the devicetree. [Dmitry]

--
2.34.1

---
Mahadevan (5):
      dt-bindings: display/msm: Document MDSS on SA8775P
      dt-bindings: display/msm: Document the DPU for SA8775P
      drm/msm: mdss: Add SA8775P support
      drm/msm/dpu: Add SA8775P support
      arm64: dts: qcom: sa8775p: add display dt nodes for MDSS0 and DPU

 .../bindings/display/msm/qcom,sa8775p-mdss.yaml    | 241 ++++++++++
 .../bindings/display/msm/qcom,sm8650-dpu.yaml      |   1 +
 arch/arm64/boot/dts/qcom/sa8775p.dtsi              |  89 ++++
 .../drm/msm/disp/dpu1/catalog/dpu_8_4_sa8775p.h    | 485 +++++++++++++++++++++
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c     |   1 +
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h     |   1 +
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c            |   1 +
 drivers/gpu/drm/msm/msm_mdss.c                     |  11 +
 8 files changed, 830 insertions(+)
---
base-commit: e390603cfa79c860ed35e073f5fe77805b067a8e
change-id: 20240930-patchv3_1-600cbc1549e8

Best regards,
-- 
Mahadevan <quic_mahap@quicinc.com>


