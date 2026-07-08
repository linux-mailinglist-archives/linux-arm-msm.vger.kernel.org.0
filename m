Return-Path: <linux-arm-msm+bounces-117575-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id +X2sOLogTmr9DgIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-117575-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 08 Jul 2026 12:04:42 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F5CB724041
	for <lists+linux-arm-msm@lfdr.de>; Wed, 08 Jul 2026 12:04:42 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=TP8pqTCb;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=HkvUL80E;
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-117575-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-117575-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 4427E3028F74
	for <lists+linux-arm-msm@lfdr.de>; Wed,  8 Jul 2026 10:03:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 395CE38C42A;
	Wed,  8 Jul 2026 10:02:57 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B36F53955C6
	for <linux-arm-msm@vger.kernel.org>; Wed,  8 Jul 2026 10:02:54 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783504977; cv=none; b=FF3QXCMFUm9Vrku+Anm9IvBLqQ55iJeNJROc0duQS7OIGHCYrBkcLMAShz25CSZD9fmZXeKnP+Th9MAwKf+5LtvE1rBm3w+ukUmolDYKOwwT+AT2jGYUl2P4+59jnQ5hr1uN106hVqDKzta2BF4rF5LSkzZvm+EZ6OOVKPd/7SA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783504977; c=relaxed/simple;
	bh=Xv3av/rD+ldK9r9tj755nWcpZGWPEFEhsHdy0UkmLVg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=kJgScEpe9dr0TTm2JCGchAFxTBS8XI7vUcZhyUwMaE2SqEiDHMJ4J+EhzN9aIzBESPhIh2lOiG2Hgzmkib5VeBHa0IGqovqQEU6Y6tEXN69uoya2KCF8SZuZ58FPvRQefzR3Gmc9Kdu/G32nFCPNJDY4/EMnUhBYQtDorpZ5ZvE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=TP8pqTCb; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=HkvUL80E; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66889Ems2258904
	for <linux-arm-msm@vger.kernel.org>; Wed, 8 Jul 2026 10:02:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	gTDbhLDusd8RpoV9P1sSM4e1vQjmi4jllQGShEAZJQM=; b=TP8pqTCbtL2kAaHN
	NHix9DatpUHyOrGfi1rhWg0WRSA1QcmAYCDb0Sa72fiADWcZfodClzsRNsaollbH
	0bOxJJx1kmaYWajn9V5BudkWPHUhIZ1YqVE9r7olPv5e+kEmq6jEqub1yi6EvhIA
	m2n9TCqJEhq1Wi/twVeeAtw3t7jYSJxIE0nV+fBypKR7FTvEDoZ5te6LtnyNh7V8
	mOONkxRwhE6cFbu8tj/77XUlUPC1bUIq//0qZ8WwCVVNXE/dMmT2fTU9qJNuXtdd
	0cXZCzxHzDUlk/YDBYiRHdjcSSmiUQs4mOE/Xywxu+IAuQlv38cH1ESK2TpnAruO
	SNGxbw==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f9csw9uj6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 08 Jul 2026 10:02:53 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-384419c6c74so759133a91.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 08 Jul 2026 03:02:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783504973; x=1784109773; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=gTDbhLDusd8RpoV9P1sSM4e1vQjmi4jllQGShEAZJQM=;
        b=HkvUL80EhmYuraxTkoIMoHiazscorCv+3dk91OBLB4ICT+rM9zKdW+XsfoGtpmNO6m
         WbMCA8ddcuHGp59sHUnYPbypQ8Pkh8qCKxVJUhrIsEGkdZ3k8FK2JIQiDfjzReON5zMp
         sqsSMGKcCgknjxQjEGTQ6QsUo9az6Qc6O5JF07gbsO1OLyah4Rsh/C74wEiLIWU71WSA
         i7Q02U6M/4EQ0xGZAiwyny+hlycjk8wq+2fb3ZgqAoKjpOkWPiY604EtexcrOTN+BAIo
         fhmX4XlTiJr8OKcttSAeG913pIDq+S9LzDelADmpWy5trTtBNtPrQQukkZMdfdxGCPxT
         FTZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783504973; x=1784109773;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=gTDbhLDusd8RpoV9P1sSM4e1vQjmi4jllQGShEAZJQM=;
        b=h5aCtasBo8AXP8ocSFkKhbs0JQeI/CaWe6igj2M47mjfcalh/eazdholiFrshDUDR9
         XNkmhOFkEy0heFKpX35AD1iPT/npRDJCufOSJglau/YGODBdab11nxC9z9rxMOmhyudv
         237XjI2sn0lJBgKA/PfKnn8LoT8uhlhy/MjjgpeLSff+gGn2Ea7E/4G4idKPDK7TlyDO
         jR3ShZkLf95q1NZPCK88HcKC6zaPJJ+8dc8YvLofEFqlNgtWjMTKG4CjNd++OGTQbtmm
         KKNNI5J3no5KkDv6VaS9WiS81wmsC4D67pmTBcAUKMZh/x0hrM/Yr70/7I5njj3BqWSs
         97nA==
X-Gm-Message-State: AOJu0YywWpSCRD5P39s65iz8NNCUjMNXR15gGvwNKbtpMx/SDdmviTfs
	zjggbTEoY13QvFW0th6BW1oFln5rOXc4I/22fKvh9d/RsQ9Esx7pg5N8r1ji9U73iCXRTYy8+PL
	FeMLZZNIR8cSPcoxW5tVCcBxI7aKQTwwlM/1m6VQISsaS4+uJ54ihTNnLroNtKuu7OFft
X-Gm-Gg: AfdE7cnsCoeRX7dfHeH5egFSAvvIJpT7/81czcho26OcigeDANsaZ7OwcBnurIZLDia
	mQBcZXuxRPv7RUFhm2Y+uGdiQYYiaV198cgVcHT+qCyTSCTYmkqdcGY1PNVTgwhkJ2pqOY/XmYH
	gVJT5dteLilQ63HlwQaDLmwTzOeKSMIvug4lljUxi1zBEKmd09NlEFmYL6aIrkt79GKv5lFfFxH
	FutTfD7y0mhg00MAni1Q/qpBSSspHv3JqK9IpNVpFhdfi8/RNcGpezqXy7/2ZG6qGgYsNO6ePIf
	k5w399WXt4XeZMgXh6FTPXKievqogWmV+nT3FVmiCmrukwUYQYBaiUUtTBeG8wOu651gGI+1xHH
	uPw+Dqv4sWwyIlLi30qUeUjHl2tOw61Pby1lNZkjIaVxGF2ZVSqSBNF17GA==
X-Received: by 2002:a17:90b:2883:b0:381:28e0:624d with SMTP id 98e67ed59e1d1-389421ae226mr2037721a91.28.1783504973030;
        Wed, 08 Jul 2026 03:02:53 -0700 (PDT)
X-Received: by 2002:a17:90b:2883:b0:381:28e0:624d with SMTP id 98e67ed59e1d1-389421ae226mr2037659a91.28.1783504972419;
        Wed, 08 Jul 2026 03:02:52 -0700 (PDT)
Received: from hu-qianyu-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-389098609c9sm875741a91.13.2026.07.08.03.02.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Jul 2026 03:02:52 -0700 (PDT)
From: Qiang Yu <qiang.yu@oss.qualcomm.com>
Date: Wed, 08 Jul 2026 03:02:44 -0700
Subject: [PATCH v8 7/7] arm64: dts: qcom: mahua: Add QREF regulator
 supplies to TCSR
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260708-tcsr_qref_0708-v8-7-62c42b5fa269@oss.qualcomm.com>
References: <20260708-tcsr_qref_0708-v8-0-62c42b5fa269@oss.qualcomm.com>
In-Reply-To: <20260708-tcsr_qref_0708-v8-0-62c42b5fa269@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Taniya Das <taniya.das@oss.qualcomm.com>, Kees Cook <kees@kernel.org>,
        "Gustavo A. R. Silva" <gustavoars@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-hardening@vger.kernel.org, Qiang Yu <qiang.yu@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1783504962; l=2520;
 i=qiang.yu@oss.qualcomm.com; s=20250513; h=from:subject:message-id;
 bh=Xv3av/rD+ldK9r9tj755nWcpZGWPEFEhsHdy0UkmLVg=;
 b=ofDwDU6QY94LH8znEWl4KnkKrNyk5BkHR7B81ltOds3r2QDUqDMzE8/CWVIyYSY0xdAneq1uC
 U0aZcCdJp1JDv8dzenw4hdDLtsk/0QnW6iLOviEY4mRNsve7C19QmHU
X-Developer-Key: i=qiang.yu@oss.qualcomm.com; a=ed25519;
 pk=Rr94t+fykoieF1ngg/bXxEfr5KoQxeXPtYxM8fBQTAI=
X-Proofpoint-ORIG-GUID: FgbDNjOCKmKV_2NbA4E25N4m9WqRMjdq
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA4MDA5NiBTYWx0ZWRfXyeclfSB2dHS0
 B0SJYSlY3Megel5vkGemfrEtRO0cMmfi5MaIv6O3fYavkhtJOA/9QWHsjtvwdLojtfqzag8w/SE
 yuFnQycB7v6zIkobr7Bj4mDYy/wNXHg=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA4MDA5NiBTYWx0ZWRfX/nYpOKCz0R4J
 VPY3KMNzfgtg6fmhZxyLkY8W47+bzuCt4tS3OW8WPAGsSgPxeG7dQKbiZbvikH/TT3eYSxN/HaF
 ckEBPB7kpdBaC/cIGP6DtIFl2GeBrLKSgLC0PZ/Zc3YAwqyWBgrw8nHxkHhMWuEN/u5H3+Y0v93
 hyDhNf0twrguv1XhWmsAZbIKy3LD2LxkhfSow+sSRH6dHWgwN2lH+l0OgIAylWQhbbC5jByH/4q
 rTT/M69kdOomJGrVqCUOLtQGzQVPH8mRRzY3ojBB2tN7z354VLDjKdnW08tSRsWwroCSpNUsYf8
 f8VqBOVKQ+jNdhJVVQC26sXpKajiIIPFHTiFfXhA7jXhOGkzaksCFxNr3TQPUh5NtMLFzr3Fywu
 P6DHxGYaTL8WbGht45WCG8wPz0PfPjLdDhvGiAH/2TauQzL3UxMHbgxwwCi/2EprnQwaWvOb4uB
 8/6na79nLXw7+BTjx4g==
X-Authority-Analysis: v=2.4 cv=HaYkiCE8 c=1 sm=1 tr=0 ts=6a4e204d cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=nz7bh4JJC2V4q-rTAcgA:9 a=QEXdDO2ut3YA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-GUID: FgbDNjOCKmKV_2NbA4E25N4m9WqRMjdq
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-08_01,2026-07-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 impostorscore=0 lowpriorityscore=0 clxscore=1015 adultscore=0
 malwarescore=0 suspectscore=0 priorityscore=1501 spamscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607080096
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-117575-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:email,qualcomm.com:dkim];
	FORGED_SENDER(0.00)[qiang.yu@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[18];
	FORGED_RECIPIENTS(0.00)[m:andersson@kernel.org,m:mturquette@baylibre.com,m:sboyd@kernel.org,m:bmasney@redhat.com,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:taniya.das@oss.qualcomm.com,m:kees@kernel.org,m:gustavoars@kernel.org,m:konradybcio@kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-clk@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-hardening@vger.kernel.org,m:qiang.yu@oss.qualcomm.com,m:konrad.dybcio@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
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
X-Rspamd-Queue-Id: 5F5CB724041

Mahua has a different QREF topology from Glymur. Override the TCSR
compatible to qcom,mahua-tcsr in mahua.dtsi, and wire up the required
LDO supplies on the CRD board.

Unlike the other PCIe controllers, PCIe5 PHY on Mahua gets its refclk
from the CXO0 pad directly and requires no QREF clkref_en voting. Hence,
point its ref clock at RPMH_CXO_CLK.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Qiang Yu <qiang.yu@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/mahua-crd.dts | 16 ++++++++++++++++
 arch/arm64/boot/dts/qcom/mahua.dtsi    | 13 +++++++++++++
 2 files changed, 29 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/mahua-crd.dts b/arch/arm64/boot/dts/qcom/mahua-crd.dts
index 9c8244e892dd..fa5229064b10 100644
--- a/arch/arm64/boot/dts/qcom/mahua-crd.dts
+++ b/arch/arm64/boot/dts/qcom/mahua-crd.dts
@@ -19,3 +19,19 @@ / {
 	model = "Qualcomm Technologies, Inc. Mahua CRD";
 	compatible = "qcom,mahua-crd", "qcom,mahua";
 };
+
+&tcsr {
+	vdda-qrefrpt0-0p9-supply = <&vreg_l2f_e1_0p83>;
+	vdda-qrefrpt1-0p9-supply = <&vreg_l2f_e1_0p83>;
+	vdda-qrefrpt2-0p9-supply = <&vreg_l2f_e1_0p83>;
+	vdda-qrefrpt3-0p9-supply = <&vreg_l1f_e1_0p82>;
+	vdda-qrefrpt4-0p9-supply = <&vreg_l2h_e0_0p72>;
+	vdda-qrefrpt5-0p9-supply = <&vreg_l2h_e0_0p72>;
+	vdda-qrefrx0-0p9-supply = <&vreg_l2f_e1_0p83>;
+	vdda-qrefrx1-0p9-supply = <&vreg_l2f_e1_0p83>;
+	vdda-qrefrx2-0p9-supply = <&vreg_l2f_e1_0p83>;
+	vdda-qrefrx3-0p9-supply = <&vreg_l2h_e0_0p72>;
+	vdda-qreftx1-0p9-supply = <&vreg_l1f_e1_0p82>;
+	vdda-refgen3-0p9-supply = <&vreg_l1f_e1_0p82>;
+	vdda-refgen3-1p2-supply = <&vreg_l4f_e1_1p08>;
+};
diff --git a/arch/arm64/boot/dts/qcom/mahua.dtsi b/arch/arm64/boot/dts/qcom/mahua.dtsi
index 22822b6b2e8b..e6c059708912 100644
--- a/arch/arm64/boot/dts/qcom/mahua.dtsi
+++ b/arch/arm64/boot/dts/qcom/mahua.dtsi
@@ -115,6 +115,15 @@ &oobm_ss_noc {
 	compatible = "qcom,mahua-oobm-ss-noc", "qcom,glymur-oobm-ss-noc";
 };
 
+&pcie5_phy {
+	clocks = <&gcc GCC_PCIE_PHY_5_AUX_CLK>,
+		 <&gcc GCC_PCIE_5_CFG_AHB_CLK>,
+		 <&rpmhcc RPMH_CXO_CLK>,
+		 <&gcc GCC_PCIE_5_PHY_RCHNG_CLK>,
+		 <&gcc GCC_PCIE_5_PIPE_CLK>,
+		 <&gcc GCC_PCIE_5_PIPE_DIV2_CLK>;
+};
+
 &pcie_east_anoc {
 	compatible = "qcom,mahua-pcie-east-anoc", "qcom,glymur-pcie-east-anoc";
 };
@@ -286,6 +295,10 @@ gpuss-4-critical {
 	};
 };
 
+&tcsr {
+	compatible = "qcom,mahua-tcsr", "syscon";
+};
+
 &tlmm {
 	compatible = "qcom,mahua-tlmm";
 };

-- 
2.34.1


