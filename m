Return-Path: <linux-arm-msm+bounces-50470-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id CD6EBA545CF
	for <lists+linux-arm-msm@lfdr.de>; Thu,  6 Mar 2025 10:05:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 164AE188B1D7
	for <lists+linux-arm-msm@lfdr.de>; Thu,  6 Mar 2025 09:05:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4302A209681;
	Thu,  6 Mar 2025 09:05:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="LV7UTtU2"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58CC520897E
	for <linux-arm-msm@vger.kernel.org>; Thu,  6 Mar 2025 09:05:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741251927; cv=none; b=Z9ZLtl1/VMZtNaljNNSNJgaspDdx/SMRbDdBryfIbKO9KqT5qHPYhihRGw+4KvPUNpn5kVM54XD3OvrinbwKmxNG9lV9q8/qOGV0vUw+jJQ+/rHCtAIvZkZyxoLq9EfONXibyTRdsa2Liy7mN36qeiWqDPvqaBLADn/1UEmknWE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741251927; c=relaxed/simple;
	bh=p1PjBgzx6b5CCqqsstRRWhCBnA7J6btvkzsO7hVie44=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=SAMgzykjgROa1sLLW3/CpV4qT342vSI183h/A4YOvNCg76YOpDQtinQAlpp+R73fH+LFfqUfAQ5kCFDwRfxbSzMdBgLROS1C+Fi0sfPzkET8xJzMytF94k8dBIxurpycMk8I4/pV1+v4Jq1yAk/UKULQVIQVdErRrM9ui2hRxy4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=LV7UTtU2; arc=none smtp.client-ip=209.85.218.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-ac0b6e8d96cso58822966b.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 06 Mar 2025 01:05:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1741251923; x=1741856723; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PrQjM7IQyFKyZiPXOT0aMP5QicIarZ+wMT6jNBpqAVQ=;
        b=LV7UTtU2ImR/dUl5/fulpt4FqB8CUfSnXdTK+cY9OWe2QARhaD9RW+q2yGUydQZOHT
         M7b422T/MqIiDgdSiAckm7M+cyVEx+c0pDhMgdLkIevi5mIZVcrnLW5KOXlBkT0psf9U
         2WwjND6hkCdQ5nJcIUzy1Sr1MbdSrdiPGTl4JcV8q3zZ6F1Kwikbx05pCqEJnzlGqkRx
         fYXJnWfE//vYBc+3ckfrgPdn03MsJOrqvM3bn+lJU4tZ9Xvll7TdPSYAk0HkIYYzlliR
         nFs3emTmgo4yzEgGkYP2Oj5jRHxsCeD5mpkC1VSMlxZV95NYvIjdAX+0qQx/jolGEi0I
         RuIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741251923; x=1741856723;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PrQjM7IQyFKyZiPXOT0aMP5QicIarZ+wMT6jNBpqAVQ=;
        b=SY805ahy7ZLDbb9xQ/t2y6ZO/1v36L3yb6v6oFd3cTrQKRsGD8JaXZPkgbVskm6Iji
         7TneOqmou4HQeeL15GzxsrZ30CssQnhv7Kva7Pvj9CTM/CprTl/wZusq09mFCaTwjuy9
         N6zdn6zm3eyMGVkuzQSuZI/47NhWlwG629Bv0/6vJcKRM/QtRBrvFqtxb/6FtZ0Ekrmc
         WKJKQtoAG3pEwe9/83Dr6tUidWOYM4QFpIZWheNR6qtbkP+N3fopmMD1hXlvZw6h4fyW
         VJg7G9JoUb/DJyzUleifzTHhrlJrUPne6pwNn+bEtiZlKrNUawmJENFbhg4TSLWD7DgR
         l1xA==
X-Forwarded-Encrypted: i=1; AJvYcCVQTo6rcv2YGBVU1uMlF+dq38FA1mpLksU4vxE2DgR3yIwAjBGNkRgWmOYOBX//8+nOUqzV8lm5wwEqQIjC@vger.kernel.org
X-Gm-Message-State: AOJu0YxBSsebuJTjBi3WvCbN/CEjfm0lBkvfLCDW/p9ebP+N1OFfahoN
	adbglJTs6rb2v04Q4O8Qnc+ySrkZl4nmVAdXp63iYo8yFNhDrEmLgxXpoUAdjUU=
X-Gm-Gg: ASbGnctIUSI3d9LC02Qu73BW+gn0LF3GHR0EKU9AG9F1v/cbvgqMxOuDs5i63WYMb4l
	GBnPCwimAomskNDnJ8B5smEd55IjQS/11XwGNTVJ+e6sVwwEzqCeqZaf3PWpVS9OnIrBmSQv9L3
	wokW0x9f7kBdRCih54lf+l9niJE9pSghpOWCOKH0o2o6AwgRK5REUpN5VX/9dauMbG4Uss0HAPY
	95xs/UHzKm8FyuwyIRhEwZeNNSHNuWt24JtVz19e0XgjKg0rLaJTZz1jM/meWuxpCTloDm6ezei
	KBeoX/GRs6WyymVMkRWVoCaeqUBlZNjODl/7lTDyG8Y=
X-Google-Smtp-Source: AGHT+IEGjkDNOrIByxVzQMvdZ3yuv6/fOpZUz6eYYP4NxiiFaRGnAEn+bVqc9B5Gr4Dr3tphGX8DzQ==
X-Received: by 2002:a17:906:cc84:b0:ac2:29cf:643d with SMTP id a640c23a62f3a-ac229cf6594mr206934766b.25.1741251923435;
        Thu, 06 Mar 2025 01:05:23 -0800 (PST)
Received: from hackbox.lan ([62.231.96.41])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ac23943a194sm61606866b.37.2025.03.06.01.05.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Mar 2025 01:05:22 -0800 (PST)
From: Abel Vesa <abel.vesa@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Johan Hovold <johan@kernel.org>,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Sebastian Reichel <sre@kernel.org>
Subject: [RFC 2/2] arm64: dts: qcom: x1e78100-t14s: Add OLED variant
Date: Thu,  6 Mar 2025 11:05:03 +0200
Message-Id: <20250306090503.724390-3-abel.vesa@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250306090503.724390-1-abel.vesa@linaro.org>
References: <20250306090503.724390-1-abel.vesa@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Since the Lenovo Thinkpad T14s Gen6 is available with an OLED, add
dedicated a dedicated dts for it.

This is needed because the backlight is handled differently for OLED
panels when compared to LCD ones.

Signed-off-by: Abel Vesa <abel.vesa@linaro.org>
---
 arch/arm64/boot/dts/qcom/Makefile                           | 1 +
 .../boot/dts/qcom/x1e78100-lenovo-thinkpad-t14s-oled.dts    | 6 ++++++
 2 files changed, 7 insertions(+)
 create mode 100644 arch/arm64/boot/dts/qcom/x1e78100-lenovo-thinkpad-t14s-oled.dts

diff --git a/arch/arm64/boot/dts/qcom/Makefile b/arch/arm64/boot/dts/qcom/Makefile
index b54f45b3bec8..df8d63560d06 100644
--- a/arch/arm64/boot/dts/qcom/Makefile
+++ b/arch/arm64/boot/dts/qcom/Makefile
@@ -290,6 +290,7 @@ dtb-$(CONFIG_ARCH_QCOM)	+= sm8750-mtp.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= sm8750-qrd.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= x1e001de-devkit.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= x1e78100-lenovo-thinkpad-t14s.dtb
+dtb-$(CONFIG_ARCH_QCOM)	+= x1e78100-lenovo-thinkpad-t14s-oled.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= x1e80100-asus-vivobook-s15.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= x1e80100-crd.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= x1e80100-dell-xps13-9345.dtb
diff --git a/arch/arm64/boot/dts/qcom/x1e78100-lenovo-thinkpad-t14s-oled.dts b/arch/arm64/boot/dts/qcom/x1e78100-lenovo-thinkpad-t14s-oled.dts
new file mode 100644
index 000000000000..1891f6143ec9
--- /dev/null
+++ b/arch/arm64/boot/dts/qcom/x1e78100-lenovo-thinkpad-t14s-oled.dts
@@ -0,0 +1,6 @@
+// SPDX-License-Identifier: BSD-3-Clause
+/*
+ * Copyright (c) 2025, Linaro Limited
+ */
+
+#include "x1e78100-lenovo-thinkpad-t14s.dtsi"
-- 
2.34.1


