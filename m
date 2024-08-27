Return-Path: <linux-arm-msm+bounces-29680-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E8A0C961A49
	for <lists+linux-arm-msm@lfdr.de>; Wed, 28 Aug 2024 01:12:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 0B4191C22D75
	for <lists+linux-arm-msm@lfdr.de>; Tue, 27 Aug 2024 23:12:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 442B71D45F5;
	Tue, 27 Aug 2024 23:12:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="dktET4mf"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA9431C8FB0
	for <linux-arm-msm@vger.kernel.org>; Tue, 27 Aug 2024 23:12:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724800363; cv=none; b=n+XqKGg0/5jBV+PepCaElUxKOWYSjaH/3s2EDe7x2eO7qU0N5G/adI35HYUOZCrR9kR/jXVprk6dyl7wxfQ1+nOtOE0txdjm20bRAmj68i0W4RY/YiyIEGBmt/jD/5cDsFJ7u1g+M2LtpEfUbar+QnwBE/ut9y78EBC+uC+fy4o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724800363; c=relaxed/simple;
	bh=GD0A4TPEYjATzBkKcTtoqywA1zBBEQMw9GL0OoeNNZE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=dHTkkjSqMUm3dFb3AQvOpaL+xeGU6ggf0pn8pLQ9wyIEWWczlCwPF+Esxz4AnjatfIsC7/xnaHdCwGRZhGx/E93cmXrBleMOpjll9u4Ch2a/eM9y0v0umPbg8tzFtJY9Ok7PcXxRp9m9p400ci6W10hwqQANXR9dj4WWLc040zw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=dktET4mf; arc=none smtp.client-ip=209.85.210.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-pf1-f179.google.com with SMTP id d2e1a72fcca58-71431524f33so5122607b3a.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 27 Aug 2024 16:12:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1724800361; x=1725405161; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Pv/ufdYKY+CmjhMEr75QBezIaND5j1qCC0DSQMSozsk=;
        b=dktET4mfslvA1SJW4v2i9VkKPcQlLYahTgW+U3AWuHMNGvDXOJGlwPXS4ew418R0SV
         mkuNzi8zTWnevq+ZJ0XXpRIT58WtyzOIByoOLnqgHTOW0ucYGOAfS/5X4zhFSEbLFNi8
         pf50/b0YOdWHPl62OAKMhTx6TwuO60cg2msVw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724800361; x=1725405161;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Pv/ufdYKY+CmjhMEr75QBezIaND5j1qCC0DSQMSozsk=;
        b=gOLtEwHpXxn7yNdYSxemAbvj656x3zsddbDrVoPOlKHLGb+GaBRJ5dZ2GEYnvm8x9Q
         PcbCBnf57brw5maLmu5Va63s3Mt2qQV2aQ3sZsP8urCFlF/sQePaRphQQcDlC9Uohvun
         ULqMoTh90ED0asSmUsPEHf4SKmcLAo3E3ffTRcVQeex9mowfIulGrbuzPHoLmPta0yfs
         Bq3w7qwu9TTVGRi1KvQLk1wS4iFF+Yzp2IFihOKF2Ef35Xhw6rRY7tm87PVNimjBSXt7
         ZRsNyKGjV65eCyt/il21xZb3lINiq9c8GfUbkfb8pIqq4pWuq6ttqYgWvjYyiR2uhsBQ
         MM7w==
X-Forwarded-Encrypted: i=1; AJvYcCXnf478r8cMn03WigR+LaK6oVQtFTmCHpwoaf+pNq33Yk7R9VeKI5pd/YfOXwhy6bEQjsV38BRAW6CZ9k7U@vger.kernel.org
X-Gm-Message-State: AOJu0YyaHgZcNkxfTmjWcyeMmdLVnqW8LU8v3i6wlV+sbWNJEi2T/HNk
	82Z2SBPYo+6CJNdllxhxoyMarnMjeFhguQQz4mmX6FnCd7WvggYnUQvSBPOUyyxPPR0RpFg/Q50
	=
X-Google-Smtp-Source: AGHT+IH+n08Sk8Vd2lCCcbwAL0bOTX/nA5NdiPgGvH28H6kVXqenmkkshHPtYDCVpMQVH6rWErsfbg==
X-Received: by 2002:a05:6a20:6f01:b0:1c4:231e:8ee5 with SMTP id adf61e73a8af0-1ccd2899c54mr110535637.29.1724800360717;
        Tue, 27 Aug 2024 16:12:40 -0700 (PDT)
Received: from localhost (210.73.125.34.bc.googleusercontent.com. [34.125.73.210])
        by smtp.gmail.com with UTF8SMTPSA id d2e1a72fcca58-7143424a525sm9016824b3a.49.2024.08.27.16.12.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 27 Aug 2024 16:12:40 -0700 (PDT)
From: Stephen Boyd <swboyd@chromium.org>
To: Konrad Dybcio <konradybcio@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Stephen Boyd <sboyd@kernel.org>
Cc: linux-kernel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	patches@lists.linux.dev,
	linux-clk@vger.kernel.org,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Amit Pundir <amit.pundir@linaro.org>
Subject: [PATCH v2 0/2] clk: qcom: gcc-sm8550: Fix shared clk parking breakage
Date: Tue, 27 Aug 2024 16:12:33 -0700
Message-ID: <20240827231237.1014813-1-swboyd@chromium.org>
X-Mailer: git-send-email 2.46.0.295.g3b9ea8a38a-goog
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Amit Pundir reported[1] that a recent commit 01a0a6cc8cfd ("clk: qcom:
Park shared RCGs upon registration") broke USB and audio on sm8550-hdk.
These two patches fix the issue by skipping the parking bit of the
shared RCGs for all clks except for the ones that were causing trouble,
i.e. the display RCGs on sc7180.

The first patch is all that's required, while the second patch can be
applied anytime to simplify the QUP clks that don't need to be parked.

Changes from v1: https://lore.kernel.org/r/20240819233628.2074654-1-swboyd@chromium.org
 * Revert most of the bad patch, except for the sc7180 display clks that still
   want to park at init
 * Re-order series

[1] https://lore.kernel.org/CAMi1Hd1KQBE4kKUdAn8E5FV+BiKzuv+8FoyWQrrTHPDoYTuhgA@mail.gmail.com/

Stephen Boyd (2):
  clk: qcom: dispcc-sc7180: Only park display clks at init
  clk: qcom: gcc-sm8550: Don't use shared clk_ops for QUPs

 drivers/clk/qcom/clk-rcg.h       |  1 +
 drivers/clk/qcom/clk-rcg2.c      | 36 ++++++++++++++++++++--
 drivers/clk/qcom/dispcc-sc7180.c |  8 ++---
 drivers/clk/qcom/gcc-sm8550.c    | 52 ++++++++++++++++----------------
 4 files changed, 64 insertions(+), 33 deletions(-)


base-commit: 8400291e289ee6b2bf9779ff1c83a291501f017b
-- 
https://chromeos.dev


