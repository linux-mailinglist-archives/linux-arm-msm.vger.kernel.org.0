Return-Path: <linux-arm-msm+bounces-63057-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id AEE69AEDC61
	for <lists+linux-arm-msm@lfdr.de>; Mon, 30 Jun 2025 14:12:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id AEE333B5116
	for <lists+linux-arm-msm@lfdr.de>; Mon, 30 Jun 2025 12:11:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7C964283CAA;
	Mon, 30 Jun 2025 12:12:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="rXF5bPxc"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF3D828467C
	for <linux-arm-msm@vger.kernel.org>; Mon, 30 Jun 2025 12:12:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751285533; cv=none; b=J3IYGO+b5EQPhsx9xMQaUmUKJEtvSsg3IDFnD43wbdGA7FCxb2HlAgvTziHomnJz8gaJRq2a2e/ym8tck4EV6qGyc6+PbugAxGvppEvEXQVm9sjbHTm7ezb1YQQqgrM50TxLzvimKU1Np6Kurifg0/GP/O9ZOwLmhzPxZgOuDME=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751285533; c=relaxed/simple;
	bh=XsZ01gn6SKmjRX1uNL50S5Fe3COtllINdgku1Ra0dhs=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=InO5dZzOG3K5r37r3qG3ThHDyzoJsNUuvl2aocULr4rgUmKY5wxZHGP51/xnF/RmzimOaZMNSEIPAI0aMuAK4CI+E6BHb4wzYgIHapkt2EU0rHM8F8swDcGkkyc23+V/k7of3OyXsdjbtJPo9xoB+92mExUdIkTGkPtPbfn620M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=rXF5bPxc; arc=none smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-3a507e88b0aso1563399f8f.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 30 Jun 2025 05:12:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1751285530; x=1751890330; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=1s8oUTZcjoh5Kq1JzK41PPsRuPDdA11TohyVqgN/ZZc=;
        b=rXF5bPxcadU+tDESSukqX7Ao0KnIvEnszYBpDeZiq2taC5fvWE+RB2szlGqbKpZ/xI
         duMJWYopRSjtWSGCnM6PCE8jgF7+fDRkAICmko2a7eJLcxkt9WpHHdQ4IqlUP++j887m
         ZfquuPNP2NL0eluP31QAhT03Lj3Qb8dIsnHKYqwvXQJrerc6YPg/QDc5HYWbkb9XvAIv
         3MPSyeikGIvwRWWKRdAAPEggyiSkcH6iKH9XXESCBf6OySD/6NORJh8eDncnNumBWGED
         fwjRG+tS4D59hldf9X9RTQUiB6FPdLnyIUCpyrO/Y41gBOvz6Yso7TtphQHA+u2qrpyj
         Y+uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751285530; x=1751890330;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1s8oUTZcjoh5Kq1JzK41PPsRuPDdA11TohyVqgN/ZZc=;
        b=Ve1+rEr/wQaFCu1mKvYCacA4BzAsasCYpsnvSEEabF6r7fA54Y/n4VODCMpd7Roie+
         t0Zoxw+eyhaKajUlSsxPvNGYAHox/Snq/hoeSKtU0fcgqTqaju/kHW45lx2HKmfPdGAI
         hhZ4tllDT/39SVPEcqMMvMhiVQEEFpo6QgnIaATAYTSuE/z6STQdnUJUwJjBSQRWVqRc
         YcswmnpEChg5507bj4ICEXby555STtEVNYIZipeQ7l9PVxBZZhcYVgC8mpmy/kVLLINR
         fngf2CtotJjsBCkatVu1KjeU3IIEiGD7HWATBcCOlCfLjChe0+j+nFFkAJYYP3pxFPgW
         +0YA==
X-Gm-Message-State: AOJu0YwwIF/xOW1JQ2EwaJF2/6R9jqw/00iUzFpGHXqxyBX5swXKR55/
	qXVbuXYh6T1Wnc+jHv3Xpv+aeJ04ilAfRYeENeK0gSAfFjwuitlczGcm7Xwhyux1GZM=
X-Gm-Gg: ASbGncsGTBTjo3e+4RpGZvkWb7d3qi1PFV5RzfV7/9Wcj+dZ8QyWcn/sglRwHqYhoeI
	J4wx1lNeLuu3MxbNLD1rNMsCrkJfCR+GYg8FON2+NSZKRv+T6CK39Jl3fdx+i2Ep76oKe8k5jAE
	wOdw8FvO8nZWxdH3ia42w7Aiwl5Kf1DN4MHoa0EghSS49EuP3JrjvRonTamessnfh1u1fdAeFXm
	VWpA9jVGN54/gtyIVPT3RibueU2YIaYEV9byNVYxz3XcYZTzDYmjHuCKepd1dw8S7upuir+aI6F
	Muv/AEzVMC5OCv5Aipqur9tZFJjEBlHi6j47aYSCUjcGvyMzYrzteBMy+eobpijGXpc=
X-Google-Smtp-Source: AGHT+IGMCvGG2EAsgade9JhSv7QJondLI23WTPAiEg9wfACf605/gxoJRn1uFiUWhBnYOR4zrnVkTA==
X-Received: by 2002:a5d:584b:0:b0:3a5:3e64:1ac4 with SMTP id ffacd0b85a97d-3a8fee64d08mr12789671f8f.33.1751285529748;
        Mon, 30 Jun 2025 05:12:09 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:19e3:6e9c:f7cd:ff6a])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a88c800eaasm10470472f8f.37.2025.06.30.05.12.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Jun 2025 05:12:09 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Subject: [PATCH v2 0/4] firmware: qcom: scm: fix potential race condition
 with tzmem
Date: Mon, 30 Jun 2025 14:12:01 +0200
Message-Id: <20250630-qcom-scm-race-v2-0-fa3851c98611@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIABF/YmgC/13MQQ6CMBCF4auQWTumLZSqK+9hWGCdwiRCcWqIh
 nB3K4kbl/9L3rdAImFKcCoWEJo5cRxzmF0Bvm/HjpBvucEoY1VtKnz4OGDyA0rrCS05V7rgQnk
 MkD+TUODX5l2a3D2nZ5T3xs/6u/4k+yfNGhVWtlaadDDV4Xq+89hK3EfpoFnX9QNkpf6PqwAAA
 A==
X-Change-ID: 20250624-qcom-scm-race-5e7737f7f39f
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Johan Hovold <johan@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, 
 Johan Hovold <johan+linaro@kernel.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1480;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=XsZ01gn6SKmjRX1uNL50S5Fe3COtllINdgku1Ra0dhs=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBoYn8XKBa3WfXs7Ew1KDx/dg2P9K+SmsG2n0g09
 v5VxgAAaNuJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaGJ/FwAKCRARpy6gFHHX
 cjjpEADDQuDiDUZ7oMhXf2Z2uRZbx8tEFpoyPk/Xt2w72efPG951JZQG1cJFOUYt10JrzxhNv62
 OHhqnbuP5zYqtn0RQsORqLR1ZhxlSbJb+JBS36gKwR/YZqHYV7+VbnQ8A0D+eZzPTISOaq8Zyj4
 UBsn6keaR0QQCd5EzgTC7wTsrtUzKLdALxj2ZiFIl4XRoSKFEOnCkeI+n38F2sbL4QeyNC0Om2T
 UGr6sWwhWi4esJFH8pjFMIoJkkgXeqlnqJ6zmQpIigF8hTHz1/QROd3Ozs0XbWi6MoCT5wuRdFm
 yoj4iQC9991Wf6PnVy2XY27NTXo8KhUeV15rURoVcNLP64cXLa6ujC+6zoWcoFChzZFNcToCQNO
 78Y0A/KVQ7X0oMusYWkPTS/3JzOy9tZiGsw0brQuaWwN/2mT5XQ/YGhbRauT4AMxcuIk5DtzghW
 bS9cqP4BcrtAJLZ8D4B1RbI7Ucgn4XeciBi41DaikJVPg8ddPrQUB/LQFxCXF3XEuCX4aiXYmt+
 eKiRAP2b6Ym2dSk7b3r5C5rICNDtq75AJG+hewCJzuF/TeB/C4pkNCw/gqgPdoUosWxp5iDjzFh
 CZYchtADn9fWPTIrZDk3SEaZygsNQY2mYrAzKrzIQk9CVSP9QFCm+chjwMERKsu/IxMjnd52grU
 d8xFbN1vCMMPKWQ==
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
Changes in v2:
- add comments explaining the ordering of operations in probe()
- add Johan's Reported-by and Closes tags
- Link to v1: https://lore.kernel.org/r/20250625-qcom-scm-race-v1-0-45601e1f248b@linaro.org

---
Bartosz Golaszewski (4):
      firmware: qcom: scm: remove unused arguments from SHM bridge routines
      firmware: qcom: scm: take struct device as argument in SHM bridge enable
      firmware: qcom: scm: initialize tzmem before marking SCM as available
      firmware: qcom: scm: request the waitqueue irq *after* initializing SCM

 drivers/firmware/qcom/qcom_scm.c       | 95 ++++++++++++++++------------------
 drivers/firmware/qcom/qcom_scm.h       |  1 +
 drivers/firmware/qcom/qcom_tzmem.c     | 11 ++--
 include/linux/firmware/qcom/qcom_scm.h |  5 +-
 4 files changed, 55 insertions(+), 57 deletions(-)
---
base-commit: f817b6dd2b62d921a6cdc0a3ac599cd1851f343c
change-id: 20250624-qcom-scm-race-5e7737f7f39f

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@linaro.org>


