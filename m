Return-Path: <linux-arm-msm+bounces-61819-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 54333AE095B
	for <lists+linux-arm-msm@lfdr.de>; Thu, 19 Jun 2025 16:57:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 5F3D41BC7CA5
	for <lists+linux-arm-msm@lfdr.de>; Thu, 19 Jun 2025 14:55:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9E458269B01;
	Thu, 19 Jun 2025 14:55:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="f5Y+sFRC"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA963267714
	for <linux-arm-msm@vger.kernel.org>; Thu, 19 Jun 2025 14:55:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750344920; cv=none; b=Xcb7GuPn/ZKgDILyQryWFfdNBzJDX4lokOBarRe3GGpJWorulWoVC6+bu2Wg0oIKosltF6XVvujj1aylRPVL8AvnC3rRQVHRgFhFoCxJUvYTnY8IHkzyt4pBKiWeCWQ7R/z7t5Nm0+lzDnRG+CWTzHjmh4M8mUnh+eFOSxMIW10=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750344920; c=relaxed/simple;
	bh=4LGiNnB42HT/satjOaXpllHvqUrhfVY8Ni1b3Yq5VS4=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=GKh2WOPX0fhSNtkVcZdPBxdnEUECjYwTZarIv49WDYAoDrFF6YuNYVKZ/2jJmRCVpGU4TOqlQUMvyGsAeHPU9Ryp+lxjpfpFuiGQR1Ka0aaltPhAVZ6t9FzE3TynOFV7EpNflShbL7rj6JKzDD6isMYRNgK7EgtUZxmrg9PzSyk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=f5Y+sFRC; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-451dbe494d6so10571685e9.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 19 Jun 2025 07:55:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1750344916; x=1750949716; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=4USzl16XHbjEvoqhmZEboDyYQXTg9f/7FGZf3i+x69k=;
        b=f5Y+sFRCGXAtX7E+WgWJQ3/z/VxGBSL9+AgKoy4VRaPu79zOhybRXYGNlUe3mcH0O0
         BIZilJlhWdTq7NizVuKIhk5X2k0tYcATpZY/aJfZ/cf0UFuv8ha4cKHMcz+/V/aUnsLW
         eyClWvwOH2MlD2W9mRBgELI0x4enylXCq+nVEB8sGqip1Y6WMbiYf3CGtsSgo2+QmHb0
         69T8iaCvEbi0wouWZqhFxzgzBsOXAomfyzzq3CsJi/iWr2hPUN195B+ytEqSqwthGMqm
         ORRpxQj/VjtvZJwvfUapxq80eeaYEHrP1eonksrzqJ1+2OQHdsu8pEmTT2N7cowwLB8u
         3Gqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750344916; x=1750949716;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4USzl16XHbjEvoqhmZEboDyYQXTg9f/7FGZf3i+x69k=;
        b=PRn3p5irdHbDORawbqOJGN1X1oBkw7a4nApObqeYEaaoJGaeyx1O1nnVc9ETJjBOoM
         3r15pBtowlVWBF3upUNB2zrPhiL+EWfWGwo02djxgslnq7CRqObIWJkJWfjcXwVWi5rP
         SuQ8DvU7PStfJ35HvqfrpOxJC3AhtP5iOtPK6E5aHOFe4JaEIrQc9uN39GHjncD4aVK6
         3ycuo5eFARUG3EZyL0tlyKhSAao0xGMKOjtL/LfN8UaaecC4i/73S+TBg5Jc+RF0HZnb
         9n3Mp8cU5y4CbNnaoT8bsZpyTZAD16Cn3Ga30qynL0m5Q6SNplet1kRnXfnJl4KS2Aun
         /dug==
X-Gm-Message-State: AOJu0YyZxDuqJ3eGMsd9ZllZDLxxa0kmSVZX5a3Sbj5LnC7ZjDgKldwX
	J86tRv7exIHnStzLSdUBPi5adEcgQ49esPDFNXAwyISwCtdZpMc8bLHJfHJ5Br81klo=
X-Gm-Gg: ASbGncsN72Hxduf7qgykEWMNFMNBFBBaWL9ENoexIb24slzr0V76xSwyDjhnP8xa+qu
	vtTuF19epZMxGgW7k54sNRC1H48G3LGAmNYD51ub0bdA7NzGJy7JHzeLjBIVesjmBNOSdr6pdxp
	4GC1XRgQcwJhXFbw/xSHWj01crLdSjSLI6MrmXobl+4Gf3GmryQ/krUNuENyELLH4oOMO647BrB
	q0FMf4CcMLvbiHHWYxy0JRGUrRp2dd90hSkmOkpY6p76U2+D6FKdr+uAujkLvPoyjqBSPpU9cPG
	TFnY0yjhA0N+W9nT9dO2mR9ZxlfaudCZ0u977Z7mde9xYYWcZ5NF2rHHrPVYgtvfq02nordoBSX
	TZxjgMJaiIMk=
X-Google-Smtp-Source: AGHT+IHsS97h8hzfBpiAdoEh1bqIjuOor9mhtoQ7zk3firIt0dQex4OoKJ/uKCBlmaCVrFLgewQWYw==
X-Received: by 2002:a05:600c:a316:b0:43c:fdbe:4398 with SMTP id 5b1f17b1804b1-4533d494104mr157215915e9.6.1750344915914;
        Thu, 19 Jun 2025 07:55:15 -0700 (PDT)
Received: from toyger.tail248178.ts.net ([2a0e:c5c1:0:100:b058:b8f5:b561:423c])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4535ebced8asm31343715e9.40.2025.06.19.07.55.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Jun 2025 07:55:15 -0700 (PDT)
From: Casey Connolly <casey.connolly@linaro.org>
Subject: [PATCH 00/11] power: supply: pmi8998 charger improvements and smb5
 support
Date: Thu, 19 Jun 2025 16:55:08 +0200
Message-Id: <20250619-smb2-smb5-support-v1-0-ac5dec51b6e1@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAMwkVGgC/x2MQQqAIBAAvxJ7TlBBib4SHdK22kMqbkUg/T3rM
 jCHmQKMmZChbwpkvIgphiqqbcBvU1hR0FwdtNRGGtUJ3p3+YASfKcV8CKlsZ9BPdnEOapcyLnT
 /z2F8nhc3OVlSYwAAAA==
X-Change-ID: 20250518-smb2-smb5-support-01685eca6fbb
To: Sebastian Reichel <sre@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Kees Cook <kees@kernel.org>, 
 "Gustavo A. R. Silva" <gustavoars@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-pm@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Sebastian Reichel <sebastian.reichel@collabora.com>, 
 linux-hardening@vger.kernel.org, Casey Connolly <casey.connolly@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2617;
 i=casey.connolly@linaro.org; h=from:subject:message-id;
 bh=4LGiNnB42HT/satjOaXpllHvqUrhfVY8Ni1b3Yq5VS4=;
 b=owEBbQKS/ZANAwAKAQWDMSsZX2S2AcsmYgBoVCTQYi1fZnsxW0KpR2M6N9AhTeUNpZ8R15Xsg
 fASw6hYLiKJAjMEAAEKAB0WIQS2UaFGPGq+0GkMVc0FgzErGV9ktgUCaFQk0AAKCRAFgzErGV9k
 toSNEACcVkJ5pXc4sSBzKt+AtXEXVm3KdSTMeLAl3F94K7QQsZShksHm6I1JXR99tdxwVRMLkxD
 0KKYMExkME3to0PIKKCN7MUXLD6HnS0JhmolahDzcEPB0QbOgEK5de5HCPw3x+jjlma6zGdC6MS
 FVnOHqq4DEn8aTjTxQSEZ8vBqg0lEKLVpxXN+ER5Zj58O4Jnm8gj+5ZjLFCxbV0KpFIy4NKRnYg
 BVB+JaiWkJhKT+A9bpbnDkkahP190kE55ykRlIqaHEmrwJhqj7oWGyvmDG/5fAov1lZiX8VVVsa
 TbCnmO8nWEssBVRB6ojQoF7GOqdzRJOwgn12/dvuTa2J07Qk0Ze77MJNevZTRl/8d7EKmAsLLMf
 HypRX+E6+4KwPa3Mh4YKwgWCAI07jpKVe5PTPqC+rda8YYbcEFL6Xpvz2pd+vt97Ku+w/abOjEk
 LaO7qsrhZEQaEhSPqiPOwNC3Y22jFLYRDkc44f9+mT4KaTDs3kz22zxOf7OMEY01SioV+SrErHC
 GKSamZRxFEHFuPPnH97GMxjBh/85WEwGpk0Y/MBQAcg0y6wNZPSYvXK/nV9eN6jCamg/WUDZhit
 nWQqOyXnBCYmWMk4C6GO7TAxbSIlYydvP6GeAGB0V89ztKNa6DXDbQQgSJgJhtgmUkb2Nm9pRb7
 gCHxlP7kXmSX5hA==
X-Developer-Key: i=casey.connolly@linaro.org; a=openpgp;
 fpr=83B24DA7FE145076BC38BB250CD904EB673A7C47

This series contains fixes and cleanups for the pmi8998 charger driver,
as well as introducing support for the newer smb5 charger found in the
pm8150b and other newer Qualcomm PMICs..

A bug is fixed where wakeirq enable/disable refcounting wasn't respected
when the driver was unloaded and reloaded.

Support is added for disabling charging entirely by writing a 0 to the
"status" register (as described in the psy documentation). This allows
for userspace programs to manage charging, e.g. to stop at 80% capacity.

The AICL re-run interval is programmed to a consistent value (3
seconds).

The battery property charge-term-current-microamp is now respected, this
is used to program the constant charge current limit during the fast
charging phase. This also makes it safer to increase the max current
limit this driver originally imposed from 1A to ~2A. According to the
PMIC docs this is easy to handle without a secondary charger chip (which
most but not all phones have).

Further increasing the charge current limit would require tighter
integration with thermal zones and a mechanism to limit the current
when the device gets too warm (e.g. by modelling the power supply as
a cooling device). This infrastructure is currently missing from the
kernel.

---
Casey Connolly (11):
      dt-bindings: power: supply: qcom,pmi89980-charger: add pm8150b and 7250b
      arm64: dts: qcom: sdm845-oneplus-*: set constant-charge-current-max-microamp
      power: supply: qcom_pmi8998_charger: fix wakeirq
      power: supply: pmi8998_charger: rename to qcom_smbx
      power: supply: qcom_smbx: allow disabling charging
      power: supply: qcom_smbx: respect battery charge-term-current-microamp
      power: supply: qcom_smbx: bump up the max current
      power: supply: qcom_smbx: remove unused registers
      power: supply: qcom_smbx: add smb5 support
      MAINTAINERS: add myself as smbx charger driver maintainer
      power: supply: qcom_smbx: program aicl rerun time

 .../power/supply/qcom,pmi8998-charger.yaml         |   2 +
 MAINTAINERS                                        |   7 +
 .../boot/dts/qcom/sdm845-oneplus-enchilada.dts     |   8 +
 arch/arm64/boot/dts/qcom/sdm845-oneplus-fajita.dts |   8 +
 drivers/power/supply/Makefile                      |   2 +-
 .../supply/{qcom_pmi8998_charger.c => qcom_smbx.c} | 730 ++++++++++++---------
 6 files changed, 430 insertions(+), 327 deletions(-)
---
base-commit: bc6e0ba6c9bafa6241b05524b9829808056ac4ad
change-id: 20250518-smb2-smb5-support-01685eca6fbb

Casey Connolly <casey.connolly@linaro.org>


