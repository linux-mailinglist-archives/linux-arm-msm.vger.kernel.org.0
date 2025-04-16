Return-Path: <linux-arm-msm+bounces-54560-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 25FBDA90F4C
	for <lists+linux-arm-msm@lfdr.de>; Thu, 17 Apr 2025 01:16:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id B7E7C7A98B2
	for <lists+linux-arm-msm@lfdr.de>; Wed, 16 Apr 2025 23:15:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 84CDD24A065;
	Wed, 16 Apr 2025 23:16:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Hin1Ww5f"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7EDF52327AE
	for <linux-arm-msm@vger.kernel.org>; Wed, 16 Apr 2025 23:16:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744845401; cv=none; b=gBnJacmHzk7Fts/wC/wkcHNHY6LP+PRJqbHF6MhvfI5v2qrvxr/zIbKaeHAeHW78BRlg3E99WIgjKQw1OPzyO8c+RAFoatFmqFWMTYFYX28Bie41NCHCjB0Qzd6fWgiJSyW7KrXZDVpMMSL+pn/5x2MxMGzbfWobenj5+PDj+Tw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744845401; c=relaxed/simple;
	bh=re5I34eZqbzRiPw/4I6ROijC5iSjI9aW4YjhD8I8qjo=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=IBZzIWZ3zB+42q/SciJ3jMUehg4pWbCKHgS/aQ7Ckbicb8NAA0QBoK9hEZaf9k8qXfdkZqcI7IIwnSZfMdh0sM2eK+5y8039pHdbvlUgAEtiif+qSmMsl7C/r0eGrZMgKULeu4lnsWqJDaieNH2WTUaMfniBLnEUHbaZUxOYny0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Hin1Ww5f; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53GLA2sL003384
	for <linux-arm-msm@vger.kernel.org>; Wed, 16 Apr 2025 23:16:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=7EAt3UluOmXSwF8L74aTCf
	gjll3Ii4qSJWllOyJC/BE=; b=Hin1Ww5fU3tuk8qieRv8MC9Avy+XtKOu4AWA/c
	+y4dZQw90tnBs5u7VluPzn/AGwjki6lxmfvBlqDjXDRt3jj/ZVQIe7VqtcxfVTEm
	fwiHPLrA7cq4WaQ2M9pZY4uVqrLa+azBmToDuiaL/BGlSf9sxZSce1HHR9KJfCvb
	qMoXK5haxPSWfB8PJLiQRtX1JzHYG7kyRtUuLez2kP9hRQR0iEc8ioq2XALsZVxT
	pFMQilSq8hhsAkb8ogHKOOcK5WToZ2tD6KZulktDFud9E258R5uBO+2RaIMT/I+R
	SQ7AFZhYEcdgicSU5Pwl+FkNLZS3ufK7vYaXI36uUGw0mwCw==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4628rva9mn-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 16 Apr 2025 23:16:37 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-6e91b1ddb51so4923566d6.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 16 Apr 2025 16:16:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744845396; x=1745450196;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7EAt3UluOmXSwF8L74aTCfgjll3Ii4qSJWllOyJC/BE=;
        b=Hasmq1ccsbu1WRAWW9keN1/wdX7+Ow/k0TIuyYoskbG8l5VngoaMLgUe5AbKDg0Ecw
         NqQWkjENmK3Yy+J399BatGypyx8p45X97mlEg1zuC4QdRLcoLYyiUKgaydO61LsPIm12
         1IL4r823O7fc3L3L2B9YCoK2AGcHl1Kcr1mE43VCe6XEAOAc+eyai4yD6m3ht5PsEloD
         zExCRjeAGAFLDFjdS3o5+51yYBI1fxUyyrbFVuwXsXDLtSYGYAPIq+V8CAwltQxAmVpQ
         ilGNkXch8bPEpZJ/nihctU3rc5qV6N85IiPQMdyM2DMEb+aGMKUEjhR3p63qwQ3RMwN7
         0+oA==
X-Gm-Message-State: AOJu0YzcE8RtGdrB29TjvaIbLfB9POs9G2GhUbiV3z2a1puEozt4r7L+
	nrWaVVIBtnLIZZCyDME4GWBbIZWxAOIkmFu7CIWEVUhwpBYpe42p3hRAggwpZ6vfaqZp85MUjnl
	SZetZ/SoADmvmKBKemkPJG9RdcDEAvzkcnnGZKTCBnB4DQVsXON22qHdXGaoZf/kI
X-Gm-Gg: ASbGncuxVWa6U7imYxnKAI8opoSiP0YBnH/FHzj6r4nLTM4dS5KK5qgR7S6mn0hx9SQ
	16BMspK79hGWtuNTVLIZ+NZdsJTgS4RQ2O1geAG6/ttLlALRKJ5BIajxG27GZ3dXwZ1kEvGB/xA
	ZLiyxNB6cQiJQJj7beqGZehlTpizZx6aaT9y2QyBybkIM7hsZ6egmyO4OVNCgr2cF4ZLIR+yhgX
	RpWfD3oNkyr+6tvbAxJrWAlujI2/qNye8q+NMP3C/RJtSv96La3Cy3Xj8/fw5Gey1PXP9w4EjxA
	bgsX47GiinCw9Rvs7JKwg5UncHazAioXoOxZWJQVC+udV0VaOJHGwOy1mNwWZr4I4kWD8nBVV8a
	VW0ZGzfCZWt0I1+HwNp1coayq
X-Received: by 2002:a05:6214:1c81:b0:6f0:e2d4:51fe with SMTP id 6a1803df08f44-6f2b2f8bf21mr53086646d6.26.1744845396282;
        Wed, 16 Apr 2025 16:16:36 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFa9CyYlPHR76U+wpIbjfz5+zG+tcMEvdR/pJVUtUtnG9kDhHh1koGxcXHC08b08rCC56n7JA==
X-Received: by 2002:a05:6214:1c81:b0:6f0:e2d4:51fe with SMTP id 6a1803df08f44-6f2b2f8bf21mr53086286d6.26.1744845395916;
        Wed, 16 Apr 2025 16:16:35 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-30f4649d79esm26062181fa.15.2025.04.16.16.16.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Apr 2025 16:16:34 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Subject: [PATCH v4 00/10] drm/msm: add support for SAR2130P
Date: Thu, 17 Apr 2025 02:16:30 +0300
Message-Id: <20250417-sar2130p-display-v4-0-b91dd8a21b1a@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAE46AGgC/3XOwW6DMAwG4FdBOS/McULFeup7VDuEYNpIQGico
 lYV774UDtuBXSz9lv3ZL8EUPbE4Fi8Rafbsw5iD+SiEu9rxQtK3OQsErEBDLdlGVBom2Xqeevu
 UDRxAda6jRoPIa1Okzj9W8vy95Ui3e5bT1hSNZZIuDINPx2KkR/ocLCeK4j1+9ZxCfK4PzWqd/
 //2rCRI1RqnoTO6Rjz1frQxlCFeVm3GP4IyOwJmQavOmgrQ1hWcAnN5u9v+/WCZy+boX8eoasf
 R2TlgvtEo9wWod5xlWX4A/W19XXABAAA=
X-Change-ID: 20250308-sar2130p-display-b0601fcfeb30
To: Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Dmitry Baryshkov <lumag@kernel.org>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Kuogee Hsieh <quic_khsieh@quicinc.com>,
        Krishna Manikandan <quic_mkrishn@quicinc.com>,
        Jonathan Marek <jonathan@marek.ca>,
        Bjorn Andersson <andersson@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
        Joerg Roedel <joro@8bytes.org>, Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, iommu@lists.linux.dev,
        linux-arm-kernel@lists.infradead.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2920;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=re5I34eZqbzRiPw/4I6ROijC5iSjI9aW4YjhD8I8qjo=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBoADpQt6QnxuHUxftotWk2OlvAZiO1lHUeLTtbz
 n0gHNKPi8GJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaAA6UAAKCRCLPIo+Aiko
 1dneB/oDKs/x/qXBDu4zM/App/txTQOV1RDcSPyDhFpjDNAaDhm9YKy6/fss2ciMM3oNbTQe7xj
 GLa4DZwyzaXI1oJAeBXrN6sPh6kiGCTbS8q6mFiQWhjixbX8YrxZ4JZxqsfIZhX8fyEMXanGDMG
 G2Z+QL+twxDFsWQRvysKw7usWWOuG2O1aA0I0DvO4NPTyZvXczJuD//vbmZ0JfaLi2tZWv8LRaJ
 ssuXHlM8asP13rn2xUgBcjmZmL8aHS3rtvA6clhZR8ILjBpH3T8cch6WbKZsWUGtgYQpgFLLaLM
 cYlVbQIqPoOmO/2MSAKJ4kr94yvlBCO6uXdH54p8ZMDHAQ2p
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-ORIG-GUID: SpN_koZvVczz41ZfIPG7VNqo7WBIX_Yd
X-Authority-Analysis: v=2.4 cv=RbSQC0tv c=1 sm=1 tr=0 ts=68003a55 cx=c_pps a=UgVkIMxJMSkC9lv97toC5g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=KKAkSRfTAAAA:8 a=hvGiVLgBQ5XhCkBqgSwA:9 a=QEXdDO2ut3YA:10
 a=1HOtulTD9v-eNWfpl4qZ:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: SpN_koZvVczz41ZfIPG7VNqo7WBIX_Yd
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-16_09,2025-04-15_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=984
 suspectscore=0 adultscore=0 impostorscore=0 clxscore=1015 bulkscore=0
 phishscore=0 priorityscore=1501 spamscore=0 mlxscore=0 lowpriorityscore=0
 malwarescore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504160186

Add support for the Mobile Display SubSystem (MDSS) device present on
the Qualcomm SAR2130P platform. The MDSS device is similar to SM8550, it
features two MIPI DSI controllers, two MIPI DSI PHYs and one DisplayPort
controller.

Note, due to the technical limitations DP controller wasn't completely
evaluated.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
Changes in v4:
- Changed MDP->EBI interconnect to QCOM_ICC_TAG_ALWAYS (Konrad)
- Link to v3: https://lore.kernel.org/r/20250415-sar2130p-display-v3-0-62314b1c9023@oss.qualcomm.com

Changes in v3:
- Use defines for DSI PHY clock indices (Konrad)
- Increas VBIF region size of 0x3000 (Konrad)
- Link to v2: https://lore.kernel.org/r/20250314-sar2130p-display-v2-0-31fa4502a850@oss.qualcomm.com

Changes in v2:
- In MDSS schema switched from list items to contains: (Krzyztof)
- In MDSS schema dropped extra empty lines (Krzysztof)
- Fixed .ubwc_bank_spread in msm_mdss. (LKP)
- Link to v1: https://lore.kernel.org/r/20250308-sar2130p-display-v1-0-1d4c30f43822@linaro.org

---
Dmitry Baryshkov (10):
      dt-bindings: display/msm: dp-controller: describe SAR2130P
      dt-bindings: display/msm: dsi-controller-main: describe SAR2130P
      dt-bindings: display/msm: dsi-phy-7nm: describe SAR2130P
      dt-bindings: display/msm: qcom,sc7280-dpu: describe SAR2130P
      dt-bindings: display/msm: Add Qualcomm SAR2130P
      drm/msm/mdss: add SAR2130P device configuration
      drm/msm/dsi/phy: add configuration for SAR2130P
      drm/msm/dpu: add catalog entry for SAR2130P
      iommu/arm-smmu-qcom: Add SAR2130P MDSS compatible
      arm64: dts: qcom: sar2130p: add display nodes

 .../bindings/display/msm/dp-controller.yaml        |   1 +
 .../bindings/display/msm/dsi-controller-main.yaml  |   2 +
 .../bindings/display/msm/dsi-phy-7nm.yaml          |   1 +
 .../bindings/display/msm/qcom,sar2130p-mdss.yaml   | 439 +++++++++++++++++++++
 .../bindings/display/msm/qcom,sc7280-dpu.yaml      |   1 +
 arch/arm64/boot/dts/qcom/sar2130p.dtsi             | 395 ++++++++++++++++++
 .../drm/msm/disp/dpu1/catalog/dpu_9_1_sar2130p.h   | 434 ++++++++++++++++++++
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c     |   2 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h     |   1 +
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c            |   1 +
 drivers/gpu/drm/msm/dsi/phy/dsi_phy.c              |   2 +
 drivers/gpu/drm/msm/dsi/phy/dsi_phy.h              |   1 +
 drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c          |  23 ++
 drivers/gpu/drm/msm/msm_mdss.c                     |  11 +
 drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c         |   1 +
 15 files changed, 1314 insertions(+), 1 deletion(-)
---
base-commit: 5b37f7bfff3b1582c34be8fb23968b226db71ebd
change-id: 20250308-sar2130p-display-b0601fcfeb30

Best regards,
-- 
Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


