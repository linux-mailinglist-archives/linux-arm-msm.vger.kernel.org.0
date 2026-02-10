Return-Path: <linux-arm-msm+bounces-92391-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eMChAs6Yimk8MQAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-92391-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Feb 2026 03:32:46 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 78C24116544
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Feb 2026 03:32:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 1EF6D3009F2B
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Feb 2026 02:32:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 841852DAFB0;
	Tue, 10 Feb 2026 02:32:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="F95flPac"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-qt1-f171.google.com (mail-qt1-f171.google.com [209.85.160.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B0C52765C4
	for <linux-arm-msm@vger.kernel.org>; Tue, 10 Feb 2026 02:32:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770690759; cv=none; b=KjHFWGwSSgeYgTdzUg+B6RoWUmjSiEGgeH6U1v8eEfXUHEAuOO6kRxsRMN2ZjNgj+c6HPtTqHx4FDFtTNWSh5jIZqaldl1yZfSO5W8EOXA84bWdharwnGijo+PW/8Ekg/04YTdvPgG2eZ36W0Y/tvqwaXjwMzyisMkZRel7I6zc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770690759; c=relaxed/simple;
	bh=lwZSbHE30QsRL7IwCasBuVrIFC4i8WvZhyooPCeqYGU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=CpAMOS+VtOmaKM3wR+WXhmy3DfPdnUfObQENcoeb4HlV4V41tIswZDH4loL7SGgp2ya7DltaxZbCJzC7qRM0ZWeA1VGhjgUKiqqeXL0hAO42Aj5NFX/I72MIzJYjb38E7nrbDe4rRSgiuCZiN7Uh2cLSHmXSRNczpQPjGBOUqNk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=F95flPac; arc=none smtp.client-ip=209.85.160.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qt1-f171.google.com with SMTP id d75a77b69052e-50145d27b4cso59661891cf.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 09 Feb 2026 18:32:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770690757; x=1771295557; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mzxhRgOkfuyCqh0sMHHhIrvSKl95YQKIKseeJPqQOJA=;
        b=F95flPacLlj8VvNvALKyexZTeGfzZvrI1qd5V7AIUMPXb8HTT+Q1XAFPJQTtc4M+OV
         KmUsNNXq09mGV0encn3TrmaBax0n7t9AUlTI2qAoFVCENK8/e7J9ldouarHzdxApz633
         1yTsrjaj+KSwtb+A6XdfhyPhQ0UCWYoBRvamhCJko34OcV2+MUKVlaczke8Sxw+vMtss
         gIFKmZozb6UzPuw6snf0mhBYOyQD2Uhixa5u3HxPgVXw2VEP0p3W34XFdxYTuL9yEZwq
         S/yuHLTXrpgeE1FQqsLfC4v5R/slgIDz5KcFAcQDbpJVYueQ6YMZNeJ0jMmBcEotZ1Ds
         fnpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770690757; x=1771295557;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=mzxhRgOkfuyCqh0sMHHhIrvSKl95YQKIKseeJPqQOJA=;
        b=X7JNpGZo9RtIiBHkIo24II/gYqm0UVWWr+j0ucXbmiD5STzMK0EnU3C0SrIKhBfUMU
         xo3IB3vSQb6t4EYIgUC9TPSISMYqCJWq1jbsHAT9Z6UHClcYEnhO/F1TRKwjddVoxMwU
         Q5L3A3JzEN6IBWIf+fcIguJPK1zczbbejOhiYtxN8rjV8O3o0xrK4dM5KTJSa69iCwr7
         v989t+nxl2QlMAwRiX0dFVd7WoFzb5i2d/SnIpHFboJ0BN88XwIHINFisXO/8CY8KSfd
         5MFUEwCc84THr5fZqBmd3ny7DwiWwIrEZ3P/MC16Jdjp3M7SgZ/EWLGRmpg/ZXNU28fz
         OUzQ==
X-Forwarded-Encrypted: i=1; AJvYcCW5QHpRTopjGsPUSIV+IjiSzxjFiGTgGh17CSsbZ5SEJq2Zh+dMvLKeOfK8t9gaEerzQ3HN3N8fGcxA+OFW@vger.kernel.org
X-Gm-Message-State: AOJu0Ywcsr3lQn/5kxbfgmF3M1MYvLOrTlblGL5vUGibrO5JGSTdSE0/
	YrBs4FAfErBW1Lf3WdUuJkitAdbXBmczCU+CbLTSkq9k8rIkUpTrNRm+
X-Gm-Gg: AZuq6aI9rwK9oxMMxnhiNsGUCXQxKPcmYDre60Ye23H9+MuBqfiz4coA/cggpwYLDQk
	jLZUR1YKLTkMb7OuOFIfCVfTLteORjVlh1DZKIJM9Rza7pcvXLWHtgoLip1RehpPfkPHn8UksQy
	lnH8HU/422UmXp3I+4xM2gG6w6AoXr3KTUFg/f6UvZpDnl5b0X1lHmJ/pDkNSJ6KY7eZW6NbOGu
	XHxuRMWiXAC86BQc8CRGkLzSTqItEfGSydje4IRIOCcwfP23eIzfGtG3kIbcBi9jIKcf+lx8lHh
	8Hjt8/0wfOhJ5CMj53CMa/khLGKZMb68DwjjuAcX/gJ81SRES8VDi5RElifQ6liLIIrQpLWB0sn
	dvG9f07k+ewbhgEHcRPRdgUb0EuVBk5F63PWeza4eg4nAfqayH+Oa9nMGACp5e6R3FVtEHCpyau
	G7GZuVlnIh2TGyYfK3PL5q/WSUXiYUPgCoIL/U7jdt+JDLQlH+yaQUJXfOzV6Ln8NwJvXUNR26F
	QtfpBTo27Rqz+tpuWqdTE5meA==
X-Received: by 2002:ac8:5fd3:0:b0:501:5024:23f4 with SMTP id d75a77b69052e-50639954f8cmr185241241cf.53.1770690757211;
        Mon, 09 Feb 2026 18:32:37 -0800 (PST)
Received: from localhost (bras-base-toroon21-grc-75-184-144-58-243.dsl.bell.ca. [184.144.58.243])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8953bf5b2e8sm89642606d6.23.2026.02.09.18.32.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Feb 2026 18:32:36 -0800 (PST)
From: Richard Acayan <mailingradian@gmail.com>
To: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Jessica Zhang <jesszhan0024@gmail.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Thierry Reding <thierry.reding@gmail.com>,
	Sam Ravnborg <sam@ravnborg.org>,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	dri-devel@lists.freedesktop.org
Cc: yifei@zhan.science,
	Richard Acayan <mailingradian@gmail.com>
Subject: [PATCH 6/6] arm64: dts: qcom: add support for pixel 3a xl with the tianma panel
Date: Mon,  9 Feb 2026 21:33:00 -0500
Message-ID: <20260210023300.15785-7-mailingradian@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260210023300.15785-1-mailingradian@gmail.com>
References: <20260210023300.15785-1-mailingradian@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-92391-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCPT_COUNT_TWELVE(0.00)[19];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[kernel.org,linaro.org,gmail.com,linux.intel.com,suse.de,ffwll.ch,ravnborg.org,vger.kernel.org,lists.freedesktop.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mailingradian@gmail.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[zhan.science,gmail.com];
	RCVD_COUNT_FIVE(0.00)[5];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 78C24116544
X-Rspamd-Action: no action

Some Pixel 3a XL devices have a Tianma panel. Add the separate device
tree for this to support these other devices.

Signed-off-by: Richard Acayan <mailingradian@gmail.com>
---
 arch/arm64/boot/dts/qcom/Makefile             |  1 +
 .../dts/qcom/sdm670-google-bonito-tianma.dts  | 38 +++++++++++++++++++
 2 files changed, 39 insertions(+)
 create mode 100644 arch/arm64/boot/dts/qcom/sdm670-google-bonito-tianma.dts

diff --git a/arch/arm64/boot/dts/qcom/Makefile b/arch/arm64/boot/dts/qcom/Makefile
index 6f34d5ed331c..6237aeb0e36d 100644
--- a/arch/arm64/boot/dts/qcom/Makefile
+++ b/arch/arm64/boot/dts/qcom/Makefile
@@ -245,6 +245,7 @@ dtb-$(CONFIG_ARCH_QCOM)	+= sdm632-motorola-ocean.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= sdm636-sony-xperia-ganges-mermaid.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= sdm660-xiaomi-lavender.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= sdm670-google-sargo.dtb
+dtb-$(CONFIG_ARCH_QCOM)	+= sdm670-google-bonito-tianma.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= sdm845-db845c.dtb
 
 sdm845-db845c-navigation-mezzanine-dtbs	:= sdm845-db845c.dtb sdm845-db845c-navigation-mezzanine.dtbo
diff --git a/arch/arm64/boot/dts/qcom/sdm670-google-bonito-tianma.dts b/arch/arm64/boot/dts/qcom/sdm670-google-bonito-tianma.dts
new file mode 100644
index 000000000000..da309434b511
--- /dev/null
+++ b/arch/arm64/boot/dts/qcom/sdm670-google-bonito-tianma.dts
@@ -0,0 +1,38 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Device tree for Google Pixel 3a XL with the panel connected to the Samsung
+ * Display Controller.
+ *
+ * Copyright (c) 2023-2024, Richard Acayan. All rights reserved.
+ */
+
+/dts-v1/;
+
+#include "sdm670-google-common.dtsi"
+
+/ {
+	model = "Google Pixel 3a XL (with Tianma panel)";
+	compatible = "google,bonito-tianma", "google,bonito", "qcom,sdm670";
+};
+
+&battery {
+	charge-full-design-microamp-hours = <3700000>;
+};
+
+&framebuffer {
+	reg = <0 0x9c000000 0 (1080 * 2160 * 4)>;
+	width = <1080>;
+	height = <2160>;
+	stride = <(1080 * 4)>;
+	status = "okay";
+};
+
+&panel {
+	compatible = "novatek,nt37700f";
+	status = "okay";
+};
+
+&rmi4_f12 {
+	touchscreen-x-mm = <69>;
+	touchscreen-y-mm = <137>;
+};
-- 
2.53.0


