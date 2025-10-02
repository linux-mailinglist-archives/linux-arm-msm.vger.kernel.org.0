Return-Path: <linux-arm-msm+bounces-75829-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DDC6BB4ED6
	for <lists+linux-arm-msm@lfdr.de>; Thu, 02 Oct 2025 20:46:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 427543A7758
	for <lists+linux-arm-msm@lfdr.de>; Thu,  2 Oct 2025 18:46:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7AC9B27B32D;
	Thu,  2 Oct 2025 18:46:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="e2PUofOZ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com [209.85.216.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0CD191E412A
	for <linux-arm-msm@vger.kernel.org>; Thu,  2 Oct 2025 18:45:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759430760; cv=none; b=HMsrhYtq8AO2ngw29ZQF/bG3xGJ7Dlpiv9N9jQD6V5nWeD0W5rxSxt/gyUhWB7phqTegacYEP/wQVnHOzxvuO3Fcapj08V7nueLvEKsIEZhYcT4LRUp0+diCylbQGSTwxtAydpEacYHoGhVas2Md52K3ZHs1EXUmySq62SSlDk8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759430760; c=relaxed/simple;
	bh=Ascy4a+Xeii0NZTr/g7kAFe/Ox0HSoQnoFLYu2nFJE4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=VmfWKR+oojUtu4EFWbadh1BNkquaDlf6Taxk13JmkaOYL7dZXTfFVEAsnkqA27MPKsizXuPTUC0Ty23E5O1y1mWogii0zgQmqfZ+DvUA615OY1vLWsrVU/YNB8syFlLbXmP1Ir3ppAfn1a8tKyKBTd3vCFaxja+FnjPSVACwG3A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=e2PUofOZ; arc=none smtp.client-ip=209.85.216.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f46.google.com with SMTP id 98e67ed59e1d1-3383ac4d130so1360495a91.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 02 Oct 2025 11:45:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759430758; x=1760035558; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=/gi5q0a0nZyS/dfJX3MGDVRu/hHYpidRpZ3Oro0wuwY=;
        b=e2PUofOZbWliyOxrhK/5zDwlNnhjjh2r/Qm/LFQjAbfjAOroVdm5n+hCsiHpxyrSFR
         o6sTEzVFOddbNqRSN1UiAW3BFgDMlKLg1f6+xRn/JUcgajp9R9LZAEfA3svvYkW09m0E
         +5UgKtEutBc74yHQi158b6jvQGL3aPjcsXXcKFcfxFEkwCi4+Li44Cn9VInAWTS7OLBX
         Yv4TGSqpTUkNKHelTr9CkTcpiJMPc4zaTMYFYA9Dle5crbO2QZTRtG8A/xHdWRdbRWYm
         lfQBbun2mPempeBm8TNUe9j3Zk2kWiNb97gVyceP4TfruPHzKulU8xGc5uvA4W/uwd+b
         Bhsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759430758; x=1760035558;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/gi5q0a0nZyS/dfJX3MGDVRu/hHYpidRpZ3Oro0wuwY=;
        b=Sj7GnBBYa2Xkge41+ER/G075r+ByUmSKB4NOguKP6Q/nA35/WLLw4rGIQMwTaQoHSX
         l/oA0vZ4W4GP8P3P1jfvx3Ybw8ssRyNgNlFAOM+Lq4AAhEodWXpOwa81NP1cVrX/2GdP
         Yq4512aYqCV3mikwhPxBV6jaKOg5oFt2OcMObkFpmTeFIIk+RXFhIEhhMxT5BxTfsDf5
         l8/W0g83gFxKl9+rUJ5KDWHjXSCJnWcq834eLOVW/yM6vpN7PQHHfA3pBPPpfeEDXY6/
         1E07Xl8NNvuocpTi/lJSEbxP9t/CSiQ0JyucDGllDlz8s4TG8LAuWsHxAyGruQlsE0Xw
         Rw5Q==
X-Forwarded-Encrypted: i=1; AJvYcCXBacRLNmxP4ab7vMfmzNJdflnqAKkwBA9fb0UYouA8HjcEGGfdIB9pIxj50c7jvEu4SM1VqVyQUr6J32kp@vger.kernel.org
X-Gm-Message-State: AOJu0YyPEvY4NwvslJFR7UUybLdzFWdS4ETxrHDzLUQJCs4uWaHib1/5
	pUJlpIrP4D9TF6LFmAyagfOcaKYGd5L3JNKq8c+lfsKAu5PsaSv+iqv/
X-Gm-Gg: ASbGnctlVFbu1KIgEcbpEOrOcQvhL7pNNRD3GpRzvNk616tjSUwb/dZy0CLwyi7YkAu
	dxji7UiCU4lAfe33Z4Sk53MDUoW/sxueB6qhYD9z0HokVG7xp+v7uCYu3hC0++v5+dpCgarFmI2
	ZBoqzsXMgg/wUd03BVapmgK4joadx6AKw2g/dNT9ya2K41r3sMD44q28NJC1xevmpvYWfwNKDM1
	5uB+M4vViEz8dVBnjmDNzmEWO8pSGxUVM88uDz7N+hUKDyusAedD8Pdq+DMPfO+I6tBkptlofXm
	iLCgHYkhtZB3Wd9ulRy0pZz/md/DLIZjrrnf3JFObEptSQkAHxzZqIrwTAI0I58orgblXPQ0QSf
	G6Bf5xdXW1TrNAe5yMtqXnA0sdBrcNpjGzbdXZ7/LD/h2qxxESfJMZN97
X-Google-Smtp-Source: AGHT+IFD/xR7zKZYq6ViRMZbh2WKNDPDZW4cTflRTL1qJCjXE32+dlrH1auWCgKPbeZC9OKbs2Dm1A==
X-Received: by 2002:a17:90b:17c5:b0:32e:528c:60ee with SMTP id 98e67ed59e1d1-339c27ba49bmr384189a91.24.1759430758146;
        Thu, 02 Oct 2025 11:45:58 -0700 (PDT)
Received: from archlinux ([179.110.144.170])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-339a701bf31sm5600336a91.19.2025.10.02.11.45.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Oct 2025 11:45:57 -0700 (PDT)
From: =?UTF-8?q?Eric=20Gon=C3=A7alves?= <ghatto404@gmail.com>
To: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Rob Herring <robh+dt@kernel.org>
Cc: devicetree@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v4] arm64: dts: qcom: sm8250-samsung-common: correct reserved pins
Date: Thu,  2 Oct 2025 18:44:59 +0000
Message-ID: <20251002184459.15742-1-ghatto404@gmail.com>
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

Fixes: 6657fe9e9f23 ("arm64: dts: qcom: add initial support for Samsung Galaxy S20 FE")
Signed-off-by: Eric Gonçalves <ghatto404@gmail.com>
---
Changes in v4:
- Removed accidental , instead of ; in the last line

Changes in v3:
- Actually fixed <40 4> indentation
Sorry, I still had my editor on 4 spaces a tab

Changes in v2:
- "Fixed" the formatting of the <40 4> line
- Added Fixes tag
---
 arch/arm64/boot/dts/qcom/sm8250-samsung-common.dtsi | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/sm8250-samsung-common.dtsi b/arch/arm64/boot/dts/qcom/sm8250-samsung-common.dtsi
index 96662bf9e527..7696b147e7da 100644
--- a/arch/arm64/boot/dts/qcom/sm8250-samsung-common.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8250-samsung-common.dtsi
@@ -159,7 +159,8 @@ &pon_resin {
 };
 
 &tlmm {
-	gpio-reserved-ranges = <40 4>; /* I2C (Unused) */
+	gpio-reserved-ranges = <20 4>, /* SPI (fingerprint scanner) */
+			       <40 4>; /* Unused */
 };
 
 &usb_1 {
-- 
2.51.0


