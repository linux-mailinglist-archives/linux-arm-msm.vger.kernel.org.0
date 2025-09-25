Return-Path: <linux-arm-msm+bounces-74976-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id C399FB9DC03
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Sep 2025 09:05:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6F8E12E7AA2
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Sep 2025 07:05:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A623D2E8E00;
	Thu, 25 Sep 2025 07:05:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="VwrchYiQ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 008A42DECA5
	for <linux-arm-msm@vger.kernel.org>; Thu, 25 Sep 2025 07:05:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758783922; cv=none; b=cruEUIzFesWvxNrMMvXQ2NBDOZ4Ubt+p72M56MVfnQOIvrc8+5d3fGHTRxQw09jEPZDDrLZup1AbcVCuSFl9ZR/7wTaiVAiYZSqWv81x/FwJQdxMRQkmyjGm49K5Tie0Q1kNjepXJeTeRd4nO5ZggUI+yhDyZRpXb9ag+OQF9o8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758783922; c=relaxed/simple;
	bh=BriQ9CGzQPqKZfWizw8gSbddYqDWtC7/j8W0uWp5qUM=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=Yy2xg5XtD1fgKFzmRFx9FMaHZdRshU4oqDF02TPLKjYHsWuUj5wpF/DkOSywxbl2sf34UCPJ74+504oxkW+k/h8N38mtb/3ucsU6k7KwN/+YgA4Z02ZflZq+afjo9Dgjk4uDvy2e/xjtOBhQPwjWOINs5GLNXID1oQsx3MjDmow=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=VwrchYiQ; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58P29oda029717
	for <linux-arm-msm@vger.kernel.org>; Thu, 25 Sep 2025 07:05:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=yZ+xuQsK8TPZF/qA5Y0n2S
	yswG9xNhbXSlZdrQ5xB8w=; b=VwrchYiQ2Zg1sNSe93WIcnYH+sM91lNdzFPPdp
	kVJxG7VeAfbzOmpWwaBRfJJMCwVJQnkUDPwDrdcOVIyw+dH7nC+Xh9BWQgrOPLr8
	YaxmzGJPqaQarDjClmIHCpR39JQT3y2+LnXBN6ZlCVy6t8LGPaoejdca/oeFeT7Z
	o+b4h5JTiflrMoFyb3ekJCCRQJX+YKJwEHs0HCMoaDD1UAhNsHMRPkEc24gsOCUw
	RQFZ9EMA2TUOfTzh+j+RlLJajTgqRUwOxFObJEKf6vwFE3rkbjXRA2ndPdbaotHl
	bYF1z71I9jNcT7jPrJ0TSyng3cre7Jl/nwzrs/IEksKKE/Zg==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 499n1fq0ya-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 25 Sep 2025 07:05:20 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-3309eab0740so185334a91.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 25 Sep 2025 00:05:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758783919; x=1759388719;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=yZ+xuQsK8TPZF/qA5Y0n2SyswG9xNhbXSlZdrQ5xB8w=;
        b=TnuKhY76mPOLM4R3K/piFsO7mvDnFAD6xsxeoQ0eHTOfNFDbByL/E3FI4lXrMytE7+
         br506iXq5JUVGsbXeJPj/YhzvJENggZQccESuH3nGIRx/8RNc8Bay/XZ8W75w44bBpNT
         WydouEjIJkiE3iukLYW37GFa2W3z2u06JL5bx9XUf5Sx4vEbTLPS2+O+7BuHOH24B4bi
         LhkoYQYVnTYOHkcIVPqEUsPyIbbZZ94Qt/ZB+B/TTtTuZURl97wpHr/mZZ0TcCON1nyU
         9rjmiebiDVzGkX0b3Xmebhsq14UQ4EAxHGjRubSnU88Cq0gN6bqS7bdaabfhADeLiysm
         bspg==
X-Gm-Message-State: AOJu0YwnGNyihVHF5QArxy/L64bCBrCbqMpB5HlBEvwwuYSER674dB/j
	1+v9i00KpWCxf91kq35J4qhRllEAUn1/svrNdetx6N8Pbj/F7UVg5uUckEmdRrPnCKciDc61hUg
	6NUcb16vd7GbqgbJqHZDeO3XJNN/PQc8aimZ9nIKaOJ8bhSR36g6FeW7vXBnrZOnqdy0x
X-Gm-Gg: ASbGncvaRzSsYQucdXiJTKvKacZPfMGh0MGUTbXyUHlaXQ77dmFjyKciICsyVh/GICN
	KW6pmBNS3NmZxiEj0P5STc7Ss5+b2YFidsh1mc5OFnSzrkXrLwnDBtJd0t2eFaHT2BP/B5AMcAK
	jP6B5tlspVX8bhayl3yMywefQdKtrqK6eKcbC9tK1Bjdv7GqUPTpkDYHRLSaC1ht+SS/7qCkiE3
	NAxNPkFs+3tRz31axD4RqXeeNE5nxv0S9E0awXKY+JlYxfaZgasPDhTTA0zur9hH5dyT0ygEFTt
	UvAityIwLCcciYwRvF9YJTS8U+6uySKZU4cC2uMP2AuBObrecTug5NzEF2X8nXbB7Flc9K0pLQc
	BvqmQyyID9MemFO4UFUljRJkQPIk2DBBZejkbeHIKxGqALqPNJkQNM+hM
X-Received: by 2002:a17:90b:38c7:b0:32e:e18a:368d with SMTP id 98e67ed59e1d1-3342a332253mr1367423a91.8.1758783918957;
        Thu, 25 Sep 2025 00:05:18 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFUbujVjnPE51nMK7rlaHLU2fKEdCZgVZSnTJAA3gW7yMsssg3WWsRWMJZqIVrdYskdNrhg0Q==
X-Received: by 2002:a17:90b:38c7:b0:32e:e18a:368d with SMTP id 98e67ed59e1d1-3342a332253mr1367391a91.8.1758783918444;
        Thu, 25 Sep 2025 00:05:18 -0700 (PDT)
Received: from sziotdisp01-gv.qualcomm.com.ap.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3342a2bd584sm914253a91.0.2025.09.25.00.05.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Sep 2025 00:05:18 -0700 (PDT)
From: Xiangxu Yin <xiangxu.yin@oss.qualcomm.com>
Subject: [PATCH v6 00/14] Add DisplayPort support for QCS615 platform
Date: Thu, 25 Sep 2025 15:04:46 +0800
Message-Id: <20250925-add-displayport-support-for-qcs615-platform-v6-0-419fe5963819@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAJDp1GgC/5XRTW7DIBAF4KtErEsEAxjoKveousD8NEhxsMG2G
 kW+e7Glyl00C6/QY6T3jTRPVHyOvqD30xNlP8cS072G5u2E7NXcvzyOrmYEBATRVGPjHHax9Df
 z6FMecZn67Q0p48GWhgpcZ2ONHQ5KCaFly4RkqDb22Yf4vWkfnzVfYxlTfmz4TNff1eGUwjFnp
 phgog1nTDnNfLgMU7Txbs82dWiVZvhtF0QCHGuH2s6h5YRJKmlQl1TKeZjMrbZ3O8F2QgE5RrB
 K1PVbB8Jbpu0Lgu+EpvQYwSsBkkDrnKHcuxeE+EscPIOohDe+aRQNnBD4h1iW5QcZmX2OdAIAA
 A==
X-Change-ID: 20250919-add-displayport-support-for-qcs615-platform-f885597b3573
To: Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
        Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        fange.zhang@oss.qualcomm.com, yongxing.mou@oss.qualcomm.com,
        li.liu@oss.qualcomm.com,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Xiangxu Yin <xiangxu.yin@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1758783908; l=5389;
 i=xiangxu.yin@oss.qualcomm.com; s=20241125; h=from:subject:message-id;
 bh=BriQ9CGzQPqKZfWizw8gSbddYqDWtC7/j8W0uWp5qUM=;
 b=/+juXQNfDmiteVOMuuSFk8BU/ejjFAKfyZOY1rODm2qSmgMfUlT38RitbEUoDhXbe9Ps5SJLU
 OYw0Oe6PmpoB7t0FStYiiPmDd6G9osrC8ci0mRdv00fXYvytnIJH4Q/
X-Developer-Key: i=xiangxu.yin@oss.qualcomm.com; a=ed25519;
 pk=F1TwipJzpywfbt3n/RPi4l/A4AVF+QC89XzCHgZYaOc=
X-Proofpoint-ORIG-GUID: KDN-uF_QeB3wTN9kNsNChXHvqO8V2MDr
X-Proofpoint-GUID: KDN-uF_QeB3wTN9kNsNChXHvqO8V2MDr
X-Authority-Analysis: v=2.4 cv=No/Rc9dJ c=1 sm=1 tr=0 ts=68d4e9b0 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=COk6AnOGAAAA:8 a=-mfqEiHr7Cy1ujZptoQA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTIwMDAzNyBTYWx0ZWRfXy/sh6QTuuELb
 931TXXSYgBiALKgfN/wHfHhlZ2Tbsljmg7kNvYGRa69cr2VHR8jB3l0vvvJs4RKpPopPMKg4te2
 unfOc4wZwhHewmRIJzozepCYQsVfJsu0CJHG67bhtAbNhNOmxvJxRBGF2o8I2C6vPp6RUfxssvb
 k552t3qcY8c+ZPSlVjBHp9YyW00V/I9jYVoO4lg7sx8slaYboOhtvhkC7DJbagoHn93eBDaCPXC
 kKmfJdzozPtDKileQB1y9U13jDGhj5KnuuMWgCMKL8r/uXXwqYzb88mUNEpn8EkXSnAqcChwQLI
 nvFFl5ocFBpc0OjX/SmF42EO1l/lq3YaxQj0fhxJ+u0NSHs1S94n7gqpkLYRZKzB8pyIuo9hFex
 ce1rzkwG
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-24_07,2025-09-24_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0 suspectscore=0 adultscore=0 malwarescore=0
 phishscore=0 bulkscore=0 priorityscore=1501 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509200037

This series aims to extend the USB-C PHY to support DP mode and enable
DisplayPort on the Qualcomm QCS615 platform.

The devicetree modification for DisplayPort on QCS615 will be provided
in a future patch.

Signed-off-by: Xiangxu Yin <xiangxu.yin@oss.qualcomm.com>
---
Changes in v6:
- Move usb3dpphy_reset_l definition to the patch adding compatible and related config data. [Dmitry]
- Add NOTE about SW_PORTSELECT/orientation handling. [Dmitry]
- Use C99-style loop variable declaration in msm_dp_link_lane_map. [Rob]
- Update commit msg with issue description for [05/14, 06/14, 07/14，12/14].
- Link to v5: https://lore.kernel.org/r/20250919-add-displayport-support-for-qcs615-platform-v5-0-eae6681f4002@oss.qualcomm.com

Changes in v5:
- Add new patch to introduce QSERDES v2 COM/TXRX register headers.
- Restore legacy reset & clock register logic. [Dmitry]
- Update phy_xlate() to return ERR_PTR(-ENODEV) when dp_phy is NULL. [Dmitry]
- Rename helper from qmp_check_mutex_phy() to qmp_usbc_check_phy_status(). [Dmitry]
- Drop storing struct device *dev in dp_link as it is only used once. [Dmitry]
- Add robust lane mapping: default 1:1, complete partial configs. [Dmitry]
- Reorganize sub-patches v5[07/14， 08/14, 11/14， 12/14] as suggested.
- Link to v4: https://lore.kernel.org/all/20250911-add-displayport-support-for-qcs615-platform-v4-0-2702bdda14ed@oss.qualcomm.com/

Changes in v4:
- Drop patch v3[01/14 & 13/14], will sutbmit new patchsets based mst dt binding series.
- Update maintainer of qcom,qcs615-qmp-usb3dp-phy.yaml to myself.
- Add missing aux and pipe clocks. [Dmitry]
- Drop second TCSR phandle; register offsets are described directly. [Dmitry]
- Add USBC PHY series related init_load_uA configs. [Dmitry]
- Drop v3[04/14] qmp_phy_usbc_type define and use dp_serdes offsets to confirm DP capability [Dmitry]
- Reorganize sub-patches as suggested.
- Link to v3: https://lore.kernel.org/all/20250820-add-displayport-support-for-qcs615-platform-v3-0-a43bd25ec39c@oss.qualcomm.com/

Changes in v3:
- Renamed qcom,qcs615-qmp-dp-phy.yaml in v2 to qcom,qcs615-qmp-dp-phy.yaml in v3 for QCS615 USB3+DP PHY.
- Updated patch v3[02/14] to revise binding title, description, and property order. [Krzysztof]
- Updated commit messages in patch v3[01/14] and [13/14] to reflect the DTSI rename and clarify compatibility. [Krzysztof]
- Added USB3+DP mode implementation in patches v3 [003–012], organized in logical chunks. [Dmitry]
- Dropped patch v2[03/13] to maintain full backward compatibility with USBC.
- Link to v2: https://lore.kernel.org/all/20250722-add-displayport-support-for-qcs615-platform-v2-0-42b4037171f8@oss.qualcomm.com/

Changes in v2:
- Add new binding qcom,qcs615-qmp-dp-phy.yaml for QCS615 standalone DP
- Split DP PHY driver into patches 4-11 by logical chunks [Dmitry]
- Update DP PHY configuration flow to align with QMP Combo PHY implementation [Dmitry]
- Update all hex values to lowercase [Dmitry]
- Remove redundant comments in DP PHY driver [Krzysztof]
- Remove invalid USBC type define [Dmitry]
- Move lane_map， max_dp_lanes， max_dp_link_rate parsing logic to dp_link [Dmitry]
- Add TCSR-based mutex logic for DP and USB PHY coexistence [Dmitry]
- Drop patches 6–8 and remove related binding properties as rejected upstream
- Link to v1: https://lore.kernel.org/all/20241129-add-displayport-support-for-qcs615-platform-v1-0-09a4338d93ef@quicinc.com/

---
Xiangxu Yin (14):
      dt-bindings: phy: Add QMP USB3+DP PHY for QCS615
      phy: qcom: qmp-usbc: Rename USB-specific ops to prepare for DP support
      phy: qcom: qmp-usbc: Add DP-related fields for USB/DP switchable PHY
      phy: qcom: qmp-usbc: Add regulator init_load support
      phy: qcom: qmp-usbc: Move reset config into PHY cfg
      phy: qcom: qmp-usbc: add DP link and vco_div clocks for DP PHY
      phy: qcom: qmp-usbc: Move USB-only init to usb_power_on
      phy: qcom: qmp-usbc: Add TCSR parsing and PHY mode setting
      phy: qcom: qmp-usbc: Add DP PHY ops for USB/DP switchable Type-C PHYs
      phy: qcom: qmp-usbc: Add USB/DP exclude handling
      phy: qcom: qmp: Add DP v2 PHY register definitions
      phy: qcom: qmp-usbc: Add QCS615 USB/DP PHY config and DP mode support
      drm/msm/dp: move link-specific parsing from dp_panel to dp_link
      drm/msm/dp: Add support for lane mapping configuration

 .../bindings/phy/qcom,qcs615-qmp-usb3dp-phy.yaml   |  111 ++
 drivers/gpu/drm/msm/dp/dp_ctrl.c                   |   10 +-
 drivers/gpu/drm/msm/dp/dp_link.c                   |  118 +++
 drivers/gpu/drm/msm/dp/dp_link.h                   |    5 +
 drivers/gpu/drm/msm/dp/dp_panel.c                  |   78 +-
 drivers/gpu/drm/msm/dp/dp_panel.h                  |    3 -
 drivers/phy/qualcomm/phy-qcom-qmp-dp-phy-v2.h      |   21 +
 drivers/phy/qualcomm/phy-qcom-qmp-qserdes-com-v2.h |  106 ++
 .../phy/qualcomm/phy-qcom-qmp-qserdes-txrx-v2.h    |   68 ++
 drivers/phy/qualcomm/phy-qcom-qmp-usbc.c           | 1066 ++++++++++++++++++--
 drivers/phy/qualcomm/phy-qcom-qmp.h                |    3 +
 11 files changed, 1421 insertions(+), 168 deletions(-)
---
base-commit: b5a4da2c459f79a2c87c867398f1c0c315779781
change-id: 20250919-add-displayport-support-for-qcs615-platform-f885597b3573

Best regards,
-- 
Xiangxu Yin <xiangxu.yin@oss.qualcomm.com>


