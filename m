Return-Path: <linux-arm-msm+bounces-19564-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 02B868C0C49
	for <lists+linux-arm-msm@lfdr.de>; Thu,  9 May 2024 10:08:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 30C341C2156A
	for <lists+linux-arm-msm@lfdr.de>; Thu,  9 May 2024 08:08:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B9CA5149C6D;
	Thu,  9 May 2024 08:08:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SBZjU86l"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f170.google.com (mail-lj1-f170.google.com [209.85.208.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17FD413C9C4;
	Thu,  9 May 2024 08:08:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715242109; cv=none; b=R+2Kl7VXU5Is/6YTTve8ropHA82GJodYd+VzHSBZnjmtNPWIocMnEItm5zGcxbFBtxSSxwZw4c93vHV8VhYlygkIOubZGZ0N/eme4UHWNuByLSMSFGkOw4I8xji/fqZbZpVABCtCvJxEqbh7yxLa2tPyWgVTe7f/y7kj4Nurf08=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715242109; c=relaxed/simple;
	bh=gGihO4uBNHk9osA5UTXwEkO6FL32D0ENpNDtkOv5YG4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=K6CtBOXdrJT2eYWsgjO/NZCzEV+4Ucenz01qDdXf2mv+gOGWotXTtJJbesGLwu7/k1Hhu6b6DISlMT0RtQfBnWcT9ZitLxikIYhol/gLjHJ3Ke268mHXUM7tsyytcJpeTpXb12bazmA9NrAFrRIeqv0R1ZSeFCXnkP/d+UTLttY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SBZjU86l; arc=none smtp.client-ip=209.85.208.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lj1-f170.google.com with SMTP id 38308e7fff4ca-2e3e1ad0b19so8239661fa.0;
        Thu, 09 May 2024 01:08:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1715242106; x=1715846906; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Va5CBhgS4YlEntgDj+lB7xMw3P3JCYpHFdQk9HzfcS0=;
        b=SBZjU86lm6uSWDf2ZfXO+5AT9zYjHvbJvAjOrXQwII7BMozoSEN3PCa896561MSL+W
         5+htEm94O4VTFkf5uaT/fMHbh4XcIGVcEA3jT0l4jlGzXkyzsAwfo4uTvyNDcydXFSAg
         UuLvMQ8GC03br6DEoAULEqp9VgDCglI7/G3IblbiOCt0miZgBmhPOldyTXOiaeZTw96N
         369oJ4GCd0aaNaAbS1B5R0rLrIH16nS9qRJX9bszfy6PwS5si8pbC4RzZAG2gcXkUXPB
         u6tXVmtF7iYVwOQ90+760VHSDf1TzsCCgh/q00iwQuDh9NLif5GDUJYMEOczxmue//N7
         V9sA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715242106; x=1715846906;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Va5CBhgS4YlEntgDj+lB7xMw3P3JCYpHFdQk9HzfcS0=;
        b=bg59yyEIGAL09CEAbpQalfBX1LXNcaCnMOO/cbGLLzpYJQkzLFJ+PN+O5S/zjOxEF/
         gtnEZalMWReqpd31VfLgL503bbrfE/lBtXer9YoMm3KBRR5ldcxVokMxqFCr2EKARWbS
         VHdA976CgJRKwAxmZHVVvkceJNbDN3TdVGOvOS1FscX1nLWF3+94Ysf/xIjM9p6QkC5t
         vlRWPsw5tDrZ5pLZ8cI+mrb4S8u/AJuBMiLYaha7bWfaoSDsu8xX+ocDsz9pV8c4WAmQ
         qlF15lQj1G3sB0xpN4Z4LiMvAMPXiLNWcYPBbji30Grs5FKaeXUg3dKxL4fFA8Fn4TRs
         rh1Q==
X-Forwarded-Encrypted: i=1; AJvYcCX/sq7xly46ASiDcUNsXtzAoD/nRRLaxMw56UPadaSVcFI6qWX1JCx5jvLeM/b1+SK79Wa/qQ207DY519yPgFt6In78xNoFArfqjQ7QUgDMd4XgGIwanAEvoec2X/4bfs9zNg2EwNAf
X-Gm-Message-State: AOJu0Ywq5ViXJW/ndUKkvDjofxDFrF1QBjCrUkxZXccOj4/7CWmfFd8b
	uPYFLbOpnpyrDuLPzW0kcRKoqm+CPQzgxfUXjsSObOxf3tauEDCV9UgTI391
X-Google-Smtp-Source: AGHT+IHw5kJvcuqlfuDNh48yh3D1+EoKZYjlJf5IGaHB4/GOviTBm0Q+n9TvIng/h2Z39xb/KSM1zQ==
X-Received: by 2002:a2e:a613:0:b0:2d9:f7f8:3e87 with SMTP id 38308e7fff4ca-2e4475a0fcemr31361781fa.32.1715242105694;
        Thu, 09 May 2024 01:08:25 -0700 (PDT)
Received: from [169.254.60.140] (57657817.unconfigured.pool.telekom.hu. [87.101.120.23])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-41f9bc3b12fsm23029565e9.0.2024.05.09.01.08.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 May 2024 01:08:25 -0700 (PDT)
From: Gabor Juhos <j4g8y7@gmail.com>
Date: Thu, 09 May 2024 10:08:04 +0200
Subject: [PATCH] clk: qcom: apss-ipq-pll: remove 'config_ctl_hi_val' from
 Stromer pll configs
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240509-stromer-config-ctl-v1-1-6034e17b28d5@gmail.com>
X-B4-Tracking: v=1; b=H4sIAGOEPGYC/x3MSwqEMBBF0a1Ijbsg/jDtVhoHEp9aYCdSCSKIe
 zc4PIN7L4pQQaS+uEhxSJTgM8pPQW4d/QKWKZsqUzWmNV+OScMfyi74WRZ2aWPrAAvbdihryuG
 umOV8p7/hvh+7Qv6QZAAAAA==
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Varadarajan Narayanan <quic_varada@quicinc.com>, 
 Gokul Sriram Palanisamy <quic_gokulsri@quicinc.com>, 
 Kathiravan Thirumoorthy <quic_kathirav@quicinc.com>, 
 Gabor Juhos <j4g8y7@gmail.com>
X-Mailer: b4 0.13.0

Since the CONFIG_CTL register is only 32 bits wide in the Stromer
and Stromer Plus PLLs , the 'config_ctl_hi_val' values from the
IPQ5018 and IPQ5332 configurations are not used so remove those.

No functional changes.

Signed-off-by: Gabor Juhos <j4g8y7@gmail.com>
---
Based on 'qcom-clk-for-6.10'
---
 drivers/clk/qcom/apss-ipq-pll.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/clk/qcom/apss-ipq-pll.c b/drivers/clk/qcom/apss-ipq-pll.c
index 5f7f537e4ecb..e8632db2c542 100644
--- a/drivers/clk/qcom/apss-ipq-pll.c
+++ b/drivers/clk/qcom/apss-ipq-pll.c
@@ -70,7 +70,6 @@ static struct clk_alpha_pll ipq_pll_stromer_plus = {
 static const struct alpha_pll_config ipq5018_pll_config = {
 	.l = 0x2a,
 	.config_ctl_val = 0x4001075b,
-	.config_ctl_hi_val = 0x304,
 	.main_output_mask = BIT(0),
 	.aux_output_mask = BIT(1),
 	.early_output_mask = BIT(3),
@@ -84,7 +83,6 @@ static const struct alpha_pll_config ipq5018_pll_config = {
 static const struct alpha_pll_config ipq5332_pll_config = {
 	.l = 0x2d,
 	.config_ctl_val = 0x4001075b,
-	.config_ctl_hi_val = 0x304,
 	.main_output_mask = BIT(0),
 	.aux_output_mask = BIT(1),
 	.early_output_mask = BIT(3),

---
base-commit: 3c5b3e17b8fd1f1add5a9477306c355fab126977
change-id: 20240509-stromer-config-ctl-8cee8e857e13

Best regards,
-- 
Gabor Juhos <j4g8y7@gmail.com>


