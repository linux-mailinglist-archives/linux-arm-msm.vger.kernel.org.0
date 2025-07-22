Return-Path: <linux-arm-msm+bounces-65993-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DEE6EB0D2B5
	for <lists+linux-arm-msm@lfdr.de>; Tue, 22 Jul 2025 09:23:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E0E9C560163
	for <lists+linux-arm-msm@lfdr.de>; Tue, 22 Jul 2025 07:22:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E11A52BEFF0;
	Tue, 22 Jul 2025 07:22:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="p2gTVgHJ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44BED2882BB
	for <linux-arm-msm@vger.kernel.org>; Tue, 22 Jul 2025 07:22:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753168949; cv=none; b=n0hE7/jFKpiBOQdGSj6spp6zaI2PypLljHYvwcRdD+kpjOji2AAFct8wZgN6v9n82C0Cgfa2muoCZBqBdstuZohfn4nbaj4YuTW2sDtfO7n5roCjnp8RsXl2ylcik9xf45UjjvkjdOsFE6u/Rm8qGFzaWESO/ZxWULK0s3du9zA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753168949; c=relaxed/simple;
	bh=j6byM6mQFWNoIMiAy5TxrSVRDC8viNz/BdGaO3ECzk0=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=mPn+fIsX0xO4bVoQx2nRNF9ScUgZdl3jlzQcS1Dk7IE0TYpR58TBksClvgv9VYrhKwgOvjtSbrCy3slE5x/Z8HZG/waKKolsq/G8u31FbOo0OhKJWUZDzFa/jJoZGyOfg12mn1EHmeSSZ+uufNgmE49ulE8Fumeli4dEePXTXb8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=p2gTVgHJ; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56M1E5eL006230
	for <linux-arm-msm@vger.kernel.org>; Tue, 22 Jul 2025 07:22:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=gpJoZHcyQpYbDfacgmuG1Z
	OCeDG5rolbgOKq0QUy07I=; b=p2gTVgHJXRjDWGfJx3RwFXI6wF4ThOqD69ykb3
	me0obnJUeqo29BRQ4nWhkcBV4lbPuCq6MXqvsWdc2iWf5a3GYUi2YhS03gsf9sbw
	j0pp4i8tlB+EX2pzfsmPuV40ocy/fIO4dZ8rMktttwZE0nHnDBSqt3cUsyw3KQj4
	nMDr9RTgN0AB7zQYAwiGBWXzlAXQUzH0yjstEzNR3Cd5F+4mhD0lZanfqmZoguIt
	9HQJprslWeu0UNFCNsbB375icZMo4/xNW4ROdBQ5bhHf6C10iSCkw3rO1yRUuW9Y
	cm6QodoQFht2qPcXER2SqS120CYLG/VZpBtIqmVqBkNGc8+g==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48047q8h5p-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 22 Jul 2025 07:22:26 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-3132c0c961cso1553265a91.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 22 Jul 2025 00:22:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753168946; x=1753773746;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gpJoZHcyQpYbDfacgmuG1ZOCeDG5rolbgOKq0QUy07I=;
        b=KBjZE68Aq9/bvqKgJ4GPYOXtAKhvVr0D/61lfCID7pYvVrArH2QeBGO5S5M/sojBQe
         5lu8nQuEYzGwK3VIPcsAO/Vr/STXAAZ/yccb3aiZ7Xgmu4+d+N55e1R5ZsRGyjkSuVdc
         mf9X3kmHdAQksljzujjm0pojQwGuLvGWJiTBhD6DGi99fzE1GK0t/T8xcJr9CjjciCrH
         2iSUleg6KWQ2VbjPqX8WMDWENElukEwlRmBzZGpAeWaR4mIK9QL3uua0rYICi41ATWy1
         yK3dSo68YWRae4UUKA2rIIe3HL7s0vKVgs6no5Zlq5R6GoP8tHjgY2dE3JYn2zTKI7kK
         OQmg==
X-Gm-Message-State: AOJu0Yw7G73aIdI5xkEI+BvjTq5t0axm0KjTkLVCRwWZL7tZ2wt4bqQF
	Y46LRw98WMOrR20zjz+ZGSgm+BHIxJcrSFg71Mp5zKAR871bJHTdfM9KPjlZIRciWCAY52YMpRL
	Ta9rGIeWb2HwpTIAKTSkMkLaSk9FJDFNgg7q5DGWdWiG95uA0FXgNhHvpA0LmPin7vAoA
X-Gm-Gg: ASbGncsv+tRi2mlI4/3gql3hfwJQnxRr43a+4BTQ1soAajEDxMJa62r+9q+hYrS2PJF
	b1V8o+Dj5cRZOL4eMqOawkKl+5mhrshIlkwUJV5TZqu21SkryWKr+hv8pvwVrGw3v8cAFGRawcY
	k8tcoocsik+iyXF3lDCCnTXYQXXwm6kECK0eC7YQkgRzRPQiHa0YWb6pGcbFnZTvjdpqNEnaKKj
	iypnFCTAVe4u/wAwzPhdzgMERA1U5yXjbiqoqmuZ6tk3kgq4PgVu++e1JNWwz+zMC4kmYgGrgGX
	YTUanyizJd0rKXMN9u8DzfYke9V+NiY3hgv6j595TBsQNuC6QcNlSQgmEBOV7E2bVRarojMQmXY
	RnKe9qZzkx3OOCViMzp1dZ+Yz9hEqoNzp8ofU7mAqZX020N6hH2Jj7bMz
X-Received: by 2002:a17:90b:3f8d:b0:311:c939:c842 with SMTP id 98e67ed59e1d1-31c9e7a4012mr13684970a91.7.1753168945536;
        Tue, 22 Jul 2025 00:22:25 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFNu5XNjC9N7LggT70nJqL7zjLR3AcsqyEnguxqP02Q/pBp2syZy3iYCoyam6QqSrFIAmJ8aA==
X-Received: by 2002:a17:90b:3f8d:b0:311:c939:c842 with SMTP id 98e67ed59e1d1-31c9e7a4012mr13684928a91.7.1753168944987;
        Tue, 22 Jul 2025 00:22:24 -0700 (PDT)
Received: from sziotdisp01-gv.qualcomm.com.ap.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-31cc3e45e6csm7490753a91.3.2025.07.22.00.22.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Jul 2025 00:22:24 -0700 (PDT)
From: Xiangxu Yin <xiangxu.yin@oss.qualcomm.com>
Subject: [PATCH v2 00/13] Add DisplayPort support for QCS615 platform
Date: Tue, 22 Jul 2025 15:22:01 +0800
Message-Id: <20250722-add-displayport-support-for-qcs615-platform-v2-0-42b4037171f8@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIABo8f2gC/5WNQQ6CMBBFr0K6dkynUBFX3sOwIO0gkwgtLRAJ4
 e4WbuDq5/2f/LeJSIEpike2iUALR3ZDAnXJhOma4U3ANrFQUmlZKoTGWrAc/adZvQsTxNmf2bo
 Ao4k31JC2KWEP1mhDpJXCEkV69IFa/p62V5244zi5sJ7yBY/28BSIqvrLsyBIkFVT5PndVjm1z
 3Fmw4O5GteLet/3H8DNPcjoAAAA
X-Change-ID: 20250721-add-displayport-support-for-qcs615-platform-dc5cee522171
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
        Kishon Vijay Abraham I <kishon@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org,
        dmitry.baryshkov@oss.qualcomm.com, konrad.dybcio@oss.qualcomm.com,
        fange.zhang@oss.qualcomm.com, quic_lliu6@quicinc.com,
        quic_yongmou@quicinc.com, Xiangxu Yin <xiangxu.yin@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1753168936; l=2923;
 i=xiangxu.yin@oss.qualcomm.com; s=20241125; h=from:subject:message-id;
 bh=j6byM6mQFWNoIMiAy5TxrSVRDC8viNz/BdGaO3ECzk0=;
 b=vnJictkXtk+9QtUeMBGykCyh1QwvmsfqkvGVQTYRgXCIilV2YYr+1MsDMAbpFqSfdeEXR6COw
 bhTEEt+S5EqBB/giQEMmWBmzrA0irPIoMjvRo+qICQxEQedfAsV+Squ
X-Developer-Key: i=xiangxu.yin@oss.qualcomm.com; a=ed25519;
 pk=F1TwipJzpywfbt3n/RPi4l/A4AVF+QC89XzCHgZYaOc=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzIyMDA1OSBTYWx0ZWRfX8qTT+3fKKgAh
 gK1hDmNi5zmeHW1nqz767w1qlo4Bh3B9OM+ajwIQk13bDNb00eW0m0tul/bD4MpkU8A+HBsls4+
 7wRCyQPegvp4mQMGtaQkqW37DvBXXiMPREgLvdwOCksgGBu7uYbycIWa2HnU8r3R8V3Ah5SOe98
 wgvuVdODN85lCu3L/QuK4eoyzB9alctagFYKRa9ohDe00xtWL837GhUZJm98UOKJ2u/S+61Ix98
 5Tg7362V2h+sLVaO4D7byke4lg7U5JoaG97E6JKVPMjiMWPv1r00uk1zum7aQY/yRJNqznayeJo
 QW1NJFIxw+j3jrqEtWrK7uczeIvHC5HAb+AtZhog01llAicW9nF+GlvzF/OiqOdYtycdReD36r+
 IkcCynurbfYBQ1mb3C2k0LddIH5pOFGt4jFqq2EV5M77t19Pya+J4OzeLkA4+1XWegNI4Sws
X-Proofpoint-ORIG-GUID: RpOD0-Sp0BuTEFn0QtnI1KN14uzkPf5v
X-Proofpoint-GUID: RpOD0-Sp0BuTEFn0QtnI1KN14uzkPf5v
X-Authority-Analysis: v=2.4 cv=IrMecK/g c=1 sm=1 tr=0 ts=687f3c32 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=VwQbUJbxAAAA:8 a=COk6AnOGAAAA:8
 a=EUspDBNiAAAA:8 a=KbB9N7STWnmORTLZSFQA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-22_01,2025-07-21_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 lowpriorityscore=0 malwarescore=0 adultscore=0 clxscore=1015
 priorityscore=1501 spamscore=0 mlxscore=0 mlxlogscore=999 phishscore=0
 impostorscore=0 bulkscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507220059

This series aims to extend the USB-C PHY to support DP mode and enable
DisplayPort on the Qualcomm QCS615 platform.

The devicetree modification for DisplayPort on QCS615 will be provided
in a future patch.

Signed-off-by: Xiangxu Yin <xiangxu.yin@oss.qualcomm.com>
---
Changes in v2:

- Add new binding qcom,qcs615-qmp-dp-phy.yaml for QCS615 standalone DP [Krzysztof]
- Split DP PHY driver into patches 4-11 by logical chunks [Dmitry][Krzysztof]
- Update DP PHY configuration flow to align with QMP Combo PHY implementation [Dmitry]
- Update all hex values to lowercase [Dmitry]
- Remove redundant comments in DP PHY driver [Krzysztof]
- Remove invalid USBC type define [Dmitry]
- Move lane_map， max_dp_lanes， max_dp_link_rate parsing logic to dp_link [Dmitry]
- Add TCSR-based mutex logic for DP and USB PHY coexistence [Dmitry]
- Drop patches 6–8 and remove related binding properties as rejected upstream
- Link to v1:
  https://lore.kernel.org/all/20241129-add-displayport-support-for-qcs615-platform-v1-0-09a4338d93ef@quicinc.com/
---

---
Xiangxu Yin (13):
      dt-bindings: display/msm: Document DP on QCS615
      dt-bindings: phy: Add binding for QCS615 standalone QMP DP PHY
      dt-bindings: phy: qcom,msm8998-qmp-usb3-phy: support dual TCSR registers
      phy: qcom: qmp-usbc: Rename USB structs and reorganize layout
      phy: qcom: qmp-usbc: Introduce PHY type enum for USB/DP support
      phy: qcom: qmp-usbc: Add DP PHY struct definitions
      phy: qcom: qmp-usbc: Add QCS615 DP PHY configuration and init data
      phy: qcom: qmp-usbc: Implement DP PHY bring-up flow for QCS615
      phy: qcom: qmp-usbc: Wire up DP PHY ops and flow for QCS615
      phy: qcom: qmp-usbc: Track PHYs for standalone DP/USB3.0 handling
      phy: qcom: qmp-usbc: Add QCS615 DP PHY compatible
      drm/msm/dp: Add DisplayPort support for QCS615
      drm/msm/dp: Add support for lane mapping configuration

 .../bindings/display/msm/dp-controller.yaml        |    1 +
 .../bindings/phy/qcom,msm8998-qmp-usb3-phy.yaml    |   28 +-
 .../bindings/phy/qcom,qcs615-qmp-dp-phy.yaml       |  111 ++
 drivers/gpu/drm/msm/dp/dp_ctrl.c                   |   10 +-
 drivers/gpu/drm/msm/dp/dp_display.c                |    1 +
 drivers/gpu/drm/msm/dp/dp_link.c                   |   71 +
 drivers/gpu/drm/msm/dp/dp_link.h                   |    5 +
 drivers/gpu/drm/msm/dp/dp_panel.c                  |   78 +-
 drivers/gpu/drm/msm/dp/dp_panel.h                  |    3 -
 drivers/phy/qualcomm/phy-qcom-qmp-dp-phy.h         |    1 +
 drivers/phy/qualcomm/phy-qcom-qmp-usbc.c           | 1466 +++++++++++++++++---
 11 files changed, 1503 insertions(+), 272 deletions(-)
---
base-commit: d086c886ceb9f59dea6c3a9dae7eb89e780a20c9
change-id: 20250721-add-displayport-support-for-qcs615-platform-dc5cee522171

Best regards,
-- 
Xiangxu Yin <xiangxu.yin@oss.qualcomm.com>


