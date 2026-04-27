Return-Path: <linux-arm-msm+bounces-104836-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QPw3CQjZ72maGwEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-104836-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Apr 2026 23:45:44 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B8B147AD61
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Apr 2026 23:45:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 5C1C3306226D
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Apr 2026 21:42:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EFB063A6F11;
	Mon, 27 Apr 2026 21:42:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="SA1MYBMv";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="DVz8qp97"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6BF1639FCD2
	for <linux-arm-msm@vger.kernel.org>; Mon, 27 Apr 2026 21:42:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777326162; cv=none; b=mRK+BdKGdkpAXopu2fGhQxmI4pyCoKGCCFFIKsSw92e7umjO0A99hkSNkx2TWFo5eNAksZ6Vt7mMeouOdDRDrIWQzpdYFu0V0yI29vBWz9RaYJAL4uC6fG6w2gZXonwH7AlqaOXHafWz3COsL+fOl8m/08sWVrSHQefuw2BljsI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777326162; c=relaxed/simple;
	bh=RdFm9GylrrXXv/eeKp9jybJhFAM8XC8WDco+aM6QZOM=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=h5LSaQVMnd1Ry+l8FX3qtnVzMUjb9JtyvXYEp8s/MWWCv+a/e5ltTo5CedtgjzsvBFxp6SxwyhXlXFjwNNWX2xeLjcjYifZBwBEc11fHnTdxfQqw3MSCGiZ2IdObD5JypHdO6HSKL/WPcaDaTRNppyND6Aty0HvlIYwkiEKop6A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=SA1MYBMv; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=DVz8qp97; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63RIRPwO1237224
	for <linux-arm-msm@vger.kernel.org>; Mon, 27 Apr 2026 21:42:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=TJjHZ18GH17YGrCyaUvGtQLd/cBQ2Wd6z+S
	vG6pXlRU=; b=SA1MYBMv2oQINiSXWPiyj75cCCqKhQtibSeZsvS5Yh3gVG3xW6j
	TAg9Zac7zhqAA4cRd0onzYu2aVGfmAeBRs923zWqGoplkjaH+e0hRXonriAXukX6
	BG0YrqB6wOWMwlxQmNLz+63fOuj27Ur38P2pKC38Xl3VycLJlR60jdjJhGRY2Odn
	jifunNy2ixO32nxPAEKBIyoY5O1wt8W147Y8QejXMjiNfmlff4e7OrcyICkdWJu7
	eYCnsPlE7rr7qcCh3PFKFFp8rD5fnt3j977VGGIfmK05dqND0NMmAfQpPgv1ZxhD
	ZvuDDw+kCla/O++ATbhaSsvMKHaGq0qJH7g==
Received: from mail-dl1-f70.google.com (mail-dl1-f70.google.com [74.125.82.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dt6n4jamw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 27 Apr 2026 21:42:40 +0000 (GMT)
Received: by mail-dl1-f70.google.com with SMTP id a92af1059eb24-12dd33dc337so1168855c88.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 27 Apr 2026 14:42:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777326159; x=1777930959; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=TJjHZ18GH17YGrCyaUvGtQLd/cBQ2Wd6z+SvG6pXlRU=;
        b=DVz8qp97Toxh5mnBRiOKygUG2BvnQKEv6k7aH/asP2vDMpGsOrbzWCHg/gWANG6dd9
         frdvLlxTo2YwYMcx+8iyahqALDesksuYtvls1t2uiYXAr1qicjx801I6ZA5vLESLaqip
         J9T3qu/3AMUNQEFkhHfg0DgQm6s8LWeFV3LFMUHH7INqFw+t9UD+D96Nwbp17KsggzZo
         EIIwwBsI2j6e8Sz+wVZLkr7Gx51cmUkevAr4IBWIyOJSOSRpcoZtNSiWXGULKS37ykQE
         b77yTOGGBp+jnI7uOIeefSDGTTkaCfvXDjpoDFPh1hal6feMxMj4lDrO5xl466arrhhv
         rUIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777326159; x=1777930959;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TJjHZ18GH17YGrCyaUvGtQLd/cBQ2Wd6z+SvG6pXlRU=;
        b=lSUU4/PDPltid9cKBosqKIBiSZaN+CKC4XZ4/Ct8hP1GCjOAGRfsXECkMbCve30XoT
         +tLhkM0LuaIyzECx9HlzTW59iDdIxcNSoZRIC8/ZvpQQviM6K90xkgAp2mnFQ77uB/xQ
         AzmTvxbOeKyaq1l2+wEgsQF7dHGDGZmLk8/GRau+Qbk+raPPLQV3b/8Vifjh8KtLmujj
         hcIjxvxkvO6W5FHTUpIWPr1TvEET2cN+MxRJHFRJZCRPK47By8nv+uHYdwkEkniwPg/i
         NhH6DuYva7CoFiYuoj48/jJkrx3/mTffqo8C68Fezsi+wcEDe7wFtNTgbczvJhlRr2Yf
         jTTg==
X-Forwarded-Encrypted: i=1; AFNElJ9ne/OWkmc/mjkD4VHzYtXJUGYXmfsFCp48Xf3tXa1WwVwW381aK7svGMNVZHiy8altlZA6XEQjjkHND8lA@vger.kernel.org
X-Gm-Message-State: AOJu0YyRE2oZxSJ3Sfa+DYTO3rGaWZZLT0sI8kP6TdKYtttPzlcS+a/R
	MhgnFXhk9avl9bEmEa2efnuRd6PefZs3PLlwjfNslJH/5C0aXi6h7kubeVEUaIabaf9K59i8lTi
	L6dtydqguSjOyBGF9B74ROEJXqFwHN4S6iHhBDPEKYBvEr9viiaRGdf4RCOBX2huYKg/h4Gh5Qv
	y7
X-Gm-Gg: AeBDieu665mcmcQmGb/5mwyOy9AgBLhIitFDnxqLHwqDSo/Pp3d72HHBGA2h5cFoWmr
	aey2sQ4bVSuMcVL/ISreKf8Z+oU5ZlxYFODOa9okFczA6A2TeYXlxanKOhZuH7QrzS/jGillGUU
	ilQxDWxi50OOcqPdHwr44AMvkJStAbea8xqdi2vsQxVk6+47vQDjwf740HQn/RCdTXO4yjNB/Rw
	IHoHMVU1674YuUo49evX6ebkfshEKDN4pibgS9lqtaVEK8dUkt0jb95P0IMep3awHLTkS3ZQsDC
	X3DPflVGGUfpN6oGjyEn6J4nERCM2o2ixqAZEOOHgEdkXPLWdhsjoHCK5b8+zIH3blqCbO6Ee23
	avKuU6/oaP51t47z6bZsq6sZBpgQZyG7bvUqvJNmt4dmh8QKV5Qvzeakmxtx3+7Vv2cQuJKWHLI
	hcSFdSbwhPug==
X-Received: by 2002:a05:7022:b8c:b0:12a:6d05:3938 with SMTP id a92af1059eb24-12dddb46febmr179855c88.7.1777326158495;
        Mon, 27 Apr 2026 14:42:38 -0700 (PDT)
X-Received: by 2002:a05:7022:b8c:b0:12a:6d05:3938 with SMTP id a92af1059eb24-12dddb46febmr179836c88.7.1777326157948;
        Mon, 27 Apr 2026 14:42:37 -0700 (PDT)
Received: from hu-rraheja-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-12ddd927bbbsm653119c88.2.2026.04.27.14.42.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Apr 2026 14:42:37 -0700 (PDT)
From: Ronak Raheja <ronak.raheja@oss.qualcomm.com>
To: vkoul@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, robh@kernel.org,
        neil.armstrong@linaro.org, gregkh@linuxfoundation.org
Cc: dmitry.baryshkov@oss.qualcomm.com, konrad.dybcio@oss.qualcomm.com,
        abel.vesa@oss.qualcomm.com, wesley.cheng@oss.qualcomm.com,
        krzysztof.kozlowski@oss.qualcomm.com, ronak.raheja@oss.qualcomm.com,
        linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-usb@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v2 0/4] phy: qcom: Introduce USB support for Hawi
Date: Mon, 27 Apr 2026 14:42:13 -0700
Message-Id: <20260427214217.2735240-1-ronak.raheja@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: maTMw0x0iK1wR_gtYkBNzuIkO2FOYmJc
X-Authority-Analysis: v=2.4 cv=Xba5Co55 c=1 sm=1 tr=0 ts=69efd850 cx=c_pps
 a=SvEPeNj+VMjHSW//kvnxuw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=fySfh4wnc5TE2N7XS4QA:9 a=Kq8ClHjjuc5pcCNDwlU0:22
X-Proofpoint-GUID: maTMw0x0iK1wR_gtYkBNzuIkO2FOYmJc
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDI3MDIzMCBTYWx0ZWRfX8fn05q1AstX7
 plXS8AiREWWkRfX0Zy6Lor20KkwyWIihnsMIcy8w+/JPhCz9SCIYvDp67jVI1nD2kUgdl5YZX3q
 90PqrwgRDGuDSW/VdSJeMf8vYPvpbhFYdpCQghjSGT4JRjQcQK/wtdv7c1Or91zkJ6cG+4JNbjt
 WZ/w2p8u0msjZ4B5ZMNLiT2LY+GHgFgU4tNaJsppVWZ5n+by1vd4IAP2g5+OFyfwFusn31fwID6
 ZaMa2VotJJju1NdWFzG++go2sf52dSCt+wYGtY13qWlTKIp4+wYLVAiqk9HpdencWcVT4mP2Kfe
 +AukFEEot2BAIqgUuEBXa7rD/fIpJ6V6A5Xxs8HJiVlrcJog9Ij8BkzHWKYaA2C8je+hfdpWyzW
 ovtcZkOmKTZrBnB3hxFg2mCNg64JOzUD3JJWvnTm+XpaHzvxpmSAigOIlnqogtR2FSwyYpQFIiI
 zhsuzc5SxarUf8FLREA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-27_04,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 suspectscore=0 phishscore=0 adultscore=0
 impostorscore=0 lowpriorityscore=0 spamscore=0 clxscore=1015 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2604270230
X-Rspamd-Queue-Id: 9B8B147AD61
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	TAGGED_FROM(0.00)[bounces-104836-lists,linux-arm-msm=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ronak.raheja@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	PRECEDENCE_BULK(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns];
	TO_DN_NONE(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCPT_COUNT_TWELVE(0.00)[17];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]

This series adds USB PHY support for the Hawi SoC. It documents the
QMP USB3-DP combo PHY and M31 eUSB2 PHY bindings, adds the Hawi
compatible to the DWC3 USB binding, and adds the PHY initialization
sequences to the qmp-combo driver.

---
Changes in v2:
- Clarify in the QMP PHY binding commit message why Hawi needs a
  dedicated compatible string vs previous targets
- Remove stray blank line in hawi_usb3_rx_tbl
- Link to v1: https://lore.kernel.org/all/20260425070002.348733-1-ronak.raheja@oss.qualcomm.com/

Ronak Raheja (4):
  dt-bindings: phy: qcom,sc8280xp-qmp-usb43dp-phy: Add Hawi QMP PHY
  dt-bindings: phy: qcom,m31-eusb2-phy: Document M31 eUSB2 PHY for Hawi
  dt-bindings: usb: qcom,snps-dwc3: Add Hawi compatible
  phy: qualcomm: qmp-combo: Add support for Hawi SoC

 .../bindings/phy/qcom,m31-eusb2-phy.yaml      |   1 +
 .../phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml    |   2 +
 .../bindings/usb/qcom,snps-dwc3.yaml          |   3 +
 .../phy/qualcomm/phy-qcom-qmp-com-aon-v10.h   |  15 ++
 drivers/phy/qualcomm/phy-qcom-qmp-combo.c     | 231 +++++++++++++++++-
 .../phy/qualcomm/phy-qcom-qmp-dp-phy-v10.h    |  15 ++
 .../phy/qualcomm/phy-qcom-qmp-pcs-aon-v10.h   |  13 +
 .../phy/qualcomm/phy-qcom-qmp-pcs-usb-v10.h   |  19 ++
 drivers/phy/qualcomm/phy-qcom-qmp-pcs-v10.h   |  34 +++
 .../qualcomm/phy-qcom-qmp-qserdes-com-v10.h   |  89 +++++++
 .../qualcomm/phy-qcom-qmp-qserdes-txrx-v10.h  |  89 +++++++
 drivers/phy/qualcomm/phy-qcom-qmp.h           |   5 +
 12 files changed, 512 insertions(+), 4 deletions(-)
 create mode 100644 drivers/phy/qualcomm/phy-qcom-qmp-com-aon-v10.h
 create mode 100644 drivers/phy/qualcomm/phy-qcom-qmp-dp-phy-v10.h
 create mode 100644 drivers/phy/qualcomm/phy-qcom-qmp-pcs-aon-v10.h
 create mode 100644 drivers/phy/qualcomm/phy-qcom-qmp-pcs-usb-v10.h
 create mode 100644 drivers/phy/qualcomm/phy-qcom-qmp-pcs-v10.h
 create mode 100644 drivers/phy/qualcomm/phy-qcom-qmp-qserdes-com-v10.h
 create mode 100644 drivers/phy/qualcomm/phy-qcom-qmp-qserdes-txrx-v10.h

-- 
2.34.1


