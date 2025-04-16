Return-Path: <linux-arm-msm+bounces-54485-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 17BF1A8B5CB
	for <lists+linux-arm-msm@lfdr.de>; Wed, 16 Apr 2025 11:43:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 1769B175B0A
	for <lists+linux-arm-msm@lfdr.de>; Wed, 16 Apr 2025 09:43:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0A7602376EF;
	Wed, 16 Apr 2025 09:42:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canonical.com header.i=@canonical.com header.b="OnoDSnvw"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp-relay-internal-0.canonical.com (smtp-relay-internal-0.canonical.com [185.125.188.122])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5EECF235C1E
	for <linux-arm-msm@vger.kernel.org>; Wed, 16 Apr 2025 09:42:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.125.188.122
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744796571; cv=none; b=pfvN/bvKhwWfTiiyXNh3U8HsllQF4E6ulNAqSYwKzc9sEVEyUZc7naXGb1TOAjr9MB59BPKsN82q28UwBoSebKJ0xBSpAZwIzH7fACzbayzZiD9XLWd4cDz9paF7PS2y74d3Dr3Mcz9rGOFnEnI0ZU5LNCIexI6laDlt1vaFb2A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744796571; c=relaxed/simple;
	bh=Y/63oD9RI//ak+XqGfVjs2x5KwGCgZGcZzunh8VrI3I=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=OGrjWu7hkmQXWT/FYiYU8QiNwoPJAhdFiUgIEqRVJcXc2Rpm2ZDv20aVB0oGJH3jpVL1OvL7li42YB6yOZ21FyZ2JKB2mdlkQLR6oVndFG7NNtj7Me200XZzgsYjSTu+alqY1VumebT1wxC/N19b3c0AuCcgXnWgVgrV/XlF/FA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canonical.com; spf=pass smtp.mailfrom=canonical.com; dkim=pass (2048-bit key) header.d=canonical.com header.i=@canonical.com header.b=OnoDSnvw; arc=none smtp.client-ip=185.125.188.122
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canonical.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canonical.com
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com [209.85.218.72])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id 9BC7D3FB76
	for <linux-arm-msm@vger.kernel.org>; Wed, 16 Apr 2025 09:42:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1744796563;
	bh=/pR+D+ZciThBX6kN0q5NCT4lAw6xO2mUWDxTsJcToCY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version;
	b=OnoDSnvwOjgIAHbtFwN1l/m1LwqWeCl3rpnItkoz6JrZiUPrbM3cPCpaSh2Iu2jlC
	 rz2ZMjVa+yHuhlkFd9wZj2Aj7zQvKUQvecj5YHukicrAExFeQHCELj2z7cSKxRXtaZ
	 BCGa7j6PH9IPXd1R5oKY4KVvneoHu1KhtROlrekZLZnkizfyUKTzQqNb1j5nXpQa+z
	 tERsC1JWZcvnS/VjX0b3Uhv+EWslsNK/V2Vxnnu9gapa/ogF0DK0WkQOsKJyLmFDWb
	 Hgw969vMDMmFEgM7KvgywTiHgMxMWGeeqTjLD9NxtNRm2AdyyMliTIz1jdQ0m4zlGh
	 KwNE8JimZ1nrg==
Received: by mail-ej1-f72.google.com with SMTP id a640c23a62f3a-ac2a113c5d8so489556866b.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 16 Apr 2025 02:42:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744796563; x=1745401363;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/pR+D+ZciThBX6kN0q5NCT4lAw6xO2mUWDxTsJcToCY=;
        b=qiv4k9vaRT3gn2e7CsX4jWukbUw7ptk5uB+LTsMFLAr+aIZxtBstDwQQCHg/z87ca1
         b/eQ2HeHTnjTKJssb4P0wKN1YELuGaZvEZabR8QoHTQnixvzEL33nXBXfM3rUGPGArsR
         eLmRSspUq+nwddFxFIDgpYu9uAv3lFkDjE1yrb2tyiRcdE+sTCEN8Vo/7FU1d+pBY1Wf
         smeGTKCIrjjQSv7TyyQa2Ddt6moPtQN5IxXcpaugOpJn605Di2wO5oT4G9rOs6ZVTXbS
         Q4cPLU6kOn/+0sxQ9ykq3lZcsYd/0rh2g2OaJG/wP35N9bqQg2yNQsEFln7jEPSC9TN7
         QmIQ==
X-Forwarded-Encrypted: i=1; AJvYcCXS1S/a2fBmbAShwfEUkrsmwXcR9ieT8XOw+gw6iRgnYeb+VOye8F3RGc96BiSfWtONb0DTON53vecV7wOE@vger.kernel.org
X-Gm-Message-State: AOJu0YyVtX8x8mv3Z67eXhSojIzpS79atuvSwq96IYOHW79Cto0xBCLg
	qAweDiguLLXD39+PEm6nF/mYdKazVGzfBweHkgEoj0MkNkjUuXrZK9Oit/TuoUlkHI5LRxnI/wf
	9SPu/5ZpLWZhpkBcZLjB1oFI3lrbWRg1591rcrE0NoV2+WGjTLBqIEKc+27bmRsNM1PyKch9WEj
	dmynA=
X-Gm-Gg: ASbGncufDg/z+0qMs/u+dFsYdnlH7nd+F5xQzsUVLTNpZui+SIKoqYWzmGGtG+jGhcS
	D2pzQ5K2WwIpKULd7CwDAhArZiwbJjCBRnRUk0tXNzjml57j9XGkHEHZ6j8IGymUQzro+2o9eq+
	/+byYgdsLx4Y5pm5P5l8+pGz/hOh00+WvSLQbKTWW4GQlEZ3Gy+NciKmB3Ug/r8sfmyXIRMmNLW
	dIlxbJcg9865hGgooPxXx3d9eFahubPJUBG/woqZlcEsHOgVtu/Wz05rgboOOi0AJH9FLa31N6S
	UNih/rRx1coQy0M4NDnzCsgUMLWwWZs1bs5d6oXN2GSDxmuAwLaK6Ise
X-Received: by 2002:a17:906:dc89:b0:acb:35df:33f5 with SMTP id a640c23a62f3a-acb42c70dc4mr71495466b.56.1744796562775;
        Wed, 16 Apr 2025 02:42:42 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHUqQCtj9crV5BKx8AV3M8HEmBsOGh6MEg/JZVCLQ4NCSqTitz1Va2qJpro6z63mL8E1u0WEg==
X-Received: by 2002:a17:906:dc89:b0:acb:35df:33f5 with SMTP id a640c23a62f3a-acb42c70dc4mr71494066b.56.1744796562370;
        Wed, 16 Apr 2025 02:42:42 -0700 (PDT)
Received: from localhost (151-243-191-194.pool.dsl-net.ch. [194.191.243.151])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-acb3cdf4684sm95842966b.68.2025.04.16.02.42.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Apr 2025 02:42:42 -0700 (PDT)
From: Juerg Haefliger <juerg.haefliger@canonical.com>
To: juerg.haefliger@canonical.com
Cc: andersson@kernel.org,
	conor+dt@kernel.org,
	devicetree@vger.kernel.org,
	konradybcio@kernel.org,
	krzk+dt@kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	robh@kernel.org
Subject: [PATCH v3 3/3] arm64: dts: qcom: x1e80100-hp-elitebook-ultra-g1q: DT for HP EliteBook Ultra G1q
Date: Wed, 16 Apr 2025 11:42:36 +0200
Message-ID: <20250416094236.312079-4-juerg.haefliger@canonical.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250416094236.312079-1-juerg.haefliger@canonical.com>
References: <20250408145252.581060-1-juerg.haefliger@canonical.com>
 <20250416094236.312079-1-juerg.haefliger@canonical.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Introduce a device tree for the HP EliteBook Ultra G1q 14" AI laptop. It
seems to be using the same baseboard as the HP OmniBook X 14 so just use
that for now.

Signed-off-by: Juerg Haefliger <juerg.haefliger@canonical.com>
---
 arch/arm64/boot/dts/qcom/Makefile             |  1 +
 .../qcom/x1e80100-hp-elitebook-ultra-g1q.dts  | 30 +++++++++++++++++++
 drivers/firmware/qcom/qcom_scm.c              |  1 +
 3 files changed, 32 insertions(+)
 create mode 100644 arch/arm64/boot/dts/qcom/x1e80100-hp-elitebook-ultra-g1q.dts

diff --git a/arch/arm64/boot/dts/qcom/Makefile b/arch/arm64/boot/dts/qcom/Makefile
index 140b0b2abfb5..732cc3f6a220 100644
--- a/arch/arm64/boot/dts/qcom/Makefile
+++ b/arch/arm64/boot/dts/qcom/Makefile
@@ -293,6 +293,7 @@ dtb-$(CONFIG_ARCH_QCOM)	+= x1e78100-lenovo-thinkpad-t14s.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= x1e80100-asus-vivobook-s15.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= x1e80100-crd.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= x1e80100-dell-xps13-9345.dtb
+dtb-$(CONFIG_ARCH_QCOM)	+= x1e80100-hp-elitebook-ultra-g1q.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= x1e80100-hp-omnibook-x14.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= x1e80100-lenovo-yoga-slim7x.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= x1e80100-microsoft-romulus13.dtb
diff --git a/arch/arm64/boot/dts/qcom/x1e80100-hp-elitebook-ultra-g1q.dts b/arch/arm64/boot/dts/qcom/x1e80100-hp-elitebook-ultra-g1q.dts
new file mode 100644
index 000000000000..4ea00d823693
--- /dev/null
+++ b/arch/arm64/boot/dts/qcom/x1e80100-hp-elitebook-ultra-g1q.dts
@@ -0,0 +1,30 @@
+// SPDX-License-Identifier: BSD-3-Clause
+
+/dts-v1/;
+
+#include "x1e80100-hp-omnibook-x14.dts"
+
+/ {
+	model = "HP EliteBook Ultra G1q";
+	compatible = "hp,elitebook-ultra-g1q", "qcom,x1e80100";
+};
+
+&gpu {
+	zap-shader {
+		firmware-name = "qcom/x1e80100/hp/elitebook-ultra-g1q/qcdxkmsuc8380.mbn";
+	};
+};
+
+&remoteproc_adsp {
+	firmware-name = "qcom/x1e80100/hp/elitebook-ultra-g1q/qcadsp8380.mbn",
+			"qcom/x1e80100/hp/elitebook-ultra-g1q/adsp_dtbs.elf";
+};
+
+&remoteproc_cdsp {
+	firmware-name = "qcom/x1e80100/hp/elitebook-ultra-g1q/qccdsp8380.mbn",
+			"qcom/x1e80100/hp/elitebook-ultra-g1q/cdsp_dtbs.elf";
+};
+
+&sound {
+	model = "X1E80100-HP-ELITEBOOK-ULTRA-G1Q";
+};
diff --git a/drivers/firmware/qcom/qcom_scm.c b/drivers/firmware/qcom/qcom_scm.c
index fc4d67e4c4a6..e7262ad11509 100644
--- a/drivers/firmware/qcom/qcom_scm.c
+++ b/drivers/firmware/qcom/qcom_scm.c
@@ -1987,6 +1987,7 @@ EXPORT_SYMBOL_GPL(qcom_scm_qseecom_app_send);
 static const struct of_device_id qcom_scm_qseecom_allowlist[] __maybe_unused = {
 	{ .compatible = "asus,vivobook-s15" },
 	{ .compatible = "dell,xps13-9345" },
+	{ .compatible = "hp,elitebook-ultra-g1q" },
 	{ .compatible = "hp,omnibook-x14" },
 	{ .compatible = "huawei,gaokun3" },
 	{ .compatible = "lenovo,flex-5g" },
-- 
2.43.0


