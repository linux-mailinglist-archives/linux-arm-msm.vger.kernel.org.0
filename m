Return-Path: <linux-arm-msm+bounces-49985-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 88E52A4BF6A
	for <lists+linux-arm-msm@lfdr.de>; Mon,  3 Mar 2025 12:54:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 107DC1888C0D
	for <lists+linux-arm-msm@lfdr.de>; Mon,  3 Mar 2025 11:53:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4C8CA20C003;
	Mon,  3 Mar 2025 11:53:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="UshAcp70"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6BFF20C471
	for <linux-arm-msm@vger.kernel.org>; Mon,  3 Mar 2025 11:53:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741002793; cv=none; b=FIhH8NMeB61znKo1/KYr2MA8tvuGrcSybZx2frDSrHV3LwKwvVmvQVhCpTscLli+qBw5xQDAPefiIN65PDfEk5I6W2vA8WSfr/tu2oVFZTV4VKd5PaauRlACQ3BXkpn8DydP2ycfQA0cKQZ5E3wizh5ZA1WfRBDm6JHODlEh5Ys=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741002793; c=relaxed/simple;
	bh=weuzDKCsQiMr3iqm68yFLz1cNSwdbqWoaxOIGm3Qv1Q=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=VEI511hqLFzdLKvl229PjHHwjx8YkL1O32ktIYkazQs9iokfXQKcX9WYveWo+X8b+7V8Evtkv1gEBsSKR4ZkFUefeQpiqLpD4gWdTSetpSpH5h5XdILbqeRgVvj+5Xwq+B5Q1PbVffb1a6RL7ruGGgawv3nOg0Op6AqptWhqYPI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=UshAcp70; arc=none smtp.client-ip=209.85.218.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-ab78e6edb99so601428266b.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 03 Mar 2025 03:53:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1741002789; x=1741607589; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=yFk+AUCXrKYMFB3jOa4VTmIBB7qGuqY5Tz3fdWlt8X8=;
        b=UshAcp70bwLfueH9nQU4muj4dZfypc+TVIiBCwvARiyGQTMstAhK+bg5aQm6zCbylC
         3VRUuzd26k3HJG+y4pInEjxD/RFGMM46J93wdtQB3n43RfCDy5/qgv/+t/yZTfe1WpOA
         oU/nXM/Mu5N2GSeexZIUpMbl8gs1L8ZAVBhwb+5g+HgcbeaUuNzwqpflt7T8iSKTlzNY
         DCx5xQp6Ii/vHUz54glYaOS9nN/ODF/lPZzfWQZVUs3j7C6+744DQxEOS4YKrF7gacxp
         6vWZupHktV74iEzh4NBlHRY2lC/PB5HbwCpKAjrH2yMyujbps4qAnTOTgQJ/AjgnVT7t
         wW5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741002789; x=1741607589;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=yFk+AUCXrKYMFB3jOa4VTmIBB7qGuqY5Tz3fdWlt8X8=;
        b=w3po+594ENPB4kRzTlUeM1sbV0gXXu4ApjVLzdf53api/W19FnO0Zdpau8jlwdSqnp
         A589Ge6slIkMv5nbp9CuE0M69GJOAVn+LtifgB4KV+98sUUR4gSGcQOZ4QRv7lDH+Pha
         9r+vV+MxAloZjd5e9UcVNGsqp+xpaMnokKy0uq2N1Ot1aVfNHnDF7FpVlUEVJn7JkH0I
         B4OTQPLnlOfwH3HQ6cmy0/VEH0vfHYP6vCHEEcHYZu6Wl3Ut0m/r0SHMn/X2nbVlx0KW
         4iaOF7xS1hSAVLuVoP2sWWMPkDiVFDJczjtO5iOULyDZDqqpQqWZzkbuMTJwpVwt6M2X
         0AAQ==
X-Forwarded-Encrypted: i=1; AJvYcCVMzjBjB4IccufeH0GIJpU2jL6BIgUySpRalbX3GWD5s3zhWULoBKnZB1XzcBGcptkpaQu2PAvC2WpEGF6l@vger.kernel.org
X-Gm-Message-State: AOJu0YxdOAA9snW7pUArWaFUu3aCPCk+5RKRmt75Qoc5MGC+xa+dLVdP
	ohR/9qgXRLL6rDytp1BpUJq+1eEyBwxyIexrHrRQITgW86IXxeUrydz7f+X5fT8=
X-Gm-Gg: ASbGncvmM2SOgvLDgunzJW7zzeBKdWnpGHViv77eopwDNbrRe4vUmwhjxWmOEJpmji/
	f8W6V55cf1ExpYzTwyqcG/wUKo6EX25t6gKbO4BnVh6bM5jNJ8dPYesSQwOV+3k645jQ03LEit9
	/H+csKq2G9dcMs0JzFXvwL30+Lr0C5mQyVaDFWB1Qc99IJXvrk8GYz+fj0b+jPSAT3WltUvUQCD
	pAJQCVoqFAqKuWE6GeEc+/RcguQZCQ44su+7T/95pJGk/ZdBKGdfqdJIIGHjcfdfM+jDkTL00r2
	2I+tMKKnU1Zy71aTzZwSTped559xOvmF7eRaHbYMzmQ=
X-Google-Smtp-Source: AGHT+IFEhX0K2m/xxoCepy05vSD+L8QdDqMDgYEprV1OF5Vyr84x+ua4osWWJ20v8KKeG7laOTv8/Q==
X-Received: by 2002:a17:906:a389:b0:abf:486a:5e0e with SMTP id a640c23a62f3a-abf486a6354mr945646866b.22.1741002789119;
        Mon, 03 Mar 2025 03:53:09 -0800 (PST)
Received: from [127.0.1.1] ([62.231.96.41])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ac1de83fa49sm86833866b.158.2025.03.03.03.53.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Mar 2025 03:53:08 -0800 (PST)
From: Abel Vesa <abel.vesa@linaro.org>
Subject: [PATCH v3 0/3] leds: rgb: leds-qcom-lpg: PWM fixes
Date: Mon, 03 Mar 2025 13:52:49 +0200
Message-Id: <20250303-leds-qcom-lpg-fix-max-pwm-on-hi-res-v3-0-62703c0ab76a@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIABKYxWcC/5WNQQ6CMBBFr0Jm7Zi2BoquvIdhUWGESaCtU4MYw
 t2t3MDl+/l5b4VEwpTgUqwgNHPi4DOcDgW0g/M9IXeZwShTKmMUjtQlfLZhwjH2+OAFJ7dgfE8
 YPA6MQglVZam2tXH2fIdsikL5uFduTeaB0yvIZ4/O+rf+5581anS60tRWVpErryN7J+EYpIdm2
 7Yv84jMGNcAAAA=
X-Change-ID: 20250220-leds-qcom-lpg-fix-max-pwm-on-hi-res-067e8782a79b
To: Lee Jones <lee@kernel.org>, Pavel Machek <pavel@kernel.org>, 
 Anjelique Melendez <anjelique.melendez@oss.qualcomm.com>
Cc: =?utf-8?q?Uwe_Kleine-K=C3=B6nig?= <ukleinek@kernel.org>, 
 Kamal Wadhwa <quic_kamalw@quicinc.com>, 
 Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Johan Hovold <johan@kernel.org>, 
 Sebastian Reichel <sre@kernel.org>, Pavel Machek <pavel@ucw.cz>, 
 linux-leds@vger.kernel.org, linux-pwm@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Abel Vesa <abel.vesa@linaro.org>, stable@vger.kernel.org
X-Mailer: b4 0.15-dev-dedf8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1832; i=abel.vesa@linaro.org;
 h=from:subject:message-id; bh=weuzDKCsQiMr3iqm68yFLz1cNSwdbqWoaxOIGm3Qv1Q=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBnxZgYd2y1ePd7e26DC8gF6jUr1+KlcJIjfd8Rr
 zgdzdceoH+JAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCZ8WYGAAKCRAbX0TJAJUV
 VkIJD/0Q409NWJSNEHd+fCoQUYi0dSBHe3lxpE/IltreHBhmQv0actfrY25E4+jsyQgnRmejHuL
 xXae9PGPduXBbUH6+311xQazz/EcbttQuBeKA6FAjMW7hPohIzKojja4+D45PAzsOEq19tGjDca
 V/hep0WSJLaQfQ3CidSpene/fo3civL7WpPhfvZcWy9EnGLwBiczgy6hp8ox7BvBqENxEYu1znc
 Tjc096J++kZLATDklZ3oCwfiV++d/uJ4ZPGnW1jGGYgquNWNNTp//joJ7ZcbosTZsIZTZi8Co60
 QzxLrla/Ivm1+gqj1dw2djEY5zcBPQwltu7aEnl8ko488C6TgcQtc0TS8QeJhA/1A/Rz0NAnYCh
 eTWS5a0tMeUJfIbjN46F2Nyua1OpZP/d1pwSNj/jwHfamKaf2odzjwKV2C4Rf/3ksuucDdDwYmu
 Q2migLWKqqrbmwLq09xAFlYwXMDb2EoL34zT7lLpKUEYXmZFxR8E3i/JWpgxswPn1eP0rT+as8k
 LxSqfhNfbudOJwoAU/GCpNCnd5rw7tdkAejXR1bqqSu4XQ8XuYb3kiaakvdq+JwJ1+l1mpcShOd
 ROxTRZmNbPv31Mg64AQsmaOl0jSUjMrlfSf3hilAlAX2GGU1WkSRILclJP1GSekX5C7Me/AjEpS
 OF1KY1ALG6rJnzw==
X-Developer-Key: i=abel.vesa@linaro.org; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE

The PWM allow configuring the PWM resolution from 8 bits PWM
values up to 15 bits values, for the Hi-Res PWMs, and then either
6-bit or 9-bit for the normal PWMs. The current implementation loops
through all possible resolutions (PWM sizes), for the PWM subtype, on top
of the already existing process of determining the prediv, exponent and
refclk.

The first and second issues are related to capping the computed PWM
value.

The third issue is that it uses the wrong maximum possible PWM
value for determining the best matched period.

Fix all of them.

Signed-off-by: Abel Vesa <abel.vesa@linaro.org>
---
Changes in v3:
- Added a new patch that fixes the normal PWMs, since they now support
  6-bit resolution as well. Added it as first patch.
- Re-worded the second patch. Included Bjorn's suggestion and R-b tag.
- Link to v2: https://lore.kernel.org/r/20250226-leds-qcom-lpg-fix-max-pwm-on-hi-res-v2-0-7af5ef5d220b@linaro.org

Changes in v2:
- Re-worded the commit to drop the details that are not important
  w.r.t. what the patch is fixing.
- Added another patch which fixes the resolution used for determining
  best matched period and PWM config.
- Link to v1: https://lore.kernel.org/r/20250220-leds-qcom-lpg-fix-max-pwm-on-hi-res-v1-1-a161ec670ea5@linaro.org

---
Abel Vesa (3):
      leds: rgb: leds-qcom-lpg: Fix pwm resolution max for normal PWMs
      leds: rgb: leds-qcom-lpg: Fix pwm resolution max for Hi-Res PWMs
      leds: rgb: leds-qcom-lpg: Fix calculation of best period Hi-Res PWMs

 drivers/leds/rgb/leds-qcom-lpg.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)
---
base-commit: cd3215bbcb9d4321def93fea6cfad4d5b42b9d1d
change-id: 20250220-leds-qcom-lpg-fix-max-pwm-on-hi-res-067e8782a79b

Best regards,
-- 
Abel Vesa <abel.vesa@linaro.org>


