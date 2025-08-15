Return-Path: <linux-arm-msm+bounces-69387-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 34F63B282C6
	for <lists+linux-arm-msm@lfdr.de>; Fri, 15 Aug 2025 17:15:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id DD4EBAE6C23
	for <lists+linux-arm-msm@lfdr.de>; Fri, 15 Aug 2025 15:15:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9052D29344F;
	Fri, 15 Aug 2025 15:15:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RY96xkjd"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 181CB291C31;
	Fri, 15 Aug 2025 15:15:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755270915; cv=none; b=s8hRXkEqNTuGV8iy1oLhiwBUgi1SW4gDWIpNWT3f2fnjz06oIVwh5QoSEeCsFbMRU+Ythy04QQDWaM68haM7mnrwwrgq3K6soMx3PJVm615GPR/5Sw60/UxSfFGAic47w67gsuqkRXkpLb3kv0dLTuDV0U6Qz79sNMkyUlHpkeM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755270915; c=relaxed/simple;
	bh=f/HY+NHdxnFbdhS/nJlRzs6mAtpvju38od6wzf7gGrU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ik6smDbvkLMrbzRePSurzde890Yq23lWqr6zJJYxNlE4o6zoe3qJkwHZSQtVa6Akhf4rzhCIM8l8TRO6OubcEu6euz+pk/fWf42U+ZnODNx7To+fyKbaCbh7X1LIFykn+3e66rmGLh/1btFoBa2vL11r7XYAQcpdmoCQ6n4l4tw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RY96xkjd; arc=none smtp.client-ip=209.85.214.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-24457f3edd4so15186885ad.0;
        Fri, 15 Aug 2025 08:15:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1755270913; x=1755875713; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AR0LMyZN3S1d5pFZcWtyeSGjLGPE5VDm5YupxOaqvMg=;
        b=RY96xkjdAkabgexpiciStH0K32fHZU/WGYSNMZ9Jd2vzXD8HPZKZJZTnhj+xUAuptG
         71r8n7bNH7OAKhbMs6bu91W0MaI81CV1zgLDomnlLt0T/XlneIDpu/HiXmg68pWbCuVo
         N9EJGnf2p//E/WqxDx/t9bbLLTHXBDUJy7bjNuxNC8DYSTrLHkwESFWwxwimXWtexSGS
         CMOHS2Ba+MZmBMXxcL9dSuc0RpJdzQgZslqf/+c9CrQHvJ1a05B9RMDWM2qdzXpwAm0/
         ILMAcO51inf/X7tJ9fk3modc5BXJAIT4VmGyBb7cukSJt84WInhVPQxJINMLv/OL8KF8
         j4AQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755270913; x=1755875713;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=AR0LMyZN3S1d5pFZcWtyeSGjLGPE5VDm5YupxOaqvMg=;
        b=Yqf+4Y9NQBMg4R1hhgSBIWkOFmO7vAhJqFwSmDG4+0KYyiqSanfiZ1ISA0Plna4ddQ
         tUvuLUC2owC3JK3EhZXGiwf+FVa4fgzAm5+wvpIn7o7qNIbjlnar3scoNtZtHq2Ss2IG
         pv2vUoeAosJSzuGle3ht7nrYCExRJVNVSJuoygihdnzVWLjd5T2sQsrFOKKyVlMksOeZ
         o6a8wkYdYjtr2DJrBvzBcFT/Dz2g9bAiX19OkUaiAG5msYi/Ck1qkHkiRsvfd3/C4aMb
         UWzjOk1Qd2WbtvCHh896DA3eNHP6fqBf3Sste8V/mh8+/baXUa1SuK1eEm2sSSU+xJpx
         TRow==
X-Forwarded-Encrypted: i=1; AJvYcCUnth+V5k1D62BUT97n5oq9GKJ2bH9T5v0c7URc96CEpWOhU+uSPfo3+c8iFc8C0k2tyqcFYJgdQRO1m6oZ@vger.kernel.org, AJvYcCXGwNC2TlB3wo4F+fUAiH/D7iuBxyNedCp3RKOQq5m3n7f4gSyoxE5G0DwoTf31OkE1xiSEudEv3Zak@vger.kernel.org
X-Gm-Message-State: AOJu0YxM0UnfwydFwwGf2Y7MccY31vu2xg1k1wTstG/KnAker83qs6Aq
	QnmQVDlarapnv3EQnzXuInyPv9mG3xvRpp93FXmUyMuUu5y5squaSgYKAQvNmRmy
X-Gm-Gg: ASbGncvUym42xvlGO+yEMcEFqJi8nubd+ZIlT+l9TFvFB5hzimgrADTl7SQkQk74LUA
	JvFPwsNCYQCST17QGXv7hm9fVMVC86Qx+LoAb7DgNKrcGBBEAdXCcu4/OaLUX/DPMwrlIuddhIr
	85X4ICZtu9A236TTIJUq5hUmQ0ymMYNqQhsRlLMIceK31dNvSu3/rusAvesWUapesvWcOYyhzB3
	gG+YrjDN/sqw94StsIASGU2nsTbvxte8dlNozyVyHYI/RMtKOaMcCckvmrebbXhtY6i8M97oF5X
	0vb3cV+IzIsdpj0DazZ700f1XbSG26ttez5CpcQgsYFdyPSnBwkFtPAXklzE72qQ38Fh9KMi8vt
	7//32LLZGhK+k8uqyGTCsM5541TRW+zT4TbI8IFcglu7d/NujdRLGbw==
X-Google-Smtp-Source: AGHT+IG4KebpllOV/KcYQfKMMSZkREHYJYMI8fKI08tFNxyKiGxbWaD6IWJEazyf1SN6PQBx5eJy7w==
X-Received: by 2002:a17:903:230a:b0:23f:cf96:3072 with SMTP id d9443c01a7336-2446d8c5dddmr37194765ad.26.1755270913089;
        Fri, 15 Aug 2025 08:15:13 -0700 (PDT)
Received: from archlinux (201-0-28-218.dsl.telesp.net.br. [201.0.28.218])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2446d53db44sm16224635ad.117.2025.08.15.08.15.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 Aug 2025 08:15:12 -0700 (PDT)
From: =?UTF-8?q?Eric=20Gon=C3=A7alves?= <ghatto404@gmail.com>
To: andersson@kernel.org,
	konradybcio@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org
Cc: linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v1 2/2] arm64: dts: qcom: add initial support for Samsung Galaxy S20 FE
Date: Fri, 15 Aug 2025 15:14:26 +0000
Message-ID: <20250815151426.32023-3-ghatto404@gmail.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250815151426.32023-1-ghatto404@gmail.com>
References: <20250815151426.32023-1-ghatto404@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Add new device support for the Samsung Galaxy S20 FE 4G/5G
 (SM-G980/SM-G981B) phone

What works:
- SimpleFB
- Pstore/ramoops

Signed-off-by: Eric Gonçalves <ghatto404@gmail.com>
---
 arch/arm64/boot/dts/qcom/Makefile             |  1 +
 .../boot/dts/qcom/sm8250-samsung-r8q.dts      | 47 +++++++++++++++++++
 2 files changed, 48 insertions(+)
 create mode 100644 arch/arm64/boot/dts/qcom/sm8250-samsung-r8q.dts

diff --git a/arch/arm64/boot/dts/qcom/Makefile b/arch/arm64/boot/dts/qcom/Makefile
index 4bfa926b6a08..5ac6aab51a9d 100644
--- a/arch/arm64/boot/dts/qcom/Makefile
+++ b/arch/arm64/boot/dts/qcom/Makefile
@@ -275,6 +275,7 @@ dtb-$(CONFIG_ARCH_QCOM)	+= sm8150-sony-xperia-kumano-bahamut.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= sm8150-sony-xperia-kumano-griffin.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= sm8250-hdk.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= sm8250-mtp.dtb
+dtb-$(CONFIG_ARCH_QCOM)	+= sm8250-samsung-r8q.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= sm8250-sony-xperia-edo-pdx203.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= sm8250-sony-xperia-edo-pdx206.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= sm8250-xiaomi-elish-boe.dtb
diff --git a/arch/arm64/boot/dts/qcom/sm8250-samsung-r8q.dts b/arch/arm64/boot/dts/qcom/sm8250-samsung-r8q.dts
new file mode 100644
index 000000000000..32036fc9668a
--- /dev/null
+++ b/arch/arm64/boot/dts/qcom/sm8250-samsung-r8q.dts
@@ -0,0 +1,47 @@
+// SPDX-License-Identifier: GPL-2.0-only
+
+/dts-v1/;
+
+#include "sm8250.dtsi"
+
+/ {
+	model = "Samsung Galaxy S20 FE";
+	compatible = "samsung,r8q", "qcom,sm8250";
+	chassis-type = "handset";
+
+	chosen {
+		#address-cells = <2>;
+		#size-cells = <2>;
+		ranges;
+
+		framebuffer: framebuffer@9c000000 {
+			compatible = "simple-framebuffer";
+			reg = <0x0 0x9c000000 0x0 (1080 * 2400 * 4)>;
+			width = <1080>;
+			height = <2400>;
+			stride = <(1080 * 4)>;
+			format = "a8r8g8b8";
+		};
+	};
+
+	reserved-memory {
+		cont_splash_mem: memory@9c000000 {
+			reg = <0x0 0x9c000000 0x0 (1080 * 2400 * 4)>;
+			no-map;
+		};
+
+		ramoops@9fa00000 {
+			compatible = "ramoops";
+			reg = <0x0 0x9fa00000 0x0 0x100000>;
+			record-size = <0x4000>;
+			console-size = <0x40000>;
+			pmsg-size = <0x40000>;
+			ecc-size = <16>;
+			no-map;
+		};
+	};
+};
+
+&tlmm {
+	gpio-reserved-ranges = <40 4>; /* I2C (not linked to anything) */
+};
-- 
2.50.1


