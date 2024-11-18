Return-Path: <linux-arm-msm+bounces-38206-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 014959D0E43
	for <lists+linux-arm-msm@lfdr.de>; Mon, 18 Nov 2024 11:19:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 87B781F23141
	for <lists+linux-arm-msm@lfdr.de>; Mon, 18 Nov 2024 10:19:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 04C501990C7;
	Mon, 18 Nov 2024 10:15:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dbgT7ptF"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28754194C90;
	Mon, 18 Nov 2024 10:15:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731924930; cv=none; b=e+88XJf+lHCTRQjvelymr9z6RaE241LDFn2J9L3V5nkT4APp5t7Zs65LmmzayV7QrMGNurqJS8R+OinbrwCgtrgEyYwCm1vlxhFcHXWQDrrwhh95NwbNHijkgd86H4KFYgcFVo886xMxeiu0e62ZEpilnpunMi0Y9UCPO8eYtlk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731924930; c=relaxed/simple;
	bh=kh+U076QVsVp7Vb8Ettn3ktDD3XkKajC3VQy1Y5g75c=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=dhTuzIlXODUKXG7fQ7vjwhTktdsKp0nsyPQtkFor5hUwpIF2iDzCVNTwQV7cOH6o135Ryo7kg25AVZReHjLToriW/JteYiM4cXuYwPBxVq1GpHI62Jlp+Uc/phMOU6PMMqAVzb/zDwfbghmingwKsV65sZghI3+9Jz4vDCJXZq0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dbgT7ptF; arc=none smtp.client-ip=209.85.208.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-5c9c28c1ecbso5680253a12.0;
        Mon, 18 Nov 2024 02:15:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1731924927; x=1732529727; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=QC6v63zN/LS8xn8Q6J/qgxLNxqB0A6W28tutvITfh9I=;
        b=dbgT7ptFXR9EjBzDs3nFlWf8UNEZkDi6al8QvG8kzREKTMGLLufBFM7N8Uxi1kcqxc
         MdwmWwseB1KV8X7tIfeggxhIvL5U8GSENntGiPqsncl4AQYVpurEliPLASzni8wmRcAN
         S2kD2jekBIHa5QxoYsKMInHl0Ie0hqcNSaGjdTJo6dnGUz8wbA1PXiWYLu4FkPbO6aOk
         nyi9n57GGuenLIMv8UrRxsPxsTRI39jf6/38ghVeNjQh8FAr8GN32U2jFUaSmd8c4l4+
         y1FPfZ/6kaVSQByqbD9NWWYgfSRlIJ9xrTQ/oeuYkh7q2oDPfwpUNr1z8Zq5mDrjxzkR
         Vr8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731924927; x=1732529727;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QC6v63zN/LS8xn8Q6J/qgxLNxqB0A6W28tutvITfh9I=;
        b=l1/oht3gbrimbneAE/402Swb5nBFaJGKBN3idMG4l2mKGHN4ulFHXXCvOiBSjhO7fn
         M4nZVpJNUnAomf42oXEQxYQpTa3iAEc2gm9zZv/bMmbJEXHEV3Ve4W8h6jfXyk/rQ31+
         b3L6enFAPz66Ry1efW2pMwB/sfVQcMkj4V6/59Zibk5E6E05rxh8pVtjqI+5UtPzZhdx
         SnpZSBBIkDEJWuIpVSnmQ2+XajtuDY0B5DROyD16S5USN1VWbvitG0zOWRus4d5KkSpY
         nOPGHm08YOBXKpGy0C+jlHj5YApn8ih3XwFgjy2AiGSm27is0fgQ0YgxocY14U6qwar6
         8N6g==
X-Forwarded-Encrypted: i=1; AJvYcCUCi1GqOOh+sc3EBETzCt3jVJ7UP1ttD/q4lryR4waIv7NDfveeMfb5+uN4bJjCmCLbz2idjah1BQqmbXKM@vger.kernel.org, AJvYcCVQ9CrmDgb7KFUk22A9VqCAxBNkEJm1qiwZ12S0OAtzzOeJqOPxrSSYLDLiTYmuTzX/IkR3SR7KwZw=@vger.kernel.org
X-Gm-Message-State: AOJu0YwyvkGyeQtzfb6Bhb4jpGzsfmCEZgy4xo46eHr3ZbkQxbDctNTm
	3F5RMWXtZwpQHboFSNBh+QtkYx+HkCP4xSrz6CP8yOaP1nP03bjNDig2aw==
X-Google-Smtp-Source: AGHT+IE2e7PGLWsCc2fA0mi2kLOJGUpWgYCl7d8WdIrG4PiKA4JGvipv4j8gRm+XxPopHIGBH6++aQ==
X-Received: by 2002:a05:6402:5245:b0:5cf:c18a:7787 with SMTP id 4fb4d7f45d1cf-5cfc18a7843mr2911816a12.11.1731924926792;
        Mon, 18 Nov 2024 02:15:26 -0800 (PST)
Received: from [127.0.1.1] ([46.53.242.72])
        by smtp.googlemail.com with ESMTPSA id 4fb4d7f45d1cf-5cf79bb329bsm4574455a12.38.2024.11.18.02.15.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 Nov 2024 02:15:25 -0800 (PST)
From: Dzmitry Sankouski <dsankouski@gmail.com>
Subject: [PATCH RESEND v8 0/3] Add divisor computation feature for sdm845
 gp clocks
Date: Mon, 18 Nov 2024 13:15:18 +0300
Message-Id: <20241118-starqltechn_integration_upstream-v8-0-ac8e36a3aa65@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
To: Bjorn Andersson <andersson@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Dzmitry Sankouski <dsankouski@gmail.com>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1731924925; l=2871;
 i=dsankouski@gmail.com; s=20240619; h=from:subject:message-id;
 bh=kh+U076QVsVp7Vb8Ettn3ktDD3XkKajC3VQy1Y5g75c=;
 b=tdAVl6S7hKEghqXNrsHN0xPEsqM9kyMuiIplxwlZeV5p8RLLJOOPPZIvAdWYHzucVvTWLIxG/
 ekk8byvuId+AsHjZ5opz2JfO+ow622BEFZJ1N3EAGMtrQlZRmMaxTq/
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
Changes in v8:
- format kernel-doc
- test with scripts/kernel-doc
- Link to v7: https://lore.kernel.org/r/20241024-starqltechn_integration_upstream-v7-0-78eaf21ecee9@gmail.com

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
 drivers/clk/qcom/clk-rcg2.c   | 198 +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++-------
 drivers/clk/qcom/gcc-sdm845.c |  11 +++------
 3 files changed, 193 insertions(+), 17 deletions(-)
---
base-commit: 86e3904dcdc7e70e3257fc1de294a1b75f3d8d04
change-id: 20240617-starqltechn_integration_upstream-bc86850b2fe3

Best regards,
-- 
Dzmitry Sankouski <dsankouski@gmail.com>


