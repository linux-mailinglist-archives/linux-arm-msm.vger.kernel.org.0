Return-Path: <linux-arm-msm+bounces-72361-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id AE57DB46346
	for <lists+linux-arm-msm@lfdr.de>; Fri,  5 Sep 2025 21:11:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id BCDC31D225B8
	for <lists+linux-arm-msm@lfdr.de>; Fri,  5 Sep 2025 19:11:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DDC7027B323;
	Fri,  5 Sep 2025 19:10:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="K+6OnVnL"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5DB4427B351;
	Fri,  5 Sep 2025 19:10:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757099458; cv=none; b=ktKRiE7COwvjz5UItEDGwjHUrfe3U9aoVzvjnfX5JRt673gpGPYuN0PtWGM0ae2dcDXhTrjQuVO3u+dpqxNbde9Gi+RP5DuWJfiu1kXtID2/DM/yo1/xETftpehB/xH1o/spwQkYjpBmmPZlJmjZtLzlUWIfIA7ZtiP3g0ZF688=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757099458; c=relaxed/simple;
	bh=xgccCFezDjIRILPmUWGPLV4M4lcd8ai8YYELr9nCyTU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=KalnvrBMlvtVyybuBHYcmcvWy/gPzaigryqn13gQ4lZ56+xFhCq/xURkhVHdFczzzlnYFHS4MSwz6j3WfhpiBRSWsDNxW2RP7yadRtTFPjmmbGBsWDdDsBO8Yp/iDkpn2GwrdaoH8FN8c4UNYui5z//Or9QjGTHCX5pIKPP2JYM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=K+6OnVnL; arc=none smtp.client-ip=209.85.210.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f179.google.com with SMTP id d2e1a72fcca58-7704f3c46ceso1997571b3a.2;
        Fri, 05 Sep 2025 12:10:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757099457; x=1757704257; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=szg0jedw/yL/ET3KgP858FRz33Dd/TukZs0cjRb62YU=;
        b=K+6OnVnLla5m8N5q2GkPdxQfHZTpfEe/4o2YVVnvVRxhVEKm/EIB2S9YN07uyKrxZr
         d5L4y6EzNkkr1IjjJRbha0a9EkZk+9Y3i5kK0OReh5oFUuDp0iJdwWQogbZeO4r74bNW
         VfI2CN4EUXOW3A9XHDpEEz0N5UYiKkKLu4uvJSL8t4miC/KqI4e6Lc2alOxTfEnVqf8+
         oLxP0EZ0AePQpbm/JGr2vWWcfYyyiNODRDce10xUyUCw3d+f4F+syWifdch8CZge3QIE
         0LD3zFAhjqVEAmhzPYf5KhBw1JdgvSyA/jhe5XV8WlsE2RqahcbtEBMJThg0prs0I5/w
         gbMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757099457; x=1757704257;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=szg0jedw/yL/ET3KgP858FRz33Dd/TukZs0cjRb62YU=;
        b=oBVCB1K1qjvC683XMmIqoG7gcQV/j5TD1+Yt2aagRMcNg99BmWDJnhyYJMggO34civ
         KVzANeb0T13zHbq+wqz2fdUeMKf6nwMjJVsomt0lrsohGgh60IESl23yWm1BxSXjFXI2
         gZlRPwteJH+NfPc1/Ndzo9LzfEAfgkGFGFqVqyGB8gLg3I1dpD18pyvRPWUQMCewnO7X
         NSvdrcMXmbbyjoHo5bKb7Ag89JyXM1R/FebFMLv3nqDa9UvHsAnnSS60879GDHfPBp94
         7Sc1V7EzMlWNz55GKeNzMQFBddVuz0ztkiz9Sw/yeE072No8Zp900MZZue5hcNoqpDcl
         RaxQ==
X-Forwarded-Encrypted: i=1; AJvYcCU5E94SKhlSMRuaXFgjuVgU09/o28EJGnzd4Xit14jNfwcisW8z6dozAESOxy0ecglff7LRPCkiG143@vger.kernel.org, AJvYcCXyWiHJV4I/qk/M9vxJIdcyVaEatRh6TaEWSxVBzC1KWGuGH3S9oSuF047J0qucjacSLQiS0GJAxfCKq1jH@vger.kernel.org
X-Gm-Message-State: AOJu0Yy9X+q+9CBtG9u06jJtVndaIEwN0wfVTI+qpRCnMgupgQuHmSCY
	6TTLByssRH8fTvczC9UGhSYd9fdT1OSYQj0mYt0xRRiYUuX5fwsvV0Fs67zlcWklrUc=
X-Gm-Gg: ASbGncuSKM4fixPw5edIDQEAhvuVnoNHaOBjQBiSWa9x4qdDoqD5G72vNzXMAEjBRDz
	Vj4vqHzyy25jp9jHYB0foTzSEFK2Y+PEIsDfUT1aZ8uq6dnd70P8mWDjCX+alVe5qAjLgBfGnSy
	Z2JxUc/FbWpOTbe+wYiMjRxQ29npSPo0KVSjr9NYAuY736SjG6SKc2s+7xEKZVnUxWjg0Sr+t2F
	XFlhHPg37xh7rGzJolLKtoX7tFYqjFJCGH9pWJBARZMOZVJtjwk6iASUqyWEBMLstaFU7VhRkXc
	RO3MOuSbOoUQ+DMHocwxp0Cm2WRxzfR0c7XmAMVGg4nrebo+NWC5d6Y0IYlwt8pcr1cbDH6JSRL
	7CgceNNDoRIxQ5N/PB3AGCNxAKGHiycPK
X-Google-Smtp-Source: AGHT+IE6hOexaBAzeYuqOsxDXJ8o2JljO8GjQp/pp4ayQEBPxMdspJWyCESP0KxGrglWhczf7wtPVQ==
X-Received: by 2002:a05:6a00:7450:b0:772:f60:75b0 with SMTP id d2e1a72fcca58-7723e3b1c5fmr28389161b3a.24.1757099456595;
        Fri, 05 Sep 2025 12:10:56 -0700 (PDT)
Received: from archlinux ([179.110.125.220])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7727bce1b58sm9102326b3a.9.2025.09.05.12.10.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Sep 2025 12:10:56 -0700 (PDT)
From: =?UTF-8?q?Eric=20Gon=C3=A7alves?= <ghatto404@gmail.com>
To: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	=?UTF-8?q?Eric=20Gon=C3=A7alves?= <ghatto404@gmail.com>
Subject: [PATCH v1 3/3] arm64: dts: qcom: add initial support for Samsung Galaxy S20
Date: Fri,  5 Sep 2025 19:09:31 +0000
Message-ID: <20250905190931.27481-4-ghatto404@gmail.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250905190931.27481-1-ghatto404@gmail.com>
References: <20250905190931.27481-1-ghatto404@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Add new device support for the Samsung Galaxy S20 phone

What works (common dtsi):
- SimpleFB
- Pstore/ramoops
- GPIO keys
- UFS
- USB

Signed-off-by: Eric Gonçalves <ghatto404@gmail.com>
---
 arch/arm64/boot/dts/qcom/Makefile             |  1 +
 .../boot/dts/qcom/sm8250-samsung-x1q.dts      | 26 +++++++++++++++++++
 2 files changed, 27 insertions(+)
 create mode 100644 arch/arm64/boot/dts/qcom/sm8250-samsung-x1q.dts

diff --git a/arch/arm64/boot/dts/qcom/Makefile b/arch/arm64/boot/dts/qcom/Makefile
index 8f305c1ddac1..2d250c3d65cf 100644
--- a/arch/arm64/boot/dts/qcom/Makefile
+++ b/arch/arm64/boot/dts/qcom/Makefile
@@ -276,6 +276,7 @@ dtb-$(CONFIG_ARCH_QCOM)	+= sm8150-sony-xperia-kumano-griffin.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= sm8250-hdk.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= sm8250-mtp.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= sm8250-samsung-r8q.dtb
+dtb-$(CONFIG_ARCH_QCOM)	+= sm8250-samsung-x1q.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= sm8250-sony-xperia-edo-pdx203.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= sm8250-sony-xperia-edo-pdx206.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= sm8250-xiaomi-elish-boe.dtb
diff --git a/arch/arm64/boot/dts/qcom/sm8250-samsung-x1q.dts b/arch/arm64/boot/dts/qcom/sm8250-samsung-x1q.dts
new file mode 100644
index 000000000000..325f94cf755e
--- /dev/null
+++ b/arch/arm64/boot/dts/qcom/sm8250-samsung-x1q.dts
@@ -0,0 +1,26 @@
+// SPDX-License-Identifier: GPL-2.0-only
+
+/dts-v1/;
+
+#include "sm8250-samsung-common.dtsi"
+
+/ {
+	model = "Samsung Galaxy S20";
+	compatible = "samsung,x1q", "qcom,sm8250";
+	chassis-type = "handset";
+};
+
+&adsp {
+	firmware-name = "qcom/sm8250/Samsung/x1q/adsp.mbn";
+	status = "okay";
+};
+
+&cdsp {
+	firmware-name = "qcom/sm8250/Samsung/x1q/cdsp.mbn";
+	status = "okay";
+};
+
+&slpi {
+	firmware-name = "qcom/sm8250/Samsung/x1q/slpi.mbn";
+	status = "okay";
+};
-- 
2.50.1


