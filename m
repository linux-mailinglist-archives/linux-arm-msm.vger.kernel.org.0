Return-Path: <linux-arm-msm+bounces-86309-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 41094CD8EBE
	for <lists+linux-arm-msm@lfdr.de>; Tue, 23 Dec 2025 11:46:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 059C2307DF2D
	for <lists+linux-arm-msm@lfdr.de>; Tue, 23 Dec 2025 10:41:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C728E33BBBD;
	Tue, 23 Dec 2025 10:03:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="OkDKRS/H"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com [209.85.167.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64C7933893E
	for <linux-arm-msm@vger.kernel.org>; Tue, 23 Dec 2025 10:03:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766484185; cv=none; b=R0Au1bTSo+QHjAk6gxxL1BXAX4meFuc+6Pmf5yO+ZocqxkSpq0oNtLDxA58aDJRgNnevfoGPjycqZ8Z4ga0Y9KiIZIVk5YLtASGZKJasr7AT1oHd/lXcOIoq+ybY057MIr9qBqY/dl7wMXpt5kC6dCufzco6ZpczoUw37gzjrlQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766484185; c=relaxed/simple;
	bh=nx8K6tan/QNn5EfUUSAPfg7W+/XmRXBvuTSqrm3XyOk=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=pWMB0vzTuu0Sns885+5koU7g7ycRzGiqPe4Jf54X70puBFpNNH62Pl0Z65sdRP1SBpEdU9bSdsCICYiCWccAO27C+nnezMkIc+WPIIOZuTq+hAnaRKBCsb7WHXM2hy4BV2+Lgj5z7XCCJ6CLew+hMfkjR6z/tSnlSPobMFfayrQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=OkDKRS/H; arc=none smtp.client-ip=209.85.167.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-598efcf3a89so4831640e87.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 23 Dec 2025 02:03:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1766484179; x=1767088979; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=MPOJWhWUbwj4+YmlyGL0cehSqlyWaUBDHW9FsBALQFU=;
        b=OkDKRS/HJHI2xKgiUO4pccgSzsLMNrv5stWqo1H8UCvZE+sspEqoplhXp/P8IoI2AS
         p9yeP5NrF0oKhk/PDXnsHwZVhQwQJYZoqrfjFqHjuGs8mFTB9vHucuV3F2rkkX25y7hV
         snMkC2h2xcwDJh89oc+QHS7JexnEuYvQnZCOo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766484179; x=1767088979;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MPOJWhWUbwj4+YmlyGL0cehSqlyWaUBDHW9FsBALQFU=;
        b=EyYAhvQ06Y9e3tZzY3HPOd4osuJeYchYp28rim6f7ykMK7KETL1M/BAda36V0tIvTO
         OICGDDkpvUD8ytgMA2Tf2Rcnniyyvp724js5yST2XIqY0ineQxe7OBTOZnXjVhT2kj7v
         MPV1nE+6DnAgykT1xme3IuX5wJmE480KXFFpI1YUS540WBKXIwnH2HiPRmPLcWO4QrR6
         zdl2yX2CaNu3B8j2AsBRTpBt0lpidK+dKaJV5nbjoaWjdyNyo863iMC5KiM4T7ZegwB6
         C+qwG2kWgRMT7iuw8juO4grYQr/x+wycZmPLEc/KwAbOFIJQ6aVtz3BNHHbkZ6sDt7YL
         ACaQ==
X-Forwarded-Encrypted: i=1; AJvYcCXxDQ2hYoUbP5LvB7e1/lC6BnNxYSahigYZt9mvoQKX3Bayg65gVUF/xksM5XLIwFXCa7qP21Od1mINeejm@vger.kernel.org
X-Gm-Message-State: AOJu0YzTJC8H4sThGtFj2AyrNaDYD7BDIjH6AkbQBDCFLZDydEv/lnYb
	2E6z2FztOfpybnDka8uBTnHf4VflwlWV/NP6G1ug99ubdAyUthUemim+ztY+aoqTWQ==
X-Gm-Gg: AY/fxX68ARoA3FQM73FLMm2bVp1gLOxJGsi3vO1sXcSJ847omMJ48+OB/O7L7SHTo/i
	dAkDx0qTryjoZynSMcImX4AZQ4JZc3aLV/sEKR8l6VwGJ1CRe22wFsWjklD0p17+sQsQkQNGL5w
	XTkp1bLecAQhIGGVD1xVfYIlEg2fVYTqYEUPbM0nggHtIEmEGDt40vNDYUeLumEc7eUgsbV7wN1
	XaBD3yKH155nJ4lSDbVSLsqEKIXUEsc87B4DyDY6KLuOdj/LJG5v266uxQNpE6nn6LEgojVqkKG
	VoHEVwzCKmVesMA9IisPoGkzEegc3QLfEn3Jvrft3cYG/k1QxDxixvGYtUG6XlSkiXqbhExo+9i
	vAf31KL6j60e7zGtLyYnashFoIMeBv9JFsKgHe0k1gDKiZ7Wy60AT4IJtFznMVLg92W2MBv2Ks3
	IK/rdzxmYBwrFPeFqApJdb+Ao4pT5nFy6vkWjSaFnwJcLOGoL8DKHRJYYj56Be9RsH2hosOolEk
	YP5bo/n
X-Google-Smtp-Source: AGHT+IGzEUd9T1bHHSjyJsHhgmQBU/RZOEDVaI8g/q+eVpi+sAPzZe8RKm13yx/8116PkYRSagGCnw==
X-Received: by 2002:a05:6512:1113:b0:598:eed5:a218 with SMTP id 2adb3069b0e04-59a17d74470mr4577598e87.10.1766484179512;
        Tue, 23 Dec 2025 02:02:59 -0800 (PST)
Received: from ribalda.c.googlers.com (165.173.228.35.bc.googleusercontent.com. [35.228.173.165])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-59a185ea248sm3891990e87.43.2025.12.23.02.02.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Dec 2025 02:02:59 -0800 (PST)
From: Ricardo Ribalda <ribalda@chromium.org>
Subject: [PATCH v3 0/2] media: Fix CI warnings for 6.19
Date: Tue, 23 Dec 2025 10:02:56 +0000
Message-Id: <20251223-warnings-6-19-v3-0-e8f56cb204ec@chromium.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIANBoSmkC/13MTQ6CMBCG4auYWVvTn1DAlfcwLqAMMAta02rVE
 O7uQGJi2EzyTvI9MySMhAnOhxkiZkoUPIc5HsCNjR9QUMcNWupC8RGvJnryQxJWqFrUVnZ1ayv
 r+h54c4/Y03vzrjfukdIjxM/GZ7V+f5LZSVkJKXRhZIXK2NY1FzfGMNFzOoU4wIpl/Qcouwc0A
 wyXBZoOHZY7YFmWLwX7INjuAAAA
X-Change-ID: 20251202-warnings-6-19-960d9b686cff
To: Keke Li <keke.li@amlogic.com>, 
 Jacopo Mondi <jacopo.mondi@ideasonboard.com>, 
 Daniel Scally <dan.scally@ideasonboard.com>, 
 Hans Verkuil <hverkuil+cisco@kernel.org>, 
 Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>, 
 Vikash Garodia <vikash.garodia@oss.qualcomm.com>, 
 Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>, 
 Abhinav Kumar <abhinav.kumar@linux.dev>, Bryan O'Donoghue <bod@kernel.org>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>, 
 linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, Ricardo Ribalda <ribalda@chromium.org>
X-Mailer: b4 0.14.2

New kernel version, new warnings.

This series only introduces a new patch:
media: iris: Document difference in size during allocation

The other one has been already sent to linux-media or linux-next ML,
but they have not found their way into the tree.

Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
Changes in v3:
- Fix fps calculation (Thanks Dikshita)
- Link to v2: https://lore.kernel.org/r/20251216-warnings-6-19-v2-0-12075e3dece7@chromium.org

Changes in v2:
- Remove already-landed patches
- Use ->inst in Document difference (Thanks Laurent)
- Simplify division (Thanks Dimitry)
- Link to v1: https://lore.kernel.org/r/20251203-warnings-6-19-v1-0-25308e136bca@chromium.org

---
Ricardo Ribalda (2):
      media: iris: Document difference in size during allocation
      media: iris: Fix fps calculation

 drivers/media/platform/qcom/iris/iris_hfi_gen2_command.c |  7 ++++++-
 drivers/media/platform/qcom/iris/iris_venc.c             | 15 +++++----------
 2 files changed, 11 insertions(+), 11 deletions(-)
---
base-commit: b70886ff5833cf499e77af77d2324ce8f68b60ce
change-id: 20251202-warnings-6-19-960d9b686cff

Best regards,
-- 
Ricardo Ribalda <ribalda@chromium.org>


