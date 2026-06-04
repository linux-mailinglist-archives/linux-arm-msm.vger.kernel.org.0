Return-Path: <linux-arm-msm+bounces-111091-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id RoA9KfnVIGpV8QAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-111091-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 04 Jun 2026 03:33:45 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 47EFB63C36D
	for <lists+linux-arm-msm@lfdr.de>; Thu, 04 Jun 2026 03:33:45 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=JSjqWc2f;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=H25vXb1K;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-111091-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.232.135.74 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-111091-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 8EA5230494F0
	for <lists+linux-arm-msm@lfdr.de>; Thu,  4 Jun 2026 01:33:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CAD78242D97;
	Thu,  4 Jun 2026 01:33:30 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88F63230BD5
	for <linux-arm-msm@vger.kernel.org>; Thu,  4 Jun 2026 01:33:29 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780536810; cv=none; b=WeErj2iacd+ZxMwHVbgY1P7Obd6FwSq280Hzyv8fN5r6ooeLXsMUAvw4nyyJX8dVI2bZXgI1Benti7RS7givVoCMPCOwHQn6Jh+O818zTQ6DN7uSrmlNlWyA+Hh6mg6XZ1XGqtgGNuygfc/dpHpDv5j3SqbRv5kUXVhHwNA1J0M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780536810; c=relaxed/simple;
	bh=mETc0jlTLmI462gvqIk7CFJGzUvc8N7VZDu2GYCH5bo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Gc2UouEABUpegHPZPsgJAPVuo4Qxq63uJktjqwCu6hIO+dpN0LbVzdf3mbfm6lfKvyZ5q8s6URCTU6FOEX+JtJQEON0wL302lwf26FcxWrF5IaoNNfYv02byAh9WB+3j9PJQ4upe9EpcQZ2AvZjrGYgpx6o0/KpvLqGPqsgPP8I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=JSjqWc2f; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=H25vXb1K; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 653Hvwt93233931
	for <linux-arm-msm@vger.kernel.org>; Thu, 4 Jun 2026 01:33:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Venx6RUzjC9wNNihizVrtl+8Lnx8Pg3T1wsMj8jld8A=; b=JSjqWc2fuO5XdgM6
	iv8mYLmiwz27awoomHqBU7JS2Ui5XxlcEOV+W+iTV7FniXPJ1yoMxUTryljX1eSF
	bvpnE7NjyoRJ+9znTFnbg7o+Xim6A/CDE4lT+nCNNY42B+SL+/1NXYLnty1xusYy
	Njlnh2Qciz2ZXXWTOgm21dGnebfRbMXsn76T6teIGTSduvj0fItnx82cVeW8kzpv
	wPPB6oOagEnWByYb+bK9Y/uLrKh0ZmoEnv5dwTnubafvcP+QPlpvSf4B37nDjHzd
	Pt3uwjesRaEUIaRd2U2TBYUEU3WfRc94CpEgQi/MswrZBxKosYN3kD3CJDwGHh+O
	CeUpAg==
Received: from mail-dl1-f69.google.com (mail-dl1-f69.google.com [74.125.82.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ejs4s1ff8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 04 Jun 2026 01:33:28 +0000 (GMT)
Received: by mail-dl1-f69.google.com with SMTP id a92af1059eb24-137f8f21861so255193c88.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 03 Jun 2026 18:33:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780536807; x=1781141607; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Venx6RUzjC9wNNihizVrtl+8Lnx8Pg3T1wsMj8jld8A=;
        b=H25vXb1KZchG9AmQ1SGIF/gEu2oISPUvPlUR+hqcqoR295sq05M4KpRVXiMPxuMVQ4
         AeM2SXkQ726cSC0G9OGELsmrUgnYf78u/Pnxj9DqgMw9Oxx1+lyzrHf4q4BinA5xHWPQ
         GL4eyWEwZ2Oym1CuNHv17oP27YhySG7FOyIZ2LWhvfUgv8l22fQiyUl6mbxqbTn+Q4ps
         +4mRag1laIyeElKaAgN0GOO2oSKxBhEL5C8H+zigzTi9+Ny3Ypi61AkrB01AudGRcctk
         P3uH1jYUuCmom8NJX28TU3U3yF0MS8kW4S+04Lc3tVyu9VZ13dnqlZ0FitaScjuxtn/C
         WB7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780536807; x=1781141607;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Venx6RUzjC9wNNihizVrtl+8Lnx8Pg3T1wsMj8jld8A=;
        b=mPJ6AhDk8WrNd2s0HY81BMm+kLDbzy6tHQn31hPV+DUdijBzbTuw/37Y5Ccp2tITtf
         iOXautVTKTXWAjvivAYtfMO8TH/zX/Tbre3mub0QzQiyN8o+G7JCi4psK6yKBv+SGy9J
         jAJHkC4HFSSMaOoko/RqFzT+clEw05ZQP9lVgpO5p3IsAxKKWRktxOBexWufAlHgRs28
         jPV7/DlqPf6JTSYm24AffCmjxHQWfI6qyXSpgpczHQ2g/rxRRc1J9XH4YGUjzO28WzMY
         zkfS3YdU90ElToVB/uUiUU8zH0JjlbUk5FWnSDDAle/HsHwwgZOrJySVNNVh7G7ar+3H
         odeA==
X-Gm-Message-State: AOJu0YxGkfQFIEdarMiEaLJZJ2joqcv77Bhnpp6TxVVvsES+E3/4l5yJ
	UEbQFXzEDQ/Qu/8AWCQPT5AzOE9cpvPjRjlDa7JqTuQ1KQZ0XsiQWxxMEIfVtxrdKpgWUwbpVZf
	3WALwa1sBlLm5V/qvGdag1rfihKhPGvNkt/owG2oPemJ58SmRhlg7Q+QBNdkUmyM/RQCs
X-Gm-Gg: Acq92OG5KbTrlbsapVMRKmrpZLN991phlRPKTSos/cxC8qdFuwXVv/ByEV5mMbeGyCa
	YEZV6elV0e8TgcKi0TRCfHxu1H+gCHmzhQ+4fcy5USgOTpPJqtN1F8SGpfJJ1XKhSVQZNLrY6IC
	/t1grunE298EmetcyFguyCUZeSKSn9sjDhLzvVthWXGBvF7i3cqxuqto3mt9VJyVhS0IxbaOyyM
	Hst3FFg3ZKnsu+MODjdlhf1VtgodCTUMeI+qMbohm8V1xok+xXTPtA9PVFAVFiRyZ7KItoxcZlv
	nLegR80dYLDQFRnfLGZONHlCC6tDcX9Nfvtx99BokDe7XYbBM8OCWMIBj1ppZGYiCfRUtf4CpL/
	aTMCuOS+eJt3OMMq8szWXgF4FZhPaac1Ke5ZNDXAmLH1QJjux8tseNTNWDhXpEZYUefHxHA==
X-Received: by 2002:a05:7022:6291:b0:137:546:9e9d with SMTP id a92af1059eb24-137f6bb262fmr2347603c88.23.1780536807475;
        Wed, 03 Jun 2026 18:33:27 -0700 (PDT)
X-Received: by 2002:a05:7022:6291:b0:137:546:9e9d with SMTP id a92af1059eb24-137f6bb262fmr2347593c88.23.1780536806946;
        Wed, 03 Jun 2026 18:33:26 -0700 (PDT)
Received: from [169.254.0.3] (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-137f553ab33sm2870659c88.10.2026.06.03.18.33.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Jun 2026 18:33:25 -0700 (PDT)
From: Matthew Leung <matthew.leung@oss.qualcomm.com>
Date: Thu, 04 Jun 2026 01:32:56 +0000
Subject: [PATCH v2 02/10] phy: qcom-qmp: qserdes-com: Add v10 register
 offsets
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260604-hawi-phy-pcie-v2-2-be908d3560db@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1780536795; l=3231;
 i=matthew.leung@oss.qualcomm.com; s=20260428; h=from:subject:message-id;
 bh=mETc0jlTLmI462gvqIk7CFJGzUvc8N7VZDu2GYCH5bo=;
 b=qqVc0bY8pU7gFmiGPp5xHwp7Zlvwef4gHCmv+0IeIt8Ts2r1ZkxnvOk3gn9PQ3gt852XAThTm
 IHTv7mfvS6OCbni1Rr8wZANCDE8naKzYZzg8v/8bopWaLoECLysAUDP
X-Developer-Key: i=matthew.leung@oss.qualcomm.com; a=ed25519;
 pk=aT25ggJo5PMHLN9N+TsZ3s/BVU++kEYuiFebPWe21+o=
X-Proofpoint-ORIG-GUID: k3UUWD-OoyNRsT5Rk2nb-L-6fb3SvOx1
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA0MDAxMiBTYWx0ZWRfX56yTZFuE6HbL
 MImwPPdEX8suVNq+qkOEhBnhUJiovaCMdiMZoRz5VSNhuCt4aiGC3PuhtA8I2fMIoJwNcioWajv
 3736u3mbiueh5JBAjN2mdASl/ssvSnraxOcG8tLYcT0A9AKG7GTmyPCaNxlSfYIkJBhoV/UY2fJ
 YgJQ5UbM83zO9MIuYCdAm6KNN+Nq0ynPmJ2UKHeLmhxlSvWS1tPnvAF7uCkPGMHm+R/ZqGaGfQn
 h8OhZNlT+umGe+MJXrTYmg78pg9dxyJvdCuHKQrle+CqkKXDiZ+HtwFbzf7bo27lo8mDdieB6o2
 W7x+mkOG+a+q+N3s6rIKXFQdM2iUm4LU2JzPxNyrsdTTjdBrmPAS52x9x2rYkYt+fK5zY92PQjg
 IJx99kHvOXOXdfOMBeHgFgvMCdlEm1uwwnGwWT38sXvw9+JRORM3pmDdFR0gZSgYuUWvZrBaKN/
 5Yk9ZfHoFn15YQtxCxA==
X-Authority-Analysis: v=2.4 cv=afRRWxot c=1 sm=1 tr=0 ts=6a20d5e8 cx=c_pps
 a=kVLUcbK0zfr7ocalXnG1qA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=MN0C-abDVP1yrleAEAUA:9 a=QEXdDO2ut3YA:10
 a=vr4QvYf-bLy2KjpDp97w:22
X-Proofpoint-GUID: k3UUWD-OoyNRsT5Rk2nb-L-6fb3SvOx1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-04_01,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 bulkscore=0 phishscore=0 clxscore=1015
 adultscore=0 lowpriorityscore=0 spamscore=0 impostorscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606040012
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-111091-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,qualcomm.com:email,qualcomm.com:dkim,vger.kernel.org:from_smtp,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns];
	FORGED_RECIPIENTS(0.00)[m:vkoul@kernel.org,m:neil.armstrong@linaro.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-phy@lists.infradead.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:matthew.leung@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[matthew.leung@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
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
X-Rspamd-Queue-Id: 47EFB63C36D

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


