Return-Path: <linux-arm-msm+bounces-96421-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gJVGJjNlr2koXAIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-96421-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Mar 2026 01:26:27 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id F376924306B
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Mar 2026 01:26:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 8962830BE1CA
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Mar 2026 00:26:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0737921ABB9;
	Tue, 10 Mar 2026 00:26:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Goa2CZPU"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-qv1-f47.google.com (mail-qv1-f47.google.com [209.85.219.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 397C81FDA61
	for <linux-arm-msm@vger.kernel.org>; Tue, 10 Mar 2026 00:26:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773102367; cv=none; b=kH9FEkV/VMtFgsiPn7ac1aK6AEgMk27SCy3XZ3uF9SDYmGb8RRrUnu2Nqsy76gt2T/fI6DoSj4BDarL8YUxv9v3Prs882uOBx/aTXrgC+KpfWyqM8WVuwHc1/9Nk9OZPeM43IGsaoLg9NjQWaA78EUOkrtgtJ3T1nhB+dym5WSA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773102367; c=relaxed/simple;
	bh=X1qzc/nIJzA160wcE7pmFrjlw+6pYusD0HI28tV+tqw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=DRWIqkp/kD73lq5EVRB2bD3PfUgf5KtDM2XIezl5yjlpmJmnqtXtlH5IlQuiN/UohIbRoqBI03RsbC+zKtxvSiOxbBjXim3cKjCdBOHx8TXZjNdcsXGIdfwPY6/IEk+Bm0BAPf2GR7cwWQabQ6BOjbfS06eiQ5ILwwsEsQ5OtW0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Goa2CZPU; arc=none smtp.client-ip=209.85.219.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qv1-f47.google.com with SMTP id 6a1803df08f44-89a06bc2f1bso141101566d6.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 09 Mar 2026 17:26:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773102365; x=1773707165; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5G48QN/VZ+uF+MLVtrv0+QLtpT3vFjLAIc/m9hMjl30=;
        b=Goa2CZPUduspLOd1iOWNm0mm+TsdtgzMvRBoP1RVcJJhHdndnDHay4aJRG8ImjWjdU
         e9YdsQqVd4xloZYaSdBQYqGo5UmxUwAb4jjVYise69b8bhvBodThWCHP4b5IY+U8dm4e
         7Eg8hmEjb95gjxOaB0iWVZYL3oivflwkX/qkicQdLFU2Nn4WEA6uyHOLrPg4RyAa2fwn
         srrWVYT8+rcOY8rM243lRx431KShrcfMm/kWVrNsoC4lMjQXg8rFBXqmKQDiU1MxEHOW
         G7ov3zk7Ve5TOzUqtDCMwMhDTpkydj4XKwQuPd7eyVlyPaqyWB134Ctog623u4vwa77L
         41Bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773102365; x=1773707165;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=5G48QN/VZ+uF+MLVtrv0+QLtpT3vFjLAIc/m9hMjl30=;
        b=rOslTFxRFi+GDbCNSzgUb1ifMilvkX8IS4wkdDWhpQbOzreewKwcRihK5oK2lsFhMN
         ZFdHuoq/VzQV5TVJ/MinI22Chg1oeHtayzhWLT3Mb1cb429sfCdiv1oPepFjG8+gDDAO
         1Lch3n6nu1UaJXN/gVe2bDI6yINWoVNasjp7th1CKt8LdQhQrGqGXKuwKHromR4oqQrc
         ayob7I/pbMW2nC3fR5hVKvCL4TzoG8ZOBt7Kb/Uumhnz1jNarQhKCUAI6CF2sAczDtlU
         XpW8jdgzr65Ac+iWnCABcDxn7vECfQGmQJcjnBxdawCiZUOgU/EPrXnCiMfoxoOw6Pfw
         tLug==
X-Forwarded-Encrypted: i=1; AJvYcCWyMFvTEVuoAiBasW7CKu5PwYZE1HJD83HuRj7G6m1d5lHb1e0naCxSaKFV77ac1zxeDKOhjxfcGGDI6VrZ@vger.kernel.org
X-Gm-Message-State: AOJu0YzDicvIP6eZc1JptixMUo4dL5K1aWFOjqYgyvLzNJiMa7wUFdsa
	q6hVvvkbG7M0Pw0Avxd6o4nWKczg1dQClULVj5WTBpVS+rdj7EmOwe8p
X-Gm-Gg: ATEYQzym/Oh6uq7GE7ioTWXUnBm6oz7zxv/sZ190Le26ei/nDCnyjlHt2PXPfbCsvGd
	eRBeH1fSrpk7j7lLeQONIESd99TiRJtwyTL0ZilNtIllbV/hmVztiaLQ+XA3aEhUiRKb6D/8D1K
	XHDM+8iYmuQifz2iGen5nyb/xGeE3KGBT/pyj6MEy5C0/9k71bz/6J1/ony07fHix+IFL0XUZWX
	oQlJcyL3QpyOiuIKnk6PBzU6jfvKUaNC03+BMs3e/wRatTynI/ulHemr0zuMacEWTp0gMhXe0gE
	WiNgIpdniMP/TTrbGmORvFRU3OWIZxrg4zOgDyvOXZP1zrvZGigB5FS/zTQLNF3q0E8ANcwiSV9
	vTxiowNK3wej+aW2QM7RhDLhSpbHIQ6Sgl4//P3t6SnNCO9CuROCXieUX7H7IhRIqzKRWpt0rBB
	k6k8GVI3hsKOXdW2BicH7JlIKI+iwKN3dPRXJLutooMWpB3hJ10xbf2H0NMINsKTfqZ7UJQFlYN
	Ta20IVC4519GmA=
X-Received: by 2002:a05:6214:e4c:b0:897:255:d5c2 with SMTP id 6a1803df08f44-89a30a4d3cdmr196960136d6.26.1773102365255;
        Mon, 09 Mar 2026 17:26:05 -0700 (PDT)
Received: from localhost (bras-base-toroon21-grc-75-184-144-58-243.dsl.bell.ca. [184.144.58.243])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-89a57c48e3fsm8094586d6.51.2026.03.09.17.26.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Mar 2026 17:26:04 -0700 (PDT)
From: Richard Acayan <mailingradian@gmail.com>
To: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Jessica Zhang <jesszhan0024@gmail.com>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Thierry Reding <thierry.reding@gmail.com>,
	Sam Ravnborg <sam@ravnborg.org>,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	dri-devel@lists.freedesktop.org
Cc: Yifei Zhan <yifei@zhan.science>,
	Richard Acayan <mailingradian@gmail.com>
Subject: [PATCH v3 5/5] arm64: dts: qcom: add support for pixel 3a xl with the tianma panel
Date: Mon,  9 Mar 2026 20:26:06 -0400
Message-ID: <20260310002606.16413-6-mailingradian@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260310002606.16413-1-mailingradian@gmail.com>
References: <20260310002606.16413-1-mailingradian@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: F376924306B
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-96421-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[19];
	MIME_TRACE(0.00)[0:+];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[kernel.org,linaro.org,gmail.com,ffwll.ch,linux.intel.com,suse.de,ravnborg.org,vger.kernel.org,lists.freedesktop.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mailingradian@gmail.com,linux-arm-msm@vger.kernel.org];
	FREEMAIL_CC(0.00)[zhan.science,gmail.com];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	FROM_HAS_DN(0.00)[]
X-Rspamd-Action: no action

The Pixel 3a XL has variants with either a Samsung Display Controller (SDC)
panel or a Tianma panel. Add the device tree for the variant with the
Tianma panel.

Signed-off-by: Richard Acayan <mailingradian@gmail.com>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/Makefile             |  1 +
 .../dts/qcom/sdm670-google-bonito-tianma.dts  | 32 +++++++++++++++++++
 2 files changed, 33 insertions(+)
 create mode 100644 arch/arm64/boot/dts/qcom/sdm670-google-bonito-tianma.dts

diff --git a/arch/arm64/boot/dts/qcom/Makefile b/arch/arm64/boot/dts/qcom/Makefile
index f80b5d9cf1e8..7c158871ed1c 100644
--- a/arch/arm64/boot/dts/qcom/Makefile
+++ b/arch/arm64/boot/dts/qcom/Makefile
@@ -264,6 +264,7 @@ dtb-$(CONFIG_ARCH_QCOM)	+= sdm632-fairphone-fp3.dtb
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
2.53.0


