Return-Path: <linux-arm-msm+bounces-53551-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D9867A80EE6
	for <lists+linux-arm-msm@lfdr.de>; Tue,  8 Apr 2025 16:53:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 0A94A7A1AF9
	for <lists+linux-arm-msm@lfdr.de>; Tue,  8 Apr 2025 14:52:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3132A2236FC;
	Tue,  8 Apr 2025 14:53:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canonical.com header.i=@canonical.com header.b="kYSfNwcn"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp-relay-internal-1.canonical.com (smtp-relay-internal-1.canonical.com [185.125.188.123])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 576F0218584
	for <linux-arm-msm@vger.kernel.org>; Tue,  8 Apr 2025 14:53:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.125.188.123
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744123989; cv=none; b=R332w050qlybj5PfpDoRIPOVRhlVnu9PYjzRFSy58xhaDHNcuVYSsR4iqITq6uTaYK40PpUMZRxRmHehR8Bw74r9DkHZoVIV3AY2UjtZzClCs9AUBPmgc/zH37olhMe4HtR0xismz9Fluwo35W9D4uRjxw0T1pzHeeYbwAfF0mo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744123989; c=relaxed/simple;
	bh=YAMbJeglLd+m3LPt1Abx+lmJTW0tnjp0s49KyTviaVY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=P3OMR27hBzqXWHFdMcb8cfArAT0BdpNSb0PqUTKl32/rgiQjYRBKNN/6R5JUss8EOjzUuXgeoCnBLJB0GBhh6Ypc3nYnfU7238/UYF1eYE/GayKcUpSFrBWRQzvEhJpHyal9kU+PQDuqqVobyKkB62T3hmlJQZ8aJlS7h3QsIe4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canonical.com; spf=pass smtp.mailfrom=canonical.com; dkim=pass (2048-bit key) header.d=canonical.com header.i=@canonical.com header.b=kYSfNwcn; arc=none smtp.client-ip=185.125.188.123
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canonical.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canonical.com
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com [209.85.208.71])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id 0C16D3FB50
	for <linux-arm-msm@vger.kernel.org>; Tue,  8 Apr 2025 14:53:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1744123985;
	bh=t7RLGdhnmdv0HU+cNYiwuyYsfJnpe4cA3+J5cf+iCGg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version;
	b=kYSfNwcn5go8enPq28/nilkxQ2KNDzyO3dVgZkrrPEDLsprRpj8Zzwv9chKuBFVzd
	 eDOLHLp5YajHnsPKxITPblA4Bdcf369V16bbPS/y5DE/4yAmgXeF0ly8duZXZ2NbBU
	 XrmGR2ES7WaZ/t/ZkGFWhFReyPIpwQnC+0+Hq9fE+S8bk2jOclH1qxD6/2fkr4ceDq
	 +s9yy+4efCqcmsAsmoGTzoXHE3FT64/lMAf/a+D+cpu8LR+v4PR8mhnxofgtRMwQXf
	 kemswPXv4itFWmMUWP02F8hL0rZZcvz6J/I1D6gHynpSoxFHgJwYmy4+qhqLfceHmq
	 2zjI0YTKh1+2g==
Received: by mail-ed1-f71.google.com with SMTP id 4fb4d7f45d1cf-5e5eb195f01so4889793a12.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 08 Apr 2025 07:53:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744123978; x=1744728778;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=t7RLGdhnmdv0HU+cNYiwuyYsfJnpe4cA3+J5cf+iCGg=;
        b=EVJy7xiZfN01m0HGDha1O3njkS4Hxxy/ZmAM2c6SFyllUOoqrYGLNmHfwvr5CmbnEU
         gVVSyJbYdF/5Os96GoP317wxe+vOe+DjdPifyFKTd4yeeVudWpG7vIGeDQCd6Qzt6dX2
         zAHug0a42UsfB6Xp+/hy0aJRPwfBU1nUyTTolSWCZd3mmDmOC531vjqoSqnhM4KOm/Mw
         RU/HOxm+e8BPmHvb4a+3Dd9Q0W3p6xx6kVqlXX4klbSLXR+VOZcrU+ce1w7jo2cj0cBL
         dLntWt2/9yj54YWP+EriQq9OG2fjMylJyqxVV0Cvn0XjKDqfk4bIueUAfewWyeJ7LnEZ
         zPgA==
X-Forwarded-Encrypted: i=1; AJvYcCVRZQDWSSJ1jjkrsz4FUMjn3mtdkRAzA6OBPTE04zkv5kijFaRfp62FkZ366PVKjl731Rtb6alJGowrVqYh@vger.kernel.org
X-Gm-Message-State: AOJu0YxEuC5DsCnGjDmvE7YTX4umFI3VsiAmK05hmeQQ3X6N5czcDgmM
	TBo/bH64zRygkPZ5bbAMok0kwFoETXgSd+Pavpe1rEhxm6/EyYcRDox1NrLQAz3gLYkMN1SCMn/
	lFNb+UKQesVBvEgaKrW56vZ2yXozE8L3ZKhaHeALHNkF8v07Zqmnf3KsUzuHFJnN7a3QwXd39ND
	O9+mM=
X-Gm-Gg: ASbGncvmsQ4nDBU21HG024p9QqOix8xlaRz4Z5RncBUfhXoeqcfPiHeS6GOKb7rdP59
	CYD3juEG2YAWbFnok2wXwT+zLzQkzdQQMBzAR5Nwz0PC8I+KVnkvrVWok45qoh7g63E2zpw7+JV
	Yr2S5WiHK0bQfhBohnd8v82or2CWQdkCAd8BWWHLO3uqDs4/STGGhx2549XLKCKSGtk0CHPzlbg
	EvpxrCgL2uMCb25cNdhLAuwLRr8Hio5h9r00GpUs0DLw+Xr8YNsKlzgX+ZreWlRpjOfz4qTJkym
	GiZ6pSG4clVno6KIUA7mmMgeGcxWSjCluElolrGQSzUUvGFjlAP2HOc1nnqH
X-Received: by 2002:a17:906:6a16:b0:ac7:391a:e157 with SMTP id a640c23a62f3a-ac7d1c69fedmr1405013966b.58.1744123978230;
        Tue, 08 Apr 2025 07:52:58 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFsPIcgqIePEdNeGq4e0HZauzcWwGdWE6nTtAT2uBsc2gtQUXoDUsu029Z3/BlD7NbthzrCDQ==
X-Received: by 2002:a17:906:6a16:b0:ac7:391a:e157 with SMTP id a640c23a62f3a-ac7d1c69fedmr1405011366b.58.1744123977814;
        Tue, 08 Apr 2025 07:52:57 -0700 (PDT)
Received: from localhost (151-243-191-194.pool.dsl-net.ch. [194.191.243.151])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ac7c01c2ce0sm935136066b.178.2025.04.08.07.52.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Apr 2025 07:52:57 -0700 (PDT)
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
Subject: [PATCH v2 3/3] arm64: dts: qcom: x1e80100-hp-elitebook-ultra-g1q: DT for HP EliteBook Ultra G1q
Date: Tue,  8 Apr 2025 16:52:51 +0200
Message-ID: <20250408145252.581060-4-juerg.haefliger@canonical.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250408145252.581060-1-juerg.haefliger@canonical.com>
References: <20250404090108.3333211-1-juerg.haefliger@canonical.com>
 <20250408145252.581060-1-juerg.haefliger@canonical.com>
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
 .../qcom/x1e80100-hp-elitebook-ultra-g1q.dts  | 36 +++++++++++++++++++
 drivers/firmware/qcom/qcom_scm.c              |  1 +
 3 files changed, 38 insertions(+)
 create mode 100644 arch/arm64/boot/dts/qcom/x1e80100-hp-elitebook-ultra-g1q.dts

diff --git a/arch/arm64/boot/dts/qcom/Makefile b/arch/arm64/boot/dts/qcom/Makefile
index 710879d94c00..3d98bb95e8b1 100644
--- a/arch/arm64/boot/dts/qcom/Makefile
+++ b/arch/arm64/boot/dts/qcom/Makefile
@@ -294,6 +294,7 @@ dtb-$(CONFIG_ARCH_QCOM)	+= x1e78100-lenovo-thinkpad-t14s-oled.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= x1e80100-asus-vivobook-s15.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= x1e80100-crd.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= x1e80100-dell-xps13-9345.dtb
+dtb-$(CONFIG_ARCH_QCOM)	+= x1e80100-hp-elitebook-ultra-g1q.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= x1e80100-hp-omnibook-x14.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= x1e80100-lenovo-yoga-slim7x.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= x1e80100-microsoft-romulus13.dtb
diff --git a/arch/arm64/boot/dts/qcom/x1e80100-hp-elitebook-ultra-g1q.dts b/arch/arm64/boot/dts/qcom/x1e80100-hp-elitebook-ultra-g1q.dts
new file mode 100644
index 000000000000..9f3aac1a83fd
--- /dev/null
+++ b/arch/arm64/boot/dts/qcom/x1e80100-hp-elitebook-ultra-g1q.dts
@@ -0,0 +1,36 @@
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
+	status = "okay";
+
+	zap-shader {
+		firmware-name = "qcom/x1e80100/hp/elitebook-ultra-g1q/qcdxkmsuc8380.mbn";
+	};
+};
+
+&remoteproc_adsp {
+	firmware-name = "qcom/x1e80100/hp/elitebook-ultra-g1q/qcadsp8380.mbn",
+			"qcom/x1e80100/hp/elitebook-ultra-g1q/adsp_dtbs.elf";
+
+	status = "okay";
+};
+
+&remoteproc_cdsp {
+	firmware-name = "qcom/x1e80100/hp/elitebook-ultra-g1q/qccdsp8380.mbn",
+			"qcom/x1e80100/hp/elitebook-ultra-g1q/cdsp_dtbs.elf";
+
+	status = "okay";
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


