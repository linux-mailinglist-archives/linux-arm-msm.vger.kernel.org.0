Return-Path: <linux-arm-msm+bounces-35670-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id CA0EB9AE22F
	for <lists+linux-arm-msm@lfdr.de>; Thu, 24 Oct 2024 12:13:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 615E2281EDF
	for <lists+linux-arm-msm@lfdr.de>; Thu, 24 Oct 2024 10:13:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DA9A31C07DF;
	Thu, 24 Oct 2024 10:13:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JBqdDnZu"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 923AC1AF0DA;
	Thu, 24 Oct 2024 10:13:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729764806; cv=none; b=XByaQb+p+g99LOHtrKiRxoTWGcZTLK67QwofpQx2WlDffFw6Sel7YP3dzT31IZyeib7t2qwbRCS5fQUAKSbsZAkzZxRZosiK4zfv465Pra5wrT8TgRecXeqFTuRnzVDyXMQW3Vyyn8KzRfynNl6zgFS0Ka76rGJthLSi9yxeEXA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729764806; c=relaxed/simple;
	bh=CGrZ/mOqfUvaaEXclhzc78HhW8pylQ1jTyrtnVRCGSQ=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=IIIFhuo8+4TICv1AvaFatSUk6LIspnwYGBNvEaCLH81mhDF3Y+VvSBSbOUJuYVL5fNauoVmg8C5xapv3LVFfrJ2Cd2mL+e2jA5f9FFUK86f0YW2VrRzde+Mc0FgZ25yCnWVAtI2xeUfSJQ8i0dunUVpTgFcUN7p3PmH8OhO5hEw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JBqdDnZu; arc=none smtp.client-ip=209.85.208.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-5c94c4ad9d8so871817a12.2;
        Thu, 24 Oct 2024 03:13:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729764802; x=1730369602; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=sgKXmP4VMT0PuxK/GViUnVa7464Cl8DA0lQZldxMB2E=;
        b=JBqdDnZuGNNrIArS6noeQPiFkJHEFahgWoyUg7A6ksl0bpUrR4DmaoMxDlpyduykv3
         ZtA5SW7eGb5xPXw3vOCEGmm/J/73D2mK+IZ9PSwPeUfKRoV3v6sKe3n7tvt2AKnYLgLH
         QN/Ti82ZaUB8DJxTzRknmYQVyXSrAb+VlSyUfdsxDInkXn9p4chptLYjTtjlhWbAuyn/
         5Mvag1Nt6aaGoR6PEIRnBr/KjSyDdKi79C7AqZoxgh027uHnZQMYWWAmKMMa3UM9quIE
         3oDXnolG/wcjIOimMeOIDD7EwHbMKiB0vbXuJueW7EQe1/L7tYuoxMRzFYDMM0pcwxQ/
         rKWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729764802; x=1730369602;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=sgKXmP4VMT0PuxK/GViUnVa7464Cl8DA0lQZldxMB2E=;
        b=v9apHx1SfaVts4oK4C2zIIb9QKr6La6DEH6m7mJWtHJeW/TaaFZx3aLDqp/B/E6Cfr
         zsQMwuaqGj81PDisEu3eMEboPAnxV+ywhYD1YeNldq8qGsrIVgZwF7vgLBL8hMGlUksS
         yxaYT1w0Ea5L4Vce9qLwoGURr0C5ERxP7Y7gz7hLdahEIzbj3FQ1VZK6DcD4kr02FS8d
         dAYeUWAQEKUmzXgP1+FGcd2YNrSeTg2iGIGa4OKNd429U8tDX3Tg2+okzkIDsR6tdFp6
         8bXEuHWKl6/RFI4wpWi1oKxqFQaH9IEV6UFMlflRH0g8CJCEy3kKe2d+ckEG9Ids/IRi
         xUnw==
X-Forwarded-Encrypted: i=1; AJvYcCUgV5uI50gd03K4dyLSVJxtLYzVXhcQnXKURRPpIHeoNY/Q0LMrfi2Eh9ns+lH/bi8gnIr7YgNopftkdm59@vger.kernel.org, AJvYcCX2BbbEpmzUcUo0xHi57JztArQCSR3Qn4rkCHHGDaLBM7UzbeciD+nH13w4i1fbewJBf9Ai6yGYZ6M=@vger.kernel.org
X-Gm-Message-State: AOJu0YwE9MJunI+QgZ4vBqAPnSi8d5H9kVjImBvuzMuUf73UWSpNdl+e
	1+eLGTEj/dRz44pYtDG80UaKzdibg92s1mU2I1rCSoI04GWeN9ox62Hvxg==
X-Google-Smtp-Source: AGHT+IFBnPSBl+y4pDQ2dcHlvHJ9r3XPQEKWtuWRcmBM4xdsMaKkDCHyo9MYY9RgzF3xLb+mienbsQ==
X-Received: by 2002:a05:6402:3483:b0:5c9:5c40:6d9a with SMTP id 4fb4d7f45d1cf-5cb8b193477mr4129938a12.34.1729764802210;
        Thu, 24 Oct 2024 03:13:22 -0700 (PDT)
Received: from [127.0.1.1] ([46.53.244.166])
        by smtp.googlemail.com with ESMTPSA id 4fb4d7f45d1cf-5cb66a6a6efsm5519757a12.53.2024.10.24.03.13.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Oct 2024 03:13:21 -0700 (PDT)
From: Dzmitry Sankouski <dsankouski@gmail.com>
Subject: [PATCH v7 0/3] Add divisor computation feature for sdm845 gp
 clocks
Date: Thu, 24 Oct 2024 13:13:08 +0300
Message-Id: <20241024-starqltechn_integration_upstream-v7-0-78eaf21ecee9@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIALQdGmcC/43QTW7DIBAF4KtErEuFwfykq96jiiIMYxvJxikQl
 Cry3TuJ1DbKpl6+EXxvNFeSIQXI5G13JQlqyGGJGPTLjrjRxgFo8JgJZ7xlqtE0F5s+pwJujMc
 QCwzJFvxzPJ9ySWBn2jmjjGQd70EQZDqbgXbJRjciFM/ThMNTgj5c7r0fB8xjyGVJX/c1qrhNf
 xrN/41VUEZB9Eopzhpt3fsw2zC9umUmN7y2f+C+ERvAFkHuOfReOmm0fgbl44YbblIlghqf7iV
 YyUz7DKpfsGFsC6gQ9F5Lx5TTzPhHcF3Xb2JfzcXYAQAA
To: Bjorn Andersson <andersson@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Dzmitry Sankouski <dsankouski@gmail.com>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1729764800; l=2701;
 i=dsankouski@gmail.com; s=20240619; h=from:subject:message-id;
 bh=CGrZ/mOqfUvaaEXclhzc78HhW8pylQ1jTyrtnVRCGSQ=;
 b=BbbibVAaHFop+D7PoxA5FE6WoD7/S5yY6PXwbnvmHsINmQD1TOvuflUdCg3DO9X3Zc0HJ+Pg/
 H5QeZTpWumWDbDk4CPdY2oUrRLReT198D971P3tppj36LwgwTYBhGWr
X-Developer-Key: i=dsankouski@gmail.com; a=ed25519;
 pk=YJcXFcN1EWrzBYuiE2yi5Mn6WLn6L1H71J+f7X8fMag=

SDM845 has "General Purpose" clocks that can be muxed to
SoC pins to clock various external devices.
Those clocks may be used as e.g. PWM sources for external peripherals.
    
GPCLK can in theory have arbitrary value depending on the use case, so
the concept of frequency tables, used in rcg2 clock driver, is not
efficient, because it allows only defined frequencies.
    
Introduce clk_rcg2_gp_ops, which automatically calculate clock
mnd values for arbitrary clock rate. The calculation done as follows:
- upon determine rate request, we calculate m/n/pre_div as follows:
  - find parent(from our client's assigned-clock-parent) rate
  - find scaled rates by dividing rates on its greatest common divisor
  - assign requested scaled rate to m
  - factorize scaled parent rate, put multipliers to n till max value
    (determined by mnd_width)
- validate calculated values with *_width:
  - if doesn't fit, delete divisor and multiplier by 2 until fit
- return determined rate
    
Limitations:
- The driver doesn't select a parent clock (it may be selected by client
  in device tree with assigned-clocks, assigned-clock-parents properties)

Signed-off-by: Dzmitry Sankouski <dsankouski@gmail.com>
---
Changes in v7:
- split gp and non gp changes
- Link to v6: https://lore.kernel.org/r/20241007-starqltechn_integration_upstream-v6-0-dd75c06c708d@gmail.com

Changes in v6:
- fix kernel robot issues
- run sparse and smatch
- Link to v5: https://lore.kernel.org/r/20240617-starqltechn_integration_upstream-v5-0-761795ea5084@gmail.com

Changes in v5:
- Split patchset per subsystem
- Link to v4: https://lore.kernel.org/r/20240913-starqltechn_integration_upstream-v4-0-2d2efd5c5877@gmail.com

Changes in v4:
- Replace gcc-845 freq_tbl frequencies patch with new approach,
  based on automatic m/n/pre_div value generation
- Link to v3: https://lore.kernel.org/r/20240618-starqltechn_integration_upstream-v3-0-e3f6662017ac@gmail.com

---
Dzmitry Sankouski (3):
      clk: qcom: clk-rcg2: document calc_rate function
      clk: qcom: clk-rcg2: split __clk_rcg2_configure function
      gcc-sdm845: Add general purpose clock ops

 drivers/clk/qcom/clk-rcg.h    |   1 +
 drivers/clk/qcom/clk-rcg2.c   | 192 ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++------
 drivers/clk/qcom/gcc-sdm845.c |  11 +++------
 3 files changed, 189 insertions(+), 15 deletions(-)
---
base-commit: 63b3ff03d91ae8f875fe8747c781a521f78cde17
change-id: 20240617-starqltechn_integration_upstream-bc86850b2fe3

Best regards,
-- 
Dzmitry Sankouski <dsankouski@gmail.com>


