Return-Path: <linux-arm-msm+bounces-90177-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UBmHChUGcmmvZwAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-90177-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 22 Jan 2026 12:12:21 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id C2C1465C6B
	for <lists+linux-arm-msm@lfdr.de>; Thu, 22 Jan 2026 12:12:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 5B28D6C73D0
	for <lists+linux-arm-msm@lfdr.de>; Thu, 22 Jan 2026 10:52:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3C1CA42B754;
	Thu, 22 Jan 2026 10:50:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Zv2rITlz";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="b8e3ygF2"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4B7142B72E
	for <linux-arm-msm@vger.kernel.org>; Thu, 22 Jan 2026 10:50:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769079007; cv=none; b=LWRkkvvMYwXO8VdDtPEGJrDN4qW/Kw+Yqm9lMoQJwdV/tTtREIj/0NzW1ESuPYkKea1PfddHUZ4oO9B8IDnwInh5J0wch5RWDfzdkdlXpcGZX8qJx1vMrDjEzbKked8R3EJdMvr5ZzYVSMOCtiKF1ZUgyvzR/HQj9ibhqt65PDs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769079007; c=relaxed/simple;
	bh=2WG5aoisKJwerkvnpytr8xGIA19LajXbCLZsav5MoQ0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=dZIFvgh4vxCPax0tFJaMiiH5e/3pcFKrYySSji+Lja69C/PlRginQCmbSI+ZdSQDBjcRkYGWoBAhu89AcoBqQzjgXFaKN0kGHm9IXy3KrXOAA48qrvzBhQvodtpLGmCLpH7Twh06mWaxnT/ARgQZlGIB+5Hsee48h6V/TkZYd5c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Zv2rITlz; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=b8e3ygF2; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60M715Fn483784
	for <linux-arm-msm@vger.kernel.org>; Thu, 22 Jan 2026 10:50:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	T/UfWtw5ZQfseqhZRXzgqUeaU3ggF8Gp/sL3W86n7mc=; b=Zv2rITlzggNvS3KE
	HJ6wXwDfRMydyGn8W0+KaJ75ZV1lf2lijfbO7WT8i+TcxiG+w5v4jOaLRSZ0M9PN
	+gV4dk2kX7hPQzc7cL9iU/+Cao7nQ8mMQ9fwgrvT6r6SCY+fz3Fz17hDCdemFgyN
	zB97T0tb4p8HYKMgfXJyAWKl/zcgV4Q8dp4JCfXpLyhSKYu+gJixBDsg/j9VyRWa
	VWT0iIwCMtkvPw8pGtfeyWNBJZg8NoLoqDTNibLq0v9hyO1Tn1QMc5r7/kNHICV4
	AGQTbW+pLaKAZIxKkKfjtVVXh1bGGg8TU8sUfdPVg8WUhIdQ4cq4CoMQPnHLZO7/
	Ymlz1Q==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bu6pj25tr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 22 Jan 2026 10:50:03 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-5014c472ad5so24056261cf.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 22 Jan 2026 02:50:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1769079001; x=1769683801; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=T/UfWtw5ZQfseqhZRXzgqUeaU3ggF8Gp/sL3W86n7mc=;
        b=b8e3ygF2eLWqNAUpS3qcU79uEOIdPZ3fbhgk9eGunLzmbZegwhQ6sVzUMYQwKwPCtv
         0kK4We/kfzyYZmEPrL/omr4HypMBmwHorxVRkFyoO2siH1dUhTKFgVfRMhFr83iHOGX3
         /IJ01g+jsGwDZJUH5IvGNHm24nwFtEY8M+Lz6CClSGpk/qtavAxowE2GVfI60nVgskyF
         Yb9h2+51Gx5usmFloEFlLEWI0IHC9Cq7iQM3COkoVyyM5y8AV28ivNK6AWancpAInFLP
         9wl179bOwJ0lN5ys6swWg6gnNwPJPjztnwL77Ck2hQZbjCwlPa8FQzA3VrI27nLeErwP
         fauA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769079001; x=1769683801;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=T/UfWtw5ZQfseqhZRXzgqUeaU3ggF8Gp/sL3W86n7mc=;
        b=MZ453p8VnWPzLLLG6RBWdJYeL3siN2sY190xgLYdF4JLrPnCC30DTjwbRx4NUyMWxT
         HD3vqKS806OH6YrxLodQXmlTEjQGt8c3X8d6qrTl6HOC4aAYl18kC/AJ7OYYBHpO9Gmq
         l9zVBp9p3wyOWIrBqAg2uWaZUGXrRzyXWoQQaRBA6HMYLGt2O5yt2oeRYuuV/u6ymq0p
         BZG5DVepZ7PP/hfVvXaRnj8mTn22zqWc+A6TfoRvfafWGSNLXCEoI2XcX8r6pl5RcAEk
         pSsyoxPd2doC7I5Le6tGSkchbSuyyJ1D5FqMsgz2J0S3kBL9vozCuw6os6Hmqodl9eyU
         Nfyw==
X-Forwarded-Encrypted: i=1; AJvYcCXZsJ+nbfGN0Fl9kB6Yw5aozGSLIyyPNtA4UX942RFtwbcb7TRVe/TWWsdMVECEJKz0KrR0b8wtY9miReBH@vger.kernel.org
X-Gm-Message-State: AOJu0YwluJhFP5NvAsv3IeFyZ8eo6DBAi5Vxpxcz0I9/sd+SubMgWvwU
	BRvW1oudA9bbJFpkfAeLOsaUnbGzTEUaYFxqGGIrtCXi2Cy06JESbDj0XndyeQzaPD4JOtvtCZX
	E7/e7LbpTYnoe4OG0aQvfg/JM4CdBDCo6u/T/ADXPjHh8weJfcbbmUePJGBNmTeMrlqSC
X-Gm-Gg: AZuq6aIwjF9hcbCLe7j21FnS5wmG4z60H6KFRlKkPqAk6RnVbpTuzNOt9UGp0skNRuD
	Z8RSzaXnCAb9Vix4GEN0iSFZPD/iCzkTxNRL5CHwfhqH6TnZV2ye3kO1O9UxpwlInTfnRaQOdmv
	FaWUlGHAshLYZQvl9exKBFahBX566Fqt+k/hC+kPNZCYWmUz5oz1TJlbqv5RswT68JYGh61v3hs
	K92kxsxBKU3qp2wFBOAHHX+1d2kM9U0LEAga7VU1ssjCHsovonLXL7glZ3H2aJ/BwIUrZ1qEot2
	LUdPcEaTV+mEM20jCAc1xrZzP5FvCiwkVfP2g9n2P0xoY+2BlfTO3Tt0A4RrExH1/fbD0OcMq9L
	V7lRPjxLNkEr4X4SErSwh2VnJrIWpuavxAeSjOjE+nqwpDbKdUhDpltPf0fFRgN4ThSJ8Pg4XhS
	6v
X-Received: by 2002:ac8:5a08:0:b0:4ee:1aab:fd6 with SMTP id d75a77b69052e-502a15e4660mr293697721cf.3.1769079000827;
        Thu, 22 Jan 2026 02:50:00 -0800 (PST)
X-Received: by 2002:ac8:5a08:0:b0:4ee:1aab:fd6 with SMTP id d75a77b69052e-502a15e4660mr293697361cf.3.1769079000440;
        Thu, 22 Jan 2026 02:50:00 -0800 (PST)
Received: from WENMLIU-LAB01.ap.qualcomm.com (Global_NAT1_IAD_FW.qualcomm.com. [129.46.232.65])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-502a1d9ee19sm121704901cf.14.2026.01.22.02.49.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Jan 2026 02:49:59 -0800 (PST)
From: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
Date: Thu, 22 Jan 2026 18:48:54 +0800
Subject: [PATCH v5 3/5] arm64: dts: qcom: talos: Add CCI definitions
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260122-sm6150_evk-v5-3-039b170450a3@oss.qualcomm.com>
References: <20260122-sm6150_evk-v5-0-039b170450a3@oss.qualcomm.com>
In-Reply-To: <20260122-sm6150_evk-v5-0-039b170450a3@oss.qualcomm.com>
To: Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Andi Shyti <andi.shyti@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Robert Foss <rfoss@kernel.org>,
        Todor Tomov <todor.too@gmail.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>
Cc: linux-i2c@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org, imx@lists.linux.dev,
        linux-arm-kernel@lists.infradead.org,
        Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1769078967; l=2250;
 i=wenmeng.liu@oss.qualcomm.com; s=20250925; h=from:subject:message-id;
 bh=2WG5aoisKJwerkvnpytr8xGIA19LajXbCLZsav5MoQ0=;
 b=D4j93r8djlEVFvPHXUNxrEEMUPi8V2DnJbU02J3SwFN91DYAirb6S8cKc2/TO4Wi8hzF3ZLYt
 j71PwYeIltuBT7izRRMtbrZ8CkPgnc4JNgREU7urfXhndWGqqpfwO1U
X-Developer-Key: i=wenmeng.liu@oss.qualcomm.com; a=ed25519;
 pk=fQJjf9C3jGDjE1zj2kO3NQLTbQEaZObVcXAzx5WLPX0=
X-Authority-Analysis: v=2.4 cv=D8pK6/Rj c=1 sm=1 tr=0 ts=697200db cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=C3Dk8TwHQYyIj7nOf9RCJw==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8
 a=szutk0iRDVHniUSXDBIA:9 a=QEXdDO2ut3YA:10 a=dawVfQjAaf238kedN5IG:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTIyMDA3NyBTYWx0ZWRfXysL+4sSCYgRs
 eAieduLPB3dG5ukkCT8XVNGgn0x5NiDdqINLp5r59zm7nlRyYHgZ5XL+9Tu493qihHbJyIz2oly
 zD51pjkrBT9lOxJCcxGHN0OoP8SEpagXU1NLn1Uzl4nakh7CFwg8L797K28Heeg4rkGTXWqBGFz
 SqmpUuf8ZeLNPUcMOcvvVV8vwhG+B2H0OKJ94WB4mAhNwWH2xpYBYZQ5N5B4CgcplyJsfkb+Mf1
 2O6kfMyDf061XG1HcCol4mzQVhToEcJS9cw9bk0OrxbFkAJ7jbAMwuOjRcgHgtan5ddSUcxyx0O
 TLAIw0wekuHAISPqQn5ROCx8kl73VbnNmDlvcwan5RSFeGI10Zrfj/BAtPqnX71o4gfVOzj+MwY
 kNDc0epdVElLB4i4QZ0N/nXDSrzRVIwmNOnzcZQU8x1+vwjzzT/K1KiJmVDj/UWLQPFUcVXWl+E
 Oo68td2CO1cf3LglWOQ==
X-Proofpoint-ORIG-GUID: V8fXS2SzwphM-MGGSX8qRWgu27Tjn1bT
X-Proofpoint-GUID: V8fXS2SzwphM-MGGSX8qRWgu27Tjn1bT
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.20,FMLib:17.12.100.49
 definitions=2026-01-22_01,2026-01-20_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 malwarescore=0 adultscore=0 phishscore=0 impostorscore=0
 priorityscore=1501 clxscore=1015 spamscore=0 suspectscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2601220077
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.46 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[23];
	TAGGED_FROM(0.00)[bounces-90177-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,kernel.org,gmail.com,linaro.org,pengutronix.de];
	DMARC_POLICY_ALLOW(0.00)[qualcomm.com,reject];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[ab00000:email,ac4a000:email,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,0.0.0.1:email,linaro.org:email,acb3000:email,0.0.0.0:email,ams.mirrors.kernel.org:helo,ams.mirrors.kernel.org:rdns,0.47.77.96:email,qualcomm.com:email,qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[wenmeng.liu@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	R_SPF_SOFTFAIL(0.00)[~all:c];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:7979, ipnet:2a01:60a::/32, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: C2C1465C6B
X-Rspamd-Action: no action

Qualcomm Talos SoC contains single controller,
containing 2 I2C hosts.

Reviewed-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
Signed-off-by: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/talos.dtsi | 51 +++++++++++++++++++++++++++++++++++++
 1 file changed, 51 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/talos.dtsi b/arch/arm64/boot/dts/qcom/talos.dtsi
index 3e1d85b6eacb90b48496ddfee2db27c586f3331e..6d28096e50546855bd762e479b66ed6214ec5d65 100644
--- a/arch/arm64/boot/dts/qcom/talos.dtsi
+++ b/arch/arm64/boot/dts/qcom/talos.dtsi
@@ -1553,6 +1553,22 @@ tlmm: pinctrl@3100000 {
 			#interrupt-cells = <2>;
 			wakeup-parent = <&pdc>;
 
+			cci_i2c0_default: cci-i2c0-default-state {
+				/* SDA, SCL */
+				pins = "gpio32", "gpio33";
+				function = "cci_i2c";
+				drive-strength = <2>;
+				bias-pull-up;
+			};
+
+			cci_i2c1_default: cci-i2c1-default-state {
+				/* SDA, SCL */
+				pins = "gpio34", "gpio35";
+				function = "cci_i2c";
+				drive-strength = <2>;
+				bias-pull-up;
+			};
+
 			qup_i2c1_data_clk: qup-i2c1-data-clk-state {
 				pins = "gpio4", "gpio5";
 				function = "qup0";
@@ -3789,6 +3805,41 @@ videocc: clock-controller@ab00000 {
 			#power-domain-cells = <1>;
 		};
 
+		cci: cci@ac4a000 {
+			compatible = "qcom,sm6150-cci", "qcom,msm8996-cci";
+
+			reg = <0x0 0x0ac4a000 0x0 0x4000>;
+			interrupts = <GIC_SPI 460 IRQ_TYPE_EDGE_RISING 0>;
+			power-domains = <&camcc TITAN_TOP_GDSC>;
+			clocks = <&camcc CAM_CC_SOC_AHB_CLK>,
+				 <&camcc CAM_CC_CPAS_AHB_CLK>,
+				 <&camcc CAM_CC_CCI_CLK>;
+			clock-names = "camnoc_axi",
+				      "cpas_ahb",
+				      "cci";
+			pinctrl-0 = <&cci_i2c0_default &cci_i2c1_default>;
+			pinctrl-names = "default";
+
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			status = "disabled";
+
+			cci_i2c0: i2c-bus@0 {
+				reg = <0>;
+				clock-frequency = <1000000>;
+				#address-cells = <1>;
+				#size-cells = <0>;
+			};
+
+			cci_i2c1: i2c-bus@1 {
+				reg = <1>;
+				clock-frequency = <1000000>;
+				#address-cells = <1>;
+				#size-cells = <0>;
+			};
+		};
+
 		camss: isp@acb3000 {
 			compatible = "qcom,sm6150-camss";
 

-- 
2.34.1


