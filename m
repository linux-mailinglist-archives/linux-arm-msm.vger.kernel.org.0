Return-Path: <linux-arm-msm+bounces-112420-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id XOMkNKdJKWrsTgMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-112420-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 10 Jun 2026 13:25:27 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E3A9668C0E
	for <lists+linux-arm-msm@lfdr.de>; Wed, 10 Jun 2026 13:25:27 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b="T/IFvYT5";
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=gsp+gEqI;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-112420-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c09:e001:a7::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-112420-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 474CC313D9FE
	for <lists+linux-arm-msm@lfdr.de>; Wed, 10 Jun 2026 11:17:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7E5F7405C21;
	Wed, 10 Jun 2026 11:16:39 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B90953FFFBE
	for <linux-arm-msm@vger.kernel.org>; Wed, 10 Jun 2026 11:16:32 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781090199; cv=none; b=KKaRd+yEM2jarVtkLmDNf9xuTvO9fa+c9bGDHDCFt/4JEf9jhbepPqHIctwa8jesZ1EYRyDV5tz7NSNisBYin4PKz7vT4gkWVlAUvGaKbCi4UVjyQvTHoHlAacLJ5Z54qswqv7yAnLBMQfugk03QzWuj6UrG6E60bEf6ngC+Eg8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781090199; c=relaxed/simple;
	bh=xez8sZ9RBjardGyxwof/z6L+iBEeg8HWFEWtgvkHEJU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=SmfMu5kYq+PB1LECB0uYb+78N4Mog9npETRvnSkDIiNGZn0hZHA7GvVwrLLxoT+i3NzWcnhCTq1vHIkQ2MHE/ccwHzMrOe/RIbYahggeUGU4MxykbFBAV3tXe6vW3KECW/BLjEyLZIyhIjwa91P4K30TJSohCyX1IwFsjMw0Pqc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=T/IFvYT5; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=gsp+gEqI; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65A7htqW531342
	for <linux-arm-msm@vger.kernel.org>; Wed, 10 Jun 2026 11:16:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	S8AvQbz0GUV2gYsPFulvrX90R4zhqqBfaHsXuKf+vhg=; b=T/IFvYT5yr4vYmNm
	3LSihRgLzLXWcnDbTvb1WT146lRi7YCqmRNMbTEkrJhFNhjguvHrKPG/E0KibUVS
	jEzXZE/YeJlR83hE4fOt/oL/EbIMP8K/4Rlcen42onuM00iGqD1V5J85tPws23Mk
	qBPbnov31sKijbzwMEJfCdru4Fa1Z2liaNfV/r4LX9nL2oZZHH5adQePGrL2LUu0
	RDfaornDv3th34jR0NAt/UCJsrwctxeqQ4JqQDF9t4DHxSP3Q+7BKcm5EPb2qbUe
	qB4bHNFfv2kOzVmqQsinDe/QVtjMQ5wc+I0RQAUKfK9CPxy6aEpzfZjhhpl1jwKK
	DRK4KQ==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4epwnh27fq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 10 Jun 2026 11:16:31 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-c858e0cbc89so3771764a12.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 10 Jun 2026 04:16:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781090191; x=1781694991; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=S8AvQbz0GUV2gYsPFulvrX90R4zhqqBfaHsXuKf+vhg=;
        b=gsp+gEqIJQM8iBV8Wu544A1RYe7C8UVnwWP2UxEMyZ6nKUM4J4M85rPnuUOT7gam2B
         GnDVirEFNPpAxmSPuZrfGlYZazls7qjPU/QCRKyLJRUVcvXtG2BrWssmDbzVxu1NB5Gb
         RnVU6JShVdIt1rOLCYvx8YnUHok80rgOi+PCQ+Mzzn3QS77GIvLu/oBltmnTGiLI3YKC
         hBvwnknzJ6qHxEuej7D8ZzKjWcP+6wkaCY+br9iGeGOwRzyQFjEWokGu3Ruh1hSad0e9
         RO1Nugwc0eWp8tGJ6c6uIs4m6fmnHOXBSZ+8FxPx1ZvqUenZlnB+swPzzHAQw1cQHLJB
         jo8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781090191; x=1781694991;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=S8AvQbz0GUV2gYsPFulvrX90R4zhqqBfaHsXuKf+vhg=;
        b=kNC5FrTLNZXncQn+eFJqOt3ZUrUv72nlv+pT3zCD6blsOZgQdyBahij4gfR2zAO0uq
         64n1w9raTGcAB+mt56AMuk6sdMFGQz7xw92JueKA9coZXQjIubn8oyguRXtpHt4JunJ8
         P7gkeTOd+kRD+0kEHcK5f+z7gN2Ty4NljSto9ffs6UBNx1Kjzm3pRmkeyV2WkGWQ0D2y
         CLnUJ69WeZIbG415ihh0Y0EuTvca81LjwBGQSTtWbd3wcpvvbP207HL7fxe/6g1V31n/
         7NDwXJVfRCrp416MPqOpMxlmATGszIe/1yr4PQ7ffuTvKS02ah7t7rQwE7rPx56nQhaD
         AXNA==
X-Gm-Message-State: AOJu0YxA5tfq8X26aELldZZPRXmd2UmiC0LgeENWA3d8zq4nX5TLQzQc
	5pNcKigGbTHeEPdLUU+h9A53zjLrJ1Bj0NFo9w2ZzHTPjigMb+oHd4/rzcuH4O5mqWI3K8NNMbj
	sYGOt/f778EtStssLpzUBoJYlQqeWCCPna4kju2HJVKEzbCRZF2ThQ5vWZtecUKeyo5iS
X-Gm-Gg: Acq92OFSIK4snbirtCwEnvvrl5bpGCrcC9Gu2xgNpzLDuH3HZIL8s61g3rE2Hndi3Os
	c8KH1oqQoJAV6wha/75S3AvZYbOvvvYvwyvaCI2KNXSSLvyDgMeH5IjNjyHy/5KIPejAFTfE+nR
	+3FN1aGcPAVb1Gqurixa7WtsKe2FRq3KyTPyFVw9Q+jQ9mgfgu+j0jlNJbx4liRmpdRvxvJamQx
	nT/j6h3FBexL4+skhXKNMrD6Jc/APE+sDce+MoFAgzyoIaiCmJXvySMFra6eAh1cYQK48rAifnq
	VOn925ItfxZjHeMZnWad4yE/yMAxcU3xpMKv6qUt6j82/PING5t62q2XoXInc6xeZTCM+76mz2x
	Q2yNnFZC1YKnFdWxDuYbZlRq5SQ8dGAQ0Hy33OfqsKOs9TOR9LGYNc/D1F2DcZa045TVofOhbxI
	H/BcjY4Y2j9nKdru7q09hdgObzeBQ19BLmxYibs9z9hPC+dMLYEf66EZszZclyCA==
X-Received: by 2002:a05:6a20:3d0e:b0:39b:87f0:758e with SMTP id adf61e73a8af0-3b4cccfdd99mr31753462637.8.1781090191193;
        Wed, 10 Jun 2026 04:16:31 -0700 (PDT)
X-Received: by 2002:a05:6a20:3d0e:b0:39b:87f0:758e with SMTP id adf61e73a8af0-3b4cccfdd99mr31753403637.8.1781090190624;
        Wed, 10 Jun 2026 04:16:30 -0700 (PDT)
Received: from hu-varada-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c85df03498csm23896099a12.1.2026.06.10.04.16.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Jun 2026 04:16:30 -0700 (PDT)
From: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
Date: Wed, 10 Jun 2026 16:46:09 +0530
Subject: [PATCH v3 2/2] phy: qcom-qmp-pcie: Add support for ipq5210 PCIe
 phys
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260610-pcie-phy-v3-2-334011b378d6@oss.qualcomm.com>
References: <20260610-pcie-phy-v3-0-334011b378d6@oss.qualcomm.com>
In-Reply-To: <20260610-pcie-phy-v3-0-334011b378d6@oss.qualcomm.com>
To: Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjEwMDEwNyBTYWx0ZWRfXwh0SecvVBxD/
 Nku4LusjubEW3uDEZl5JFhvW2dIPF6FrggcUFV1BtkAgGCy2FsuTrnOMWOcKTR9yeQLkV/iFSl4
 Avf+I+T2BQ2HqgDAZIp96t2hp7SNZeP2J0APb1p4x+arzun08q8sekm25WheOzH5LBmcNudwZ0r
 52i6cdjrY/d1yG/xIgHvBRN8PZ8SxZ3LH+GZzxR79FKsxV0nLxu5MZY5X0s288sggpz+DMEamcY
 hY1Y9w6WaiV1Q3PyVFWEbg9kOpSY//iQtDT6cD+keoLwKOEjQdMJkCKNvN5of1anT0uppS5Prci
 9k06+HlNXqceyhcUqIDHHSnUF0oqNqadu5psrQnszEwbkmA55rc/QzdR2alY3cX9RbE6vTaa/3m
 AweJyrhpXYYnjNsJMPkFahTK9mWpKJhQfnAy9m3YlE+A+mB5RyyPwWQrRmo2cQmcrZuBDWUYvey
 ZlgvGNULeg2JlPfjNzg==
X-Authority-Analysis: v=2.4 cv=Xce5Co55 c=1 sm=1 tr=0 ts=6a29478f cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=lQuujfteSIboIXYB3dUA:9 a=QEXdDO2ut3YA:10
 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-ORIG-GUID: ap32U6z_4BCGHOZwKJme5TwvXs_TzV90
X-Proofpoint-GUID: ap32U6z_4BCGHOZwKJme5TwvXs_TzV90
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-10_02,2026-06-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 malwarescore=0 impostorscore=0 adultscore=0
 priorityscore=1501 lowpriorityscore=0 suspectscore=0 bulkscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606100107
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-112420-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo];
	FORGED_RECIPIENTS(0.00)[m:vkoul@kernel.org,m:neil.armstrong@linaro.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-phy@lists.infradead.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:varadarajan.narayanan@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[varadarajan.narayanan@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[varadarajan.narayanan@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 6E3A9668C0E

Add support for a PCIe phys found on Qualcomm ipq5210 platform.

Signed-off-by: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
---
 drivers/phy/qualcomm/phy-qcom-qmp-pcie.c | 129 +++++++++++++++++++++++++++++++
 1 file changed, 129 insertions(+)

diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-pcie.c b/drivers/phy/qualcomm/phy-qcom-qmp-pcie.c
index 75afbd15aaf4..2bf00e0e125a 100644
--- a/drivers/phy/qualcomm/phy-qcom-qmp-pcie.c
+++ b/drivers/phy/qualcomm/phy-qcom-qmp-pcie.c
@@ -514,6 +514,89 @@ static const struct qmp_phy_init_tbl ipq8074_pcie_gen3_pcs_misc_tbl[] = {
 	QMP_PHY_INIT_CFG(QPHY_V4_PCS_PCIE_ENDPOINT_REFCLK_DRIVE, 0xc1),
 };
 
+static const struct qmp_phy_init_tbl ipq5210_gen3x1_pcie_ep_serdes_tbl[] = {
+	QMP_PHY_INIT_CFG(QSERDES_PLL_BG_TIMER, 0x02),
+	QMP_PHY_INIT_CFG(QSERDES_PLL_BIAS_EN_CLKBUFLR_EN, 0x18),
+	QMP_PHY_INIT_CFG(QSERDES_PLL_SYSCLK_BUF_ENABLE, 0x07),
+	QMP_PHY_INIT_CFG(QSERDES_PLL_PLL_IVCO, 0x0f),
+	QMP_PHY_INIT_CFG(QSERDES_PLL_LOCK_CMP1_MODE0, 0xff),
+	QMP_PHY_INIT_CFG(QSERDES_PLL_LOCK_CMP2_MODE0, 0x04),
+	QMP_PHY_INIT_CFG(QSERDES_PLL_LOCK_CMP1_MODE1, 0xff),
+	QMP_PHY_INIT_CFG(QSERDES_PLL_LOCK_CMP2_MODE1, 0x09),
+	QMP_PHY_INIT_CFG(QSERDES_PLL_BG_TRIM, 0x0f),
+	QMP_PHY_INIT_CFG(QSERDES_PLL_CP_CTRL_MODE0, 0x23),
+	QMP_PHY_INIT_CFG(QSERDES_PLL_CP_CTRL_MODE1, 0x23),
+	QMP_PHY_INIT_CFG(QSERDES_PLL_PLL_RCTRL_MODE0, 0x10),
+	QMP_PHY_INIT_CFG(QSERDES_PLL_PLL_RCTRL_MODE1, 0x10),
+	QMP_PHY_INIT_CFG(QSERDES_PLL_PLL_CCTRL_MODE0, 0x01),
+	QMP_PHY_INIT_CFG(QSERDES_PLL_PLL_CCTRL_MODE1, 0x01),
+	QMP_PHY_INIT_CFG(QSERDES_PLL_BIAS_EN_CTRL_BY_PSM, 0x01),
+	QMP_PHY_INIT_CFG(QSERDES_PLL_SYSCLK_EN_SEL, 0x00),
+	QMP_PHY_INIT_CFG(QSERDES_PLL_RESETSM_CNTRL, 0x20),
+	QMP_PHY_INIT_CFG(QSERDES_PLL_LOCK_CMP_EN, 0x42),
+	QMP_PHY_INIT_CFG(QSERDES_PLL_DEC_START_MODE0, 0x19),
+	QMP_PHY_INIT_CFG(QSERDES_PLL_DEC_START_MODE1, 0x14),
+	QMP_PHY_INIT_CFG(QSERDES_PLL_INTEGLOOP_GAIN0_MODE0, 0xfe),
+	QMP_PHY_INIT_CFG(QSERDES_PLL_INTEGLOOP_GAIN1_MODE0, 0x03),
+	QMP_PHY_INIT_CFG(QSERDES_PLL_INTEGLOOP_GAIN0_MODE1, 0xfe),
+	QMP_PHY_INIT_CFG(QSERDES_PLL_INTEGLOOP_GAIN1_MODE1, 0x03),
+	QMP_PHY_INIT_CFG(QSERDES_PLL_VCO_TUNE1_MODE0, 0x24),
+	QMP_PHY_INIT_CFG(QSERDES_PLL_VCO_TUNE2_MODE0, 0x02),
+	QMP_PHY_INIT_CFG(QSERDES_PLL_VCO_TUNE1_MODE1, 0xb4),
+	QMP_PHY_INIT_CFG(QSERDES_PLL_VCO_TUNE2_MODE1, 0x03),
+	QMP_PHY_INIT_CFG(QSERDES_PLL_HSCLK_SEL, 0x01),
+	QMP_PHY_INIT_CFG(QSERDES_PLL_CORE_CLK_EN, 0x00),
+	QMP_PHY_INIT_CFG(QSERDES_PLL_CMN_CONFIG, 0x06),
+	QMP_PHY_INIT_CFG(QSERDES_PLL_SVS_MODE_CLK_SEL, 0x05),
+	QMP_PHY_INIT_CFG(QSERDES_PLL_CORECLK_DIV_MODE1, 0x08),
+	QMP_PHY_INIT_CFG(QSERDES_PLL_SYS_CLK_CTRL, 0x07),
+	QMP_PHY_INIT_CFG(QSERDES_PLL_SYSCLK_EN_SEL, 0x10),
+};
+
+static const struct qmp_phy_init_tbl ipq5210_gen3x1_pcie_ep_rx_tbl[] = {
+	QMP_PHY_INIT_CFG(QSERDES_V4_RX_UCDR_FO_GAIN, 0x0c),
+	QMP_PHY_INIT_CFG(QSERDES_V4_RX_UCDR_SO_GAIN, 0x02),
+	QMP_PHY_INIT_CFG(QSERDES_V4_RX_UCDR_SO_SATURATION_AND_ENABLE, 0x7f),
+	QMP_PHY_INIT_CFG(QSERDES_V4_RX_UCDR_PI_CONTROLS, 0x70),
+	QMP_PHY_INIT_CFG(QSERDES_V4_RX_RX_EQU_ADAPTOR_CNTRL2, 0x61),
+	QMP_PHY_INIT_CFG(QSERDES_V4_RX_RX_EQU_ADAPTOR_CNTRL3, 0x04),
+	QMP_PHY_INIT_CFG(QSERDES_V4_RX_RX_EQU_ADAPTOR_CNTRL4, 0x1e),
+	QMP_PHY_INIT_CFG(QSERDES_V4_RX_RX_IDAC_TSETTLE_LOW, 0xc0),
+	QMP_PHY_INIT_CFG(QSERDES_V4_RX_RX_IDAC_TSETTLE_HIGH, 0x00),
+	QMP_PHY_INIT_CFG(QSERDES_V4_RX_RX_EQ_OFFSET_ADAPTOR_CNTRL1, 0x73),
+	QMP_PHY_INIT_CFG(QSERDES_V4_RX_RX_OFFSET_ADAPTOR_CNTRL2, 0x80),
+	QMP_PHY_INIT_CFG(QSERDES_V4_RX_SIGDET_ENABLES, 0x03),
+	QMP_PHY_INIT_CFG(QSERDES_V4_RX_SIGDET_DEGLITCH_CNTRL, 0x14),
+	QMP_PHY_INIT_CFG(QSERDES_V4_RX_RX_MODE_00_LOW, 0xf0),
+	QMP_PHY_INIT_CFG(QSERDES_V4_RX_RX_MODE_00_HIGH, 0x01),
+	QMP_PHY_INIT_CFG(QSERDES_V4_RX_RX_MODE_00_HIGH2, 0x2f),
+	QMP_PHY_INIT_CFG(QSERDES_V4_RX_RX_MODE_00_HIGH3, 0xd3),
+	QMP_PHY_INIT_CFG(QSERDES_V4_RX_RX_MODE_00_HIGH4, 0x40),
+	QMP_PHY_INIT_CFG(QSERDES_V4_RX_RX_MODE_01_LOW, 0x01),
+	QMP_PHY_INIT_CFG(QSERDES_V4_RX_RX_MODE_01_HIGH, 0x02),
+	QMP_PHY_INIT_CFG(QSERDES_V4_RX_RX_MODE_01_HIGH2, 0xc8),
+	QMP_PHY_INIT_CFG(QSERDES_V4_RX_RX_MODE_01_HIGH3, 0x09),
+	QMP_PHY_INIT_CFG(QSERDES_V4_RX_RX_MODE_01_HIGH4, 0xb1),
+	QMP_PHY_INIT_CFG(QSERDES_V4_RX_RX_MODE_10_LOW, 0x00),
+	QMP_PHY_INIT_CFG(QSERDES_V4_RX_RX_MODE_10_HIGH, 0x02),
+	QMP_PHY_INIT_CFG(QSERDES_V4_RX_RX_MODE_10_HIGH2, 0xc8),
+	QMP_PHY_INIT_CFG(QSERDES_V4_RX_RX_MODE_10_HIGH3, 0x09),
+	QMP_PHY_INIT_CFG(QSERDES_V4_RX_RX_MODE_10_HIGH4, 0xb1),
+	QMP_PHY_INIT_CFG(QSERDES_V4_RX_DFE_EN_TIMER, 0x04),
+};
+
+static const struct qmp_phy_init_tbl ipq5210_gen3x1_pcie_ep_pcs_misc_tbl[] = {
+	QMP_PHY_INIT_CFG(QPHY_V4_PCS_PCIE_POWER_STATE_CONFIG2, 0x04),
+	QMP_PHY_INIT_CFG(QPHY_V4_PCS_PCIE_POWER_STATE_CONFIG4, 0x07),
+	QMP_PHY_INIT_CFG(QPHY_V4_PCS_PCIE_L1P1_WAKEUP_DLY_TIME_AUXCLK_L, 0x01),
+	QMP_PHY_INIT_CFG(QPHY_V4_PCS_PCIE_L1P2_WAKEUP_DLY_TIME_AUXCLK_L, 0x01),
+	QMP_PHY_INIT_CFG(QPHY_V4_PCS_PCIE_EQ_CONFIG1, 0x11),
+	QMP_PHY_INIT_CFG(QPHY_V4_PCS_PCIE_PRESET_P10_PRE, 0x00),
+	QMP_PHY_INIT_CFG(QPHY_V4_PCS_PCIE_PRESET_P10_POST, 0x58),
+	QMP_PHY_INIT_CFG(QPHY_V4_PCS_PCIE_OSC_DTCT_CONFIG1, 0x02),
+	QMP_PHY_INIT_CFG(QPHY_V4_PCS_PCIE_OSC_DTCT_CONFIG4, 0xff),
+};
+
 static const struct qmp_phy_init_tbl ipq9574_gen3x1_pcie_serdes_tbl[] = {
 	QMP_PHY_INIT_CFG(QSERDES_PLL_BIAS_EN_CLKBUFLR_EN, 0x18),
 	QMP_PHY_INIT_CFG(QSERDES_PLL_BIAS_EN_CTRL_BY_PSM, 0x01),
@@ -3613,6 +3696,49 @@ static const struct qmp_phy_cfg ipq6018_pciephy_cfg = {
 	.phy_status		= PHYSTATUS,
 };
 
+static const struct qmp_phy_cfg ipq5210_gen3x1_pciephy_cfg = {
+	.lanes			= 1,
+
+	.offsets		= &qmp_pcie_offsets_v4x1,
+
+	.tbls =  {
+		.serdes		= ipq9574_gen3x1_pcie_serdes_tbl,
+		.serdes_num	= ARRAY_SIZE(ipq9574_gen3x1_pcie_serdes_tbl),
+		.tx		= ipq8074_pcie_gen3_tx_tbl,
+		.tx_num		= ARRAY_SIZE(ipq8074_pcie_gen3_tx_tbl),
+		.rx		= ipq9574_pcie_rx_tbl,
+		.rx_num		= ARRAY_SIZE(ipq9574_pcie_rx_tbl),
+		.pcs		= ipq9574_gen3x1_pcie_pcs_tbl,
+		.pcs_num	= ARRAY_SIZE(ipq9574_gen3x1_pcie_pcs_tbl),
+		.pcs_misc	= ipq9574_gen3x1_pcie_pcs_misc_tbl,
+		.pcs_misc_num	= ARRAY_SIZE(ipq9574_gen3x1_pcie_pcs_misc_tbl),
+	},
+
+	.tbls_ep = &(const struct qmp_phy_cfg_tbls) {
+		.serdes		= ipq5210_gen3x1_pcie_ep_serdes_tbl,
+		.serdes_num	= ARRAY_SIZE(ipq5210_gen3x1_pcie_ep_serdes_tbl),
+		.tx		= ipq6018_pcie_tx_tbl,
+		.tx_num		= ARRAY_SIZE(ipq6018_pcie_tx_tbl),
+		.rx		= ipq5210_gen3x1_pcie_ep_rx_tbl,
+		.rx_num		= ARRAY_SIZE(ipq5210_gen3x1_pcie_ep_rx_tbl),
+		.pcs		= ipq6018_pcie_pcs_tbl,
+		.pcs_num	= ARRAY_SIZE(ipq6018_pcie_pcs_tbl),
+		.pcs_misc	= ipq5210_gen3x1_pcie_ep_pcs_misc_tbl,
+		.pcs_misc_num	= ARRAY_SIZE(ipq5210_gen3x1_pcie_ep_pcs_misc_tbl),
+	},
+
+	.reset_list		= ipq8074_pciephy_reset_l,
+	.num_resets		= ARRAY_SIZE(ipq8074_pciephy_reset_l),
+	.vreg_list		= NULL,
+	.num_vregs		= 0,
+	.regs			= pciephy_v4_regs_layout,
+
+	.pwrdn_ctrl		= SW_PWRDN | REFCLK_DRV_DSBL,
+	.phy_status		= PHYSTATUS,
+
+	.pipe_clock_rate	= 250000000,
+};
+
 static const struct qmp_phy_cfg ipq9574_gen3x1_pciephy_cfg = {
 	.lanes			= 1,
 
@@ -5404,6 +5530,9 @@ static const struct of_device_id qmp_pcie_of_match_table[] = {
 	}, {
 		.compatible = "qcom,glymur-qmp-gen5x4-pcie-phy",
 		.data = &glymur_qmp_gen5x4_pciephy_cfg,
+	}, {
+		.compatible = "qcom,ipq5210-qmp-gen3x1-pcie-phy",
+		.data = &ipq5210_gen3x1_pciephy_cfg,
 	}, {
 		.compatible = "qcom,ipq6018-qmp-pcie-phy",
 		.data = &ipq6018_pciephy_cfg,

-- 
2.34.1


