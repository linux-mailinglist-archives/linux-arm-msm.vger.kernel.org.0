Return-Path: <linux-arm-msm+bounces-93981-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0FW3CRyWnWnKQgQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-93981-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Feb 2026 13:14:20 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BD69186CA5
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Feb 2026 13:14:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 9DE7230426B4
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Feb 2026 12:13:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5770438E5F9;
	Tue, 24 Feb 2026 12:13:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="eHh/g7yc";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="PKseeHOV"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC01938E5ED
	for <linux-arm-msm@vger.kernel.org>; Tue, 24 Feb 2026 12:13:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771935228; cv=none; b=pTrRebqWLTbaF8Z0rH8G8lCxh/21GKdrAVUonUbT+npsHOn84J5l31cKJp1BbtcfnIzL+nN+Ta4giqGIxptLIe7bKBEeI/310Xd24B9fATE5qa429MHSm+a26r4QjUVuBTPrhbV/CaTQuC+cVDwRAXx6mJtjASiYaUoLNO/Yi9E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771935228; c=relaxed/simple;
	bh=mr5qY3alhrS65epRxbMQqGa8j4FulUQHe967R/7UJ58=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=LWRS7iQdwieMDJbO6DzUiusLWtVgKZ2Zrluxvy/QqN2GsjNlHWISEj3sJfHEiVCQibrRx1Byrh87/uwEY4S0/Ov+7EqU+7drUgbAXn8RK5eQXfG77zssV5EF9CIRBX05hWUiW2QzPL3K6e/wnzOPj3Q6/HiZI+CcOTW7v24x+z0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=eHh/g7yc; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=PKseeHOV; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61OAFU1M1774546
	for <linux-arm-msm@vger.kernel.org>; Tue, 24 Feb 2026 12:13:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	77KmxzlGvzbuztHsBF4Jw65Kqe1Z5yMCgQ+sFL0l9EM=; b=eHh/g7yckOVWuds/
	N98QzjjnH2dolMTSOFRzQZ95o+H5jp+3RpdfCvRZRd5tQECtRHl5W/7i8QruEI1e
	oakDKMpcSgvkIErQ6YaGhES7DrcyZoDqPBW5RRzTeo5s5cA9ANFun7EmOuK2l5Dq
	Q/NFcknpI4FrCf11a/F4wEZGkOxSL3MU6t6bJz6hC5ACaojbY0EOSSiQbJUpFIUE
	rm4sBqTI/ptTye0D+QHiXRiQvz1ErHwdwRCmnvyXngJEKcRozMXtgzHXRrqYTKnK
	xZe5LOdUYz5y2sXP4Pivpo8Qy6dAYxSWFq7yZym73Qucxfp6vR2IAz/wusQ+C3Ul
	da41fw==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cgpj8butt-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 24 Feb 2026 12:13:44 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-8c70cff1da5so4002517685a.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 24 Feb 2026 04:13:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1771935224; x=1772540024; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=77KmxzlGvzbuztHsBF4Jw65Kqe1Z5yMCgQ+sFL0l9EM=;
        b=PKseeHOVU4nbZkUIbXG+F1stZhHns0uECgcpvtUEuZI33j4AAq83Q3FayTR1uotQfq
         Q9iHpEOUEuq35nX2CfR28PV47p9rcRSz56ljcBVUdcCW8Fmg28mn4WJJT97ai70fmq+M
         iZXbOA7BdozS/neBMVo+sIzaKPAuiYKtKwFjt0p8uzzp9J4/PiVshrPuOkKSgY6hoEWV
         VDfr1i4vVOhYZ2rkUldbBd+ZJz+F7vCuUIECCEEu2vE/hPtNfmZgO3KS7tTrIQFiI+xZ
         F/41L1qXm3ky1Rz0pEXSIZFaZsAOb7hlvNkBemd8kvwgikY4Kpru70UWLaQNxgRn9itV
         755Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771935224; x=1772540024;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=77KmxzlGvzbuztHsBF4Jw65Kqe1Z5yMCgQ+sFL0l9EM=;
        b=eQqdiWKgPHeSx4xfCxX1H5DgJZrbwV3JYUBgOTmElsqTxaLnNjswGlcRNmfo6JsaPC
         w1/0ndXprpdS2OKRLlqy9EX6GQps95kRnVbVEKxzoTmS9/Bpr4rTu/sGAVJb84wSnHpo
         q0lmpyrKYB/FIMJ3i1x07HtN4DTp+TbbfqCybKLNuXD1gzjRfgarkBL9w/KU4Mscikxn
         IbcmH85NOcC435fU30N85IwS0saztYYeGpARdBuuINlaO0/AMWxY/NRd+xhJTFtmicpn
         42Bp9dHn9UiZrk6ILqeKOb0euhDrcRq7uTDCM1pGvf0HiuzGlDXz60R8VUJKjrxoHPff
         uTrA==
X-Gm-Message-State: AOJu0Yy+aApuSOyAgYGdNEX5irsHSpYCDer1UlWjQ5FOf+lC3mxKlqv+
	qNx03AkW8BqMTzlEZT5kxDlL4XbGzDbYtjf5UnkMMSPc5gOJZJ6wRvfj33Nv169byi12Dm2hmmW
	cfGb1VugRkYzQcocFmbLIyqn4mk85RNBNBzP7k/AO027xzcy92aHUvqE3aiMPxZ8hWkO1
X-Gm-Gg: AZuq6aIKcpTVbFBw1TxBfk72PnBgB2UwJ/AWElxfaMGnx7n7TyvlUp0bwtq2oMgOH8m
	O/J1pU0W0Qo5C0lE1jFbLh0AQuZeAeg0nkLe/xuLK/OGIKCxHehUxkNLuDrGKx/X98OkKaOFKBI
	YIb2bDuPG9QnSeJCj+77hURNDD/770tzt/9tY5NojHMUysrA0UixdoIgMlZ8DgfvrxUZqNeGtxK
	EQhPT2nHkGoFRLDLDbHDTzEmRxV70mTqGfWoDQ8zF2G2WzB+fVhACVbs6j2K33INmoeudSqrTKB
	LZikysCS02fpBI+jtODbl7L1XXYqK/PBqNqJvS84x5RayKXgp1jzT8LkUXd/4aYFGu53qfKFkla
	bMzfn10DR3TIzDipwe4Lk61wbLs1n8g==
X-Received: by 2002:a05:620a:1714:b0:8c7:6f8:ae4c with SMTP id af79cd13be357-8cb8ca63ed3mr1323529385a.43.1771935223380;
        Tue, 24 Feb 2026 04:13:43 -0800 (PST)
X-Received: by 2002:a05:620a:1714:b0:8c7:6f8:ae4c with SMTP id af79cd13be357-8cb8ca63ed3mr1323520885a.43.1771935222363;
        Tue, 24 Feb 2026 04:13:42 -0800 (PST)
Received: from hackbox.lan ([86.121.162.109])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-483a9cb4bb3sm262741255e9.14.2026.02.24.04.13.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Feb 2026 04:13:41 -0800 (PST)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
Date: Tue, 24 Feb 2026 14:13:26 +0200
Subject: [PATCH 2/3] arm64: dts: qcom: Introduce Eliza Soc base dtsi
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260224-eliza-base-dt-v1-2-54e8e3a5fe43@oss.qualcomm.com>
References: <20260224-eliza-base-dt-v1-0-54e8e3a5fe43@oss.qualcomm.com>
In-Reply-To: <20260224-eliza-base-dt-v1-0-54e8e3a5fe43@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-47773
X-Developer-Signature: v=1; a=openpgp-sha256; l=35426;
 i=abel.vesa@oss.qualcomm.com; h=from:subject:message-id;
 bh=mr5qY3alhrS65epRxbMQqGa8j4FulUQHe967R/7UJ58=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBpnZXuswRJaw+7+kphwHa1x+/oZbMz0+IrSzea8
 Al/ByTBJX2JAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCaZ2V7gAKCRAbX0TJAJUV
 VgYCD/0X11M+jGdW1rXYxHCgtfna9ItrzTB1yk6iVNtBooCtPRyejJB1tnayDYIPR1RDewdSYMW
 sK/IUHHeuUY0d584y+r8D2Z9zKzDbs07//mtP4Gq4j3/QWCTqF+nMONUMYa1zSlBgKmAqOyj/1V
 gEAvw1/xWLlO04kDlNGv0zYDe8s3mdXm8C3xckqI/Z66abCk/5DBelAq2cFumHFpT0IoJ05FC1h
 omAE4bLOn4Oy0fVa5x10CSU0HvRf7hYvPQhr/uBQWYAG23vWeZ/n1mOQ6GO1hJBGsXfbjKZSbn1
 v9Zz2i/+aG6V7sLXU2b2ocXXo9c4+dh5ObRQO5xLoFobnNBU5sEi1Q41IXKNOQFKBmKcQeAYfwf
 Zfr6tNJrxeQQxouNImULFhp/erI+RPRV3RwnRmdc1sfUvYLU3wEuTgj4ZfCxeESvt65U2qqaW/0
 0KIdtoqiNqexvB/RH2BUnJx0aVMoxqUgF5iKo6KXqvzO/djAVGc8X6zPuLjIfXYWWSq2R3SvpJn
 kH0vxyd556hvym/GyarUsOa+Py218a9OcdEVVQHijz6KdgUbLMJNBW5OvvR8jeh/26/FOCQg82t
 +NK4mtsUdCligz+LZONQz3EYDSecxuUL7UzL1d1QpFytG6ukB/yLg4pFHDfst3++9wFR1RejYFV
 sxcw7ppZhQRQctQ==
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjI0MDA5OCBTYWx0ZWRfX9PW/bSs1djYl
 o1YuanszK1/ANtjNp+fK5sg3OYcujwf/1Uy6Be3nIGy3cvEIoupE8MVooELQyjwfiv6lLksnC0W
 VMP0JhQHT5TM/BZKMGU9GciLdqWjj1CCUp7YF/Dz4NAAWw6ZXNkl8OsjH6lL+ApsBKYQ1EVmSQh
 WxDheqJueDp5KcY4HQ4VY3rxQQKSq1WQonPIwpvzPKN3m4LIv/oNSdIPTVkbcoHbrjpH2rGzHAK
 lUmzJUmodePdI9BBcQ4VdMLYNyCvM1FlT9Aozy3UeEhpYvbo7clHzyfV0Tc+2t4zQ3ZYC0MmyWv
 69cviUT8CH6yLii+1JulAsDE79Y1UYUhviJ4c5j8JOM/V9jYwkHEVlkc4M1ZjUvoM99imvvoS9V
 Yhe6d2qYwDy4ubUCb7y0Dg0Tp+M41qdmkq0HVEMPp/Us8AjH44Gg9K+n1mMyWlaeh0TvunyTcpr
 PsmLKwqPy/czLv8880Q==
X-Proofpoint-GUID: w7KTogoP4zqgqiiDdqZ7L-DRmyWths39
X-Authority-Analysis: v=2.4 cv=Z5Lh3XRA c=1 sm=1 tr=0 ts=699d95f8 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=oauzzCmhM186DRC0Y2yWPg==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=pRl14oN0ttys4K5PzgkA:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-ORIG-GUID: w7KTogoP4zqgqiiDdqZ7L-DRmyWths39
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-24_01,2026-02-23_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 bulkscore=0 adultscore=0 impostorscore=0
 priorityscore=1501 phishscore=0 spamscore=0 malwarescore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2602240098
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-93981-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	FROM_NEQ_ENVFROM(0.00)[abel.vesa@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 4BD69186CA5
X-Rspamd-Action: no action

Introduce the initial support for the Qualcomm Eliza SoC.
It is a high-tier SoC designed for mobile platforms.

The initial submission enables support for:
- CPU nodes with cpufreq and cpuidle support
- Global Clock Controller (GCC)
- Resource State Coordinator (RSC) with clock controller & genpd provider
- Interrupt controller
- Power Domain Controller (PDC)
- Vendor specific SMMU
- SPMI bus arbiter
- Top Control and Status Register (TCSR)
- Top Level Mode Multiplexer (TLMM)
- Debug UART
- Reserved memory nodes
- Interconnect providers
- System timer
- UFS

Co-developed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/eliza.dtsi | 1304 +++++++++++++++++++++++++++++++++++
 1 file changed, 1304 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/eliza.dtsi b/arch/arm64/boot/dts/qcom/eliza.dtsi
new file mode 100644
index 000000000000..d20ef246894a
--- /dev/null
+++ b/arch/arm64/boot/dts/qcom/eliza.dtsi
@@ -0,0 +1,1304 @@
+// SPDX-License-Identifier: BSD-3-Clause
+/*
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ */
+
+#include <dt-bindings/clock/qcom,eliza-gcc.h>
+#include <dt-bindings/clock/qcom,eliza-tcsr.h>
+#include <dt-bindings/clock/qcom,rpmh.h>
+#include <dt-bindings/interconnect/qcom,eliza-rpmh.h>
+#include <dt-bindings/interconnect/qcom,icc.h>
+#include <dt-bindings/interconnect/qcom,osm-l3.h>
+#include <dt-bindings/interrupt-controller/arm-gic.h>
+#include <dt-bindings/power/qcom,rpmhpd.h>
+#include <dt-bindings/soc/qcom,rpmh-rsc.h>
+
+/ {
+	interrupt-parent = <&intc>;
+
+	#address-cells = <2>;
+	#size-cells = <2>;
+
+	cpus {
+		#address-cells = <2>;
+		#size-cells = <0>;
+
+		cpu0: cpu@0 {
+			device_type = "cpu";
+			compatible = "arm,cortex-a520";
+			reg = <0x0 0x0>;
+
+			clocks = <&cpufreq_hw 0>;
+
+			power-domains = <&cpu_pd0>;
+			power-domain-names = "psci";
+
+			enable-method = "psci";
+			next-level-cache = <&l2_0>;
+			capacity-dmips-mhz = <1024>;
+			dynamic-power-coefficient = <100>;
+
+			qcom,freq-domain = <&cpufreq_hw 0>;
+
+			l2_0: l2-cache {
+				compatible = "cache";
+				cache-level = <2>;
+				cache-unified;
+				next-level-cache = <&l3>;
+			};
+		};
+
+		cpu1: cpu@100 {
+			device_type = "cpu";
+			compatible = "arm,cortex-a520";
+			reg = <0x0 0x100>;
+
+			clocks = <&cpufreq_hw 0>;
+
+			power-domains = <&cpu_pd1>;
+			power-domain-names = "psci";
+
+			enable-method = "psci";
+			next-level-cache = <&l2_0>;
+			capacity-dmips-mhz = <1024>;
+			dynamic-power-coefficient = <100>;
+
+			qcom,freq-domain = <&cpufreq_hw 0>;
+		};
+
+		cpu2: cpu@200 {
+			device_type = "cpu";
+			compatible = "arm,cortex-a520";
+			reg = <0x0 0x200>;
+
+			clocks = <&cpufreq_hw 0>;
+
+			power-domains = <&cpu_pd2>;
+			power-domain-names = "psci";
+
+			enable-method = "psci";
+			next-level-cache = <&l2_2>;
+			capacity-dmips-mhz = <1024>;
+			dynamic-power-coefficient = <100>;
+
+			qcom,freq-domain = <&cpufreq_hw 0>;
+
+			l2_2: l2-cache {
+				compatible = "cache";
+				cache-level = <2>;
+				cache-unified;
+				next-level-cache = <&l3>;
+			};
+		};
+
+		cpu3: cpu@300 {
+			device_type = "cpu";
+			compatible = "arm,cortex-a720";
+			reg = <0x0 0x300>;
+
+			clocks = <&cpufreq_hw 1>;
+
+			power-domains = <&cpu_pd3>;
+			power-domain-names = "psci";
+
+			enable-method = "psci";
+			next-level-cache = <&l2_3>;
+			capacity-dmips-mhz = <1792>;
+			dynamic-power-coefficient = <238>;
+
+			qcom,freq-domain = <&cpufreq_hw 1>;
+
+			l2_3: l2-cache {
+				compatible = "cache";
+				cache-level = <2>;
+				cache-unified;
+				next-level-cache = <&l3>;
+			};
+		};
+
+		cpu4: cpu@400 {
+			device_type = "cpu";
+			compatible = "arm,cortex-a720";
+			reg = <0x0 0x400>;
+
+			clocks = <&cpufreq_hw 1>;
+
+			power-domains = <&cpu_pd4>;
+			power-domain-names = "psci";
+
+			enable-method = "psci";
+			next-level-cache = <&l2_4>;
+			capacity-dmips-mhz = <1792>;
+			dynamic-power-coefficient = <238>;
+
+			qcom,freq-domain = <&cpufreq_hw 1>;
+
+			l2_4: l2-cache {
+				compatible = "cache";
+				cache-level = <2>;
+				cache-unified;
+				next-level-cache = <&l3>;
+			};
+		};
+
+		cpu5: cpu@500 {
+			device_type = "cpu";
+			compatible = "arm,cortex-a720";
+			reg = <0x0 0x500>;
+
+			clocks = <&cpufreq_hw 1>;
+
+			power-domains = <&cpu_pd5>;
+			power-domain-names = "psci";
+
+			enable-method = "psci";
+			next-level-cache = <&l2_5>;
+			capacity-dmips-mhz = <1792>;
+			dynamic-power-coefficient = <238>;
+
+			qcom,freq-domain = <&cpufreq_hw 1>;
+
+			l2_5: l2-cache {
+				compatible = "cache";
+				cache-level = <2>;
+				cache-unified;
+				next-level-cache = <&l3>;
+			};
+		};
+
+		cpu6: cpu@600 {
+			device_type = "cpu";
+			compatible = "arm,cortex-a720";
+			reg = <0x0 0x600>;
+
+			clocks = <&cpufreq_hw 1>;
+
+			power-domains = <&cpu_pd6>;
+			power-domain-names = "psci";
+
+			enable-method = "psci";
+			next-level-cache = <&l2_6>;
+			capacity-dmips-mhz = <1792>;
+			dynamic-power-coefficient = <238>;
+
+			qcom,freq-domain = <&cpufreq_hw 1>;
+
+			l2_6: l2-cache {
+				compatible = "cache";
+				cache-level = <2>;
+				cache-unified;
+				next-level-cache = <&l3>;
+			};
+		};
+
+		cpu7: cpu@700 {
+			device_type = "cpu";
+			compatible = "arm,cortex-x3";
+			reg = <0x0 0x700>;
+
+			clocks = <&cpufreq_hw 2>;
+
+			power-domains = <&cpu_pd7>;
+			power-domain-names = "psci";
+
+			enable-method = "psci";
+			next-level-cache = <&l2_7>;
+			capacity-dmips-mhz = <1894>;
+			dynamic-power-coefficient = <588>;
+
+			qcom,freq-domain = <&cpufreq_hw 2>;
+
+			l2_7: l2-cache {
+				compatible = "cache";
+				cache-level = <2>;
+				cache-unified;
+				next-level-cache = <&l3>;
+			};
+		};
+
+		cpu-map {
+			cluster0 {
+				core0 {
+					cpu = <&cpu0>;
+				};
+
+				core1 {
+					cpu = <&cpu1>;
+				};
+
+				core2 {
+					cpu = <&cpu2>;
+				};
+			};
+
+			cluster1 {
+				core0 {
+					cpu = <&cpu3>;
+				};
+
+				core1 {
+					cpu = <&cpu4>;
+				};
+
+				core2 {
+					cpu = <&cpu5>;
+				};
+
+				core3 {
+					cpu = <&cpu6>;
+				};
+			};
+
+			cluster2 {
+				core0 {
+					cpu = <&cpu7>;
+				};
+			};
+		};
+
+		l3: l3-cache {
+			compatible = "cache";
+			cache-level = <3>;
+			cache-unified;
+		};
+
+		idle-states {
+			entry-method = "psci";
+
+			cluster0_c4: cpu-sleep-0 {
+				compatible = "arm,idle-state";
+				idle-state-name = "silver-rail-power-collapse";
+				arm,psci-suspend-param = <0x40000004>;
+				entry-latency-us = <550>;
+				exit-latency-us = <750>;
+				min-residency-us = <6700>;
+			};
+
+			cluster1_c4: cpu-sleep-1 {
+				compatible = "arm,idle-state";
+				idle-state-name = "gold-rail-power-collapse";
+				arm,psci-suspend-param = <0x40000004>;
+				entry-latency-us = <550>;
+				exit-latency-us = <1050>;
+				min-residency-us = <7951>;
+			};
+
+			cluster2_c4: cpu-sleep-2 {
+				compatible = "arm,idle-state";
+				idle-state-name = "gold-plus-rail-power-collapse";
+				arm,psci-suspend-param = <0x40000004>;
+				entry-latency-us = <500>;
+				exit-latency-us = <1350>;
+				min-residency-us = <7480>;
+			};
+		};
+
+		domain-idle-states {
+			cluster_sleep_0: cluster-sleep-0 {
+				compatible = "domain-idle-state";
+				arm,psci-suspend-param = <0x41000044>;
+				entry-latency-us = <750>;
+				exit-latency-us = <2350>;
+				min-residency-us = <9144>;
+			};
+
+			cluster_sleep_1: cluster-sleep-1 {
+				compatible = "domain-idle-state";
+				arm,psci-suspend-param = <0x4100b344>;
+				entry-latency-us = <2800>;
+				exit-latency-us = <4400>;
+				min-residency-us = <10150>;
+			};
+		};
+	};
+
+	firmware {
+		scm: scm {
+			compatible = "qcom,scm-eliza", "qcom,scm";
+			interconnects = <&aggre2_noc MASTER_CRYPTO QCOM_ICC_TAG_ALWAYS
+					 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
+			qcom,dload-mode = <&tcsr 0x1A000>;
+		};
+	};
+
+	clk_virt: interconnect-0 {
+		compatible = "qcom,eliza-clk-virt";
+		#interconnect-cells = <2>;
+		qcom,bcm-voters = <&apps_bcm_voter>;
+	};
+
+	mc_virt: interconnect-1 {
+		compatible = "qcom,eliza-mc-virt";
+		#interconnect-cells = <2>;
+		qcom,bcm-voters = <&apps_bcm_voter>;
+	};
+
+	memory@a0000000 {
+		device_type = "memory";
+		/* We expect the bootloader to fill in the size */
+		reg = <0x0 0xa0000000 0x0 0x0>;
+	};
+
+	psci {
+		compatible = "arm,psci-1.0";
+		method = "smc";
+
+		cpu_pd0: power-domain-cpu0 {
+			#power-domain-cells = <0>;
+			power-domains = <&cluster_pd>;
+			domain-idle-states = <&cluster0_c4>;
+		};
+
+		cpu_pd1: power-domain-cpu1 {
+			#power-domain-cells = <0>;
+			power-domains = <&cluster_pd>;
+			domain-idle-states = <&cluster0_c4>;
+		};
+
+		cpu_pd2: power-domain-cpu2 {
+			#power-domain-cells = <0>;
+			power-domains = <&cluster_pd>;
+			domain-idle-states = <&cluster0_c4>;
+		};
+
+		cpu_pd3: power-domain-cpu3 {
+			#power-domain-cells = <0>;
+			power-domains = <&cluster_pd>;
+			domain-idle-states = <&cluster1_c4>;
+		};
+
+		cpu_pd4: power-domain-cpu4 {
+			#power-domain-cells = <0>;
+			power-domains = <&cluster_pd>;
+			domain-idle-states = <&cluster1_c4>;
+		};
+
+		cpu_pd5: power-domain-cpu5 {
+			#power-domain-cells = <0>;
+			power-domains = <&cluster_pd>;
+			domain-idle-states = <&cluster1_c4>;
+		};
+
+		cpu_pd6: power-domain-cpu6 {
+			#power-domain-cells = <0>;
+			power-domains = <&cluster_pd>;
+			domain-idle-states = <&cluster1_c4>;
+		};
+
+		cpu_pd7: power-domain-cpu7 {
+			#power-domain-cells = <0>;
+			power-domains = <&cluster_pd>;
+			domain-idle-states = <&cluster2_c4>;
+		};
+
+		cluster_pd: power-domain-cluster {
+			#power-domain-cells = <0>;
+			domain-idle-states = <&cluster_sleep_0>,
+					     <&cluster_sleep_1>;
+		};
+	};
+
+	reserved-memory {
+		#address-cells = <2>;
+		#size-cells = <2>;
+		ranges;
+
+		gunyah_hyp_mem: gunyah-hyp@80000000 {
+			reg = <0x0 0x80000000 0x0 0xe00000>;
+			no-map;
+		};
+
+		cpusys_vm_mem: cpusys-vm-mem@80e00000 {
+			reg = <0x0 0x80e00000 0x0 0x40000>;
+			no-map;
+		};
+
+		cpucp_mem: cpucp@81200000 {
+			reg = <0x0 0x81200000 0x0 0x200000>;
+			no-map;
+		};
+
+		xbl_dtlog_mem: xbl-dtlog@81a00000 {
+			reg = <0x0 0x81a00000 0x0 0x40000>;
+			no-map;
+		};
+
+		aop_image_mem: aop-image@81c00000 {
+			reg = <0x0 0x81c00000 0x0 0x60000>;
+			no-map;
+		};
+
+		aop_cmd_db_mem: aop-cmd-db@81c60000 {
+			compatible = "qcom,cmd-db";
+			reg = <0x0 0x81c60000 0x0 0x20000>;
+			no-map;
+		};
+
+		/* Merged aop_config, tme_crash_dump, tme_log and uefi_log regions */
+		aop_tme_uefi_merged_mem: aop-tme-uefi-merged@81c80000 {
+			reg = <0x0 0x81c80000 0x0 0x74000>;
+			no-map;
+		};
+
+		/* Secdata region can be reused by apps */
+		smem_mem: smem@81d00000 {
+			compatible = "qcom,smem";
+			reg = <0x0 0x81d00000 0x0 0x200000>;
+			hwlocks = <&tcsr_mutex 3>;
+			no-map;
+		};
+
+		cpucp_scandump_mem: cpucp-scandump@82000000 {
+			reg = <0x0 0x82200000 0x0 0x180000>;
+			no-map;
+		};
+
+		adsp_mhi_mem: adsp-mhi@82380000 {
+			reg = <0x0 0x82380000 0x0 0x20000>;
+			no-map;
+		};
+
+		soccp_sdi_mem: soccp-sdi@823a0000 {
+			reg = <0x0 0x823a0000 0x0 0x40000>;
+			no-map;
+		};
+
+		pmic_minii_dump_mem: pmic-minii-dump@823e0000 {
+			reg = <0x0 0x823e0000 0x0 0x80000>;
+			no-map;
+		};
+
+		pvmfw_mem: pvmfw@824a0000 {
+			reg = <0x0 0x824a0000 0x0 0x100000>;
+			no-map;
+		};
+
+		hyp_db_mem: hyp-db@825a0000 {
+			reg = <0x0 0x825a0000 0x0 0x60000>;
+			no-map;
+		};
+
+		global_sync_mem: global-sync@82600000 {
+			reg = <0x0 0x82600000 0x0 0x100000>;
+			no-map;
+		};
+
+		tz_stat_mem: tz-stat@82700000 {
+			reg = <0x0 0x82700000 0x0 0x100000>;
+			no-map;
+		};
+
+		qdss_mem: qdss@82800000 {
+			reg = <0x0 0x82800000 0x0 0x2000000>;
+			no-map;
+		};
+
+		dsm_partition_1_mem: dsm-partition-1@84a00000 {
+			reg = <0x0 0x84a00000 0x0 0x3700000>;
+			no-map;
+		};
+
+		mpss_mem: mpss@88100000 {
+			reg = <0x0 0x88100000 0x0 0xcd00000>;
+			no-map;
+		};
+
+		q6_mpss_dtb_mem: q6-mpss-dtb@94e00000 {
+			reg = <0x0 0x94e00000 0x0 0x80000>;
+			no-map;
+		};
+
+		ipa_fw_mem: ipa-fw@94e80000 {
+			reg = <0x0 0x94e80000 0x0 0x10000>;
+			no-map;
+		};
+
+		ipa_gsi_mem: ipa-gsi@94e90000 {
+			reg = <0x0 0x94e90000 0x0 0xa000>;
+			no-map;
+		};
+
+		gpu_micro_code_mem: gpu-micro-code@94e9a000 {
+			reg = <0x0 0x94e9a000 0x0 0x2000>;
+			no-map;
+		};
+
+		camera_mem: camera@94f00000 {
+			reg = <0x0 0x94f00000 0x0 0x800000>;
+			no-map;
+		};
+
+		camera_2_mem: camera-2@95700000 {
+			reg = <0x0 0x95700000 0x0 0x800000>;
+			no-map;
+		};
+
+		video_mem: video@95f00000 {
+			reg = <0x0 0x95f00000 0x0 0x800000>;
+			no-map;
+		};
+
+		soccp_mem: soccp@96700000 {
+			reg = <0x0 0x96700000 0x0 0x180000>;
+			no-map;
+		};
+
+		wpss_mem: wpss@97000000 {
+			reg = <0x0 0x97000000 0x0 0x1900000>;
+			no-map;
+		};
+
+		cdsp_mem: cdsp@98900000 {
+			reg = <0x0 0x98900000 0x0 0x1400000>;
+			no-map;
+		};
+
+		q6_cdsp_dtb_mem: q6-cdsp-dtb@99d00000 {
+			reg = <0x0 0x99d00000 0x0 0x80000>;
+			no-map;
+		};
+
+		q6_adsp_dtb_mem: q6-adsp-dtb@99d80000 {
+			reg = <0x0 0x99d80000 0x0 0x80000>;
+			no-map;
+		};
+
+		adspslpi_mem: adspslpi@99e00000 {
+			reg = <0x0 0x99e00000 0x0 0x2a00000>;
+			no-map;
+		};
+
+		wlan_msa_mem: wlan-msa@a6400000 {
+			reg = <0x0 0xa6400000 0x0 0xc00000>;
+			no-map;
+		};
+
+		xbl_ramdump_mem: xbl-ramdump@b8000000 {
+			reg = <0x0 0xb8000000 0x0 0x1c0000>;
+			no-map;
+		};
+
+		/* Merged tz_reserved, xbl_sc, and qtee regions */
+		tz_merged_mem: tz-merged@d8000000 {
+			reg = <0x0 0xd8000000 0x0 0x600000>;
+			no-map;
+		};
+
+		trust_ui_vm_mem: trust-ui-vm@f3800000 {
+			reg = <0x0 0xf3800000 0x0 0x4400000>;
+			no-map;
+		};
+
+		oem_vm_mem: oem-vm@f7c00000 {
+			reg = <0x0 0xf7c00000 0x0 0x4c00000>;
+			no-map;
+		};
+
+		llcc_lpi_mem: llcc-lpi@ff800000 {
+			reg = <0x0 0xff800000 0x0 0x180000>;
+			no-map;
+		};
+	};
+
+	soc: soc@0 {
+		compatible = "simple-bus";
+
+		#address-cells = <2>;
+		#size-cells = <2>;
+		dma-ranges = <0x0 0x0 0x0 0x0 0x10 0x0>;
+		ranges = <0x0 0x0 0x0 0x0 0x10 0x0>;
+
+		gcc: clock-controller@100000 {
+			compatible = "qcom,eliza-gcc";
+			reg = <0x0 0x00100000 0x0 0x1f4200>;
+
+			clocks = <&bi_tcxo_div2>,
+				 <&sleep_clk>,
+				 <0>,
+				 <0>,
+				 <&ufs_mem_phy 0>,
+				 <&ufs_mem_phy 1>,
+				 <&ufs_mem_phy 2>,
+				 <0>;
+
+			#clock-cells = <1>;
+			#reset-cells = <1>;
+			#power-domain-cells = <1>;
+		};
+
+		qupv3_2: geniqup@8c0000 {
+			compatible = "qcom,geni-se-qup";
+			reg = <0x0 0x008c0000 0x0 0x2000>;
+
+			clocks = <&gcc GCC_QUPV3_WRAP_2_M_AHB_CLK>,
+				 <&gcc GCC_QUPV3_WRAP_2_S_AHB_CLK>;
+			clock-names = "m-ahb",
+				      "s-ahb";
+
+			iommus = <&apps_smmu 0x423 0x0>;
+
+			#address-cells = <2>;
+			#size-cells = <2>;
+			ranges;
+
+			status = "disabled";
+
+			uart14: serial@894000 {
+				compatible = "qcom,geni-uart";
+				reg = <0x0 0x00894000 0x0 0x4000>;
+
+				interrupts = <GIC_SPI 587 IRQ_TYPE_LEVEL_HIGH>;
+
+				clocks = <&gcc GCC_QUPV3_WRAP2_S5_CLK>;
+				clock-names = "se";
+
+				interconnects = <&clk_virt MASTER_QUP_CORE_2 QCOM_ICC_TAG_ALWAYS
+						 &clk_virt SLAVE_QUP_CORE_2 QCOM_ICC_TAG_ALWAYS>,
+						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
+						 &config_noc SLAVE_QUP_2 QCOM_ICC_TAG_ALWAYS>;
+				interconnect-names = "qup-core",
+						     "qup-config";
+
+				pinctrl-0 = <&qup_uart14_default>;
+				pinctrl-names = "default";
+
+				status = "disabled";
+			};
+		};
+
+		config_noc: interconnect@1600000 {
+			compatible = "qcom,eliza-cnoc-cfg";
+			reg = <0x0 0x01600000 0x0 0x5200>;
+			qcom,bcm-voters = <&apps_bcm_voter>;
+			#interconnect-cells = <2>;
+		};
+
+		cnoc_main: interconnect@1500000 {
+			compatible = "qcom,eliza-cnoc-main";
+			reg = <0x0 0x01500000 0x0 0x16080>;
+			qcom,bcm-voters = <&apps_bcm_voter>;
+			#interconnect-cells = <2>;
+		};
+
+		system_noc: interconnect@1680000 {
+			compatible = "qcom,eliza-system-noc";
+			reg = <0x0 0x01680000 0x0 0x40000>;
+			qcom,bcm-voters = <&apps_bcm_voter>;
+			#interconnect-cells = <2>;
+		};
+
+		pcie_noc: interconnect@16c0000 {
+			compatible = "qcom,eliza-pcie-anoc";
+			reg = <0x0 0x016c0000 0x0 0x11400>;
+			qcom,bcm-voters = <&apps_bcm_voter>;
+			clocks = <&gcc GCC_AGGRE_NOC_PCIE_AXI_CLK>,
+				<&gcc GCC_CFG_NOC_PCIE_ANOC_AHB_CLK>;
+			#interconnect-cells = <2>;
+		};
+
+		aggre1_noc: interconnect@16e0000 {
+			compatible = "qcom,eliza-aggre1-noc";
+			reg = <0x0 0x016e0000 0x0 0x16400>;
+			qcom,bcm-voters = <&apps_bcm_voter>;
+			clocks = <&gcc GCC_AGGRE_UFS_PHY_AXI_CLK>,
+				 <&gcc GCC_AGGRE_USB3_PRIM_AXI_CLK>;
+			#interconnect-cells = <2>;
+		};
+
+		aggre2_noc: interconnect@1700000 {
+			compatible = "qcom,eliza-aggre2-noc";
+			reg = <0x0 0x01700000 0x0 0x1f400>;
+			qcom,bcm-voters = <&apps_bcm_voter>;
+			clocks = <&rpmhcc RPMH_IPA_CLK>;
+			#interconnect-cells = <2>;
+		};
+
+		mmss_noc: interconnect@1780000 {
+			compatible = "qcom,eliza-mmss-noc";
+			reg = <0x0 0x01780000 0x0 0x7d800>;
+			qcom,bcm-voters = <&apps_bcm_voter>;
+			#interconnect-cells = <2>;
+		};
+
+		ufs_mem_phy: phy@1d80000 {
+			compatible = "qcom,eliza-qmp-ufs-phy",
+				     "qcom,sm8650-qmp-ufs-phy";
+			reg = <0x0 0x01d80000 0x0 0x2000>;
+
+			clocks = <&rpmhcc RPMH_CXO_CLK>,
+				 <&gcc GCC_UFS_PHY_PHY_AUX_CLK>,
+				 <&tcsr TCSR_UFS_CLKREF_EN>;
+
+			clock-names = "ref",
+				      "ref_aux",
+				      "qref";
+
+			resets = <&ufs_mem_hc 0>;
+			reset-names = "ufsphy";
+
+			power-domains = <&gcc GCC_UFS_MEM_PHY_GDSC>;
+
+			#clock-cells = <1>;
+			#phy-cells = <0>;
+
+			status = "disabled";
+		};
+
+		ufs_mem_hc: ufshc@1d84000 {
+			compatible = "qcom,eliza-ufshc",
+				     "qcom,ufshc",
+				     "jedec,ufs-2.0";
+			reg = <0x0 0x01d84000 0x0 0x3000>;
+
+			interrupts = <GIC_SPI 265 IRQ_TYPE_LEVEL_HIGH>;
+
+			clocks = <&gcc GCC_UFS_PHY_AXI_CLK>,
+				 <&gcc GCC_AGGRE_UFS_PHY_AXI_CLK>,
+				 <&gcc GCC_UFS_PHY_AHB_CLK>,
+				 <&gcc GCC_UFS_PHY_UNIPRO_CORE_CLK>,
+				 <&rpmhcc RPMH_LN_BB_CLK3>,
+				 <&gcc GCC_UFS_PHY_TX_SYMBOL_0_CLK>,
+				 <&gcc GCC_UFS_PHY_RX_SYMBOL_0_CLK>,
+				 <&gcc GCC_UFS_PHY_RX_SYMBOL_1_CLK>;
+			clock-names = "core_clk",
+				      "bus_aggr_clk",
+				      "iface_clk",
+				      "core_clk_unipro",
+				      "ref_clk",
+				      "tx_lane0_sync_clk",
+				      "rx_lane0_sync_clk",
+				      "rx_lane1_sync_clk";
+
+			operating-points-v2 = <&ufs_opp_table>;
+
+			resets = <&gcc GCC_UFS_PHY_BCR>;
+			reset-names = "rst";
+
+			interconnects = <&aggre1_noc MASTER_UFS_MEM QCOM_ICC_TAG_ALWAYS
+					 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>,
+					<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ACTIVE_ONLY
+					 &config_noc SLAVE_UFS_MEM_CFG QCOM_ICC_TAG_ACTIVE_ONLY>;
+			interconnect-names = "ufs-ddr",
+					     "cpu-ufs";
+
+			power-domains = <&gcc GCC_UFS_PHY_GDSC>;
+			required-opps = <&rpmhpd_opp_nom>;
+
+			iommus = <&apps_smmu 0x60 0x0>;
+			dma-coherent;
+
+			lanes-per-direction = <2>;
+			qcom,ice = <&ice>;
+
+			phys = <&ufs_mem_phy>;
+			phy-names = "ufsphy";
+
+			#reset-cells = <1>;
+
+			status = "disabled";
+
+			ufs_opp_table: opp-table {
+				compatible = "operating-points-v2";
+
+				opp-75000000 {
+					opp-hz = /bits/ 64 <75000000>,
+						 /bits/ 64 <0>,
+						 /bits/ 64 <0>,
+						 /bits/ 64 <75000000>,
+						 /bits/ 64 <0>,
+						 /bits/ 64 <0>,
+						 /bits/ 64 <0>,
+						 /bits/ 64 <0>;
+					required-opps = <&rpmhpd_opp_low_svs_d1>;
+				};
+
+				opp-100000000 {
+					opp-hz = /bits/ 64 <100000000>,
+						 /bits/ 64 <0>,
+						 /bits/ 64 <0>,
+						 /bits/ 64 <100000000>,
+						 /bits/ 64 <0>,
+						 /bits/ 64 <0>,
+						 /bits/ 64 <0>,
+						 /bits/ 64 <0>;
+					required-opps = <&rpmhpd_opp_low_svs>;
+				};
+
+				opp-403000000 {
+					opp-hz = /bits/ 64 <403000000>,
+						 /bits/ 64 <0>,
+						 /bits/ 64 <0>,
+						 /bits/ 64 <403000000>,
+						 /bits/ 64 <0>,
+						 /bits/ 64 <0>,
+						 /bits/ 64 <0>,
+						 /bits/ 64 <0>;
+					required-opps = <&rpmhpd_opp_nom>;
+				};
+			};
+		};
+
+		ice: crypto@1d88000 {
+			compatible = "qcom,eliza-inline-crypto-engine",
+				     "qcom,inline-crypto-engine";
+			reg = <0x0 0x01d88000 0x0 0x18000>;
+
+			clocks = <&gcc GCC_UFS_PHY_ICE_CORE_CLK>;
+		};
+
+		tcsr_mutex: hwlock@1f40000 {
+			compatible = "qcom,tcsr-mutex";
+			reg = <0x0 0x01f40000 0x0 0x20000>;
+			#hwlock-cells = <1>;
+		};
+
+		tcsr: clock-controller@1fbf000 {
+			compatible = "qcom,eliza-tcsr", "syscon";
+			reg = <0x0 0x01fbf000 0x0 0x21000>;
+
+			clocks = <&rpmhcc RPMH_CXO_CLK>;
+
+			#clock-cells = <1>;
+			#reset-cells = <1>;
+		};
+
+		lpass_ag_noc: interconnect@7e40000 {
+			compatible = "qcom,eliza-lpass-ag-noc";
+			reg = <0x0 0x07e40000 0x0 0xe080>;
+			qcom,bcm-voters = <&apps_bcm_voter>;
+			#interconnect-cells = <2>;
+		};
+
+		lpass_lpiaon_noc: interconnect@7400000 {
+			compatible = "qcom,eliza-lpass-lpiaon-noc";
+			reg = <0x0 0x07400000 0x0 0x19080>;
+			qcom,bcm-voters = <&apps_bcm_voter>;
+			#interconnect-cells = <2>;
+		};
+
+		lpass_lpicx_noc: interconnect@7420000 {
+			compatible = "qcom,eliza-lpass-lpicx-noc";
+			reg = <0x0 0x07420000 0x0 0x44080>;
+			qcom,bcm-voters = <&apps_bcm_voter>;
+			#interconnect-cells = <2>;
+		};
+
+		pdc: interrupt-controller@b220000 {
+			compatible = "qcom,eliza-pdc", "qcom,pdc";
+			reg = <0x0 0x0b220000 0x0 0x10000>,
+			      <0x0 0x174000f0 0x0 0x64>;
+
+			qcom,pdc-ranges = <0 480 8>, <8 719 1>, <9 718 1>,
+					  <10 230 1>, <11 724 1>, <12 716 1>,
+					  <13 727 1>, <14 720 1>, <15 726 1>,
+					  <16 721 1>, <17 262 1>, <18 70 1>,
+					  <19 723 1>, <20 234 1>, <22 725 1>,
+					  <23 231 1>, <24 504 5>, <30 510 8>,
+					  <40 520 6>, <51 531 4>, <58 538 2>,
+					  <61 541 5>, <66 92 1>, <67 547 13>,
+					  <80 240 1>, <81 235 1>, <82 310 2>,
+					  <84 248 1>, <85 241 1>, <86 238 2>,
+					  <88 254 1>, <89 509 1>, <90 563 1>,
+					  <91 259 2>, <93 201 1>, <94 246 1>,
+					  <95 93 1>, <96 611 29>, <125 63 1>,
+					  <126 366 2>, <128 374 1>, <129 377 1>,
+					  <130 428 1>, <131 434 2>, <133 437 1>,
+					  <134 452 2>, <136 458 2>, <138 464 11>,
+					  <149 671 1>, <150 688 1>, <151 714 2>,
+					  <153 722 1>, <154 255 1>, <155 269 2>,
+					  <157 276 1>, <158 287 1>, <159 306 4>;
+			#interrupt-cells = <2>;
+			interrupt-parent = <&intc>;
+			interrupt-controller;
+		};
+
+		spmi_bus: spmi@c400000 {
+			compatible = "qcom,spmi-pmic-arb";
+			reg = <0x0 0x0c400000 0x0 0x3000>,
+			      <0x0 0x0c500000 0x0 0x400000>,
+			      <0x0 0x0c440000 0x0 0x80000>,
+			      <0x0 0x0c4c0000 0x0 0x10000>,
+			      <0x0 0x0c42d000 0x0 0x4000>;
+			reg-names = "core",
+				    "chnls",
+				    "obsrvr",
+				    "intr",
+				    "cnfg";
+
+			interrupts-extended = <&pdc 1 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "periph_irq";
+
+			qcom,ee = <0>;
+			qcom,channel = <0>;
+			qcom,bus-id = <0>;
+
+			interrupt-controller;
+			#interrupt-cells = <4>;
+
+			#address-cells = <2>;
+			#size-cells = <0>;
+		};
+
+		apps_smmu: iommu@15000000 {
+			compatible = "qcom,eliza-smmu-500", "qcom,smmu-500", "arm,mmu-500";
+			reg = <0x0 0x15000000 0x0 0x100000>;
+
+			interrupts = <GIC_SPI 65 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 97 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 98 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 99 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 100 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 101 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 102 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 103 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 104 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 105 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 106 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 107 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 108 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 109 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 110 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 111 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 112 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 113 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 114 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 115 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 116 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 117 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 118 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 181 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 182 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 183 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 184 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 185 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 186 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 187 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 188 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 189 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 190 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 191 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 192 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 315 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 316 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 317 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 318 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 319 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 320 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 321 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 322 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 323 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 324 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 325 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 326 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 327 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 328 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 329 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 330 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 331 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 332 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 333 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 334 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 335 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 336 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 337 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 338 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 339 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 340 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 341 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 342 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 343 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 344 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 345 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 395 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 396 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 397 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 398 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 399 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 400 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 401 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 402 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 403 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 404 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 405 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 406 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 407 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 408 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 409 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 418 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 419 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 412 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 421 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 707 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 423 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 424 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 425 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 690 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 691 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 692 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 693 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 694 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 695 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 696 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 697 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 410 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 488 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 489 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 490 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 491 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 492 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 493 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 494 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 495 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 496 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 497 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 498 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 499 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 500 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 501 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 502 IRQ_TYPE_LEVEL_HIGH>;
+
+			#iommu-cells = <2>;
+			#global-interrupts = <1>;
+
+			dma-coherent;
+		};
+
+		intc: interrupt-controller@17100000 {
+			compatible = "arm,gic-v3";
+			reg = <0x0 0x17100000 0x0 0x10000>,
+			      <0x0 0x17180000 0x0 0x200000>;
+
+			interrupts = <GIC_PPI 9 IRQ_TYPE_LEVEL_HIGH>;
+
+			#interrupt-cells = <3>;
+			interrupt-controller;
+
+			#redistributor-regions = <1>;
+			redistributor-stride = <0x0 0x40000>;
+
+			#address-cells = <2>;
+			#size-cells = <2>;
+			ranges;
+
+			gic_its: msi-controller@17140000 {
+				compatible = "arm,gic-v3-its";
+				reg = <0x0 0x17140000 0x0 0x20000>;
+
+				msi-controller;
+				#msi-cells = <1>;
+			};
+		};
+
+		apps_rsc: rsc@17a00000 {
+			compatible = "qcom,rpmh-rsc";
+			reg = <0x0 0x17a00000 0x0 0x10000>,
+			      <0x0 0x17a10000 0x0 0x10000>,
+			      <0x0 0x17a20000 0x0 0x10000>;
+			reg-names = "drv-0",
+				    "drv-1",
+				    "drv-2";
+
+			interrupts = <GIC_SPI 3 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 4 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 5 IRQ_TYPE_LEVEL_HIGH>;
+
+			power-domains = <&cluster_pd>;
+			label = "apps_rsc";
+
+			qcom,tcs-offset = <0xd00>;
+			qcom,drv-id = <2>;
+			qcom,tcs-config = <ACTIVE_TCS 3>,
+					  <SLEEP_TCS 2>,
+					  <WAKE_TCS 2>,
+					  <CONTROL_TCS 0>;
+
+			apps_bcm_voter: bcm-voter {
+				compatible = "qcom,bcm-voter";
+			};
+
+			rpmhcc: clock-controller {
+				compatible = "qcom,eliza-rpmh-clk";
+				#clock-cells = <1>;
+				clocks = <&xo_board>;
+				clock-names = "xo";
+			};
+
+			rpmhpd: power-controller {
+				compatible = "qcom,eliza-rpmhpd";
+
+				operating-points-v2 = <&rpmhpd_opp_table>;
+
+				#power-domain-cells = <1>;
+
+				rpmhpd_opp_table: opp-table {
+					compatible = "operating-points-v2";
+
+					rpmhpd_opp_ret: opp-16 {
+						opp-level = <RPMH_REGULATOR_LEVEL_RETENTION>;
+					};
+
+					rpmhpd_opp_min_svs: opp-48 {
+						opp-level = <RPMH_REGULATOR_LEVEL_MIN_SVS>;
+					};
+
+					rpmhpd_opp_low_svs_d3: opp-50 {
+						opp-level = <RPMH_REGULATOR_LEVEL_LOW_SVS_D3>;
+					};
+
+					rpmhpd_opp_low_svs_d2: opp-52 {
+						opp-level = <RPMH_REGULATOR_LEVEL_LOW_SVS_D2>;
+					};
+
+					rpmhpd_opp_low_svs_d1: opp-56 {
+						opp-level = <RPMH_REGULATOR_LEVEL_LOW_SVS_D1>;
+					};
+
+					rpmhpd_opp_low_svs_d0: opp-60 {
+						opp-level = <RPMH_REGULATOR_LEVEL_LOW_SVS_D0>;
+					};
+
+					rpmhpd_opp_low_svs: opp-64 {
+						opp-level = <RPMH_REGULATOR_LEVEL_LOW_SVS>;
+					};
+
+					rpmhpd_opp_low_svs_l1: opp-80 {
+						opp-level = <RPMH_REGULATOR_LEVEL_LOW_SVS_L1>;
+					};
+
+					rpmhpd_opp_svs: opp-128 {
+						opp-level = <RPMH_REGULATOR_LEVEL_SVS>;
+					};
+
+					rpmhpd_opp_svs_l0: opp-144 {
+						opp-level = <RPMH_REGULATOR_LEVEL_SVS_L0>;
+					};
+
+					rpmhpd_opp_svs_l1: opp-192 {
+						opp-level = <RPMH_REGULATOR_LEVEL_SVS_L1>;
+					};
+
+					rpmhpd_opp_svs_l2: opp-224 {
+						opp-level = <RPMH_REGULATOR_LEVEL_SVS_L2>;
+					};
+
+					rpmhpd_opp_nom: opp-256 {
+						opp-level = <RPMH_REGULATOR_LEVEL_NOM>;
+					};
+
+					rpmhpd_opp_nom_l1: opp-320 {
+						opp-level = <RPMH_REGULATOR_LEVEL_NOM_L1>;
+					};
+
+					rpmhpd_opp_nom_l2: opp-336 {
+						opp-level = <RPMH_REGULATOR_LEVEL_NOM_L2>;
+					};
+
+					rpmhpd_opp_turbo: opp-384 {
+						opp-level = <RPMH_REGULATOR_LEVEL_TURBO>;
+					};
+
+					rpmhpd_opp_turbo_l1: opp-416 {
+						opp-level = <RPMH_REGULATOR_LEVEL_TURBO_L1>;
+					};
+
+					rpmhpd_opp_turbo_l2: opp-432 {
+						opp-level = <RPMH_REGULATOR_LEVEL_TURBO_L2>;
+					};
+
+					rpmhpd_opp_turbo_l3: opp-448 {
+						opp-level = <RPMH_REGULATOR_LEVEL_TURBO_L3>;
+					};
+
+					rpmhpd_opp_turbo_l4: opp-452 {
+						opp-level = <RPMH_REGULATOR_LEVEL_TURBO_L4>;
+					};
+
+					rpmhpd_opp_super_turbo_no_cpr: opp-480 {
+						opp-level = <RPMH_REGULATOR_LEVEL_SUPER_TURBO_NO_CPR>;
+					};
+				};
+			};
+		};
+
+		epss_l3: interconnect@17d90000 {
+			compatible = "qcom,eliza-epss-l3", "qcom,epss-l3";
+			reg = <0x0 0x17d90000 0x0 0x1000>;
+
+			clocks = <&bi_tcxo_div2>, <&gcc GCC_GPLL0>;
+			clock-names = "xo", "alternate";
+
+			#interconnect-cells = <1>;
+		};
+
+		cpufreq_hw: cpufreq@17d91000 {
+			compatible = "qcom,eliza-cpufreq-epss", "qcom,cpufreq-epss";
+			reg = <0x0 0x17d91000 0x0 0x1000>,
+			      <0x0 0x17d92000 0x0 0x1000>,
+			      <0x0 0x17d93000 0x0 0x1000>;
+			reg-names = "freq-domain0",
+				    "freq-domain1",
+				    "freq-domain2";
+
+			interrupts = <GIC_SPI 30 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 31 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 19 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "dcvsh-irq-0",
+					  "dcvsh-irq-1",
+					  "dcvsh-irq-2";
+
+			clocks = <&bi_tcxo_div2>, <&gcc GCC_GPLL0>;
+			clock-names = "xo", "alternate";
+
+			#freq-domain-cells = <1>;
+			#clock-cells = <1>;
+		};
+
+		tlmm: pinctrl@f100000 {
+			compatible = "qcom,eliza-tlmm";
+			reg = <0x0 0x0f100000 0x0 0xf00000>;
+
+			interrupts = <GIC_SPI 208 IRQ_TYPE_LEVEL_HIGH>;
+
+			gpio-controller;
+			#gpio-cells = <2>;
+
+			interrupt-controller;
+			#interrupt-cells = <2>;
+
+			gpio-ranges = <&tlmm 0 0 184>;
+			wakeup-parent = <&pdc>;
+
+			qup_uart14_default: qup-uart14-default-state {
+				/* TX, RX */
+				pins = "gpio18", "gpio19";
+				function = "qup2_se5";
+				drive-strength = <2>;
+				bias-pull-up;
+			};
+		};
+
+		gem_noc: interconnect@24100000 {
+			compatible = "qcom,eliza-gem-noc";
+			reg = <0x0 0x24100000 0x0 0x163080>;
+			qcom,bcm-voters = <&apps_bcm_voter>;
+			#interconnect-cells = <2>;
+		};
+
+		nsp_noc: interconnect@320c0000 {
+			compatible = "qcom,eliza-nsp-noc";
+			reg = <0x0 0x320c0000 0x0 0xe080>;
+			qcom,bcm-voters = <&apps_bcm_voter>;
+			#interconnect-cells = <2>;
+		};
+
+	};
+
+	timer {
+		compatible = "arm,armv8-timer";
+
+		interrupts = <GIC_PPI 13 IRQ_TYPE_LEVEL_LOW>,
+			     <GIC_PPI 14 IRQ_TYPE_LEVEL_LOW>,
+			     <GIC_PPI 11 IRQ_TYPE_LEVEL_LOW>,
+			     <GIC_PPI 10 IRQ_TYPE_LEVEL_LOW>;
+	};
+};

-- 
2.48.1


