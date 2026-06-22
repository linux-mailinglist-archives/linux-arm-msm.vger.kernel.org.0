Return-Path: <linux-arm-msm+bounces-113921-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id d1M0EibEOGojhwcAu9opvQ
	(envelope-from <linux-arm-msm+bounces-113921-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 22 Jun 2026 07:12:06 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 28BCC6ACABC
	for <lists+linux-arm-msm@lfdr.de>; Mon, 22 Jun 2026 07:12:06 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=cKUx37Lo;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b="L/Kdfygn";
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-113921-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.232.135.74 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-113921-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 6F0FD3008D7E
	for <lists+linux-arm-msm@lfdr.de>; Mon, 22 Jun 2026 05:11:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3FF0535B63D;
	Mon, 22 Jun 2026 05:11:40 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F0CF357702
	for <linux-arm-msm@vger.kernel.org>; Mon, 22 Jun 2026 05:11:38 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782105100; cv=none; b=tmc+iSfWx5qCj/e0CsMapwmqnhMmlW58axZ7DtRDmjybRm1ZCWUfzL0cgab1wEtFLIdaPAk1fDaxpUNPtcIlkny/I4/+g8vSjEIysFpLtTKsL2V8AfcfqkO87Hv8BC/P8IHewHr3vMKcIwzpG/xKaXnpo3+fnprDujcdonmott0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782105100; c=relaxed/simple;
	bh=XBJO4SMFbyVoEawcCWAJ9scn+Tbn6DXfij/0IxHeKpo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=icAU+uM0nORapvxAXJq/Az8YklR8GB8oZjd8mLd3r3R5UWTQFGcptNs/rRtydNm/MW6D1Qm/znSVrUNTu8V1zC7fpxxLdNMDk6ReJ9bACuOcg0N0fvoU5Y2xGJsNzhGU2HUyaHyfOLY7bCQ71qObdW6gQJboWBQtntKQdLszGLM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=cKUx37Lo; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=L/Kdfygn; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65M59MuW3800809
	for <linux-arm-msm@vger.kernel.org>; Mon, 22 Jun 2026 05:11:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	vbs55cAiMzDwNIRWRa7hqHBap80NmRRXIMEN+aZENGA=; b=cKUx37Lo6RzIIPII
	F4goLUcVkieUUiRoHZ9sAAFSSwLsdAOKOe72YgVjqxAzhUnL9QSagQ/k4rwdloCI
	MHro5VG7c3yCDaHzRUfRwK1lnqRhzcVyyG7OagOxAV6e2/G1CfoIexPnbw8FlBRJ
	7kXIWiPItGQ1+JL1qPwVnxb5+2laH+6PtODhWggH1womL2xSH3ItY1LuBtCv2GSf
	ZCWfcgQNZL+cft8miJKytr5FjyJRQdCKhAh7IQCq3divR1y+zfejcHMGxcmOZObY
	+MNznWOyj+OskLHsZw0QCpTT5V3qnK187DWDUDeckxObePaaf+Pj+8Fu7Ywy98GY
	dVS0jg==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ewm1k4p6t-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 22 Jun 2026 05:11:37 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-30bef75a41eso2810767eec.0
        for <linux-arm-msm@vger.kernel.org>; Sun, 21 Jun 2026 22:11:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782105097; x=1782709897; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vbs55cAiMzDwNIRWRa7hqHBap80NmRRXIMEN+aZENGA=;
        b=L/KdfygnaeGun5dHrEaTBVeuXsyVHGGfdV4bMArbI9rQgIRDhVhXOyojmQOQmRh+Qv
         pKZki7OKCj8bKMwmRd+MiiAA68twLn5eN26aRpskyYX4oM3i9uhVF5eDS3x30KeCZmsX
         /BceWHXgu2WGlY2grTMcvXTZcBP2BIoD4sK/WiJ1bGSziMhpYHONt45Je38/W+Tx3V8r
         Xg7xHiBGI80mZWtd+1k3rZXkT8s+puOs2NQU7aZwhvFsCnFqo1oAIT9ZII2OJbLEzJJc
         DttPdoMHdWyJ/GDC+jVni7V7wlaFL0+i8tFzhBaWg+TGAS+oLpAB+Cv5Q0eNcjhV1Wod
         F5+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782105097; x=1782709897;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=vbs55cAiMzDwNIRWRa7hqHBap80NmRRXIMEN+aZENGA=;
        b=TGF3wx8x5/xzQKbU4alRveZzCspD4JmYOES1PVcRZ2xl7XZ/M6TMdd0DuQiGWVdYo4
         Q72qU6FntRFcbgPpcKTpTDdliwdIM1XqQ6qXTLzfdCLvmIdtpxa1YncshT2VxRBkXIdH
         AZIxLOLxm0R7YiA2ddf8sq30fF5xx1EvnsbkrxP0JZqfg/f3CasIoQNYyqcsgQUjsed9
         eOE2hmB8TfsGSeytrxZZNHxQjtr6OlZP+dX9vT/29REQK6BZjO/GKLLJ0cw4D5zONKhH
         R1eCk96+9NT5LRQtIhx/qfHXC4+20FjOjIYHlI+x0Ztu3qorckx7HKam36T80oGLY/oS
         0N3A==
X-Gm-Message-State: AOJu0Yw11I4KhpEoxH+lXGJtulOoZgookWPmZiszcyCK2nRmqssbSL8y
	siG3dZsAzbGnYwJrzpIDjHG2RgtepQteRi2kEGtwHJe43FNyZ+qDxZhHGB99plH/hJVzEciXPRR
	3qfDYMNe5HVzJr51N/IjbjwDyYzjU2APGATAab/YaKWEq1GpighcO2JWGF+AjBomlPRjA
X-Gm-Gg: AfdE7ckgafL+3JRvMKTBSYtuFqLu6zbSHcNg+lKoPOOlw0R0sYxcxzM2ScsY8c149Hp
	Xv9ovl3HQVQa3s/qDeOZ3oF65jYAM0OwKydgvNUZG2KQt32EbyVeySEw7O31HxwRvWm2ef46FXX
	GcCC+i/YrU4P1rHILCOBzduD6A9MkW4i/cndkpyRJlTxNksfbI2HlrLjzRcKaongtTgzLFSfi4z
	2WNFA6neheCWoqlXmqvcL+AApfFYlFc2TTnQEYPtxpuDGvsze/L7X2928Zt8e96zrk14MflaRDN
	rqYZuLdHY4VnMlyS94CAaHA56GmnFeFkw0WMlhOjPyoHOoVpmYYO//x7sdCmhaKmZ5SmSyP1SiJ
	01Ne67zfx0J2tim8BMxvVs9TDtYI+3rVwJFc+rQRfOoX3d2wURS1k7fHI7w==
X-Received: by 2002:a05:7300:7313:b0:307:26a3:75d8 with SMTP id 5a478bee46e88-30c1d96fc0dmr6630793eec.1.1782105096916;
        Sun, 21 Jun 2026 22:11:36 -0700 (PDT)
X-Received: by 2002:a05:7300:7313:b0:307:26a3:75d8 with SMTP id 5a478bee46e88-30c1d96fc0dmr6630781eec.1.1782105096408;
        Sun, 21 Jun 2026 22:11:36 -0700 (PDT)
Received: from hu-qianyu-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30c1bd8d779sm8947716eec.17.2026.06.21.22.11.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 21 Jun 2026 22:11:35 -0700 (PDT)
From: Qiang Yu <qiang.yu@oss.qualcomm.com>
Date: Sun, 21 Jun 2026 22:11:26 -0700
Subject: [PATCH v6 3/8] clk: qcom: Add generic clkref_en support
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260621-tcsr_qref_0622-v6-3-c939c22ded0c@oss.qualcomm.com>
References: <20260621-tcsr_qref_0622-v6-0-c939c22ded0c@oss.qualcomm.com>
In-Reply-To: <20260621-tcsr_qref_0622-v6-0-c939c22ded0c@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Qiang Yu <qiang.yu@oss.qualcomm.com>, krishna.chundru@oss.qualcomm.com
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1782105091; l=9061;
 i=qiang.yu@oss.qualcomm.com; s=20250513; h=from:subject:message-id;
 bh=XBJO4SMFbyVoEawcCWAJ9scn+Tbn6DXfij/0IxHeKpo=;
 b=ZCEQKbhWHsmepw/vRQSkseIQ6KRvcBTM/fiJyPl+VHv8elnrIyOSQaVRgNiDTTUrwa9OVMOf4
 dM3laThDK4LDnJc+inwMXG4Vft6zvjZn8txDmbKTYZKoQN/5trRT7Jv
X-Developer-Key: i=qiang.yu@oss.qualcomm.com; a=ed25519;
 pk=Rr94t+fykoieF1ngg/bXxEfr5KoQxeXPtYxM8fBQTAI=
X-Proofpoint-GUID: ObFJHM_rWyIdy2e9cLkKPxZNB4eptBub
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjIyMDA0NyBTYWx0ZWRfX35skN5iQaOY/
 6g7hnV29JOI7S1orT2gSfXsR09VY+GQNKExj2jwpfBCxTXSj3JXUKLTgfvIfbPie5X+VCqJrepc
 vNPC7nRzc0iWwiqBzb41iH36MNAXNyw=
X-Authority-Analysis: v=2.4 cv=T6S8ifKQ c=1 sm=1 tr=0 ts=6a38c409 cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=r4lB9QUgC6LPr1KdvdsA:9 a=QEXdDO2ut3YA:10
 a=PxkB5W3o20Ba91AHUih5:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjIyMDA0NyBTYWx0ZWRfX8u59lzC9vGxr
 Mix3kdhUHaDB83/fL+ky0VONZEcxsgbHfQjSKlf0oHCIME7wsMywaEBPhRrNPz2rW/r1oePpzJ0
 EfleT4jvCgk35sGbbUYmQnD2cU2BbHH0vNUnmZoH2v/P0b5XpapOV4H7XYTxpk9e2wW0a7ZQTU2
 TVnKQ+TfKrvWeMbyNx+hIi345n8QdygYJpDlwKhWZhbQVTvJY7fZGPowjmRRjmj+gTagfu1UQYa
 XrBYwpS1hYnZmFCGgXADtpY0WsaX1/8iVIsyBFoZ6gONUd4wqmMYUTrxnNxwpfobGXzOanjFK/5
 MChS8SRuPuAO9KqGgE1KhHYMHA3Su74gspF0/u6Qn4LD3fphOk/Af9+17xnrxxSAi8J5Vc6hVSv
 K+JLZHxu3AO93IZNQXwPLRVBopzJfVDBD5oTxjhi8TZh2Aq7iZn9BAQLCXdTgKLHTpHAWUegpl0
 U8LNJy4bI9TP+zvlDew==
X-Proofpoint-ORIG-GUID: ObFJHM_rWyIdy2e9cLkKPxZNB4eptBub
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-22_01,2026-06-18_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 malwarescore=0 adultscore=0 bulkscore=0
 impostorscore=0 lowpriorityscore=0 spamscore=0 suspectscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606220047
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
	TAGGED_FROM(0.00)[bounces-113921-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo];
	FORGED_SENDER(0.00)[qiang.yu@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[15];
	FORGED_RECIPIENTS(0.00)[m:andersson@kernel.org,m:mturquette@baylibre.com,m:sboyd@kernel.org,m:bmasney@redhat.com,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:taniya.das@oss.qualcomm.com,m:konradybcio@kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-clk@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:qiang.yu@oss.qualcomm.com,m:krishna.chundru@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[qiang.yu@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 28BCC6ACABC

Before XO refclk is distributed to PCIe/USB/eDP PHYs, it passes through
a QREF block. QREF is powered by dedicated LDO rails, and the clkref_en
register controls whether refclk is gated through to the PHY side.

These clkref controls are different from typical GCC branch clocks:
- only a single enable bit is present, without branch-style config bits
- regulators must be voted before enable and unvoted after disable

Model this as a dedicated clk_ref clock type with custom clk_ops instead
of reusing struct clk_branch semantics.

Also provide a common registration/probe API so the same clkref model
can be reused regardless of where clkref_en registers are placed, e.g.
TCSR on glymur and TLMM on SM8750.

Signed-off-by: Qiang Yu <qiang.yu@oss.qualcomm.com>
---
 drivers/clk/qcom/Makefile  |   1 +
 drivers/clk/qcom/clk-ref.c | 205 +++++++++++++++++++++++++++++++++++++++++++++
 include/linux/clk/qcom.h   |  67 +++++++++++++++
 3 files changed, 273 insertions(+)

diff --git a/drivers/clk/qcom/Makefile b/drivers/clk/qcom/Makefile
index 58f9a5eb6fd7..4e7abe8d49e6 100644
--- a/drivers/clk/qcom/Makefile
+++ b/drivers/clk/qcom/Makefile
@@ -8,6 +8,7 @@ clk-qcom-y += clk-pll.o
 clk-qcom-y += clk-rcg.o
 clk-qcom-y += clk-rcg2.o
 clk-qcom-y += clk-branch.o
+clk-qcom-y += clk-ref.o
 clk-qcom-y += clk-regmap-divider.o
 clk-qcom-y += clk-regmap-mux.o
 clk-qcom-y += clk-regmap-mux-div.o
diff --git a/drivers/clk/qcom/clk-ref.c b/drivers/clk/qcom/clk-ref.c
new file mode 100644
index 000000000000..8132e510f43c
--- /dev/null
+++ b/drivers/clk/qcom/clk-ref.c
@@ -0,0 +1,205 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright (c) 2026, Qualcomm Technologies, Inc. and/or its subsidiaries.
+ */
+
+#include <linux/clk-provider.h>
+#include <linux/clk/qcom.h>
+#include <linux/delay.h>
+#include <linux/err.h>
+#include <linux/export.h>
+#include <linux/platform_device.h>
+#include <linux/regmap.h>
+#include <linux/regulator/consumer.h>
+#include <linux/slab.h>
+
+#define QCOM_CLK_REF_EN_MASK BIT(0)
+
+struct qcom_clk_ref_provider {
+	struct qcom_clk_ref *refs;
+	size_t num_refs;
+};
+
+static inline struct qcom_clk_ref *to_qcom_clk_ref(struct clk_hw *hw)
+{
+	return container_of(hw, struct qcom_clk_ref, hw);
+}
+
+static const struct clk_parent_data qcom_clk_ref_parent_data = {
+	.index = 0,
+};
+
+static int qcom_clk_ref_prepare(struct clk_hw *hw)
+{
+	struct qcom_clk_ref *rclk = to_qcom_clk_ref(hw);
+	int ret;
+
+	if (!rclk->desc.num_regulators)
+		return 0;
+
+	ret = regulator_bulk_enable(rclk->desc.num_regulators, rclk->regulators);
+	if (ret)
+		pr_err("Failed to enable regulators for %s: %d\n",
+		       clk_hw_get_name(hw), ret);
+
+	return ret;
+}
+
+static void qcom_clk_ref_unprepare(struct clk_hw *hw)
+{
+	struct qcom_clk_ref *rclk = to_qcom_clk_ref(hw);
+
+	if (rclk->desc.num_regulators)
+		regulator_bulk_disable(rclk->desc.num_regulators, rclk->regulators);
+}
+
+static int qcom_clk_ref_enable(struct clk_hw *hw)
+{
+	struct qcom_clk_ref *rclk = to_qcom_clk_ref(hw);
+	int ret;
+
+	ret = regmap_set_bits(rclk->regmap, rclk->desc.offset, QCOM_CLK_REF_EN_MASK);
+	if (ret)
+		return ret;
+
+	udelay(10);
+
+	return 0;
+}
+
+static void qcom_clk_ref_disable(struct clk_hw *hw)
+{
+	struct qcom_clk_ref *rclk = to_qcom_clk_ref(hw);
+
+	regmap_clear_bits(rclk->regmap, rclk->desc.offset, QCOM_CLK_REF_EN_MASK);
+	udelay(10);
+}
+
+static int qcom_clk_ref_is_enabled(struct clk_hw *hw)
+{
+	struct qcom_clk_ref *rclk = to_qcom_clk_ref(hw);
+	u32 val;
+	int ret;
+
+	ret = regmap_read(rclk->regmap, rclk->desc.offset, &val);
+	if (ret)
+		return 0;
+
+	return !!(val & QCOM_CLK_REF_EN_MASK);
+}
+
+static const struct clk_ops qcom_clk_ref_ops = {
+	.prepare = qcom_clk_ref_prepare,
+	.unprepare = qcom_clk_ref_unprepare,
+	.enable = qcom_clk_ref_enable,
+	.disable = qcom_clk_ref_disable,
+	.is_enabled = qcom_clk_ref_is_enabled,
+};
+
+static int qcom_clk_ref_register(struct device *dev, struct regmap *regmap,
+				 struct qcom_clk_ref *clk_refs,
+				 const struct qcom_clk_ref_desc *descs,
+				 size_t num_clk_refs)
+{
+	const struct qcom_clk_ref_desc *desc;
+	struct clk_init_data init_data = {};
+	struct qcom_clk_ref *clk_ref;
+	size_t clk_idx;
+	unsigned int i;
+	int ret;
+
+	for (clk_idx = 0; clk_idx < num_clk_refs; clk_idx++) {
+		clk_ref = &clk_refs[clk_idx];
+		desc = &descs[clk_idx];
+
+		if (!desc->name)
+			continue;
+
+		clk_ref->regmap = regmap;
+		clk_ref->desc = *desc;
+
+		if (clk_ref->desc.num_regulators) {
+			clk_ref->regulators = devm_kcalloc(dev, clk_ref->desc.num_regulators,
+							   sizeof(*clk_ref->regulators),
+							   GFP_KERNEL);
+			if (!clk_ref->regulators)
+				return -ENOMEM;
+
+			for (i = 0; i < clk_ref->desc.num_regulators; i++)
+				clk_ref->regulators[i].supply =
+					clk_ref->desc.regulator_names[i];
+
+			ret = devm_regulator_bulk_get(dev, clk_ref->desc.num_regulators,
+						      clk_ref->regulators);
+			if (ret)
+				return dev_err_probe(dev, ret,
+						     "Failed to get regulators for %s\n",
+						     clk_ref->desc.name);
+		}
+
+		init_data.name = clk_ref->desc.name;
+		init_data.parent_data = &qcom_clk_ref_parent_data;
+		init_data.num_parents = 1;
+		init_data.ops = &qcom_clk_ref_ops;
+		clk_ref->hw.init = &init_data;
+
+		ret = devm_clk_hw_register(dev, &clk_ref->hw);
+		if (ret)
+			return ret;
+	}
+
+	return 0;
+}
+
+static struct clk_hw *qcom_clk_ref_provider_get(struct of_phandle_args *clkspec, void *data)
+{
+	struct qcom_clk_ref_provider *provider = data;
+	unsigned int idx = clkspec->args[0];
+
+	if (idx >= provider->num_refs)
+		return ERR_PTR(-EINVAL);
+
+	if (!provider->refs[idx].regmap)
+		return ERR_PTR(-ENOENT);
+
+	return &provider->refs[idx].hw;
+}
+
+int qcom_clk_ref_probe(struct platform_device *pdev,
+		       const struct regmap_config *config,
+		       const struct qcom_clk_ref_desc *descs,
+		       size_t num_clk_refs)
+{
+	struct qcom_clk_ref_provider *provider;
+	struct device *dev = &pdev->dev;
+	struct regmap *regmap;
+	void __iomem *base;
+	int ret;
+
+	base = devm_platform_ioremap_resource(pdev, 0);
+	if (IS_ERR(base))
+		return PTR_ERR(base);
+
+	regmap = devm_regmap_init_mmio(dev, base, config);
+	if (IS_ERR(regmap))
+		return PTR_ERR(regmap);
+
+	provider = devm_kzalloc(dev, sizeof(*provider), GFP_KERNEL);
+	if (!provider)
+		return -ENOMEM;
+
+	provider->refs = devm_kcalloc(dev, num_clk_refs, sizeof(*provider->refs),
+				      GFP_KERNEL);
+	if (!provider->refs)
+		return -ENOMEM;
+
+	provider->num_refs = num_clk_refs;
+
+	ret = qcom_clk_ref_register(dev, regmap, provider->refs, descs,
+				    provider->num_refs);
+	if (ret)
+		return ret;
+
+	return devm_of_clk_add_hw_provider(dev, qcom_clk_ref_provider_get, provider);
+}
+EXPORT_SYMBOL_GPL(qcom_clk_ref_probe);
diff --git a/include/linux/clk/qcom.h b/include/linux/clk/qcom.h
new file mode 100644
index 000000000000..a89122a8f87b
--- /dev/null
+++ b/include/linux/clk/qcom.h
@@ -0,0 +1,67 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * Copyright (c) 2026, Qualcomm Technologies, Inc. and/or its subsidiaries.
+ */
+
+#ifndef __LINUX_CLK_QCOM_H
+#define __LINUX_CLK_QCOM_H
+
+#include <linux/clk-provider.h>
+#include <linux/errno.h>
+#include <linux/kconfig.h>
+#include <linux/regmap.h>
+#include <linux/types.h>
+
+struct device;
+struct platform_device;
+struct regulator_bulk_data;
+
+/**
+ * struct qcom_clk_ref_desc - descriptor for a clkref_en gate clock
+ * @name: clock name exposed to the common clock framework
+ * @offset: clkref_en register offset from the block base
+ * @regulator_names: optional supply names enabled while preparing the clock
+ * @num_regulators: number of entries in @regulator_names
+ */
+struct qcom_clk_ref_desc {
+	const char *name;
+	u32 offset;
+	const char * const *regulator_names;
+	unsigned int num_regulators;
+};
+
+/**
+ * struct qcom_clk_ref - per-clock data for a clkref_en gate clock
+ * @hw: common clock framework hardware clock handle
+ * @regmap: register map backing the clkref_en register
+ * @desc: clock descriptor copied at registration time
+ * @regulators: optional bulk regulator handles for @desc.regulator_names
+ */
+struct qcom_clk_ref {
+	struct clk_hw hw;
+	struct regmap *regmap;
+	struct qcom_clk_ref_desc desc;
+	struct regulator_bulk_data *regulators;
+};
+
+#if IS_ENABLED(CONFIG_COMMON_CLK_QCOM)
+
+int qcom_clk_ref_probe(struct platform_device *pdev,
+		       const struct regmap_config *config,
+		       const struct qcom_clk_ref_desc *descs,
+		       size_t num_clk_refs);
+
+#else
+
+static inline int
+qcom_clk_ref_probe(struct platform_device *pdev,
+		   const struct regmap_config *config,
+		   const struct qcom_clk_ref_desc *descs,
+		   size_t num_clk_refs)
+{
+	return -EOPNOTSUPP;
+}
+
+#endif
+
+#endif

-- 
2.34.1


