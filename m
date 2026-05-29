Return-Path: <linux-arm-msm+bounces-110288-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uJDIFkSkGWptyAgAu9opvQ
	(envelope-from <linux-arm-msm+bounces-110288-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 29 May 2026 16:35:48 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id A6879603ACD
	for <lists+linux-arm-msm@lfdr.de>; Fri, 29 May 2026 16:35:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 5806D3084AE9
	for <lists+linux-arm-msm@lfdr.de>; Fri, 29 May 2026 14:24:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7F4C03E63B6;
	Fri, 29 May 2026 14:23:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Mk7QoEWR";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="I70xZUZE"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BBCB83E8C70
	for <linux-arm-msm@vger.kernel.org>; Fri, 29 May 2026 14:23:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780064628; cv=none; b=AwQWClRrU1vneDZcKjzrUUyDWVczQhf71opJeB5z2ReOlxs35ovUkplmIy5Xw6HPoJky0iv7EF26SG0fPoDyosNqRP46lLwp+m66uv4R/+pyJcZWYk8GhtEsQ7+NK2N1Yhtyg/xoEKu3Iih6buNjGGRJ/UKWdESU4Dze2EmOlpY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780064628; c=relaxed/simple;
	bh=QT1O7JWZuQeCOEkAN5pFlabn2CCUVlrdoZ+6wOk2a8k=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=CyRa/0DVw6S0A3F41n8XoG1z3pLSq+tuz1wMcSszeRPIdgiUQpMuP8tGzghuKvcAWCVHsuNKQSTv5V5aPZOc2me+Pw4yNSTIglkmYmuTfMvmb4AVWweDQvF5Sa9uQ4IgIe+u/0zaOSwAv/t24Q7sza1fHes94Ha1OLjOW0Woy60=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Mk7QoEWR; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=I70xZUZE; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64TDLDGL4050783
	for <linux-arm-msm@vger.kernel.org>; Fri, 29 May 2026 14:23:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ZJtPO6O5NeXjipxB9wGMsy1g8c32dTSOI3WAyDX13cU=; b=Mk7QoEWRFmFFlnxH
	gsw59ZwskhzkNdCuviiwzqi5jRs489LW9dCyWB0qA9Y45wwcKdmAME9NKjaBjIvz
	+FGrCIaRzKXJhyu1P/JONajDDo9KiPdqDgw89OGxRNK2pfhPmFLR2VIgrXPHx1wJ
	G8zc/OBR7ZSYUy7nP8dB9QLoMRNK4UWMDQkuY512a21WREKIkqXEUj7jUT47LZjD
	VjmHAQ9Nz2Fhw9MgvRPk6ySJIN5soYqAJCq6HaDsa/Yoa0XZ3LOVtRqGWi5IEbpz
	ULtwKKIUMbgXYcvuM+xfu/cVr/Bss0c4dGos8uI2HJ80H3kMk2AH5/rWRBV5Bnuq
	o0KOxA==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eety54f52-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 29 May 2026 14:23:45 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2ba3245a43dso159541925ad.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 29 May 2026 07:23:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780064625; x=1780669425; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZJtPO6O5NeXjipxB9wGMsy1g8c32dTSOI3WAyDX13cU=;
        b=I70xZUZEa9eMx+mli9uSVejTh3aBPftaYUBTSiL4jjAr6rn+SHjCwjPkFTwkrOrCv6
         xDx+xmsJ/7PLAubbL9roxlrAnvyu+4aGkHiIavY/zOEX1N16rVFkGUzF/xlLXwHVlgdM
         agSGdIRTXROrMa3qF9o0GofHw7sPI5kZnpu2QDNL7GB4qTYQSRiSld11nexElwP1LOAH
         IvU1VVQRhRbwiLn9Z1SMJ4cJ+5BvhTTS0cr4zrzi5npGphWDA838r9tcz/RwcpjwhlMk
         lONPzc0O95yUt7pqNq+c/iHpJEJDDNQ5mAmTgSqlwgRkD+/qc9hV8eUMil6XNj6JkMw2
         HYTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780064625; x=1780669425;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=ZJtPO6O5NeXjipxB9wGMsy1g8c32dTSOI3WAyDX13cU=;
        b=a1Hkxa9KKqEKsF46Je+JVvMkyJ2jFLWVCHWQYKdw0O8zlzOHFOWnajXkQOE8uJ8Zd0
         YLKIdtmT9X5gHYcUja57xNlOK4fvLLmzJauohSGDdOBz1l73otN9dXwuzc72YOaWXRes
         Tjyztk96mCcc9GBvPsIGcH75Cm9vw+5GCBZVdWHXp+gpHP8TWWciK9vfhRpn2frK/JMO
         uOzNUbLJ0+RMGIFxz7hhKRvcn0houcB0r4rwTpz2pmIh+PEtxAyCbbqihBJTcIq9UvEt
         2FLQjDFBlsZuwLByEm8ol5LlfABylLAao6HXCM25ANo80qOTS3mW3UUeHPJFUr67zv/u
         g0IQ==
X-Forwarded-Encrypted: i=1; AFNElJ/9cS1xvQQS+yKnMR1ytffUxmmGE13xJVGez/zQDnrQq39XRGaVx3w9N82ilxKbNv4BR7rrWmbnhQvxQdQ7@vger.kernel.org
X-Gm-Message-State: AOJu0YyS3fS9oLttsG5zqLSExXlQp8PB0VPgr7qB9a3D9+j+qAJXHJxd
	q2p3jM3gWPLOd9rC1AUgEJpwfbzpjSsKxqADPQfKjaEJxYF9PX7n2acmJQv69tKHL3wkw+Dzpj+
	168H7rAYzw6RRl5PTNje39lUohsMs4g6jhPY9pxLtip1Tb7AVaA0vLFY3asM/SYglMqLo
X-Gm-Gg: Acq92OGReXhqk5zWQsVY5ftzfhzi6w6jGxJFSeujb109b9GUQDVEQw64wkpo4a1plV6
	jSsyuD9bSHp3ukCC4cgdLkupKhbdw9b9ZLfvxhibWxELxxiJi5iQ4GemzC2xIX8tcaBrlZ7KRm+
	32JUMl/t0k3eS/Hhq8PfePRQXrEil7mcikHVYUmMAkGuRMyOTuGpaGpzNbmbc9JetM1r34VwqOu
	7HR1G7cri3N3L0ubNPLCOEEj9OhG3CCmCf49bBhegB0t3XCJ85yeezPOqIpIuMwaDNSvsYVCP1q
	MiLriMGP9Ac23JTVe2g5z4p3CHdN4SosSMgHNRvFU6VBBg0M8HvVwU19zBKRzulyOkF7YGwz6vp
	1jfjXb6bvsFYhPL7LyeLHx1BjcXnUtUriPIl1JZi1UZ8xpR+ROWZNH1WOHQamOEw/Bc7A
X-Received: by 2002:a17:902:ce0a:b0:2ad:9b86:ddc2 with SMTP id d9443c01a7336-2bf3682abd2mr58075ad.22.1780064624558;
        Fri, 29 May 2026 07:23:44 -0700 (PDT)
X-Received: by 2002:a17:902:ce0a:b0:2ad:9b86:ddc2 with SMTP id d9443c01a7336-2bf3682abd2mr57455ad.22.1780064623889;
        Fri, 29 May 2026 07:23:43 -0700 (PDT)
Received: from hu-apateriy-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2bf23c57283sm22013095ad.81.2026.05.29.07.23.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 May 2026 07:23:43 -0700 (PDT)
From: Anurag Pateriya <anurag.pateriya@oss.qualcomm.com>
Date: Fri, 29 May 2026 19:53:12 +0530
Subject: [PATCH v2 2/2] arm64: dts: qcom: kaanapali: add reboot-mode
 support
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260529-psci_sys_reset-dt-changes-for-pakala-v2-2-1964ebf1924c@oss.qualcomm.com>
References: <20260529-psci_sys_reset-dt-changes-for-pakala-v2-0-1964ebf1924c@oss.qualcomm.com>
In-Reply-To: <20260529-psci_sys_reset-dt-changes-for-pakala-v2-0-1964ebf1924c@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Anurag Pateriya <anurag.pateriya@oss.qualcomm.com>,
        Xin Liu <xin.liu@oss.qualcomm.com>
X-Mailer: b4 0.13.0
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTI5MDE0NCBTYWx0ZWRfXzFaBlOi0HBEU
 GVSbVozVYl/RXdHINYXC9/3Nyvd4F6kvbbQRCHE12ldLGkVfj2ol/8/J1h+6Hhcm7AHjGbi6/vD
 XrEzpY/FniRFq+J6fUm/Qiohn+QXltjS/sr5zvsK15h39s5+HrahMV5q85Xub2FcAz578QWLvmO
 DTw++wJCF679P3o866kU1LX89rP8o8Ui41f1TTTawfsHfN5q6r5eFNhN/DO5WngoZ/VDTeSgK6L
 eBav8sHZKnb6gBi9tKM2TZ3icmSzDMrQ/nAUfFtPgMjXVQUytoOB7VJvBwmzfNKtbZFoKpLkwtV
 UdTx8n4+550TrY68XtZvaLWDgaUNq+0PMQuJ56EibOqDtcDAMxTGRA23Xtf7VgDZgaUBnGEjSaZ
 zqT8c9EoxeDYV/yTnKh7cpatt6nhZqchVcM5uxwi0KNgHNTVNzmLtQ+nbpvr9qbQmBFbxC8+ZQd
 hUm6p5h+vKnFyO9efrQ==
X-Proofpoint-GUID: 9gyKYPpt3gu-KTfh_Cm4PxnZL4xvbL-5
X-Authority-Analysis: v=2.4 cv=WaM8rUhX c=1 sm=1 tr=0 ts=6a19a171 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=7AJH4AG-BTyQ-FR_P80A:9 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-ORIG-GUID: 9gyKYPpt3gu-KTfh_Cm4PxnZL4xvbL-5
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-05-29_04,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 bulkscore=0 clxscore=1015 lowpriorityscore=0 phishscore=0
 adultscore=0 suspectscore=0 priorityscore=1501 malwarescore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2605290144
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[12];
	TAGGED_FROM(0.00)[bounces-110288-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[anurag.pateriya@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: A6879603ACD
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Xin Liu <xin.liu@oss.qualcomm.com>

Add PSCI SYSTEM_RESET2 reboot-modes for kaanapali-mtp and kaanapali-qrd
for use by the psci-reboot-mode driver.

The following modes are defined:
- bootloader: reboot into fastboot mode for fastboot flashing.
- edl: reboot into emergency download mode for image loading via
  the Firehose protocol.

Signed-off-by: Xin Liu <xin.liu@oss.qualcomm.com>
Signed-off-by: Anurag Pateriya <anurag.pateriya@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/kaanapali-mtp.dts | 7 +++++++
 arch/arm64/boot/dts/qcom/kaanapali-qrd.dts | 7 +++++++
 arch/arm64/boot/dts/qcom/kaanapali.dtsi    | 2 +-
 3 files changed, 15 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/kaanapali-mtp.dts b/arch/arm64/boot/dts/qcom/kaanapali-mtp.dts
index 7bce5653ea74..6429d91eba62 100644
--- a/arch/arm64/boot/dts/qcom/kaanapali-mtp.dts
+++ b/arch/arm64/boot/dts/qcom/kaanapali-mtp.dts
@@ -1356,3 +1356,10 @@ &usb_dp_qmpphy {
 
 	status = "okay";
 };
+
+&psci {
+	reboot-mode {
+		mode-bootloader = <0x80010001 0x2>;
+		mode-edl = <0x80000000 0x1>;
+	};
+};
diff --git a/arch/arm64/boot/dts/qcom/kaanapali-qrd.dts b/arch/arm64/boot/dts/qcom/kaanapali-qrd.dts
index 95dce0812725..85007e53c456 100644
--- a/arch/arm64/boot/dts/qcom/kaanapali-qrd.dts
+++ b/arch/arm64/boot/dts/qcom/kaanapali-qrd.dts
@@ -851,3 +851,10 @@ &usb_dp_qmpphy {
 
 	status = "okay";
 };
+
+&psci {
+	reboot-mode {
+		mode-bootloader = <0x80010001 0x2>;
+		mode-edl = <0x80000000 0x1>;
+	};
+};
diff --git a/arch/arm64/boot/dts/qcom/kaanapali.dtsi b/arch/arm64/boot/dts/qcom/kaanapali.dtsi
index 63c828c80920..d8203b2dbc8c 100644
--- a/arch/arm64/boot/dts/qcom/kaanapali.dtsi
+++ b/arch/arm64/boot/dts/qcom/kaanapali.dtsi
@@ -274,7 +274,7 @@ pmu {
 		interrupts = <GIC_PPI 7 IRQ_TYPE_LEVEL_LOW>;
 	};
 
-	psci {
+	psci: psci {
 		compatible = "arm,psci-1.0";
 		method = "smc";
 

-- 
2.43.0


