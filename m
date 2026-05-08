Return-Path: <linux-arm-msm+bounces-106752-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cN2jCVpy/mmhqwAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-106752-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sat, 09 May 2026 01:31:38 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id B74B24FCBED
	for <lists+linux-arm-msm@lfdr.de>; Sat, 09 May 2026 01:31:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id C1827301C3D7
	for <lists+linux-arm-msm@lfdr.de>; Fri,  8 May 2026 23:31:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 67B7F363C5F;
	Fri,  8 May 2026 23:31:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="bctKZUFf";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="HbbE4RKD"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B264336073E
	for <linux-arm-msm@vger.kernel.org>; Fri,  8 May 2026 23:31:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778283088; cv=none; b=gs6FXhFE3qZuwYQF0zpic6ayAON4P4NPP77mM7OZD2hsXDiJ3MWAW1z2d+3Dio9DSnSZiM6hQI8IY9tG0NM9WbugVAvkINDKDaF5q63VHFrv9qB9zKa0CaLyeh2b9osFupXd9rIL6/i93EMTKLnkU0OkwpR8PdW8GF8CVokkONk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778283088; c=relaxed/simple;
	bh=mETc0jlTLmI462gvqIk7CFJGzUvc8N7VZDu2GYCH5bo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=edP/mQ98OZ6YNnpFwUaYpyX3O3+YDYdSs1LZs3pzJHU/JVWGYLPzYeMso5DI5pszQwteQrJ75faRohV90wl0u+yyxu9R58eJoP+U09OeznwL2mgadD559gjwYL0mpdVtNRxguFH4mK6zVYutGN5B1IY7BYhmhPFQiyVyUcs+0YA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=bctKZUFf; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=HbbE4RKD; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 648GTf3R145193
	for <linux-arm-msm@vger.kernel.org>; Fri, 8 May 2026 23:31:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Venx6RUzjC9wNNihizVrtl+8Lnx8Pg3T1wsMj8jld8A=; b=bctKZUFfl0+5FwOe
	8FF5mrcEf65PDXJnOwmzeY2SPTTQ0yBrQTrmAQlKk3rBs75KqvQKNO/Us3R1ZYFZ
	9QuHg1caQWqfveagezvQPHKPmcG5yMWVli60F6Cn+Yk+54kj4a9AEBLOMvu+7jC4
	lgibTQuF5iuys7k6ocKUgQ3E2yhtYz2bf9zZLbfw2SLyFbw60bMVThm0cBmrbqmE
	4uJ40XVJAETLcX24E5fR33LhOkCnJrBrrMQfYiEC/AZonXnOTZNMt8w1H8Yr8CSP
	EKrpOIGYy3ucCcS62wusj79HnEPTpj9easejS8+SFgzZoLgpQROw3z+618/JM9sJ
	Jr/XtA==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e1kdc16pf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 08 May 2026 23:31:26 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-2cc75e79b97so208810eec.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 08 May 2026 16:31:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778283085; x=1778887885; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Venx6RUzjC9wNNihizVrtl+8Lnx8Pg3T1wsMj8jld8A=;
        b=HbbE4RKDaRz6/Jyq3b+kRNfocTzQv/TW8c+4kH57lXO8UbfML4XLT6EPCWb5BF7G9N
         oRAg2P7rxQgs3G732Ekq4IVlRs2+I6pF8CZeN1J5MF1spDzXVF6S3XyWx/lJ/Q4pxsrM
         HBEowUheQ/KgRZ5pdBK8hG4IL0KCRv0EXDjZTcF8UYv7xBV65kdx/mfgeVC3Fu6y2Opl
         /Rk8SjN/N6U+KCJVABTmhxP8s0e3biTkrRI4FQDDLVMOuwbJBN/S01M0EqFwmIt592IK
         yYgZX1Y8JaknoJGLMuNKKlD5QSv+QELtTGeKYsHzWntdzRKSqXIDFkab98LU7PHKDk5Q
         5A+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778283085; x=1778887885;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Venx6RUzjC9wNNihizVrtl+8Lnx8Pg3T1wsMj8jld8A=;
        b=H/znOFjcwZj+8Ma/t6pSuOp1R1rapK5aLxJY9QjXb5jIsefVfOVyCps9QN//kNipkd
         jJWTiMTmnO0se+5yrwxJ2RxNelfuASTRUejGCXeicVLpniDr8LmSMkluUeVlZuJE+nrr
         z7FKmnogJBUaDGGpJdwFoZRRsaue6BZDTiyPw01hn0AIZP3cMWmPqp4Nowq0Pw93ktkE
         pmPgh1ID30mVyTy38mE77edqjPt/Ua+noYs/qN9KknjqyyjElBsWiSKxT5ILeGoS2qIX
         LmPP+kbj7ZyHnVgIDZkPhsA/ct/T9yVlMr8bvlEblo89rooPWtxz8M33hZugz94RaXmB
         0ajA==
X-Gm-Message-State: AOJu0YwJJJrjE243+qjyQBvHZZbq86PI1jJ7VF5huF1HDir/WsWxr9Xs
	mosgav7W7f69p9LeSQ/zyXsz0KCfy/SYC4SOxcajq7xX8QNSXQqdJ18sB3hwKsa6R27AAAkcxxg
	OSnD153qSCGqX6TEpPKbS3poFpyMtfQBQztZgWl8JPyrTOG3ZD3Ckp/587MEDdZMa2AsQ
X-Gm-Gg: Acq92OGQOE6y9kf1Xt004jyMs4zoX7EXdBauaMW+4CNcLQMoHfrDBfrFowWY5BBip22
	/Xy+3Y+3rdFm4p+EDXCI9A7yYE8WJeRjH1AMgeTLi7ifdKEvj2AXjzkBaPRPMA/KK+jCeEUSoX7
	huAzRh6s20KcMDFqP2JrRB7KlE8jNa0nInkbQ0/s9iCS3WRaOSF/D/hWr/licsQm7DfPM3fCA/l
	fvVJ1xyiKn4YXPBaJlJfki9FVdn9/KKXxg7uqdco3UdCdthUJz6xQ32Xk7fMyi8IUU3mCbobVnm
	GrAaMXSYXQEHqaavyasxTiaSEo2KtOig6PcZvlvavxtQWXU1H5ATSwB4D5iTOmGlB8voeULDlH1
	npo7B8j+w5UwUAWo4km8tiaJ5pydu3VNWAOzRjoquW7tt2ugCsSlSNESlL/g=
X-Received: by 2002:a05:7300:a987:b0:2f2:8857:1804 with SMTP id 5a478bee46e88-2f54b35fffdmr7390230eec.9.1778283085352;
        Fri, 08 May 2026 16:31:25 -0700 (PDT)
X-Received: by 2002:a05:7300:a987:b0:2f2:8857:1804 with SMTP id 5a478bee46e88-2f54b35fffdmr7390199eec.9.1778283084840;
        Fri, 08 May 2026 16:31:24 -0700 (PDT)
Received: from [169.254.0.3] (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2f88885b87dsm5033122eec.21.2026.05.08.16.31.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 May 2026 16:31:24 -0700 (PDT)
From: Matthew Leung <matthew.leung@oss.qualcomm.com>
Date: Fri, 08 May 2026 23:31:17 +0000
Subject: [PATCH 02/10] phy: qcom-qmp: qserdes-com: Add v10 register offsets
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260508-hawi-phy-pcie-v1-2-237b894353fc@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1778283082; l=3231;
 i=matthew.leung@oss.qualcomm.com; s=20260428; h=from:subject:message-id;
 bh=mETc0jlTLmI462gvqIk7CFJGzUvc8N7VZDu2GYCH5bo=;
 b=v5DlRytjlARifsmpU+0dJhbC+fvglCoGZZe8O/SeNIVZ9AHNC9kapnpc0TafHv86LhYiamYAr
 sSSOztczabKC07IZ7091Sh2O7+gsKeIAF/VGIb87F1uXqU1TvxgLxx6
X-Developer-Key: i=matthew.leung@oss.qualcomm.com; a=ed25519;
 pk=aT25ggJo5PMHLN9N+TsZ3s/BVU++kEYuiFebPWe21+o=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA4MDIzMiBTYWx0ZWRfXzUpg+QabfccO
 /nBygZbzFcpAxW5kPqdTkra/na+HdBNjKms67pT57G8mPloxhFW6tbdrCksT9oD3eN+W/LOUnYs
 9U2Fd/1fLFOGisT+0xRBd2oMEtdixvjIjN46Shta/71iHoKSUZZliQuWv5DnH2J1URzkQO7/hCR
 1Heh00gg+OztgkH2WWOcv4M+xBBELzbh5XdA+Eqn7ePWX16B0OQAzPyGH8+5OTJ8frN4n/wJ+SL
 X8Qqt3Z2ujgeYVKhA9nYUZjAgBfDTocyVm1IzJ0VCV9jAKTbf0N4co0e9AYrXKTBoDfS4XF7LET
 P7WA5xy9d6PdNEURSgSeKYS5dOi8IRyPJrqAeX51qjk/khVanN8JnDFzzdfWp9bF0eJQ55Z7PVy
 rTZ05UbgyQzhYo+KWyt25uMgKsRVi0R3XuqC4euh5Vh0w2ZGRmvRvc8y6pMWUI+vl5mlzMPtqjX
 KYAmY+Qdkp7x6aRKHgQ==
X-Authority-Analysis: v=2.4 cv=RZOgzVtv c=1 sm=1 tr=0 ts=69fe724e cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=MN0C-abDVP1yrleAEAUA:9 a=QEXdDO2ut3YA:10
 a=6Ab_bkdmUrQuMsNx7PHu:22
X-Proofpoint-GUID: 0kSiWaG-O4eOL7LRB3gHqV9FLToQHsUE
X-Proofpoint-ORIG-GUID: 0kSiWaG-O4eOL7LRB3gHqV9FLToQHsUE
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-07_02,2026-05-08_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 bulkscore=0 suspectscore=0 impostorscore=0 malwarescore=0
 adultscore=0 phishscore=0 spamscore=0 priorityscore=1501 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2605080232
X-Rspamd-Queue-Id: B74B24FCBED
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
	TAGGED_FROM(0.00)[bounces-106752-lists,linux-arm-msm=lfdr.de];
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

Hawi SoC uses v10 register definitions for PCIe Gen3 x2. Add the new
QSERDES-COM offsets in a dedicated header file.

Signed-off-by: Matthew Leung <matthew.leung@oss.qualcomm.com>
---
 .../phy/qualcomm/phy-qcom-qmp-qserdes-com-v10.h    | 49 ++++++++++++++++++++++
 drivers/phy/qualcomm/phy-qcom-qmp.h                |  2 +
 2 files changed, 51 insertions(+)

diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-qserdes-com-v10.h b/drivers/phy/qualcomm/phy-qcom-qmp-qserdes-com-v10.h
new file mode 100644
index 000000000000..09199e7b4aac
--- /dev/null
+++ b/drivers/phy/qualcomm/phy-qcom-qmp-qserdes-com-v10.h
@@ -0,0 +1,49 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ */
+
+#ifndef QCOM_PHY_QMP_QSERDES_COM_V10_H_
+#define QCOM_PHY_QMP_QSERDES_COM_V10_H_
+
+/* Only for QMP V10 PHY - QSERDES COM registers */
+#define QSERDES_V10_COM_SSC_STEP_SIZE1_MODE1		0x00
+#define QSERDES_V10_COM_SSC_STEP_SIZE2_MODE1		0x04
+#define QSERDES_V10_COM_CP_CTRL_MODE1			0x10
+#define QSERDES_V10_COM_PLL_RCTRL_MODE1			0x14
+#define QSERDES_V10_COM_PLL_CCTRL_MODE1			0x18
+#define QSERDES_V10_COM_CORECLK_DIV_MODE1		0x1c
+#define QSERDES_V10_COM_LOCK_CMP1_MODE1			0x20
+#define QSERDES_V10_COM_LOCK_CMP2_MODE1			0x24
+#define QSERDES_V10_COM_DEC_START_MODE1			0x28
+#define QSERDES_V10_COM_DIV_FRAC_START1_MODE1		0x30
+#define QSERDES_V10_COM_DIV_FRAC_START2_MODE1		0x34
+#define QSERDES_V10_COM_DIV_FRAC_START3_MODE1		0x38
+#define QSERDES_V10_COM_HSCLK_SEL_1			0x3c
+#define QSERDES_V10_COM_SSC_STEP_SIZE1_MODE0		0x60
+#define QSERDES_V10_COM_SSC_STEP_SIZE2_MODE0		0x64
+#define QSERDES_V10_COM_CP_CTRL_MODE0			0x70
+#define QSERDES_V10_COM_PLL_RCTRL_MODE0			0x74
+#define QSERDES_V10_COM_PLL_CCTRL_MODE0			0x78
+#define QSERDES_V10_COM_LOCK_CMP1_MODE0			0x80
+#define QSERDES_V10_COM_LOCK_CMP2_MODE0			0x84
+#define QSERDES_V10_COM_DEC_START_MODE0			0x88
+#define QSERDES_V10_COM_DIV_FRAC_START1_MODE0		0x90
+#define QSERDES_V10_COM_DIV_FRAC_START2_MODE0		0x94
+#define QSERDES_V10_COM_DIV_FRAC_START3_MODE0		0x98
+#define QSERDES_V10_COM_BG_TIMER			0xbc
+#define QSERDES_V10_COM_SSC_EN_CENTER			0xc0
+#define QSERDES_V10_COM_SSC_PER1			0xcc
+#define QSERDES_V10_COM_SSC_PER2			0xd0
+#define QSERDES_V10_COM_CLK_ENABLE1			0xe0
+#define QSERDES_V10_COM_SYS_CLK_CTRL			0xe4
+#define QSERDES_V10_COM_PLL_IVCO			0xf4
+#define QSERDES_V10_COM_SYSCLK_EN_SEL			0x110
+#define QSERDES_V10_COM_LOCK_CMP_EN			0x120
+#define QSERDES_V10_COM_VCO_TUNE_MAP			0x140
+#define QSERDES_V10_COM_CLK_SELECT			0x164
+#define QSERDES_V10_COM_CORE_CLK_EN			0x170
+#define QSERDES_V10_COM_CMN_CONFIG_1			0x174
+#define QSERDES_V10_COM_ADDITIONAL_MISC_3		0x1bc
+
+#endif
diff --git a/drivers/phy/qualcomm/phy-qcom-qmp.h b/drivers/phy/qualcomm/phy-qcom-qmp.h
index a873bdd7bffe..3ac5af7cde6a 100644
--- a/drivers/phy/qualcomm/phy-qcom-qmp.h
+++ b/drivers/phy/qualcomm/phy-qcom-qmp.h
@@ -39,6 +39,8 @@
 #include "phy-qcom-qmp-qserdes-txrx-v8.h"
 #include "phy-qcom-qmp-qserdes-lalb-v8.h"
 
+#include "phy-qcom-qmp-qserdes-com-v10.h"
+
 #include "phy-qcom-qmp-qserdes-pll.h"
 
 #include "phy-qcom-qmp-pcs-v2.h"

-- 
2.34.1


