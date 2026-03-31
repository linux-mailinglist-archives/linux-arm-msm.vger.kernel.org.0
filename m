Return-Path: <linux-arm-msm+bounces-100917-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uJIKBdkXy2lrDwYAu9opvQ
	(envelope-from <linux-arm-msm+bounces-100917-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 31 Mar 2026 02:39:53 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 688CB362BD5
	for <lists+linux-arm-msm@lfdr.de>; Tue, 31 Mar 2026 02:39:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id E29C9305C8C1
	for <lists+linux-arm-msm@lfdr.de>; Tue, 31 Mar 2026 00:35:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4ACB1280037;
	Tue, 31 Mar 2026 00:35:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="M183uvYT";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="jkiA9Uqh"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 990FB284693
	for <linux-arm-msm@vger.kernel.org>; Tue, 31 Mar 2026 00:35:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774917316; cv=none; b=V666/cG0IMNbFmYTBvf6akgx7EWe6niX/H+WXbsHYNDcSoL8xP/bZZWkYISrjznFFOdTOZhwNrCUGtx2W7JSVsnRb1/tDvlvaEW0esSFk/gKgxZWrf6euPPTPpmO8/bho8LPCkXnT7NKgAweO9jnrozjX0BIQuFA9z/RasyVeOY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774917316; c=relaxed/simple;
	bh=uoB/7/VJQCCuz6UU3me/9P7IrBdCZ9zglmK0FhN9UqY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=oRvw5XygZ5dVhK2RdvADNR+YCmfmW4tDxTU7KAqGYxadvyO3FZIioBqpMxMnIiqYV6n0Mr529d5gRM7X9aDFtWVWnBQiZ2iua4zkup6Yjmm8RPxjQuEsGjkYBIRAKH072DhTMPdxUSR7UC8lkFaHlliZkb+LxhP05zqxnS3tjyk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=M183uvYT; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=jkiA9Uqh; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62UKgnSs1090270
	for <linux-arm-msm@vger.kernel.org>; Tue, 31 Mar 2026 00:35:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	FuCz14FjSQ1P7UxRz/XgEzrDV/o5Ui2/RaOcgNLqYns=; b=M183uvYT1tIEtVFZ
	6PsaP+A8NC59pitdFWRtEX01G/yjiSeuseeLZpAsxjp8eWNuG0089wUSHAQZvQSD
	GFnoUdNXj8Yy7CkTsXP1bu7AWwiRAAD7Rac+A5XPuhoLHDJqpL/RrZ/fnTHHHK+g
	FHQ7Sr0nFz3l8+4E2KnPPrF6v73J+U57cgnPAw0PJSl6o10OK6TxISIpCzDDAF86
	vpfOtpNsbqjwGmbzgRaYfDHCL3wdocrEEXxiZp9GyEG5s2Dy2GifAMo1Il1+b5ht
	+J40Bw1t5rb9S6GPelGhreJXyu72972HxoxNiP2O3PXi8r5hYrbdN9ebt3SVis+g
	BfcICA==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d7trd249j-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 31 Mar 2026 00:35:13 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-2c1631e6189so24276930eec.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 30 Mar 2026 17:35:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774917313; x=1775522113; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FuCz14FjSQ1P7UxRz/XgEzrDV/o5Ui2/RaOcgNLqYns=;
        b=jkiA9UqheAbP5O7oCwQnyx4OLYHu3cEtON6uFVl8bm5/6eAM3W0epRCKvqXS/DVHEA
         d6DFSriThJ0Q0lz1dhYPynayRerIpjKca0tPmi530cb4mAzzIsTq21lDZeJ1KCAyL1ZV
         jQD2PDJq2boc97tjJMk6KV37gdOs3JtiqdafCBNYz3M+vLUxJl8UghNBZ5yBDVZAyYb1
         eQLHp/JP7FTa7dTDdceKoqyZ4rvzzagQ/NXwX9ChuUYuCwxif8L8zvJQfItDBJL7iwVw
         +ii8CwZHXfTD1jWQP8NFNhStUZ0rTQe7pzxj4HFEmnhCYvallpPZxTA2TjsQYe4jAHBj
         1ItA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774917313; x=1775522113;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=FuCz14FjSQ1P7UxRz/XgEzrDV/o5Ui2/RaOcgNLqYns=;
        b=ICH/IGvc6su9Jikh02h32dSITWW55AeBD6WHh8IiTMvWoDbZQJ/zogsiWhWhW5DybE
         BXeiWxHCSaZzmqaqLgMkPGRujOfai6k/15ztyYtr82BIcVKsFPrwauIsaT865xhybEYp
         qVWbCEKivIRscMk3tHY9dPLCkp/wzN9lgqjb2ESW18Rl7bEBb7PqqQ57V/p5x+g5KKfC
         XJz2dt5++A/Z9ZUyYQc8fUO8hdqs10yqKJv/ajVkK91BgECzOB7/UhwNH7ZmiAIZMJtU
         omZGDGBEUwfROJ1qtu2JY6H6ewZE3d9MboJ6ltUD2zrxLiMrSWOIIO5XM+J2Ko5LrXf/
         V+pg==
X-Gm-Message-State: AOJu0Yw0z/Bf7odtH9/l7LQnagQTQD+6HLirAdXp65Dg2i0ihflnCesi
	uQ5WMorWfHFYen8PiJedvjjDAYwcv2quRCgmvNvwozT1rXM1fcMjBu8u1HMooL8b4Zcc/1U3+Rh
	XRRg+VO4TrQxu9JVPvBAo8qo07wFX7jEut4tFQkOIMkwE6P1EdvcGjxMwffXvuSnxxwp9CgHrNO
	pc
X-Gm-Gg: ATEYQzz8+M7CO9d+l3QWuigzECtEKziN0vuysCN6nEXs/8+iphpedtNwc4hgZdtRDKY
	4GgST1/0Lo3DFlqYeGlTpHmFt5SlWzqDVQiKJED+4nXagvSstztXEZa3G4GFduxHBZc6F8gmNfg
	BMqSPW2LNhgfgnVl66aWsUnmqXGlEIGkZfx7oIQeFbAN4An1Ph7ngffT6wdyRmrMtofRuRFjMlT
	U2tK3ejAdGFarm1u++iLzB+tx0/GjWJjmi7h63YXQ66QmLFwGTFg8bTqs4l9mKALpzkWdn7hg7S
	xIATZzlM6p5VlMMJ1i9YmAHeOuXAtNtPMzNbrPV4bfN9aQOCdRdP5CSXZdsgPxxsyzx6yZlEcNo
	F2mLiCJzoH5nl9aDx5Q5mlWcyuj4CtlzZF0cP60OBHSR2f0XpUCNtNz4CkD7dFalQVN64jP+YeD
	hc
X-Received: by 2002:a05:7300:6d22:b0:2b7:32a6:82d1 with SMTP id 5a478bee46e88-2c185df79edmr8574222eec.13.1774917313134;
        Mon, 30 Mar 2026 17:35:13 -0700 (PDT)
X-Received: by 2002:a05:7300:6d22:b0:2b7:32a6:82d1 with SMTP id 5a478bee46e88-2c185df79edmr8574208eec.13.1774917312632;
        Mon, 30 Mar 2026 17:35:12 -0700 (PDT)
Received: from hu-viveka-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2c3c6e9c088sm8454529eec.21.2026.03.30.17.35.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Mar 2026 17:35:12 -0700 (PDT)
From: Vivek Aknurwar <vivek.aknurwar@oss.qualcomm.com>
Date: Mon, 30 Mar 2026 17:34:57 -0700
Subject: [PATCH 2/7] dt-bindings: clock: qcom: Add Hawi TCSR clock
 controller
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260330-clk-hawi-v1-2-c2a663e1d35b@oss.qualcomm.com>
References: <20260330-clk-hawi-v1-0-c2a663e1d35b@oss.qualcomm.com>
In-Reply-To: <20260330-clk-hawi-v1-0-c2a663e1d35b@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Taniya Das <quic_tdas@quicinc.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Mike Tipton <mike.tipton@oss.qualcomm.com>,
        Vivek Aknurwar <vivek.aknurwar@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1774917310; l=1964;
 i=vivek.aknurwar@oss.qualcomm.com; s=20260311; h=from:subject:message-id;
 bh=uoB/7/VJQCCuz6UU3me/9P7IrBdCZ9zglmK0FhN9UqY=;
 b=ZL1dkE3tL0WE/2xJ4UE9aNjwD8EM71tvYVh68FemJCc2SdogKJdEYHe+j9x2tIkDU4ccbcFpA
 R1zGZt1ejNiAwAEUju/UCleDyg2VDlr8AOWnmZaT8bQ3ngyJ6TMCZTg
X-Developer-Key: i=vivek.aknurwar@oss.qualcomm.com; a=ed25519;
 pk=WIVIbn3nJR9YRWNRyJiEbvpgoHhNyYrmVqMUXWqAIC0=
X-Proofpoint-GUID: pXjVBB-KYmnDap6wtvH4PUaygiP_o-iS
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzMxMDAwMyBTYWx0ZWRfX4GwX5Vv/BioS
 HnzDkNAYcU+1rfKEjSoFCkulirls2Hvp391DMIQcw8KxB/5FXd8DtM2EoxeDqYJklS8AdDUyk55
 W6YtDq0BcA52AONVXeSBu82xXMyF9ACpErgUwfw3kp4gfjQi8oS93Wa4DufvGbHL5excBuUhjId
 OweDQDURCXHeDzfyDfs1Wrog7Y97Q1C/1tgaDS+iCIqnSZY86ENkdL1NtJ52xxmlzw/O5pdTDj1
 SySx9UB5BVRtW7MKoaKpjF0V8WFby7ZqkFnlkuHb4hE3DQzCQ3flROLB865EVdcAbZ4dR0qHOi9
 +5xE3hDNsPp5AsGQ2v1y3edqTZfaZDDNe7Jlx98ORNeIhiLQpdTfHydXd5wvjp5iOuffn9QvXLh
 kyZ7sc+j2MAAQ+CXVkvo2E91bg9ujmrkx4SNs0mtJwLRDlWinCM4RDYYvHYQRxy5VvBTLOXEQ1A
 Bt4FBoh9TxZWWVgWxqQ==
X-Proofpoint-ORIG-GUID: pXjVBB-KYmnDap6wtvH4PUaygiP_o-iS
X-Authority-Analysis: v=2.4 cv=H8/WAuYi c=1 sm=1 tr=0 ts=69cb16c2 cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=GhicybczBOgKxo7yvssA:9 a=QEXdDO2ut3YA:10
 a=scEy_gLbYbu1JhEsrz4S:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-30_02,2026-03-28_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 priorityscore=1501 bulkscore=0 spamscore=0 lowpriorityscore=0
 clxscore=1011 impostorscore=0 phishscore=0 suspectscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603310003
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[14];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-100917-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:dkim,qualcomm.com:email];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[vivek.aknurwar@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 688CB362BD5
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Add bindings documentation for TCSR clock controller on the Hawi SoC.

Signed-off-by: Vivek Aknurwar <vivek.aknurwar@oss.qualcomm.com>
---
 .../devicetree/bindings/clock/qcom,sm8550-tcsr.yaml      |  2 ++
 include/dt-bindings/clock/qcom,hawi-tcsrcc.h             | 16 ++++++++++++++++
 2 files changed, 18 insertions(+)

diff --git a/Documentation/devicetree/bindings/clock/qcom,sm8550-tcsr.yaml b/Documentation/devicetree/bindings/clock/qcom,sm8550-tcsr.yaml
index ae9aef0e54e8..bec3d8b4c70a 100644
--- a/Documentation/devicetree/bindings/clock/qcom,sm8550-tcsr.yaml
+++ b/Documentation/devicetree/bindings/clock/qcom,sm8550-tcsr.yaml
@@ -17,6 +17,7 @@ description: |
   See also:
   - include/dt-bindings/clock/qcom,eliza-tcsr.h
   - include/dt-bindings/clock/qcom,glymur-tcsr.h
+  - include/dt-bindings/clock/qcom,hawi-tcsrcc.h
   - include/dt-bindings/clock/qcom,sm8550-tcsr.h
   - include/dt-bindings/clock/qcom,sm8650-tcsr.h
   - include/dt-bindings/clock/qcom,sm8750-tcsr.h
@@ -27,6 +28,7 @@ properties:
       - enum:
           - qcom,eliza-tcsr
           - qcom,glymur-tcsr
+          - qcom,hawi-tcsrcc
           - qcom,kaanapali-tcsr
           - qcom,milos-tcsr
           - qcom,sar2130p-tcsr
diff --git a/include/dt-bindings/clock/qcom,hawi-tcsrcc.h b/include/dt-bindings/clock/qcom,hawi-tcsrcc.h
new file mode 100644
index 000000000000..957bc5f75bb7
--- /dev/null
+++ b/include/dt-bindings/clock/qcom,hawi-tcsrcc.h
@@ -0,0 +1,16 @@
+/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) */
+/*
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ */
+
+#ifndef _DT_BINDINGS_CLK_QCOM_TCSR_CC_HAWI_H
+#define _DT_BINDINGS_CLK_QCOM_TCSR_CC_HAWI_H
+
+/* TCSR_CC clocks */
+#define TCSR_PCIE_0_CLKREF_EN					0
+#define TCSR_PCIE_1_CLKREF_EN					1
+#define TCSR_UFS_CLKREF_EN					2
+#define TCSR_USB2_CLKREF_EN					3
+#define TCSR_USB3_CLKREF_EN					4
+
+#endif

-- 
2.34.1


