Return-Path: <linux-arm-msm+bounces-109418-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aL/tF7O1EGpDcwYAu9opvQ
	(envelope-from <linux-arm-msm+bounces-109418-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 22 May 2026 21:59:47 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F1DC5B9CE6
	for <lists+linux-arm-msm@lfdr.de>; Fri, 22 May 2026 21:59:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 927D0307762D
	for <lists+linux-arm-msm@lfdr.de>; Fri, 22 May 2026 19:55:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B6A35386439;
	Fri, 22 May 2026 19:55:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Ba1R6w1E";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="FxbfkpP3"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7629D385D9A
	for <linux-arm-msm@vger.kernel.org>; Fri, 22 May 2026 19:55:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779479716; cv=none; b=eXnLNsOpqH+mjpM6S5Vtl6ACTF+ElTEggl4YxrTPb4PAvOUe6g4WhNmgZoHJRNPT1R/aWY020X5MMDFpNDkMORNRbDoH3Q9451w6VLG0GXV1+xKfRj6iGGmYmOcivqYV4O1Jz1MvyJ20j7rloBYn+c6SgxazuxOn802uTWD7o5c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779479716; c=relaxed/simple;
	bh=SKGjni1KOiKZfXVYqG/Wt+yBdTIJXei8jtnT1CjWOEw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=DMXPcNDeJFjfLuM1sIbdQsupQs6EqGnfaNFE+9oSMJ+rjfP+r5H7RgMqftkb+9RJcf5dv8grDocJTdHy/3IlDbjQdDHyRPVtLT93f80AFMHy21kvcCOxF1k30SaDE/Q6Fe0tnHDpkfJ6UCXXF8tQeKyI9TIFoBErAdIMZRdS/ws=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Ba1R6w1E; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=FxbfkpP3; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64MFrODi3005260
	for <linux-arm-msm@vger.kernel.org>; Fri, 22 May 2026 19:55:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=Emdn15EHeJD
	m/lHbAteq3SywOd6bYN5Ikcxq0cltRzw=; b=Ba1R6w1E0j2HCAkPp4TApbBGwqu
	wN3HfLRbNhhnDi22UeU+fyWPApH0DOr/w4VM8bl/t2L5HE1vguZc91Y8LsZdI/Gx
	e2kw1tYhB8JP9w17DqVa8f5bgnDJyWLYV97ezNVoXqEeQNx4//UZlkDIscQ8+pwo
	djdRVFu5qC87xYiQPrw4h1XoTPiDW+GccNFmXH2Yp63YfG2n+dNovSBkeYOLVrIV
	7Nfdkgs6DxwNdmtnDRMVjYBL7SIqHfeJtCAjgfmHV0udg/zOibsCllMLdxUrfxGs
	jo/Rg2ihi+8AmGlLUbXIXm6Wvoaj2besK4KTAuRjRFbvDi6GCFCRZ7m5Xww==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eafrtbpwn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 22 May 2026 19:55:14 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2ba3245a43dso82380845ad.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 22 May 2026 12:55:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779479714; x=1780084514; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Emdn15EHeJDm/lHbAteq3SywOd6bYN5Ikcxq0cltRzw=;
        b=FxbfkpP3/OGCb1Pm/rYvqFanWmHv7k/MeduilQFXfr+lP/jscEadMI+k/0yCJwvK6R
         LrwoNh9jauMNWE7a92CRa54hqZn0GlkQbU878EFkNrk2JMTm7ud48/W3VhV47icE7jJP
         O5NI3J4YjnYM7dkBa3kJhCHsIynaIl92qm2eiZ4miZFpw66Ll3X/FWt3RPOl7edF07dj
         3/g0gVx3jWUjn9boP/ztkwZUe5VXFk5Oj75HHw9QTR0LmELWQpfcOXfFos99pTx3Uxqp
         h6TSwSsAr1R9QRlrAEw3LNMFH2bVYCW0cIw0qTSgOK4K3Agh44HWE0rLLOuX4QHpK+mx
         s1bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779479714; x=1780084514;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Emdn15EHeJDm/lHbAteq3SywOd6bYN5Ikcxq0cltRzw=;
        b=DEEddG+vvr0Eie7WWVprPNOtC8Himu3tbrhpZcEBALYOeVsqIUJgYqY43fJM7+74j9
         9K5Q7/fpeRa7hqvH07fttOL7sPSuZPdGwGPO7QQzQipGLWurDxM/LqXxOxZXPUnkYNf7
         w6WP74XBkRqk53rnuFuFuOhs1wFjxnBRj3pjpbVN7KEm4VSlUYQgu89jcXZ4KWFFC30Z
         cIDwAcqSA7+SAHY3snSFfBy+gsSd0q49iY3PG0WJXnZV7p8wb0boItdpxjFF403wY9zZ
         cuF7o/OFazWvDmFCcm3gMFBbAJdMpV9FwoS0ubMKVhwbcL/RTyiK0bqi9/CM6R+VJfGR
         AlGw==
X-Forwarded-Encrypted: i=1; AFNElJ+qcUsNciZ5c4KXpAtm/5kyulK2Md2+nSyYM0/3S6ATvGciClUDwXOO0n17bmXgQ422tHM6ezWfbN+Z49MK@vger.kernel.org
X-Gm-Message-State: AOJu0YyEUYQB8KDX+bD7T74E0pglw+N0hE7cMWRl0MAMnnX4Qd2ChHl6
	yVnnDpXKnb0M2volB4VJz0pR55P3MTciGIPecTSwBYpXrOvXs/k9Dr7YRad0tr0BC48NuDUtx0c
	ax1lTmz3VANazgd1qWP/dVca0t00yu8TSBfaYTj98bnLKm0ZkpT8qlkAJdSt9XwvzsR4P
X-Gm-Gg: Acq92OHHNWQzydPlJQaOektAARnSIpv2OVRGgEpu6DhvQyST4JeBJBcsP9tukHdW1B3
	v7vSLHIp3UTLjwWCHgzFIzX+qn/LH4M5F+XhhtySr4afrztkZK/oOw8TE2cEc+gDN2J9DaUWP3i
	Nxfb+lrxJZIgnFoS8mFgCzVxXUELE6Zf5/VbC9c8a22ibeDkOnfSH6eXlrANLM2mteKObPFVI9w
	NPtBMC/NomjiVtA7zzjeH4oAYnXMpjUxD+Fezg3HrvL544Z1+LFtu6UGlSW9NNAVg557QaE8+3N
	eGiNZnMIPT7Jp8+oZugxnpP3l/rAaem91j58T6DkGDxYwCkOAv8YYFY8m9aTBExYYrDiLTJ/p8h
	4wyuSfq8Z3DedhY83YdQXKNayhgT4z5vqTy5JKD4NnWBd55Ge
X-Received: by 2002:a17:903:3b8c:b0:2be:1db0:f166 with SMTP id d9443c01a7336-2beb0346484mr56281715ad.10.1779479714008;
        Fri, 22 May 2026 12:55:14 -0700 (PDT)
X-Received: by 2002:a17:903:3b8c:b0:2be:1db0:f166 with SMTP id d9443c01a7336-2beb0346484mr56281305ad.10.1779479713489;
        Fri, 22 May 2026 12:55:13 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2beb5695f05sm33541155ad.6.2026.05.22.12.55.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 May 2026 12:55:13 -0700 (PDT)
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Robert Marko <robimarko@gmail.com>,
        Guru Das Srinagesh <linux@gurudas.dev>
Cc: cros-qcom-dts-watchers@chromium.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Subject: [PATCH v3 18/18] arm64: dts: qcom: sdm845: Add minidump SRAM config to SCM node
Date: Sat, 23 May 2026 01:20:09 +0530
Message-ID: <20260522195009.2961022-19-mukesh.ojha@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260522195009.2961022-1-mukesh.ojha@oss.qualcomm.com>
References: <20260522195009.2961022-1-mukesh.ojha@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=JN0LdcKb c=1 sm=1 tr=0 ts=6a10b4a2 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=EUspDBNiAAAA:8
 a=0qvS_bSzHNCwZkaZnqgA:9 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTIyMDE5OCBTYWx0ZWRfX8lF8hYSSD4mj
 n8Qtr4trxTTHtfewrcChtgyWJI6Of5m4Bef+tyhDWkpKZnG10owbEUmlpqcbZL4ACOPPscOzl6l
 pHCJTH2ux8NMG1sOeXNvRDSUZcgHS+HWtLvP+zkc805xE8h7hGpzsojfH/3TBQOdfTWjKufMlxf
 vdZesGfyrYV3PSjh0p9+Z9xWZXw68JBvxg4Tq1FKrvPf7QfnbibyagDTDko39kFwbCW8WNL9qxT
 I8bJhSGnADudm9N+nrUOP8y9kPBQhglHyEQysDCN6eNX0AkUAUTn00bVI2ZXOqzo4OT45/9J8LH
 TGPpYx7d62HhCixUL1nTlSfiUESv7wYw9OcsRSJZ1z/UV43WTnpykKIC9T4AGJfDiDhSUKcb4W9
 OhGeygVhLPvUHj1BXzxDFsDYbkwEssw9TlT5LiK2+wflAay7fVRw1RXha2W9Z8oG6bFeADBddqh
 F1W2zSC5G4AFMeoQxLQ==
X-Proofpoint-GUID: x2RbqycOuc0pJ2cjX-0gSlxNWtQN7Oe1
X-Proofpoint-ORIG-GUID: x2RbqycOuc0pJ2cjX-0gSlxNWtQN7Oe1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-22_05,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 lowpriorityscore=0 suspectscore=0 malwarescore=0 impostorscore=0
 phishscore=0 bulkscore=0 clxscore=1015 spamscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605220198
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[12];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-109418-lists,linux-arm-msm=lfdr.de];
	FREEMAIL_TO(0.00)[kernel.org,gmail.com,gurudas.dev];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mukesh.ojha@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,1c:email,3d000:email];
	NEURAL_HAM(-0.00)[-0.986];
	DBL_PROHIBIT(0.00)[0.223.255.192:email];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 1F1DC5B9CE6
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Point the SCM node at the minidump config slot in the always-on SRAM.
Boot firmware reads this word before DDR is initialised on a warm reset
to decide where to deliver the minidump.

Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/sdm845.dtsi | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sdm845.dtsi b/arch/arm64/boot/dts/qcom/sdm845.dtsi
index 4ae8627d6dbc..2179988dbaaf 100644
--- a/arch/arm64/boot/dts/qcom/sdm845.dtsi
+++ b/arch/arm64/boot/dts/qcom/sdm845.dtsi
@@ -363,6 +363,7 @@ cluster_sleep_0: cluster-sleep-0 {
 	firmware {
 		scm {
 			compatible = "qcom,scm-sdm845", "qcom,scm";
+			sram = <&minidump_config>;
 		};
 	};
 
@@ -5192,6 +5193,10 @@ sram@14680000 {
 
 			ranges = <0 0 0x14680000 0x40000>;
 
+			minidump_config: minidump-sram@1c {
+				reg = <0x1c 0x4>;
+			};
+
 			ipa_modem_tables: modem-tables@3d000 {
 				reg = <0x3d000 0x2000>;
 			};
-- 
2.53.0


