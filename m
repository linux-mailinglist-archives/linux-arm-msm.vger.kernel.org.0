Return-Path: <linux-arm-msm+bounces-26175-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A3DE93153E
	for <lists+linux-arm-msm@lfdr.de>; Mon, 15 Jul 2024 15:00:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B08CE1F21B72
	for <lists+linux-arm-msm@lfdr.de>; Mon, 15 Jul 2024 13:00:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CF4B418EA74;
	Mon, 15 Jul 2024 12:57:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="epdGOJ81"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08DCD18EA61
	for <linux-arm-msm@vger.kernel.org>; Mon, 15 Jul 2024 12:57:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721048239; cv=none; b=iTtq36Z0zzR8WCqFfSx7HazOsiBGBa2Cf+W+Zo/X76rcm06ZCZTlYwRWU9mWI3CwzI9bATvu1tXL6+397gt54TAR+wx+3ClKibDjKeU+YrOXkZ/ZIlsDwxCOgryCz/Qsc4R/WZTH3iLurtPb2tM0wmAea/6t6IsYOB5ETf5GjQo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721048239; c=relaxed/simple;
	bh=+4kd2F1VnGUNVU9oW0bAD/syychtxHxo8PxEX9mf8lU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=VXqWqYFGbk6lN1qx8y5MNTf6H5YI7TDxvwoCp3fcniv1A3YYewnpdJaRkl0EJA1c+4mLdn1zUfeOugnllF2FJoIrQhkM0tHMDdRAkL2mTVf/qZnePBtePHT5kdZphjUwKDOjaSRIC9GMfUVPA/x1mYJiqgRJxh9yrxDeWAHEGuA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=epdGOJ81; arc=none smtp.client-ip=209.85.221.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-367993463b8so2410427f8f.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 15 Jul 2024 05:57:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1721048236; x=1721653036; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=BnmqxlBPCkR2j92uKnpeN2blqkcOYQP6/xqO49jA5GI=;
        b=epdGOJ81C972Q6N/kibjjvAz+Bcprfdu2kfWNj2Mr7bL+MJYdKR/mSynoFGqaSHBDt
         4oSyFq3SQodr8Tgf0AxWkwIuFXKIkdX/95qGATCdJcQjiZnqQk+dQt4V4UdxL/jbXCnt
         AUEWEXysJSKcREiJoXAhzJTbhPVhDWlI+oD+doksBxQZtHF/Cn4HItYYO3FP6CV1tjX/
         7xW5h7Aku9rLJHT/Dys0PbkaaqGadGYaNjOkNiyI7SnPA1p2Qb47cAf4rhldfw1FF54P
         yqrmddbtOpUbD6vLXPiKMJGsz9hXjtsFVN5t5AvOFh3WRLMXlrkwcugMBZ1M4AG7OuQ2
         vUwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721048236; x=1721653036;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=BnmqxlBPCkR2j92uKnpeN2blqkcOYQP6/xqO49jA5GI=;
        b=j8f4egJ/R4vYWeGyZyt0qsP74nr42ITxMmkAsU07oFAssgPismZ9VcN4jvxtpds/40
         DmQHy96WeWeEwwyF5sQAPjkS2tR2MUUKSVMgDaDlWAQ+LkYcBCNkRklU+DQIqIQNGPD0
         m+hBD3vdZ+kGl+cJt/DeglAp0LwIInE8VMx3FlQH0FSkR3OiCvHoc03inMMcXgd8FvTh
         Yw7WHKNnXwSh68cuvHUuGixdl7UgGMYKx3M2px0flAFtqxGPcrIR4IN4owA4otZ24lDO
         l7fjJ1eq/ZK77sLrG2VDyloN9ozdgsAnS+AwetdmmvHU+4PS7zaVFMqQW2Z+DlYT0U0R
         LurQ==
X-Forwarded-Encrypted: i=1; AJvYcCW+du46csWKZKxMz5pBFVmZrd6uAL5zHSZz3LN9aqnyZZ2zU6qd6JvHx29OWmPW1W/Bb7h8h0z4OAIyp4CGTHR/mIzuYMn9NJjZYdjsSQ==
X-Gm-Message-State: AOJu0Yzz45BsZ4ofjji2KEqDg3N5NKwIM50FWJalYBbQ0pVkfqfpIxe/
	WLZECcsFnQx/MltJeCSfrwCEb5Xaxiy27f2WAVj2UNYzGMghKV8hPb7wWeR6cUo=
X-Google-Smtp-Source: AGHT+IESyZ4Z7rBrd/pjuZAtkysmd8HKrQLlJxI1+a1THWh40nxYbZNSoSFDLdkyn5qOYjRQF4e3JA==
X-Received: by 2002:a5d:4ed2:0:b0:35f:28e1:5028 with SMTP id ffacd0b85a97d-367cea67f26mr12074672f8f.15.1721048232708;
        Mon, 15 Jul 2024 05:57:12 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:8261:5fff:fe11:bdda])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3680dafbf19sm6303018f8f.68.2024.07.15.05.57.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Jul 2024 05:57:12 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Mon, 15 Jul 2024 14:57:06 +0200
Subject: [PATCH] power: supply: qcom_battmgr: return EAGAIN when firmware
 service is not up
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240715-topic-sm8x50-upstream-fix-battmgr-temp-tz-warn-v1-1-16e842ccead7@linaro.org>
X-B4-Tracking: v=1; b=H4sIAKEclWYC/x2NQQrCMBAAv1L27EIaGq1+RTzEZFv3kDRsVi0t/
 bvB48Aws0MlYapw63YQ+nDlJTfoTx2El88zIcfGYI0dzKV3qEvhgDWNqzP4LlWFfMKJV3x61TQ
 LKqWCuuHXS8bgvJ2u7hztGKFFi1Bz/8P74zh+jUtAj4AAAAA=
To: Sebastian Reichel <sre@kernel.org>, 
 Bjorn Andersson <andersson@kernel.org>
Cc: Sebastian Reichel <sebastian.reichel@collabora.com>, 
 Daniel Lezcano <daniel.lezcano@linaro.org>, 
 "Rafael J. Wysocki" <rjw@rjwysocki.net>, linux-arm-msm@vger.kernel.org, 
 linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org, 
 stable@vger.kernel.org, Neil Armstrong <neil.armstrong@linaro.org>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2617;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=+4kd2F1VnGUNVU9oW0bAD/syychtxHxo8PxEX9mf8lU=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBmlRyn4WsgPHsjeq6W3RktjkoSu9goVIP+o9UE2tCo
 gJLzYGqJAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCZpUcpwAKCRB33NvayMhJ0cfoEA
 CquF4UV2qZzHb9lnIWqRh/BggKsTGggRpl2qQU8AW8IAZIIqFTV/h+dHY3jwIFkIS8tVYGZii7glFg
 6WXp6wQkX9hHlGA08zmW0aJhIgNVS3aQ8jmeInD/IBPj/m059AxH44FSqjjWrZdKXMTn6UjXqMa2d1
 lgX0bANe2yZjzmhOuIxAaPiBTKwjSJeyM8q6kGT0j0bAA+YYpfHv+D04H+d1RGy57NWrjlaberAi15
 3Yby5R+veUvn5wb6xbTM0rlNht37iM+KrrZKiSweiNm3xgDbnJS7xWourNCOH9rMDFFahz24AsfiP0
 f6RupQTTErVSjadBOTzjECgcz0KZ/iLMpcL/EBqrko5vFh08xaH1426wBGsReEOTz4b2MeJXvrnnED
 nsHV6wXUw7PZehBKgjIZF+eLOfarMsPgu3vSkU8QAydZN9yPzLo/HNzFXasgA2r50bKSOViemKxUiu
 pjSyuUCCUJpjtUVSbxh5zOgniFxeULOgkH8au11Oq1LMTtkfdCPbi6Tb3GROP1KEOl/Yil52iiQZUr
 PpjgM7rM5EAF564IgwfGiIW0Pi1ujP3FPx+18XJyihMcnhydjZEM5rn8z8jnnN7fGxJaBr8Gy9RPtI
 x0kipwe/6gUtT4AM4bmiRu8wcQ/yOkI1cWaTp7KKWiFzjpS4dUIqnIu46RGw==
X-Developer-Key: i=neil.armstrong@linaro.org; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE

The driver returns -ENODEV when the firmware battmrg service hasn't
started yet, while per-se -ENODEV is fine, we usually use -EAGAIN to
tell the user to retry again later. And the power supply core uses
-EGAIN when the device isn't initialized, let's use the same return.

This notably causes an infinite spam of:
thermal thermal_zoneXX: failed to read out thermal zone (-19)
because the thermal core doesn't understand -ENODEV, but only
considers -EAGAIN as a non-fatal error.

While it didn't appear until now, commit [1] fixes thermal core
and no more ignores thermal zones returning an error at first
temperature update.

[1] 5725f40698b9 ("thermal: core: Call monitor_thermal_zone() if zone temperature is invalid")

Link: https://lore.kernel.org/all/2ed4c630-204a-4f80-a37f-f2ca838eb455@linaro.org/
Cc: stable@vger.kernel.org
Fixes: 29e8142b5623 ("power: supply: Introduce Qualcomm PMIC GLINK power supply")
Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 drivers/power/supply/qcom_battmgr.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/power/supply/qcom_battmgr.c b/drivers/power/supply/qcom_battmgr.c
index 46f36dcb185c..bde874b5e0e7 100644
--- a/drivers/power/supply/qcom_battmgr.c
+++ b/drivers/power/supply/qcom_battmgr.c
@@ -486,7 +486,7 @@ static int qcom_battmgr_bat_get_property(struct power_supply *psy,
 	int ret;
 
 	if (!battmgr->service_up)
-		return -ENODEV;
+		return -EAGAIN;
 
 	if (battmgr->variant == QCOM_BATTMGR_SC8280XP)
 		ret = qcom_battmgr_bat_sc8280xp_update(battmgr, psp);
@@ -683,7 +683,7 @@ static int qcom_battmgr_ac_get_property(struct power_supply *psy,
 	int ret;
 
 	if (!battmgr->service_up)
-		return -ENODEV;
+		return -EAGAIN;
 
 	ret = qcom_battmgr_bat_sc8280xp_update(battmgr, psp);
 	if (ret)
@@ -748,7 +748,7 @@ static int qcom_battmgr_usb_get_property(struct power_supply *psy,
 	int ret;
 
 	if (!battmgr->service_up)
-		return -ENODEV;
+		return -EAGAIN;
 
 	if (battmgr->variant == QCOM_BATTMGR_SC8280XP)
 		ret = qcom_battmgr_bat_sc8280xp_update(battmgr, psp);
@@ -867,7 +867,7 @@ static int qcom_battmgr_wls_get_property(struct power_supply *psy,
 	int ret;
 
 	if (!battmgr->service_up)
-		return -ENODEV;
+		return -EAGAIN;
 
 	if (battmgr->variant == QCOM_BATTMGR_SC8280XP)
 		ret = qcom_battmgr_bat_sc8280xp_update(battmgr, psp);

---
base-commit: 91e3b24eb7d297d9d99030800ed96944b8652eaf
change-id: 20240715-topic-sm8x50-upstream-fix-battmgr-temp-tz-warn-c5a2f956d28d

Best regards,
-- 
Neil Armstrong <neil.armstrong@linaro.org>


