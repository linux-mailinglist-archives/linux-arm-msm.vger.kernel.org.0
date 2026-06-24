Return-Path: <linux-arm-msm+bounces-114341-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id igLgFvXPO2pYdggAu9opvQ
	(envelope-from <linux-arm-msm+bounces-114341-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 24 Jun 2026 14:39:17 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id C18FA6BE35D
	for <lists+linux-arm-msm@lfdr.de>; Wed, 24 Jun 2026 14:39:16 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=Dl7U+El2;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=khCCyITx;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-114341-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-114341-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 708C030297B7
	for <lists+linux-arm-msm@lfdr.de>; Wed, 24 Jun 2026 12:38:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2A7C926A0DD;
	Wed, 24 Jun 2026 12:38:44 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF9F9238D54
	for <linux-arm-msm@vger.kernel.org>; Wed, 24 Jun 2026 12:38:42 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782304724; cv=none; b=bC4AYWdhwCXrSEA6vSdE/TPXj7cFEJDLPtzaKRCLoXpPvEMQc1tpJ2R/TX8qmrBw5D5/ZRsfaEUUu9dBuFUvCaWCtqdbJN9+aCTHueu0Acl0KrtDPAyHmyqFcgeMGe4/fgaEs0JTp7WN+5ihyVg9/Y46UM51/mX0CV4kBHcVC7E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782304724; c=relaxed/simple;
	bh=/FI2p5Zgj/9W0PIocqhsjPLE701QfR6sEWYzHDE8R3E=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=Ta5zderM9GtTZ/xy1qWng6eUY20OfEVqNP7PbPPHT5dJYLUGR0UM2HpGWDpSBl8kmIyHEWJFHPfe4KCvZJCKnuKvHM1s8WYa6IaSJD1I0QpTY2ajdTvsVVVxZW/vcGAZFHTB8WDOKe0Hmvkeq90U/Gn85xlpGHAeHepcUGSa4PM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Dl7U+El2; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=khCCyITx; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65OANhoW2502202
	for <linux-arm-msm@vger.kernel.org>; Wed, 24 Jun 2026 12:38:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=LIUckOvvlHEGAGk8h1kcwP
	Ja2OesMEBBzQs9r3daS2o=; b=Dl7U+El25qJeB/XEC0FfpRqM+9wnWEZxRLj3TZ
	2nEjkFZSU6Fq7x6ic39ibfTOSbh+ywnBB47yi4oRra+NbOliuJx5emSh7TMJlMfT
	ZJPSMuV5nN1SFXBv718lfBSs/7w7/rZ+cDDasCjzJOKG9NemajJVLsnLh9rCQaFy
	iAXuLqEMPUVriOSJrM+0PRSWBiaC+mVmJisBcO0mXuNyWuzIvtEDXO8I1XSCGdBF
	QML4S7HljzKE2ayuYfyHR4bBeAZ5ZrxKoRtB9ZPZwkm51SBfUgVoBWVwGepnOfQ/
	QsgYmeA/RQD2H6fZWlzyl2X6R1nE2JN3vcwb41hvv0htpuBA==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f0d450kta-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 24 Jun 2026 12:38:29 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-36d98b74447so736704a91.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 24 Jun 2026 05:38:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782304709; x=1782909509; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=LIUckOvvlHEGAGk8h1kcwPJa2OesMEBBzQs9r3daS2o=;
        b=khCCyITxSoNQF3QpnJ5Z+HnAFCEG9r+uDzotf0XtAtJZbcvDNOwdrXWa8JTkqB2/+x
         kJz9kU0gGzLpLS8EnM/6mpzMdcLCjkQEf6zAPrhT3JhrPbG8xPlxPWa+/8Af5jYyQS59
         FxIf3Ee3ESSBtBZjwEuZqtWfctNnh9HLNzxW/xbPrKr1YjY6zLZS37V6GiC1L6PQClSM
         eeJ3i4BI/UKlkjOaZnc/myQengc5kKwu642wWSIXXJXwz4xpJ4JI+5QS3hH2dQFYz12/
         CHidrx8xkBSXuSzU2c8WWLwT/OmFYIwkIgqzK3ln0TCXXvaiPbLm9KTU+LgR7ifLisuE
         lPvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782304709; x=1782909509;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LIUckOvvlHEGAGk8h1kcwPJa2OesMEBBzQs9r3daS2o=;
        b=TMt390nqAhmVdr0AeHaQCLVeo65Fs3ulCjRAoOhibGVXIQnnlRpWXBJDfglOce6tiW
         QRjeByr9jbmHZwDi6QWvZoxZ4qESOFYMvVsJso8FZkeCA4NCDRPm0hujNmBkLUqoSREe
         lRJ6KtlTJq4XF1bVbblzz068uj7kzy9zejTQ8dQvkiEdWrzJVLgxG9CVCEsXyR+/Ihaf
         sWxbrTfmrgrdRT3NiKbcgSKgJr/XQEf6uTe3/b7VPSwFGQ42XMw43iRdcq5SxLZLkLKB
         Az/aixG/pcUvXaSTQbEERxqpKIkwkDNgu2sef7Cj9bDFwjF28VRCuQVFMbv/pnS+09B7
         3pvw==
X-Gm-Message-State: AOJu0YzBBQfIdVFFnFo/fEuAw+b9+VRsSkeG916jx8+hu2ocCv0kWVPO
	ZKHi+5tThrnxAgI/3+bnaP0u8FDlXtkSgpe+HE3NQMSccWp/ApmwNEdidJdfy8/OUpuHtFmXpL1
	1FrMK9qH3XeVC2f8oRMizPcLV/dpOkORVKXOnRSPEXbyD37Q+VTV9TQbo1qm4i4CHSyFz
X-Gm-Gg: AfdE7cmeuQ5YPEPOK6eQuVCUpSVkVV7KcLnYQRA/KxXmNd8u+PFqEMcdo31YxBl1JTC
	i7l3bYpelR/AsRpjCWXRvCaLW1+1K23odf/KlSI8TnV2uiWRYEmkJyFcfRZH8b5EtJoB0NgBuTb
	MYGklWB/rQOSnH+29dkr1iVP6Vd3Bea5dA17O1hvR33wFM6LK9b2fsClHMT9vgqWlYtehNwZzsD
	WC+K9w5JhsdSsgFvcLPPlmMJOsNuUbfcgs9AMqMHUajMXyV052cb9GGzLe1CpeZRR18sX6SX3+Y
	5GdoQh9LkjP2G7j9baz64gEx4cQhWiSqfhgZ4Q9qehIaUuB190OvZnA346dA9TpY8ucKYR+ARqC
	a74nlO4tqO0vJrURxx9IQfbzYuL2wZVvrDzZVG+EJdg5aU2VU9C0HqMz7DSeB94huZ3+vP/I7eQ
	==
X-Received: by 2002:a17:902:cf0a:b0:2c6:a981:b591 with SMTP id d9443c01a7336-2c7e152c710mr37050805ad.30.1782304709161;
        Wed, 24 Jun 2026 05:38:29 -0700 (PDT)
X-Received: by 2002:a17:902:cf0a:b0:2c6:a981:b591 with SMTP id d9443c01a7336-2c7e152c710mr37050525ad.30.1782304708707;
        Wed, 24 Jun 2026 05:38:28 -0700 (PDT)
Received: from jiegan-gv.ap.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c7439f86aesm132646365ad.49.2026.06.24.05.38.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Jun 2026 05:38:28 -0700 (PDT)
From: Jie Gan <jie.gan@oss.qualcomm.com>
Date: Wed, 24 Jun 2026 20:38:12 +0800
Subject: [PATCH v2] arm64: dts: qcom: glymur: Add label properties to
 CoreSight devices
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260624-add-label-node-for-glymur-v2-1-e8420fd7025f@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIALXPO2oC/42NQQqDMBREryJ/3S9JUGO66j2Ki2i+GojGJlUq4
 t2beoJuBt7AvDkgUrAU4Z4dEGiz0fo5gbhl0I16HgitSQyCiYpVokBtDDrdksPZG8LeBxzcPq0
 BeatL1RdS1ZJB2i+Bevu53M8m8Wjj24f9utr4r/3HunHkWMtSVpzJVin18DHmr1W7zk9TngKa8
 zy/PjbuackAAAA=
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Tingwei Zhang <tingwei.zhang@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Jie Gan <jie.gan@oss.qualcomm.com>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1782304705; l=6019;
 i=jie.gan@oss.qualcomm.com; s=20250909; h=from:subject:message-id;
 bh=/FI2p5Zgj/9W0PIocqhsjPLE701QfR6sEWYzHDE8R3E=;
 b=ffPPDYUAgFhYnpd+sHHGwAL76VGDc/JsqcW1w9ULaC9pfZx9rB/Ngl+9DuGVeSCR+WSwJlrVh
 svNJdRV12PICecqgHzHTXdFktrPL7qqD9fgxd73uu7lf41uP9p7ajC9
X-Developer-Key: i=jie.gan@oss.qualcomm.com; a=ed25519;
 pk=3LxxUZRPCNkvPDlWOvXfJNqNO4SfGdy3eghMb8puHuk=
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI0MDEwNSBTYWx0ZWRfX0ABkmFz5wADT
 8PW5HG2kv6uYqfpBmjmGvukk/ZT8KBxHPA85l3G62MaB66nG6ug7l1qV444cMXlqpCicyB4o0+U
 m2QIEbftHAuTBzkXZUbAxcVWhfLaB+k=
X-Proofpoint-GUID: jx86pOACopStEA5QxSZeLJssesYawp0d
X-Authority-Analysis: v=2.4 cv=Ar7eGu9P c=1 sm=1 tr=0 ts=6a3bcfc5 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=vDhI5xCtqzLtBQcGGHYA:9
 a=F4HjgUavbmbVaGj_:21 a=QEXdDO2ut3YA:10 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-ORIG-GUID: jx86pOACopStEA5QxSZeLJssesYawp0d
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI0MDEwNSBTYWx0ZWRfXxh7tZ58r2AbS
 sOReoRcZZZQLfR1zybF31rFmY2B+tVPQYH4bgPDpBncvN0+gOCtXUiGZe2aRBnegZxyIRouRgAz
 HJOajK0K+08/f6B46WKblM5ufAfTc4cYcNinMu3qeidzAZ2F+G9L65rDKpvllRNDvokunpftZCk
 npxveMQ72fYBb2lxVQdEKDmQY1bpWYn3TJtjdxlbEITVpv1vn8a0KNtafukI2EsgCZr2QAOH7+I
 vGHJNiB0qnix0H0xYZGmO5RjW7Vb8vPYO9v5JtYBoznaPciSGNxy4c/3wW6DL8cbo97QnXsCfD6
 ITRRRQFPiDU6qBZl28ZVUWXvAa8p7Yu2Yca1bk7tth+HeZnkAPEUNq/ZxdDH8obC2TpzBXQRjDf
 rZ1vIr6A1COiVDyFm1BCERwBhnoMBg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-24_03,2026-06-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 malwarescore=0 lowpriorityscore=0 phishscore=0 adultscore=0
 spamscore=0 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2606240105
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORWARDED(0.00)[lists@lfdr.de];
	TAGGED_FROM(0.00)[bounces-114341-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[jie.gan@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS(0.00)[m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:tingwei.zhang@oss.qualcomm.com,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:jie.gan@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jie.gan@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: C18FA6BE35D

Add label properties to TPDM and CTI nodes in the glymur device tree to
provide human-readable identifiers for each CoreSight device. These
labels allow userspace tools and the CoreSight framework to identify
devices by name rather than by base address.

Signed-off-by: Jie Gan <jie.gan@oss.qualcomm.com>
---
Changes in v2:
- fix typo in commit message: "hamoa" -> "glymur"
- Link to v1: https://lore.kernel.org/r/20260624-add-label-node-for-glymur-v1-1-87576107b999@oss.qualcomm.com
---
 arch/arm64/boot/dts/qcom/glymur.dtsi | 28 ++++++++++++++++++++++++++++
 1 file changed, 28 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/glymur.dtsi b/arch/arm64/boot/dts/qcom/glymur.dtsi
index 20b49af7298e..27cc30de940e 100644
--- a/arch/arm64/boot/dts/qcom/glymur.dtsi
+++ b/arch/arm64/boot/dts/qcom/glymur.dtsi
@@ -5770,6 +5770,7 @@ tpdm@1000f000 {
 
 			clocks = <&aoss_qmp>;
 			clock-names = "apb_pclk";
+			label = "tpdm_spdm";
 
 			qcom,cmb-element-bits = <32>;
 			qcom,cmb-msrs-num = <32>;
@@ -5834,6 +5835,7 @@ tpdm@1102c000 {
 
 			clocks = <&aoss_qmp>;
 			clock-names = "apb_pclk";
+			label = "tpdm_gcc";
 
 			qcom,dsb-msrs-num = <32>;
 
@@ -5852,6 +5854,7 @@ tpdm@11180000 {
 
 			clocks = <&aoss_qmp>;
 			clock-names = "apb_pclk";
+			label = "tpdm_cdsp";
 
 			qcom,dsb-element-bits = <32>;
 			qcom,dsb-msrs-num = <32>;
@@ -5871,6 +5874,7 @@ tpdm@11185000 {
 
 			clocks = <&aoss_qmp>;
 			clock-names = "apb_pclk";
+			label = "tpdm_cdsp_dpm_1";
 
 			qcom,cmb-element-bits = <64>;
 			qcom,cmb-msrs-num = <32>;
@@ -5890,6 +5894,7 @@ tpdm@11186000 {
 
 			clocks = <&aoss_qmp>;
 			clock-names = "apb_pclk";
+			label = "tpdm_cdsp_dpm_2";
 
 			qcom,cmb-element-bits = <64>;
 			qcom,cmb-msrs-num = <32>;
@@ -6010,6 +6015,7 @@ cti@11193000 {
 
 			clocks = <&aoss_qmp>;
 			clock-names = "apb_pclk";
+			label = "cti_cdsp";
 		};
 
 		cti_wpss: cti@111ab000 {
@@ -6018,6 +6024,7 @@ cti_wpss: cti@111ab000 {
 
 			clocks = <&aoss_qmp>;
 			clock-names = "apb_pclk";
+			label = "cti_wpss";
 		};
 
 		tpdm@111d0000 {
@@ -6026,6 +6033,7 @@ tpdm@111d0000 {
 
 			clocks = <&aoss_qmp>;
 			clock-names = "apb_pclk";
+			label = "tpdm_qm";
 
 			qcom,dsb-msrs-num = <32>;
 
@@ -6201,6 +6209,7 @@ tpdm@11207000 {
 
 			clocks = <&aoss_qmp>;
 			clock-names = "apb_pclk";
+			label = "tpdm_mm_dsb";
 
 			qcom,dsb-msrs-num = <32>;
 
@@ -6219,6 +6228,7 @@ tpdm@1120b000 {
 
 			clocks = <&aoss_qmp>;
 			clock-names = "apb_pclk";
+			label = "tpdm_east_dsb";
 
 			qcom,dsb-msrs-num = <32>;
 
@@ -6237,6 +6247,7 @@ tpdm@11213000 {
 
 			clocks = <&aoss_qmp>;
 			clock-names = "apb_pclk";
+			label = "tpdm_west_dsb";
 
 			qcom,dsb-msrs-num = <32>;
 
@@ -6255,6 +6266,7 @@ tpdm@11219000 {
 
 			clocks = <&aoss_qmp>;
 			clock-names = "apb_pclk";
+			label = "tpdm_center_dsb";
 
 			qcom,dsb-msrs-num = <32>;
 
@@ -6273,6 +6285,7 @@ tpdm@1121a000 {
 
 			clocks = <&aoss_qmp>;
 			clock-names = "apb_pclk";
+			label = "tpdm_ipcc";
 
 			qcom,cmb-msrs-num = <32>;
 
@@ -6291,6 +6304,7 @@ tpdm@1121b000 {
 
 			clocks = <&aoss_qmp>;
 			clock-names = "apb_pclk";
+			label = "tpdm_qrng";
 
 			qcom,cmb-msrs-num = <32>;
 
@@ -6309,6 +6323,7 @@ tpdm@1121c000 {
 
 			clocks = <&aoss_qmp>;
 			clock-names = "apb_pclk";
+			label = "tpdm_pmu";
 
 			qcom,dsb-msrs-num = <32>;
 
@@ -6327,6 +6342,7 @@ tpdm@1121d000 {
 
 			clocks = <&aoss_qmp>;
 			clock-names = "apb_pclk";
+			label = "tpdm_rdpm_cx";
 
 			qcom,cmb-msrs-num = <32>;
 
@@ -6345,6 +6361,7 @@ tpdm@1121e000 {
 
 			clocks = <&aoss_qmp>;
 			clock-names = "apb_pclk";
+			label = "tpdm_rdpm_mxc";
 
 			qcom,cmb-msrs-num = <32>;
 
@@ -6363,6 +6380,7 @@ tpdm@1121f000 {
 
 			clocks = <&aoss_qmp>;
 			clock-names = "apb_pclk";
+			label = "tpdm_rdpm_mxa";
 
 			qcom,cmb-msrs-num = <32>;
 
@@ -6381,6 +6399,7 @@ tpdm@11220000 {
 
 			clocks = <&aoss_qmp>;
 			clock-names = "apb_pclk";
+			label = "tpdm_center_dsb_1";
 
 			qcom,dsb-msrs-num = <32>;
 
@@ -6399,6 +6418,7 @@ tpdm@11224000 {
 
 			clocks = <&aoss_qmp>;
 			clock-names = "apb_pclk";
+			label = "tpdm_south2_dsb";
 
 			qcom,dsb-msrs-num = <32>;
 
@@ -6417,6 +6437,7 @@ tpdm@11228000 {
 
 			clocks = <&aoss_qmp>;
 			clock-names = "apb_pclk";
+			label = "tpdm_south_dsb";
 
 			qcom,dsb-msrs-num = <32>;
 
@@ -6435,6 +6456,7 @@ tpdm@11470000 {
 
 			clocks = <&aoss_qmp>;
 			clock-names = "apb_pclk";
+			label = "tpdm_pcie_rscc";
 
 			qcom,cmb-element-bits = <32>;
 			qcom,cmb-msrs-num = <32>;
@@ -6478,6 +6500,7 @@ tpdm@11c03000 {
 
 			clocks = <&aoss_qmp>;
 			clock-names = "apb_pclk";
+			label = "tpdm_swao_prio_4";
 
 			qcom,cmb-element-bits = <64>;
 			qcom,cmb-msrs-num = <32>;
@@ -6656,6 +6679,7 @@ tpdm@11c09000 {
 
 			clocks = <&aoss_qmp>;
 			clock-names = "apb_pclk";
+			label = "tpdm_swao_prio_0";
 
 			qcom,cmb-element-bits = <64>;
 			qcom,cmb-msrs-num = <32>;
@@ -6675,6 +6699,7 @@ tpdm@11c0a000 {
 
 			clocks = <&aoss_qmp>;
 			clock-names = "apb_pclk";
+			label = "tpdm_swao_prio_1";
 
 			qcom,cmb-element-bits = <64>;
 			qcom,cmb-msrs-num = <32>;
@@ -6694,6 +6719,7 @@ tpdm@11c0b000 {
 
 			clocks = <&aoss_qmp>;
 			clock-names = "apb_pclk";
+			label = "tpdm_swao_prio_2";
 
 			qcom,cmb-element-bits = <64>;
 			qcom,cmb-msrs-num = <32>;
@@ -6713,6 +6739,7 @@ tpdm@11c0c000 {
 
 			clocks = <&aoss_qmp>;
 			clock-names = "apb_pclk";
+			label = "tpdm_swao_prio_3";
 
 			qcom,cmb-element-bits = <64>;
 			qcom,cmb-msrs-num = <32>;
@@ -6732,6 +6759,7 @@ tpdm@11c0d000 {
 
 			clocks = <&aoss_qmp>;
 			clock-names = "apb_pclk";
+			label = "tpdm_swao";
 
 			qcom,dsb-element-bits = <32>;
 			qcom,dsb-msrs-num = <32>;

---
base-commit: 4e5dfb7c84012007c3c7061126491bbc92d71bf1
change-id: 20260624-add-label-node-for-glymur-1ba59f479870

Best regards,
-- 
Jie Gan <jie.gan@oss.qualcomm.com>


