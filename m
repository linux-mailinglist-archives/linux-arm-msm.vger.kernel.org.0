Return-Path: <linux-arm-msm+bounces-77642-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 98836BE55C4
	for <lists+linux-arm-msm@lfdr.de>; Thu, 16 Oct 2025 22:21:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 471A44E145A
	for <lists+linux-arm-msm@lfdr.de>; Thu, 16 Oct 2025 20:21:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E62E31A9F93;
	Thu, 16 Oct 2025 20:21:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UuREAy2L"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pg1-f180.google.com (mail-pg1-f180.google.com [209.85.215.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E6DB1C8629
	for <linux-arm-msm@vger.kernel.org>; Thu, 16 Oct 2025 20:21:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760646099; cv=none; b=g/LamTx+NKB3w1f9liEiFggieojHRR7NUa26kkkGp454Y3a6GTPNSc6vOumQqiUVH8ulhxVthND7e2pCHzgtQ3OtSpi+B0ZgyY3H2YEYjc6BIVOlAHQLidIL7NESfFwvqXzA7Aubh03YP0pldMwQERUcs0BCr4y3Glc8A6u6JYw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760646099; c=relaxed/simple;
	bh=BcenkE5oij35+qnzDj3O348Sh5xVXKvPOI8nx3wC9MM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=cAPUHcH7qj4E/oAecHt9C6VqpWy1GKUikjXGNwZXoxMWaGGOjOkh/klIpDhFXTwhBJfc6C7JybIASVT+5KHTfJmcNpR/3XyvUSkpwvLnfBhS/EhQEmSlG1rlK00oiJhfNY/6lz7LxVw7C771xY9MGGJAkTYePqVSXmhlrE+0OYk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UuREAy2L; arc=none smtp.client-ip=209.85.215.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pg1-f180.google.com with SMTP id 41be03b00d2f7-b551350adfaso1004777a12.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 16 Oct 2025 13:21:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760646098; x=1761250898; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=t1pnFsgHZlF5IH/3trSxr4jGs6V5/3pIAYyrgqrUrkQ=;
        b=UuREAy2L6RLVl691D9Dcnic3ATmYqvRzlnA7cVGZbKvyy5tox91XzQ1xgAWZ1JmgSN
         ihlpxTNXjiUaaamaQvxqc20le1RYXyWKRCKFqtRv0gLkN3mUZYWB83K+oQpWOSNkEja3
         ps05p3h0q3Lhq6FO/zygPhCTGACe+wGleTNEGRIBmrwgJchMShaxEPmaPL67auhHYQL2
         /EOP9MzjAcmTT10Rf9sx0bFxC8VsY7q+FBuoOBs12mSLaM+9Y1voEdubwysH5ixjo6tR
         ta1aXHWueyV85uD5O8q9lfCNUUJJ3+P2iav0l8rDSkN6N3DmUVPDoGnZnRp5C80NoAPQ
         4YBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760646098; x=1761250898;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=t1pnFsgHZlF5IH/3trSxr4jGs6V5/3pIAYyrgqrUrkQ=;
        b=c+nske6IWXQqAXdZTYsBna+o5sWcA8Ng4e/Td9W98tCPe/ScID5SUYPwyhrus8RKLD
         JZGvHjGaHOlILKIVgul/8JKOOhqsBqRx2c3crV+VTpEPOUfPbWzN46r+xSTQ+99cmOD1
         ZYfZQmUP1oE69+WPOL/pf8BDlF+MUpQsPyKzZF4//PM0BicrHEyYK9c5yULl2gWHSnqj
         ghK2/tmVDfvMvLqCr9JSwQhbtdXvoQ4sSZNHMlAWlLENwiyj8ume+yqCe6HvhcTwxyue
         YXbjdYONq7YA3hy7GJ1p9/pKATD8HXgT3uePc4Xcp2gUz92leQqkR1Btj5CHz692Xbky
         X+bw==
X-Gm-Message-State: AOJu0YzdSEIMvFpaDSXzowTChAXq6nNvEjhZrD/dU7suQEfBGpYO7LDy
	6jU7CdcNbHi28qJGyaadyWEcn70jnlk3v3oUV8Y2SjrNE8xIlbIfsk4/
X-Gm-Gg: ASbGncsGQUtMO4C62ppovRXpK6Hzl3mMJXZMP3oxTYpEMF3LJNoOSnmrQbwBXnYH/es
	/lCS+h/RJnVkXpnVGH5n/m06RIbYRg+PBHERpHgkRdrLrx/X7moVwE/zdAPLeTwSDjCEpFa3lN9
	oZB7omSj6jiUkpCf/pI0nZ+4fKVlrQ1swacqUCMrOKA8hwUlGHYMgwSSquxCf62OqSj4IreSjMa
	BGIWGyV+xqHzICO2leG62emiXojNI9XpJMDbVMqRi3/0yvhcpMjlr7jThBv68bU/lY1eTOLewpO
	C/O2tZQbRcaPtd3xj8+nyMhon9ZGmeUg+ztm/j5O0hMgyjoMCiEPlEPtb63EK+0Qiva7z9tZsM3
	RA6e4M7vva9/nSFZjJLmEnxEHxG8gp0Fn0X+0I4b+5uLl9V3/Wh7UK+AsPOEIKnTDkN9CWtA=
X-Google-Smtp-Source: AGHT+IHmjZIi4WyUkoutLEljD+DOjLSw+pd3IVqb1HXxBYzq13K9zBms3zRTzKYybow/7ckp/YAVTA==
X-Received: by 2002:a17:903:98f:b0:24b:182b:7144 with SMTP id d9443c01a7336-290c9cf8ee7mr13029575ad.7.1760646097545;
        Thu, 16 Oct 2025 13:21:37 -0700 (PDT)
Received: from archlinux ([177.9.216.59])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29099a7d377sm39482115ad.60.2025.10.16.13.21.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Oct 2025 13:21:37 -0700 (PDT)
From: =?UTF-8?q?Eric=20Gon=C3=A7alves?= <ghatto404@gmail.com>
To: Krzysztof Kozlowski <krzk@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [RESEND PATCH v4] arm64: dts: qcom: sm8250-samsung-common: correct reserved pins
Date: Thu, 16 Oct 2025 16:21:29 -0400
Message-ID: <20251016202129.226449-1-ghatto404@gmail.com>
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
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
---
Changes in v4:
- Removed accidental , instead of ; in the last line

Changes in v3:
- Actually fixed <40 4> indentation
Sorry, I still had my editor on 4 spaces a tab

Changes in v2:
- Properly format the <40 4> line
- Added Fixes tag
---
 arch/arm64/boot/dts/qcom/sm8250-samsung-common.dtsi | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/sm8250-samsung-common.dtsi b/arch/arm64/boot/dts/qcom/sm8250-samsung-common.dtsi
index cf3d917addd8..ef7ea4f72bf9 100644
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


