Return-Path: <linux-arm-msm+bounces-19592-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 145508C121F
	for <lists+linux-arm-msm@lfdr.de>; Thu,  9 May 2024 17:41:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 413A81C20E49
	for <lists+linux-arm-msm@lfdr.de>; Thu,  9 May 2024 15:41:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 571F516F270;
	Thu,  9 May 2024 15:41:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Xlk2csrv"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com [209.85.167.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 975D315ECD1
	for <linux-arm-msm@vger.kernel.org>; Thu,  9 May 2024 15:41:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715269301; cv=none; b=hU+abVpxJwiEs73OD/oKOYwiPRJA6mpHDsKsnEWFpSxoIzsFZo3S6gvIUrJZA8mUl9JJG2iJ9zUPuc1gLYm1e3bMPcyXz7wi+f2koWSJw9pUyw6TXtMqc0a4otvZz/9kNiYDQunlFbOI6yNyN1QX63h68xhPMh16m6UfJ2qyr8Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715269301; c=relaxed/simple;
	bh=lk4Vc8zcC7hlsGJ5GNpBh4JGJ3eQeEpSlFF5xjLcSKU=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=dt1ggb8HJPW0UFJG/6DMDbEJUWonZ6QhcYYgI+/tZbOC9/2KK1vX3CpdzibUkkvRTZKz2OBfu2b3SdHDYMlLM8UrMFitR7TQnqkRbdx4X07fmsZgw7J4DK3wA3AEeNuXzGdFDB0zdQysrfcILEhM9yWtwfPnFkP3+NcnuQJcNck=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Xlk2csrv; arc=none smtp.client-ip=209.85.167.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-51fc01b6fe7so1041439e87.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 09 May 2024 08:41:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1715269298; x=1715874098; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=7yj+NFSUX1DfXY4ApuP2si66YNbZvOFq6Ph0ohRBSS0=;
        b=Xlk2csrvfK/2Oufw5SIn6p6mP9jyq4WaV6aIykM1SKpRcBnGpHqr11V1uSXuFfsat0
         /Jd1zvSBkWFG58fMBx0BhNzcH8f8bX2UzHKDk1rLEFFaJXYVP7rf4yEEXQoW+ZSVW5KS
         CU7N+Iak22rEmw4eCTDhyuZemD/pECiTDf/fmQfVgCDP8zE3F/O2K071tcI6j7fp7JLR
         CRUwwO65smKtqs0UIVmUqV2PlKggkYn2BdYtqLzQkAHj7s/R6gHLD1KbNGl1x6j0YOrF
         3yzKuIWHH0PgI6QFX7vh9hgnvPspXklBftjDKmMxUUQ3NHUcJd2smJ9vI5kKbfaCKox8
         bfQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715269298; x=1715874098;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7yj+NFSUX1DfXY4ApuP2si66YNbZvOFq6Ph0ohRBSS0=;
        b=lKQP91BAYj6v0CroIRR6XEeLIzJPScpLopAGqYSGwgyhQ1clUmAQpqsNq3qFuG/RC5
         S8fBLvdXP7FpY2ZXbDsJmLCYbtsIoD4p9ML/RoOh3U9FInklQZYXdGPmxXfWA1CSqOWj
         A0zOqV/UNbLz3/0TrGCGvqKkd8FADOmhRI6s3njvX/p8aaLwglLhGjUHrfGIf+QYneWx
         fZFJl3wPNWjn0bGFvHn8CTk414YA1brdUpUoc+WrgfdisLlPutESn9Xc117ku4A/DMZ8
         Ew5M6FRJrvt8mKPMNK/IYEXFqt2WEAi7bDJnYTaUswc6op9Gk62DWHB32I31pBhVB6CY
         YwtA==
X-Gm-Message-State: AOJu0Yy2zBtx3RDsy35qKusysuePE8C5eLc/p9+eubkw1FzXUqteBh6s
	XgKpreGVpfDskrNHrMwa+I3otJvVckHHUpUPyNfOlnWROJcB/oPp
X-Google-Smtp-Source: AGHT+IErlm4uMmWXAJPrNClZqoZxt8hNS6DUm1u/Y5/HYVdV5d33CGH5gXSjJME5IVmbmja8JzVlhQ==
X-Received: by 2002:ac2:5bc2:0:b0:51e:eca3:e02f with SMTP id 2adb3069b0e04-5217cd4b442mr4058267e87.67.1715269297475;
        Thu, 09 May 2024 08:41:37 -0700 (PDT)
Received: from [192.168.0.20] (cpc115152-dals23-2-0-cust532.20-2.cable.virginm.net. [86.12.82.21])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-41fccce1b17sm29577555e9.12.2024.05.09.08.41.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 May 2024 08:41:36 -0700 (PDT)
From: Connor Abbott <cwabbott0@gmail.com>
Subject: [PATCH 0/2] drm/msm: Fixes for devcoredump on a750
Date: Thu, 09 May 2024 16:41:32 +0100
Message-Id: <20240509-a750-devcoredump-fixes-v1-0-60cc99e2147d@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAKzuPGYC/x3LQQqDMBBG4auEWXcgxk7FXqW4SMzfOouqJBgE8
 e4Glx+Pd1BGUmR6m4MSimZd5ormYWic/PwDa6wmZ93Tiu3Zd2I5ooxLQtz+K391R2ZIH4LIqw2
 NpzqvCXeo72c4zwvmOAtWaAAAAA==
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>
Cc: linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org, 
 Connor Abbott <cwabbott0@gmail.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1715269296; l=718;
 i=cwabbott0@gmail.com; s=20240426; h=from:subject:message-id;
 bh=lk4Vc8zcC7hlsGJ5GNpBh4JGJ3eQeEpSlFF5xjLcSKU=;
 b=TqXSOtIuO5iRrMEoB5Ar8HBnN9H+RUzuboyjaei9LPmRpRIed9O720d8q5mjaQp0ub3rvRX61
 j9GEKssvrGWDYBstLnDgjWrJkSt3dVnx4o/kmMfjHBOeLLOcjPznpOV
X-Developer-Key: i=cwabbott0@gmail.com; a=ed25519;
 pk=dkpOeRSXLzVgqhy0Idr3nsBr4ranyERLMnoAgR4cHmY=

Unfortunately the first time around I made the mistake of not checking
the devcoredump file closely enough to make sure it had the right
contents. This makes sure we're actually using the a750 register lists
on a750.

Signed-off-by: Connor Abbott <cwabbott0@gmail.com>
---
Connor Abbott (2):
      drm/msm: Use a7xx family directly in gpu_state
      drm/msm: Dump correct dbgahb clusters on a750

 drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c | 46 +++++++++++++++--------------
 1 file changed, 24 insertions(+), 22 deletions(-)
---
base-commit: 5acf1f91d74433cbfffd9df962b6e45f5d3ef253
change-id: 20240509-a750-devcoredump-fixes-e59bb5563b1a

Best regards,
-- 
Connor Abbott <cwabbott0@gmail.com>


