Return-Path: <linux-arm-msm+bounces-97568-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mHNjImc1tGn4igAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-97568-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Mar 2026 17:03:51 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 8AED72869A5
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Mar 2026 17:03:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 0BA52300BC44
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Mar 2026 16:00:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E131B3C3436;
	Fri, 13 Mar 2026 16:00:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="ndCgoXb2"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EAB843BD251
	for <linux-arm-msm@vger.kernel.org>; Fri, 13 Mar 2026 16:00:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773417646; cv=none; b=p6W0S4s6TRRKjxe5VKbMZSUc5OuGCm0F3wBxf7QUyd98LtU9teodp4b6poURHwLdTGehKi1MzzgA6rpF3G2Hkbt8j0cR/hH/qVupdRMU/kzYvuAlzFL2jj/b0I8wjTcYuYGFxD+6EqR5n7i+8SSOZeMkwemTlhlGKse53LNkDsQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773417646; c=relaxed/simple;
	bh=lOT4+GNlLxxuDwDS5ER52dtudGIhBdpwGUH/epyYHBM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=MDmolvXLTD86RtfLIqmta/Z/XoI53zHdlpr9JKp0w3g4B13IhHWVEQgu2+6YP3suhzCct2T0ow6rL3LhX4z7YqIarPYhLq6kTTMTJQ/YJt2F0++52ux4xWjLockG1oT6tqRF68j4vlrd704V/s9ik8uPwt6IogkyRHpqJ0k5g4Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=ndCgoXb2; arc=none smtp.client-ip=209.85.218.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-b96f02b4329so408388966b.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 13 Mar 2026 09:00:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1773417643; x=1774022443; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=y1Zg7H+Y9KxSApbtKLd5TLNPtGYxeYBK0CWoprjh9PY=;
        b=ndCgoXb2ZEcpLI0KDoUjrBj0zy7lzIKOVNN6SNWuYodcuF8BZXEy7YYYi3Zcql3pzy
         F90O5zn6AQiDdmX8NY2xueo7aSWN4Iv065GWAzwbJ49Cx39WPfI6traZtWff7saJuM58
         5qU+vekPVi/CwVlxVwAhmgJMgbh5+j+bA4M0oHmOXQF8p+T+nwP+4nKUqHfqUtd5nLRG
         /MQXF5tH+X1i9X/b/v8EVCcemNGRW1MdaImOeA2amOOxegl2c/JdkLd+x5oCsew2EiVF
         8Wp9W5ylpVwDSSMIo79n2JMUFtBOtrmabDULbN9yLabcXxk0LJ/uiAnfe7EUhybFRwu6
         sYtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773417643; x=1774022443;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=y1Zg7H+Y9KxSApbtKLd5TLNPtGYxeYBK0CWoprjh9PY=;
        b=SSztRplUSuvvuuEs6AojJgIy8UM2hf3+JxhATKZnJMMbZBtIKsxXEVEI1OP5RwMgQm
         +yArDBm1TXcl4vKfA6a3Ii8LVZGm6bJc9N2RHU1uUO+0pUopcz+G6V34c7Phm86oNr7J
         g2P82djMfD9py3Uha1uSxhR4l23anVJxz0RlUh3BnLKcpoCwTjQV+XVIlyg1Nd6GkWsY
         wHfKIK/8qZ34APAfePe90jaH9/OABoR9Jcwd1Cs3lQrMbLCphXKCpyNEcvVjhoru6olK
         m3q9S88njdkz9icu9lhsVygvzlJEvSQtQE2z6iFOV4SO9x/sJPA0JL5P8FI9EVdQTX8c
         RYmQ==
X-Forwarded-Encrypted: i=1; AJvYcCUremK039FuAAMEWH149av36v1Si2QYNTVC4BZF3MZ4IB9XiCHhrXioLxyiml9f8t9gABtyy6d6EWmJXT4Z@vger.kernel.org
X-Gm-Message-State: AOJu0Yy7ksUDMlyF/WH24aSXE5IXIQv/MOBi19yRp2xZNvF1xrmUQ3EZ
	5K0yNCcYA/sWieebtLk9a3RBkTHBvLIAsGb5u4gnezudPcdGWiJOd3At4s33+kcJM84=
X-Gm-Gg: ATEYQzwEdewIqWiYMHjMWwWTTdD0BiPSeDd/d01W4oT0MRLm/7nm2cEUfCs64b43nDQ
	q+UoHURUxARlDB468AkMGGtuYQjmYN0d/v1iPm0cNos2dsviA+UbZXxZeAGHMoIVAYNphXIf5/I
	0HTdjhAtA7KMEUPPUmiFac+X6VhNaoWq4qiXGWAirIg9xF3E+K8iTKshlNj4Cz+p1Mvf3l98rme
	k0kirUqR2V5m4JH/QCtnSjsVZw/e7kriwxn8p1FW4Fe+DYIn2mplOCjJHhsbo1hW8FrFVPcxfCR
	3wFSjZ1g2fXEr9MGsw6HLbOJ6ZYCTCFH7Y4MrnOb3gb9GcmX57lkR8A+A5X9tWEuEkXoejSjiF0
	7Hj/DMST+mC53R8mXgSlkpcIjVxC7zeO0rTp+MF8rQkMwuRnE9rEKO8dZW0AZBWertxhmVnlFqP
	X4S5ymM1RDxdYjKBQm6e8q3V7RbqrqOXM2wEBzlUkn8CX1LtG2TppAreQazvFWbyGCeN5ReSUw5
	bMzmbhI9xhU+979
X-Received: by 2002:a17:906:fe43:b0:b90:4b42:a982 with SMTP id a640c23a62f3a-b97653ffae2mr226821866b.41.1773417643100;
        Fri, 13 Mar 2026 09:00:43 -0700 (PDT)
Received: from [172.16.240.100] (144-178-202-138.static.ef-service.nl. [144.178.202.138])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6634fbb94afsm1397100a12.4.2026.03.13.09.00.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Mar 2026 09:00:42 -0700 (PDT)
From: Luca Weiss <luca.weiss@fairphone.com>
Date: Fri, 13 Mar 2026 17:00:39 +0100
Subject: [PATCH 2/3] arm64: dts: qcom: qcm6490-fairphone-fp5: Add front
 camera support
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260313-fp5-s5kjn1-v1-2-fa4f1c727318@fairphone.com>
References: <20260313-fp5-s5kjn1-v1-0-fa4f1c727318@fairphone.com>
In-Reply-To: <20260313-fp5-s5kjn1-v1-0-fa4f1c727318@fairphone.com>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Luca Weiss <luca.weiss@fairphone.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1773417640; l=2537;
 i=luca.weiss@fairphone.com; s=20250611; h=from:subject:message-id;
 bh=lOT4+GNlLxxuDwDS5ER52dtudGIhBdpwGUH/epyYHBM=;
 b=xccFob+A29oD7i5aaUkyrNGJa1PukC1guO5m8Fho7wLZ5EgijdQ72vTWlBrlqHEcaUrmAvnZy
 a3mCAWwGHrLCTgLNfrsuCS7oOkyCKoU4MYb+gbLBHJsJv5REO4cNx+Q
X-Developer-Key: i=luca.weiss@fairphone.com; a=ed25519;
 pk=O1aw+AAust5lEmgrNJ1Bs7PTY0fEsJm+mdkjExA69q8=
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[fairphone.com,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[fairphone.com:s=fair];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[12];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-97568-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[fairphone.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[luca.weiss@fairphone.com,linux-arm-msm@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	DBL_PROHIBIT(0.00)[0.0.0.10:email];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,fairphone.com:dkim,fairphone.com:email,fairphone.com:mid,0.0.0.51:email,0.0.0.3:email]
X-Rspamd-Queue-Id: 8AED72869A5
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Add and configure the necessary nodes to enable the front camera
(Samsung S5KJN1), connected to CSIPHY 3.

Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
 arch/arm64/boot/dts/qcom/qcm6490-fairphone-fp5.dts | 54 +++++++++++++++++++++-
 1 file changed, 53 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/qcm6490-fairphone-fp5.dts b/arch/arm64/boot/dts/qcom/qcm6490-fairphone-fp5.dts
index c9c24c36ba7e..f00a8f3e7f6e 100644
--- a/arch/arm64/boot/dts/qcom/qcm6490-fairphone-fp5.dts
+++ b/arch/arm64/boot/dts/qcom/qcm6490-fairphone-fp5.dts
@@ -12,6 +12,7 @@
 #include <dt-bindings/iio/qcom,spmi-adc7-pm7325.h>
 #include <dt-bindings/iio/qcom,spmi-adc7-pmk8350.h>
 #include <dt-bindings/leds/common.h>
+#include <dt-bindings/media/video-interfaces.h>
 #include <dt-bindings/pinctrl/qcom,pmic-gpio.h>
 #include <dt-bindings/regulator/qcom,rpmh-regulator.h>
 #include <dt-bindings/sound/qcom,q6asm.h>
@@ -626,6 +627,24 @@ vreg_bob: bob {
 	};
 };
 
+&camss {
+	vdda-phy-supply = <&vreg_l10c>;
+	vdda-pll-supply = <&vreg_l6b>;
+
+	status = "okay";
+
+	ports {
+		port@3 {
+			csiphy3_ep: endpoint {
+				clock-lanes = <7>;
+				data-lanes = <0 1 2 3>;
+				bus-type = <MEDIA_BUS_TYPE_CSI2_DPHY>;
+				remote-endpoint = <&camera_s5kjn1_ep>;
+			};
+		};
+	};
+};
+
 &cci0 {
 	status = "okay";
 };
@@ -666,7 +685,33 @@ &cci1 {
 };
 
 &cci1_i2c1 {
-	/* S5KJN1SQ03 @ 10 */
+	camera@10 {
+		compatible = "samsung,s5kjn1";
+		reg = <0x10>;
+
+		vddio-supply = <&vreg_l6p>;
+		vddd-supply = <&vreg_l2p>;
+		vdda-supply = <&vreg_l3p>;
+
+		clocks = <&camcc CAM_CC_MCLK3_CLK>;
+		assigned-clocks = <&camcc CAM_CC_MCLK3_CLK>;
+		assigned-clock-rates = <24000000>;
+
+		reset-gpios = <&tlmm 78 GPIO_ACTIVE_LOW>;
+		pinctrl-0 = <&cam_mclk3_default>;
+		pinctrl-names = "default";
+
+		orientation = <0>; /* Front facing */
+		rotation = <270>;
+
+		port {
+			camera_s5kjn1_ep: endpoint {
+				data-lanes = <1 2 3 4>;
+				link-frequencies = /bits/ 64 <700000000>;
+				remote-endpoint = <&csiphy3_ep>;
+			};
+		};
+	};
 
 	eeprom@51 {
 		compatible = "giantec,gt24p128f", "atmel,24c128";
@@ -1332,6 +1377,13 @@ usb_redrive_1v8_en_default: usb-redrive-1v8-en-default-state {
 		output-high;
 	};
 
+	cam_mclk3_default: cam-mclk3-default-state {
+		pins = "gpio67";
+		function = "cam_mclk";
+		drive-strength = <2>;
+		bias-disable;
+	};
+
 	mdp_vsync: mdp-vsync-state {
 		pins = "gpio80";
 		function = "mdp_vsync";

-- 
2.53.0


