Return-Path: <linux-arm-msm+bounces-32566-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id B105198723D
	for <lists+linux-arm-msm@lfdr.de>; Thu, 26 Sep 2024 13:02:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 5786E1F22997
	for <lists+linux-arm-msm@lfdr.de>; Thu, 26 Sep 2024 11:02:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A0D5D1AED50;
	Thu, 26 Sep 2024 11:02:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="NorRxzaU"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BFABC1AD5DE;
	Thu, 26 Sep 2024 11:02:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727348545; cv=none; b=HzZ+9SWRrg01e6z57PSnZTCpatcu38DnD35ulStvr1+CY7y1pwUN9k2/1szMXqb/ScNYzulUoSSINnPdZTZth5x+4gIVyPkitZEl2UTzS5O2AfBbe0WzWEHyMz8xFBKJMndakOQvxZmTGMK7DRlCoYk98RuJTr1U0g/5j3+IaGQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727348545; c=relaxed/simple;
	bh=F0UVsGxKAvm1N2TDLp8mzquP9ID1kDv0Ml6hzJYIy9k=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=TLZhXvKIH+y/q91znqGJWxRBz/BDyc+A94fHdeS9h1FA7GZjVBrdpSLCKxi+ZYExQCqvGauwPVF0bdioIi477osDJ8tdRo9+i1QuOZM4UrixGTBMT07YeC85EMc+s8jQsOLaaONAA/yw6bpLGjSpu3bz917xC8fnpEGHT2G6bhc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=qualcomm.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=NorRxzaU; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 48Q7UxEu013240;
	Thu, 26 Sep 2024 11:02:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=QFlKmRY6ufpuU3OIhekqn0mKR1IMfWPajb9
	clKzK1Sw=; b=NorRxzaUHgMt1PBtyIeSj2fEvKfkb24TyhCgbZpZbbw+hQUHKa/
	+j8Rwh6VZfFOouKHS6ljVEUJPfugJJWxnUWCG5oK3sCcQN8fTOxJ2BP4B8BXNqVj
	i7+pnC7hpY5zosY/mj46hPsbb5yfy3htZMl+3Xa1DdFRO1IE37XlRqo5r95YIkgv
	HMi+pPDDgQNs7dpN6SNTyHRtHIGTmnd7ePxdMsKaUdUr7xwyNohr55YCOmaDoh7M
	Rs2J3A5t+f/rO6w6Ki2gPAZfnGujK8cU6+2yNC35oiBXZfNvrVTsgqv/XD7lYT25
	VkE+FqoBJ70gbsBHgTx9ZqKMxV7z0nZ9W7g==
Received: from apblrppmta02.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 41snqyq9xm-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 26 Sep 2024 11:02:02 +0000 (GMT)
Received: from pps.filterd (APBLRPPMTA02.qualcomm.com [127.0.0.1])
	by APBLRPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTP id 48QB1x7S024954;
	Thu, 26 Sep 2024 11:01:59 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by APBLRPPMTA02.qualcomm.com (PPS) with ESMTPS id 41sq7mg025-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 26 Sep 2024 11:01:59 +0000
Received: from APBLRPPMTA02.qualcomm.com (APBLRPPMTA02.qualcomm.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 48QB1xYZ024941;
	Thu, 26 Sep 2024 11:01:59 GMT
Received: from hu-devc-hyd-u22-c.qualcomm.com (hu-mahap-hyd.qualcomm.com [10.213.96.84])
	by APBLRPPMTA02.qualcomm.com (PPS) with ESMTPS id 48QB1wxp024937
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 26 Sep 2024 11:01:59 +0000
Received: by hu-devc-hyd-u22-c.qualcomm.com (Postfix, from userid 2365311)
	id BB1DBAEA; Thu, 26 Sep 2024 16:31:57 +0530 (+0530)
From: Mahadevan <quic_mahap@quicinc.com>
To: robdclark@gmail.com, quic_abhinavk@quicinc.com,
        dmitry.baryshkov@linaro.org, sean@poorly.run,
        marijn.suijten@somainline.org, airlied@gmail.com, daniel@ffwll.ch,
        maarten.lankhorst@linux.intel.com, mripard@kernel.org,
        tzimmermann@suse.de, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, swboyd@chromium.org, konrad.dybcio@linaro.org,
        danila@jiaxyga.com, bigfoot@classfun.cn, neil.armstrong@linaro.org,
        mailingradian@gmail.com, quic_jesszhan@quicinc.com,
        andersson@kernel.org
Cc: Mahadevan <quic_mahap@quicinc.com>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        quic_kalyant@quicinc.com, quic_jmadiset@quicinc.com,
        quic_vpolimer@quicinc.com
Subject: [PATCH v2 0/5] Display enablement changes for Qualcomm SA8775P platform
Date: Thu, 26 Sep 2024 16:31:32 +0530
Message-Id: <20240926110137.2200158-1-quic_mahap@quicinc.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-QCInternal: smtphost
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: NH3GmPhXY83HubuCbTipKwDXWUVL0tar
X-Proofpoint-ORIG-GUID: NH3GmPhXY83HubuCbTipKwDXWUVL0tar
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 impostorscore=0 adultscore=0 bulkscore=0 phishscore=0 mlxlogscore=923
 spamscore=0 lowpriorityscore=0 clxscore=1015 mlxscore=0 malwarescore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2408220000 definitions=main-2409260073

This series introduces support to enable the Mobile Display Subsystem (MDSS)
and Display Processing Unit (DPU) for the Qualcomm SA8775P target. It
includes the addition of the hardware catalog, compatible string,
relevant device tree changes, and their YAML bindings.

---

In this series PATCH 5: "arm64: dts: qcom: sa8775p: add display dt nodes"
depends on the clock enablement change:
https://lore.kernel.org/all/20240816-sa8775p-mm-v3-v1-0-77d53c3c0cef@quicinc.com/

---

[v2]
- Updated cover letter subject and message. [Dmitry]
- Use fake DISPCC nodes to avoid clock dependencies in dt-bindings. [Dmitry]
- Update bindings by fixing dt_binding_check tool errors (update includes in example),
  adding proper spacing and indentation in the binding example, droping unused labels,
  droping status disable, adding reset node. [Dmitry, Rob, Krzysztof]
- Reorder compatible string of MDSS and DPU based on alphabetical order.[Dmitry]
- add reg_bus_bw in msm_mdss_data. [Dmitry]
- Fix indentation in the devicetree. [Dmitry]

---

Mahadevan (5):
  dt-bindings: display/msm: Document MDSS on SA8775P
  dt-bindings: display/msm: Document the DPU for SA8775P
  drm/msm: mdss: Add SA8775P support
  drm/msm/dpu: Add SA8775P support
  arm64: dts: qcom: sa8775p: add display dt nodes

 .../display/msm/qcom,sa8775p-dpu.yaml         | 122 +++++
 .../display/msm/qcom,sa8775p-mdss.yaml        | 239 +++++++++
 arch/arm64/boot/dts/qcom/sa8775p.dtsi         |  87 ++++
 .../msm/disp/dpu1/catalog/dpu_8_4_sa8775p.h   | 485 ++++++++++++++++++
 .../gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c    |   3 +-
 .../gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h    |   3 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c       |   3 +-
 drivers/gpu/drm/msm/msm_mdss.c                |  11 +
 8 files changed, 950 insertions(+), 3 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/display/msm/qcom,sa8775p-dpu.yaml
 create mode 100644 Documentation/devicetree/bindings/display/msm/qcom,sa8775p-mdss.yaml
 create mode 100644 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_4_sa8775p.h

-- 
2.34.1


