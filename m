Return-Path: <linux-arm-msm+bounces-91871-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UKDLL2tehGnS2gMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-91871-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 05 Feb 2026 10:10:03 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 2250EF059D
	for <lists+linux-arm-msm@lfdr.de>; Thu, 05 Feb 2026 10:10:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 6F40C305B08E
	for <lists+linux-arm-msm@lfdr.de>; Thu,  5 Feb 2026 09:02:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9E16F39A7EF;
	Thu,  5 Feb 2026 08:59:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="e1c1P8Ym";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="R41NAm/H"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A9F138F94B
	for <linux-arm-msm@vger.kernel.org>; Thu,  5 Feb 2026 08:59:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770281992; cv=none; b=iPDgCJUKqHp1WZfD39PvIs3Pr81tkO3rfki27kUIbqOngSODU79mjMrS2o6TcYUYOF2H/XDXlw4L7RqUqX9o/qtZM41P1deqpnn/DvE3hvod6CkEwZd3QbztCUzBVLXLA1F+vKBAYXZwOighWMZ7Fc0SLhtQXRs1cCqgxtf+xEc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770281992; c=relaxed/simple;
	bh=LvwaXqsi+CGXRLv/jrULMfrEq2H2ZTLomPFgmnp1re0=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=Kc6Q2xCYhj9NiCywCNMkib2cd0Q8LiFnOQtA6gjH/Rzj8r9COJQIrnJrGuSM5+Hz0bv8Akgv2IHatYyeskjI3tPSRFKymiTjJ5C1fu2m4bSxItdF3BrX4NMy2WhoJ4m2k31K/DjarnTp6EAjW8meybQUGdpn1GsFMdgCcfyqM5Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=e1c1P8Ym; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=R41NAm/H; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6157MrY6890582
	for <linux-arm-msm@vger.kernel.org>; Thu, 5 Feb 2026 08:59:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=C4nJZIEag1u
	yaDhBuxtETW0kqamrp42BiH+hXZXLzF8=; b=e1c1P8YmfxMm86FMVXOs6Xk8PhU
	CLvSAFpPH1zFmvfhb8bSQzfp+aNEzyFsvF3T5tqTD+pkOT6KyKlx5FnsWFqH6dhC
	FiLckWy3b98xzRCRXpwOYJQ/seBRn4tlUcs+m+RPx4W5yTvYEaQrNjyX11guMZDV
	aXaAeW6lXBQamE0dXiNzMRNHb79H5sBNWnAdYSqDFL8fm9Nn9oFdSQkxaLFiyDzv
	k4v3g/ogiIF2iBA8c4soJWu8Meb9B6uHKCrBWplqfMml8qxkMuVykGSBBzlGCdA1
	9xhoSL+jQlX6lvT5AxSvIrx3WhGqdxyBuknMBl4sB3/SoLY8sVju4TulAKw==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c4prx89d7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 05 Feb 2026 08:59:51 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-34ab8693a2cso1734220a91.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 05 Feb 2026 00:59:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1770281991; x=1770886791; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=C4nJZIEag1uyaDhBuxtETW0kqamrp42BiH+hXZXLzF8=;
        b=R41NAm/HYYSFRgYa/7/RHKNO4OhIGuHmcR8kQJ/DPcGDjOcphbDgeDXUMMKGkikT/8
         8rO42ttXkz0AcRObIJ5sk3TImrBM5SOVBy3NZOO55+ICGa/1DrNI+BGsExhlGQpTtWJi
         adTBejzCGqz0kEedfgE5gPAnAg9og0Vu/4cn5M1isIY3yHQa6d/ug0USfecxtyAlQivO
         KqbJphFd+e/te3sN4VTxvaM/7//6SqVsjav56rnhFnrOlYcJAyBWogJgaY+QcbfOZXTu
         Nn/0bd3npCJFBersR3g4XXztxE/2x2vKxvb0fSZNNzIW5YQ9U/iLi45zzokS/2ZSZdyY
         DCcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770281991; x=1770886791;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=C4nJZIEag1uyaDhBuxtETW0kqamrp42BiH+hXZXLzF8=;
        b=qXA+XCQU6/uL93eYZqxjsPowSiO8UlG9zqpKASmcP96rtYrW2/jz2okue+t5LF0dPM
         7d0OtHAwx4+t1yJh10HPTC3WHbFBDR495DyF4RDlX+VBfJ3OpE6mxYZKp1uSr1ahFdPX
         yYeuLD+pbzLoXtrwFL+70NvoFN228NB0d6C3wcJBPu//rIgU2dVWdp3oQBJFCA1X5+St
         8aecgvV9XaEEg8JB79YmDhJ2xdlPDkiwWTDrt5XbF3xFbsSD3qZ1q/0fipFYmBmr2+1/
         AG6wpCdFOWYpkhx5KLl709pEAuXPACSFA7mRJukKQ9QB+N9R5OMVFLXqtwEnwHqEbxGY
         FI3w==
X-Forwarded-Encrypted: i=1; AJvYcCXt9wS/tPEklD/w8iWnZNd566kwLOlua+rq192audDDFScHXvXL1WSyJAEqS9k4b1VKkv9XOc/ZixD74Zj6@vger.kernel.org
X-Gm-Message-State: AOJu0YyESAjJeCzAA05x+bCqOWJ2izlZThSLco6e3Yv6OqadMfv1VWcY
	va4zKHxiZ50u/en2o/sfPHSe8XeGNav4rFG9V4VH8llyaF0/og8ADXcx8wdJqVqvwQg6CYROrAX
	34wKN1HQcWV8fAlt+qFTjwWP/hxSteddQAW4vTbjQo/yv0XfOf3S1gm+sUsUqgB3Mch9r
X-Gm-Gg: AZuq6aIeBVD53LP0Ls7+cyntFqtXRs5e94kNA1OAywQV0whYiJGRKT0VBI9zKlB+jlY
	4uk1nmtSZpWg85EzO8NJi44O/I+SnKgs6MU+wexcHSTNGdazXmuffouIzXJHh6elsaYgfCPHNZk
	i//CCO4Nn+/4BQW8tFPrhkBwxu4RQnW/vkIYs4TR5UC9waEKdzsB3JJG6hT83Z3LUOOJXoce03R
	q4Fjr/p93Sb6TSYXqNUs2SIVLsTyw1f1ifoMTnCA1i6+XbtG99t/ZeZqPkf62Pe5fn/5QoR15AE
	OmaGmQG9mHFUyIcTS9RvE9I2Zd8+wntkjV/6L/66ap1KmSWeeArBmp2o3zYxJFsMxakEg4zV33x
	LVdlHLWPqavP09ZlcRRtrg1gyjFlc52t9G5jxeeeQ8liaX3cbGuZz/nVSgL58MCnaVe95AjXYwO
	AyrKWK08KgQ6rPARdqIJV5OcLDqg+teDQDgFpWvrk=
X-Received: by 2002:a17:90b:3c49:b0:353:356c:6840 with SMTP id 98e67ed59e1d1-354870e76abmr4646264a91.14.1770281990974;
        Thu, 05 Feb 2026 00:59:50 -0800 (PST)
X-Received: by 2002:a17:90b:3c49:b0:353:356c:6840 with SMTP id 98e67ed59e1d1-354870e76abmr4646246a91.14.1770281990455;
        Thu, 05 Feb 2026 00:59:50 -0800 (PST)
Received: from hu-varada-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c6c8572b4e7sm4361984a12.33.2026.02.05.00.59.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Feb 2026 00:59:50 -0800 (PST)
From: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
To: andersson@kernel.org, konradybcio@kernel.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: sumit.garg@oss.qualcomm.com, dmitry.baryshkov@oss.qualcomm.com,
        Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: [PATCH v5 1/4] arm64: dts: qcom: ipq9574: Add details for eMMC
Date: Thu,  5 Feb 2026 14:29:33 +0530
Message-Id: <20260205085936.3220108-2-varadarajan.narayanan@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260205085936.3220108-1-varadarajan.narayanan@oss.qualcomm.com>
References: <20260205085936.3220108-1-varadarajan.narayanan@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: 1nhrkwGJQ79GPUpLJEe595RosJxorG6z
X-Proofpoint-ORIG-GUID: 1nhrkwGJQ79GPUpLJEe595RosJxorG6z
X-Authority-Analysis: v=2.4 cv=eLkeTXp1 c=1 sm=1 tr=0 ts=69845c07 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=DDd1rAVsgBFtUBlyKmEA:9 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjA1MDA2NCBTYWx0ZWRfX2aH1LzANLpBH
 HKd7XakJU2J0NPFUAQwWIyYlEla2yL7iHxCGLRc7m5iMyS3oGdzmhyBXQZgceYiMj4npHPcyLA7
 voiMUA5HgPLxsHojSFd0Pfpa4mQHzMJzBaLpQfsYc63Koh4xOFNTb1czcJANeP4DhieRe2xpg0L
 kRuy7VN491L4EDZ2XimNerE8fMfbDhUmIBetT16DCb4sszsJP43tLYOelSaYRWunCnrQg4l9HEc
 Cl/1bCUmF3jHk6dmjMG1m+r6Ck2lvYOVDvbcx7IXX13MBUgqbAeJ7r8ObuJjB51+EHKScdqamPD
 WWyR2xLAOk1TZ3NPQdSh/gSR1htBmj3ndsg2DcWFJtW3LgD0eog8UcpGEQ0hIN3npmzL+yN4RRS
 3xIJQZnqyGBRPO69kENV7yyeQPmuoTPFh2NVyX5zGOZKKu7vK46NktYbEVcUcc/LO26nTQqpT32
 VNlY4SX2/lEovF9nT5g==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-05_01,2026-02-05_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 clxscore=1015 bulkscore=0 suspectscore=0 adultscore=0
 priorityscore=1501 spamscore=0 malwarescore=0 phishscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602050064
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[12];
	TAGGED_FROM(0.00)[bounces-91871-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[varadarajan.narayanan@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	NEURAL_HAM(-0.00)[-0.999];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 2250EF059D
X-Rspamd-Action: no action

RDP433 and RDP418 has NAND and eMMC variants. Presently, only NAND
variant is supported. To enable support for eMMC variant, add the
relevant GPIO and regulator information.

Do not enable NAND or eMMC by default in ipq9574-rdp-common.dtsi. Enable
it in board specific DTS as applicable.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
---
v5: Cleanup the enable/disable of NAND/eMMC between the common and
    board specific DT files.
    Add regulator info
    Remove sdhc info duplication in RDP418 dts
v4: Move sdhc properties from emmc dts to SoC dtsi

v3: Disable nand in ipq9574-rdp-common.dtsi and enable it where required.
    Add 'Reviewed-by: Konrad Dybcio'
---
 .../boot/dts/qcom/ipq9574-rdp-common.dtsi     | 48 ++++++++++++++++++-
 arch/arm64/boot/dts/qcom/ipq9574-rdp418.dts   | 44 +----------------
 arch/arm64/boot/dts/qcom/ipq9574-rdp433.dts   |  4 ++
 arch/arm64/boot/dts/qcom/ipq9574-rdp449.dts   |  4 ++
 arch/arm64/boot/dts/qcom/ipq9574-rdp453.dts   |  4 ++
 arch/arm64/boot/dts/qcom/ipq9574-rdp454.dts   |  4 ++
 arch/arm64/boot/dts/qcom/ipq9574.dtsi         |  9 ++++
 7 files changed, 72 insertions(+), 45 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/ipq9574-rdp-common.dtsi b/arch/arm64/boot/dts/qcom/ipq9574-rdp-common.dtsi
index bdb396afb992..6b53fb344cf6 100644
--- a/arch/arm64/boot/dts/qcom/ipq9574-rdp-common.dtsi
+++ b/arch/arm64/boot/dts/qcom/ipq9574-rdp-common.dtsi
@@ -22,6 +22,15 @@ chosen {
 		stdout-path = "serial0:115200n8";
 	};
 
+	regulator_fixed_1p8: s1800 {
+		compatible = "regulator-fixed";
+		regulator-min-microvolt = <1800000>;
+		regulator-max-microvolt = <1800000>;
+		regulator-boot-on;
+		regulator-always-on;
+		regulator-name = "fixed_1p8";
+	};
+
 	regulator_fixed_3p3: s3300 {
 		compatible = "regulator-fixed";
 		regulator-min-microvolt = <3300000>;
@@ -121,6 +130,11 @@ mp5496_l5: l5 {
 	};
 };
 
+&sdhc_1 {
+	vmmc-supply = <&regulator_fixed_3p3>;
+	vqmmc-supply = <&regulator_fixed_1p8>;
+};
+
 &sleep_clk {
 	clock-frequency = <32000>;
 };
@@ -169,6 +183,38 @@ data-pins {
 			bias-disable;
 		};
 	};
+
+	sdc_default_state: sdc-default-state {
+		clk-pins {
+			pins = "gpio5";
+			function = "sdc_clk";
+			drive-strength = <8>;
+			bias-disable;
+		};
+
+		cmd-pins {
+			pins = "gpio4";
+			function = "sdc_cmd";
+			drive-strength = <8>;
+			bias-pull-up;
+		};
+
+		data-pins {
+			pins = "gpio0", "gpio1", "gpio2",
+			       "gpio3", "gpio6", "gpio7",
+			       "gpio8", "gpio9";
+			function = "sdc_data";
+			drive-strength = <8>;
+			bias-pull-up;
+		};
+
+		rclk-pins {
+			pins = "gpio10";
+			function = "sdc_rclk";
+			drive-strength = <8>;
+			bias-pull-down;
+		};
+	};
 };
 
 &qpic_bam {
@@ -179,8 +225,6 @@ &qpic_nand {
 	pinctrl-0 = <&qpic_snand_default_state>;
 	pinctrl-names = "default";
 
-	status = "okay";
-
 	flash@0 {
 		compatible = "spi-nand";
 		reg = <0>;
diff --git a/arch/arm64/boot/dts/qcom/ipq9574-rdp418.dts b/arch/arm64/boot/dts/qcom/ipq9574-rdp418.dts
index f4f9199d4ab1..23d4cba7c6b6 100644
--- a/arch/arm64/boot/dts/qcom/ipq9574-rdp418.dts
+++ b/arch/arm64/boot/dts/qcom/ipq9574-rdp418.dts
@@ -16,48 +16,6 @@ / {
 
 };
 
-&sdhc_1 {
-	pinctrl-0 = <&sdc_default_state>;
-	pinctrl-names = "default";
-	mmc-ddr-1_8v;
-	mmc-hs200-1_8v;
-	mmc-hs400-1_8v;
-	mmc-hs400-enhanced-strobe;
-	max-frequency = <384000000>;
-	bus-width = <8>;
+&qpic_nand {
 	status = "okay";
 };
-
-&tlmm {
-	sdc_default_state: sdc-default-state {
-		clk-pins {
-			pins = "gpio5";
-			function = "sdc_clk";
-			drive-strength = <8>;
-			bias-disable;
-		};
-
-		cmd-pins {
-			pins = "gpio4";
-			function = "sdc_cmd";
-			drive-strength = <8>;
-			bias-pull-up;
-		};
-
-		data-pins {
-			pins = "gpio0", "gpio1", "gpio2",
-			       "gpio3", "gpio6", "gpio7",
-			       "gpio8", "gpio9";
-			function = "sdc_data";
-			drive-strength = <8>;
-			bias-pull-up;
-		};
-
-		rclk-pins {
-			pins = "gpio10";
-			function = "sdc_rclk";
-			drive-strength = <8>;
-			bias-pull-down;
-		};
-	};
-};
diff --git a/arch/arm64/boot/dts/qcom/ipq9574-rdp433.dts b/arch/arm64/boot/dts/qcom/ipq9574-rdp433.dts
index 5a546a14998b..73091067bad2 100644
--- a/arch/arm64/boot/dts/qcom/ipq9574-rdp433.dts
+++ b/arch/arm64/boot/dts/qcom/ipq9574-rdp433.dts
@@ -55,6 +55,10 @@ &pcie3 {
 	status = "okay";
 };
 
+&qpic_nand {
+	status = "okay";
+};
+
 &tlmm {
 
 	pcie1_default: pcie1-default-state {
diff --git a/arch/arm64/boot/dts/qcom/ipq9574-rdp449.dts b/arch/arm64/boot/dts/qcom/ipq9574-rdp449.dts
index d36d1078763e..cbc9047cfe92 100644
--- a/arch/arm64/boot/dts/qcom/ipq9574-rdp449.dts
+++ b/arch/arm64/boot/dts/qcom/ipq9574-rdp449.dts
@@ -15,3 +15,7 @@ / {
 	compatible = "qcom,ipq9574-ap-al02-c6", "qcom,ipq9574";
 
 };
+
+&qpic_nand {
+	status = "okay";
+};
diff --git a/arch/arm64/boot/dts/qcom/ipq9574-rdp453.dts b/arch/arm64/boot/dts/qcom/ipq9574-rdp453.dts
index c30c9fbedf26..d233ec530cc3 100644
--- a/arch/arm64/boot/dts/qcom/ipq9574-rdp453.dts
+++ b/arch/arm64/boot/dts/qcom/ipq9574-rdp453.dts
@@ -15,3 +15,7 @@ / {
 	compatible = "qcom,ipq9574-ap-al02-c8", "qcom,ipq9574";
 
 };
+
+&qpic_nand {
+	status = "okay";
+};
diff --git a/arch/arm64/boot/dts/qcom/ipq9574-rdp454.dts b/arch/arm64/boot/dts/qcom/ipq9574-rdp454.dts
index 0dc382f5d5ec..f2334b9e0ed4 100644
--- a/arch/arm64/boot/dts/qcom/ipq9574-rdp454.dts
+++ b/arch/arm64/boot/dts/qcom/ipq9574-rdp454.dts
@@ -14,3 +14,7 @@ / {
 	model = "Qualcomm Technologies, Inc. IPQ9574/AP-AL02-C9";
 	compatible = "qcom,ipq9574-ap-al02-c9", "qcom,ipq9574";
 };
+
+&qpic_nand {
+	status = "okay";
+};
diff --git a/arch/arm64/boot/dts/qcom/ipq9574.dtsi b/arch/arm64/boot/dts/qcom/ipq9574.dtsi
index 86c9cb9fffc9..4b8c58982869 100644
--- a/arch/arm64/boot/dts/qcom/ipq9574.dtsi
+++ b/arch/arm64/boot/dts/qcom/ipq9574.dtsi
@@ -467,6 +467,15 @@ sdhc_1: mmc@7804000 {
 			clock-names = "iface", "core", "xo", "ice";
 			non-removable;
 			supports-cqe;
+			pinctrl-0 = <&sdc_default_state>;
+			pinctrl-names = "default";
+			mmc-ddr-1_8v;
+			mmc-hs200-1_8v;
+			mmc-hs400-1_8v;
+			mmc-hs400-enhanced-strobe;
+			max-frequency = <384000000>;
+			bus-width = <8>;
+
 			status = "disabled";
 		};
 
-- 
2.34.1


