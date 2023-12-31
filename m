Return-Path: <linux-arm-msm+bounces-6180-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E07F820C2B
	for <lists+linux-arm-msm@lfdr.de>; Sun, 31 Dec 2023 18:31:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 90CDC1C20627
	for <lists+linux-arm-msm@lfdr.de>; Sun, 31 Dec 2023 17:31:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7D2B68F60;
	Sun, 31 Dec 2023 17:31:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="YmJ3wg6O"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com [209.85.167.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A502A8F40
	for <linux-arm-msm@vger.kernel.org>; Sun, 31 Dec 2023 17:30:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-50e7b51b0ceso4818012e87.1
        for <linux-arm-msm@vger.kernel.org>; Sun, 31 Dec 2023 09:30:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1704043858; x=1704648658; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ENPQ9nPSHLVwczlWG857rd2OsLldi8OAyT0IYcx4yVw=;
        b=YmJ3wg6O1b+d+Rk9znwrYS69wncVod5GPlF140ma8Y0T3WPQDX9kzsM43dVyqrsSFZ
         /SYFJTrQ0eDb+hQHC/X2JyfHpi1u1EJhc4GxDuqmOdYVk/kZ6g0dz/lPQYxwO5Dete9/
         8ZEYgnxFuYlu+Qtuy2PihAVK+z0r+hWeseQ/CD7CPVPbPWIRooVl5iAaPndW4JdsQ7vF
         h9FNIW3sGK3X7zGa/ld8sfceCMoOqQ7MNSL7aZglCkQBU1DZuzPmi8rR9vYfSN+fiZgH
         GPGr+adjgJd3ZojYPvtU+YK6z+hUljSUziUZXKCYCy9n81XZS0OAUHX1vsYbCwPKZLvB
         plDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704043858; x=1704648658;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ENPQ9nPSHLVwczlWG857rd2OsLldi8OAyT0IYcx4yVw=;
        b=toZXmBw3yFqSuoBsp86hWtZBzawplIDUqErJNVSt0s6mrpSIRf1MMq23DjycLPYVEG
         bjDjHrmFvJ2ML+r3WV+xuYG7PZfIWLV1g4BD81IAZxybc81+FfSxpyaOCI7R4qHVEga1
         W/f3xYJQEwqw4Kv9arSuNDP2EBxABDGrPvPFA+QJA66v85m8rZ0dEpWQgnv1ZbJWO3qt
         gilO+NeaXBVLN0VvHclDfDRVKqOOAEdA3Thq1PEeT/2k1wcdn6kwulKtvJtZFy3VGpX0
         WBgmtZC5/jpByFogpsRND9uGOyrsAvIx/k09Ce7vNm99Z8iqb4VtaR4km3UwcEWxI9gK
         VoqA==
X-Gm-Message-State: AOJu0YxHv7BjgNsK+yVEz5Facv3G8wku8D+aOWUdrEU13lPVsDpQKXwB
	akdTtXx8YbLiOu8WuGeAd7fzwLoA2p5gug==
X-Google-Smtp-Source: AGHT+IFynRsUHaPiY1xgrqTmRNJFVVoxwnUNiQXq5ev5kKelzxzlr8vb04FT+8no48ncj0oHsNkLeA==
X-Received: by 2002:a05:6512:b96:b0:50e:7b9c:4d97 with SMTP id b22-20020a0565120b9600b0050e7b9c4d97mr9170183lfv.8.1704043857636;
        Sun, 31 Dec 2023 09:30:57 -0800 (PST)
Received: from umbar.lan ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id k1-20020ac257c1000000b0050e6b5228d3sm2754645lfo.304.2023.12.31.09.30.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 31 Dec 2023 09:30:57 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Subject: [PATCH 0/2] cacheinfo: allow using OF style matchine for cache
 devices
Date: Sun, 31 Dec 2023 19:30:55 +0200
Message-Id: <20231231-cpu-cacheinfo-of-v1-0-cd3584d2c7b4@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAE+lkWUC/x2MMQqAMAwAvyKZDTS2k18RB42JzdJKiyKIf7cIt
 9xw90CVYlJh7B4oclm1nJpQ3wHHJe2CtjWHwQ2eGsjHibxwFEuaMStyUAqO/KqeoGVHEbX7X07
 z+36LeRyrYgAAAA==
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 "Rafael J. Wysocki" <rafael@kernel.org>, 
 Thomas Gleixner <tglx@linutronix.de>, Peter Zijlstra <peterz@infradead.org>, 
 Rob Herring <robh@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
X-Mailer: b4 0.12.4
X-Developer-Signature: v=1; a=openpgp-sha256; l=1277;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=IgpuUI4mJ+N/asUGNSreCP6OtN6w4Zroksz4oD7+Cqo=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBlkaVQj75N0TzLrENDJ/Msq4JbusCqGCQJcz/+M
 Z9IA7iWDamJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZZGlUAAKCRCLPIo+Aiko
 1Z8lB/9RtYsiydjhOVARpLdBVyYrVxIvLzF5laertNGI9P2pzmYs54S07LZLf8oUZC5BCeJDUwI
 tUnRF4+YmP/s/FSVCdGe7u7V8E1jyLDWwOCzP/ktXZbhQ1hp4GmslCSpTko+vm1oNJH+bA2iou4
 WrnhmdW+BlEMuZZ9w49+StcdMIXrfdgag6gdshm+E9Gui2DZIGTZFB3+Drwlpvw51sGNTX2b/lb
 SeLe7344UgcaqS58V/qNl6GLT1/v5a4e4yLDwaNCPRzZ4nC442slUFgnWHlsMEe6ioris+Xjscm
 iqPc5MhWVZY7Ne5MNg6nHyEcTon3uucHD2T4lUzhLpHxmzVm
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A

On Qualcomm Krait (APQ8064, MSM8960, MSM8974, APQ8084) platforms L2
cache frequency should follow CPU cache frequencies. It is logical to
put the correponding OPP table into the L2 device node and then add
simple devfreq driver that aggregates CPU votes and sets the clock
accordingly.

In [1] Rob suggested reusing existing cache devices for
platform-specific cache drivers. This series implements that suggestion.

This is posted as an RFC. If this implementation is found to be
acceptable, corresponding L2 cache driver will be included in the next
revision.

[1] https://lore.kernel.org/linux-arm-msm/20231011154935.GA785564-robh@kernel.org/

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
Dmitry Baryshkov (2):
      cpu: allow matching cpu_subsys devices against OF nodes
      cacheinfo: pass of_node to cpu_device_create()

 drivers/base/cacheinfo.c  | 16 ++++++++++++++--
 drivers/base/cpu.c        | 15 ++++++++++++---
 include/linux/cacheinfo.h |  2 ++
 include/linux/cpu.h       |  3 ++-
 4 files changed, 30 insertions(+), 6 deletions(-)
---
base-commit: 39676dfe52331dba909c617f213fdb21015c8d10
change-id: 20231231-cpu-cacheinfo-of-c4f14013bf31

Best regards,
-- 
Dmitry Baryshkov <dmitry.baryshkov@linaro.org>


