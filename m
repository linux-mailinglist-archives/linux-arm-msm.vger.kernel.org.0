Return-Path: <linux-arm-msm+bounces-65280-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F03BB07959
	for <lists+linux-arm-msm@lfdr.de>; Wed, 16 Jul 2025 17:16:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 96A9F58334F
	for <lists+linux-arm-msm@lfdr.de>; Wed, 16 Jul 2025 15:15:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7E0531D5CFB;
	Wed, 16 Jul 2025 15:15:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="QUHsk7sR"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9342291C3B
	for <linux-arm-msm@vger.kernel.org>; Wed, 16 Jul 2025 15:15:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752678949; cv=none; b=mBuFjF+dXw+tvbIumlnz3Obu9MpZOQYI97VOBEDqMCRYYv2KycxLDHNJkygxzV2neYjh/+Hu0Wl2+svKpjukvOON7lmm7asok1h9dt1a7alRc33mxX3Uh3ptlru/ZtCNgzL2vc2Krbk2YrQz9aR7n0YmFu+zdIZSwFSJ2K/XPHc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752678949; c=relaxed/simple;
	bh=3fiJEtG0OZw7lMsiKQs4Z8Qo7rCMvsROE29oSVR+jLw=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=nUbfxLCN3ahw+FeiW1nKlpUkRsJ+wZsH8keRLq0n9PY+fwUUIF0qKXR+/u5RCz4iqbeOc72HLn2rcO3XxJomdclxUmKEx5cISFLlh41Mu6BjzX54C7nzxP/7ENXdqrdewdXR1VxmrcY51CbS0WlNHDzStbfJBTVajlOzBrmMq9w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=QUHsk7sR; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56GDC3Ji015317
	for <linux-arm-msm@vger.kernel.org>; Wed, 16 Jul 2025 15:15:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=VtVpGvVZrct32JIcBjOhQXZk+GPq1hNjUqV
	+7EdjMl0=; b=QUHsk7sR5rim9L/y3GkRbdMOhD+zJW9W9mtfQqyptdjIaHI4RMM
	M4QqcAo3xIPUJ804M7FIc41mYCNILyutNmy93flIWCurMt29wHDVnZTzD5pQKndv
	SGVWVA2uji7qR8XhdLJ+kE7HqH2ATwzVx6XQwpRfVkqM4a+CYa/M6yfA3HahbwIS
	9jvOt93xV2SH15v3PL1nPZi08yFnMHLzmAoFgNkHdlMe9jalQ9EuB3gUy9JoNL+R
	RkDdWj7EHjT1YBa7axlWL0KUohZMRTkimwbENBYWyMF3fmsjaFKpRfil92X4+VZv
	QXjIEBD4ncA5OjdlVaEAgEjyYX5uVPU7nRQ==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47w5dyqcqc-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 16 Jul 2025 15:15:45 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-235196dfc50so54385ad.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 16 Jul 2025 08:15:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752678945; x=1753283745;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VtVpGvVZrct32JIcBjOhQXZk+GPq1hNjUqV+7EdjMl0=;
        b=w7UZ6AaCEtAuma1J2R17e/rhqzC39SwrwffHLKjzD6ZxYDvdETdxf/izk9nUl3w04S
         hsTPkmu6HgmryG6yMvGWo7cSzN5SmPEbjsjs0GfUulxSsXtgIZsw/06Zm5tMmWAoQwtC
         dcaolhRcBHDAcyLAp5b+ZG9DbmWy+7X0tu5k0Cf9kaQvigbsnbo0qZ24wZw2UyTCrbA0
         cmQjwVaS4GXsAYSPWpoSjmy+MaVWrIJSpmtmTyhVkUv9NdimtrTfnd4GgJyqgD2PFDHe
         ISlE582zqd5fnbJQDRBwUH9Ea0s7wEIrsLk0LnMdUicSC6COW71POK7sjY114khhEwzi
         qUyQ==
X-Gm-Message-State: AOJu0YyLsNbGiP3O37fE1SBuuEEFZQNH0Di0sUpfx8AS+r2QZDyPny8c
	Gg8ywy+Xuweet9mNiHc/ZL2As8ToY2RkQxtdgTxBa8X6Ydddd5RyfpCt8prFr2E2M5CQlKgP0LI
	d1Z7oKLlvxYh9ZAZIOQOA/48pA8VARoReZnRRFbHSIV/HK111OATa8uH+YBAwlYLfu3vo
X-Gm-Gg: ASbGncsL0lCitl3L8GX14s+pcidnv5hpTVyHNwLtZx7N2r2m5hLfl5kJNRLSQfUUFUL
	NCNRvmo2wfjvIXWGyRFfyLtomvk8DoFGHFTGnTNuZGz3dBDDocCy9vEEng+Pj25Epfgf8cgL14o
	N9sLsXqbnF/nL6ZxifM+tkZzSh9rLXY/XNzWCogHhsNqktqXKm2nmudrHnW2/ZP5I2DPmigVP9E
	cT7SO4TvKj7oDyHpGSS769UL6JQv49JiLdhaYhD67BxTp3GWi2cwRf/HXER6ZWRxNhmoghl/Cb3
	j8x94jwxtIp5o/rIP+oNhp/FB2t7XMtEIgSWCJ2cVnZ0+86D3VBExHJ6K+PpOHWY6SUxXvkDC2M
	ex/8Dy683Dzdr+VtcL37foJZ7YKvrGgS+n8bMcHDhmlIdJgghijSFFCYXwwQg
X-Received: by 2002:a17:903:950:b0:234:5ea1:6041 with SMTP id d9443c01a7336-23e1a43e5b2mr121925115ad.10.1752678944893;
        Wed, 16 Jul 2025 08:15:44 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEx4lYicAxy/akPMh6VffbDUsZkyKqrnhemzyMQuz11i7usIVNVimaeetdH9/tTmv63a9jbew==
X-Received: by 2002:a17:903:950:b0:234:5ea1:6041 with SMTP id d9443c01a7336-23e1a43e5b2mr121924305ad.10.1752678944243;
        Wed, 16 Jul 2025 08:15:44 -0700 (PDT)
Received: from hu-pankpati-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23de42ad9efsm132769455ad.58.2025.07.16.08.15.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Jul 2025 08:15:43 -0700 (PDT)
From: Pankaj Patil <pankaj.patil@oss.qualcomm.com>
To: djakov@kernel.org, lumag@kernel.org, a39.skl@gmail.com, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org, quic_rjendra@quicinc.com,
        raviteja.laggyshetty@oss.qualcomm.com
Cc: linux-arm-msm@vger.kernel.org, linux-pm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH 0/2] Add interconnect support for Glymur SoC
Date: Wed, 16 Jul 2025 20:45:33 +0530
Message-Id: <20250716151535.4054172-1-pankaj.patil@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: g9QyloDbEeZjhIY-q42zeTYhn0N0XwJm
X-Authority-Analysis: v=2.4 cv=RtXFLDmK c=1 sm=1 tr=0 ts=6877c221 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=Wb1JkmetP80A:10 a=kNru7P6y79U7mb-8zXEA:9 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzE2MDEzOCBTYWx0ZWRfX5tO3dYlqNJHK
 sRx4Zj9h3EbTvyCH5X1yK+WQFjqAXDlLdhWUDaHVGul8ev3dHKjNWblbrxh30AAWlfbBA1dJ5bG
 v/qR+9/jleme2J/Dn2+wXOT1WFmWxoHcYukOUKnBT+PbmjEZBzaOZqcmwp7UHyAnVvturiLJj/o
 abhgK2+aL8sWbDqU0n3J6w3wZ15kREP9taMdvr4is0CNeoUHxcHHmlVhZDRVkUrb35yKm1vElAK
 AhYDuIHGTu3epqUnRdeM+wJoNt1WqN/9mjE+s9DBmjWZ0ENltgb13Pyr5u9wEjouFEGOvDvfivY
 T+cNpH9/9fKfGcYPNvCl4alid66LRU4WpwZZ/xWWRsYI7eRG9OdCr+j5a0CEMh8jyX3TdOvZpM8
 CtpDg3djQaJjHVe4SQPauqb3KV4bzdFr+AV3BFyS2NgObWutA8cJCA6EJdLNWy7lS3rqI7GC
X-Proofpoint-GUID: g9QyloDbEeZjhIY-q42zeTYhn0N0XwJm
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-16_02,2025-07-16_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 mlxscore=0 bulkscore=0 suspectscore=0 lowpriorityscore=0
 impostorscore=0 malwarescore=0 clxscore=1011 mlxlogscore=915
 priorityscore=1501 phishscore=0 spamscore=0 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2507160138

Add interconnect dt-bindings and driver support for Qualcomm Glymur SoC.

Raviteja Laggyshetty (2):
  dt-bindings: interconnect: document the RPMh Network-On-Chip
    interconnect in Glymur SoC
  interconnect: qcom: add glymur interconnect provider driver

 .../interconnect/qcom,glymur-rpmh.yaml        |   84 +
 drivers/interconnect/qcom/Kconfig             |    9 +
 drivers/interconnect/qcom/Makefile            |    2 +
 drivers/interconnect/qcom/glymur.c            | 2259 +++++++++++++++++
 drivers/interconnect/qcom/glymur.h            |  185 ++
 .../interconnect/qcom,glymur-rpmh.h           |  205 ++
 6 files changed, 2744 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/interconnect/qcom,glymur-rpmh.yaml
 create mode 100644 drivers/interconnect/qcom/glymur.c
 create mode 100644 drivers/interconnect/qcom/glymur.h
 create mode 100644 include/dt-bindings/interconnect/qcom,glymur-rpmh.h

-- 
2.34.1


