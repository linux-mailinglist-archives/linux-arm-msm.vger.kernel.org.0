Return-Path: <linux-arm-msm+bounces-29811-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id ADD90962E4E
	for <lists+linux-arm-msm@lfdr.de>; Wed, 28 Aug 2024 19:17:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 20EC2B20EDB
	for <lists+linux-arm-msm@lfdr.de>; Wed, 28 Aug 2024 17:17:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3EDE71A3BB3;
	Wed, 28 Aug 2024 17:17:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="G2irFQ2s"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA92318B487
	for <linux-arm-msm@vger.kernel.org>; Wed, 28 Aug 2024 17:17:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724865448; cv=none; b=ODQZ+th5et9leWlFf09OYcgmlDSTGdmY1JLQ9e+qV8l+Nv6jnH0g/zPJxi/wntsP4PAsfdFyBlSjgdjruH5M4t4R/KpiB+IW/pAhYlhgXmlZ5cWKr4wzDDvgqi1XWpG0xp2C+vfKYl+XzwUkSH1cHrbCJJK5XXVG+Uv/VlneXpQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724865448; c=relaxed/simple;
	bh=p1GvsN04RrnLY0X7JsqpE8JtBOcwD2Nm4oXAW17AAKY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=swIAr8Zt2PsKD81W9VQoXgLdnN3CvSCdl/tDNega2TmR0Yvaw5JQcPcpYasJDPGbQzaqAKYTJ6dA3jiXpnV9jFQJQ6V718V0vf47EufRTE2o9xNjVUN0ZseD7BWPewsh+1wYj3SMQ5L6RJSKkDdZHtWwvwGFPo4a27w2O7hOdrI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=G2irFQ2s; arc=none smtp.client-ip=209.85.214.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-201e52ca0caso49917985ad.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 28 Aug 2024 10:17:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1724865446; x=1725470246; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=4kJ5hpnL3/FBGpLHASzo1BcvnUs7S3nSY7lVkr92lVk=;
        b=G2irFQ2sPAcjjjjLKAl5rffyEzNWBL9HE4wkRUiKvR65hNwvjQ+E1CHVZFjY3cLda7
         CV59KgwG0XP7EHGqZFlFZjsNpg/JSWsIFzYzx4eFEoARjNtkCfZfPGi2j92DYcvgWJxO
         BQZUPMyApK1C5YERy87tgekKy1C++Iscu8Evw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724865446; x=1725470246;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4kJ5hpnL3/FBGpLHASzo1BcvnUs7S3nSY7lVkr92lVk=;
        b=nAdCs569iEzSuuGKAwU8q8qMIsAI4IYy7RhbfoVkGHAMDfpyB/3p4qVHvpf31f//iH
         dz0+9CaPr47UGSzw3Ys4QZgBT5vQzsC3Gt25nzWqyKMB+HWzpgCRUD8weeqAAGyQpN/N
         UdXNca9np8oQMnjquMXq13T8AFc6x5o7zTHkxmQtsNCUtlxJ9Kge/ZICPppSmXezgzYp
         +n8ANpUzMDKBvZYbHH8nb4nXC1vYpWjhQHutM6Jqyqexj7hMI0WPtEKvsq4J1P9MYJwp
         OSB0KhXche4zuWrMOCE2ryhk2GRtfhKPd4gGTfYvtX4gHNxm7254vvqPb6Eu9e9R4tE7
         Ptpg==
X-Forwarded-Encrypted: i=1; AJvYcCX+UnXdNeUl/QjhBrU52ABnpGZSSerEZkQ2frLv9MPdEGaF7gLsZxe1i40nM3gmdUqRgcEjWSsLjCHHnlVG@vger.kernel.org
X-Gm-Message-State: AOJu0YyBrkh8Sr1Xqq9CRtV+gdwjDVkATxNxxpW2JYfGHfyVRoP/+rH5
	4Add6UXM9IDYBhRQVkAHGo5eKjoD55U/mplWueXx1LsgInJhXLVAArJHQbBRVg==
X-Google-Smtp-Source: AGHT+IFS7ZURBYUCOol3v8lGedBydTXmTI3cDaFTKt6acXzQU+49QjTiAkXmr7wLO/8x1OSBOaOUWQ==
X-Received: by 2002:a17:902:c40e:b0:202:54b8:72d5 with SMTP id d9443c01a7336-2050c49692dmr1849355ad.59.1724865445848;
        Wed, 28 Aug 2024 10:17:25 -0700 (PDT)
Received: from localhost (210.73.125.34.bc.googleusercontent.com. [34.125.73.210])
        by smtp.gmail.com with UTF8SMTPSA id d9443c01a7336-203855dbcf2sm101566235ad.146.2024.08.28.10.17.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 28 Aug 2024 10:17:25 -0700 (PDT)
From: Stephen Boyd <swboyd@chromium.org>
To: Konrad Dybcio <konradybcio@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Stephen Boyd <sboyd@kernel.org>
Cc: linux-kernel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	patches@lists.linux.dev,
	linux-clk@vger.kernel.org,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Amit Pundir <amit.pundir@linaro.org>,
	Taniya Das <quic_tdas@quicinc.com>
Subject: [PATCH v3 0/2] clk: qcom: gcc-sm8550: Fix shared clk parking breakage
Date: Wed, 28 Aug 2024 10:17:06 -0700
Message-ID: <20240828171722.1251587-1-swboyd@chromium.org>
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

Changes from v2: https://lore.kernel.org/r/20240827231237.1014813-1-swboyd@chromium.org
 * Reword first patch commit text to clarify further

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


