Return-Path: <linux-arm-msm+bounces-20544-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 66BFA8CFB1D
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 May 2024 10:16:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 22A1C2816DA
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 May 2024 08:16:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AAC63535C4;
	Mon, 27 May 2024 08:16:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="R0jEZN+T"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B578E4594D
	for <linux-arm-msm@vger.kernel.org>; Mon, 27 May 2024 08:16:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716797774; cv=none; b=t3WQqxgnnkvGEmNzWYLNuIUlM4cx/FuDi/uRFcuwVhaLd0PuzWaxS2Fb6tETLS5mjNnaC/b0A7J2W7gOaBAaFcOPgwraefv3Ywgk6PLwmO8UEyWw8ehhft1ldtO39+SDE5i8ZE86/lT4p01Um5dDnNKFO1VcA+c+HOSGknjumcg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716797774; c=relaxed/simple;
	bh=3i2hn3y4fgfN0pMQVA6pExH0GY75p5HNfE+xCB2CqTM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=aXaDRfzdwCxGMBZiQ7xztqxWN0KcVUdz0pose/bwUBHhh9gFl+8wS8HCcDe2yH+m5bpoCPhmHkzqJeOqaVo8BDB3RhpWdot/x1wXm/UbWJRKYoDhV5IltchNaX7nrtM0kT6h0F0tFkTWtW2yfuqaEPWz9Uw4blBJpMMDwUFZsAU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=R0jEZN+T; arc=none smtp.client-ip=209.85.208.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ed1-f54.google.com with SMTP id 4fb4d7f45d1cf-57857e0f45cso2813734a12.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 27 May 2024 01:16:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1716797770; x=1717402570; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=GlYGuShbJYJGIFE8S2W701RIcZqUyd2QZ8ocar3toek=;
        b=R0jEZN+TXfQB2ynEIRrWtvuxcj/FhiZOf4sfEsiP/eP/MAsnBh+gBFs86ccbzJ5Ph1
         xpPOKKpiEsTaZt1j3UXPuy4nXNoJrDMFFak4mAf23ebWzbJyGnAo1TymdRcxKS66mYn1
         lP8p1A9S7hWVbKVhdccEBl+pfqzBj6hGy56DS1wjBoceHLIHkxXJwwWReGx+hIN46ghu
         87dgfjXh6OU/uiIaXWSXunXTpiyz4awM0445FrtSRMPd4zybW3psRU3etn1J7kE6LxSk
         gHFuetctHLG38JMKldkXKlUs9UYQaRxFApdbcRSxdkCmrbMPOAqS8sc3icGq28HMzfam
         AQwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716797770; x=1717402570;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GlYGuShbJYJGIFE8S2W701RIcZqUyd2QZ8ocar3toek=;
        b=rakTWm07HV7pkBjcGZR3syx2fMeVb0xZJDZtdFSTV+7BjwlOBWTNLQKOMR8NhByCEA
         tLiUoIGYNJErKj9UpxkrKXfkG/dvlg+ZbdKqWDnsrkgJLetC2OuXYBvyFmw/Q+Zaifey
         AqEkjBYtrdEdcgjpGefO4YelybZEgM2XtLGkfPHcvv5euCLeSXLCcoYDuCnOyQ8mi3+z
         2lLUePz6fF3D37moKugSo1Z2Sb0NKcwwUu1Dd6EQjG0LwGf3M6NQAWxqU2Ya4EL7/qMV
         FDkwFURdLfTwLat9t4QRJb6eTztzgoanp68ucFJU+wAJ/yo8hwe9cliujdjO9kuRYpqk
         5dCw==
X-Gm-Message-State: AOJu0Yz4pLcbPBHRu30sy/0FRFx3YjX6iXZgvktV0Swl9UodMpFV1LaA
	yZ63+wAKdct/+lcUhwcPRQrTqS2K3Q9aHyPKPTNrRK6WYw4VN+uf3v5Wtdj/wdE=
X-Google-Smtp-Source: AGHT+IHyk8/QtE0nK/LJKzyMh1QAJqDT/3M8dtrUy8e0pmTi3aLNh0xLKvv9jKwHoBDJChRC4REE2g==
X-Received: by 2002:a50:951e:0:b0:578:c161:525d with SMTP id 4fb4d7f45d1cf-578c161554dmr3152304a12.25.1716797769887;
        Mon, 27 May 2024 01:16:09 -0700 (PDT)
Received: from [127.0.1.1] ([188.27.161.69])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-579d5941903sm924105a12.83.2024.05.27.01.16.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 May 2024 01:16:09 -0700 (PDT)
From: Abel Vesa <abel.vesa@linaro.org>
Date: Mon, 27 May 2024 11:16:01 +0300
Subject: [PATCH] soc: qcom: pmic_glink: Increase max ports to 3
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240527-x1e80100-soc-qcom-pmic-glink-v1-1-e5c4cda2f745@linaro.org>
X-B4-Tracking: v=1; b=H4sIAEBBVGYC/x3MSwqEMAwA0KtI1hNIq8XPVQYXWlMNM7baggji3
 S0u3+ZdkDgKJ+iKCyIfkiT4DPUpwC6DnxllygZNuiKjNZ6KG1JEmILF3YYVt1Uszn/xP3TlWCv
 j2LiWIBdbZCfn23/7+34APJ+I9m4AAAA=
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Abel Vesa <abel.vesa@linaro.org>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=911; i=abel.vesa@linaro.org;
 h=from:subject:message-id; bh=3i2hn3y4fgfN0pMQVA6pExH0GY75p5HNfE+xCB2CqTM=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBmVEFEzkvlCFJTDIvwLXKRmzyZ0oUYtV0UhbPCY
 VKZfkL5Ke+JAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCZlRBRAAKCRAbX0TJAJUV
 VqTaD/49WtpPUvqp26jREgUjsePi2mbdc6Vz5rhiUEw+JaAkmQgDq4Rxi1Gk3voBWOgXrIBT6UG
 yVCTBTnJgcrIkH1RpQFVZaOe8URkKR/6bVOwBL2xj5GdPUWyaqns4dCCZPh3/hfUmod+HShSVea
 BpWVtvnj/KvC17I2Z7wc1+BPLvPvKPdLHubWIM44N9qYAHVxn+jTZFUz6HCi67hXKgBuvDF3B/0
 BRsUdtw9MSca+qaytyovB4pajQDW71ArUDGtolrcg+83vxZhwM4qBwENNcNUezdtT07lF36sLM0
 FTRrhrOnOH/jW2AVCVKtuVLqhvnH9EBbhrcUcd1gFlh10+x9uERUsSsC2/ifP0BoEp64xVhNUoc
 uwZvLCe/orz7qYEaW1hXpwu5ljVCmGnsG/IxnqXqZfrAYMuCtu8PpYFIpYERaIMDg1q4y35YXKm
 IETtiQbkDHDNQHpchXfW8Mdmnhqzv9W8Ppm3pYppCnbnfpj5TixeHHSUv+YGZfqbGuHY/uQ02nn
 DFGLJF+GeHUyM9879jbM1rkF3aMJkHE6bkfn0P8B/XM5WQ2U/tG5lu0KhJ069O3SJt+pLlNGt0Y
 OCJq5j7dLVvCQIBMUgE7SpnAZcIQeuBhyMTKQDcUudRWLpRkH9wa/8ABrMizPqJn26GlgqjC2wA
 +o+X7dBsT3DOEMg==
X-Developer-Key: i=abel.vesa@linaro.org; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE

Up until now, all Qualcomm platforms only had maximum 2 ports. The X Elite
(x1e80100) adds a third one. Increase the maximum allowed to 3.

Signed-off-by: Abel Vesa <abel.vesa@linaro.org>
---
 drivers/soc/qcom/pmic_glink_altmode.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/soc/qcom/pmic_glink_altmode.c b/drivers/soc/qcom/pmic_glink_altmode.c
index b3808fc24c69..1e0808b3cb93 100644
--- a/drivers/soc/qcom/pmic_glink_altmode.c
+++ b/drivers/soc/qcom/pmic_glink_altmode.c
@@ -20,7 +20,7 @@
 
 #include <linux/soc/qcom/pmic_glink.h>
 
-#define PMIC_GLINK_MAX_PORTS	2
+#define PMIC_GLINK_MAX_PORTS	3
 
 #define USBC_SC8180X_NOTIFY_IND	0x13
 #define USBC_CMD_WRITE_REQ      0x15

---
base-commit: 3689b0ef08b70e4e03b82ebd37730a03a672853a
change-id: 20240522-x1e80100-soc-qcom-pmic-glink-f3b715fe5f90

Best regards,
-- 
Abel Vesa <abel.vesa@linaro.org>


