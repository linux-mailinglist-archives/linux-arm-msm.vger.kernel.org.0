Return-Path: <linux-arm-msm+bounces-89881-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4FDED5Lfb2n8RwAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-89881-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 20 Jan 2026 21:03:30 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id E4A864AF7B
	for <lists+linux-arm-msm@lfdr.de>; Tue, 20 Jan 2026 21:03:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 990B78CD4E5
	for <lists+linux-arm-msm@lfdr.de>; Tue, 20 Jan 2026 19:37:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 425AA421F1B;
	Tue, 20 Jan 2026 19:36:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Jch5is9l"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A02337C0FF
	for <linux-arm-msm@vger.kernel.org>; Tue, 20 Jan 2026 19:36:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768937810; cv=none; b=hHyErmW0ETGzqR6DzKmN0asWyJ2fVMjnsc3CIFL/9HMs7I9/TFhwBxjyyVC+Lc46jQIv8JX6KH3klnDB7GcIoiCTfnD9R1cU9ICpQu9tsqm/O2UDkCiwt0+uvW3ESgEKr9ojK2d2kR+wbCGFfTAGFrBYFYIXio4n2pLeBZMo6jc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768937810; c=relaxed/simple;
	bh=t6wsKS4Mv3ldNLxq4tVreWNmfuoojtATZJcpIorvR7Q=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=DUxuCffSd7UaqU+HhYLHEclaR83FammvdSyMuN5eLzJjLeuqHNrWHAB9qGP8aTPv5j4ScOCUB/bzTJRupZjXruDDy4UH0EX6JgrPjl/4LaFpZ58mnMkVDEppDthvzHJybD1XYpBLd32pAcy0HNU7VFQK4kiiks430JmbdalskuE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Jch5is9l; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4801c314c84so37576375e9.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 20 Jan 2026 11:36:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768937807; x=1769542607; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=I12N906HgVHTbvGqoi2UPUu+CNEO7P3/9i+Vob4xl7c=;
        b=Jch5is9l4OUhYJP9sHZbW/bki9DSPuO7Z73ZiJV08Hgo9W4P1gjY/OYt8d2uzjapjO
         RYp7mOW99vK5Z60QblP1n3QmyTrIK6SXPAQjMcQcLkLRj89LuO1zhZS5BVV1KvUG/oXh
         tazKud6S3wBRd4CkVPXVntoFH3mZDP700z3rBFnC+I2A6h/WPzpjqeCdK70WUfIzfuOh
         cDqT5xelKnxOQF/jvGSR+QPz6sEgf/lFNoWqK9tOIETkroXEjOgREZ/lvss6r8QcsMfX
         +hSeuUnfKTqhJ0u+ezUaVqeLlWi290vyYFLgw7gEBxe3N5AbjNPjKtkBIIqHFz8J5kml
         4dWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768937807; x=1769542607;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=I12N906HgVHTbvGqoi2UPUu+CNEO7P3/9i+Vob4xl7c=;
        b=OOqA5ALEGzagWKfrnMaHBEgxvj52CbGBPj1CSN4gQRvWKlFIlK4f/L32NfSN/6tEDD
         Td3RCWQW9UpPbCgDWC9uBTIY4Mlxf7UyGjLakDxiidY1JjyloJX4G/uk6NztHRGxWO+u
         E/bd1iuVBq09Ewiv/isB8bytvaDIMEKwrcFc5W7wxJE7F6oyR0g2Zr7X0wMj/f5Klh6x
         RFhtdZPXTH8j/lT5GuAC8ZLn9382gUHYYCS3KIedUPOC+U1SedKgKYWXxLNIreTSRdC6
         W7nvMlINkaWQ/d1CFqDqxPdjZ3pAfgSAVSlJLSGM92J0wZ4iuoqyCcbF9eKOZVDIbPk/
         MjFw==
X-Forwarded-Encrypted: i=1; AJvYcCVWej80oyFPbR8gAmGjdaegXlSrNUsXGHVTkZ7q+Gcpj8kFTYnNy2DHtifuuK/3fQ0FhdPJ92MVV52mil9U@vger.kernel.org
X-Gm-Message-State: AOJu0YxWj4+oHP6howExS0rC6oGknqVHWoGE4hFFsf0tOJtdUt+IpM3d
	v9SMl2ZD0+OSgHH4KWbk0qubo94e3xiffu3U+mryutnBKWHRSf3cXqOf
X-Gm-Gg: AY/fxX5mdCYfGy4aGVEoLvuwKA24Arss489U5NQB8LbSesWapWuw3fucLEveyB6zCm3
	AcNcqh2Onfm9AwRW7qtUQelCmIox/OYNfFocBOoazmmQQwXsE1GzSfxvqVa+cfBNIvUGcZ3uhfJ
	UzodPJ3eGxakz8NkUMYDqd5x2uRMAkGAcDvSMcrEs0rEVPerpxA/pMUHeslGFp+BiZoIdeKCH9p
	E5C33Oj9A29/j5kASXaqhGgMPivAdXXEL3LGbRgR4YjHotWkKupeJBHjjFCPUbPquWn2EusPPVI
	QnMPJyqg8ezAXBt+Yy3Qfrmn2bUUlRVJGhJnS5PvYC41O3ZqRNejuiLnWCKKKt3lkR1k6iS7VIA
	XYXRonjh6gswayX3InM5hExYI2zo64vmoGaEQSFo+PP3jW8yzFwnsRqVW38wZ67w7WjnBXU7b6Q
	UXIeX1PXQ1JYUE+rLLnZI0
X-Received: by 2002:a05:600c:1387:b0:477:df7:b020 with SMTP id 5b1f17b1804b1-4801e34301amr200601805e9.18.1768937806632;
        Tue, 20 Jan 2026 11:36:46 -0800 (PST)
Received: from unknown.zextras.com ([78.208.157.140])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-4801e8c05c3sm256267695e9.11.2026.01.20.11.36.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Jan 2026 11:36:46 -0800 (PST)
From: Gianluca Boiano <morf3089@gmail.com>
To: andersson@kernel.org
Cc: konradybcio@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Gianluca Boiano <morf3089@gmail.com>
Subject: [PATCH] arm64: dts: qcom: sdm630: add SPI7 interface
Date: Tue, 20 Jan 2026 20:36:34 +0100
Message-ID: <20260120193634.1089688-1-morf3089@gmail.com>
X-Mailer: git-send-email 2.52.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-0.46 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TO_DN_SOME(0.00)[];
	DMARC_POLICY_ALLOW(0.00)[gmail.com,none];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-89881-lists,linux-arm-msm=lfdr.de];
	FREEMAIL_CC(0.00)[kernel.org,vger.kernel.org,gmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:7979, ipnet:213.196.21.0/24, country:US];
	FREEMAIL_FROM(0.00)[gmail.com];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[morf3089@gmail.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	R_SPF_SOFTFAIL(0.00)[~all:c];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_COUNT_FIVE(0.00)[5];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[ams.mirrors.kernel.org:rdns,ams.mirrors.kernel.org:helo,0.62.65.128:email]
X-Rspamd-Queue-Id: E4A864AF7B
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Add spi7 interface to SDM630 device tree.

Signed-off-by: Gianluca Boiano <morf3089@gmail.com>
---
 arch/arm64/boot/dts/qcom/sdm630.dtsi | 34 ++++++++++++++++++++++++++++
 1 file changed, 34 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sdm630.dtsi b/arch/arm64/boot/dts/qcom/sdm630.dtsi
index 8b1a45a4e56e..92afb5428e3c 100644
--- a/arch/arm64/boot/dts/qcom/sdm630.dtsi
+++ b/arch/arm64/boot/dts/qcom/sdm630.dtsi
@@ -1013,6 +1013,20 @@ data-pins {
 					drive-strength = <2>;
 				};
 			};
+
+			spi7_default: spi7-default-state {
+				pins = "gpio24", "gpio25", "gpio26", "gpio27";
+				function = "blsp_spi7";
+				drive-strength = <6>;
+				bias-disable;
+			};
+
+			spi7_sleep: spi7-sleep-state {
+				pins = "gpio24", "gpio25", "gpio26", "gpio27";
+				function = "blsp_spi7";
+				drive-strength = <6>;
+				bias-disable;
+			};
 		};
 
 		remoteproc_mss: remoteproc@4080000 {
@@ -1944,6 +1958,26 @@ blsp_i2c7: i2c@c1b7000 {
 			status = "disabled";
 		};
 
+		blsp_spi7: spi@c1b7000 {
+			compatible = "qcom,spi-qup-v2.2.1";
+			reg = <0x0c1b7000 0x600>;
+			interrupts = <GIC_SPI 103 IRQ_TYPE_LEVEL_HIGH>;
+
+			clocks = <&gcc GCC_BLSP2_QUP3_SPI_APPS_CLK>,
+				 <&gcc GCC_BLSP2_AHB_CLK>;
+			clock-names = "core", "iface";
+
+			dmas = <&blsp2_dma 8>, <&blsp2_dma 9>;
+			dma-names = "tx", "rx";
+
+			pinctrl-names = "default", "sleep";
+			pinctrl-0 = <&spi7_default>;
+			pinctrl-1 = <&spi7_sleep>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+			status = "disabled";
+		};
+
 		blsp_i2c8: i2c@c1b8000 {
 			compatible = "qcom,i2c-qup-v2.2.1";
 			reg = <0x0c1b8000 0x600>;
-- 
2.52.0


