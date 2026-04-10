Return-Path: <linux-arm-msm+bounces-102568-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UODZHQ9q2GkhdAgAu9opvQ
	(envelope-from <linux-arm-msm+bounces-102568-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Apr 2026 05:10:07 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id EB2243D1B58
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Apr 2026 05:10:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 00BD1302F42E
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Apr 2026 03:09:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D7484313267;
	Fri, 10 Apr 2026 03:09:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="bb7roduU";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="D7H2NbW5"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47D8330E835
	for <linux-arm-msm@vger.kernel.org>; Fri, 10 Apr 2026 03:09:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775790567; cv=none; b=iEuPf8rCf4OSfkvjAAA8GEeYE0oGF+wafjbbKU7BcNLzaUvvE9a77DHGdfXCmVSDLQRCaMhMTf6gyGfZkeObizWB3xOkotNnDvNWyZ3fxJHTJxgus/JzXj7ulLV5qj+FW4IV1Hso9lHOjBhiAX2Sv/I0bA1EIwY4CHOTjl8vCxE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775790567; c=relaxed/simple;
	bh=sCsRBlH0+879YBoSpThQt/M6YkLzR1tyXx/NfaMKluw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=sp/VVn5Izu4gfpJ7Jsg/DxZlP61Yen3mdt5wTPWi5nOSupVBD5JwAk01cjOESir62VvmzcF/A+c8xZcKjRa2M8Zc7rJx1ghUxxsQ80DigVGZGc4Me7GInFArMh6dDKivWv03MunbrdOrEkh7QTdMgI/3FR6sUlne663jZiyj1O0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=bb7roduU; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=D7H2NbW5; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 639ImwIb2866398
	for <linux-arm-msm@vger.kernel.org>; Fri, 10 Apr 2026 03:09:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Up0eyXQzwjBxM2YRLnDagEOO3QyDYeH+ZwB3mSUG5j0=; b=bb7roduUA0F2r3tH
	QP+iUDCQqyQ0ntzFFmmFmqmHM1tTxoI6yKXDEvVhe+pt1olNK2qlBbcitmrA50Dk
	DNVWb5GH/kqFiy6ha87SUkZ9i9qRS3iizR+XJVr5cdVlOZ0LQrWuKZNJRlh17hnh
	N33JWxNdyQP2rMFM/F26xgDouUesTK8kW9g4JWqYk7V51s4v8UYw/7vOSSq2/BR5
	Rp3v7n7FBtgmH/UhD5nW+me3Fyy9y/JEpKiarwmSRUBBgIHOUNIX02p9fNM74Rw/
	eSHI1cnkU35kuIC5x0FdcMWG7ahARFcPTRFald0mWT3ftIC3aLKKAERsVvVnkRS3
	9SZycQ==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4decayjkym-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 10 Apr 2026 03:09:25 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-bce224720d8so1036621a12.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 09 Apr 2026 20:09:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775790565; x=1776395365; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Up0eyXQzwjBxM2YRLnDagEOO3QyDYeH+ZwB3mSUG5j0=;
        b=D7H2NbW54Y7kdwDEXAsxndvjkvF7yY8l4EaAcnjUGnX1wnxIHRgX2BSyQzrU2LGIdS
         FO3B9p8YrnxzwdzMtDzv3zLuP4fWgNEXpN6vcljqkZWpptxUVvQUNIMvzewzVf5osVJB
         kf1YtjWxMJVraN6a2/wAJ2aaUgdJdVgOyiT1C2hgB/N8TlK3HzUX/mCZ/XCuLKNAmI1u
         es2LPnHQtNmGB5txZuMFukm2GScqTqbgl/jqIivGjVOaOpuaxhrtvrHsL/gEKJvsGznQ
         h1XTtQr4TV1xBKWir83YF0MIs8zM5+Hl5uofCUS3SFhY+XmWRigTFDgD5ug4ULe5uYex
         lNUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775790565; x=1776395365;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Up0eyXQzwjBxM2YRLnDagEOO3QyDYeH+ZwB3mSUG5j0=;
        b=qPs3kzFlx1aAv5XHTU7R+xZhUiLZ5wcX6rO2lvUXTNXMxnXAKi11dBB52ANztVJCwy
         jFywIDJVxykpPeAblm8Ao9us5FNwRnRPeSPznGEvqXtCMXh1GyNW7H5EwwG+r64l8eYu
         PqTZe/7LYmNb5MAPnBXoh7t1xAWPVu6LxUBbNZW8NcwVy2veAkgzb1G4GRGPmjZv7jGZ
         eI72H3ua7gOwjvCZz0Z0UBJ1NIZJ3UMJoKderukAHDEq5jwc+m2zZLObJHOVtogBmt3+
         fG17GMB0d++pnEMAl70MfS9K8yHzo4HlUcf9vBLwRR0eMlIMX+DBIQvHbdLHeLziwFfL
         uFdg==
X-Gm-Message-State: AOJu0YwdOikYMRADP4KZGUmhKva+A9NtjdNm/cJGeo13zTIeMiRGa0dU
	wIaD6kWcqx1TxIPAISGMgZF3CGBbo+6a4Nw/knaEPOcJIZaiHqlElE0diYbEn4CIWN1K5QGhfeB
	39EXbxZgY4ol+shBQgReb9cEncmq3nzKHDKG9GYZ/UVttRtUHntYUuth6zUc4Q47iK/Tx
X-Gm-Gg: AeBDiesS5Ayi8aG1Tylp6aTxyQYPFgNfg9TzIBxLozvoa5LOQUI/facE8gTVWvI4bh8
	JlVqIL0x3HurWuaCGJP54QG2z3C+jJzfOJG0sW0BuvXS3Xx080lAY288bQ0Mm9xoa52ZoonrPU2
	d20QMRWvXfPQ8btp3V8nZgarw8Izh5UopcNd+BGEmZjl+2uGvb7zwT44vMG74XZLtY46Wiu2D3U
	lY9i9LgPFIGyB6pX3zrZVSB42e6L8Y3jnBPrgQ9vg3EDGfdPaeXAs0B50iH0UgmLk1tZ3a223kZ
	649ObTsymaeYOsW0qWN0jkhcjoYLlckKrHRUv/jI8TWIftzp+GhXEOPUiRZDGhezTgj9n2jB2sy
	O3yFXTw2kz8v/tfT4d9hIlLxq7NMu3Xs1WL6sWwAKqOaQFOtfcpPnmb3lsxdagz1mCTphsZnWfq
	LCnaOphLgJ
X-Received: by 2002:a05:6a00:9515:b0:82c:d5be:d283 with SMTP id d2e1a72fcca58-82f0c2f75f8mr1727008b3a.34.1775790564706;
        Thu, 09 Apr 2026 20:09:24 -0700 (PDT)
X-Received: by 2002:a05:6a00:9515:b0:82c:d5be:d283 with SMTP id d2e1a72fcca58-82f0c2f75f8mr1726957b3a.34.1775790564008;
        Thu, 09 Apr 2026 20:09:24 -0700 (PDT)
Received: from jiegan-gv.ap.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82f0c50cd34sm987452b3a.54.2026.04.09.20.09.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Apr 2026 20:09:23 -0700 (PDT)
From: Jie Gan <jie.gan@oss.qualcomm.com>
Date: Fri, 10 Apr 2026 11:08:45 +0800
Subject: [PATCH 2/7] arm64: dts: qcom: talos: Add label properties to
 CoreSight devices
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260410-add-label-to-coresight-device-v1-2-d71a6759dbc2@oss.qualcomm.com>
References: <20260410-add-label-to-coresight-device-v1-0-d71a6759dbc2@oss.qualcomm.com>
In-Reply-To: <20260410-add-label-to-coresight-device-v1-0-d71a6759dbc2@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Tingwei Zhang <tingwei.zhang@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Jie Gan <jie.gan@oss.qualcomm.com>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1775790552; l=10538;
 i=jie.gan@oss.qualcomm.com; s=20250909; h=from:subject:message-id;
 bh=sCsRBlH0+879YBoSpThQt/M6YkLzR1tyXx/NfaMKluw=;
 b=ptFldp6GGzGYCINoOhBembDptgfWvIWo1CQjljIZFciyD8XDBmCpYLQm3cx/FIgbfesnZbfbh
 Cc+bm7oHvYyAPvq3SjZmZtaD79Q2Yk6MUgnU8naOPfvHjlJ4v6exN36
X-Developer-Key: i=jie.gan@oss.qualcomm.com; a=ed25519;
 pk=3LxxUZRPCNkvPDlWOvXfJNqNO4SfGdy3eghMb8puHuk=
X-Authority-Analysis: v=2.4 cv=XtnK/1F9 c=1 sm=1 tr=0 ts=69d869e5 cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=owAIid8Y1J3EW1zRLdQA:9 a=ds9HYswI8H9LxFeb:21
 a=QEXdDO2ut3YA:10 a=3WC7DwWrALyhR5TkjVHa:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDEwMDAyNiBTYWx0ZWRfX3Ql0l66cLipd
 N6hY2QR84Lf/LXcFxZHVOQfl1j+pmAohInPx/cWj7UjVM7j5oU4fhlG+6q0XXcwRJG6Y3U2NGTf
 dKQqVZHHhHp+7AyC/wfGkY8ilPlHCsEoC+VusEf7QmMXwH1By+4Lg11RNZNvEFNsFQdj4ERb3uS
 j93HKWmIJmgGqw3pVEwkomZlFPBeuqx5TzFEYNDXGMnOocZFFmtxde1TF+1HrQJweaUkeYsK2lv
 UDSNH0K2kJfd2v38vGI6oGJHOab11pj9eiegvjpCwoWi2Wo0dPiaUC+N47Ci8O1jotBnFZzxKQa
 8YcqWT8kR3BM76EyoDF5Byi5vTWO/5I3z1Agzcq2Yf6vlEqmL0CpxogWC4+fDM4pdFQWNMWkhzt
 I/sywndNz4x7h6zFoC60tCiSDhKPZ24nE7C6H7KcKNNfiETigOvf6o93v80Wc3P3o0AWHcmMHpT
 R0ct0hwqPfbxco+tt2A==
X-Proofpoint-GUID: AX7RrQF03fF9ZvUhavkteKYuqx-zImP0
X-Proofpoint-ORIG-GUID: AX7RrQF03fF9ZvUhavkteKYuqx-zImP0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-10_01,2026-04-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 lowpriorityscore=0 clxscore=1015 malwarescore=0
 priorityscore=1501 bulkscore=0 phishscore=0 impostorscore=0 adultscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2604010000
 definitions=main-2604100026
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-102568-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	FROM_NEQ_ENVFROM(0.00)[jie.gan@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: EB2243D1B58
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Add label properties to CTI and TPDM nodes in the talos device tree to
provide human-readable identifiers for each CoreSight device. These
labels allow userspace tools and the CoreSight framework to identify
devices by name rather than by base address.

Signed-off-by: Jie Gan <jie.gan@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/talos.dtsi | 59 +++++++++++++++++++++++++++++++++++++
 1 file changed, 59 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/talos.dtsi b/arch/arm64/boot/dts/qcom/talos.dtsi
index ff5afbfce2a4..019911f3f923 100644
--- a/arch/arm64/boot/dts/qcom/talos.dtsi
+++ b/arch/arm64/boot/dts/qcom/talos.dtsi
@@ -2180,6 +2180,7 @@ cti@6010000 {
 
 			clocks = <&aoss_qmp>;
 			clock-names = "apb_pclk";
+			label = "cti_qdss";
 		};
 
 		cti@6011000 {
@@ -2188,6 +2189,7 @@ cti@6011000 {
 
 			clocks = <&aoss_qmp>;
 			clock-names = "apb_pclk";
+			label = "cti_qdss_1";
 		};
 
 		cti@6012000 {
@@ -2196,6 +2198,7 @@ cti@6012000 {
 
 			clocks = <&aoss_qmp>;
 			clock-names = "apb_pclk";
+			label = "cti_qdss_2";
 		};
 
 		cti@6013000 {
@@ -2204,6 +2207,7 @@ cti@6013000 {
 
 			clocks = <&aoss_qmp>;
 			clock-names = "apb_pclk";
+			label = "cti_qdss_3";
 		};
 
 		cti@6014000 {
@@ -2212,6 +2216,7 @@ cti@6014000 {
 
 			clocks = <&aoss_qmp>;
 			clock-names = "apb_pclk";
+			label = "cti_qdss_4";
 		};
 
 		cti@6015000 {
@@ -2220,6 +2225,7 @@ cti@6015000 {
 
 			clocks = <&aoss_qmp>;
 			clock-names = "apb_pclk";
+			label = "cti_qdss_5";
 		};
 
 		cti@6016000 {
@@ -2228,6 +2234,7 @@ cti@6016000 {
 
 			clocks = <&aoss_qmp>;
 			clock-names = "apb_pclk";
+			label = "cti_qdss_6";
 		};
 
 		cti@6017000 {
@@ -2236,6 +2243,7 @@ cti@6017000 {
 
 			clocks = <&aoss_qmp>;
 			clock-names = "apb_pclk";
+			label = "cti_qdss_7";
 		};
 
 		cti@6018000 {
@@ -2244,6 +2252,7 @@ cti@6018000 {
 
 			clocks = <&aoss_qmp>;
 			clock-names = "apb_pclk";
+			label = "cti_qdss_8";
 		};
 
 		cti@6019000 {
@@ -2252,6 +2261,7 @@ cti@6019000 {
 
 			clocks = <&aoss_qmp>;
 			clock-names = "apb_pclk";
+			label = "cti_qdss_9";
 		};
 
 		cti@601a000 {
@@ -2260,6 +2270,7 @@ cti@601a000 {
 
 			clocks = <&aoss_qmp>;
 			clock-names = "apb_pclk";
+			label = "cti_qdss_10";
 		};
 
 		cti@601b000 {
@@ -2268,6 +2279,7 @@ cti@601b000 {
 
 			clocks = <&aoss_qmp>;
 			clock-names = "apb_pclk";
+			label = "cti_qdss_11";
 		};
 
 		cti@601c000 {
@@ -2276,6 +2288,7 @@ cti@601c000 {
 
 			clocks = <&aoss_qmp>;
 			clock-names = "apb_pclk";
+			label = "cti_qdss_12";
 		};
 
 		cti@601d000 {
@@ -2284,6 +2297,7 @@ cti@601d000 {
 
 			clocks = <&aoss_qmp>;
 			clock-names = "apb_pclk";
+			label = "cti_qdss_13";
 		};
 
 		cti@601e000 {
@@ -2292,6 +2306,7 @@ cti@601e000 {
 
 			clocks = <&aoss_qmp>;
 			clock-names = "apb_pclk";
+			label = "cti_qdss_14";
 		};
 
 		cti@601f000 {
@@ -2300,6 +2315,7 @@ cti@601f000 {
 
 			clocks = <&aoss_qmp>;
 			clock-names = "apb_pclk";
+			label = "cti_qdss_15";
 		};
 
 		funnel@6041000 {
@@ -2532,6 +2548,7 @@ cti@683b000 {
 
 			clocks = <&aoss_qmp>;
 			clock-names = "apb_pclk";
+			label = "cti_qdsp6";
 		};
 
 		tpdm@6840000 {
@@ -2540,6 +2557,7 @@ tpdm@6840000 {
 
 			clocks = <&aoss_qmp>;
 			clock-names = "apb_pclk";
+			label = "tpdm_vsense";
 
 			qcom,cmb-element-bits = <64>;
 			qcom,cmb-msrs-num = <32>;
@@ -2560,6 +2578,7 @@ tpdm@684c000 {
 
 			clocks = <&aoss_qmp>;
 			clock-names = "apb_pclk";
+			label = "tpdm_prng";
 
 			qcom,cmb-element-bits = <32>;
 			qcom,cmb-msrs-num = <32>;
@@ -2579,6 +2598,7 @@ tpdm@6850000 {
 
 			clocks = <&aoss_qmp>;
 			clock-names = "apb_pclk";
+			label = "tpdm_pimem";
 
 			qcom,cmb-element-bits = <64>;
 			qcom,cmb-msrs-num = <32>;
@@ -2600,6 +2620,7 @@ tpdm@6860000 {
 
 			clocks = <&aoss_qmp>;
 			clock-names = "apb_pclk";
+			label = "tpdm_cdsp";
 
 			qcom,dsb-element-bits = <32>;
 			qcom,dsb-msrs-num = <32>;
@@ -2643,6 +2664,7 @@ cti@6867000 {
 
 			clocks = <&aoss_qmp>;
 			clock-names = "apb_pclk";
+			label = "cti_cdsp";
 		};
 
 		tpdm@6870000 {
@@ -2651,6 +2673,7 @@ tpdm@6870000 {
 
 			clocks = <&aoss_qmp>;
 			clock-names = "apb_pclk";
+			label = "tpdm_dcc";
 
 			qcom,cmb-element-bits = <32>;
 			qcom,cmb-msrs-num = <32>;
@@ -2671,6 +2694,7 @@ tpdm@699c000 {
 
 			clocks = <&aoss_qmp>;
 			clock-names = "apb_pclk";
+			label = "tpdm_wcss";
 
 			qcom,cmb-element-bits = <32>;
 			qcom,cmb-msrs-num = <32>;
@@ -2693,6 +2717,7 @@ tpdm@69c0000 {
 
 			clocks = <&aoss_qmp>;
 			clock-names = "apb_pclk";
+			label = "tpdm_monaq";
 
 			qcom,dsb-element-bits = <32>;
 			qcom,dsb-msrs-num = <32>;
@@ -2736,6 +2761,7 @@ tpdm@69d0000 {
 
 			clocks = <&aoss_qmp>;
 			clock-names = "apb_pclk";
+			label = "tpdm_qm";
 
 			qcom,dsb-element-bits = <32>;
 			qcom,dsb-msrs-num = <32>;
@@ -2756,6 +2782,7 @@ tpdm@6a00000 {
 
 			clocks = <&aoss_qmp>;
 			clock-names = "apb_pclk";
+			label = "tpdm_ddr";
 
 			qcom,dsb-element-bits = <32>;
 			qcom,dsb-msrs-num = <32>;
@@ -2776,6 +2803,7 @@ cti@6a02000 {
 
 			clocks = <&aoss_qmp>;
 			clock-names = "apb_pclk";
+			label = "cti_ddr_dl0";
 		};
 
 		cti@6a03000 {
@@ -2784,6 +2812,7 @@ cti@6a03000 {
 
 			clocks = <&aoss_qmp>;
 			clock-names = "apb_pclk";
+			label = "cti_ddr_dl0_1";
 		};
 
 		cti@6a10000 {
@@ -2792,6 +2821,7 @@ cti@6a10000 {
 
 			clocks = <&aoss_qmp>;
 			clock-names = "apb_pclk";
+			label = "cti_ddr_dl1";
 		};
 
 		cti@6a11000 {
@@ -2800,6 +2830,7 @@ cti@6a11000 {
 
 			clocks = <&aoss_qmp>;
 			clock-names = "apb_pclk";
+			label = "cti_ddr_dl1_1";
 		};
 
 		funnel@6a05000 {
@@ -2870,6 +2901,7 @@ tpdm@6b02000 {
 
 			clocks = <&aoss_qmp>;
 			clock-names = "apb_pclk";
+			label = "tpdm_swao_0";
 
 			qcom,cmb-element-bits = <64>;
 			qcom,cmb-msrs-num = <32>;
@@ -2890,6 +2922,7 @@ tpdm@6b03000 {
 
 			clocks = <&aoss_qmp>;
 			clock-names = "apb_pclk";
+			label = "tpdm_swao_1";
 
 			qcom,dsb-element-bits = <32>;
 			qcom,dsb-msrs-num = <32>;
@@ -2910,6 +2943,7 @@ cti@6b04000 {
 
 			clocks = <&aoss_qmp>;
 			clock-names = "apb_pclk";
+			label = "cti_swao";
 		};
 
 		cti@6b05000 {
@@ -2918,6 +2952,7 @@ cti@6b05000 {
 
 			clocks = <&aoss_qmp>;
 			clock-names = "apb_pclk";
+			label = "cti_swao_1";
 		};
 
 		cti@6b06000 {
@@ -2926,6 +2961,7 @@ cti@6b06000 {
 
 			clocks = <&aoss_qmp>;
 			clock-names = "apb_pclk";
+			label = "cti_swao_2";
 		};
 
 		cti@6b07000 {
@@ -2934,6 +2970,7 @@ cti@6b07000 {
 
 			clocks = <&aoss_qmp>;
 			clock-names = "apb_pclk";
+			label = "cti_swao_3";
 		};
 
 		funnel@6b08000 {
@@ -3040,6 +3077,7 @@ cti@6b21000 {
 
 			clocks = <&aoss_qmp>;
 			clock-names = "apb_pclk";
+			label = "cti_aop_m3";
 		};
 
 		tpdm@6b48000 {
@@ -3048,6 +3086,7 @@ tpdm@6b48000 {
 
 			clocks = <&aoss_qmp>;
 			clock-names = "apb_pclk";
+			label = "tpdm_west";
 
 			qcom,dsb-element-bits = <32>;
 			qcom,dsb-msrs-num = <32>;
@@ -3067,6 +3106,7 @@ cti@6c13000 {
 
 			clocks = <&aoss_qmp>;
 			clock-names = "apb_pclk";
+			label = "cti_titan";
 
 			/* Not all required clocks can be enabled from the OS */
 			status = "fail";
@@ -3078,6 +3118,7 @@ cti@6c20000 {
 
 			clocks = <&aoss_qmp>;
 			clock-names = "apb_pclk";
+			label = "cti_venus";
 			status = "disabled";
 		};
 
@@ -3087,6 +3128,7 @@ tpdm@6c28000 {
 
 			clocks = <&aoss_qmp>;
 			clock-names = "apb_pclk";
+			label = "tpdm_center";
 
 			qcom,dsb-element-bits = <32>;
 			qcom,dsb-msrs-num = <32>;
@@ -3106,6 +3148,7 @@ cti@6c29000 {
 
 			clocks = <&aoss_qmp>;
 			clock-names = "apb_pclk";
+			label = "cti_dlct";
 		};
 
 		cti@6c2a000 {
@@ -3114,6 +3157,7 @@ cti@6c2a000 {
 
 			clocks = <&aoss_qmp>;
 			clock-names = "apb_pclk";
+			label = "cti_dlct_1";
 		};
 
 		cti@7020000 {
@@ -3122,6 +3166,7 @@ cti@7020000 {
 
 			clocks = <&aoss_qmp>;
 			clock-names = "apb_pclk";
+			label = "cti_apss_apb_2";
 		};
 
 		etm@7040000 {
@@ -3150,6 +3195,7 @@ cti@7120000 {
 
 			clocks = <&aoss_qmp>;
 			clock-names = "apb_pclk";
+			label = "cti_apss_apb_3";
 		};
 
 		etm@7140000 {
@@ -3178,6 +3224,7 @@ cti@7220000 {
 
 			clocks = <&aoss_qmp>;
 			clock-names = "apb_pclk";
+			label = "cti_apss_apb_4";
 		};
 
 		etm@7240000 {
@@ -3206,6 +3253,7 @@ cti@7320000 {
 
 			clocks = <&aoss_qmp>;
 			clock-names = "apb_pclk";
+			label = "cti_apss_apb_5";
 		};
 
 		etm@7340000 {
@@ -3234,6 +3282,7 @@ cti@7420000 {
 
 			clocks = <&aoss_qmp>;
 			clock-names = "apb_pclk";
+			label = "cti_apss_apb_6";
 		};
 
 		etm@7440000 {
@@ -3262,6 +3311,7 @@ cti@7520000 {
 
 			clocks = <&aoss_qmp>;
 			clock-names = "apb_pclk";
+			label = "cti_apss_apb_7";
 		};
 
 		etm@7540000 {
@@ -3290,6 +3340,7 @@ cti@7620000 {
 
 			clocks = <&aoss_qmp>;
 			clock-names = "apb_pclk";
+			label = "cti_apss_apb_8";
 		};
 
 		etm@7640000 {
@@ -3318,6 +3369,7 @@ cti@7720000 {
 
 			clocks = <&aoss_qmp>;
 			clock-names = "apb_pclk";
+			label = "cti_apss_apb_9";
 		};
 
 		etm@7740000 {
@@ -3492,6 +3544,7 @@ tpdm@7830000 {
 
 			clocks = <&aoss_qmp>;
 			clock-names = "apb_pclk";
+			label = "tpdm_olc";
 
 			qcom,cmb-element-bits = <64>;
 			qcom,cmb-msrs-num = <32>;
@@ -3535,6 +3588,7 @@ tpdm@7860000 {
 
 			clocks = <&aoss_qmp>;
 			clock-names = "apb_pclk";
+			label = "tpdm_apss";
 
 			qcom,dsb-element-bits = <32>;
 			qcom,dsb-msrs-num = <32>;
@@ -3578,6 +3632,7 @@ tpdm@78a0000 {
 
 			clocks = <&aoss_qmp>;
 			clock-names = "apb_pclk";
+			label = "tpdm_llm_silver";
 
 			qcom,cmb-element-bits = <32>;
 			qcom,cmb-msrs-num = <32>;
@@ -3597,6 +3652,7 @@ tpdm@78b0000 {
 
 			clocks = <&aoss_qmp>;
 			clock-names = "apb_pclk";
+			label = "tpdm_llm_gold";
 
 			qcom,cmb-element-bits = <32>;
 			qcom,cmb-msrs-num = <32>;
@@ -3664,6 +3720,7 @@ cti@78e0000 {
 
 			clocks = <&aoss_qmp>;
 			clock-names = "apb_pclk";
+			label = "cti_apss";
 		};
 
 		cti@78f0000 {
@@ -3672,6 +3729,7 @@ cti@78f0000 {
 
 			clocks = <&aoss_qmp>;
 			clock-names = "apb_pclk";
+			label = "cti_apss_1";
 		};
 
 		cti@7900000 {
@@ -3680,6 +3738,7 @@ cti@7900000 {
 
 			clocks = <&aoss_qmp>;
 			clock-names = "apb_pclk";
+			label = "cti_apss_2";
 		};
 
 		remoteproc_cdsp: remoteproc@8300000 {

-- 
2.34.1


