Return-Path: <linux-arm-msm+bounces-26793-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 88EEF938E48
	for <lists+linux-arm-msm@lfdr.de>; Mon, 22 Jul 2024 13:48:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 02EE51F21BC6
	for <lists+linux-arm-msm@lfdr.de>; Mon, 22 Jul 2024 11:48:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BC19D16D319;
	Mon, 22 Jul 2024 11:48:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="yzFgnC0h"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09EEA168491
	for <linux-arm-msm@vger.kernel.org>; Mon, 22 Jul 2024 11:48:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721648919; cv=none; b=HQf6kQUq8rXBu5RgnyRf3k3mi2XgeLjo+nTLBTK0UpPnah9A2w5ra4EzhGHzB2h1scGciyZIXbraINzCRK9Xbhc9JPMB9DyKTDDnzTwlBE5ZUN9TjGxwSxGbWElL+Xlo7DDiYFQ6qLNts1QqOioYrAiJkW0WbtfNVXxLr6MS5EI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721648919; c=relaxed/simple;
	bh=+PquDOHITPa6r5CwMnMw5CERKtBpvJTN4CrWndBBerw=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=GVZWPpBuvFQkKKxzEdf2s77GKYT78usgMwh5YF6ZqTw+1S9MSxcCVdRrg51kqi8yMLrLe8u0mKZCaUOWkJ7W6BGhTAS5C7370gFI60A536Zb4tN/LSEnyP69BQLqgJmSCD/HKqUr50veH39T/RCC1YX5Mv2h5IQ1Zr1/JmHcSqA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=yzFgnC0h; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4272738eb9eso31489075e9.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 22 Jul 2024 04:48:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1721648915; x=1722253715; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=St9kGX9OtsS8CFAu8UbQinJAqYBS8p8LIz/6Z0WGcQE=;
        b=yzFgnC0hcVOQ9AlS91IdHiTydv8Rsun4d8NCuEb2tWyZe2j6DA5n5VeoD9HD14v9hX
         Wv7Pe7HzfETIothAsLPjFvxckx43tJfBLWZQLnaZl66s+23mtfELJRjEp9jgjseJDK9D
         CDWEirg4CrtEoWtsbTui9J373qIoj+HKrjsYxSipWKQeHt/DP0OslzTdog8mtmA7Kiq5
         C5BbxuBir/PgwjEpT0IWE4hPTgXZqfEVOISfMMJws4aexL4aIUAzZmACkbEE+XxBkLWD
         T1wN2DVFRvzDfYeDLRDm0ianUT1StePL6CyocViRWhxdvzQMBnJKmpdF0ioRpeho5KGU
         Nzbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721648915; x=1722253715;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=St9kGX9OtsS8CFAu8UbQinJAqYBS8p8LIz/6Z0WGcQE=;
        b=WYmnrVuvV9LDTj0d1v0jo0PxpWU94Lc7K8Ki9TWcHGwcO4n36FJOUwUX6AAMVXATE6
         PPn0LkHfDd6BG2NvnG3XCFpKhh3OZfFiNnYBTt/zxa+DnkVcmtA7n+JcQqNUpIwlPo94
         odknczFauqgc93RwLbc/ZI2plTsQFV4Axz4dL91+/BXfhtMgkPFjpIT2sx+QjormSdWJ
         7nSJg6hs1E1xNsPPotXANjxAbxJng5DL+v5HAyoBv8ldGPvrdf1A9Th72hL0dKtoEnH4
         lzGJKObgX4MfOJRr+aqQL0k/Al+K+j2ZZFiV2ChU2R0kuM+eRz0acKWwsnQtceTIbgOz
         puJg==
X-Gm-Message-State: AOJu0Yz/AKKJnk5eGh6VgHWNhQdiZL96ODQuVZUzhpnd8C2XPUOw2Kzg
	rb2I8vZPZ+xQPmjvXk6HPmBFs79QPmAaCKASsKevMn1Wf8Oo+MJgV9Vx75MhRn3AIq/FBKqnAQP
	X
X-Google-Smtp-Source: AGHT+IGIO5Dn01q2v2wuXKmIKxhzHPxVVWVvt9xbD5rjykTP/+niBwSkvcQdQ8ZvaBFjgZ7xQy2sMw==
X-Received: by 2002:a05:600c:45c9:b0:426:5b51:109d with SMTP id 5b1f17b1804b1-427dc568e7amr34941025e9.36.1721648915619;
        Mon, 22 Jul 2024 04:48:35 -0700 (PDT)
Received: from [192.168.1.191] ([2a0a:ef40:ee7:2401:197d:e048:a80f:bc44])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-427d68fa17csm125681235e9.2.2024.07.22.04.48.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Jul 2024 04:48:35 -0700 (PDT)
From: Rayyan Ansari <rayyan.ansari@linaro.org>
Subject: [PATCH 0/3] arm(64): dts: qcom: fix dtbs_check warnings for
 qcom,spmi-pmic.yaml
Date: Mon, 22 Jul 2024 12:47:54 +0100
Message-Id: <20240722-pmic-bindings-v1-0-555942b3c4e1@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAOpGnmYC/x3MQQqAIBBA0avErBNUMqOrRAvT0WaRiUIE4t2Tl
 m/xf4WCmbDAOlTI+FChO3aIcQB7mhiQkesGyeXEtZQsXWTZQdFRDIVpNTuvFuONUNCblNHT+/+
 2vbUPVgTp0l8AAAA=
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Rayyan Ansari <rayyan.ansari@linaro.org>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=981;
 i=rayyan.ansari@linaro.org; h=from:subject:message-id;
 bh=+PquDOHITPa6r5CwMnMw5CERKtBpvJTN4CrWndBBerw=;
 b=owGbwMvMwCXmtuJiX/SRuS2Mp9WSGNLmuQvtlrDT3WX4lX2hxEEp80n1fUnnqnqnW93gcTW29
 syfnaDTUcrCIMbFICumyHK46cua19udhK5srzoFM4eVCWQIAxenAExk32WGv7LPcpxO7PnvUaG+
 bW/1rz977i+6ZGf7s+fvHcPwxWuf1BUxMpxcXXO3ZMunk076N4xTWAxeyh//+F+sbtlNB8fqFew
 pUxkB
X-Developer-Key: i=rayyan.ansari@linaro.org; a=openpgp;
 fpr=C382F4ACEBB74212D4B77ACA46A8D18E5BC49D84

Hi,
These patches fix all [1] warnings whilst running
make dtbs_check DT_SCHEMA_FILES=qcom,spmi-pmic.yaml
on both arm and arm64 qcom device trees.

[1]: There is still one warning left that was fixed by an earlier patch
by someone else, which has not been picked up: 
https://lore.kernel.org/all/20240606181027.98537-2-adrian@travitia.xyz/

Signed-off-by: Rayyan Ansari <rayyan.ansari@linaro.org>
---
Rayyan Ansari (3):
      arm64: dts: qcom: pmi8994: Add label to wled node
      arm64: dts: qcom: pmi8950: Remove address from lpg node
      ARM: dts: qcom: pma8084: add pon node

 arch/arm/boot/dts/qcom/pma8084.dtsi   | 14 +++++++++-----
 arch/arm64/boot/dts/qcom/pmi8950.dtsi |  3 +--
 arch/arm64/boot/dts/qcom/pmi8994.dtsi |  3 +++
 3 files changed, 13 insertions(+), 7 deletions(-)
---
base-commit: dee7f101b64219f512bb2f842227bd04c14efe30
change-id: 20240722-pmic-bindings-756df58afa15

Best regards,
-- 
Rayyan Ansari <rayyan.ansari@linaro.org>


