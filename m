Return-Path: <linux-arm-msm+bounces-112647-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 2C+pMYJ1KmqVpgMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-112647-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Jun 2026 10:44:50 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 4822A66FFAA
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Jun 2026 10:44:50 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=NAS6rZUv;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=N2Ox2IqD;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-112647-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-112647-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 25FDB31B0D4C
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Jun 2026 08:42:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EA9CC38F629;
	Thu, 11 Jun 2026 08:42:23 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C4E438F638
	for <linux-arm-msm@vger.kernel.org>; Thu, 11 Jun 2026 08:42:22 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781167343; cv=none; b=u0YjfOjur8MgNo3tSDKGSghN2K4yNCUktCx3xn9TNnrbH7rGksM5LiMfI9KyevQiHUw7Q7FiwkF5ddMEJYBrRqGgvzY0wPgT9bJWtDGsI3GRBEXVS61cQlmV3Pbk05FrI8WX9XjTWsM0spwYVVv4QSXVP9fWrqwcInyUsx6ZsSM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781167343; c=relaxed/simple;
	bh=PyF0fdYo6vWHuxwGNpxm+qWjdIOFh5r3zjzY73PIug4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=niqiSeBANvhnwS3ySFr6aQNloGluzV6QjVib1bLNFy8g+9PnRx4aWEYIWgLVrMvK9XJaGRxaExM+jn5ODmvSrXhN3W7Yf9GgOywejrNYvyrlSk/4MhEsJMeKvqiF25+prIIjWfaHhw/5r2epv1BoVfLojkDToXLFBsYm2jXdRlA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=NAS6rZUv; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=N2Ox2IqD; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65B5GJYd3761239
	for <linux-arm-msm@vger.kernel.org>; Thu, 11 Jun 2026 08:42:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=j6YISKI8hlt2pMLbRmzG7/
	7qiLSl2ZGJx07vbqnHumo=; b=NAS6rZUv29sHcRAi03tKEras1jIwLlAttc/lqL
	gqhitX0YTfQKIy1xM4qS89NQu5Dxx09kKensjMxDR9OPt4GJaDW3b5G6FWWwh4z6
	lBK9n0VSsi4aVySJ8pDTCIlDaAG67AblfzkwDczsoem+eMISCCS2i596hthAnDMt
	2sR+okZG0O8Obim2a7dEOgzGJij6hAKYSIqddsTBDL+zuvFQnjOrKhS59nXK8l3k
	mSRLwigQJvcr9zy0FhNoJQVIC8CJKILxf5BwqMUK6bx00LkSz2qadpxn+vP8q12W
	hYk3ewa3mYGxCde/6WsrNF+7VTwb+nnQzVTF8z8OgVyX9Jgw==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eqe6sjk16-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 11 Jun 2026 08:42:21 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2c0a81c1738so44703555ad.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 11 Jun 2026 01:42:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781167340; x=1781772140; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=j6YISKI8hlt2pMLbRmzG7/7qiLSl2ZGJx07vbqnHumo=;
        b=N2Ox2IqDsd4pHkeZgYZ/kdP41zmbA2BePvCIU616iru6+X1lEKpc43dOpOk+cUrm13
         1+t7XHAT0GTo/zf/4H+/yG9TVOtUvwzQty+I+uW8nXy5lVmhU2eA3wXtyuDJfLUVY0h7
         njoCF4tAIh0c0YsTjhnJehggFyoAfDiGcNrmYVSY+ZdPcvAUeNsIOjdVk0Fvn0rlJw+o
         /FZA6ohn6QJ9Cb9erG8FP+a9yj/LhF+POYQEWd1Tnh52k7yxSxojn57BR9MqvADI2rr+
         7pA8MrIRDm9Pdhy21GIfBiUjQjyBEVRhPmiyzmaOL0ekWkiAV7BrnfMkSyoQsfwtKjT8
         HrFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781167340; x=1781772140;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=j6YISKI8hlt2pMLbRmzG7/7qiLSl2ZGJx07vbqnHumo=;
        b=riZYoJhpACj+ooO1u6Hs/Kn6eAXL7T+cC+2RVbogKxBP3YbK4IShvbnxQDhmhTpP5n
         ulor9JGC8KLZzY3tEBNkAuOWuzylTQD0DUkYN6UJtCKY0JaDrEPlaOjwPsIUEZ7AQd8W
         WJ1kRt+Y+Dojwxl/vJWKk8TaZe/PUCJrYdRGNE0el+ffcND6Rt+D1NE0PRYTrJA+U35R
         ayI2AZhD3c1LDPldiULtXZfNd9LA/54Ob5wSyvEqfC3+iIaipiCLN2UfYMO9uhHvaWF4
         iTEo1dXsebteHcTycHl/8MvKP4suv8p2vnmSzgEyWtM77oSkYEsHQ4DqoOm+5Q629rOU
         wI0A==
X-Gm-Message-State: AOJu0YxjSSHGHlKvHRzUOziLkfNyAaaXZ4N1NzSTM6ZIS+uZ2sOXT9fT
	atI0GAyizLqdEdvtgl0cuePKdd7CQXzXwvjnUtOD+PgXNUMsH/MY3Ennh4XLQgXxPk9dXdUKlXH
	G9p5OC2iLunJaIpDB4uA2EurJ+LZxv48iSBfZ9fw9BPBk7vh/dNfd2q2yo+Zna9SaT6tv
X-Gm-Gg: Acq92OHgKr2uM2gcCBUlJJRmEReAWDo5B4FxKGn3et2LDJEki1OQmgr8uE95anbw1UC
	Zp3q04fJ4Os+0qiz3SucM5Nm4EsFU4GU/bgiJAc3r4YOR/lwKzYNpUpVlynRFcaOvNeL43sBw0D
	hN3hyBphKWTztRnv04B8mdxwQ5XQFu4/EosNUCiVhHPQS0TGOPwaIg6NcTzI5W8xgef9qzYKSI+
	MEH9fz5SaSrZQqOSigxhqfZg4JNyHMTmNOKkkhmtN5LbF4YPJmkzOw6BOZtYqPXiahuOVX/WYsk
	QvzGCzNF7cYbaO5VhfPDxzvcc3jYxwKl3VEeJY8RHinUuHLjA+aPfIGG3CJ9u9rW1jMlxPAyNKa
	QY4ai59s/rpp6oh3sA1sabqEVDCx1RXm0X8EmesN3DlBy6mOhl+eRutKkeebrvyMIywzh
X-Received: by 2002:a17:903:3b85:b0:2c1:566b:f907 with SMTP id d9443c01a7336-2c2f21a14d3mr21045075ad.20.1781167340193;
        Thu, 11 Jun 2026 01:42:20 -0700 (PDT)
X-Received: by 2002:a17:903:3b85:b0:2c1:566b:f907 with SMTP id d9443c01a7336-2c2f21a14d3mr21044705ad.20.1781167339693;
        Thu, 11 Jun 2026 01:42:19 -0700 (PDT)
Received: from hu-vishsant-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c166391d53sm344504385ad.65.2026.06.11.01.42.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Jun 2026 01:42:19 -0700 (PDT)
From: Vishnu Santhosh <vishnu.santhosh@oss.qualcomm.com>
Date: Thu, 11 Jun 2026 14:11:59 +0530
Subject: [PATCH] arm64: dts: qcom: shikra: Add BAM-DMUX support
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260611-qcom-shikra-dts-bam-dmux-v1-1-43d0b43d41ef@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIANZ0KmoC/0WNQQ6CMBBFr9J07ZBSsEZijPcwLKZ00EYL0gFjQ
 ri7FRZuJnmT/PdmyRQ9sazELCO9Pfu+S5DvhGzu2N0IvEsstdJGGVXA0PQB+O4fEcGNDBYDuDB
 94NC6xlrTWmO0TPNXpNZ/VvW13jjSMKXCuD2lRSZIuuDHSlgsqCzwSEblv3kgZlzzlTit9b0+/
 MPwLkGB3TeYt6hscdSXnjkbJnz+jFk6Z1kvyxdskmCB4QAAAA==
X-Change-ID: 20260603-qcom-shikra-dts-bam-dmux-7fdcbb6fb662
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, bjorn.andersson@oss.qualcomm.com,
        chris.lew@oss.qualcomm.com,
        Vishnu Santhosh <vishnu.santhosh@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1781167335; l=3100;
 i=vishnu.santhosh@oss.qualcomm.com; s=20251203; h=from:subject:message-id;
 bh=PyF0fdYo6vWHuxwGNpxm+qWjdIOFh5r3zjzY73PIug4=;
 b=mng5lhQ1cB6hwio/EXm0yQHJXHOhrxGKpAmXWWQ0R1YpzmwbuOe+b5O6iAQcgeDaagdZxVxx8
 nUrNV7proz0A5Oj3TLw6mqkVJW6X6SJnA2Y2keVbk9tOlMbPy8xusUK
X-Developer-Key: i=vishnu.santhosh@oss.qualcomm.com; a=ed25519;
 pk=G8/AJPecB1feGI7wxArGWGN0PPGQS0GUaD4THQCbdis=
X-Authority-Analysis: v=2.4 cv=GbMnWwXL c=1 sm=1 tr=0 ts=6a2a74ed cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=otCvKieYPpshcy_r5BMA:9 a=QEXdDO2ut3YA:10
 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-ORIG-GUID: EASxSGs9arXU5_ei3JWGtyCZqBRgR7FU
X-Proofpoint-GUID: EASxSGs9arXU5_ei3JWGtyCZqBRgR7FU
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjExMDA4NSBTYWx0ZWRfX8jrxFbl70/TQ
 VDk98iMALyi5ZH90J3LUmqPfJ68+YvFqB25xygx0tqNC9o4/V40fSYHWCJiYBzPJHzLGqZkPJGq
 dPxF4oteE9chL2aPAno1E8TdyYzadzxga/jXLV7tbK7HZILWkVpzz4s1WY+w0nY2+UbFK+Ie4bF
 tnZtWXAYnpQ37VnLyXaH1jGMUthD727+q7xSykUGnLj+ydm+G5Um2hUgWn668vl5Grd5cPEIfnX
 xQHscy59vpxBMvtsbmFmtlUQ/eZleFNtfctwspYAp41fw8kSwKtK3Wte58PZPGS3lOHawEdfREi
 8m4HPw4M87xOrVkumYTZM3e8YTK7CKKZ3inCx2Mrc1k6D2MDW5/YrWqBNBjHEjvK+/Cuf9DrHr7
 RhG9bXG1TsFW4zeIZ0Ah6lguKrLNXR4p7Wi+y64D8LiiqcupcNWz86XK1wn2CuouABpMbBhTuHe
 gI9n9zqKegVXFy+wjug==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjExMDA4NSBTYWx0ZWRfX0nyo2bu1Gbv/
 q55ozZNtJbb6A/fp01qw7SiEKbXk+6i3cekeTScFivBoqHd6YvoxDOuCVFF1J7Z8gqGB/pH8JeH
 pt5dYehzLV85WY8sH23LJGwdiinZyoY=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-11_01,2026-06-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 malwarescore=0 suspectscore=0
 priorityscore=1501 bulkscore=0 adultscore=0 spamscore=0 impostorscore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606040000
 definitions=main-2606110085
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORWARDED(0.00)[lists@lfdr.de];
	TAGGED_FROM(0.00)[bounces-112647-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[vishnu.santhosh@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS(0.00)[m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:bjorn.andersson@oss.qualcomm.com,m:chris.lew@oss.qualcomm.com,m:vishnu.santhosh@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,qualcomm.com:dkim,qualcomm.com:email];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[vishnu.santhosh@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 4822A66FFAA

Add required nodes to enable the upstream BAM-DMUX WWAN driver on
Qualcomm Shikra SoC.

The SMSM (Shared Memory State Machine) node provides the power
control signaling between the AP and modem for BAM-DMUX. The
BAM DMA controller node describes the A2 modem BAM hardware as a
standard DMA controller. The BAM-DMUX node references the DMA
channels and the pc/pc-ack interrupt lines from the modem SMSM
entry for power control signaling.

Signed-off-by: Vishnu Santhosh <vishnu.santhosh@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/shikra.dtsi | 51 ++++++++++++++++++++++++++++++++++++
 1 file changed, 51 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/shikra.dtsi b/arch/arm64/boot/dts/qcom/shikra.dtsi
index a4334d99c1f35ee851ca8266ec37d4a200a07ee5..3e59d5f6323c0d857f376316faa26c503e67f6bc 100644
--- a/arch/arm64/boot/dts/qcom/shikra.dtsi
+++ b/arch/arm64/boot/dts/qcom/shikra.dtsi
@@ -17,6 +17,23 @@ / {
 	#address-cells = <2>;
 	#size-cells = <2>;
 
+	bam_dmux: bam-dmux {
+		compatible = "qcom,bam-dmux";
+
+		interrupts-extended = <&modem_smsm 1 IRQ_TYPE_EDGE_BOTH>,
+				      <&modem_smsm 11 IRQ_TYPE_EDGE_BOTH>;
+		interrupt-names = "pc",
+				  "pc-ack";
+
+		qcom,smem-states = <&apps_smsm 1>,
+				   <&apps_smsm 11>;
+		qcom,smem-state-names = "pc",
+					"pc-ack";
+
+		dmas = <&bam_dmux_dma 4>, <&bam_dmux_dma 5>;
+		dma-names = "tx", "rx";
+	};
+
 	clocks {
 		xo_board: xo-board {
 			compatible = "fixed-clock";
@@ -314,6 +331,28 @@ lmcu_dtb_mem: lmcu-dtb@b4702000 {
 		};
 	};
 
+	smsm {
+		compatible = "qcom,smsm";
+
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		mboxes = <0>, <&apcs_glb 13>;
+
+		apps_smsm: apps@0 {
+			reg = <0>;
+			#qcom,smem-state-cells = <1>;
+		};
+
+		modem_smsm: modem@1 {
+			reg = <1>;
+			interrupts = <GIC_SPI 69 IRQ_TYPE_EDGE_RISING 0>;
+
+			interrupt-controller;
+			#interrupt-cells = <2>;
+		};
+	};
+
 	soc: soc@0 {
 		compatible = "simple-bus";
 
@@ -640,6 +679,18 @@ &clk_virt SLAVE_QUP_CORE_0 RPM_ALWAYS_TAG>,
 			};
 		};
 
+		bam_dmux_dma: dma-controller@6044000 {
+			compatible = "qcom,bam-v1.7.0";
+			reg = <0x0 0x06044000 0x0 0x19000>;
+			interrupts = <GIC_SPI 74 IRQ_TYPE_EDGE_RISING 0>;
+			#dma-cells = <1>;
+			qcom,ee = <0>;
+
+			num-channels = <6>;
+			qcom,num-ees = <1>;
+			qcom,powered-remotely;
+		};
+
 		sram@c11e000 {
 			compatible = "qcom,shikra-imem", "mmio-sram";
 			reg = <0x0 0x0c11e000 0x0 0x1000>;

---
base-commit: ba3e43a9e601636f5edb54e259a74f96ca3b8fd8
change-id: 20260603-qcom-shikra-dts-bam-dmux-7fdcbb6fb662
prerequisite-message-id: <20260527-shikra-dt-v4-0-b5ca1fa0b392@oss.qualcomm.com>
prerequisite-patch-id: 3a689e8dda5fd2755b689d94d095806b3f2e6eed
prerequisite-patch-id: 2acc300a68ed8c5364fb5f2f7d28fc0d56ab07bf
prerequisite-patch-id: 2357cac636e019eaf14d6a493a1c72bca56fe405
prerequisite-patch-id: 2885f299e711582da312ca9d13983d296a3dd5dc
prerequisite-patch-id: 91af5f3c01e766a53ce8de69aa21847a2d6bbbf8

Best regards,
-- 
Vishnu Santhosh <vishnu.santhosh@oss.qualcomm.com>


