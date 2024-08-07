Return-Path: <linux-arm-msm+bounces-28082-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F53694A7C3
	for <lists+linux-arm-msm@lfdr.de>; Wed,  7 Aug 2024 14:34:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 11E89284CAF
	for <lists+linux-arm-msm@lfdr.de>; Wed,  7 Aug 2024 12:34:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C32131E4EEA;
	Wed,  7 Aug 2024 12:34:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Dlk2wAIh"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20E3D1E2101
	for <linux-arm-msm@vger.kernel.org>; Wed,  7 Aug 2024 12:34:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723034086; cv=none; b=uYJ/EqhwGFeG+2TZmI9+CQrdQ6ZCJuFRugVWIgClMbtGx8w7IXb9MtPfrjWiT+XlokZwdrnYLvlNkgawcsLqPdiKlPmpRJP9J0+MHLTlggrIWTdcDXDzUB7gwpwELN20ywm8/+Q15MDlxGD1U59pgTUI+20Vj+ZZuoHOrMvH2O4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723034086; c=relaxed/simple;
	bh=UEqG1Odjh7UfbwFydAB1tQvm0MzYcGOEpZlOqOPrxps=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=cpwK72TcA6Q7hxdZ/EgKtDe5ueMEs6a+QOBtWtYii3nwQEdsr1NBYXeUZ36Faiq9bI1nFCEB9ReYhMYwT1QqbR0ifakIddTJK7kM8zwYw/QokFlS91kh5n+zU1zdFrrtFfXWypYtgh3/xBlL8VHEhEsYAQYJbu8Mw0ae6a8hbJY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Dlk2wAIh; arc=none smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-368313809a4so511281f8f.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 07 Aug 2024 05:34:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1723034083; x=1723638883; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Jn3A6dw+13YgQfD6Kv5Y+2JlSAYHXpU458T7zZRgiqU=;
        b=Dlk2wAIh2HPxvZ+ICp4fDuA3/C4kV3LV8g2h+TGA19FR+BMbV2y7yUqNvf9YwvYkvG
         yw4TEtzyxtjNHJVIDDOfMq1rB7NMYZ4iDIv4Q48jfbR2zMl7yyZjRcqn3D6fqJvgPXrM
         8OyCqCNEg5EneIycnXJl5nRQ1C8I5nteY1YEH9OeAkPsbO/pNIaNttrXLyrxZDdpOkPb
         QSdgnvVt2BEMO91D3GjvgJ1DoE2J5xaih67ct7NlRLs0OwO2O4vZmtAGHECneFT8Nypj
         w0XFbk9/qdGzZMnNX+ObtBMqPSc2N0pG4fISTPHB7MAtXziXb/f3W2THlwsinXO2AymY
         1oaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723034083; x=1723638883;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Jn3A6dw+13YgQfD6Kv5Y+2JlSAYHXpU458T7zZRgiqU=;
        b=CIK86HcAHgWj7Kk+D2WuZ9hqSqKaVgFAUUGINEVXcIgVte1JBQ38lDcZpl6iNBxBYB
         tSbjhF+bgFY4WdQUbJbfRXgwR6tfcZf9eWLjM2lvmwroJNPipeY9P3V+wIo1ufgfHWWn
         e7f7IUJfyhoteDGzu+PdJnnPlTxlECmXUFldMa8fOWg2z9q3j0gKmM73pGzE8GgWfmts
         9Mod/cRYPrpj/VsUg6XfQCeNJWZX9IzCEKFepKaW7T++8OSO2L9KBBYEXdBLlfi3MNsZ
         5PusGA15cgGn3rLalzgh3SxadEHeDgauGuPNqm+2dLtLCENuTS32BemazjaDttiO0xJt
         s1jA==
X-Gm-Message-State: AOJu0YzLmuHWboqN6zBGyrc5R2GWE+KrTqMZjxvVs6KVRm5NpHmnxbFS
	bGQXCQJonwURvAzULXN/A4Z3uJg60oyO5HaK1gsEx0lxIKKZQWny
X-Google-Smtp-Source: AGHT+IGa3/fjyXnZ4344o+/xUNJiPD4/sYgdoWpjpRSWrkpFPUWwDIDrZwelCjYSciNp7q6gKmTovg==
X-Received: by 2002:a05:6000:1fa3:b0:367:89ae:c204 with SMTP id ffacd0b85a97d-36bf0dad2e0mr1807561f8f.12.1723034082973;
        Wed, 07 Aug 2024 05:34:42 -0700 (PDT)
Received: from [192.168.0.12] (cpc115152-dals23-2-0-cust532.20-2.cable.virginm.net. [86.12.82.21])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-429059714d5sm27198425e9.13.2024.08.07.05.34.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Aug 2024 05:34:42 -0700 (PDT)
From: Connor Abbott <cwabbott0@gmail.com>
Subject: [PATCH v2 0/3] drm/msm: Fixes for devcoredump on a750
Date: Wed, 07 Aug 2024 13:34:26 +0100
Message-Id: <20240807-a750-devcoredump-fixes-v2-0-d7483736d26d@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIANJps2YC/4WNQQ6CMBBFr0Jm7Zi2UkhdcQ/DorQjTCKUtNpoC
 He3cgGX7/+8/zdIFJkSXKsNImVOHJYC6lSBm+wyErIvDEqoWmhh0LZaoKfsQiT/mle885sSkjb
 DoHVzGaSFIq+RjqK4t77wxOkZ4uf4yfKX/p3MEgU2wjljSMm69d04W36cXZih3/f9C/JVMQK8A
 AAA
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>
Cc: linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org, 
 Connor Abbott <cwabbott0@gmail.com>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1723034082; l=1002;
 i=cwabbott0@gmail.com; s=20240426; h=from:subject:message-id;
 bh=UEqG1Odjh7UfbwFydAB1tQvm0MzYcGOEpZlOqOPrxps=;
 b=1UqRIinFRoGPrikvWkWl2pT5LzP+9op2cS3zHv7GtDp+q+0WwcZt20NbLJFlatkHwthJvHzhy
 WH2R8tdWvoiAf93P3XDOOwv5ov4650dV/o0gJxeN6tuOtd2ILeYTy4Q
X-Developer-Key: i=cwabbott0@gmail.com; a=ed25519;
 pk=dkpOeRSXLzVgqhy0Idr3nsBr4ranyERLMnoAgR4cHmY=

Unfortunately the first time around I made the mistake of not checking
the devcoredump file closely enough to make sure it had the right
contents. This makes sure we're actually using the a750 register lists
on a750.

Signed-off-by: Connor Abbott <cwabbott0@gmail.com>
---
Changes in v2:
- Add last commit fixing an indexed register name
- Link to v1: https://lore.kernel.org/r/20240509-a750-devcoredump-fixes-v1-0-60cc99e2147d@gmail.com

---
Connor Abbott (3):
      drm/msm: Use a7xx family directly in gpu_state
      drm/msm: Dump correct dbgahb clusters on a750
      drm/msm: Fix CP_BV_DRAW_STATE_ADDR name

 drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c        | 46 +++++++++++-----------
 .../gpu/drm/msm/adreno/adreno_gen7_9_0_snapshot.h  |  2 +-
 2 files changed, 25 insertions(+), 23 deletions(-)
---
base-commit: 5acf1f91d74433cbfffd9df962b6e45f5d3ef253
change-id: 20240509-a750-devcoredump-fixes-e59bb5563b1a

Best regards,
-- 
Connor Abbott <cwabbott0@gmail.com>


