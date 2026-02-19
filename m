Return-Path: <linux-arm-msm+bounces-93404-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id ZKh+GKcYl2nKugIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-93404-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 19 Feb 2026 15:05:27 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 656D815F4E8
	for <lists+linux-arm-msm@lfdr.de>; Thu, 19 Feb 2026 15:05:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id BB6AD3004043
	for <lists+linux-arm-msm@lfdr.de>; Thu, 19 Feb 2026 14:05:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2E0D82D46C0;
	Thu, 19 Feb 2026 14:05:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="KSpYveHX";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Flqja1v5"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF1382494F0
	for <linux-arm-msm@vger.kernel.org>; Thu, 19 Feb 2026 14:05:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771509921; cv=none; b=YFwti9YBwOD/89QNUIvRTV5P6SVgHy8zJa0GETeGNtTplhlAz/gwjbJOnk3adlkMnFV95lPDnYU27+D1F3Xl5+Ybl3VGjPepMt2gdippTo5yenvGIHowD9qjTt8vfdvYioe4577g2UFS/OeKKFFekEUY4Ocgqh1jyvsxMoy3Zzg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771509921; c=relaxed/simple;
	bh=QNj9CkSL63p09bYQPcFcXGu9Fil4w8mAzmvxMZmMJiU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=tNPHYwxYZWZjVNQYjAo6d0MfcLz1MB5bPeG4EI44RJ+MNB9/+7/uhh98qgFMyGExE/uGJ2n1nuydPPZDosqaFoeFw6BBF8tcmTVdkKLrRQaOQb9b+WHNaIa1JOQgHRB21EuvHN16wf8ig2imoETexpLCN1BR1qZGnZyRF9vG9og=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=KSpYveHX; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Flqja1v5; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61JCOsuT409068
	for <linux-arm-msm@vger.kernel.org>; Thu, 19 Feb 2026 14:05:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=I+e0vSt3X6F9zV8MU1NdhT
	DrcSYxiUtVR1c5S5Jw8Bk=; b=KSpYveHXUCpfFYVfJXypuGrfMyY1sVfTllD8DP
	AcXFB2xhALzsPKqLs0rwO933T6+vlJapB7RhcNIGLmZLZc/SB4MNMy8PGnlZBPND
	sKkKn4rxBi7f/0sJyD2a2zMhjcaQ/5dQiEYnh/3U0OM6O0pG8QS45Ao0YKxh0FVg
	WJhlOGuSZ4viqq0gBuU7+BRh1tqSK3n+vRNNrqYzo2ZnkEJeOXml+gwzUI/Vq/bk
	EnNGJ1mcBsMZw/K3F/RiCQecoGtXb2lIXJ3WoECnue76QwbprGtuODdzcafKaHxK
	pxjt9H7skFYUZRJFDrC4+7BGXJzm6XzaopxSgGzEXvfNqZJw==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ce2gega14-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 19 Feb 2026 14:05:19 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2aadeb3dee4so67804155ad.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 19 Feb 2026 06:05:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1771509918; x=1772114718; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=I+e0vSt3X6F9zV8MU1NdhTDrcSYxiUtVR1c5S5Jw8Bk=;
        b=Flqja1v5r4mqJdkHjS9I/Y3A7ChLcca/FLEEo5mDOo5jrYkNrFHXACb05qLOo54EvB
         ZIM603tgoPoC3BFDV58A8eygmdKRBWdMFGhRP8/MLkE+XUYDXHt9mCKh3o4l3oVbZV0i
         R7MWdC7l5adRLK8+Z0Pet/Wq4NhnzxzRBXHNhxNpXLrX5lMWfVHPrs85KAjgzQKJsyCp
         Z4YEaXYnV8txRggojTmO0ZO34Pk3tAwYOL+GjANYVxtimyMip2uNyZHSUZCPHMa8d/xw
         Rz+paK7VPOMtrB7CGyMVPX0yMM8Sh1/TvjLj0TSz+gNfywF898bDpk8m+tAfDGuewqGe
         9gsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771509918; x=1772114718;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=I+e0vSt3X6F9zV8MU1NdhTDrcSYxiUtVR1c5S5Jw8Bk=;
        b=bQkusFsrh0/jASH8+dkvGLOPcZ2DzMHjG49yd6hzpb1tuNQgzELCJTgjkoXkKO9G9e
         EueG1VsKB4HmmJqliYxDDAdbDdy2Hb6ymgNrhQRhN7JYMAYTTf6iv95QCCRdd5G/horV
         P70sdsGTKRnFdUH5uAZb2mconyyn6FuT3hYXXQVioMhrKItm4OKvgzk7D2BR+M5n5CGq
         zvnW7p7gx1rpgNcBP5ToN1veIlx000ukYk3SPso2xsS7NuaKIQ2ylZcX5MRE48ItB/Hw
         /u6lG3Gwh3DgTCAPIXbenC4us9IbR6eqjd59J+W+FQnJg9wumk66mQliU+2yDSOw+BUq
         FzSQ==
X-Gm-Message-State: AOJu0Yx4PqW8JBKQsMpauTDLb5M9yXZn5bEe4KMX35HYV2+O4/VuyWHR
	b+uMuursn+e8t845IxgfFMgUwdaS1332pYL38IsHSli5BJkyEWIqm/hn5xRxpZEVxe88Eco+q7/
	/egLkfOwWnOuKW64XZaWNJWHroCRsP8aNc8i/JGIKDHONVpPdWGHn62vsQ96X9U7B3lBm
X-Gm-Gg: AZuq6aIJF+2k3KrrUQAVxwop3At++QoyH6aFyeURMvE5FzpGfn+F1f3IOrL/6gQapKs
	9svNXRcXrqF3BwtC5uPwaTt7s3JtpqpZu0StGzQEjtfi7T10aRrlNDq8F77wlepE7vuxHRvCBjT
	utvZIXpPHPsCj4qgMsAvVMaRg2zawkWgmB4HdQByyBjwMKSBpAQrY8VopOiHvtZZ5trGO64DNV6
	J7MwTe1T0s+gQlmOzp34HSiTaza2muGAjQtW29TjHKMKKlde2TVo/4vftEteTq+9vSgQiOp/14n
	zMIGo8L4cdhdXf+Fb7j8TaZLYai0wiuv2d9yKQ9w5WxfHIcVHDXFfurOWOEy/tJlDthfdxhgKuk
	9QTIwwq9NYj+7e/zfD3vuNX321E9Mtdv4Z4zRd4Qvrs6Y/8A5z3f/IDH047lcfQ==
X-Received: by 2002:a05:6a21:a247:b0:366:14ac:e1ec with SMTP id adf61e73a8af0-3946733de5cmr20497919637.62.1771509918346;
        Thu, 19 Feb 2026 06:05:18 -0800 (PST)
X-Received: by 2002:a05:6a21:a247:b0:366:14ac:e1ec with SMTP id adf61e73a8af0-3946733de5cmr20497887637.62.1771509917850;
        Thu, 19 Feb 2026 06:05:17 -0800 (PST)
Received: from hu-botlagun-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c6e52ed96ebsm16536305a12.0.2026.02.19.06.05.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Feb 2026 06:05:17 -0800 (PST)
From: Gopi Botlagunta <venkata.botlagunta@oss.qualcomm.com>
Date: Thu, 19 Feb 2026 19:35:12 +0530
Subject: [PATCH] arm64: dts: qcom: Enable lvds panel-DV215FHM-R01 for
 lemans-evk Mezzanine
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260219-enable-lvds-lemans-mezzanine-v1-1-9cb2075f7c18@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAJcYl2kC/yWOQW6DMBBFr4K87iAzBttEUdVFb1FlMcbjYAlMg
 kNUJcrd65TNSO8v3punyLxGzuJQPcXK95jjkgo0H5UYRkpnhugLC5SoJTYWOJGbGKa7zzDxTCn
 DzI8HpZgYWtPZ1hvtqCNRFJeVQ/z91/+cdl75upXKbR/FN184FdWSDtVxj0jV9Mq2tm5QKWkAY
 SuZcz2MI3v6WnKurxtNwzLPdTmf75CjzPBe4q08T9Ji36Oh4ALrrh20QnbIxvSBFPpgsXNSi9P
 r9Qe9pL+eAQEAAA==
X-Change-ID: 20260218-enable-lvds-lemans-mezzanine-47584d76ba5a
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, venkata.valluru@oss.qualcomm.com,
        jessica.zhang@oss.qualcomm.com,
        Gopi Botlagunta <venkata.botlagunta@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1771509913; l=3535;
 i=venkata.botlagunta@oss.qualcomm.com; s=20251110; h=from:subject:message-id;
 bh=QNj9CkSL63p09bYQPcFcXGu9Fil4w8mAzmvxMZmMJiU=;
 b=A+c6GYF8pF3nWNNW3/qsc0AZuAfU4JzUhux9EyoeZGFjDSrKaM1YKdrMHr/mO7GewhInf33uL
 0xCc2f43OKdD156OeBw/lzTd+BY41GuN+T6ozD9t3nRg7NUyZJ8Bzoh
X-Developer-Key: i=venkata.botlagunta@oss.qualcomm.com; a=ed25519;
 pk=/SnYBwlkTzDCLnHFgEY0qFwPgKIV+aQWRbc3naiLzrk=
X-Authority-Analysis: v=2.4 cv=Z5/h3XRA c=1 sm=1 tr=0 ts=6997189f cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22
 a=EUspDBNiAAAA:8 a=pbok0ahNxPM2TqRZ_awA:9 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-GUID: 1mts464PwNaKcbqfSswB3cGDqT_KrBLD
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjE5MDEyOCBTYWx0ZWRfX1HXlm9fIh/Vs
 r6rcSsxGdDUdkOnqGZwgeCPLA51EWpPnUvmMATTPVoZK2HAHDeqw9zb6l+yHeeet60DxHRnHiFG
 wwCdci0h0YRlThUvWg6CskEVRCAF/cGRaUMxfaqgBKHJRQApeG7bn2QUqlYUAShHJWvkxarmYgN
 0tdbX2ZT8c6UpseUrErRDrdevzhGblAezm2ICYk91lF5zqzycKPO8QRqbGK72Enq4akrGDa5ryr
 WF8lxH119Jc4KJRy+kLwjlg18uucn4loesUv7R/wagBkjeHZS2t/eQJrg4lHCIQeMd8T5ArHND3
 mPLuVM+Klrj25WOjRKKAVVC39UKjb+0KBDZ7ZBVH2uv9YCRKTqUqscO5sxlZkKpcXyGZ7W43qXd
 W/isDxvogE54Z1T+5WJo3mBcNW/YuiefOxAmRRTK6wr+GepBLSElBfgjm6IvJzg5hkSa4eZgXd1
 x69DNTpnfMPHItF0HbA==
X-Proofpoint-ORIG-GUID: 1mts464PwNaKcbqfSswB3cGDqT_KrBLD
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-19_04,2026-02-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1011 spamscore=0 bulkscore=0 adultscore=0 priorityscore=1501
 malwarescore=0 lowpriorityscore=0 phishscore=0 impostorscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602190128
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-93404-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,0.0.0.0:email,0.0.0.1:email];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[venkata.botlagunta@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_PROHIBIT(0.00)[0.0.0.2:email,0.0.0.3:email];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 656D815F4E8
X-Rspamd-Action: no action

LT9211c bridge and lvds panel node.
LT9211c is powered by default with reset gpio connected to 37.

Signed-off-by: Gopi Botlagunta <venkata.botlagunta@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/lemans-evk-mezzanine.dtso | 125 +++++++++++++++++++++
 1 file changed, 125 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/lemans-evk-mezzanine.dtso b/arch/arm64/boot/dts/qcom/lemans-evk-mezzanine.dtso
index 4fab96ba873c..16f757952ff7 100644
--- a/arch/arm64/boot/dts/qcom/lemans-evk-mezzanine.dtso
+++ b/arch/arm64/boot/dts/qcom/lemans-evk-mezzanine.dtso
@@ -11,6 +11,62 @@
 &{/} {
 	model = "Qualcomm Technologies, Inc. Lemans-evk Mezzanine";
 
+	panel_lvds: panel-lvds@0 {
+		compatible = "panel-lvds";
+
+		data-mapping = "vesa-24";
+
+		width-mm = <476>;
+		height-mm = <268>;
+
+		status = "okay";
+
+		panel-timing {
+			clock-frequency = <148500000>;
+			hactive = <1920>;
+			vactive = <1080>;
+			hfront-porch = <88>;
+			hback-porch = <148>;
+			hsync-len = <44>;
+			vfront-porch = <4>;
+			vback-porch = <36>;
+			vsync-len = <5>;
+			de-active = <1>;
+		};
+
+		ports {
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			port@0 {
+				reg = <0>;
+
+				dual-lvds-odd-pixels;
+				panel_in_lvds_odd: endpoint {
+					remote-endpoint = <&lt9211c_out_odd>;
+				};
+			};
+
+			port@1 {
+				reg = <1>;
+
+				dual-lvds-even-pixels;
+				panel_in_lvds_even: endpoint {
+					remote-endpoint = <&lt9211c_out_even>;
+				};
+			};
+		};
+	};
+
+	lcd_disp_bias: regulator-lcd-disp-bias {
+		compatible = "regulator-fixed";
+		regulator-name = "lcd_disp_bias";
+		regulator-min-microvolt = <5500000>;
+		regulator-max-microvolt = <5500000>;
+		gpio = <&expander3 1 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+	};
+
 	vreg_0p9: regulator-vreg-0p9 {
 		compatible = "regulator-fixed";
 		regulator-name = "VREG_0P9";
@@ -158,6 +214,55 @@ queue3 {
 	};
 };
 
+&i2c1 {
+	qcom,load-firmware;
+	qcom,xfer-mode = <1>;
+	pinctrl-names = "default";
+	pinctrl-0 = <&qup_i2c1_default>;
+
+	status = "okay";
+
+	lt9211c_codec: lvds-bridge@2d {
+		compatible = "lontium,lt9211c";
+		reg = <0x2d>;
+		reset-gpios = <&tlmm 37 GPIO_ACTIVE_HIGH>;
+		vcc-supply = <&vreg_s4a>;
+
+		status = "okay";
+
+		ports {
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			port@0 {
+				reg = <0>;
+
+				lt9211c_in: endpoint {
+					data-lanes = <0 1 2 3>;
+					remote-endpoint = <&mdss0_dsi0_out>;
+				};
+			};
+
+			port@2 {
+				reg = <2>;
+
+				lt9211c_out_odd: endpoint {
+					remote-endpoint = <&panel_in_lvds_odd>;
+				};
+			};
+
+			port@3 {
+				reg = <3>;
+
+				lt9211c_out_even: endpoint {
+					remote-endpoint = <&panel_in_lvds_even>;
+				};
+			};
+		};
+	};
+
+};
+
 &i2c18 {
 	#address-cells = <1>;
 	#size-cells = <0>;
@@ -179,6 +284,26 @@ mac_addr1: mac-addr@0 {
 	};
 };
 
+&mdss0 {
+	status = "okay";
+};
+
+&mdss0_dsi0 {
+	vdda-supply = <&vreg_l1c>;
+	power-supply = <&lcd_disp_bias>;
+	status = "okay";
+};
+
+&mdss0_dsi0_out {
+	data-lanes = <0 1 2 3>;
+	remote-endpoint = <&lt9211c_in>;
+};
+
+&mdss0_dsi0_phy {
+	vdds-supply = <&vreg_l4a>;
+	status = "okay";
+};
+
 &pcie0 {
 	iommu-map = <0x0 &pcie_smmu 0x0 0x1>,
 		    <0x100 &pcie_smmu 0x1 0x1>,

---
base-commit: 1a0829927afbfe654c632eb2e779fa32df825b06
change-id: 20260218-enable-lvds-lemans-mezzanine-47584d76ba5a

Best regards,
-- 
Gopi Botlagunta <venkata.botlagunta@oss.qualcomm.com>


