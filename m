Return-Path: <linux-arm-msm+bounces-62291-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id B2616AE79B0
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Jun 2025 10:15:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id EA35D17CD08
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Jun 2025 08:15:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9799920FA96;
	Wed, 25 Jun 2025 08:14:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="Xrwc6/oO"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF52720CCD8
	for <linux-arm-msm@vger.kernel.org>; Wed, 25 Jun 2025 08:14:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750839293; cv=none; b=JKQV5B2+czPvqcUmESdbWwH1hxZlBEuqsAXqvb7+cpWH8pW4+YH+PNfD3mh/9V8AtJRbi2LGXYNpZsrv4xgAnHE3as+gt9PJG29Il5FRJp+j0vx+4pboI+uIaHMF/IwHClGwJ1+L1HUW9T4beDhYYTUHJL3PsVpfm79Ry91DXOI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750839293; c=relaxed/simple;
	bh=odxAEvsjae9gg8oMLkzk/QnwYb3L7Jx3aIy9//HkUqo=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=XirIEWmegtUTjh1zndpulEIrwn60RmeZG0rUxuyBV74qFCIDQfTLY6X5lGiVnelhMPCj5LmxcNQWWRDUOdFkeK0YUOADbs7tWpEUgHXchu8R8djz0JY4LpKc/S+MxCgiuQbF+lV+zpXRyYcOY/VlJTmAAil2MQuYq/4Z9mfTuGU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=Xrwc6/oO; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-451e2f0d9c2so4332385e9.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 25 Jun 2025 01:14:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1750839290; x=1751444090; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=7TXKlaJaB1mfu7CRdnCYLYciwYgyLjAklw/2jo0m4qg=;
        b=Xrwc6/oOTYkUWAZ2DgIfp0MaIe67pqEBWtYgh2V+9KTysyzdKJKeNFhV9SEgcTaBiW
         KuhsyqfrVbKAq/DBMK6Ttvg4V5gML5gyVlmQLgZHYyCjEaCT9bfk1gfbak1HWgf5XoCc
         IyjTvodqoSVmGSG5uSHFhxeiR/Sb0Np9sOSTqxAMJysr1pfgN/npQPndwz60xOnrL2zV
         kEQ9xucx6/zmhw/ja22QVqWVaQkzrLdkW/qyHHmrtG4FrEYx9py68N0R2FN/3V2BRIBQ
         H1Jc4lMRmBVuJLwQh93YHNNkmkjakD0G9qsbKu7oVDurRI4cfKPXq1O1d2g6dducWyoC
         UrUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750839290; x=1751444090;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7TXKlaJaB1mfu7CRdnCYLYciwYgyLjAklw/2jo0m4qg=;
        b=SAFuKo2aPhJwmy2wG5gpI7VUaI4eNrNoC1DAncHY46DNvEm7jlagQXylhicJj8N0Y2
         Y2Ttw7bcFWoLloVjMlEs34K2u5GRneG0Jz6Zf3BZUxpfoT5aMH1dF1cUBjKmN+hWdlaH
         KS3KR7yLwFJnuj3UhiQd7JjLH6jokTG6yJzIX9eN9vGeva+uoHHbVqDWNfx+w1cjDqwe
         LQF+rZJZyOG4VpJmHJNySNrfPF28qDiznJ/AB8phLIqd9cc3ncmM9rnU63rDC9JCfSCH
         kPJZ6xQPSTQmIKa8G1tibKCMDdP2XXkUbeMqIUsmsV6/358mMeTIuucsrdCoPBVdINkp
         Bbeg==
X-Gm-Message-State: AOJu0Yxa3VnAM3g4YDiMTi1ZVk4yrXA6RUVne3ag5xs5U1tj8+0uMuxA
	uC9J3AWPZFCIGv8EmyDLc77O0dY3/KMw34wif314qLSxNlSGGJymaZ0OUxACFVI8pg0=
X-Gm-Gg: ASbGncuV2mAnF0YVX9akCrXkqg7Qfvtsrf6YVQZzwIrresLNRCC+G/PisCPZBa3TfbE
	RLnzq9oCHIFk5Gkok/27JCSWBRyjIjg3aqNM3Fn38AX//g0ouv5p70oajosAHuHX1aIySPrJZdx
	bOoC/DFfAAgVaZki1RIgE26XPVJ7dD+ljZD/uK59S6SqXgvL3EDL/XfYXNlIsFb0niGupyC6p4y
	Ll7v89fSpCheNymenz2s1Xdkr8+xP4N+M3HRl8VWVboPzSLc7WAbcRRebe/YSofGQi7joEdorC2
	RuFGVYL7TuQPSh5M3m7/ZkwkqEUC8cfny7SCZ1ryfJYke2XrnATFyQ0y
X-Google-Smtp-Source: AGHT+IHKfY4cJplzTsHmatG1ztCvxABxeb+cv/Fg+MusXuzpeGlmKLd72ZOwYANXtvt/iRQu7AYeQQ==
X-Received: by 2002:a05:600c:a319:b0:453:45f1:9c96 with SMTP id 5b1f17b1804b1-4537cd8e312mr47207785e9.14.1750839290242;
        Wed, 25 Jun 2025 01:14:50 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:d216:42f3:1e7e:472e])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45380705351sm20215035e9.0.2025.06.25.01.14.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Jun 2025 01:14:49 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Subject: [PATCH 0/4] firmware: qcom: scm: fix potential race condition with
 tzmem
Date: Wed, 25 Jun 2025 10:14:47 +0200
Message-Id: <20250625-qcom-scm-race-v1-0-45601e1f248b@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAPevW2gC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDI1MDMyMT3cLk/Fzd4uRc3aLE5FRd01Rzc2PzNPM0Y8s0JaCegqLUtMwKsHn
 RsbW1ALXGWFlfAAAA
X-Change-ID: 20250624-qcom-scm-race-5e7737f7f39f
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1257;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=odxAEvsjae9gg8oMLkzk/QnwYb3L7Jx3aIy9//HkUqo=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBoW6/4Kxl7vPAEnCQ8Raw4tX45Tmyfwn2lK92Tc
 W3NJLtHzcmJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaFuv+AAKCRARpy6gFHHX
 cqyvD/0VzxhaWo0a5F2yEGJcLOtUr0hkI6quKqs/t3fP8wtAWUktyWj9X7AyJy3D/g5NbQh7yIc
 M4o7xMHw/u5/P5ahBG0BeFop5qBf+XHyYZ8KuW5+fZSb47ykFwfCiDJN2WJ02w//TCUOA6NNO2w
 8F8OFVl8pZcGQdrgmvxRQeHk2Hn0XdPdLLGniVpooraInZGM4fNS2DxF9ZewovM68XNtVsh6p0h
 duNQU09CRM4v+FI/NR6h0GQt8nrui4bCIYYZgFlS4kQfFgXmfcVf5ZdqemijGVBX/xRbyeecfs0
 PZl7w9Wz3D9FkoCV6Hbpjbai9sgySzokiZsghuJaH6GVe6Q7IdeZedE1Qq5aDXVVgOEAd+TvgHM
 SDqzzaDZDju1KBwKin9Bcx40DgOyQHrgUINSteE8NtfeFSeTcuQ0Rcs0TY5u+7mT56eM/LV7jBz
 j2pPi4P7Th2BT+LNYU0NzTIatKnUK4Aq6HuA8rSWVfQzXNYoD8ZaqqkkbVJmlzj8B4MZezPDxnm
 7a7saDtvWhd8HJLazSNkuh+LcxBhya1EoCz7j4StmIdV57i23NgGBZKVXbhcSFV9WaOFvDAqAQw
 mc8JVn60fAsgthEUJk6FfysvUkrtzhI3Pu3lld65qPDtnXx3bbfPbrI7mwpkE4pomx2wZJXTeKD
 xoStsCwpFHz4bnQ==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772

There's a race condition between the SCM call API consumers and the TZMem
initialization in the SCM firmware driver. The internal __scm pointer is
assigned - marking SCM as ready for accepting calls - before the tzmem
memory pool is fully initialized. While the race is unlikely to be hit
thanks to the SCM driver being initialized early, it still must be
addressed.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
Bartosz Golaszewski (4):
      firmware: qcom: scm: remove unused arguments from SHM bridge routines
      firmware: qcom: scm: take struct device as argument in SHM bridge enable
      firmware: qcom: scm: initialize tzmem before marking SCM as available
      firmware: qcom: scm: request the waitqueue irq *after* initializing SCM

 drivers/firmware/qcom/qcom_scm.c       | 83 ++++++++++++++--------------------
 drivers/firmware/qcom/qcom_scm.h       |  1 +
 drivers/firmware/qcom/qcom_tzmem.c     | 11 +++--
 include/linux/firmware/qcom/qcom_scm.h |  5 +-
 4 files changed, 43 insertions(+), 57 deletions(-)
---
base-commit: f817b6dd2b62d921a6cdc0a3ac599cd1851f343c
change-id: 20250624-qcom-scm-race-5e7737f7f39f

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@linaro.org>


