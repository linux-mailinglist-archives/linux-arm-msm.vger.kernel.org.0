Return-Path: <linux-arm-msm+bounces-74349-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A7FC5B8DCB4
	for <lists+linux-arm-msm@lfdr.de>; Sun, 21 Sep 2025 15:57:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5706D440B6A
	for <lists+linux-arm-msm@lfdr.de>; Sun, 21 Sep 2025 13:57:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8B8792D6E53;
	Sun, 21 Sep 2025 13:57:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nl+8CUK1"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 186212D239F
	for <linux-arm-msm@vger.kernel.org>; Sun, 21 Sep 2025 13:57:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758463041; cv=none; b=nzDOzqFP8dQnYxGsrlJJG+7m+KxsiLMbcwqVbi/X8RJhnEbwhjt8MgISwe3liSu3NiLjkI9YKQ3wAC4F+KlZW1SDrDr3Kug6icL5TxV4eHy7RzlHonrQaBCVICxMvG/d9NKYDGuDgUL4sX+KrNPBOfafynZ1AzeeZ5zV0I0gvDA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758463041; c=relaxed/simple;
	bh=fHlIY9+uhSJm0tDafJHi34eihV/XQEMibtOTvhxc7No=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=DnZKbts0VSKJI+GjCxSwzDC2r8i0hP6s9b1yGlmWTPjL4d/wOaklYso+Juv6BIXGwDsalxKz34tr/KqVHEpgIUq+WdiTowNBxvdCQnoFATc0pQVM6EMXWM7XRNAlfGlu/Z8b6nfL9aSjbI+lCOmxTNml2AGtTinNo0F4VYq4dng=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nl+8CUK1; arc=none smtp.client-ip=209.85.214.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-2445806df50so27683295ad.1
        for <linux-arm-msm@vger.kernel.org>; Sun, 21 Sep 2025 06:57:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758463039; x=1759067839; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=JwKtMMVVH553vWqd1jOUT4NC0ABE2UrFAfCYIBs6Ut0=;
        b=nl+8CUK1Q/W8QCa9kKIneYcG7oMgpKPCZUAg2/zEbrIhBE3WTB7O0UkYaw7GIlZLlu
         LrMvIadvWfGQZ2aGQkAVNW7GpTSzHJZfkUXHfbhvDGW81ixdX8N0W6453Bra5tfAlcAb
         yJKtmQ8StMtFwHaPKHp425x0IFFeljHtFq3hM/5siu2ZxTs3riDaOdw+UfIpGUfk1bIs
         ffyet5vEY8TqEGywUNPwzRMDinFu/wSkSkw4XFyWbgNT2m2aU6nenmS9pJ9aMCcU5X7L
         x4cnXNp/H3HKDGX7Cu+edqoYM9HTyeUQtf+yy3cDfBiTzphsuqhKvsHErbf3ZbepXTyf
         OlMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758463039; x=1759067839;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JwKtMMVVH553vWqd1jOUT4NC0ABE2UrFAfCYIBs6Ut0=;
        b=QSjvwWFv4Qq5fsjIcJH6Ics43OQGPk2KbL3KldtL2D0X+FFV1fFUpDYHSyL6Ro5Oor
         hMO86Sk/PdUgCm5U4ActNmKzEopGf38gKdinksqFctv/LrGyDr53D4ca/tV7P1v4/ySa
         tLk7W7WDR+EdaNiyqxjIuxhn3LIzNCr456PUfUmVHczOto9Jz3XsBkjwza0WMb1Hsbm1
         hGed7JGbDqHLglITM9oCCVrFDg3Gc98XdHJLte/i4q0ahZS1gH9HaYHhR30M7N5nWOTo
         tB4a+lzGzCVFrNXzq+0s7aMHmxA4pxoakEn+GDMHQYSXhoWHklncRMvQ44naWY8IRQy4
         6IrA==
X-Forwarded-Encrypted: i=1; AJvYcCXDPJWvWS4uJl+OcmtKYRE2cmrmyXwuhIOa+97S3kT3of9KcpmVp8EEj0Rtfcy8obwCJB3aMpjbmwFVpdeq@vger.kernel.org
X-Gm-Message-State: AOJu0Ywuqlz6migS/q0R5PsbjtL1DhqFj7ID2Ti3GfbbKdROuGl0NqrQ
	bZLF45bnZYBOgYRf840FvWe9qaq5MDkdO9S2W9w1Hlg5E1UPpP/GiRjX
X-Gm-Gg: ASbGnctJsn6QpNirNp3Lmbx1fjSncemo0kPF5PONdY46a75r1w8cobuDpUHJ6HIoCKr
	Bg4xLXDL/O7Tc5IGeN6L7pLgRJ6qa6zbhv9s5fNXTUhXPj+bApx43HvnP8thuJ72jOCaHBMnn26
	qgtA8SrZoHKZOMaX5iMI5yxwmR9MIbG3g8sFs9g9Nx4YaiOG0vfN6mJKMyK/LDJaI6Fkrhx8MHz
	9yXODFPK8UyzVI9MUGEBJRy2JG28wlVoWIANKe0SM0zMRfkELrsmMGvS4HCYitbfh7GRpInib0k
	VMRUB/4/GuF1zS+QVX3gJ9cxH74+OByo5YlV1tmSyz/rFnt1HSKZea+EyKNPY3oecWZGsexVnic
	Vhj2m8YixzHn8MRq7IeD1
X-Google-Smtp-Source: AGHT+IGDsKBY3ozuTuBIgDdeQzOEwOHka23t+GrkUMG+515i/Pq9duddouEA6yTXxYZi6jjJjuHSBw==
X-Received: by 2002:a17:903:4b04:b0:235:ed02:288b with SMTP id d9443c01a7336-269ba5167bemr111498925ad.30.1758463039263;
        Sun, 21 Sep 2025 06:57:19 -0700 (PDT)
Received: from archlinux ([191.193.70.152])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-269802df74asm106105725ad.94.2025.09.21.06.57.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 21 Sep 2025 06:57:18 -0700 (PDT)
From: =?UTF-8?q?Eric=20Gon=C3=A7alves?= <ghatto404@gmail.com>
To: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Rob Herring <robh+dt@kernel.org>
Cc: devicetree@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] arm64: dts: qcom: sm8250-samsung-common: correct reserved pins
Date: Sun, 21 Sep 2025 13:56:23 +0000
Message-ID: <20250921135623.273662-1-ghatto404@gmail.com>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The S20 series has additional reserved pins for the fingerprint sensor,
GPIO 20-23. Correct it by adding them into gpio-reserved-ranges.

Signed-off-by: Eric Gonçalves <ghatto404@gmail.com>
---
 arch/arm64/boot/dts/qcom/sm8250-samsung-common.dtsi | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/sm8250-samsung-common.dtsi b/arch/arm64/boot/dts/qcom/sm8250-samsung-common.dtsi
index 96662bf9e527..1680be67e733 100644
--- a/arch/arm64/boot/dts/qcom/sm8250-samsung-common.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8250-samsung-common.dtsi
@@ -159,7 +159,8 @@ &pon_resin {
 };
 
 &tlmm {
-	gpio-reserved-ranges = <40 4>; /* I2C (Unused) */
+	gpio-reserved-ranges = <20 4>, /* SPI (Fingerprint scanner) */
+						   <40 4>; /* I2C (Unused) */
 };
 
 &usb_1 {
-- 
2.51.0


