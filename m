Return-Path: <linux-arm-msm+bounces-109535-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gK+oDsVWE2pi+wYAu9opvQ
	(envelope-from <linux-arm-msm+bounces-109535-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sun, 24 May 2026 21:51:33 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id E77C45C3ED9
	for <lists+linux-arm-msm@lfdr.de>; Sun, 24 May 2026 21:51:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 4765E300AC94
	for <lists+linux-arm-msm@lfdr.de>; Sun, 24 May 2026 19:51:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 83B823382F9;
	Sun, 24 May 2026 19:50:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="YUJsQEJW";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="C404NPY4"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12BEC332615
	for <linux-arm-msm@vger.kernel.org>; Sun, 24 May 2026 19:50:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779652246; cv=none; b=V5PL+xNIcgb47RDlhEydAfUfC4sXYwoNPZRIgjFVcUQEMYub1/XdUtfxjSmZKTDq/oATvjdgj+7RfQP4Rf8KKq52lYuMNXZ+TiuB4zxmZSQCni9jjnjiJJzIs+e0PqYfQ3zoBV072D8NrVFJRNQ0YP2bj16OyiY4GhIexfPO6/E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779652246; c=relaxed/simple;
	bh=myXGbohZc8eS25QokdStbNan6AbEa0EEYXTBb4ty0eI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=HzX7tMSsqOF1h5he4nTA0ulY+lqGoDvTyVPDPQ0/64MvZQM7z+m+xyH481G6NNhYvCj9nEVO/0vRkbn1GdRpJ5/MG5Hbb3czDvJ5eeMHc6rLnnp1C8hXZBq7VfSLWxH960c8ct7NG/jROdyyn/x/cKsFj3MwbgEj1Ryje78F7Uc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=YUJsQEJW; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=C404NPY4; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64NMo60G3079108
	for <linux-arm-msm@vger.kernel.org>; Sun, 24 May 2026 19:50:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	HOFM+2dGVt9R7ANGb/sbfRd2LQ9qIrMEUWcvtpHzlQw=; b=YUJsQEJWZ2AqUZAA
	R6XhWPTPq4klgrnlVW/3DMZ8wt1EJB/6dCTw0x4CwH03o7lt0z+Hm0MYHdNcjZAr
	Dvf2d+hCx64jc/z4cFjfUXs/SF91Andd4fhoYBn+UJ32d/a6rqfZk4qGPlxddlZk
	hlQf2M8qpS6zD4azNSJ/yAS6GT0SFGHswxb8Trd6fvYiaCXH4T5SLTJWjdLUUOqd
	v4c6s4TwfhsYJdGngVn33YJrjJPdNgKmN0NFgIAQR4wRS2iez6v11mkNZJpiEHD9
	LvqPDbf7UFdRPzgzQbPCrlOf3p7kYr15ST28qKrBzYy+1roHh+nGMsa7eEjlAMYL
	Daf+dw==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eb88w3d8c-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sun, 24 May 2026 19:50:44 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-3692f395339so9037332a91.1
        for <linux-arm-msm@vger.kernel.org>; Sun, 24 May 2026 12:50:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779652243; x=1780257043; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HOFM+2dGVt9R7ANGb/sbfRd2LQ9qIrMEUWcvtpHzlQw=;
        b=C404NPY42RWYYmi+uuls/ZjXm5Vez02bXSrK50+hoALhVtM+MnqDXSMrB2vbfDvGHn
         X6y/ZNIzwJ/eo1iBwVXiL6ZkBJLNK2TM7Pu70bjESvnlRol4SH2Mwdp33TJ+fmTqOYDh
         9uKKGAqEp5PEWPVAuLxtEKWhgMw/svY6xidD3JNW06q9p3sE+ZfhZS584ZqYhlEtUcMi
         AM0fIYrCySYb0TPTyqMVzOIixmq/i+YKKDKD9RlBCXoPXEOuqy/fewCtQ0CSQhHApZYh
         lpz68o2gB7kBjB/5TCF+LRMJKvAk5d0KNb9CBEhvaqzFyceNJ3Krd08TtMoq4Q2JnZAU
         mZbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779652243; x=1780257043;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=HOFM+2dGVt9R7ANGb/sbfRd2LQ9qIrMEUWcvtpHzlQw=;
        b=CfE9qcRm3azeTVar5uOJOUhOB5101W4gXliEMkarp31hgFeAa6GXrg/1tctvy7AiJ7
         UvjZhPP9A0a1f3Ic4Qn4/x8OskdPpbSgC1jctc4W6tdfbfulb9f0N13Hjm3jTOoOZF0y
         Efo91CBF20AFnqmvkF9rG0WDIhFYer4rlIFsy8Tvm008tO/R7CCEZeTSKKOn9DtoA3sI
         uBw9piguVzJv3e9jREJ6kOOIwj1PcgDgm+jcLnABvCO39F4SAi8RpFwi035HWLGuiDtc
         0aBMf/2vAbWTyiIaCyhiHLBsOkPelMvdxqp4t9onaSb3fctWenr6jsj5/oC07vMLNgd0
         IqwA==
X-Gm-Message-State: AOJu0YwrdESRRt9onXzldsYqi3CLSG2dLyVBrrWtP8exa8+m3gnMk2ES
	lB9kMjwTo5k5Yo4oK4EWWmUdXFrUA6klgITTua01dIHWTLOTc0vFy/JeiiyXU6KYA/aG9UjMLXo
	pk6NzW+D9IS85KnSoyYcPbwPTShWNzZLWtIuUzQgddq6Y+w3GH5vKCqw8ds12jNlgJ7QU
X-Gm-Gg: Acq92OH9da1OwxRwRS1ZuQ2x9NG9QDfYOgArp+FIT1swv9wcXTOb/Gue9sNuQMX4qCM
	D1fuiri1JipsHuw8R2VZZJdfVMEKRV4QMI4J//xPYuB9w+ja8mp7w/09lSIgLHkrEoEFCi/oVOj
	KLk+diM/8F/6aewppy/WDhjh8V36XgLVuX4LtP2Y2XB6OpEdhvoOiG3bYeVqRubDKZUjoHHD+Ur
	l0WxFIud0ZvmMYuSDVioFQ/ELEQ1MIPGfEqtSYKNNuZjb7aK/lVPl1iOIFdKoEb36NQUeRcHRni
	I9YfKrcatZIDIZlqpo5vqkAHVPXBhYtiN5izK+69PuwahfiX6iOYX1SX8E8lt5tmPDhJ/VMVW7i
	zYIZ6fC4gGQZjQQhc+WcoCN0TinuTp6SVl7xVEUQMrvVZd3o=
X-Received: by 2002:a17:90b:3f4f:b0:366:132:fda3 with SMTP id 98e67ed59e1d1-36a67475eddmr11595870a91.11.1779652243381;
        Sun, 24 May 2026 12:50:43 -0700 (PDT)
X-Received: by 2002:a17:90b:3f4f:b0:366:132:fda3 with SMTP id 98e67ed59e1d1-36a67475eddmr11595838a91.11.1779652242807;
        Sun, 24 May 2026 12:50:42 -0700 (PDT)
Received: from [10.213.101.118] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-36a6c21d4a2sm4725849a91.1.2026.05.24.12.50.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 24 May 2026 12:50:42 -0700 (PDT)
From: Komal Bajaj <komal.bajaj@oss.qualcomm.com>
Date: Mon, 25 May 2026 01:19:18 +0530
Subject: [PATCH 14/16] arm64: dts: qcom: shikra: Enable BT support on EVK
 boards
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260525-shikra-dt-m1-v1-14-f51a9838dbaa@oss.qualcomm.com>
References: <20260525-shikra-dt-m1-v1-0-f51a9838dbaa@oss.qualcomm.com>
In-Reply-To: <20260525-shikra-dt-m1-v1-0-f51a9838dbaa@oss.qualcomm.com>
To: Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Georgi Djakov <djakov@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dmaengine@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-pm@vger.kernel.org, Komal Bajaj <komal.bajaj@oss.qualcomm.com>,
        Yepuri Siddu <ysiddu@qti.qualcomm.com>,
        Yepuri Siddu <yepuri.siddu@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1779652157; l=3298;
 i=komal.bajaj@oss.qualcomm.com; s=20250710; h=from:subject:message-id;
 bh=6YTvlWrfOM9Uj7YIFxrI0dRea/7p3Vn/P2SEf4jl6Jc=;
 b=SXx+h3+DeUTd/cTjF5htX+HJ1y7t/RGA5O1q7a2cEmM+1xksj86jubrl+UsbvoPjQZZD3hd+m
 iFXBLLVFAqtAkBnzEuhU7mJYXT4CSSsh+opIugMRizh16ovhdizEU6U
X-Developer-Key: i=komal.bajaj@oss.qualcomm.com; a=ed25519;
 pk=wKh8mgDh+ePUZ4IIvpBhQOqf16/KvuQHvSvHK20LXNU=
X-Authority-Analysis: v=2.4 cv=S/jpBosP c=1 sm=1 tr=0 ts=6a135694 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=OP1gjdvSne2naBZ_9ZYA:9 a=QEXdDO2ut3YA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTI0MDE5OCBTYWx0ZWRfX1L/qhyNdNCIf
 BCCehX7zuo9ontqv9UcU1RV+tR0wapggYsqlsQe41iKlU6ycxQh6ZsWLsp+U2GhdOHVgSoXR6Zn
 ntKjwdaDTkVt90BuZC596KFN8VNezsliuPQX67YWAHYg4sSv2J1b0fWjtkYPamdaazl1FzKqx5K
 XCyQ/RyTJWDvp+KCqTVvtRa7FMe1b+GHXWOEb8Zj5W+zAItP+sRjdfJZIdBkKVfQcG0rVkx8ldc
 QzbG/+jeBW/D8yMT2OsYjRy898NFdAkJAd19/tRHYj4pdI2PgMgVG82VLcTlTNdKYWsDQEhYelz
 vyV/CV9YGqcpQv7s5bT+7LCYP9G7MJ5RKHHohpPPGUQBy2kJ3gfFPQNjbCn18xv7PK1zZUyUIeK
 5j6IxGpLPSUCOEG0AmbWy2XDjDt8WAsSggaTWXolApPeMh7W7yESOIpPalg+WgTBetEl4L5XuNi
 85+7RMV+1iGBEQB2lkw==
X-Proofpoint-ORIG-GUID: gClO54TAS9jgb-HMaKwbcqbckaINx0wQ
X-Proofpoint-GUID: gClO54TAS9jgb-HMaKwbcqbckaINx0wQ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-24_06,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 lowpriorityscore=0 malwarescore=0 clxscore=1015
 priorityscore=1501 impostorscore=0 adultscore=0 phishscore=0 spamscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2605130000
 definitions=main-2605240198
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[17];
	TAGGED_FROM(0.00)[bounces-109535-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,qualcomm.com:email,qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[komal.bajaj@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: E77C45C3ED9
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Yepuri Siddu <ysiddu@qti.qualcomm.com>

Enable uart8 and add WCN3988 Bluetooth node with board-specific regulator
supplies across CQM, CQS and IQS Shikra EVK boards.

Signed-off-by: Yepuri Siddu <yepuri.siddu@oss.qualcomm.com>
Signed-off-by: Komal Bajaj <komal.bajaj@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/shikra-cqm-evk.dts | 12 ++++++++++++
 arch/arm64/boot/dts/qcom/shikra-cqs-evk.dts | 12 ++++++++++++
 arch/arm64/boot/dts/qcom/shikra-iqs-evk.dts | 20 ++++++++++++++++++++
 arch/arm64/boot/dts/qcom/shikra.dtsi        |  7 +++++++
 4 files changed, 51 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/shikra-cqm-evk.dts b/arch/arm64/boot/dts/qcom/shikra-cqm-evk.dts
index b112b21b1d79..259032bd20af 100644
--- a/arch/arm64/boot/dts/qcom/shikra-cqm-evk.dts
+++ b/arch/arm64/boot/dts/qcom/shikra-cqm-evk.dts
@@ -16,6 +16,7 @@ / {
 	aliases {
 		mmc0 = &sdhc_1;
 		serial0 = &uart0;
+		serial1 = &uart8;
 	};
 
 	chosen {
@@ -57,3 +58,14 @@ &sdhc_1 {
 
 	status = "okay";
 };
+
+&uart8 {
+	status = "okay";
+
+	bluetooth {
+		vddio-supply = <&pm4125_l7>;
+		vddxo-supply = <&pm4125_l13>;
+		vddrf-supply = <&pm4125_l10>;
+		vddch0-supply = <&pm4125_l22>;
+	};
+};
diff --git a/arch/arm64/boot/dts/qcom/shikra-cqs-evk.dts b/arch/arm64/boot/dts/qcom/shikra-cqs-evk.dts
index e62ba5aef71f..142cc8da53ce 100644
--- a/arch/arm64/boot/dts/qcom/shikra-cqs-evk.dts
+++ b/arch/arm64/boot/dts/qcom/shikra-cqs-evk.dts
@@ -16,6 +16,7 @@ / {
 	aliases {
 		mmc0 = &sdhc_1;
 		serial0 = &uart0;
+		serial1 = &uart8;
 	};
 
 	chosen {
@@ -57,3 +58,14 @@ &sdhc_1 {
 
 	status = "okay";
 };
+
+&uart8 {
+	status = "okay";
+
+	bluetooth {
+		vddio-supply = <&pm4125_l7>;
+		vddxo-supply = <&pm4125_l13>;
+		vddrf-supply = <&pm4125_l10>;
+		vddch0-supply = <&pm4125_l22>;
+	};
+};
diff --git a/arch/arm64/boot/dts/qcom/shikra-iqs-evk.dts b/arch/arm64/boot/dts/qcom/shikra-iqs-evk.dts
index 727809430fd1..9bf52030bcc5 100644
--- a/arch/arm64/boot/dts/qcom/shikra-iqs-evk.dts
+++ b/arch/arm64/boot/dts/qcom/shikra-iqs-evk.dts
@@ -16,11 +16,20 @@ / {
 	aliases {
 		mmc0 = &sdhc_1;
 		serial0 = &uart0;
+		serial1 = &uart8;
 	};
 
 	chosen {
 		stdout-path = "serial0:115200n8";
 	};
+
+	vreg_bt_3p3_dummy: regulator-bt-3p3-dummy {
+		compatible = "regulator-fixed";
+		regulator-name = "bt_3p3_dummy";
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+		regulator-always-on;
+	};
 };
 
 &remoteproc_cdsp {
@@ -57,3 +66,14 @@ &sdhc_1 {
 
 	status = "okay";
 };
+
+&uart8 {
+	status = "okay";
+
+	bluetooth {
+		vddio-supply = <&pm8150_s4>;
+		vddxo-supply = <&pm8150_l12>;
+		vddrf-supply = <&pm8150_l8>;
+		vddch0-supply = <&vreg_bt_3p3_dummy>;
+	};
+};
diff --git a/arch/arm64/boot/dts/qcom/shikra.dtsi b/arch/arm64/boot/dts/qcom/shikra.dtsi
index 124d0f05538d..73681bf0e3ea 100644
--- a/arch/arm64/boot/dts/qcom/shikra.dtsi
+++ b/arch/arm64/boot/dts/qcom/shikra.dtsi
@@ -1753,6 +1753,13 @@ &clk_virt SLAVE_QUP_CORE_0 RPM_ALWAYS_TAG>,
 				pinctrl-names = "default";
 
 				status = "disabled";
+
+				bluetooth {
+					compatible = "qcom,wcn3988-bt";
+					enable-gpios = <&tlmm 88 GPIO_ACTIVE_HIGH>;
+					max-speed = <3200000>;
+				};
+
 			};
 
 			i2c9: i2c@4aa4000 {

-- 
2.34.1


