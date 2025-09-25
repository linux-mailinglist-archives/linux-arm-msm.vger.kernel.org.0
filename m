Return-Path: <linux-arm-msm+bounces-75051-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D56CB9E918
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Sep 2025 12:08:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 3D8C94E1111
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Sep 2025 10:08:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4A8882EAD18;
	Thu, 25 Sep 2025 10:07:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="nD2f0lnn"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F96D2EA48D
	for <linux-arm-msm@vger.kernel.org>; Thu, 25 Sep 2025 10:07:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758794872; cv=none; b=VqUuNMm8ik0SetHEPFPl6YcKeOgL2yzVjXxdYHFV6GJy0YkatlxZ49j3XM0SrBSJqLs5pGgBMFPh/Ghibjbg70FZ/EAAOpAj8G+dwgZVoB5A4w55J2h5k1fb2K+Jihaj4n8YKD5PwojVu2+4b0VHhdtIztZxj1FsDHp5T3QB2i4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758794872; c=relaxed/simple;
	bh=2wAPPbqLo2LqU/nTBFwRHUuMpcX/WMRKMRc0AgRIv18=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=H91r4sK9umV7Bg4mV8uyANirk24M3K1YKqrrKD497CE0MZ5g+lhyQCc5HXWC8oeECI+4Ft0ROjLha1v3pc2OFV9TeqbVeNoL8G38aYNtpWtUmCL4bCpbW0Z3qu0KpCA+KgBLaq/NbAi69Ma+PBrXMhXzHNk/zdq+m2tJR1xPYcg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=nD2f0lnn; arc=none smtp.client-ip=209.85.218.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-b33d785db6fso147862366b.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 25 Sep 2025 03:07:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1758794868; x=1759399668; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=RQA2xq7mI4lOuuo7UB6QFY4SFCKqLwIJHu6LK04sK3w=;
        b=nD2f0lnncVnT4QZlW9KHYIBQyCCpLCF4x2U6jsXUfoNo23H62ShBrU7PhHzT5FCjyw
         4bpYiB9zQSUXFS0+5d78bSWCgvfW0cKM/1RkEgb/kSrOtOcK4TxiSGy8mggQiHI4ykUm
         KS/27UcYF5kYw2xDUX/9X+36i6M9ahOjEFDAm5Pr7zHxRS/qhCnEg0rpGfyczfD9lC1N
         q/7xvtHJMDUZE30r2OWuoNuQLMt8dynXRvYf6UIDzaN7IijoBReIkjOryNQ8QHfKc1hs
         /6xby/oe/evOL8uObx6MTC+Wk1Q5Si/MTyijB8pXoISS6Mhzlfhd047IIqZDHYnHqKOC
         yEuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758794868; x=1759399668;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=RQA2xq7mI4lOuuo7UB6QFY4SFCKqLwIJHu6LK04sK3w=;
        b=HhItspHTDQMfQ8N/xwE5KNviuViH0LDD57JRIgfVu3x/tuoXuTO6+tJ6aOy8+0Qf4M
         GvuigW90j3R3oRtSNDf/fXuJQaFKKPKPpqI1Jwf+6NcleQTPYqHUrNEaLr1IpENpLyZ9
         z6b4iEgRq9MXLyBZ7z5EJmBaXINbczAx+xq3NtdV1N+BNnX5tI+w5yxvxTydIUx27jlC
         R0J7WMEctoa3pqM9O75p5/smROsMeNxyMIJhP8KSsPLWy0qzNrKReVcgNvoB7OvoC5QL
         n32OvJKjE9Y9qnA4AiJSiCt5/HbRAdK1nNCXakYSo6RWcOAngKDEjm1ecML1Y7I6MgOH
         ewkA==
X-Forwarded-Encrypted: i=1; AJvYcCXC3zCg+Vol7areBjql3nUtqWFMT8EkKroFa0ylMx8jIEqrxQENya+c6Q+g22/+9yMB2o4ZYizQlqr67RZU@vger.kernel.org
X-Gm-Message-State: AOJu0YxgXB2TE0zOoFortWoyJJv0dNeqYrzWuJnQugQdsn3P3fmrIxd2
	dXoyUdfkMyI/KR5EsW58j4BCYrlrlxikjW10iuRngbI53xk361oammksfdNuW9mIfsI=
X-Gm-Gg: ASbGncskE+4mdjQn74dmSqRm3t4zP1A882wo+qbFWveCPHjcGynLwyNP5pbYZdAZnhj
	EnCNR3r+VsI26ZB1PDk68tVWlHQdSdle4qg7FT6hzT35eiCX3aQon69/DvLHr6fH1wKuRFYFBFd
	pKJSEaucpuqCBMXyzZHcQvxHPgA00gc1PuwannIidxhWkTZ2mrE12Qrzi28C94+4z6FprcR+qh4
	ba8PZ5vNh+Iy0PmiyhMC0Zj4doC69c4H232Ahodf79AL18pza+vycM9aYkQw3k9Jg93iCR1gwTw
	PNNC2iqJkw59Am00znUNycNecAzTjIJFON3msWKdkii+Jf3wMr1nVecQPlQYPNUHwn59xx5VSYP
	bMJhJnydey+g7hzSgOzCywGr50wYH0Ibyc/7T4BxEllYgUTaCqFtEtxN/OhAHXDauzoNyP7uWK5
	+LJkXi
X-Google-Smtp-Source: AGHT+IE8TAQ0ieTHgs4m7gim+fRDgMGDmFFmvRIfockvNvymGGa0I6tPXCyGsiDJM+I3Aju2cVvIZg==
X-Received: by 2002:a17:907:94c7:b0:b2d:804c:f5c with SMTP id a640c23a62f3a-b34b684a76bmr362320866b.4.1758794866008;
        Thu, 25 Sep 2025 03:07:46 -0700 (PDT)
Received: from [172.16.220.225] (144-178-202-139.static.ef-service.nl. [144.178.202.139])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b35446f7746sm134270766b.59.2025.09.25.03.07.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Sep 2025 03:07:45 -0700 (PDT)
From: Griffin Kroah-Hartman <griffin.kroah@fairphone.com>
Subject: [PATCH RESEND v3 0/3] Add support for Awinic AW86927 haptic driver
Date: Thu, 25 Sep 2025 12:07:27 +0200
Message-Id: <20250925-aw86927-v3-0-1fc6265b42de@fairphone.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, 
 Luca Weiss <luca.weiss@fairphone.com>
Cc: linux-input@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 Griffin Kroah-Hartman <griffin.kroah@fairphone.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1758794865; l=1819;
 i=griffin.kroah@fairphone.com; s=20250804; h=from:subject:message-id;
 bh=2wAPPbqLo2LqU/nTBFwRHUuMpcX/WMRKMRc0AgRIv18=;
 b=K6q9xHDFqVzGDg0/K3TIC4M42C44EAjwZ3LnaQSldYEZrPR+LSp9uqb03ogPaOSd/mx0AmbMf
 4OybTK6Nk29BQYXsj4zEvBALFeNtIKQfZxmoX+kXzUcHlaZ331S+tPO
X-Developer-Key: i=griffin.kroah@fairphone.com; a=ed25519;
 pk=drSBvqKFiR+xucmLWONHSq/wGrW+YvcVtBXFYnYzn8U=

Add devicetree bindings and a driver for the AW86927 haptic driver, and
add it to the devicetree for the Fairphone 5 smartphone.

This driver does not enable all capabilities of the AW86927, features
such as f0 detection, rtp mode, and cont mode are not included.

Note: This is my first driver I have ever worked on so if there is
anything I can do to improve it please let me know!

Signed-off-by: Griffin Kroah-Hartman <griffin.kroah@fairphone.com>
---
Changes in v3:
- Removed obsolete FIXME comments
- Adjusted Error handling to fit best practice
- Changed formatting due to feedback
- Removed obsolete terminology from patch subjects.
- Properly credited reviewers
- Link to v2: https://lore.kernel.org/r/20250811-aw86927-v2-0-64be8f3da560@fairphone.com

Changes in v2:
- Changed title and fixed license of devicetree binding
- Fixed typo where the 'm' in 'ms' was excluded
- Changed error handling return values in driver probe function
- Link to v1: https://lore.kernel.org/r/20250806-aw86927-v1-0-23d8a6d0f2b2@fairphone.com

---
Griffin Kroah-Hartman (3):
      dt-bindings: input: Add Awinic AW86927
      Input: aw86927 - add driver for Awinic AW86927
      arm64: dts: qcom: qcm6490-fairphone-fp5: Add vibrator support

 .../devicetree/bindings/input/awinic,aw86927.yaml  |  48 ++
 arch/arm64/boot/dts/qcom/qcm6490-fairphone-fp5.dts |  18 +-
 drivers/input/misc/Kconfig                         |  11 +
 drivers/input/misc/Makefile                        |   1 +
 drivers/input/misc/aw86927.c                       | 854 +++++++++++++++++++++
 5 files changed, 931 insertions(+), 1 deletion(-)
---
base-commit: 3624e9a34b36d64a7037946eda28ae9599363a3b
change-id: 20250804-aw86927-9dddc32fcaec

Best regards,
-- 
Griffin Kroah-Hartman <griffin.kroah@fairphone.com>


