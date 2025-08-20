Return-Path: <linux-arm-msm+bounces-69924-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 46347B2D8DF
	for <lists+linux-arm-msm@lfdr.de>; Wed, 20 Aug 2025 11:45:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 08EF31C47814
	for <lists+linux-arm-msm@lfdr.de>; Wed, 20 Aug 2025 09:37:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0B86818991E;
	Wed, 20 Aug 2025 09:35:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="lS6/+gLg"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68BDE27877B
	for <linux-arm-msm@vger.kernel.org>; Wed, 20 Aug 2025 09:35:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755682533; cv=none; b=WgywXhWuD0CFcOJwjWFfXi20WFAK2/yDTbqmktIkvREXxt3i06cD6TP+2yiyAN7F13Tf2UxWsvteJHlNcYLmJGXHk5OdvollGcHIh3Ccvtyow986Z0GvNe/JZraLAj4N7sP8ZDF+Bb4+2ltnH2NZN2xCj4f8aGVNMZ0/OowGDuQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755682533; c=relaxed/simple;
	bh=zUh1szy7KTdYK9/oS/fJJKLcM6Fi75L1xDm/pFLliWg=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=LCfPnXFyvR/qs+L8yNV4ZWhJSCRcR2MBT+W3R6grqLIGOKUGMRm52LgkDLSN7SrLOC4WOzKG85jM4kJnbRSTJcDm8arRtigg5ZMLgGUhzDiTU0bYQfFE5yfH6c5ce4vqH6SWnVyiE8RUIybXg69CnMlzas4i3gbtV2J3Hjw62Kc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=lS6/+gLg; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57K1oeEd025306
	for <linux-arm-msm@vger.kernel.org>; Wed, 20 Aug 2025 09:35:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=I4X0zxCuPGuD7zZ5V2a6EO
	SgLaDvK+Bop09VatFyBrA=; b=lS6/+gLgKeyBONPR4Zcli+rJT16dHjVlH93RQW
	NE449wKkmlPBpuvLhRsmQDFm9YulVqZiSkpQRSZqN8eivfTlrXIh9tXJbY6Uw20U
	0sy1devP6IWJTKm6Fkrb1bnpztWFNW7sBwhsDReWAkELMv/qanhTlVxZQNnYNU5d
	bLO4wbf0DUhgOkb5KXcr9hI4gvtv6dj8VVknzSd4KyXQ7E0I0vQFyzhZfvHnMBjC
	6ONksFoxNe32bPNawrRgj7EqZiRHH0vPQtnfu1hghKnDQTAjSwhNzPtdBqpIGyps
	hjLzDMwYf3KPEdblHBKT4UHrUofJxK+KlhoTrB2/5PogsqdQ==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48n52a97v2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 20 Aug 2025 09:35:31 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-244581cbf91so9363015ad.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 20 Aug 2025 02:35:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755682531; x=1756287331;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=I4X0zxCuPGuD7zZ5V2a6EOSgLaDvK+Bop09VatFyBrA=;
        b=jDb8GfGbTNje40xNvLNFd5+APnIAtetWvF+G7cR6PtJyYSmbbKB7o7SB/lQfRW8/Yv
         Rv2Wgu6SyWM9LNy849+E8L0Rm+o9DcVtXoSFkR8wA6PlmbpEnmGo3VZkF1T63xcW0t3B
         0g4ENqIlx9YiQXvzR3ANKHDgKSsETmfA81EiJjxxoscvcza8a4qP7J0z5BygqM8xXxzC
         e/z89+XNJ+21N+28LweaFG+LExPpXjvCuVRp7MnM8IBGHTVnov4/y469rhB0CsJPUVGh
         f/xjNFDL352RPC45Lwh+gvPob/1K3IHt7ugji39KP2pLDGRGYTIQVR3rU+yd8F0u1E3Q
         6Y5g==
X-Gm-Message-State: AOJu0YxtQO01UROH6vtpNz0N6GyyKV0NZR5vtkFisc4q7mU5WyyxNWYd
	XiuUZVmUosku7IfdmLdrUixE8B+gYhHtsVNzdNxaQnXKI+k7ovt2KLCLfYAtFToMGZhiJvnB96f
	i5LEggwIXZSIE5VWJWV1MsGsKphM7Dz2ZkWZ6VY+6olr2ohdPIDJfWc8frgzBTIEUovTJ
X-Gm-Gg: ASbGncvbXwYV1dXRwXSlL8oDfHES5c1ELrOdc8lVZHaLzlJXljh/jDjhk81+gP5laY3
	yQxd0/J2tskacGMaZr6HQDZkaFOR8W2Dyk18BXDl8ND/HHOHjq7uYqP0QBNaDnuHnkB+rtdwBaF
	pic319WQQcpeQAcVBx3fQbms2b5ApadWGxZ5WnCA79o4A6agUEXrWDWWQrtxMocLXMPcDYhsCLv
	Sc1M5oivpndFLjiKseiwfCP9i6QcvQDlYWlxcHvSAZ3hERSZL16uISpJW9Apw1YffWkYt0BpdQ1
	rLYuhTPAiz11xCb/7lpfmHIv853qMYNyzZOMnVxpdZr8jO8pv+2Tegx9hb/8MsDiFO2xFGdzL17
	d1FK7EMFKwRWbO45LigsmjV35e+AZzMmKYscKk7LU6FQMGF9jTYLMp6HT
X-Received: by 2002:a17:902:d509:b0:240:58a7:892f with SMTP id d9443c01a7336-245ef16f680mr14993055ad.5.1755682530549;
        Wed, 20 Aug 2025 02:35:30 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGr0NVkQfXcCIKCjD1fxDIFyfCk8rIWZqpRUI9U3M16bnnc9L9TWNuM7EAKKRr45/Jvuk5CLg==
X-Received: by 2002:a17:902:d509:b0:240:58a7:892f with SMTP id d9443c01a7336-245ef16f680mr14992845ad.5.1755682530073;
        Wed, 20 Aug 2025 02:35:30 -0700 (PDT)
Received: from sziotdisp01-gv.qualcomm.com.ap.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-245ed4ec100sm20954305ad.116.2025.08.20.02.35.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 Aug 2025 02:35:29 -0700 (PDT)
From: Xiangxu Yin <xiangxu.yin@oss.qualcomm.com>
Subject: [PATCH v3 00/14] Add DisplayPort support for QCS615 platform
Date: Wed, 20 Aug 2025 17:34:42 +0800
Message-Id: <20250820-add-displayport-support-for-qcs615-platform-v3-0-a43bd25ec39c@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIALSWpWgC/5WNQW6DMBBFrxJ53YnGY1Mgq9yj6sK1h2akgMEG1
 Cji7jVUPUBWozdfeu+pMifhrC6np0q8SpY4FDBvJ+VvbvhmkFBYEVKFDSG4ECBIHu/uMcY0Q17
 G43YxweTzu66gbHPBHpq2YusY2WhUxTgm7uTnqH18Fr5JnmN6HPFV79+9Y7Wm9qXOqgEBW2eNa
 UJruLtOi3gZ/NnHXu2llf7tFdZEr9mp2C19WTS1rnXXXGPO52lx92Lv/xLbtv0CyWq1b0sBAAA
 =
X-Change-ID: 20250820-add-displayport-support-for-qcs615-platform-895e4ae0e310
To: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
        Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Kuogee Hsieh <quic_khsieh@quicinc.com>, Vinod Koul <vkoul@kernel.org>,
        Kishon Vijay Abraham I <kishon@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org,
        fange.zhang@oss.qualcomm.com, yongxing.mou@oss.qualcomm.com,
        tingwei.zhang@oss.qualcomm.com, Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        quic_lliu6@quicinc.com, Xiangxu Yin <xiangxu.yin@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1755682519; l=3563;
 i=xiangxu.yin@oss.qualcomm.com; s=20241125; h=from:subject:message-id;
 bh=zUh1szy7KTdYK9/oS/fJJKLcM6Fi75L1xDm/pFLliWg=;
 b=DBrrepe3Z1uwwfZQewXsSbAeEsU3FWGv8qkYIgvmhcN27WRoGUvuRKh5M1LpGMgpJVcNg4gR0
 IdMokpxlMG7DDeENu/ectt/wC6NDmrjE59IITa4sfdSnlcHUGo1+8Ck
X-Developer-Key: i=xiangxu.yin@oss.qualcomm.com; a=ed25519;
 pk=F1TwipJzpywfbt3n/RPi4l/A4AVF+QC89XzCHgZYaOc=
X-Proofpoint-ORIG-GUID: koQVNSMyFrL6RYyO1uMrL_IjyFbDduqB
X-Authority-Analysis: v=2.4 cv=B83gEOtM c=1 sm=1 tr=0 ts=68a596e3 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=COk6AnOGAAAA:8 a=ROZvIIAdAcjLDz1xLgoA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=GvdueXVYPmCkWapjIL-Q:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: koQVNSMyFrL6RYyO1uMrL_IjyFbDduqB
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODIwMDAxMyBTYWx0ZWRfX/ayemq45+57L
 MMJQvCTjqh0x8phG0jmloXixSTTF5n9leGRfHwO3GYhjsUc8HEJ5NlaXiTBCdybWeT6+cFK06FV
 J/ouO0URsve4qWa0fpdlkckWtBxk808uJZGyrWVw8uw0YVFyx5AfJI8cwTJNvI5FzDUH8wgn5bT
 eCG4eo7rvLfOJOE0jrjBjiQ7aYw38zSwiryaI0083dWbKzpn2VnOQ08SkOgQRFCoRI32pSjfxvL
 4S88DyaKW0jOmORkkSAc+apv5Nk9XJDjfhVMzoHnNQiexIFfB3afValolpw5AxrhiFgm9442P1E
 1GSrRS0h6PtY6d3zTsUM9w09kKZM+ZVGtK9ZD9qsd5zoEbeNIXZvcBSRN9ZggH0m/hdQ061ypzs
 LqEzsot/fgJe+l/eqPPuEZ/hHpB43A==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-20_03,2025-08-20_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 bulkscore=0 priorityscore=1501 suspectscore=0 malwarescore=0
 lowpriorityscore=0 adultscore=0 impostorscore=0 clxscore=1015 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2508110000 definitions=main-2508200013

This series aims to extend the USB-C PHY to support DP mode and enable
DisplayPort on the Qualcomm QCS615 platform.

The devicetree modification for DisplayPort on QCS615 will be provided
in a future patch.

Signed-off-by: Xiangxu Yin <xiangxu.yin@oss.qualcomm.com>
---
Changes in v3:

- Renamed qcom,qcs615-qmp-dp-phy.yaml in v2 to qcom,qcs615-qmp-dp-phy.yaml in v3 for QCS615 USB3+DP PHY.
- Updated patch [v3,02/14] to revise binding title, description, and property order. [Krzysztof]
- Updated commit messages in patch [v3,01/14] and [v3,13/14] to reflect the DTSI rename and clarify compatibility. [Krzysztof]
- Added USB3+DP mode implementation in patches [v3,003–012], organized in logical chunks. [Dmitry]
- Dropped patch [v2,03/13] to maintain full backward compatibility with USBC.
- Link to v2: https://lore.kernel.org/all/20250722-add-displayport-support-for-qcs615-platform-v2-0-42b4037171f8@oss.qualcomm.com/

Changes in v2:

- Add new binding qcom,qcs615-qmp-dp-phy.yaml for QCS615 standalone DP
- Split DP PHY driver into patches 4-11 by logical chunks [Dmitry]
- Update DP PHY configuration flow to align with QMP Combo PHY implementation [Dmitry]
- Update all hex values to lowercase [Dmitry]
- Remove redundant comments in DP PHY driver [Krzysztof]
- Remove invalid USBC type define [Dmitry]
- Move lane_map, max_dp_lanes, max_dp_link_rate parsing logic to dp_link [Dmitry]
- Add TCSR-based mutex logic for DP and USB PHY coexistence [Dmitry]
- Drop patches 6–8 and remove related binding properties as rejected upstream
- Link to v1: https://lore.kernel.org/all/20241129-add-displayport-support-for-qcs615-platform-v1-0-09a4338d93ef@quicinc.com/

---
Xiangxu Yin (14):
      dt-bindings: display/msm: dp-controller: Add sm6150
      dt-bindings: phy: Add QMP USB3+DP PHY for QCS615
      phy: qcom: qmp-usbc: Rename USB-specific ops to prepare for DP support
      phy: qcom: qmp-usbc: Add USBC PHY type enum
      phy: qcom: qmp-usbc: Add DP-related fields for USB/DP switchable PHY
      phy: qcom: qmp-usbc: Add QCS615 DP PHY configuration and init data
      phy: qcom: qmp-usbc: Move reset and regulator config into PHY cfg
      phy: qcom: qmp-usbc: Add DP PHY configuration support for QCS615
      phy: qcom: qmp-usbc: Add DP PHY ops for USB/DP switchable Type-C PHYs
      phy: qcom: qmp-usbc: Add TCSR parsing and USB/DP mode mutex handling
      phy: qcom: qmp-usbc: Finalize USB/DP switchable PHY support
      phy: qcom: qmp-usbc: Add QCS615 DP PHY compatible
      drm/msm/dp: Add DisplayPort support for sm6150
      drm/msm/dp: Add support for lane mapping configuration

 .../bindings/display/msm/dp-controller.yaml        |    1 +
 .../bindings/phy/qcom,qcs615-qmp-usb3dp-phy.yaml   |  108 ++
 drivers/gpu/drm/msm/dp/dp_ctrl.c                   |   10 +-
 drivers/gpu/drm/msm/dp/dp_display.c                |    1 +
 drivers/gpu/drm/msm/dp/dp_link.c                   |   71 ++
 drivers/gpu/drm/msm/dp/dp_link.h                   |    5 +
 drivers/gpu/drm/msm/dp/dp_panel.c                  |   78 +-
 drivers/gpu/drm/msm/dp/dp_panel.h                  |    3 -
 drivers/phy/qualcomm/phy-qcom-qmp-dp-phy.h         |    1 +
 drivers/phy/qualcomm/phy-qcom-qmp-usbc.c           | 1165 +++++++++++++++++---
 10 files changed, 1234 insertions(+), 209 deletions(-)
---
base-commit: 958469723b0df2a5efa229f9c4464c8962c35baf
change-id: 20250820-add-displayport-support-for-qcs615-platform-895e4ae0e310

Best regards,
-- 
Xiangxu Yin <xiangxu.yin@oss.qualcomm.com>


