Return-Path: <linux-arm-msm+bounces-102543-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cK0DJcAJ2GlOWggAu9opvQ
	(envelope-from <linux-arm-msm+bounces-102543-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 09 Apr 2026 22:19:12 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 38E513CF5F0
	for <lists+linux-arm-msm@lfdr.de>; Thu, 09 Apr 2026 22:19:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 695B0301E7FF
	for <lists+linux-arm-msm@lfdr.de>; Thu,  9 Apr 2026 20:18:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 619B933E373;
	Thu,  9 Apr 2026 20:18:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="qQxcPmoB"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5149033D509
	for <linux-arm-msm@vger.kernel.org>; Thu,  9 Apr 2026 20:18:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775765934; cv=none; b=IhztoeCCmMydG2TXoY3VnyCkqJjHrwOosLn9iB9ixsVthmwo8YygD2wKyDaEnnGY+hWmBsQxBjVUMk7z4KKDXhsGHppFZ6hbGFFE1ZrZaFc3Bt879Ua44EksUVICVHjlbh4lUNIcIeBk1OZDYCkEv04zICAFb1dgor6UrukdgiA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775765934; c=relaxed/simple;
	bh=CEMFdCdV787AMyGI8dxLrCBGALoi2KygjN6kKW1f9PY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=n8X7MFycBk0VUr/twO/p1qoYRlBOK55+rrM6zlQqaz1m4CZ2LdnsgpwSdO08lRLGaUfdvHE4htkzQnaJFBbFgq8zt3Yuba83iQ4moKL+5Q7jORhmkrnibe8PByhb3BbcmlVetW3Lp5qKhJsRd9pbMnVn+V2nn1ytFiLdYXhMVYw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=qQxcPmoB; arc=none smtp.client-ip=209.85.214.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-2a7a9b8ed69so10381805ad.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 09 Apr 2026 13:18:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775765932; x=1776370732; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Wsop0ED0cxBTgOqfG4UjnGPiOWr01DVPoMWtUinONWQ=;
        b=qQxcPmoBABwfSz5RgHZpW9kh2PM0/SxfV5/sQzv3xuc2HW5GN6Vz6mb6dIZkyTw0ss
         n42HvXZ749d8yLV82mcjKxlcF+HT4DuDpr+Z1zQQQWP42l9xau3ZNxio9A2AvO01jrIY
         HYTL2VkgcGY3G8deTRriHJ4JsDsvGeZQLupOLVQ9kQVnhrOVFPnjzC9Q+RcEnINSCva7
         vYkqOOEc+qVBouLEM8v7gWWtejY50H0sPSg4XOS3MfH4LcgECJWS/CKEl0tv6FGIaS9F
         H870qpVPfhiak3UWjV1Uc4u8//KKlAgfUpfIUKFQRWoJA0bxzA3OwgfaI5iS4rAgo79W
         vQZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775765932; x=1776370732;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Wsop0ED0cxBTgOqfG4UjnGPiOWr01DVPoMWtUinONWQ=;
        b=kojeAtz6WZNdUGfd8Mk4NdoVX+ZzEz7YeojlyFxJe0oKdP9t0ILG/gyjDREhTGQ3/B
         GBsnhVKHMDg6rWxrnFYpvE3GGcaAg0FBJ8FkigG0iL79hBt0wAeo5KWJVXOyoEeetnya
         wF2FwcXL7IzqFbm6abpUUK0ORo8Jgi2RNljZPsmOtXswCy2S4l0XfmBSrw91nc2f9SLK
         Afl/i2opJpO7YMes+RoxXRFOidc0q3y+Z7ebz75hui9gTF/a2EtuJSWnTD3qb/x1TLah
         Epp3TtvOkdWTYFSQip55tmxqe7mQtF+wZNwH1ooh8BaWxSB2OGUS19AqzkF6m73JmIUg
         3CzQ==
X-Forwarded-Encrypted: i=1; AJvYcCXKRCo/gMwjRlXK39Zy0GF51F8LdzGNSSbwf9j+AziLESQxD132OVB880peaZOJRWkrd0eZGttbW6FXaaWY@vger.kernel.org
X-Gm-Message-State: AOJu0Yx1pBQJZLqUPTkdAPlfG23WjMsfn/n6LBu51WDlXF3how4NXxxx
	OpuMBa4mUJOaPb+7btEXTB3zy8oFomlGw8klH814CEdcxcC38BrdM11u
X-Gm-Gg: AeBDieu6Cwy3pzT0kg2W3+VyNRXJurJP220bjVrjk4MdWK6bCPVrt26+MIDOM08aB6x
	e0O4vWmDWFT2lb5UC9UNogHPqEJ++gEWpAqoQvIVwBQxzCjmDKF7Cb66NPXbXipMRZ9ZTQvcFkj
	CgrNRdZ9QV8PamYnqtB/BbzPoq1upcYhwMy1BK3zD8ojsu9X8YpR35bCsR6FXYJEsYq2GIG1vrn
	24bO+rytz6z8HkidQb8OoPpZCArHzIKYQDNn11FgBYfz4wXF63BXPoMBOi3jIvHnzm55kupO8VZ
	uuhwEvMH2o1h50gscVcmViEjJOHr/yhSlgEedeqg5GkRheslYwAxEA/kHoonnFqKoctWKMqBoUe
	9jQSgnGCc6tb0GvrQ4Hgfv5GeP0JPFmw8OXcRzTqq/egPKuhGmJfPU2Ynur36nmGUZCOGMUBUtq
	b3p9uDLiXuyoCKvM6TpGTlJgWjg+bgshCO7BfLrwxUGMiN1g2DypYkF7WdZCU=
X-Received: by 2002:a17:902:db0c:b0:2b0:5cee:c421 with SMTP id d9443c01a7336-2b2d595b645mr3329935ad.4.1775765931621;
        Thu, 09 Apr 2026 13:18:51 -0700 (PDT)
Received: from tomriddle ([131.203.184.83])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b2d4f48cfdsm3895425ad.82.2026.04.09.13.18.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Apr 2026 13:18:51 -0700 (PDT)
From: Oliver White <oliverjwhite07@gmail.com>
To: andersson@kernel.org,
	konradybcio@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org
Cc: bod@kernel.org,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Oliver White <oliverjwhite07@gmail.com>
Subject: [PATCH v2 2/2] arm64: dts: qcom: x1e80100-microsoft-romulus: enable OV02C10 MIPI CSI-2 camera
Date: Fri, 10 Apr 2026 08:17:17 +1200
Message-ID: <20260409201717.108169-3-oliverjwhite07@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260409201717.108169-1-oliverjwhite07@gmail.com>
References: <20260409083609.75341-1-oliverjwhite07@gmail.com>
 <20260409201717.108169-1-oliverjwhite07@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [4.84 / 15.00];
	SEM_URIBL(3.50)[0.0.0.0:email];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	MAILLIST(-0.15)[generic];
	BAD_REP_POLICIES(0.10)[];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-102543-lists,linux-arm-msm=lfdr.de];
	PRECEDENCE_BULK(0.00)[];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,vger.kernel.org,gmail.com];
	RCVD_TLS_LAST(0.00)[];
	GREYLIST(0.00)[pass,meta];
	DMARC_POLICY_ALLOW(0.00)[gmail.com,none];
	TO_DN_SOME(0.00)[];
	R_DKIM_ALLOW(0.00)[gmail.com:s=20251104];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_SPAM(0.00)[0.788];
	RCPT_COUNT_SEVEN(0.00)[10];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	DBL_PROHIBIT(0.00)[0.0.0.3:email];
	RCVD_COUNT_FIVE(0.00)[5];
	FROM_NEQ_ENVFROM(0.00)[oliverjwhite07@gmail.com,linux-arm-msm@vger.kernel.org];
	R_SPF_ALLOW(0.00)[+ip6:2600:3c04:e001:36c::/64:c];
	ARC_ALLOW(0.00)[subspace.kernel.org:s=arc-20240116:i=1];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[0.0.0.36:email,0.0.0.0:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 38E513CF5F0
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Enable the front-facing OV02C10 MIPI CSI-2 camera on Microsoft Romulus
by enabling CAMSS, CCI1 and CSIPHY4, adding the sensor node and its
endpoint, and defining the pinctrl state used by the camera clock and
reset lines.

Signed-off-by: Oliver White <oliverjwhite07@gmail.com>
---
 .../dts/qcom/x1e80100-microsoft-romulus.dtsi  | 75 +++++++++++++++++++
 1 file changed, 75 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/x1e80100-microsoft-romulus.dtsi b/arch/arm64/boot/dts/qcom/x1e80100-microsoft-romulus.dtsi
index 4427ecae423f..9e910813fa48 100644
--- a/arch/arm64/boot/dts/qcom/x1e80100-microsoft-romulus.dtsi
+++ b/arch/arm64/boot/dts/qcom/x1e80100-microsoft-romulus.dtsi
@@ -918,6 +918,65 @@ &gpu_zap_shader {
 	firmware-name = "qcom/x1e80100/microsoft/qcdxkmsuc8380.mbn";
 };
 
+&camss {
+	status = "okay";
+
+	ports {
+		/*
+		 * port0 => csiphy0
+		 * port1 => csiphy1
+		 * port2 => csiphy2
+		 * port3 => csiphy4
+		 */
+		port@3 {
+			camss_csiphy4_inep0: endpoint@0 {
+				clock-lanes = <7>;
+				data-lanes = <0 1>;
+				remote-endpoint = <&ov02c10_ep>;
+			};
+		};
+	};
+};
+
+&cci1 {
+	status = "okay";
+};
+
+&cci1_i2c1 {
+	camera@36 {
+		compatible = "ovti,ov02c10";
+		reg = <0x36>;
+
+		reset-gpios = <&tlmm 237 GPIO_ACTIVE_LOW>;
+		pinctrl-names = "default";
+		pinctrl-0 = <&cam_rgb_default>;
+
+		clocks = <&camcc CAM_CC_MCLK4_CLK>;
+		assigned-clocks = <&camcc CAM_CC_MCLK4_CLK>;
+		assigned-clock-rates = <19200000>;
+
+		orientation = <0>; /* front facing */
+
+		avdd-supply = <&vreg_l5m_2p8>;
+		dvdd-supply = <&vreg_l1m_1p2>;
+		dovdd-supply = <&vreg_l3m_1p8>;
+
+		port {
+			ov02c10_ep: endpoint {
+				data-lanes = <1 2>;
+				link-frequencies = /bits/ 64 <400000000>;
+				remote-endpoint = <&camss_csiphy4_inep0>;
+			};
+		};
+	};
+};
+
+&csiphy4 {
+	vdda-0p8-supply = <&vreg_l2c>;
+	vdda-1p2-supply = <&vreg_l1c>;
+
+	status = "okay";
+};
 
 &i2c0 {
 	clock-frequency = <100000>;
@@ -1493,6 +1552,22 @@ wcn_sw_en: wcn-sw-en-state {
 		bias-disable;
 	};
 
+	cam_rgb_default: cam-rgb-default-state {
+		mclk-pins {
+			pins = "gpio100";
+			function = "cam_aon";
+			drive-strength = <16>;
+			bias-disable;
+		};
+
+		reset-n-pins {
+			pins = "gpio237";
+			function = "gpio";
+			drive-strength = <2>;
+			bias-disable;
+		};
+	};
+
 	cam_indicator_en: cam-indicator-en-state {
 		pins = "gpio225";
 		function = "gpio";
-- 
2.51.0

