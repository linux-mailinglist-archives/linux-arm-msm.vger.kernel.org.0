Return-Path: <linux-arm-msm+bounces-107403-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +ItdFAG0BGowNQIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-107403-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 13 May 2026 19:25:21 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id BDE1F537FD5
	for <lists+linux-arm-msm@lfdr.de>; Wed, 13 May 2026 19:25:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id D535E300E608
	for <lists+linux-arm-msm@lfdr.de>; Wed, 13 May 2026 17:25:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DDF384A13A1;
	Wed, 13 May 2026 17:25:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cDTQ5sHa"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-qt1-f173.google.com (mail-qt1-f173.google.com [209.85.160.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7EFF4DBD80
	for <linux-arm-msm@vger.kernel.org>; Wed, 13 May 2026 17:24:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778693102; cv=none; b=gZPDsy5njjMH35kDPIsgagFhwqs1xq/TzIiaVqikahbcH+eZYl1/OliNMssh5Gc7yrBzvKaZr+ChmIvwQzxOoVtJwXOLcibFhkItakPgOeDB0CZmqQvkSQzeWq956CRbjBs+jUGBZ9g6vREo+uE0q53+EnM/84KtLy1oQJHaE1E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778693102; c=relaxed/simple;
	bh=wJ6p36sQ7ksIIiWfPWxaQgJmH9W8pqsZ3aoTLGeXLQE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=n4ohR25P/s81mBDIC7eb6C4C1V4xPx3YktLig06MvEJZIB7QzfmwY85EHOcWvSNx115IBj3SB59hMjAsfho+GgtT4nKAqIZ2wxI8eHFZ+V7/ZLYjPlgQlhNpBlDG78vMWCR9aPBCltSfIQc/HwOkQMTSU8620JIF4jnS9Zfwayc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cDTQ5sHa; arc=none smtp.client-ip=209.85.160.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qt1-f173.google.com with SMTP id d75a77b69052e-50fb18c55beso71715031cf.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 13 May 2026 10:24:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778693098; x=1779297898; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZU1btMobI51IRRL4Ho1mz96alwmNtMYLu0zpeinvrcs=;
        b=cDTQ5sHaY95WHkKQyjD69sD01pZELRxodu/HZ3UHUsiT2ep6xFv4ahTcCDRYYe0J59
         jeWJZt0N3Q4zP8iOgKMO76tw3OD+Po3zQsTF8HYvrp+ppJ7Wnsq9fC2C2JPqdlKkWNIx
         0wWSjhoWmrT6w32kbJZqXLBgHwUv6N+/AmsWw29y5P69nudURuhXvQ4OeeTfEDMNgMv9
         rSxnLEIkj7JSKZonwChPqeirTCxjoBwnXzsorlGx4WO6LbEPpOgcOfaY4Vy2Gj/YwaDx
         kDPv881aVx45Zsv90tkhVG5VMAMXKdkU4oXofsRe46h/5jnZ8xpMLw0FDEB4Ef09+1l7
         2APQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778693098; x=1779297898;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ZU1btMobI51IRRL4Ho1mz96alwmNtMYLu0zpeinvrcs=;
        b=F6pxN3t7dxVrCf4MD60gl3sLepDppPEaqkEnO5+OdJ267wkaMvot8tc3uCwjgeFJk+
         pOFYjCOFxvdz2uWBSO7HonG3rGL2NFpLqW5OwnUySdhYddaTKjtHaUc49umdYP2pfZVh
         WbXQZkfqUyN90RVvj9UELzsN2f3lZJHZQ2AkH2y+J1f8eB1C/uhTvZ+YrmoEmuSX8DBk
         BPsTQscOFr9xZxEVanzZF34racXro0fXbECmGXmBnOpj5iphONBCpvzyeEUSGI8WU4XU
         VFQzVIVUfX+qob1JoQeE25VIrl5d2En4s2cR4RISJuIG83+3g18lBaMYP4So9Gx5V0mi
         4Wtg==
X-Forwarded-Encrypted: i=1; AFNElJ9pyFkDa7pxeJkJf9wSBkkF62LuChToQbAYWKoVkIMZhD19nsnP5KPhfH+X2dQ8Ii45mKdNAZpeTyHzKTpu@vger.kernel.org
X-Gm-Message-State: AOJu0Yx1SaK0IcZ6cWyuaJGH28hgc/01SiJffJ3uji+wJ/+SfGHMaUFL
	c0oh4qHN5HquLxPm22Hldw+uhsdJ0TYBs1Kcf+VXx3fProiAmVJ7WAyG
X-Gm-Gg: Acq92OHleIYCRDqRR7fVPTXJDJsXbjhciSmtSfExJBRbBFjGl1s7hisKkirZ0lhobDW
	2JdwIFMeDafNoVudG9IDDejcuKKStljvyQHtA8SN7A0wDDjWUnl7/cFl7EYV3e5prhTkA7gecke
	XFrJZgewl3O7x5bfOPiSG4YJNN7JKb9Vuwj0NfLA3h8BGFFJVrSXN5SgsoxxAvgjLWM4yIcmAbE
	DqXJNvzxnc37T5/1wZE/WeVJvUxrnaM0YD3/TP3AeGgcxsEi6HWAIPOrEM3hX1Af8yO5fkhh1Zt
	f/37jiLQ5l2IOdkoXlnsb65YjLBRqF6LronMNuLwcU7QcLCzsdc/JFZoYFM9wHKXaRvM2BV3Vo6
	ckmiierXk9mNhfR/ITOCEB4sVP8Tee1u6ihylwo5f88CyaTixS2iJELbLSB4t9fttr+y3gwhKm9
	5B3KoGHnre8CuHhLbMvqmxAeTz0A==
X-Received: by 2002:a05:622a:124f:b0:50f:dd9f:1223 with SMTP id d75a77b69052e-5162f5fe405mr58670381cf.44.1778693098486;
        Wed, 13 May 2026 10:24:58 -0700 (PDT)
Received: from localhost ([142.181.178.53])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-5148fd8bfe0sm151895461cf.0.2026.05.13.10.24.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 May 2026 10:24:58 -0700 (PDT)
From: Richard Acayan <mailingradian@gmail.com>
To: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
	Jessica Zhang <jesszhan0024@gmail.com>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Thierry Reding <thierry.reding@gmail.com>,
	Sam Ravnborg <sam@ravnborg.org>,
	dri-devel@lists.freedesktop.org,
	Yifei Zhan <yifei@zhan.science>,
	Richard Acayan <mailingradian@gmail.com>
Subject: [PATCH v4 2/2] arm64: dts: qcom: add support for pixel 3a xl with the tianma panel
Date: Wed, 13 May 2026 13:25:49 -0400
Message-ID: <20260513172549.1345-3-mailingradian@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260513172549.1345-1-mailingradian@gmail.com>
References: <20260513172549.1345-1-mailingradian@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: BDE1F537FD5
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[linaro.org,gmail.com,ffwll.ch,linux.intel.com,kernel.org,suse.de,ravnborg.org,lists.freedesktop.org,zhan.science];
	FREEMAIL_FROM(0.00)[gmail.com];
	TAGGED_FROM(0.00)[bounces-107403-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[19];
	MIME_TRACE(0.00)[0:+];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mailingradian@gmail.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Action: no action

The Pixel 3a XL has variants with either a Samsung Display Controller (SDC)
panel or a Tianma panel. Add the device tree for the variant with the
Tianma panel.

Signed-off-by: Richard Acayan <mailingradian@gmail.com>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Assisted-by: "Claude Code Review Bot":claude-opus-4-6
---
 arch/arm64/boot/dts/qcom/Makefile             |  1 +
 .../dts/qcom/sdm670-google-bonito-tianma.dts  | 32 +++++++++++++++++++
 2 files changed, 33 insertions(+)
 create mode 100644 arch/arm64/boot/dts/qcom/sdm670-google-bonito-tianma.dts

diff --git a/arch/arm64/boot/dts/qcom/Makefile b/arch/arm64/boot/dts/qcom/Makefile
index 169cc9b9ccd3..d909c527d848 100644
--- a/arch/arm64/boot/dts/qcom/Makefile
+++ b/arch/arm64/boot/dts/qcom/Makefile
@@ -303,6 +303,7 @@ dtb-$(CONFIG_ARCH_QCOM)	+= sdm632-fairphone-fp3.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= sdm632-motorola-ocean.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= sdm636-sony-xperia-ganges-mermaid.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= sdm660-xiaomi-lavender.dtb
+dtb-$(CONFIG_ARCH_QCOM)	+= sdm670-google-bonito-tianma.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= sdm670-google-sargo.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= sdm845-db845c.dtb
 
diff --git a/arch/arm64/boot/dts/qcom/sdm670-google-bonito-tianma.dts b/arch/arm64/boot/dts/qcom/sdm670-google-bonito-tianma.dts
new file mode 100644
index 000000000000..42ddaf53d150
--- /dev/null
+++ b/arch/arm64/boot/dts/qcom/sdm670-google-bonito-tianma.dts
@@ -0,0 +1,32 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Device tree for Google Pixel 3a XL with the Tianma panel.
+ *
+ * Copyright (c) Richard Acayan. All rights reserved.
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
+	height = <2160>;
+};
+
+&panel {
+	compatible = "novatek,nt37700f";
+};
+
+&rmi4_f12 {
+	touchscreen-x-mm = <69>;
+	touchscreen-y-mm = <137>;
+};
-- 
2.54.0


