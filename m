Return-Path: <linux-arm-msm+bounces-111096-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 9OgwGKTWIGpz8QAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-111096-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 04 Jun 2026 03:36:36 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id F330063C3B2
	for <lists+linux-arm-msm@lfdr.de>; Thu, 04 Jun 2026 03:36:35 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=AzkVtazN;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=fNtmpQJg;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-111096-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-111096-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 02D543092F1E
	for <lists+linux-arm-msm@lfdr.de>; Thu,  4 Jun 2026 01:33:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3DCA827F75C;
	Thu,  4 Jun 2026 01:33:39 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1FCF0280325
	for <linux-arm-msm@vger.kernel.org>; Thu,  4 Jun 2026 01:33:33 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780536819; cv=none; b=XekLR+CGpo9563MvPo2Ux2PJL9ug9P8bSvl219r7HSp5T5yvABVKOXNo9P8FCSLPfPTdccwC6qCoDYVaOcwDY7QKPlAV1YNYG6NHUgtoKNUfB53auwtXBVz0r2Uqa1mjIwKKsYFjseknm4g68wGbjE3+D4g1l6zkDHhmtNsKQSU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780536819; c=relaxed/simple;
	bh=l+CJCriIHCqSTKfqB3yNlnKfu4zi16GuU5MaRzEG1I0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=XEUzpBlu0BxlphLENNkMjXbT/LNkkJREyNqIa5loTrsDwiiNBseai+ai1RJC1CzAhGv7xHJiggZBKd6kMtSEjnnYHsLNeENWs4gMUWGRpcVmhhs8WyXK+y+CfRSSf4LRwW2X+6C5RqwVzyAocIUHlMMMs5nqobShf5kHZIFAAbM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=AzkVtazN; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=fNtmpQJg; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 653HACri3552370
	for <linux-arm-msm@vger.kernel.org>; Thu, 4 Jun 2026 01:33:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	HbuSh7qg+z5cv7EQdenG/3gCq/0U8ci8jC/n3KJ+wyA=; b=AzkVtazNqpn4P5j+
	Rdw4fuFNHeszyEjiMCntXGVTDYVCe4uvtS6UoxaUBCsYQfEWNGjXcBVWKn2CcG2V
	3WiFJxeBHool05XoDIadGE9RcEiIzaeOEoVeud78SkEHQKI5j7v4jSosUc20Wbq6
	7mxGOh6KZ9dHpa40fmR9QajAZrH+c/PcIbTInr4mx3iJABZpmPstGVqNPKIzzvim
	uV/iCpfvWMMOF8t4GzohbdOM12V6FHjIhkhzimfAZpIF8OPp/SIqHh5/n+Vmv8qI
	ME5RQi/npWnxnB1P2b3QOxv354rjA0uv5gmyA1L3BTV8dOuoe6M8Q1yoLRgXfWS+
	1bY+Qg==
Received: from mail-dl1-f72.google.com (mail-dl1-f72.google.com [74.125.82.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ejj9mufr7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 04 Jun 2026 01:33:33 +0000 (GMT)
Received: by mail-dl1-f72.google.com with SMTP id a92af1059eb24-137d003cf09so631730c88.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 03 Jun 2026 18:33:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780536813; x=1781141613; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HbuSh7qg+z5cv7EQdenG/3gCq/0U8ci8jC/n3KJ+wyA=;
        b=fNtmpQJgvKZS5Zn/dA2VCpgQk3mSZFJG0rJ7urlMUlTPC9PJtJtAY45l9jfazaJr3J
         ExqeuqQQB8I689nmymR//ZmdCKPlzAIPG8h2GZzQM9XFPAjmvYi7R+INhl6yhlw8H+zz
         1CsFfoBUu2U+6WKNZK51KGTaFnefGKnr8qsQeBStTPfpKnIgPzah5GGfFXfSyosSmyxL
         wXA0cgorj4KeHJfVSD6C3b6nRcTeL4ZuhHN124f+g9fUW6yRcgAkk0IiHDzl/ZWFPrt1
         XIkVyK/cMWo43R7L2z5niupTdaEIRM1pCOS/owK11K56HLQZmzeb546mQBnHDBbl7jAb
         CCLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780536813; x=1781141613;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=HbuSh7qg+z5cv7EQdenG/3gCq/0U8ci8jC/n3KJ+wyA=;
        b=irIRbZT6mbPpRZeNmWI39PPg1k62yBTvQ58wYY/Rsn5RUsj7Vs+ma3f2YOU/u1w/sh
         onwya79eCEF45zFlIW3MAxWH9erpmrCuDwJOkFkAdamXGofO1fTeoerHyiD06ChRtC6/
         fweMoDs7Li5eEp5gmk6451k7X0B8uZSPeOLMi3RvTmaH4Hr12dgXHVfP8dkwcuKiEuyX
         JPLirMX/IaRMVbyau0lIqs94HxHYf+YUmG10QIYGPfvtfnT35ReqU/fc81+SSXNnN6Wd
         rCj/Hq6V1GxkG88hPcOLYAYDEkwJRHc3B0NFdGiJgNbDR2LiL82fxOr1syNo06HScWMY
         rVew==
X-Gm-Message-State: AOJu0YwAiqeC80CH9lzJs60Ft0tIeeuL39/sBEU8jNtnuLIxbPJhcroZ
	QtskF/xNJkXVKLw4GaC8L8meeS3f4KYMyKxOyNkxIQkTwHCRhSgAXWWA9kYCi1rs7srn+l7GU/P
	LzqJcKz5WCU8ZVVz9ArenWnb7t9dllnp6VAz5NB9Upm6kAdm2iXc1Y05fuwdbKQQeVcLFfHcjsl
	Mj
X-Gm-Gg: Acq92OGKm1RCNf3N0Xpgm9HaGpS8jyJfWte2bLohq7V1Wantdai3OCsNqVda57/7O3M
	lHxAi2urL9UJBIVWY5Mv5QXZx4Rc1Tpn+bSeve0QWMaAYNYFmcR7BI6+kOULi3jg4/vfgXEZ+Cy
	XLiV589c5yKn0lFfJOg22VCK7pdxg/bey5OLOPBCa5JpjVnuH+wQh/630q1xyn0HLrYuiQDZRCv
	SDKIF01wD4Kpk37T9bJOWadu9V6Jy4NbUAwC3H6rAaUxOFnBi9TCUTsN/CcVrEgSIe/GQs0mT/m
	WkZUGx4nom3/AtvKtVtROrVaH9hiyqROW+wsqlya1xijdWchR9qhyh1gUn2WpCwW7h4dA5TgTa/
	FQ9DGRx9+xaVcS0i8kUoAr8AulYU8cOIzy0zSDKbesTsCoXznYqzC2QWeqD6Uer/Mw5vgnw==
X-Received: by 2002:a05:7022:3d03:b0:137:fccb:8105 with SMTP id a92af1059eb24-137fccb874bmr1240775c88.4.1780536812754;
        Wed, 03 Jun 2026 18:33:32 -0700 (PDT)
X-Received: by 2002:a05:7022:3d03:b0:137:fccb:8105 with SMTP id a92af1059eb24-137fccb874bmr1240753c88.4.1780536812222;
        Wed, 03 Jun 2026 18:33:32 -0700 (PDT)
Received: from [169.254.0.3] (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-137f553ab33sm2870659c88.10.2026.06.03.18.33.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Jun 2026 18:33:31 -0700 (PDT)
From: Matthew Leung <matthew.leung@oss.qualcomm.com>
Date: Thu, 04 Jun 2026 01:33:00 +0000
Subject: [PATCH v2 06/10] phy: qcom-qmp: qserdes-com: Add v10.60 register
 offsets
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260604-hawi-phy-pcie-v2-6-be908d3560db@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1780536795; l=3662;
 i=matthew.leung@oss.qualcomm.com; s=20260428; h=from:subject:message-id;
 bh=l+CJCriIHCqSTKfqB3yNlnKfu4zi16GuU5MaRzEG1I0=;
 b=MZm+aCncu38l+zWUIRpDRU+AV8Fc8rZFnCkg0kLRYsteagLM9JX74qo6PlV7Ncy//w34KX7c7
 vs3Cw7kKTEuAlX7R+I2mFDrbUPDE0mkZQGyKLsEJ6xdTvZ1JDwNBEQQ
X-Developer-Key: i=matthew.leung@oss.qualcomm.com; a=ed25519;
 pk=aT25ggJo5PMHLN9N+TsZ3s/BVU++kEYuiFebPWe21+o=
X-Proofpoint-GUID: bQhDkT3u02ggN5rSEFaMio9KO0nw3iXY
X-Authority-Analysis: v=2.4 cv=XK0AjwhE c=1 sm=1 tr=0 ts=6a20d5ed cx=c_pps
 a=bS7HVuBVfinNPG3f6cIo3Q==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=MN0C-abDVP1yrleAEAUA:9 a=QEXdDO2ut3YA:10
 a=vBUdepa8ALXHeOFLBtFW:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA0MDAxMiBTYWx0ZWRfX8kYOXaiK/JCQ
 1EmZekFmARsa0IOmtCr2oIYYHheOIH3xBEWrbyKO1tpgU9Utb7WqTKI2kFKFz+CPPUtx4kAxrRt
 EmbEEUKPa0dJRZ+H6TCNRwKvaDaZxp3x3HQbBl9ENq0UMGOKW0AB/FiEpa3mEvXa/TvUSylm1Yo
 TFtRpzr/oqGseo3xM4YNRSL2nQUlK2ax/9PCNKQdIdn1qg1UTtGyU6NHRHgTaiAWThE5ljjlaK8
 3ZoN7H3MHmvWGNqo4HEJPJryc59g0nXAKeTRZYuY3VnvUvNf+hIVRZ1w702WkD4YRFb/e0pQ2e+
 rieKRbrUkf82ZdT0HXYfuifKzJhQRp8B/ziVX4GL2devltjMuksoMeTgyW4bWkkwHY/ghjZY9Q6
 JfvsagUWuu5sqyNtGl0u6u6fHxL0DRStlzO10cs2K8D2mijZ0vKRNooZzPPQAAmMwQAODaY9RXb
 rMF83IeWzIp1Gx02VsQ==
X-Proofpoint-ORIG-GUID: bQhDkT3u02ggN5rSEFaMio9KO0nw3iXY
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-04_01,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 adultscore=0 priorityscore=1501 bulkscore=0 suspectscore=0
 phishscore=0 malwarescore=0 spamscore=0 lowpriorityscore=0 impostorscore=0
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
	TAGGED_FROM(0.00)[bounces-111096-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:email,qualcomm.com:dkim,vger.kernel.org:from_smtp];
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
X-Rspamd-Queue-Id: F330063C3B2

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


