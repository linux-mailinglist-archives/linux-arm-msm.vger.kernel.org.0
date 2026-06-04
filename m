Return-Path: <linux-arm-msm+bounces-111092-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id DJ4uKyjWIGph8QAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-111092-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 04 Jun 2026 03:34:32 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 0979E63C386
	for <lists+linux-arm-msm@lfdr.de>; Thu, 04 Jun 2026 03:34:32 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=CB76ZMtN;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=Urr2XaUJ;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-111092-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-111092-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 55AFD304929B
	for <lists+linux-arm-msm@lfdr.de>; Thu,  4 Jun 2026 01:33:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2B0D22701CB;
	Thu,  4 Jun 2026 01:33:32 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B629423C4FF
	for <linux-arm-msm@vger.kernel.org>; Thu,  4 Jun 2026 01:33:30 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780536812; cv=none; b=o68XQY/p5sNdbYuzOb7p/njCxdsRQ/sGYwXRzShPH5hGtCcItdhSYiYKraFnYs/Lxafi/DmpFzZ70b3PVQNcA+fISH7TNr8BQ+ohtFdzXAdNjqOzdepgZeVvQkGXMhoKchn36abQ/iiRAJg/f4ZEAh4N/E+TkvUnwqu9ucdADIE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780536812; c=relaxed/simple;
	bh=DOGsd2u7iW9cMvj4+PDQls+GBNWh6gWdVwXtre2Q3s8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=lYPr3NXQu1Wh6q7g4wiyLel4spI1AWcfnA/czcVC6StyrihYC9kuNw0HDRpj8fxGs/GvX2r7dAsL76FJlvjHDLdv06hUfgNgvks7CgXa6uoKVX8k2ULYB0nvFRQ2EO51uklfUhArDrZGKb89eXIBXyqhl8msGYBOO/xfH2hMeFI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=CB76ZMtN; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Urr2XaUJ; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65418pjL140569
	for <linux-arm-msm@vger.kernel.org>; Thu, 4 Jun 2026 01:33:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Qj0nAIAK4LBbELZANLlnfukG9vwKdKBxFr9Mk7W/Rt0=; b=CB76ZMtNypemFEeF
	qQ3EjQUm6YeKFBw1YhrrlI/dnadaFiXxnSPr6n51k9ZccFcqHzKVaj179IXDfJwV
	H62GkoYo+G76x5S2kXKRrDX75Ouf+G5Yx49o5zXSpk7gY1++quMuWqmbu6gdt+mQ
	YPu9l8VdInPTKVD0DFNLu7nHoKMIBkfAygJX+dPRuBuuBXwnSJgvuuct+hr5nmMp
	mYlmnhwUZH/XdlCvoU31yEpVd7Li5nbxuk+LmWD7FsONDwA4g8fOmMSxYCq3TQ4R
	tD3xERrtD6Z/9buyCV6ijhHlZDGU/YXSBdc0UCPGsC11G0CqVDMwpS9k43E3WaFB
	INI3DA==
Received: from mail-dl1-f69.google.com (mail-dl1-f69.google.com [74.125.82.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ejyen821y-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 04 Jun 2026 01:33:29 +0000 (GMT)
Received: by mail-dl1-f69.google.com with SMTP id a92af1059eb24-137ea73393cso764278c88.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 03 Jun 2026 18:33:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780536809; x=1781141609; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Qj0nAIAK4LBbELZANLlnfukG9vwKdKBxFr9Mk7W/Rt0=;
        b=Urr2XaUJeI3urfaiEe0Ls+/ifut+kJFLdpCWxXJtTGwVFdMTMET/zhcNC2bagLPSe4
         TzUzLJTc2wmCqruVeFCkykIUJvyp7/z6bayN0yS4p5e3go36ucdt9DcY+8JTaECSaeAh
         OKwbVrThN8R297E0ofNCw8h4zXWtbpT+1Sw+arUrlWXg1bUmL037/YXlMCAxS45TCH60
         FiKOOsDstwnlZIr/ZYQr29wOW6Jbwtxbq7eFf1T6spPm+02TVNX08g35A+hbcRaSLqkL
         mdlMhT5KfLLGyUqminMnDhCyu92WIVX1pMWWSXfDrH+6Cw60thqdPJTRVCXpIozGNUQk
         ZGmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780536809; x=1781141609;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Qj0nAIAK4LBbELZANLlnfukG9vwKdKBxFr9Mk7W/Rt0=;
        b=PyerMXejvcICcXY5rZlmFP/oFXuzgjA89xj7JJe4liDok8PxcJ11gx0oTxLRrc2aBo
         uc1rOeOcsD27Bp/QyGNjauvouax25uGL+brpSr/sFn6PpQ0HK13XnX2uTBuxBmKUTjZw
         cNgNPpaSZ8YlIAby/F3Wuxm5uN2zdnmwePvc0GtwKOO7+SrJx1giRoaCU1fpG5O+ZSRD
         C1QnbZbHZb+6jwCHnzpaS5IfCHaI9dSg3o1lrNSzuUPazMtSAzO8tLTwHv0q/sSGl8m1
         d/cv9ENduvqnL6g/JPSe/nvCwxCM7JqfscUxBn5Jc5XSOPAo1rXdeiyEo8ZT0aFbqWay
         xdrg==
X-Gm-Message-State: AOJu0YyFiOVKOH37FIN/1vcnmnvc5wed3EQw8MqKUIg5j9ANTqjx89KD
	yCC7VMbVhRkvjsruB3sZ9DXTut3rPLz5hLmmaKF/G67nSVGe/BzHdI8lexpyAiK2NyQa6Ia7yCD
	sY73NVgh04abXSZwL3U5ORWmcxCAE4jMHDRzTud994b5B5p0YvPFNQsez6YZj9RHaoGw5
X-Gm-Gg: Acq92OF8c/xVCjKuwpoNVUVtyEzTh3XIPZZzp5av2DrqWlLiMF2BZYTngQNvx48oxer
	G+HRNw3ruRK4wMUTTGRqvfakag8hd+XzaTjG67bMs3YfEabcbTHh/NoIwx6EQXLlyAxSHZoM/+0
	HDnDgRheMIAnwHUfkAHPmhoCSpOVxW0N4rdBUCIEU0zy/tkVEeeWwAWK+hkPfCJiAmo5IHU7FJt
	shUVAsoDG4ymnzAt95zDhao0iO1hlRbnrZFzNDGwM+3yFssGtJFL2sM8Gm/ngICs7I2jzXazylI
	A4m6z/sgaAJ7FSWUN2R9OlIbfs1KFsI/02spjgGG+yukW9gCFJlxX/lg4X979+E/PWW0TUF9s8l
	HNqrhJajAsdHxzcCCD9iU7x2BiII6qKwmw9ji87l/xmqhcGYw4LJ1oNdk86Ddw1T3r3/obQ==
X-Received: by 2002:a05:7022:628e:b0:136:ac69:b0e8 with SMTP id a92af1059eb24-137f6a4bd62mr2547958c88.15.1780536808854;
        Wed, 03 Jun 2026 18:33:28 -0700 (PDT)
X-Received: by 2002:a05:7022:628e:b0:136:ac69:b0e8 with SMTP id a92af1059eb24-137f6a4bd62mr2547943c88.15.1780536808321;
        Wed, 03 Jun 2026 18:33:28 -0700 (PDT)
Received: from [169.254.0.3] (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-137f553ab33sm2870659c88.10.2026.06.03.18.33.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Jun 2026 18:33:27 -0700 (PDT)
From: Matthew Leung <matthew.leung@oss.qualcomm.com>
Date: Thu, 04 Jun 2026 01:32:57 +0000
Subject: [PATCH v2 03/10] phy: qcom-qmp: qserdes-txrx: Add v10 register
 offsets
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260604-hawi-phy-pcie-v2-3-be908d3560db@oss.qualcomm.com>
References: <20260604-hawi-phy-pcie-v2-0-be908d3560db@oss.qualcomm.com>
In-Reply-To: <20260604-hawi-phy-pcie-v2-0-be908d3560db@oss.qualcomm.com>
To: Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Matthew Leung <matthew.leung@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1780536795; l=3118;
 i=matthew.leung@oss.qualcomm.com; s=20260428; h=from:subject:message-id;
 bh=DOGsd2u7iW9cMvj4+PDQls+GBNWh6gWdVwXtre2Q3s8=;
 b=uaYrEDNuJbbZy9J793wtPHNpQiQdsFL+8+7sd3GhytiDOXqkbqwX/4XeGigQgGY/RRggOs+s3
 b/RIKu3k9J7B4erouqkmLTG9JDw+oF9oY9EFe6UbhRWo5yu5oggdIZQ
X-Developer-Key: i=matthew.leung@oss.qualcomm.com; a=ed25519;
 pk=aT25ggJo5PMHLN9N+TsZ3s/BVU++kEYuiFebPWe21+o=
X-Authority-Analysis: v=2.4 cv=JaSMa0KV c=1 sm=1 tr=0 ts=6a20d5e9 cx=c_pps
 a=kVLUcbK0zfr7ocalXnG1qA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=A1tEKnX2-cfyyskZ8tQA:9 a=QEXdDO2ut3YA:10
 a=vr4QvYf-bLy2KjpDp97w:22
X-Proofpoint-ORIG-GUID: ef458i5Bf8lX1qTQTYJk6e5uSRInKzEZ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA0MDAxMiBTYWx0ZWRfX5fJD0cnngLYd
 pkB8vuiJmUpsQ87GRCD0zByip5SaT5uT8KHWdVXV3RzxtNWJ3YBMdkEYnqB7bxWQgdKycXJhiXT
 y65NIcLv5B+v4VjYxl6RAG3JEhKrEN/zi6O+RERDAvNMSspvOuvOXzLylhuI39cPAelf3tCx6XG
 qrGA9Pd2o8WS6JafuuVmBOswmaBnuykki0Zq4Q/BeSNQLbtagxE5ovYw6EZANf7iLeWyvGFJ4SL
 pv4Twt3IVy4WCDjO5LXIqzKB33VpJS8L/3rR3ua418apdIXse26ppGHx/m3qILTKsCWN+Nzf6HL
 l9VbIqxF2HOpe3me1TMZvdfhtU+TUVpPDrNCCKU15guXAYQkLOu0jvExsoJR1VZnHEU96IOy0IQ
 iPHkHztMw6mBlNsW0d3vRHpKNxVP/eLZSEzrkvlzUmDGUGrAQxXwTit6DccoAQWCAB/cptZtjfb
 ygTy7dutTj09gsswbDw==
X-Proofpoint-GUID: ef458i5Bf8lX1qTQTYJk6e5uSRInKzEZ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-04_01,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 bulkscore=0 adultscore=0 lowpriorityscore=0
 suspectscore=0 clxscore=1015 malwarescore=0 priorityscore=1501
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605210000
 definitions=main-2606040012
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-111092-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim];
	FORGED_RECIPIENTS(0.00)[m:vkoul@kernel.org,m:neil.armstrong@linaro.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-phy@lists.infradead.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:matthew.leung@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[matthew.leung@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[matthew.leung@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 0979E63C386

Hawi SoC bumps the HW version of QMP phy to v10 for USB and PCIe. Add
the new qserdes TX RX offsets in a dedicated header file.

Signed-off-by: Matthew Leung <matthew.leung@oss.qualcomm.com>
---
 .../phy/qualcomm/phy-qcom-qmp-qserdes-txrx-v10.h   | 47 ++++++++++++++++++++++
 drivers/phy/qualcomm/phy-qcom-qmp.h                |  1 +
 2 files changed, 48 insertions(+)

diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-qserdes-txrx-v10.h b/drivers/phy/qualcomm/phy-qcom-qmp-qserdes-txrx-v10.h
new file mode 100644
index 000000000000..d81ebdde0063
--- /dev/null
+++ b/drivers/phy/qualcomm/phy-qcom-qmp-qserdes-txrx-v10.h
@@ -0,0 +1,47 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ */
+
+#ifndef QCOM_PHY_QMP_QSERDES_TXRX_V10_H_
+#define QCOM_PHY_QMP_QSERDES_TXRX_V10_H_
+
+#define QSERDES_V10_TX_RES_CODE_LANE_OFFSET_TX			0x03c
+#define QSERDES_V10_TX_RES_CODE_LANE_OFFSET_RX			0x040
+#define QSERDES_V10_TX_LANE_MODE_1				0x084
+#define QSERDES_V10_TX_LANE_MODE_3				0x08c
+#define QSERDES_V10_TX_LANE_MODE_4				0x090
+#define QSERDES_V10_TX_LANE_MODE_5				0x094
+#define QSERDES_V10_TX_PI_QEC_CTRL				0x0e4
+
+#define QSERDES_V10_RX_UCDR_FO_GAIN				0x008
+#define QSERDES_V10_RX_UCDR_SO_GAIN				0x014
+#define QSERDES_V10_RX_UCDR_SB2_THRESH1				0x04c
+#define QSERDES_V10_RX_UCDR_SB2_THRESH2				0x050
+#define QSERDES_V10_RX_TX_ADAPT_PRE_THRESH1			0x0c4
+#define QSERDES_V10_RX_TX_ADAPT_PRE_THRESH2			0x0c8
+#define QSERDES_V10_RX_TX_ADAPT_POST_THRESH			0x0cc
+#define QSERDES_V10_RX_VGA_CAL_CNTRL2				0x0d8
+#define QSERDES_V10_RX_GM_CAL					0x0dc
+#define QSERDES_V10_RX_RX_IDAC_TSETTLE_LOW			0x0f8
+#define QSERDES_V10_RX_SIGDET_ENABLES				0x118
+#define QSERDES_V10_RX_SIGDET_CNTRL				0x11c
+#define QSERDES_V10_RX_RX_MODE_00_LOW				0x15c
+#define QSERDES_V10_RX_RX_MODE_00_HIGH				0x160
+#define QSERDES_V10_RX_RX_MODE_00_HIGH2				0x164
+#define QSERDES_V10_RX_RX_MODE_00_HIGH3				0x168
+#define QSERDES_V10_RX_RX_MODE_00_HIGH4				0x16c
+#define QSERDES_V10_RX_RX_MODE_01_LOW				0x170
+#define QSERDES_V10_RX_RX_MODE_01_HIGH				0x174
+#define QSERDES_V10_RX_RX_MODE_01_HIGH2				0x178
+#define QSERDES_V10_RX_RX_MODE_01_HIGH3				0x17c
+#define QSERDES_V10_RX_RX_MODE_01_HIGH4				0x180
+#define QSERDES_V10_RX_RX_MODE_10_LOW				0x184
+#define QSERDES_V10_RX_RX_MODE_10_HIGH				0x188
+#define QSERDES_V10_RX_RX_MODE_10_HIGH2				0x18c
+#define QSERDES_V10_RX_RX_MODE_10_HIGH3				0x190
+#define QSERDES_V10_RX_RX_MODE_10_HIGH4				0x194
+#define QSERDES_V10_RX_DFE_CTLE_POST_CAL_OFFSET			0x1a4
+#define QSERDES_V10_RX_SIGDET_CAL_TRIM				0x1f8
+
+#endif
diff --git a/drivers/phy/qualcomm/phy-qcom-qmp.h b/drivers/phy/qualcomm/phy-qcom-qmp.h
index 3ac5af7cde6a..76ac72410d31 100644
--- a/drivers/phy/qualcomm/phy-qcom-qmp.h
+++ b/drivers/phy/qualcomm/phy-qcom-qmp.h
@@ -40,6 +40,7 @@
 #include "phy-qcom-qmp-qserdes-lalb-v8.h"
 
 #include "phy-qcom-qmp-qserdes-com-v10.h"
+#include "phy-qcom-qmp-qserdes-txrx-v10.h"
 
 #include "phy-qcom-qmp-qserdes-pll.h"
 

-- 
2.34.1


