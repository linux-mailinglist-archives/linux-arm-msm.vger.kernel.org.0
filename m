Return-Path: <linux-arm-msm+bounces-46502-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id A908BA21C6A
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 Jan 2025 12:46:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id CC09C3A21A7
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 Jan 2025 11:46:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2D7891422A8;
	Wed, 29 Jan 2025 11:46:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="QPRpLZds"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21A8C5672
	for <linux-arm-msm@vger.kernel.org>; Wed, 29 Jan 2025 11:46:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738151189; cv=none; b=X/UubWdxm8LG0qmtLzuJ++26hFhMwYPboJOUtHvM90i2wJJWJ5B/KQ4oiBAPoL4sDJdqo8j3h+pXqaBBv8b/sUdrJ2PH6H6x6/cjrdoRuxhzk2W7jQAv3eRYwK+6TvkRJbSojPjXIqC9915D6f9cdx/xZcKGL0WMJWdcmnhkhuQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738151189; c=relaxed/simple;
	bh=2/5Cesm6T52JGLmP1V0bhCfHUOuO0BHy8umtVnI6bWQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=ADqSgvkW8zHFkLs7ioDYkISu2nG0d7nw/0tvEGAlxKGS2zgQxmVZ0jwou/jNMBK/ev7fNpH2ZYbFoRnM1N3MysUOThqlFe0lj/aQDJIgXedrrqkopx6n0jT8/ZYkp1O22ZjLu5Vs6OwQsARtfPccoCfcGO4DkqGH1HANZ33bz94=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=QPRpLZds; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4361c705434so48120625e9.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 29 Jan 2025 03:46:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1738151185; x=1738755985; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=0RG5JoDAs1zv39F8cCeeXgMYLOoJDk5jYs6kzdh8JQs=;
        b=QPRpLZdscQTZot47BJjTRa8CUP6jfBUPMpXoYX3OdBrMZo/HA/MOKKeiHVevwq7cQ2
         gkUXhionWEXwrZyI2KUBUWOmZsUH0RJr7tYxOtEEyvpgrJAVyyF9CCRQCbVO16UjvSBS
         NhzKlzpDu5Xg7Do5OQuS6+0Hf5iPid9LO6I7VELQUKEisLceoRpb9hkc8KGM7Ylqcqnl
         CYRU8mgLsQWRfOcN8/MGaJy1VphwwDM1xTjbV/sxSSltMh93P/JvFsEXdYCbatxMzsSf
         nDa+2PdMXUr7CJn6nSM+s6vC9c8ZI2/RyW0QceyrBppEPRhAjhAZjMWCv2TALYWDzklB
         uuBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738151185; x=1738755985;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0RG5JoDAs1zv39F8cCeeXgMYLOoJDk5jYs6kzdh8JQs=;
        b=GBhVx/RZUuehg/2r1/fntDZcWNptmLD1LacE4G7DjmOBI+TznnMD23dozh8Tzfq+xC
         uvy/lSrDgfTBKA1g0dTXOb2GB380N/LBLaMBtzGqhqzgkkzhV+VQX8WQbc1Fr38hZj1O
         ATbTNxW4+RKRR1EVSLC7S7yQ6VP+C2A/9hwLCLTQyxw9qp66bWHhgdOAIJE6PCEf3cZ4
         qec2cYT/58CyS+PxaGqnsII+2FsIq95pJDEqKb6dBIXsyLt37ryugQg/6xl9Gy+Syj0R
         4pgREyZq1Do9YJadYgbAmbfCW65QCmvbcTY74RvOAbvtfgKZOILS0DQ1Il0460Y2wKgp
         cnLg==
X-Forwarded-Encrypted: i=1; AJvYcCUGyi2b1JBmc4FpxMLtD8jfqD1d+OnjdOsdDbKjopBwyr/1DDTuya9fXxcm7KnOuD6PKNQFi73HPKDmudBM@vger.kernel.org
X-Gm-Message-State: AOJu0YxGsKgGKp+B/12NVPdhZp2pauYDD7dKsxwMxgGmykPWG5V3Lsu8
	mO7mjt9siW94ITFbjnjdy3jsEbsztVcvNj8wWfGUv8+pCxpkam3+y4Gw5dyoazA=
X-Gm-Gg: ASbGnctOXdZMOHbj2GlwZrMRBxt7365C4u7WLDNj/etnEGe5gV6zAk8TAHS1PU+FFVt
	VJaSjwknZhk1Frd1b+CPCpbCi7A+yqNb9QUAQathye2//sdCZTSlWUFtFsEbd0gAnxbH/gRYZEm
	6zmNGT/a8YiEcBTSG3q6RaocEF9YPP3nApMKrLhESkd4JFryNtwmrCkQxjr4j+a94U6+Nx67Zbt
	EeAqC4AILZFJ4m4NcjeO0F3K3oI+3wht1XzF11/XEjggd5yFdRYBtihcNDFLPPSU7t2wh9foorM
	BEKSXzBO8saGdGY=
X-Google-Smtp-Source: AGHT+IF8VEpU773V6Mv4gA6jpI+wlQBAoSpOa7pNliiIowvKtUjXOHDFyMOKjA0N8si3dnY7ndFgOA==
X-Received: by 2002:a05:600c:3b94:b0:434:a929:42bb with SMTP id 5b1f17b1804b1-438dc3cbb71mr22847265e9.18.1738151185218;
        Wed, 29 Jan 2025 03:46:25 -0800 (PST)
Received: from [127.0.1.1] ([86.123.96.125])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-438dcc2f17dsm19914475e9.23.2025.01.29.03.46.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Jan 2025 03:46:24 -0800 (PST)
From: Abel Vesa <abel.vesa@linaro.org>
Date: Wed, 29 Jan 2025 13:46:15 +0200
Subject: [PATCH RFC v2] soc: qcom: pmic_glink: Fix device access from
 worker during suspend
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250129-soc-qcom-pmic-glink-fix-device-access-on-worker-while-suspended-v2-1-de2a3eca514e@linaro.org>
X-B4-Tracking: v=1; b=H4sIAAYVmmcC/62OzQ6CMBCEX4Xs2TW0/Bw8mZj4AF4NB2wX2AAtd
 hU0hHe34Rk8zkxm5ltBKDAJnJIVAs0s7F0U+pCA6WrXErKNGnSqi1SpFMUbfBo/4jSywXZg12P
 DH7SxbAhrY0gEvcPFh54CLh0PhPKWiZwli3VT5KagPCNbQnyZAsX6TnCH2/UCVTQ7lpcP351qV
 nv0N4BZoULKdGPLR5NpTec4UQd/9KGFatu2H782wjIUAQAA
X-Change-ID: 20250110-soc-qcom-pmic-glink-fix-device-access-on-worker-while-suspended-af54c5e43ed6
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>
Cc: Caleb Connolly <caleb.connolly@linaro.org>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
 Johan Hovold <johan@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>, 
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Johan Hovold <johan+linaro@kernel.org>, stable@vger.kernel.org, 
 Abel Vesa <abel.vesa@linaro.org>
X-Mailer: b4 0.15-dev-dedf8
X-Developer-Signature: v=1; a=openpgp-sha256; l=4794; i=abel.vesa@linaro.org;
 h=from:subject:message-id; bh=2/5Cesm6T52JGLmP1V0bhCfHUOuO0BHy8umtVnI6bWQ=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBnmhULILNLbNYBd02zsf/Rk3N6ATT657LrCwWJX
 DAGpWJLuh2JAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCZ5oVCwAKCRAbX0TJAJUV
 VoZ6D/4weXPPSkpuITPjCxYwdKngGIngl+opFnUYiAxKTW/tQGDT17/jlCpc6EIC1lvRP2IxN+y
 xJsQqu74Pe4j8kfZ54FBVAYra92E8j2TE8x1Rqh2G5WY3k/d0ermvZpwSleQzUC3g0fWab2WGoZ
 SZbfxJhIKzapx4zkus/EtMo82/cR8Onb1AimtZB1Ycll2c+J7waogt2zprFYKl2KP+rkdsJxzGh
 EEnuEhPvSZ4u3J+P1qUXG39853nFQ6U3TzWQHUqIMPVlYtoItSwXW5x5yF7JELRIOIFrywqVN/g
 8/E1Y6QLVwRyKcyqk8akzcdcmMb+9XiZY+Ot7bSraWxlTFxhmOXHjKmnDUzXboRhghMtNuoTK9s
 D+T9TNJGiPOqbnRbYv4Xx+YElic1N+CA8jOtNLiEgEqE8IqTjrNcI02NZ4TTr00vwlR3op/mc3y
 4QwiPIorRrcIj8U+MUYuJ1FuUzUY36/6g/GX8/e45K5eccSf216qNii1pj9cQBJo9JsFgQBBgk7
 +HODGTl8g42sGmS8sGunavf7W11TD59yc1SJoVJ+p/Rb01hINqwRellewNzVaJm3t3BrC7iDnPO
 6PY9soDHhiTIxqgRBfxqQBAK6qJhh7ribpGw0lrvOrpXySI75dmm6KWEZ8VIdp6n0Y6ZHvLKl9A
 LJdD+lJCbZMrzeA==
X-Developer-Key: i=abel.vesa@linaro.org; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE

For historical reasons, the GLINK smem interrupt is registered with
IRRQF_NO_SUSPEND flag set, which is the underlying problem here, since the
incoming messages can be delivered during late suspend and early
resume.

In this specific case, the pmic_glink_altmode_worker() currently gets
scheduled on the system_wq which can be scheduled to run while devices
are still suspended. This proves to be a problem when a Type-C retimer,
switch or mux that is controlled over a bus like I2C, because the I2C
controller is suspended.

This has been proven to be the case on the X Elite boards where such
retimers (ParadeTech PS8830) are used in order to handle Type-C
orientation and altmode configuration. The following warning is thrown:

[   35.134876] i2c i2c-4: Transfer while suspended
[   35.143865] WARNING: CPU: 0 PID: 99 at drivers/i2c/i2c-core.h:56 __i2c_transfer+0xb4/0x57c [i2c_core]
[   35.352879] Workqueue: events pmic_glink_altmode_worker [pmic_glink_altmode]
[   35.360179] pstate: 61400005 (nZCv daif +PAN -UAO -TCO +DIT -SSBS BTYPE=--)
[   35.455242] Call trace:
[   35.457826]  __i2c_transfer+0xb4/0x57c [i2c_core] (P)
[   35.463086]  i2c_transfer+0x98/0xf0 [i2c_core]
[   35.467713]  i2c_transfer_buffer_flags+0x54/0x88 [i2c_core]
[   35.473502]  regmap_i2c_write+0x20/0x48 [regmap_i2c]
[   35.478659]  _regmap_raw_write_impl+0x780/0x944
[   35.483401]  _regmap_bus_raw_write+0x60/0x7c
[   35.487848]  _regmap_write+0x134/0x184
[   35.491773]  regmap_write+0x54/0x78
[   35.495418]  ps883x_set+0x58/0xec [ps883x]
[   35.499688]  ps883x_sw_set+0x60/0x84 [ps883x]
[   35.504223]  typec_switch_set+0x48/0x74 [typec]
[   35.508952]  pmic_glink_altmode_worker+0x44/0x1fc [pmic_glink_altmode]
[   35.515712]  process_scheduled_works+0x1a0/0x2d0
[   35.520525]  worker_thread+0x2a8/0x3c8
[   35.524449]  kthread+0xfc/0x184
[   35.527749]  ret_from_fork+0x10/0x20

The proper solution here should be to not deliver these kind of messages
during system suspend at all, or at least make it configurable per glink
client. But simply dropping the IRQF_NO_SUSPEND flag entirely will break
other clients. The final shape of the rework of the pmic glink driver in
order to fulfill both the filtering of the messages that need to be able
to wake-up the system and the queueing of these messages until the system
has properly resumed is still being discussed and it is planned as a
future effort.

Meanwhile, the stop-gap fix here is to schedule the pmic glink altmode
worker on the system_freezable_wq instead of the system_wq. This will
result in the altmode worker not being scheduled to run until the
devices are resumed first, which will give the controllers like I2C a
chance to resume before the transfer is requested.

Reported-by: Johan Hovold <johan+linaro@kernel.org>
Closes: https://lore.kernel.org/lkml/Z1CCVjEZMQ6hJ-wK@hovoldconsulting.com/
Fixes: 080b4e24852b ("soc: qcom: pmic_glink: Introduce altmode support")
Cc: stable@vger.kernel.org    # 6.3
Reviewed-by: Caleb Connolly <caleb.connolly@linaro.org>
Signed-off-by: Abel Vesa <abel.vesa@linaro.org>
---
Changes in v2:
- Re-worded the commit to explain the underlying problem and how
  this fix is just a stop-gap for the pmic glink client for now.
- Added Johan's Reported-by tag and link
- Added Caleb's Reviewed-by tag
- Link to v1: https://lore.kernel.org/r/20250110-soc-qcom-pmic-glink-fix-device-access-on-worker-while-suspended-v1-1-e32fd6bf322e@linaro.org
---
 drivers/soc/qcom/pmic_glink_altmode.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/soc/qcom/pmic_glink_altmode.c b/drivers/soc/qcom/pmic_glink_altmode.c
index bd06ce16180411059e9efb14d9aeccda27744280..bde129aa7d90a39becaa720376c0539bcaa492fb 100644
--- a/drivers/soc/qcom/pmic_glink_altmode.c
+++ b/drivers/soc/qcom/pmic_glink_altmode.c
@@ -295,7 +295,7 @@ static void pmic_glink_altmode_sc8180xp_notify(struct pmic_glink_altmode *altmod
 	alt_port->mode = mode;
 	alt_port->hpd_state = hpd_state;
 	alt_port->hpd_irq = hpd_irq;
-	schedule_work(&alt_port->work);
+	queue_work(system_freezable_wq, &alt_port->work);
 }
 
 #define SC8280XP_DPAM_MASK	0x3f
@@ -338,7 +338,7 @@ static void pmic_glink_altmode_sc8280xp_notify(struct pmic_glink_altmode *altmod
 	alt_port->mode = mode;
 	alt_port->hpd_state = hpd_state;
 	alt_port->hpd_irq = hpd_irq;
-	schedule_work(&alt_port->work);
+	queue_work(system_freezable_wq, &alt_port->work);
 }
 
 static void pmic_glink_altmode_callback(const void *data, size_t len, void *priv)

---
base-commit: da7e6047a6264af16d2cb82bed9b6caa33eaf56a
change-id: 20250110-soc-qcom-pmic-glink-fix-device-access-on-worker-while-suspended-af54c5e43ed6

Best regards,
-- 
Abel Vesa <abel.vesa@linaro.org>


