Return-Path: <linux-arm-msm+bounces-106758-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8CobFXFy/mmjqwAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-106758-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sat, 09 May 2026 01:32:01 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B9824FCC12
	for <lists+linux-arm-msm@lfdr.de>; Sat, 09 May 2026 01:32:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 294F3303E121
	for <lists+linux-arm-msm@lfdr.de>; Fri,  8 May 2026 23:31:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3D07736D9E1;
	Fri,  8 May 2026 23:31:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="U2akJPGV";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="UHHl5Brp"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19F80366816
	for <linux-arm-msm@vger.kernel.org>; Fri,  8 May 2026 23:31:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778283094; cv=none; b=AfGX5QlbJ303gXQMYZJAS08CMTtbf5nVyWRPQSLPjWxwypdrtlxGBYYc3JYMPCTPk00U5x9xSk+FcQ8pBV+K+v4bZJYs0//Ogvs3GJUwLabdw0s5KDCIe4vBC8nM/Y7Uctkug/EeTLqJMhgQlYmg40W1arm77DRlHEkriudqoAg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778283094; c=relaxed/simple;
	bh=2ILPtmC6htJwupXVcqBNOJFTUtBdC7zGearGnbGCWow=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=VbtvzQIGC7FR63DJsZqCCTt4eZjJqdv3y8kVr7GMqKjBJzrZF8zKQweeX9I60fxZw1VL5uRL0ZjDse1vNLLAGdMttBqx+Y3y8C3KUWb/TBO6KaeNlsBr4zi7vaxl4rtk4bvet6zLb5GjE69bqk7eO4lYHaf7FzgIq4BqvFC39i8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=U2akJPGV; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=UHHl5Brp; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 648HdnQ8874045
	for <linux-arm-msm@vger.kernel.org>; Fri, 8 May 2026 23:31:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	z2jDYFyWFwiBr8ROyqOwhRj8gSALzKVWOWbM241VcAk=; b=U2akJPGVtGb2jLF1
	VyAMgiBrbxGw+R+Ubus+qhyeuGmGeoDs3IDBQHy9475bqeF/vxJ0F+BjOpx/YrzR
	fB1sfWCZPwddCHY7XMg+LumGk9Lp8kseKx0wy8+VIB5lmN+u8xoWz7FrskiLl09v
	9G82T2RbZgU8MpWhBwBHA9zBaiRimOsj8F58VgBWB3nyxHebSFHCFvp12V/TDQsf
	9OaXB3OtE6T6+NXvw/mGIf6iLWUs5RcsUk5CN/hwq7yysALRdJd6hdTMoYdaA7f6
	RdICfh6og1ASmClnxnaob3FjmT8DDez29vtVHSAqUaX1so37MjW4iNReIek4DfCh
	JXnuBA==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e1me80xcn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 08 May 2026 23:31:31 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-2ef37c3f773so2972631eec.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 08 May 2026 16:31:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778283090; x=1778887890; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=z2jDYFyWFwiBr8ROyqOwhRj8gSALzKVWOWbM241VcAk=;
        b=UHHl5BrpFyNrNHXB9EQMYcoze6noL41itSr/oGF8r1h/o/jas/wysCfuPNiI9MV7z7
         9s4yS5++eWrOXKDp5QS7GVatlGOCjNIwaOEOsaYBszPe/MuJIgbtteJWnLRLt2Xm/WCt
         +zrip0RUulRJ3OcRYzajzCc9fEG+J8WcJxWmN4MbnohCy+u4eLKxiavxB7TxmhHeolqI
         H5z3Z0sUZlAciwpIiy/o0wxtd3cyf0pbmI1XpflrErS3RnbqiFtTLphv5H0EtNPFR3x1
         cP5Zr7ZZNFq8sweNs5uQ4ghrdt0sNGcCu8WqDaYD8SYqx0Sfooizb8zOiwBGpKbDx/4n
         RAHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778283090; x=1778887890;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=z2jDYFyWFwiBr8ROyqOwhRj8gSALzKVWOWbM241VcAk=;
        b=R+3YVlqORiOPztH+ebS1f9OeMDZ9rvmv8JnqFzp3aXtiB53L4O7PNWtVRjtszg7rQn
         3GHQdWMPAj/abxRJbteqcp/nUzG6emROpM+XCWCZMV8xVBuPggBHvQCnjSvrdNXlfYP3
         eCv4NSjnUKoaq5Umv0b1KDcR4irYMU5eiDuTsDaN+pqRfg8E/yW/A8aij12EO6DK1LHV
         /2T4vS2ZPLJI4oBrfhWRwSFHihaHEIpW+hG0LDQM82YwEmMHBCrLVVqStrNmS76Qip86
         F5JjlrJk1jenb5xH3cfzIm5XkfreZR7eYfpM4kx0Vv1MXZEOH/zTpDU+NTd6+u+/ItT4
         3cRg==
X-Gm-Message-State: AOJu0YzGJgCNcU4Q3jNIGTL7C+CHn+lPP1Uu995A/0p6vnv9/OTu+fCS
	10k3miRLLYuGEi3EunL7j8TsjF2MB2PPtc5Ny+HFFAy1d9E2hgyAA1UkT65SSojQm2j6ADqXCxX
	5r8SZRka+FB+eHwoMQfrihzPJ2gPepJEaWECTkBBzhHuIVE4qrbLUOS+jprhwH4s18Ucj
X-Gm-Gg: Acq92OGgv5wcstQ+ENAir7Eufb/S8G3wctXWImjshudRhqDKbPjUCCuXY4JWkuMVMyc
	KGz73rMU6S9D0hwT1pw1n6jmhYmqJYpEMMz7jJnC+P9+1hac8Qupn46nNzpngPY1o7lwKs96SZY
	B3ki7LWuCO0jZR3QlgCNZmEP445kCLC62eiodKXjj4V3ZDZqm3yoV4LFatgu8B8DPZcR08pCXPG
	JTBmOyRroBYizfdCbo7oJ+wbMX2i4gtFhztkzrhw9ZGKSQAfj1bP9tOZVcF/gcDA8FB+ulmYOcf
	eq2Wn4bw+SKSzQ/NPW2lGNV6fULhhDQGYIE1DnQOhCCQjXxiwfguLYqnX6BXa5J4EbcVwQCipit
	9Spuu0D4Y2GGtwY4t7i7oBq0oJJI1SzQYdQk252JTkIuDe8LOiNP6sOxzlEc=
X-Received: by 2002:a05:7300:4313:b0:2ed:e14:42e7 with SMTP id 5a478bee46e88-2f54b068c4fmr7179513eec.32.1778283090040;
        Fri, 08 May 2026 16:31:30 -0700 (PDT)
X-Received: by 2002:a05:7300:4313:b0:2ed:e14:42e7 with SMTP id 5a478bee46e88-2f54b068c4fmr7179484eec.32.1778283089490;
        Fri, 08 May 2026 16:31:29 -0700 (PDT)
Received: from [169.254.0.3] (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2f88885b87dsm5033122eec.21.2026.05.08.16.31.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 May 2026 16:31:29 -0700 (PDT)
From: Matthew Leung <matthew.leung@oss.qualcomm.com>
Date: Fri, 08 May 2026 23:31:23 +0000
Subject: [PATCH 08/10] phy: qcom-qmp: pcs: Add v10.60 register offsets
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260508-hawi-phy-pcie-v1-8-237b894353fc@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1778283082; l=1895;
 i=matthew.leung@oss.qualcomm.com; s=20260428; h=from:subject:message-id;
 bh=2ILPtmC6htJwupXVcqBNOJFTUtBdC7zGearGnbGCWow=;
 b=9X/Fm33TZjr4AzS45pxwdMzaAydcOfoG9fPGrGiA5IkBCbFNsvCvp1zs1OEql78mocn9qMGK6
 8L64aV4TnsGDB3o/H0CL8R5vVcniIMti1GcUrKxkka+w+i8XAXQzsJK
X-Developer-Key: i=matthew.leung@oss.qualcomm.com; a=ed25519;
 pk=aT25ggJo5PMHLN9N+TsZ3s/BVU++kEYuiFebPWe21+o=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA4MDIzMiBTYWx0ZWRfX7ecEUgNpEsAQ
 ixNRrrw2XeU/5zJ+lEJazdyocdtuDyirOr2E0kbQTpT/tyvSJP9O/cSH6TjxLQ/C5189FqOltuR
 SiOMfedXU5R/GRv4bOK/se+RB37TTBAVDS5dLYzijttijPZs02VqjDo30cLXJyQS8PNs1ND59Pw
 KbA66sazBxSn2j/RxuQkQSx0F1O9CyiFBgE6su/CsWVS+mx0nqagdhXZL3OjxBEZWDcouror5zu
 UHSUBLwMOdlvIr9qyigmgax7q9z2wc7v1QjQQnjBANGbgWwa2en99fMXExfn+iODyIR1uoy66YB
 FOyVPS3FCrMKqoFVIDq/AINq+FEJjrfVd2NeD3Ff81NDXXb0hLkbHTOeKASrolqYaqJs8uw95kG
 IQ5BSXxC/5s1Lq3g0flTcm1VdRL1nz+JVgAMps7l20zthnIo4Qgqn9YlqAmfFx5ZEdGFha/+4wh
 KWJP6zvpqBARrv9EGvA==
X-Authority-Analysis: v=2.4 cv=BsKtB4X5 c=1 sm=1 tr=0 ts=69fe7253 cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=pc03IfIZ1lXN1Xjd0rsA:9 a=QEXdDO2ut3YA:10
 a=PxkB5W3o20Ba91AHUih5:22
X-Proofpoint-GUID: AwvrcEKoTyjrTwOmWGGUpraT8HdOzNmO
X-Proofpoint-ORIG-GUID: AwvrcEKoTyjrTwOmWGGUpraT8HdOzNmO
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-07_02,2026-05-08_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 phishscore=0 adultscore=0 spamscore=0
 lowpriorityscore=0 bulkscore=0 suspectscore=0 impostorscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2605080232
X-Rspamd-Queue-Id: 0B9824FCC12
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-106758-lists,linux-arm-msm=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

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


