Return-Path: <linux-arm-msm+bounces-62375-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id B33B4AE7CBE
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Jun 2025 11:28:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A7DBB1649A8
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Jun 2025 09:28:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0F5532EA47E;
	Wed, 25 Jun 2025 09:19:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="IPWW2O/G"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1D492E62B2
	for <linux-arm-msm@vger.kernel.org>; Wed, 25 Jun 2025 09:19:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750843148; cv=none; b=PlX54DnpXM/av/QrSph92qBercirE7Kfcz/6vQCD5/j7oInPz+1Eb0o8cPeQoVVagaw2AWEalwldMzwzyXHjGLQsuTzjyeOvp23VWBUxt36GkvESYaxNtG0Z+4T/eI3bnPzELu7YPGYa1eNzFrxfph8owvMg++5SkKfGV19FRjw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750843148; c=relaxed/simple;
	bh=pUbk1uqDn3rkUzvHyGVf5FiMIjDaRG8buGqEDrG6+iY=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=t9iW7HktVH9gdwaIwWzXTQeAdhyMj5dVsD8RlLqCxYAoFR1UEncG4zTrOgqXjo0+DmqzCfDEuoXnYu8Y6dVRqR+7k3Au8ZuXXhE10r/pjOVkO1zqyGlhLgD5nsrLKF5edpjxCXJzMhwP4iasWkFRlvIu+ycvbu+Aj9uHsAyqnvU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=IPWW2O/G; arc=none smtp.client-ip=209.85.208.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-607b59b447bso9128728a12.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 25 Jun 2025 02:19:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1750843145; x=1751447945; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=zTFzCvwRXcKyOlaP6VWm+NwlDdnptDG85UUcTbjMo4M=;
        b=IPWW2O/GHDydEyCavPkKeyHTHKHDEbs+3Nv05PlnBskTX4zlSVarCU2A7BO2o02WWr
         oOZMBYwVdJDII9ZWqRzxj5+7sk2WRTPgRRlFNDMVxqIl5HrJWmpRt59exA9rmmrBFXnO
         iXWlfBA6FMx70SAEGhK54vkT0IY/zGtI/E7iypMcJRlkULHPUAx+2i/Vn8kNgIq53QW8
         gsxO0Efa/AYR0Y9cyf0zNDoitBTyLswZ8bgCEcjw+2t4gM2yl/GJlIj3LAfudkG5G+7F
         lC5rdj/qypDpFGNrljitFMyyKNo84qpCEam5z4luPDdL/2lHd7i4eg2Yg+4+4VCBheo7
         Bd7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750843145; x=1751447945;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zTFzCvwRXcKyOlaP6VWm+NwlDdnptDG85UUcTbjMo4M=;
        b=w1rz82qQAcIvisSwA34+IZqloz140oxTm0aVj7OW0xgHaXxxCyHgRJcfXQKd9Jkbrh
         parUY1dpPEm0VJp7EpEAgbnQXdy5fLoduZStlY9X5si/yHpwa5iz/AFy11OXl576DTbP
         xJCZScNTdqFEQg4s35A9+zOcyK2T8qstml8/tM0FVsYmqwxD4qYfj7UQED7TSFAvXOLv
         tyFMyKus+1TTqp9tG5WKhe2DOuz2+FadbXLat95LjaRMVqGIuQ+uZrncYhHHd0mKFGb3
         dNyDCC5jKUA3RkbE+nz1v5yhJ3w/YqUUOlaTRRx/YLsI3jNK6FYgKK66PbqwMjJ6c3os
         FUhg==
X-Forwarded-Encrypted: i=1; AJvYcCWlZ5p/CI9vRbYLM0/uz4Vpks+QOHQ73nQqsFzlXdy7pOHyTwNYgYAPxdFGKivN6AZvhxQ3F9WSqPOscE1O@vger.kernel.org
X-Gm-Message-State: AOJu0Yy7HLt+Zlx7TJI9KDb2Nt8A32lu+qMK4rZG+o9wZDSQeyds/NZ6
	lFQfZEJ/hKgjS4XxFbMU9N/riki1HaaE/Hzb+WpJ6pyZiJ8IWfIP4PfKI8bqu1bVoKBYnkV4BJ2
	iG+kY
X-Gm-Gg: ASbGnctvNSII+aSbx7VEebnyuVTiZiARu9KZkg/lNIxCFjTFYZltYxIacNcigcvAn2Z
	h0larpTEAsm6gKxA6M7CC2y3xd560rO/Y2oyj6U+pY0fSiPMlVU+DM9fL5NF9Etb/v96oYhe2h6
	ai8bvoy0sMabUWNxmatQ0cVSfiI7+ZAP16jcjwe1qOPpe34w//IovRHQ8jhFmw9KcUWTXZz0LYW
	gyW2pCiGAbxkrpHT2N4qj8mALtn5r/ues9xe6nS4AGM5k25LKaWtWcF1S7OKkc0+CKRIDTbq7iN
	PxD4dyHJszvyhfcRL3I185JS0G3BuYLdMYhwaCIyevGjLhB5JMOD5lNgGbzprhDzOPRgmjDUgQI
	ONFpeSB8li6nUVKUIR1WH1V1UxZNITPQG
X-Google-Smtp-Source: AGHT+IH8149yP9D8VkRVzc5ItiuTtvTkM2SP+ZetN60G4hPLdR3fSCS4GsHThskLkKTdSjnQ5A6uxQ==
X-Received: by 2002:a05:6402:2548:b0:604:e33f:e5c0 with SMTP id 4fb4d7f45d1cf-60c4de4fe80mr1738458a12.30.1750843144927;
        Wed, 25 Jun 2025 02:19:04 -0700 (PDT)
Received: from otso.local (144-178-202-138.static.ef-service.nl. [144.178.202.138])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-60c2f196f84sm2194802a12.14.2025.06.25.02.19.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Jun 2025 02:19:04 -0700 (PDT)
From: Luca Weiss <luca.weiss@fairphone.com>
Subject: [PATCH 0/4] Add RPMh regulator support for PM7550 & PMR735B
Date: Wed, 25 Jun 2025 11:18:55 +0200
Message-Id: <20250625-pm7550-pmr735b-rpmh-regs-v1-0-cab8ef2e5c92@fairphone.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAP++W2gC/x2MQQqEMAwAvyI5G4gtsepXZA/qZjUHtaQgQvHvW
 zwNc5jJkMRUEgxVBpNLk55HkaauYNmmYxXUb3Fw5Jha5zHugZkKLHie0eK+ocmakFrqgvDsp76
 HkkeTn97vevw8zx+M1CBJagAAAA==
X-Change-ID: 20250623-pm7550-pmr735b-rpmh-regs-06087e5b3a99
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, Luca Weiss <luca.weiss@fairphone.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1750843144; l=815;
 i=luca.weiss@fairphone.com; s=20250611; h=from:subject:message-id;
 bh=pUbk1uqDn3rkUzvHyGVf5FiMIjDaRG8buGqEDrG6+iY=;
 b=9SrihxBYIY5Fo98SHHtSnS8hT8vJEMRffaa99XV2DXPTTOlML224CrfPKke4PaDDTj/ageEdP
 QhFBOtbw+BWDlxNRwakK2ZhdgZpY6D9Pk5a8taiiIRq8Nt8dXilDPmS
X-Developer-Key: i=luca.weiss@fairphone.com; a=ed25519;
 pk=O1aw+AAust5lEmgrNJ1Bs7PTY0fEsJm+mdkjExA69q8=

Document and add support for the regulators on PM7550 and PMR735B, which
can be paired with the SM7635 SoC.

Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
Luca Weiss (4):
      regulator: dt-bindings: qcom,rpmh: Add PM7550 compatible
      regulator: dt-bindings: qcom,rpmh: Add PMR735B compatible
      regulator: qcom-rpmh: add support for pmr735b regulators
      regulator: qcom-rpmh: add support for pm7550 regulators

 .../bindings/regulator/qcom,rpmh-regulator.yaml    | 35 +++++++++++++
 drivers/regulator/qcom-rpmh-regulator.c            | 58 ++++++++++++++++++++++
 2 files changed, 93 insertions(+)
---
base-commit: 19272b37aa4f83ca52bdf9c16d5d81bdd1354494
change-id: 20250623-pm7550-pmr735b-rpmh-regs-06087e5b3a99

Best regards,
-- 
Luca Weiss <luca.weiss@fairphone.com>


