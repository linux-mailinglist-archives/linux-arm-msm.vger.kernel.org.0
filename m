Return-Path: <linux-arm-msm+bounces-111098-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id aptiO9zWIGp88QAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-111098-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 04 Jun 2026 03:37:33 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 86E9663C3D5
	for <lists+linux-arm-msm@lfdr.de>; Thu, 04 Jun 2026 03:37:32 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=oc7AI92g;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=VgZIvTU2;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-111098-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-111098-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 4B95730B4D66
	for <lists+linux-arm-msm@lfdr.de>; Thu,  4 Jun 2026 01:33:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B9ECC1F4CB3;
	Thu,  4 Jun 2026 01:33:40 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6453F27587D
	for <linux-arm-msm@vger.kernel.org>; Thu,  4 Jun 2026 01:33:38 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780536820; cv=none; b=Oj/edsOAKhTX5g/2mIdu5vIvXz6e1p6iDr/fUsaJLzOcKRTIfmW0KpEp53zC3GI4H+zfUR2Omf9BqO8hdybGKYQCaYPav3dOHelMptq6likwDb56cU68PcUMuvHTpTjgp9/KTC8QM6MrrUPrlyygmUP++Mzy8nxyKc46VAUGphg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780536820; c=relaxed/simple;
	bh=F00WY5r3KpYlfjir5reJlgcKGKiWQ/l5Y3iLOGo4EiY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=P+FZ2JUTWVPP3kro9oX2Scqh48DPUWfEQ3oyLc3VRwdlTS2ToJAksgMUAk05nsDTu3R65bVxReq+bTNbpy8R6EKa/FcP0mIYu2R2nQp5k1ETuTC6sEhbxCUmhF9CB1gg/WnJmo865F3xOVGer/iKorQcc3TzfPpnNQUFLsz7CyM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=oc7AI92g; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=VgZIvTU2; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 653I6YqE1993483
	for <linux-arm-msm@vger.kernel.org>; Thu, 4 Jun 2026 01:33:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	lxm1AY+eckklG1rGatwU6/63VjnztNUWWzVUPAAutqc=; b=oc7AI92gbY/ynkuY
	a2tWAIOtzQWFH8Aw8LPN2IBQ5cRjUj8LV3WXrLvd1fCZP7Z/AAoR/l/8X3L73P86
	OyywFlwJg76aCmIvelIhhvwmm7Nqqy0x87FGCjLITryoaIDCwxIjK5oTYPvsqPnW
	MPzI9iJ8mfKh+zhf/YklhIEJrN2Rz/ItjN3j86S2TlkW+77A52Vc3nG286RwoIop
	1hXEYCscUf+IhDD7MaT1SDcLLCs6a+l20S5IqzocobCHgUp520gqNfhlp/VakKL5
	iTqCwjIYM16vtYr5XSQxTmkprPyXR+7wEsDyItl/od1oOPj/ULUmufogNW+yZKeu
	cg2DEA==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ejs8psdps-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 04 Jun 2026 01:33:37 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-304ee7d1368so141936eec.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 03 Jun 2026 18:33:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780536816; x=1781141616; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lxm1AY+eckklG1rGatwU6/63VjnztNUWWzVUPAAutqc=;
        b=VgZIvTU28s9FMX+NLWEl0Qoc88xI6Y20ff7BV3txvxtoqY+VID/PN4wx9+wejApXH1
         yMpSsR5e7c4P5YBraMNULpCJGvJIY2MLOvafYG3S3rcdY2DOTUmVTicROst6Q6QhZggB
         TLtls32X1vin6UgRCDv+pnK79Iuzh4/RcKdKo1rUx0x9FQu5eYDfz+KMmug3OoDqvZe2
         gOOZOSu9R3Hch1rqrHrb72nzTPXfHCNldHlu77S/VqeqkRR488jSwlVTS3AmmM7gFjGt
         94oz71D0a56yew5F7GoKQKg+WkqUFkww2HTLXrZ2JaAcMPQByrrRLERVsLop03rzkA29
         XVNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780536816; x=1781141616;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=lxm1AY+eckklG1rGatwU6/63VjnztNUWWzVUPAAutqc=;
        b=e/q4xawmuHMtACvx9uXtMxK+NZDkJQxImzycBRsvJJQBT2Gd565jegbg48yoICW9Qc
         MXWCHqrrS4gd+x0p1shJKABUDit4cxWETsd2ZU/er7HHTk5XfkRR/DmbzvdfaAqT0zQW
         7CwtQYThT/vBwxDoN/HCQxMKmyocJNmQxSe81jUDOKF+WS02f+pc5OHuQlVV7OESfpjQ
         nzphZLl8UBi7CcMKJ0T2p7U9b1YdrJgT9bUkk6CRWwvjXcjen63Qoro8Zk9j0HLfIR3U
         oDHG+Yy5mxhnsKGlqdGJZmPvl09WgI4BJ8pUjSk3AsMfcdc8R+7aIQT0B3jefjoYEoYz
         cKGg==
X-Gm-Message-State: AOJu0Yzd7kE2REfORGXUem7ARQON/1zg0XHUPGqQLjjvETo0JZrXP4TD
	8kwuqoQ3BL7mKn+zClZrSREKO0LPwau2uMFV9Th39itozKUeoF53kVTz/6dkyoZZQ/xJqgiZycD
	dDABbTyHt4gzPMmdtG+V+LFf52ccbUVlXjEy7xmvtIXcW+V16TUZUY55PtumO3AtSNDsI
X-Gm-Gg: Acq92OEHBt2AICzfEZLGLfm23ntI5b5pthtTUz2wVc0+gjJxtcXuPBfAYq6+E4ezORQ
	lo76ArRwUkPV5vZn2Eq5nuinWMxXHewyPVIST08VrgCDSWxNNtdyn0a8ED6T51rp8vYZCAW2LCe
	ebeCTdTkPNPI9FMjOAivD8VB2H9/Y2h4+cG0QrmZXAx7C4gXB+TXRE+3si7tEqh8EhaztMwKp8f
	8cGO5aezxXj1sHOQQsHfJuWr/mNXDR10WJ885Rwm0IS2I4H2f0wzjXBjWzLKzdVMbEvOAMmPZza
	QeGhG9eBBahVXfCnF2HRH+CY6nAKeyvthcFE7XGme87kDrdXQUUGDCQsrXoekopysWJGP0q8lvx
	FeV5IUE/DFRWoyssLsDP9t1HWSNVE+oLhi6FVdLcQKPRTk9EITMy4WWkJlDY+eU5HDiZPRQ==
X-Received: by 2002:a05:7022:684:b0:136:e639:9c05 with SMTP id a92af1059eb24-137f6c2f5d4mr2946186c88.31.1780536816454;
        Wed, 03 Jun 2026 18:33:36 -0700 (PDT)
X-Received: by 2002:a05:7022:684:b0:136:e639:9c05 with SMTP id a92af1059eb24-137f6c2f5d4mr2946175c88.31.1780536815953;
        Wed, 03 Jun 2026 18:33:35 -0700 (PDT)
Received: from [169.254.0.3] (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-137f553ab33sm2870659c88.10.2026.06.03.18.33.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Jun 2026 18:33:35 -0700 (PDT)
From: Matthew Leung <matthew.leung@oss.qualcomm.com>
Date: Thu, 04 Jun 2026 01:33:03 +0000
Subject: [PATCH v2 09/10] phy: qcom-qmp: pcs-pcie: Add v10.60 register
 offsets
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260604-hawi-phy-pcie-v2-9-be908d3560db@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1780536795; l=2258;
 i=matthew.leung@oss.qualcomm.com; s=20260428; h=from:subject:message-id;
 bh=F00WY5r3KpYlfjir5reJlgcKGKiWQ/l5Y3iLOGo4EiY=;
 b=9k9W1PbNAjQCFOz1jM9h88Z49vdjzddVAvYJrHWcjCPTa+RtCtE5TRBw+dR7XgbiegtN0XSJo
 8k739u9GzfnAn2ovtmbmsR69fWTwLxUERUUB0Fn+nX7Y15hsM+7bCg6
X-Developer-Key: i=matthew.leung@oss.qualcomm.com; a=ed25519;
 pk=aT25ggJo5PMHLN9N+TsZ3s/BVU++kEYuiFebPWe21+o=
X-Proofpoint-ORIG-GUID: y5c0_HpxceEnlVJnX_lv9Rnj0m8d5Yai
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA0MDAxMiBTYWx0ZWRfX59N5zz25S1Jt
 pz9Ru3QXDV7cpoLfbJNcua4aghd7wgSc+gsd4I5bl0lma7AyrMLNg72snPHV9O6m/UmkbSBwqai
 8G36WXq29zPswDGn/QSwIRuPPSnqldIOdwQd+6EVAjcgGrq6iMwvwsZBq6RvYirm2FHbDZVe+Uv
 R5thasZR2jOUrZMe7Teli/RSr+41D4QMK6ZG0cBE0P1hNC62rkWKuotL4y+e/z0fK7tmZybv03I
 kkKIjQEfalzM2n+mFXnP6iIFnhJDy09HyTVx4lZLZu6wqUQWoRF3Zi9Z5hPVOnCcJlKZe1Sqbb3
 Hvb6tRNqXzmOp4fvpdAmqjl82MO8Yt9Rw2Q9Ks4OOPno3TnD4mt9COwOqqCqu3g3h1T5syf0mXJ
 /rnGY8gQevuoPDsJZ4I2VQrKwpWLcpoLX1GBkYtxi+MXYRyeBNhuKggzFfSWh/ooNKjv0kBtAxc
 CI1PjjR+GpYweOm2ZAw==
X-Authority-Analysis: v=2.4 cv=E779Y6dl c=1 sm=1 tr=0 ts=6a20d5f1 cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=YnN_nBVA4yaojiBpU0IA:9 a=QEXdDO2ut3YA:10
 a=PxkB5W3o20Ba91AHUih5:22
X-Proofpoint-GUID: y5c0_HpxceEnlVJnX_lv9Rnj0m8d5Yai
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-04_01,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 lowpriorityscore=0 adultscore=0 impostorscore=0 malwarescore=0
 spamscore=0 phishscore=0 bulkscore=0 priorityscore=1501 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606040012
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
	TAGGED_FROM(0.00)[bounces-111098-lists,linux-arm-msm=lfdr.de];
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
X-Rspamd-Queue-Id: 86E9663C3D5

Hawi SoC uses QMP phy with version v10.60 for PCIe Gen4 x1. Add the new
PCS PCIe specific offsets in a dedicated header file.

Signed-off-by: Matthew Leung <matthew.leung@oss.qualcomm.com>
---
 drivers/phy/qualcomm/phy-qcom-qmp-pcie.c           |  1 +
 .../phy/qualcomm/phy-qcom-qmp-pcs-pcie-v10_60.h    | 26 ++++++++++++++++++++++
 2 files changed, 27 insertions(+)

diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-pcie.c b/drivers/phy/qualcomm/phy-qcom-qmp-pcie.c
index ba17e53d000f..fb66e2a97ce0 100644
--- a/drivers/phy/qualcomm/phy-qcom-qmp-pcie.c
+++ b/drivers/phy/qualcomm/phy-qcom-qmp-pcie.c
@@ -41,6 +41,7 @@
 #include "phy-qcom-qmp-pcs-pcie-v8.h"
 #include "phy-qcom-qmp-qserdes-txrx-pcie-v8.h"
 #include "phy-qcom-qmp-pcs-pcie-v10.h"
+#include "phy-qcom-qmp-pcs-pcie-v10_60.h"
 
 #define PHY_INIT_COMPLETE_TIMEOUT		10000
 
diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-pcs-pcie-v10_60.h b/drivers/phy/qualcomm/phy-qcom-qmp-pcs-pcie-v10_60.h
new file mode 100644
index 000000000000..2df5a45010a4
--- /dev/null
+++ b/drivers/phy/qualcomm/phy-qcom-qmp-pcs-pcie-v10_60.h
@@ -0,0 +1,26 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ */
+
+#ifndef QCOM_PHY_QMP_PCS_PCIE_V10_60_H_
+#define QCOM_PHY_QMP_PCS_PCIE_V10_60_H_
+
+/* Only for QMP V10_60 PHY - PCIE PCS registers */
+#define QPHY_PCIE_V10_60_PCS_POWER_STATE_CONFIG2		0x00c
+#define QPHY_PCIE_V10_60_PCS_TX_RX_CONFIG			0x018
+#define QPHY_PCIE_V10_60_PCS_ENDPOINT_REFCLK_DRIVE		0x01c
+#define QPHY_PCIE_V10_60_PCS_OSC_DTCT_ACTIONS			0x090
+#define QPHY_PCIE_V10_60_PCS_EQ_CONFIG1				0x0a0
+#define QPHY_PCIE_V10_60_PCS_G3_RXEQEVAL_TIME			0x0f0
+#define QPHY_PCIE_V10_60_PCS_G4_RXEQEVAL_TIME			0x0f4
+#define QPHY_PCIE_V10_60_PCS_G4_EQ_CONFIG5			0x108
+#define QPHY_PCIE_V10_60_PCS_G4_PRE_GAIN			0x15c
+#define QPHY_PCIE_V10_60_PCS_RX_MARGINING_CONFIG1		0x17c
+#define QPHY_PCIE_V10_60_PCS_RX_MARGINING_CONFIG3		0x184
+#define QPHY_PCIE_V10_60_PCS_RX_MARGINING_CONFIG5		0x18c
+#define QPHY_PCIE_V10_60_PCS_G3_FOM_EQ_CONFIG5			0x1ac
+#define QPHY_PCIE_V10_60_PCS_G4_FOM_EQ_CONFIG5			0x1c0
+#define QPHY_PCIE_V10_60_PCS_POWER_STATE_CONFIG6		0x1d0
+
+#endif

-- 
2.34.1


