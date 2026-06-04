Return-Path: <linux-arm-msm+bounces-111094-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id wy6aCmbWIGpr8QAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-111094-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 04 Jun 2026 03:35:34 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BC4963C397
	for <lists+linux-arm-msm@lfdr.de>; Thu, 04 Jun 2026 03:35:33 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=E28ReFj5;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b="CsKnjB/j";
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-111094-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-111094-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 88FC13071C96
	for <lists+linux-arm-msm@lfdr.de>; Thu,  4 Jun 2026 01:33:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1EEA52773D3;
	Thu,  4 Jun 2026 01:33:35 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1EE4B23EAB4
	for <linux-arm-msm@vger.kernel.org>; Thu,  4 Jun 2026 01:33:32 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780536815; cv=none; b=ttDq2WkcSd/x4vEDG8eYHYY1Og5o3yyQ5JJw5OfrQFLav8NfZh8fVmwtv4R+SQwaTgPaxuTtJIZDAEvoGV+XtrRyLp7uV1CDS3UX29zSZbj/57i2WH/SnWGKENBJrgAk+qSavHaam0JjOv+iG+oyAMLGCoLABkPswuSVe6RxV9E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780536815; c=relaxed/simple;
	bh=8Pt1Iry46S+aeKxOUquDig1kaHN7zoPCKWm77OKh1o0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=VI+A7BS4xY87OESGOPdFFdsrtC4Vt/LuZkWY1f8idet1fKT/upE/Ju284+CYA4k9ETEHydpy2tGtg5jidv2Xl5TVFQoGAEwhqDiNg3dtPbRuK8th7kYGQlwgAf3DTersPZ//8+DHwceLq9LXt7Z23rZqFM6dumYi8Yz8Z5CnTOI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=E28ReFj5; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=CsKnjB/j; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6540tpjK598093
	for <linux-arm-msm@vger.kernel.org>; Thu, 4 Jun 2026 01:33:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	b2mlViog/YyqHq+jcQTv7WnwnY8MfXhr992hmCBoDqw=; b=E28ReFj5GB++NHXF
	FJbxXkLsvKYcVZKiQ6SAW57C7NUrFmlwQt7WXGchTn4qA7g+YGec4JlLmJpoxBid
	UU3De9veeSXK9OoTdCDGrwdFmXFW7WEDz5MEuv1oJzl8iVI/Itzx6imPxA7gj+Jx
	A+JEM7sxovu3T49L094ZAuC1JcSMNQfJeq52Ma78efZfTDyKWfAlvqftFamHGGBc
	g2cKk3skUn6TM1+/Dx8hioRYlZktpfIJPH93IlmvPzhAXOGMF/9Hb08h3vF8MWMp
	Dgv2CdrkfvdrBY8MuZdA+IeYj/ZF8IXEMgbslOs3r+ZeRbLBRQoaiGRw+uNmDUJW
	ISRhbw==
Received: from mail-dl1-f70.google.com (mail-dl1-f70.google.com [74.125.82.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ejy8m0324-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 04 Jun 2026 01:33:32 +0000 (GMT)
Received: by mail-dl1-f70.google.com with SMTP id a92af1059eb24-137dbe27199so749880c88.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 03 Jun 2026 18:33:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780536812; x=1781141612; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=b2mlViog/YyqHq+jcQTv7WnwnY8MfXhr992hmCBoDqw=;
        b=CsKnjB/jIdJdR8Yq5qOypqyYDL+Xy5ypnVDvvKAWLciSoTzyNOn7hOgBDISEmM/meu
         nKyMYtiLlV7rHv+XBEfG9VH32i+RLhZVOwzTgPl6xvtZS+iPAJBg61uZlPvOerMxGWq4
         IFD6ayD5EugRbEiNvEDO9p2qcxyRtg/kECki4GdqFX7Jlx4SolWSIpNhNkJ7PtIbkEyz
         GkeLcFFgMcv1RM7vrAfMWzOd/Q25JWH4TmBelE9gLQVhFnR+gi31354reylwe5guJ3zf
         QCORVDLtfNEsfphjv5rd9bEjG4SxvyMvAc/iY1+lIwB8bRtr/riQOuv/gZsA4WzIQbha
         Vhzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780536812; x=1781141612;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=b2mlViog/YyqHq+jcQTv7WnwnY8MfXhr992hmCBoDqw=;
        b=UI8whMKQwb80EuQ6mWMLd03tVdz3wXvI5brCE/X2yq7S8mqqDCZa9CgZ46OASKEaBW
         i5uLIlqfAmtZGfxsQZLS+8KZKUqVkab4U74Nqj8SL32mgBE8Ho2BxJOR560kZJ7QXEVl
         P8Uq8y9BHvCLABk5qHI7OC5PukVJXG4s4ryevz8/KobjPUOdFfLG4Ezl+88JP8D2nUgA
         E2Bg/xJswPdTaBY+IpUU76TUZ2zsr1WNlIt/ZRy8cT0WPXEoN5ThpmgtLzj6RGnYW165
         0bg+tVEoQ5l3jb2gbRyGDWQJ9LAot6oeihSn9GWfy3Hm5uxtHeoDiD7FPj+MQdjjra4H
         JaTw==
X-Gm-Message-State: AOJu0Yx1bGSNQj+q/utCgsKYTt31UZLzcEAJXr6c5FG7+AxhxWGIhXt1
	tiTd7diFX9k0x/I+LnbiB8LbrpkZ2hKQ475WC04rGWzz2e8bzKmIb8hFUfMUHSuglL4z/0g79AH
	0avpCnNesiwyzyQDlUH3J+YZZPnvRtOOfYiPA5oi0j/TtKW4X1ym4LWmLoCjXuuBs8Otm
X-Gm-Gg: Acq92OFvcDUf1yKpiaCLnzX0VfAg3j4l0liZUZQ0sSnUalFX2M3JOZkkgbUgSF7ktRg
	ALVXsFOPbdIlzHMSJhLGZi5TWPublWY3E+QSsCCK+oNsZRNXQ/QKJCiT5/CU+L4XCcor6njeJ67
	8s8BI06voeORc0cN4o/N17oQpK3t7umZmYbhB/VPrLTUEAu+Hs+y9LF206wlTryLLk6aKInI1pZ
	fFJpXQ7Fnlx+E0X5YISfKA+be96J5RRPXUxLIvcHXuG7hNh3o+y7G156xq7isjpdNsNY0LyRdYd
	Ox+CglGUDryUmW2CGkYn5s4mPY43HpxmSP94U4o7vTL8L0ex/N5IUHMm8Y4PglWisDBbiy6SKFq
	PYAzgifdymMDl03WyZnSGfityfhGDz8q52lmPsnY/NZSmRQBoRNQl5bKV5HWvNa5n9+Uy3g==
X-Received: by 2002:a05:7022:fb04:b0:128:bae0:e03c with SMTP id a92af1059eb24-137f6bd9131mr2680553c88.30.1780536811573;
        Wed, 03 Jun 2026 18:33:31 -0700 (PDT)
X-Received: by 2002:a05:7022:fb04:b0:128:bae0:e03c with SMTP id a92af1059eb24-137f6bd9131mr2680527c88.30.1780536811047;
        Wed, 03 Jun 2026 18:33:31 -0700 (PDT)
Received: from [169.254.0.3] (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-137f553ab33sm2870659c88.10.2026.06.03.18.33.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Jun 2026 18:33:30 -0700 (PDT)
From: Matthew Leung <matthew.leung@oss.qualcomm.com>
Date: Thu, 04 Jun 2026 01:32:59 +0000
Subject: [PATCH v2 05/10] phy: qcom-qmp: pcs-pcie: Add v10 register offsets
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260604-hawi-phy-pcie-v2-5-be908d3560db@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1780536795; l=1757;
 i=matthew.leung@oss.qualcomm.com; s=20260428; h=from:subject:message-id;
 bh=8Pt1Iry46S+aeKxOUquDig1kaHN7zoPCKWm77OKh1o0=;
 b=5g+laxlLXY1H2s128u8V7xGg8hyIWr/D5b/yY/GQ3MFsIkfv/m+5wFzfth1ukGv+sM761EUTU
 TDq170rYxDRChHfESgc721HP3SrOGba05rIN6T/hmBe90AfN1RGkZsg
X-Developer-Key: i=matthew.leung@oss.qualcomm.com; a=ed25519;
 pk=aT25ggJo5PMHLN9N+TsZ3s/BVU++kEYuiFebPWe21+o=
X-Authority-Analysis: v=2.4 cv=KfDidwYD c=1 sm=1 tr=0 ts=6a20d5ec cx=c_pps
 a=SvEPeNj+VMjHSW//kvnxuw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=a_mrqaUjlmxG8iE0lbgA:9 a=QEXdDO2ut3YA:10
 a=Kq8ClHjjuc5pcCNDwlU0:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA0MDAxMiBTYWx0ZWRfX/co+1XcOqAJZ
 3XF1Zr3C+42TLFU60+pMBX4OJiqPonucZf9aeJ1xChM3FKXReUodSCo2KEhefA3PaRZsM2NXVwz
 qr6aIXz4hsr9/L5tpSf25S/2Z8YsLy8iJs3G/nNcgWA2/u65M5tyP/9RoXrt0PcZpc7EV8gMHlI
 i+Scvs26XIJqMysMSmV4m1VosWBhwAtHBd16Rmp19OyY+ODJn7GbtvLpxsX7PkACubz20WKU/A0
 Q6257a0jDvHLNlQx9sgy/yyYXW8zb17Jqi6WnV9bdSLSneYQ3h/qzXJuEP10Uei5CUoam1I5zpq
 jqypO8y81DD3zEat4vAJAjcheSLfPSl/gEKYb0Ze94reT0l67d6PRGfd7cEgqPgy/IbGCMi04x1
 oy6S5071rMSOKexkWVtmdJYGcGU3MUpXWVxdZNkInaOqASjNmEH6TBDRf7dl7aMLy9k1JIytzdG
 ITY/CKs8iuNiUiEaKug==
X-Proofpoint-GUID: kdLRoVa1ZYZuc_RKm2WqlYlRfPqXZ5g1
X-Proofpoint-ORIG-GUID: kdLRoVa1ZYZuc_RKm2WqlYlRfPqXZ5g1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-04_01,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 impostorscore=0 lowpriorityscore=0 malwarescore=0 adultscore=0
 priorityscore=1501 suspectscore=0 spamscore=0 phishscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606040012
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-111094-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim];
	FORGED_RECIPIENTS(0.00)[m:vkoul@kernel.org,m:neil.armstrong@linaro.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-phy@lists.infradead.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:matthew.leung@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[matthew.leung@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
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
X-Rspamd-Queue-Id: 7BC4963C397

Hawi SoC uses QMP phy with version v10 for PCIe Gen3 x2. Add the new PCS
PCIe specific offsets in a dedicated header file.

Signed-off-by: Matthew Leung <matthew.leung@oss.qualcomm.com>
---
 drivers/phy/qualcomm/phy-qcom-qmp-pcie.c         |  1 +
 drivers/phy/qualcomm/phy-qcom-qmp-pcs-pcie-v10.h | 18 ++++++++++++++++++
 2 files changed, 19 insertions(+)

diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-pcie.c b/drivers/phy/qualcomm/phy-qcom-qmp-pcie.c
index fed2fc9bb311..ba17e53d000f 100644
--- a/drivers/phy/qualcomm/phy-qcom-qmp-pcie.c
+++ b/drivers/phy/qualcomm/phy-qcom-qmp-pcie.c
@@ -40,6 +40,7 @@
 #include "phy-qcom-qmp-qserdes-com-v8.h"
 #include "phy-qcom-qmp-pcs-pcie-v8.h"
 #include "phy-qcom-qmp-qserdes-txrx-pcie-v8.h"
+#include "phy-qcom-qmp-pcs-pcie-v10.h"
 
 #define PHY_INIT_COMPLETE_TIMEOUT		10000
 
diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-pcs-pcie-v10.h b/drivers/phy/qualcomm/phy-qcom-qmp-pcs-pcie-v10.h
new file mode 100644
index 000000000000..2cdcc211bd93
--- /dev/null
+++ b/drivers/phy/qualcomm/phy-qcom-qmp-pcs-pcie-v10.h
@@ -0,0 +1,18 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ */
+
+#ifndef QCOM_PHY_QMP_PCS_PCIE_V10_H_
+#define QCOM_PHY_QMP_PCS_PCIE_V10_H_
+
+/* Only for QMP V10 PHY - PCIE PCS registers */
+#define QPHY_PCIE_V10_PCS_POWER_STATE_CONFIG2		0x00c
+#define QPHY_PCIE_V10_PCS_POWER_STATE_CONFIG4		0x014
+#define QPHY_PCIE_V10_PCS_ENDPOINT_REFCLK_DRIVE		0x020
+#define QPHY_PCIE_V10_PCS_OSC_DTCT_ACTIONS		0x094
+#define QPHY_PCIE_V10_PCS_EQ_CONFIG1			0x0a4
+#define QPHY_PCIE_V10_PCS_RXEQEVAL_TIME			0x0f4
+#define QPHY_PCIE_V10_PCS_POWER_STATE_CONFIG6		0x0f8
+
+#endif

-- 
2.34.1


