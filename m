Return-Path: <linux-arm-msm+bounces-6362-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id CFE36822D0C
	for <lists+linux-arm-msm@lfdr.de>; Wed,  3 Jan 2024 13:32:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E102C1C22CA0
	for <lists+linux-arm-msm@lfdr.de>; Wed,  3 Jan 2024 12:32:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 469131944F;
	Wed,  3 Jan 2024 12:32:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="FmjLysQX"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com [209.85.167.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 919D819440
	for <linux-arm-msm@vger.kernel.org>; Wed,  3 Jan 2024 12:32:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-50e7c6e3c63so7338952e87.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 03 Jan 2024 04:32:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1704285128; x=1704889928; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Isr8l5KeQNsDkqIvfhsrUdtZNLieOnww9+PkA4tJY9g=;
        b=FmjLysQXaP9c9qKbLTxD4hQM+ZuAU35sbWAtPaXoch0+YA18iXC720+jZNDzqEfYaS
         Ptolke2jZVuvru7O1q5tca83+WC4aKFdjPwHW7JjjrUzRGAW2XmIiBKVtZjhVTqB160y
         SKtYFwU1Z9owx12RVKnmIVjMBvPEBi+TJYS4cwCGz+Fz5hYFCvQ6z1oV/1/PopuNbRzr
         8Mb2TQknL5uFMtU0BxFCFoMN5BIZBlu2au+GCyXRWP1dKzFC21u2lGqhbVgxciFstfY0
         RavuHIWBI51J4TntHeBOin8cDW5qfSrmlel3XAJmbh1B8gujVTE1mlfeegHbSDed7Wac
         X4pw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704285128; x=1704889928;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Isr8l5KeQNsDkqIvfhsrUdtZNLieOnww9+PkA4tJY9g=;
        b=bzUuSRa+rranXS6wwbs6DKo4aVX5FkUGedr6fk9vj1n3+aUpvSWcC2Bn/xfBnv0GoO
         fw6/Ae3Ve4EniDDSDf/sFd3ZMr2bQejBkzCZxcllvNRC75iYlB4SnDOjUqhVYXHI9HzA
         1ByXu3GvomCGfcNL5OseG8N3k5n6XTIlW5NCRJOkHrjr338nQcvmiHYFydjNR/Qnx9P8
         gT23+1E/qEOiTmp+FVl6dIMOKgHlnMnTxsIcRtMQMWgvhiKgDCeUxpXPsmMuihK7V2W5
         GnlWTSIf9P0Tajt2j3lFJy615boDPNE2BZTCUw0CIXoUO3Y2GvjUo2SBnaYnxH4a+6EP
         508g==
X-Gm-Message-State: AOJu0YyMO3IsSKehBKuVZJZrnhttjwWz3HQlE88i7znoKT1H23VjNXMy
	oR9+7FjXZsiSKacqgKFsRJHheKhpkg/1Pw==
X-Google-Smtp-Source: AGHT+IEjH/8Cnorsnwn2/fhh9LKB1fsz+9ZgbQfu/ndOfqVl1fSvOjcA6RC2LfUcxS92zNJB7+a2VA==
X-Received: by 2002:a05:6512:400d:b0:50e:64b4:a266 with SMTP id br13-20020a056512400d00b0050e64b4a266mr5315689lfb.201.1704285128631;
        Wed, 03 Jan 2024 04:32:08 -0800 (PST)
Received: from [10.167.154.1] (178235179036.dynamic-4-waw-k-1-3-0.vectranet.pl. [178.235.179.36])
        by smtp.gmail.com with ESMTPSA id p2-20020a056402044200b005553a8bb61dsm10390243edw.87.2024.01.03.04.32.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Jan 2024 04:32:08 -0800 (PST)
From: Konrad Dybcio <konrad.dybcio@linaro.org>
Date: Wed, 03 Jan 2024 13:32:01 +0100
Subject: [PATCH] power: supply: qcom_battmgr: Register the power supplies
 after PDR is up
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240103-topic-battmgr2-v1-1-f89ca7234626@linaro.org>
X-B4-Tracking: v=1; b=H4sIAMBTlWUC/x2N0QqDMAwAf0XyvEBbdYP9ythDGqMGXJW0joH47
 5Y93sFxB2QxlQzP5gCTr2ZdUwV/a4BnSpOgDpUhuNA571os66aMkUr5TBbQ9+wfI/F9aHuoUaQ
 sGI0SzzVL+7JUuZmM+vtfXu/zvACY1f4ddQAAAA==
To: Bjorn Andersson <andersson@kernel.org>, 
 Sebastian Reichel <sre@kernel.org>
Cc: Marijn Suijten <marijn.suijten@somainline.org>, 
 Sebastian Reichel <sebastian.reichel@collabora.com>, 
 linux-arm-msm@vger.kernel.org, linux-pm@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Xilin Wu <wuxilin123@gmail.com>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1704285127; l=1734;
 i=konrad.dybcio@linaro.org; s=20230215; h=from:subject:message-id;
 bh=mDzb7tCs+TFmiHTgNCTIUfHSQ1l5BJtGwAobaPMNGes=;
 b=EnG5b3T9ZY9kuPFzQtu6fNj80IeCLktwOJtey+YvtPMjmsCPeP6zxpi7IW3NmrmDUxmVxm58f
 +7CPLKKm5D3DzPAosGJ1rVSyZYc7Kf0tWsEjcsgoKMVCGlECbtkF8fr
X-Developer-Key: i=konrad.dybcio@linaro.org; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=

Commit b43f7ddc2b7a ("power: supply: qcom_battmgr: Register the power
supplies after PDR is up") moved the devm_power_supply_register() calls
so that the power supply devices are not registered before we go through
the entire initialization sequence (power up the ADSP remote processor,
wait for it to come online, coordinate with userspace..).

Some firmware versions (e.g. on SM8550) seem to leave battmgr at least
partly initialized when exiting the bootloader and loading Linux. Check
if the power supply devices are registered before consuming the battmgr
notifications.

Fixes: b43f7ddc2b7a ("power: supply: qcom_battmgr: Register the power supplies after PDR is up")
Reported-by: Xilin Wu <wuxilin123@gmail.com>
Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
 drivers/power/supply/qcom_battmgr.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/power/supply/qcom_battmgr.c b/drivers/power/supply/qcom_battmgr.c
index a12e2a66d516..7d85292eb839 100644
--- a/drivers/power/supply/qcom_battmgr.c
+++ b/drivers/power/supply/qcom_battmgr.c
@@ -1271,6 +1271,10 @@ static void qcom_battmgr_callback(const void *data, size_t len, void *priv)
 	struct qcom_battmgr *battmgr = priv;
 	unsigned int opcode = le32_to_cpu(hdr->opcode);
 
+	/* Ignore the pings that come before Linux cleanly initializes the battmgr stack */
+	if (!battmgr->bat_psy)
+		return;
+
 	if (opcode == BATTMGR_NOTIFICATION)
 		qcom_battmgr_notification(battmgr, data, len);
 	else if (battmgr->variant == QCOM_BATTMGR_SC8280XP)

---
base-commit: 0fef202ac2f8e6d9ad21aead648278f1226b9053
change-id: 20240103-topic-battmgr2-15c17fac6d35

Best regards,
-- 
Konrad Dybcio <konrad.dybcio@linaro.org>


