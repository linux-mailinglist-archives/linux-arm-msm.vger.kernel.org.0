Return-Path: <linux-arm-msm+bounces-106756-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YAIyDNRy/mnEqwAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-106756-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sat, 09 May 2026 01:33:40 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id CE8304FCC8D
	for <lists+linux-arm-msm@lfdr.de>; Sat, 09 May 2026 01:33:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id A58853071854
	for <lists+linux-arm-msm@lfdr.de>; Fri,  8 May 2026 23:31:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5B94A369234;
	Fri,  8 May 2026 23:31:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="U2HsJQUV";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="RLHx0KfX"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6AEC936494B
	for <linux-arm-msm@vger.kernel.org>; Fri,  8 May 2026 23:31:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778283093; cv=none; b=Xz7N4ITQNqok7E7uGFCBHd8pYGXqZpRmlZTqiio/aRervatF9XszRihALf8AK/ASrhoNThxHGzi1Qjv+iiv5X5cDpSAc4h49U+R5sALhJ1hJEsnZ3ox7+euMGqDnSTvu0fPaiJcCOx4jylJYt5Q7wY+dFEm2cK0X+iUiBQiwKB0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778283093; c=relaxed/simple;
	bh=l+CJCriIHCqSTKfqB3yNlnKfu4zi16GuU5MaRzEG1I0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Asc0qSb/3QVm1F4mT/VM9isJ+Y+1eNJ2wLetJ+652suKFjeuUqnoktyU0ZYhHZ2BsJXPgAYRCR9PiBhSpDvTY6sfQE7CfzZ9kRo+rac8HG1VWPcMIncdMom5sRS5DhSH2PH/LVzL9Hn55GZRcNu1C29qkghRSVh0TVlUI8LMevQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=U2HsJQUV; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=RLHx0KfX; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 648JdIDL4041300
	for <linux-arm-msm@vger.kernel.org>; Fri, 8 May 2026 23:31:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	HbuSh7qg+z5cv7EQdenG/3gCq/0U8ci8jC/n3KJ+wyA=; b=U2HsJQUVcvNL/6ve
	2Yr8rAZ3bxsPjYRnRlfHXCIZtuy2v5LMtU7Fo893QQY1XcPvYW3zH3d3qLsrm8Ee
	jatSjk57aLf88dWoHhKnd3Wg8Z7Eh0iVRq6qcvxFUMILDRhpRPY85K4cbpxwfR+m
	h6J2fN/XW/nXzPD3LBHzQhBSRdyz3IUunaWtyLlOS34pfJ760gcSE25BPvkXQnqE
	QjJqmqdWjpAo2MpDYXsNfBVrFee6Edr5rYwOI8Q9uSbR6CYn3MZCYuYtBnJ8T2D/
	qz0PGhKYM8VdwtABAMv4cgY9w/WXcyD7p4q+PJf92GXDnOX8u4HPH06kW/xWMjmM
	YFo7OQ==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e1p68rjb7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 08 May 2026 23:31:29 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-2f525565b33so3354367eec.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 08 May 2026 16:31:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778283088; x=1778887888; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HbuSh7qg+z5cv7EQdenG/3gCq/0U8ci8jC/n3KJ+wyA=;
        b=RLHx0KfXDIMKHBUBHtuj+K54y3zP649QZwzGgAVSQT+RqHuvTK+UwHG/52ZiuBdouY
         Dx/Us/yxKHn06hhJyhZgivE8Ye3T09V3wMZ4M/zHY0plNK4GyyjS0hDU9ysekzyqI1nm
         MOCM+t+fTe/SkLFbWqfd9kzYOSGHIaMUo5bwqagHxL8FtQFr7UMfNjglknajUnMEzrF/
         izFArLkhFog/WT5k2uTVR1iOAf5rn2pQaIYLmiqecW5O5432n4JFzcDZ3zwQ9s1Gw+VX
         ItIukpZy66K7CCjuRB+tNeyQrqeJD0bRHp7ULT/1EZ0RaVggnjyWtv7jvaObwEfIJtXE
         rLUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778283088; x=1778887888;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=HbuSh7qg+z5cv7EQdenG/3gCq/0U8ci8jC/n3KJ+wyA=;
        b=mdcnpKRQO2GWIi4SDHrPvOdc6J/gCy3A9+X5j9jSSRBSUBPKqDCTbi7Eu8xyKxUa72
         3tUx2ZqZ3RoTsLgovHZ5HAc8okReaZ4/Ej4HVy+JaOaYZBjBJSf8UXxeh67Vl4DADyVS
         fOeHN4ZNlFuLCLKwFRgfDw4fmtgEd1Wt/y6cr9k5nG5QSeGOhnYDzg6jVwXIUgb4SNNd
         V267mItVwc/rpDiM83Q+evcXlKmlJcJQXu7E+/wIgz+kg3TG5fiSBNlfBKma60Q+EuDZ
         09jme+xAqb/Q5fLYVO+U6tu6hp3boOEgdOT0hNOS2yNd8NyO5oGcHxztUoXhHvY0A8Bz
         sqpw==
X-Gm-Message-State: AOJu0YxAlXVBocf2wBRGd4mmQPY7lwfv5CWQXSOvtRinhVM67F+9rTvN
	mfjrwlwVszyaLUydgbloEErLaBh2QIeNjnrqQeh8FdbwR5XUaoM1O1vP/NQocQm7c42ACsIri2J
	eKjkZO5v1lhXnTJcoG1np0IkrYUKZmQ2v3yVdfC8BFup3qm2KWMh6S9gjpgnSb3WGF0NO
X-Gm-Gg: Acq92OGZyGzlCZLbpqwFMmrrPLfldZb5hoEEa1JNOzrzbgmft9yIGhK/gkpJ8ui5hpM
	YvXpiEyi/wu78fYjJN4Rs/sEAN3Fpu750IRi8BTav2gbsLSc+PBZpGMpMtqxDPjGCS+66yIPvRK
	MbDUqbfmsniYCaYRbSM38X17C+E+a4MH63jLWlStaeBVWSveHqQuSpNzeCUKqNZuoWuQChhc/Ca
	/EQKv9h6o0wbWmizCdVcMor24Q8Uofv3WgjTT9lfaCOYOyEnRqoGHou/EsYkgva3frHu8DjXGQp
	qt8D8z1n+7quEs5YvJLZreX+JMgm7vtWKR4kRvTo7GGNLESDGJfGpzViue7jdLIy/GgAmptUEHG
	depWOTKk7gS/fKBysd8kxOkJfvieb/6E77/CoAYBhOaC0C9/541xo4vMrtWQ=
X-Received: by 2002:a05:7300:72c8:b0:2f5:23fb:9aac with SMTP id 5a478bee46e88-2f550b4320amr7478815eec.31.1778283088384;
        Fri, 08 May 2026 16:31:28 -0700 (PDT)
X-Received: by 2002:a05:7300:72c8:b0:2f5:23fb:9aac with SMTP id 5a478bee46e88-2f550b4320amr7478799eec.31.1778283087845;
        Fri, 08 May 2026 16:31:27 -0700 (PDT)
Received: from [169.254.0.3] (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2f88885b87dsm5033122eec.21.2026.05.08.16.31.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 May 2026 16:31:27 -0700 (PDT)
From: Matthew Leung <matthew.leung@oss.qualcomm.com>
Date: Fri, 08 May 2026 23:31:21 +0000
Subject: [PATCH 06/10] phy: qcom-qmp: qserdes-com: Add v10.60 register
 offsets
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260508-hawi-phy-pcie-v1-6-237b894353fc@oss.qualcomm.com>
References: <20260508-hawi-phy-pcie-v1-0-237b894353fc@oss.qualcomm.com>
In-Reply-To: <20260508-hawi-phy-pcie-v1-0-237b894353fc@oss.qualcomm.com>
To: Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Matthew Leung <matthew.leung@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1778283082; l=3662;
 i=matthew.leung@oss.qualcomm.com; s=20260428; h=from:subject:message-id;
 bh=l+CJCriIHCqSTKfqB3yNlnKfu4zi16GuU5MaRzEG1I0=;
 b=SQPGvg0Vr7HJhUFr2y1XzSHCV/4M0ZuKpm/xAp2rbdav4FYRezMMGfW6djNo9UDc6Q1udRlzM
 wBb7DPMmy8sAgTTaPdTZx8UOt9oAOCceVxbT6skE1QgVtk14BXGR+ap
X-Developer-Key: i=matthew.leung@oss.qualcomm.com; a=ed25519;
 pk=aT25ggJo5PMHLN9N+TsZ3s/BVU++kEYuiFebPWe21+o=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA4MDIzMiBTYWx0ZWRfX9Vq3DCD2kpWh
 W5xkNl7NJX6MNQiVDZMwEIOQdv+s29SCFe2ZcJfriwF4wMVffDBI3E2YpZlb/0q+TaN5WFBNnQj
 x2bkW0EYZE2xSOQ7Va7QkYH98f0GB5/I3XHSVdQdxb4r1EV04FjvcUGVLOgu7fdw/CNSPGCZzjN
 P35t3HeHY6j2g8BWu9RKr5jrGYb5z942yVV/ylR3ciPIo977VW7M+U1ieP1u1kn5kwoHCA67kyE
 hX3HReif7eeFJgyYS/ieqeq8gW00qE49rdyft2fasl8InT7R9QgSLwp4JM/nWRS0Y6yItEWqzQy
 sRQSktXbtBrHFhdJbXJn7MArkp8QHJF0qOqKPf8ZPYeqBZLjZvvTOZQ+ilRsWQJDYEBPM5/6Vml
 m1cf3V+n69nSyTACqgX4La4ZILmdzDHALyBLs1SrSFe2rXF+XhXcvJETMUDPjED1AaHCF0kI6Mh
 aQh7s6wN+wG8xUIrHPQ==
X-Proofpoint-GUID: HBBk58DJrhuHF2cd9UHzZX5YsLSAM6L7
X-Proofpoint-ORIG-GUID: HBBk58DJrhuHF2cd9UHzZX5YsLSAM6L7
X-Authority-Analysis: v=2.4 cv=b+uCJNGx c=1 sm=1 tr=0 ts=69fe7251 cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=MN0C-abDVP1yrleAEAUA:9 a=QEXdDO2ut3YA:10
 a=6Ab_bkdmUrQuMsNx7PHu:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-07_02,2026-05-08_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 malwarescore=0 suspectscore=0 priorityscore=1501
 phishscore=0 bulkscore=0 adultscore=0 spamscore=0 clxscore=1015
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604200000
 definitions=main-2605080232
X-Rspamd-Queue-Id: CE8304FCC8D
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-106756-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[matthew.leung@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

Hawi SoC uses v10.60 register definitions for PCIe Gen4 x1. Add the new
QSERDES-COM offsets in a dedicated header file.

Signed-off-by: Matthew Leung <matthew.leung@oss.qualcomm.com>
---
 .../phy/qualcomm/phy-qcom-qmp-qserdes-com-v10_60.h | 55 ++++++++++++++++++++++
 drivers/phy/qualcomm/phy-qcom-qmp.h                |  2 +
 2 files changed, 57 insertions(+)

diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-qserdes-com-v10_60.h b/drivers/phy/qualcomm/phy-qcom-qmp-qserdes-com-v10_60.h
new file mode 100644
index 000000000000..39351bef8b63
--- /dev/null
+++ b/drivers/phy/qualcomm/phy-qcom-qmp-qserdes-com-v10_60.h
@@ -0,0 +1,55 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ */
+
+#ifndef QCOM_PHY_QMP_QSERDES_COM_V10_60_H_
+#define QCOM_PHY_QMP_QSERDES_COM_V10_60_H_
+
+/* Only for QMP V10_60 PHY - QSERDES COM registers */
+#define QSERDES_V10_60_COM_SSC_STEP_SIZE1_MODE1		0x00
+#define QSERDES_V10_60_COM_SSC_STEP_SIZE2_MODE1		0x04
+#define QSERDES_V10_60_COM_CP_CTRL_MODE1		0x10
+#define QSERDES_V10_60_COM_PLL_RCTRL_MODE1		0x14
+#define QSERDES_V10_60_COM_PLL_CCTRL_MODE1		0x18
+#define QSERDES_V10_60_COM_CORECLK_DIV_MODE1		0x1c
+#define QSERDES_V10_60_COM_LOCK_CMP1_MODE1		0x20
+#define QSERDES_V10_60_COM_LOCK_CMP2_MODE1		0x24
+#define QSERDES_V10_60_COM_DEC_START_MODE1		0x28
+#define QSERDES_V10_60_COM_DIV_FRAC_START1_MODE1	0x30
+#define QSERDES_V10_60_COM_DIV_FRAC_START2_MODE1	0x34
+#define QSERDES_V10_60_COM_DIV_FRAC_START3_MODE1	0x38
+#define QSERDES_V10_60_COM_HSCLK_SEL_1			0x3c
+#define QSERDES_V10_60_COM_SSC_STEP_SIZE1_MODE0		0x60
+#define QSERDES_V10_60_COM_SSC_STEP_SIZE2_MODE0		0x64
+#define QSERDES_V10_60_COM_CP_CTRL_MODE0		0x70
+#define QSERDES_V10_60_COM_PLL_RCTRL_MODE0		0x74
+#define QSERDES_V10_60_COM_PLL_CCTRL_MODE0		0x78
+#define QSERDES_V10_60_COM_CORECLK_DIV_MODE0		0x7c
+#define QSERDES_V10_60_COM_LOCK_CMP1_MODE0		0x80
+#define QSERDES_V10_60_COM_LOCK_CMP2_MODE0		0x84
+#define QSERDES_V10_60_COM_DEC_START_MODE0		0x88
+#define QSERDES_V10_60_COM_DIV_FRAC_START1_MODE0	0x90
+#define QSERDES_V10_60_COM_DIV_FRAC_START2_MODE0	0x94
+#define QSERDES_V10_60_COM_DIV_FRAC_START3_MODE0	0x98
+#define QSERDES_V10_60_COM_HSCLK_HS_SWITCH_SEL_1	0x9c
+#define QSERDES_V10_60_COM_BG_TIMER			0xbc
+#define QSERDES_V10_60_COM_SSC_PER1			0xcc
+#define QSERDES_V10_60_COM_SSC_PER2			0xd0
+#define QSERDES_V10_60_COM_BIAS_EN_CLKBUFLR_EN		0xdc
+#define QSERDES_V10_60_COM_CLK_ENABLE1			0xe0
+#define QSERDES_V10_60_COM_SYS_CLK_CTRL			0xe4
+#define QSERDES_V10_60_COM_PLL_IVCO			0xf4
+#define QSERDES_V10_60_COM_SYSCLK_EN_SEL		0x110
+#define QSERDES_V10_60_COM_LOCK_CMP_EN			0x120
+#define QSERDES_V10_60_COM_LOCK_CMP_CFG			0x124
+#define QSERDES_V10_60_COM_VCO_TUNE_MAP			0x140
+#define QSERDES_V10_60_COM_CLK_SELECT			0x164
+#define QSERDES_V10_60_COM_CORE_CLK_EN			0x170
+#define QSERDES_V10_60_COM_CMN_CONFIG_1			0x174
+#define QSERDES_V10_60_COM_CMN_MISC1			0x184
+#define QSERDES_V10_60_COM_CMN_MODE			0x188
+#define QSERDES_V10_60_COM_VCO_DC_LEVEL_CTRL		0x198
+#define QSERDES_V10_60_COM_PLL_SPARE_FOR_ECO		0x2b4
+
+#endif
diff --git a/drivers/phy/qualcomm/phy-qcom-qmp.h b/drivers/phy/qualcomm/phy-qcom-qmp.h
index 7af77572970e..85da2581ef90 100644
--- a/drivers/phy/qualcomm/phy-qcom-qmp.h
+++ b/drivers/phy/qualcomm/phy-qcom-qmp.h
@@ -42,6 +42,8 @@
 #include "phy-qcom-qmp-qserdes-com-v10.h"
 #include "phy-qcom-qmp-qserdes-txrx-v10.h"
 
+#include "phy-qcom-qmp-qserdes-com-v10_60.h"
+
 #include "phy-qcom-qmp-qserdes-pll.h"
 
 #include "phy-qcom-qmp-pcs-v2.h"

-- 
2.34.1


