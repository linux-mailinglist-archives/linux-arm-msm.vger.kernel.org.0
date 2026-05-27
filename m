Return-Path: <linux-arm-msm+bounces-109986-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UJO5IcLEFmrOqgcAu9opvQ
	(envelope-from <linux-arm-msm+bounces-109986-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 27 May 2026 12:17:38 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 024E75E27EC
	for <lists+linux-arm-msm@lfdr.de>; Wed, 27 May 2026 12:17:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id DB9FA312A6B7
	for <lists+linux-arm-msm@lfdr.de>; Wed, 27 May 2026 10:11:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 903AF3EFFB5;
	Wed, 27 May 2026 10:11:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Db4qRlFH";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="OmAZnSiz"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9546B3932E1
	for <linux-arm-msm@vger.kernel.org>; Wed, 27 May 2026 10:11:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779876666; cv=none; b=BTMVw83t/3OSPHyABYQbBSoCdWo/K6bKUg2UJlWRQCkILRqw5GgWIPkM5IorXygH5IgcVSx/Ff9HPU6EMY8ShGEifLoVJ1F4u2/FhmOEXAMbyQaxL2UhspmMwkFt5j6v0fWAnoFdDKRj/xTY4fyWdyKAKtBEk1ek6nMToXb/vqg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779876666; c=relaxed/simple;
	bh=4r+fMZ+uTTWyLCsWD42MPhWz3MsxRIxJ1NOSS/bbs2Q=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=XSV3qXk+HGwEfJZZLXRV4l6jtHU+C30Qpf28AAG+fR9vOzmc+oZhQdNB8DLOeLrma3ZjLawtVc0uI1337z4vREmqAcukHztCfQbT+22XM/cJhZRL1Impr1ZHEulP4w3kAxmqJ4enVAbcQfvJ6YwlQHpsg6GDblDRQO4XxqAvIeA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Db4qRlFH; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=OmAZnSiz; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64R8mRRn1040710
	for <linux-arm-msm@vger.kernel.org>; Wed, 27 May 2026 10:10:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=QEmRa+wZA/TpInOzisybYp
	tKK+tTZk+GBFYtMogBbk4=; b=Db4qRlFHpjzjgtAVOftdwE3isYFecjagMkYfV9
	b/il5moeRYeWQR72RY2dAX6Wja28b3xrvaaCjPi7sSdktJ1w9RL8f0NqFG2h3DYE
	kiE9AB/K9GwlBE5Jcr1kakMi8DU0UsrhTKmEv/7XcRTf/Vtj7FbR0rPWujoJuqKr
	kQSY6RGhbG+hlp1pGh324t1ceJgouFTaVZBm+BgC3Ru0PgpA9BEG1j2HXYXxukZ6
	RF8MQW94VLfyMILx8PxTjh245jw4S6HN6gJg49gi2xZ2h8Id8+yMvAt2gL9Rc29j
	U3OtFduYMHozH9X5j8y2zLk8FQNNe1ZklKm7NBoXyRDJjJeg==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4edh17atv6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 27 May 2026 10:10:58 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-c828f0f5c23so5688038a12.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 27 May 2026 03:10:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779876657; x=1780481457; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=QEmRa+wZA/TpInOzisybYptKK+tTZk+GBFYtMogBbk4=;
        b=OmAZnSizWc4lJM8jJp+lUNUS/LQ312oaWQ7uaoLInhds/skdDmn5puZ3YxN6FIBQXZ
         0gZK3KFkkCxZ0xSk56ODB0Oo/8yCt9uHxp3zOhimbZk10U+4F0e3IVRuUrIUqb/Sf5xn
         3rYEUYEuMwv6zeCRjzzsHM6OMNxZ21p9xC1wWY9As+BBtvTBDpErGLC643ynFZt/pX/M
         W4bnYpJDIT3FmeDO8ffF7EKA/DECCRSAxnIH5nDytCq2MeTfD2CsfJuCRUWKs9feeW+M
         hv70gZXzG5wVmHBl2zIo+QgXw7ZR8h7aZgCDdSwaeUjMhSXXOy+X4Lm+PpCFNlRf8zXu
         A/hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779876657; x=1780481457;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QEmRa+wZA/TpInOzisybYptKK+tTZk+GBFYtMogBbk4=;
        b=oEM+plgKJZKU2N2UYkdocAypwCNWMzcm85/bFWz8mxmw/W+dkMzN5OHXAzXuXjgH8+
         nvDGlpzrDIbILxjqyBkYR+4NdsO+/STCm/d26K5uxaXvy7Hswl3lVG6owr9+YPzgldGA
         im6lKIx6KDvmBtyyQqqjNSbAyagT+QIxEoxN+s/Biqka40j0W/gaglcF5ZKFSUXX//Kk
         S5VRY/ADszUJ1JhCvAMeKfbqQU+t5MOETH3ZMzCB2IkKP5P15QMHMwF81Gs8fEtyQS3y
         O9Eyi2XqMeEHSxTESu3HHkE4xAl8NX0rTTCuLjMdyx+8odg4PWBG9Ch1rrZmh71y1VvH
         36NQ==
X-Gm-Message-State: AOJu0Yyes4lgu6iaIXx3EAUMbNthNvyq7LrkD525PUYlSpMNz5Kwc2hg
	3No81PvM+JouSNyCPB8aZY+ilEpkS6TAatMeKWxVzwIfpCr/u73kWA2JGWnzp7S0om2BoSsm2yk
	2/xhrukkDOZ33bT0UjTt2ShiANhMHZrnZUK4REyp+WQEyA1dz4XONJ0GewrItNnf8x03pMcQxtf
	T2
X-Gm-Gg: Acq92OGJePwK6ArLk1ayuNK6VBUCT5D0s9ZE8soZGlHzAkmn6nNGMbXVFNJ5ThoOr+D
	HkJfdMry1nwVRQ7ftN0RO9bWWm4rHBwATAFucOT/oc7E4LOyYrseykmSEw/Unh41vFdXIgPOCpD
	dPc1vIvaUfaWNQxD/jgBT7wfSNpC9v1enkgnjsImcNuqcI+6vtggHM5Kc1ACYTrzMh3OKhnM+Wn
	FGC0uCxCovii9w90tiMpb8Z1E/uzoPdXwO5zKR1X350BhaBZKzv1vfd2qOCvTu9nzWFj55VffSn
	K+h4cYJCKels57kNHo1AztG3higILFpV/h2HJEc9lh+bCfdX8zLPVScghDa2dQy3/CTwjso7ZR+
	HErSG7vwx7sQoRzy/HPaHOoQ06cVn1zrGShl9jHFgbAK6/nlkRQtfF4AWEp5kE5N+W/1efA==
X-Received: by 2002:a05:6a00:2295:b0:82d:556b:7a01 with SMTP id d2e1a72fcca58-8415f15a680mr21048088b3a.16.1779876657464;
        Wed, 27 May 2026 03:10:57 -0700 (PDT)
X-Received: by 2002:a05:6a00:2295:b0:82d:556b:7a01 with SMTP id d2e1a72fcca58-8415f15a680mr21048047b3a.16.1779876656974;
        Wed, 27 May 2026 03:10:56 -0700 (PDT)
Received: from hu-arakshit-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-841d70df178sm2441539b3a.42.2026.05.27.03.10.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 May 2026 03:10:56 -0700 (PDT)
From: Abhinaba Rakshit <abhinaba.rakshit@oss.qualcomm.com>
Date: Wed, 27 May 2026 15:40:47 +0530
Subject: [PATCH] arm64: dts: qcom: lemans: Add OPP-table for ICE UFS device
 node
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260527-add-opp-table-for-lemans-ice-ufs-v1-1-3f97f5ce60db@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIACbDFmoC/x3NQQrCMBBG4auUWftDGkhEryIuYjLRgZqEjIpQe
 veGLr/Neyspd2Gl67RS55+o1DIwnyaKr1CeDEnDZI31xlmHkBJqa/iEx8LItWPhdygKiYxvVsz
 Op7Nh6y8+0si0zln+x+J237YdBmIfrnIAAAA=
X-Change-ID: 20260525-add-opp-table-for-lemans-ice-ufs-156d70e2696c
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Neeraj Soni <neeraj.soni@oss.qualcomm.com>,
        Harshal Dev <harshal.dev@oss.qualcomm.com>,
        Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Abhinaba Rakshit <abhinaba.rakshit@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Proofpoint-ORIG-GUID: uk_A94fxf3alSZ177hfea2oWoU2PgtAD
X-Proofpoint-GUID: uk_A94fxf3alSZ177hfea2oWoU2PgtAD
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTI3MDA5NiBTYWx0ZWRfX4miN1MrG1Xm9
 GySjvh7W6LuI5w/z427ImDqiXkDgEFNDqxdjorr1Pyfmj5c3OtBg9NKLpMLBr5c3Mn+DwJbYM3s
 2O2btBU5sKoWOdoOpOKdqS8AupdB+A9doa8Z+x56S/jYkEu7/IRhJW3ljq9p1iD83wQ5cOVtx7c
 u8/p0GjY58MZPlSwJc/eH3IHBfcn2SUnUQeEiiMkKDvTfbsA+LTwITv24vWmX5GhKgH+5Idvyy0
 1aX3mJp8PnLmyCUI+48VU/9LE+i9dZxuHVkPqJlN2WOYqQY7CCb4AG/NXKRbMI1pGWsnQSw0o7X
 l4Kltp4PT8NILDXpSt48axuVyCmCm0MFGg31ugLPJEUvYOCJG+g2+GLBdEr5q3csNhJ2lPK1ZxV
 uK7BPLURY7wcmKhhZQTqiiSpScendIP1giwwHTI1IRQNE8bFPbW4vcnjyk0CzhFWWHB708XWKMg
 HSnNKbHdojX1Es/wzCQ==
X-Authority-Analysis: v=2.4 cv=Gc0nWwXL c=1 sm=1 tr=0 ts=6a16c332 cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=XOz6Fnkc2SSDDoo3uF8A:9 a=QEXdDO2ut3YA:10
 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-05-27_01,2026-05-26_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 clxscore=1015 phishscore=0 adultscore=0 lowpriorityscore=0
 malwarescore=0 priorityscore=1501 bulkscore=0 impostorscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605270096
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[12];
	TAGGED_FROM(0.00)[bounces-109986-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[abhinaba.rakshit@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 024E75E27EC
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Qualcomm Inline Crypto Engine (ICE) platform driver now supports
an optional OPP-table.

Add OPP-table for ICE UFS device nodes for LeMans platform.

Signed-off-by: Abhinaba Rakshit <abhinaba.rakshit@oss.qualcomm.com>
---
Testing:
* dtbs_check
* Validated on LeMans-evk platform
---
 arch/arm64/boot/dts/qcom/lemans.dtsi | 26 ++++++++++++++++++++++++++
 1 file changed, 26 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/lemans.dtsi b/arch/arm64/boot/dts/qcom/lemans.dtsi
index 522ba43836a2425a8612506f5f7113f291f34706..43f96c6d3eb14140ef20091f5b25886c44fd5ac1 100644
--- a/arch/arm64/boot/dts/qcom/lemans.dtsi
+++ b/arch/arm64/boot/dts/qcom/lemans.dtsi
@@ -3109,6 +3109,32 @@ ice: crypto@1d88000 {
 			clock-names = "core",
 				      "iface";
 			power-domains = <&gcc UFS_PHY_GDSC>;
+
+			operating-points-v2 = <&ice_opp_table>;
+
+			ice_opp_table: opp-table {
+				compatible = "operating-points-v2";
+
+				opp-75000000 {
+					opp-hz = /bits/ 64 <750000000>;
+					required-opps = <&rpmhpd_opp_svs_l1>;
+				};
+
+				opp-150000000 {
+					opp-hz = /bits/ 64 <150000000>;
+					required-opps = <&rpmhpd_opp_svs_l1>;
+				};
+
+				opp-300000000 {
+					opp-hz = /bits/ 64 <300000000>;
+					required-opps = <&rpmhpd_opp_nom>;
+				};
+
+				opp-600000000 {
+					opp-hz = /bits/ 64 <600000000>;
+					required-opps = <&rpmhpd_opp_nom>;
+				};
+			};
 		};
 
 		cryptobam: dma-controller@1dc4000 {

---
base-commit: c1ecb239fa3456529a32255359fc78b69eb9d847
change-id: 20260525-add-opp-table-for-lemans-ice-ufs-156d70e2696c

Best regards,
-- 
Abhinaba Rakshit <abhinaba.rakshit@oss.qualcomm.com>


