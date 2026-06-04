Return-Path: <linux-arm-msm+bounces-111095-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id IcOPH6PWIGpy8QAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-111095-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 04 Jun 2026 03:36:35 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id D658863C3AD
	for <lists+linux-arm-msm@lfdr.de>; Thu, 04 Jun 2026 03:36:34 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=UlsFzu5u;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=jfeh5nYz;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-111095-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-111095-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id D0D203091F2A
	for <lists+linux-arm-msm@lfdr.de>; Thu,  4 Jun 2026 01:33:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3726427B340;
	Thu,  4 Jun 2026 01:33:39 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4526C233931
	for <linux-arm-msm@vger.kernel.org>; Thu,  4 Jun 2026 01:33:37 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780536819; cv=none; b=P15UFt5ZuuYU/7iCfHfsCb6IbgLi7Z1BnCweRU2ptvsiyKXHeSSblJy2XQVikSOulK+xqjcOEli2ujOZ/wGjkaVO9r7HeigK1SxZ1dZYMXEJg9o0wx0ldPbvn35Y1ImTO75g2vbL7akHh0kdp+lcDScENNtd2jORFZNAaMp4Xx0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780536819; c=relaxed/simple;
	bh=2ILPtmC6htJwupXVcqBNOJFTUtBdC7zGearGnbGCWow=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=WTcQv3ijLHVQPLpStVeNpGg80SJxh5JywtlAG6Q0F10NyzJUQcEjTlJR98j6g/xaxfLhgFyFROIIHIDJnGsI7LhS6+bl8yleONYaMI030czCmUXiFyZoQalSWRtV2TpjpfN2MJyfI8R8PXqMox3kiuLblQAAQLqvwl/nlxRax3A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=UlsFzu5u; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=jfeh5nYz; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 653H7W9w2368054
	for <linux-arm-msm@vger.kernel.org>; Thu, 4 Jun 2026 01:33:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	z2jDYFyWFwiBr8ROyqOwhRj8gSALzKVWOWbM241VcAk=; b=UlsFzu5uCmmAOuY5
	n+UNODU7rmR2+lk0CFS+M5gtZMOnvhOxMh+4eZbfPwGN3UmVTTwwAdb1oN+Jvppu
	2lNxn4PDrTRWl0IJVTtHSel8cuTZ3pX3RbH5EVqNo1h7gbNILkK7plRHOcfTLkgH
	kvC9Sj9KNQp22M4opri/thq0UvrcmffZruOA0oTmzh4TpjVWVMx9iy31Asre/Qk4
	zjuvjWjZxZeKuMWTScFCxmVuTdTtzaqWMzsErWFBCzr5UFJSSxihlIXRsqEjbshB
	lGpu8+qDIdNLh+iHjayzL7YKHud+0t3pUizmsCmrPxn7wUQCLk9kVkeDRuYklc+e
	hqQ0gA==
Received: from mail-dl1-f72.google.com (mail-dl1-f72.google.com [74.125.82.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ejj3gkfty-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 04 Jun 2026 01:33:36 +0000 (GMT)
Received: by mail-dl1-f72.google.com with SMTP id a92af1059eb24-137eff27f36so146795c88.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 03 Jun 2026 18:33:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780536815; x=1781141615; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=z2jDYFyWFwiBr8ROyqOwhRj8gSALzKVWOWbM241VcAk=;
        b=jfeh5nYzu073Mm2aMGtl4E0ZlPc0N16M+f1rpON5oDGIdDZVv+0f35XU2bOp2dAmOl
         QYC6RmHNZGWdRt3KSgXFf+13y/uSNoEwuCM5Z/xtWicMgEtH5w/xidjlv1UOJOnh18xD
         RhM3VI3tANXtb3YbuVsITCoEg+8eLPvIdii2ZfnAw5NRKQR+zvuT8Y3wDNE0WynGwVcv
         ZqvRXksBAe+kf+bewf0A7ZghN2gg99dXV1uwOFkQyFVvIoW4QnyqlcqmJNvygO/Y8BEk
         B3t+XL53S8If8lV00PRf73BqbnWPvy6Rp0Lvc0NAG5+FPk7OMqMUwORhdTk/s3M1+hBG
         0+gQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780536815; x=1781141615;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=z2jDYFyWFwiBr8ROyqOwhRj8gSALzKVWOWbM241VcAk=;
        b=EJNHryaBmzyavrrf1n2WCmjK89RsE9Av1u4f5LPTePCnrbfGTio0IgiChaURsdeivo
         RCHjW7+cU023f04+QX7APjy2ZLsF/SdsGUsNvI/KT8fC22seZwJ8mDTXnzI5VSBs3SB8
         pRJ184rB4Bd2ItxR0YLbjVPKYdtUgawzayDKmoaHuJlAf+RZIlPqNkzVzcHsNfjg87p7
         Sjy6rCOb5RwMRK4ugk5ZWNSNk9+TF1elGrtN66JmvDGMCO+GMT7SN1etor874fo3CLiE
         6PuHvZeVS0FLSn0Wr+KIWJDffPwI7VhjXKmss5OGHO1c+ljXxxcYemxUmePnDa8gGMh7
         nMdw==
X-Gm-Message-State: AOJu0YzGprIFwJPTYpv2Yxyez+8HDUeGUowshrpM3UIo5X8W0BtG9c4e
	ke9APiIYHMC72CbjptKj34EVjcgYvs+dAAIybuTSZMMpnK9J27EfUcPiL5XiFcLNA8LjjTH8vdd
	5BPBcSKej7fHEbE8TNrX/2IzpUpnzcZLs0i4PWZ/3EDRxbZMJ3RhJ89a4Y78jW1NyUQh9
X-Gm-Gg: Acq92OGsVJhnNb4fv8mSpmJx0KZN+eG4P/nHbFAdk5sw1DXNlpk9Uo5myJs74xzPlJO
	/7TXFiDgRF9iA+IwDNbjVCJYsm1u+8tZB5VgPdgoGx/cyLDwW2fjxUgfimUn8XqpP0wukUP5ifo
	qX/wb8SjRxkUj6RPvL53xB4GtjANUKHTd6uxBtnyHtul3SXInAa214q4o0sLt9WXwnoVUbwtYAg
	8D4Nl7A/vtMCsuo5qXTBaXykWpQK2WWyPM/V+3M1o3oLUh2x/oJurG1j5wYC3hvMD4XizpTyqth
	Pqwe6Zs+KIgdpBC91tJt+KmTTg5FfbIo5H9w78TYD4sbEeOBQxvUvh9lEVB3HZ+MhcxbZzx9nxp
	AwBlDeIyUF2QTSZtjXNySdI9jGhw1/u2sw6flh4b1v3ressa880IOE4q0GlRJR/RuXhJnEw==
X-Received: by 2002:a05:7022:f314:b0:11a:fb3c:568b with SMTP id a92af1059eb24-137f6ba38e5mr1296340c88.17.1780536815454;
        Wed, 03 Jun 2026 18:33:35 -0700 (PDT)
X-Received: by 2002:a05:7022:f314:b0:11a:fb3c:568b with SMTP id a92af1059eb24-137f6ba38e5mr1296336c88.17.1780536814946;
        Wed, 03 Jun 2026 18:33:34 -0700 (PDT)
Received: from [169.254.0.3] (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-137f553ab33sm2870659c88.10.2026.06.03.18.33.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Jun 2026 18:33:33 -0700 (PDT)
From: Matthew Leung <matthew.leung@oss.qualcomm.com>
Date: Thu, 04 Jun 2026 01:33:02 +0000
Subject: [PATCH v2 08/10] phy: qcom-qmp: pcs: Add v10.60 register offsets
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260604-hawi-phy-pcie-v2-8-be908d3560db@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1780536795; l=1895;
 i=matthew.leung@oss.qualcomm.com; s=20260428; h=from:subject:message-id;
 bh=2ILPtmC6htJwupXVcqBNOJFTUtBdC7zGearGnbGCWow=;
 b=HjtEuYdgPwNBjfNk6Dz/PB9TbjV1eeA6SMtz2P80BbJnR9dKxGj8QiYoQAnQOND8Sn3IEmqH+
 74KD9+/rK2vADK0eZv78mn8nfpzQd6PhC1fRtO5fB9KYTwHNbS6z+L4
X-Developer-Key: i=matthew.leung@oss.qualcomm.com; a=ed25519;
 pk=aT25ggJo5PMHLN9N+TsZ3s/BVU++kEYuiFebPWe21+o=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA0MDAxMiBTYWx0ZWRfX3FoJ3pKuYi1q
 PAplpQBBgq45EDAApqzOexOdwNe5TT8a3u/DSCM/i3qhE72quGN0Ls11u6SaJLuHA9ruvv59m8u
 xA+ukb4Mk7OSdI/SnH2Og1y1ya3qpv4Mg0AliFZm2GewL8xyQfUNp0Ood18N3Y7x4gSV9g3GhLv
 uEX+USx7khW5uyfJyprSJ6T0Da7iN5mIsDS4DNMeUWm3I1nPmGhYiI0tl+E4jQfWY7ovjF7sitN
 NrGjLq6wqf6g27YTJveEiAwUOixCvQzgHiNaysGuSbqpxdjvcHHG9STe8ijM/crIKvxMr8gOD/i
 KklESQG5BePpgQDbVIJsoA5mXLwJ1+5VOgOC/4CYK1WMulVQMQ3MExM3CoIExgecyBC9z2uToQz
 JNZ9s/r7GrXBU5ZubD1LaDYJrIFllmcYZH/T86VXPG6F5t5FmNxBpd9A2FSv/KUPmMzZlgW8oT+
 A0JL2fDXvYMko79Eq+A==
X-Proofpoint-GUID: vYK3wHUb5c6XkycclAPAlPSmssyfUsxl
X-Proofpoint-ORIG-GUID: vYK3wHUb5c6XkycclAPAlPSmssyfUsxl
X-Authority-Analysis: v=2.4 cv=UvhT8ewB c=1 sm=1 tr=0 ts=6a20d5f0 cx=c_pps
 a=bS7HVuBVfinNPG3f6cIo3Q==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=pc03IfIZ1lXN1Xjd0rsA:9 a=QEXdDO2ut3YA:10
 a=vBUdepa8ALXHeOFLBtFW:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-04_01,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 malwarescore=0 lowpriorityscore=0
 clxscore=1015 suspectscore=0 spamscore=0 impostorscore=0 adultscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2605210000
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
	TAGGED_FROM(0.00)[bounces-111095-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,vger.kernel.org:from_smtp];
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
X-Rspamd-Queue-Id: D658863C3AD

Hawi SoC bumps up the HW version of QMP phy to v10.60 for PCIe Gen4 x1.
Add the new PCS offsets in a dedicated header file.

Signed-off-by: Matthew Leung <matthew.leung@oss.qualcomm.com>
---
 drivers/phy/qualcomm/phy-qcom-qmp-pcs-v10_60.h | 23 +++++++++++++++++++++++
 drivers/phy/qualcomm/phy-qcom-qmp.h            |  2 ++
 2 files changed, 25 insertions(+)

diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-pcs-v10_60.h b/drivers/phy/qualcomm/phy-qcom-qmp-pcs-v10_60.h
new file mode 100644
index 000000000000..fe0279ac4e4d
--- /dev/null
+++ b/drivers/phy/qualcomm/phy-qcom-qmp-pcs-v10_60.h
@@ -0,0 +1,23 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ */
+
+#ifndef QCOM_PHY_QMP_PCS_V10_60_H_
+#define QCOM_PHY_QMP_PCS_V10_60_H_
+
+/* Only for QMP V10_60 PHY - USB/PCIe PCS registers */
+#define QPHY_V10_60_PCS_SW_RESET			0x000
+#define QPHY_V10_60_PCS_PCS_STATUS1			0x014
+#define QPHY_V10_60_PCS_POWER_DOWN_CONTROL		0x040
+#define QPHY_V10_60_PCS_START_CONTROL			0x044
+#define QPHY_V10_60_PCS_G12S1_TXDEEMPH_M6DB		0x170
+#define QPHY_V10_60_PCS_G3S2_PRE_GAIN			0x178
+#define QPHY_V10_60_PCS_RX_SIGDET_LVL			0x190
+#define QPHY_V10_60_PCS_ELECIDLE_DLY_SEL		0x1b8
+#define QPHY_V10_60_PCS_PCS_TX_RX_CONFIG1		0x1dc
+#define QPHY_V10_60_PCS_PCS_TX_RX_CONFIG2		0x1e0
+#define QPHY_V10_60_PCS_EQ_CONFIG4			0x1f8
+#define QPHY_V10_60_PCS_EQ_CONFIG5			0x1fc
+
+#endif
diff --git a/drivers/phy/qualcomm/phy-qcom-qmp.h b/drivers/phy/qualcomm/phy-qcom-qmp.h
index e461a000da48..3a4a0a9a9e4d 100644
--- a/drivers/phy/qualcomm/phy-qcom-qmp.h
+++ b/drivers/phy/qualcomm/phy-qcom-qmp.h
@@ -73,6 +73,8 @@
 
 #include "phy-qcom-qmp-pcs-v10.h"
 
+#include "phy-qcom-qmp-pcs-v10_60.h"
+
 /* QPHY_SW_RESET bit */
 #define SW_RESET				BIT(0)
 /* QPHY_POWER_DOWN_CONTROL */

-- 
2.34.1


