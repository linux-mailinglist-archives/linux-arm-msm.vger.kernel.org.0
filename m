Return-Path: <linux-arm-msm+bounces-112416-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id XC91Bn9JKWq8TgMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-112416-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 10 Jun 2026 13:24:47 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id CB019668BDC
	for <lists+linux-arm-msm@lfdr.de>; Wed, 10 Jun 2026 13:24:46 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=ASr16nZq;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=cUP906BW;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-112416-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c09:e001:a7::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-112416-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 94773311D5F6
	for <lists+linux-arm-msm@lfdr.de>; Wed, 10 Jun 2026 11:16:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 817FD405C2C;
	Wed, 10 Jun 2026 11:15:48 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 568DC3FF1B8
	for <linux-arm-msm@vger.kernel.org>; Wed, 10 Jun 2026 11:15:41 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781090148; cv=none; b=D54W5Xik9qnkAGvraCa4pAVdyOrFqDORLib3dncsiHawRbCVtCNX+WPUI8ydZ+1IbPQkVon9m32EtkDXobJi+V0H4wJgsz6Gij1a1F7oING8Ue3iAkiJW91dPFCugRDvj5YABj2f45opRLzQ69jrKXJDgZT3p+AIdOSXiBVeml4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781090148; c=relaxed/simple;
	bh=6dwL1ftuAckcO+MTkZWogD22aGYMRTsgNT8APAs54s0=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=OVsvneXUltn7N2RSqOgRpIhTYAuTVvzLCDU5HhFJIw36A4Ln2E+iCe8hWJqDDmCYrC5bXMCVSBIstZF0hmtzJz+bTW/1Vah/UQ5lpucc9pSVZSzE3lbEmo/mUO9p3p5fSNNaONBVz9XSnwWC6wwNg8ZRKT5LGNv5mclkSDMjAM0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ASr16nZq; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=cUP906BW; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65A7htct3151743
	for <linux-arm-msm@vger.kernel.org>; Wed, 10 Jun 2026 11:15:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=PyGrPV2eIi/
	91dO4T8/qrr0Wh15rlxzflEwCOTwJI90=; b=ASr16nZq3H0MPsF344dp1mVRCxZ
	rs+/2IAu/+dlPeDk6LtwQcZPgevBZmBBm2zcFH5ubUySo4JVFUA3TIw9GcuDKrWo
	iXlJeRd+lT58MOxx7nTo2nF3yMnI/lYQ2LrGauzuicr8qpZcioIKriQKa5YCvjNA
	2aT7pp0hCrXzQHQLqBcEN08q67fhL5A46kr2tJuuEl9XJ3l/tRe98/pmrxpDMY9z
	9DwOh9NpewiWzvVUR2fYZQmiNWV4rWfxsaT/OenOBnWJIOeNmN5UgoF2tdGgNf6Y
	Jsyk2leyPkRlE63y2WHlKJr2IVC7IQXgGK5pi0h/03Yf/uQwGkBIvOx/Yrg==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4epwnet6cg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 10 Jun 2026 11:15:40 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2bf32259e0eso87706685ad.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 10 Jun 2026 04:15:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781090140; x=1781694940; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PyGrPV2eIi/91dO4T8/qrr0Wh15rlxzflEwCOTwJI90=;
        b=cUP906BW9aJDoUZh+75n/fitJbcuplKAFjfdL15DdLDM/gHSNnMHnIkLuXSlzuw1uH
         buO04wJvQLQUhYwmrCObg1bT6Ao3IOZEVeScKGfvykryZQQX1G9i6CGSSs6o3NrpVJuJ
         I7WhZ5xGXH11M/Ke/GT4l8BRP9Q8PiTlooKqTivr9d1AhdKZ1+NAjcOVKIRvv/Qrl3ej
         yfX2gLsFRePcWB1h1Q6tNY/Tfhc6xHSsnKLv1meQjBHE6TPPoNUnX0op7Flw4fOebMlv
         uiq/gL0qpi+VgBYqkPV/SsGlnAC1kcS3sPITVcf/uHuWyPtLLshcLmfUvtyIb3zIMdRR
         HhmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781090140; x=1781694940;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=PyGrPV2eIi/91dO4T8/qrr0Wh15rlxzflEwCOTwJI90=;
        b=V61IPyk2Q0G/quUJpHyLDTkJysnoJ+pCiUjs5+1/Xm5vcrraUvsSLvOziMXBCEZ2a4
         XeRTW5+qxx8z84lWBnGcdxr1j3jt8BKCX9j7iMxcoXVW2Vv/dc93WtLysZ4TNM7Egy09
         iV7k1b19r1UGB4fz5FhnYh6Khbnl5swhXgLj9r4PTdVSgB9TrNb744DCR01iEMy7UUnc
         QxrV0v8JBWAc/Vb/bRn8FV2CE4wWIA8gUBnx5bfznkP05erAz0Q8PhlZZhQxXADR5UDP
         YGA39d+u1B5uVCd8tXreBUnde+sTi9KfkYpaRnnGBhME/gWz5nqLQ8QL5857dPerFR9p
         cUiA==
X-Forwarded-Encrypted: i=1; AFNElJ/2Bk7o7Hwls5RKdrjZrwrVVm9Bq9gTSOXvVuwPTP2tedbzd2vye+0e2nJYnSXHkHDfAFvT1flIDssGx2G5@vger.kernel.org
X-Gm-Message-State: AOJu0YwCYyPnWZFYYOn6J5KOODwoFeIDB7ABN+qEoU3jo6TQBZHh6Fcy
	RNuW95WzPIBho6tZaR9XP/ty8YTKkbnYECt8zvsZh1YaIy8MFEAulYBncqky6vNicsShC6JSemy
	oFeLo0vUvMK4Tb7OhDO8mBTU55/vNMILc7/EuBUJrK18YJgwtbWzsyBwUPTafZ+YBE0+J
X-Gm-Gg: Acq92OHJR+va8EbsdwPCLaEm1tFl5JI9OTkACGgoyFJ523WjiWi2/Y/M2eSdMMQvRfx
	JjaaymXbhlfOI+dtHaf5x4JGCbY2VB4quIs2vb3olj2P5G3EYkNV0BAr3e+tUCCmdQaDdnQETJV
	3777PvDV6ATZbDYbIBsU0p6lCCZD5hvz0R26lI28thBdP1wgxtAVC+LncSzzVRg4elh2vqDFuWb
	HDSuWjHRlrSGCI8BFD/ouW6ZY4DioZhobZAfbGAHapc0N71Uxi7002deuZof77x6669WkSrE22w
	rTs8keJ11ad7qVEV1UUu3YQv6mClb3cBbWL45bLkK3ofqhuneFkHhaTwMiM8Z6RoMQqeP/+JwK8
	Zs5R5C+/lrBYZw2fwQleTILHDydtfAJ7VLoT4tc2cuLqghCKu7mD5q8WxbkY=
X-Received: by 2002:a17:902:f711:b0:2c0:ab82:6ba7 with SMTP id d9443c01a7336-2c1e85ad8d7mr291812885ad.33.1781090139867;
        Wed, 10 Jun 2026 04:15:39 -0700 (PDT)
X-Received: by 2002:a17:902:f711:b0:2c0:ab82:6ba7 with SMTP id d9443c01a7336-2c1e85ad8d7mr291812495ad.33.1781090139428;
        Wed, 10 Jun 2026 04:15:39 -0700 (PDT)
Received: from hu-mchunara-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c164fa213asm256052545ad.35.2026.06.10.04.15.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Jun 2026 04:15:39 -0700 (PDT)
From: Monish Chunara <monish.chunara@oss.qualcomm.com>
X-Google-Original-From: Monish Chunara <mchunara@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: Nitin Rawat <nitin.rawat@oss.qualcomm.com>,
        Pradeep Pragallapati <pradeep.pragallapati@oss.qualcomm.com>,
        Komal Bajaj <komal.bajaj@oss.qualcomm.com>,
        Sachin <ssachin@qti.qualcomm.com>,
        Monish Chunara <monish.chunara@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH 4/4] arm64: dts: qcom: Enable SD card for Glymur CRD
Date: Wed, 10 Jun 2026 16:45:08 +0530
Message-Id: <20260610111508.3941207-5-mchunara@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260610111508.3941207-1-mchunara@oss.qualcomm.com>
References: <20260610111508.3941207-1-mchunara@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: e-trjZkzhxauir_8WHQWyLTX_pS5bqAu
X-Authority-Analysis: v=2.4 cv=ebYNubEH c=1 sm=1 tr=0 ts=6a29475c cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=EUspDBNiAAAA:8
 a=cZ9xF4wsGAkAwo1J854A:9 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-ORIG-GUID: e-trjZkzhxauir_8WHQWyLTX_pS5bqAu
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjEwMDEwNyBTYWx0ZWRfX7q39Dvf+rRCb
 DvhcgW5qzM3fz5VKjjZpXS1w+P+Q1ar1Y3YXyOLPOWgkOqBddihBjaS3zT2HCemJecZPycbXc1g
 3yPalO537q2XutDHXCdqoyvWzyFnG9mlM1tbuGf3fb494y4qHLDWT5aISZ9tjtK/StzjWIwpokr
 bOQRO+lqOEUp+NSWdrmpkBJxYBnXJ29UckYL5BbonJbP6dujLA95+KDpJr7KkJrThZzcCSTb+/a
 CJcQd2t1yHwt+gyX8S/ymq9gjNLqcO56nonwdd2oUR/fVyTLVnoZsKyTIlrG8VGxxheNTcwaX6h
 MxGPaNaTJ84nL8irHJjFU7onQ7tRtRSAgchu9geabPmtuKYh3zeDWhlfPTJBRETl1EOiOR5jnOB
 FiBS9om3FFKsE5cez7pGcDHMoYM6Y3hwhbvfRJbWn/7riwrRcVDuQ7aHkgZvRL3Md0xNYh/ZVxF
 v6djQaD3bwPUI4mGzJA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-10_02,2026-06-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 impostorscore=0 spamscore=0 bulkscore=0 clxscore=1015
 suspectscore=0 phishscore=0 adultscore=0 lowpriorityscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605210000
 definitions=main-2606100107
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	PRECEDENCE_BULK(0.00)[];
	TAGGED_FROM(0.00)[bounces-112416-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:nitin.rawat@oss.qualcomm.com,m:pradeep.pragallapati@oss.qualcomm.com,m:komal.bajaj@oss.qualcomm.com,m:ssachin@qti.qualcomm.com,m:monish.chunara@oss.qualcomm.com,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	FORGED_SENDER(0.00)[monish.chunara@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	FROM_NEQ_ENVFROM(0.00)[monish.chunara@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	ALIAS_RESOLVED(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,qualcomm.com:dkim,qualcomm.com:email,sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime];
	FORGED_SENDER_FORWARDING(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: CB019668BDC

From: Monish Chunara <monish.chunara@oss.qualcomm.com>

Enable SD card for Glymur CRD platform. Configure the vmmc/vqmmc
regulators and gpio-based card detection for the platform.

Co-developed-by: Sachin <ssachin@qti.qualcomm.com>
Signed-off-by: Sachin <ssachin@qti.qualcomm.com>
Signed-off-by: Monish Chunara <monish.chunara@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/glymur-crd.dts | 25 +++++++++++++++++++++++++
 1 file changed, 25 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/glymur-crd.dts b/arch/arm64/boot/dts/qcom/glymur-crd.dts
index c98dfb3941fa..f68d27429440 100644
--- a/arch/arm64/boot/dts/qcom/glymur-crd.dts
+++ b/arch/arm64/boot/dts/qcom/glymur-crd.dts
@@ -427,3 +427,28 @@ &usb_mp_qmpphy1 {
 
 	status = "okay";
 };
+
+&sdhc_2 {
+	vmmc-supply = <&vreg_l9b_e0_2p9>;
+	vqmmc-supply = <&vreg_l2b_e0_2p9>;
+
+	pinctrl-0 = <&sdc2_default_state &sdc2_card_det_n>;
+	pinctrl-1 = <&sdc2_sleep_state &sdc2_card_det_n>;
+	pinctrl-names = "default", "sleep";
+
+	cd-gpios = <&tlmm 221 GPIO_ACTIVE_LOW>;
+
+	no-mmc;
+	no-sdio;
+
+	status = "okay";
+};
+
+&tlmm {
+	sdc2_card_det_n: sd-card-det-n-state {
+		pins = "gpio221";
+		function = "gpio";
+		drive-strength = <2>;
+		bias-disable;
+	};
+};
-- 
2.34.1


