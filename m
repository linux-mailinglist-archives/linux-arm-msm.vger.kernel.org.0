Return-Path: <linux-arm-msm+bounces-69171-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 141DEB260B4
	for <lists+linux-arm-msm@lfdr.de>; Thu, 14 Aug 2025 11:23:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 079D71887503
	for <lists+linux-arm-msm@lfdr.de>; Thu, 14 Aug 2025 09:18:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6DDBB2EA160;
	Thu, 14 Aug 2025 09:18:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="vrskjrDW"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 381602264CF
	for <linux-arm-msm@vger.kernel.org>; Thu, 14 Aug 2025 09:18:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755163101; cv=none; b=QBQGHv1OuWmGrgsexZvIJbu95Wt7pt78LA7UZ7HWy6bfuKVT+OCaWTSElwEA3+g9ssPFYHXJv4U7RI63vngNPPHfee/PQH7/bC/DshqQlY5BvKoEfTWoDTbZQJPxm0BtvnyBDhCXJZ4WrSfxnwB05/m/JHZytxPBJM5GoFBkKtw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755163101; c=relaxed/simple;
	bh=sfXErAu2y829baB7asLxYKvQd/EDsFZz8LkUJdrlX+s=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=MWAJhKA+HYw55LceBJ1SdyJdhoJhJKm1YfZMeXQZB2q2qWjhYVYRkwb9JwoGjrRJAQVjGVUZKnNxprAOPvnfhHI/cpwbTxszP8FuSXBCWaNdMPSNzFeVnagsiq4mRPuaX2+CNT/OANTCQ/cM/y5fLN7nfC4j13dFb44mcxG4KjY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=vrskjrDW; arc=none smtp.client-ip=209.85.221.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-3b9dc5c8ee7so494467f8f.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 14 Aug 2025 02:18:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1755163097; x=1755767897; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ffaHlWpu8RE7aequBY+27dl9SNuH9GqRdQDvB6bAj+s=;
        b=vrskjrDW+yTCwnAjf2FdtgrY3NMOG87/i8gdo4OdV8sqSd461Cme9WWyLcr8JVcp60
         bct5xwOOehrBp2YNXZmdltdbbhHBai2Upp05ETDkzqFdVtkgEVwialYPA72Txdz3PLao
         nLohiPbY74h5VYeYSfzQSfaTFP1aJNtheSufIDOKTva2OjZTsztWTCqm/ZlhKny7Eiok
         iE1SS+bCDWRFbT9/hSW2T79L549PJnnQZFVm3UgqGxFcchHOHHDwc4P5qXmbN0stlgrp
         4iSq17Wa9pULfjrEjasYVhnPVpYvQFvbD4z8VhlYh1rxlTy2V3EOncRDl12R0AobRLkj
         V7lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755163097; x=1755767897;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ffaHlWpu8RE7aequBY+27dl9SNuH9GqRdQDvB6bAj+s=;
        b=ELDdusel4Sk6zhvyv5N2Oxp6c6ggWAHROHznW7QeDmfEKb5IJjX/+jaWg2cAyXa+qV
         swvRz8OaS/qxkaYfbrEXWijPKjgg7q36oJJuGnQdDi7S6emGkbE2ty5xLRWSf1ONeM6N
         zvLm5fSyVamg+gjrTsfxFea69pBg/V+v3Iy8YDDOVazjCicbQhlkbvKl13jBDHKkCkMS
         COvs3rasJLk1V0mZ+kpThXkmtP/Eax5EvyvhGyYgiTcSGQwIRn3pDKaVZ2KwKbtawUU9
         /bL/vZuADOuAChBh880khRKKndzerT8zIs9L1sTTpskJIE5px9sVC/5F3voW0yi6V81h
         AXqQ==
X-Forwarded-Encrypted: i=1; AJvYcCXhOY9GtFIob9U8WwjuYMjaqJnr3jt5EUDB0T9lRB4KF/CAYJTEnI1PB7fHdpndj6iKpEJK1Oz7s0nJgGlE@vger.kernel.org
X-Gm-Message-State: AOJu0Yx7YphXT+oj0QppDP8/zzUduINLQxfw4CRZSfRxz4ePCc6Le6rz
	V4PBIEw02qiMu/WvOJButRiXmQ7pYRmei8kz2dY4r+PtN8YmMPmfutE7z7bcH+/tE4Q=
X-Gm-Gg: ASbGncvkFp/IetJNVjjPWIDFothEU05qzJop+MKmIzgswEPDbWZSX6M8rrM9UyVVcn1
	SMRFR6VYUEX/tXSRymYQOSEY91lClOnOB5RMl+L1GCPE+Rd3ILhtYBwRfBv/fZFcldBavlql3Ow
	OsbkHog5dv8iV2J4IA7Qp9t0yIyekLwK1hV1Z/jHUReM8ldjowmAWsA2xge4ADi3tfBRzFQRKFJ
	jZNhNpiPUGKM2g35OOAsRBI10NUEoLd0rycj4qBbsfijfmrgYyB6E9LVA0TU9a9/km6xao+G2Pb
	j9G038PFuYt1J3UATFIx0SOs7LEIP5XHeJVXCeVza8OjpnA693TW4bIigDgVfF3XvDH/iOe1KKR
	oYnNDFkc9eEvSOkXwIfIRxqznsWPThiHiysbZ1qktXQTcnDo=
X-Google-Smtp-Source: AGHT+IGCOwNbc5nUe5UXc9T+LlZ8/LSjfCjdWogYZwRPwtV/r3ZErXEW4EvaurTmA3Z5w5QHIDd2wA==
X-Received: by 2002:a05:6000:420b:b0:3b7:76e8:b9f7 with SMTP id ffacd0b85a97d-3b9e414d51emr1806910f8f.10.1755163097393;
        Thu, 14 Aug 2025 02:18:17 -0700 (PDT)
Received: from [127.0.0.2] ([2a02:2454:ff21:ef41:ea13:2485:4711:708])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45a1c74876csm13861925e9.14.2025.08.14.02.18.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 Aug 2025 02:18:17 -0700 (PDT)
From: Stephan Gerhold <stephan.gerhold@linaro.org>
Subject: [PATCH 0/2] driver core: platform: / drm/msm: dp: Delay applying
 clock defaults
Date: Thu, 14 Aug 2025 11:18:05 +0200
Message-Id: <20250814-platform-delay-clk-defaults-v1-0-4aae5b33512f@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAM2pnWgC/x3MQQqAIBBA0avErBswSbCuEi3ExhoyC60oorsn7
 f7b/AcSRaYEbfFApJMTryGjKguwkwkjIQ/ZIIVUQlcSN292t8YFB/LmRuvnXM4cfk9Y10JIrRq
 nrIJ82CI5vv5717/vBzozBnltAAAA
X-Change-ID: 20250812-platform-delay-clk-defaults-44002859f5c5
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 "Rafael J. Wysocki" <rafael@kernel.org>, Danilo Krummrich <dakr@kernel.org>, 
 Stephen Boyd <sboyd@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Dmitry Baryshkov <lumag@kernel.org>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>, 
 Abhinav Kumar <abhinav.kumar@linux.dev>, 
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
 linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
 Abel Vesa <abel.vesa@linaro.org>, Michael Walle <mwalle@kernel.org>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>
X-Mailer: b4 0.14.2

Currently, the platform driver core always calls of_clk_set_defaults()
before calling the driver probe() function. This will apply any
"assigned-clock-parents" and "assigned-clock-rates" specified in the device
tree. However, in some situations, these defaults cannot be safely applied
before the driver has performed some early initialization. Otherwise, the
clock operations might fail or the device could malfunction.

This is the case for the DP/DSI controller on some Qualcomm platforms. We
use assigned-clock-parents there to bind the DP/DSI link clocks to the PHY,
but this fails if the PHY is not already powered on. We often bypass this
problem because the boot firmware already sets up the correct clock parent,
but this is not always the case.

Michael had a somewhat related problem in the PVR driver recently [1],
where of_clk_set_defaults() needs to be called a second time from the PVR
driver (after the GPU has been powered on) to make the assigned-clock-rates
work correctly.

I propose adding a simple flag to the platform_driver struct that skips the
call to of_clk_set_defaults(). The platform driver can then call it later
after the necessary initialization was performed (in my case: after the PHY
was fully enabled for the first time).

There are also alternative solutions that I considered, but so far
I discarded them in favor of this simple one:

 - Avoid use of assigned-clock-parents: We could move the clocks from
   "assigned-clock-parents" to "clocks" and call clk_set_parent() manually
   from the driver. This is what we did for DSI on SM8750 (see commit
   80dd5911cbfd ("drm/msm/dsi: Add support for SM8750")).

   This is the most realistic alternative, but it has a few disadvantages:

    - We need additional boilerplate in the driver to assign all the clock
      parents, that would be normally hidden by of_clk_set_defaults().

    - We need to change the existing DT bindings for a number of platforms
      just to workaround this limitation in the Linux driver stack. The DT
      does not specify when to apply the assigned-clock-parents, so there
      is nothing wrong with the current hardware description.

 - Use clock subsystem CLK_OPS_PARENT_ENABLE flag: In theory, this would
   enable the new parent before we try to reparent to it. It does not work
   in this situation, because the clock subsystem does not have enough
   information to power on the PHY. Only the DP/DSI driver has.

 - Cache the new parent in the clock driver: We could try to workaround
   this problem in the clock driver, by delaying application of the new
   clock parent until the parent actually gets enabled. From the
   perspective of the clock subsystem, the clock would be already
   reparented. This would create an inconsistent state: What if the clock
   is already running off some other parent and we get a clk_set_rate()
   before the parent clock gets enabled? It would operate on the new
   parent, but the actual rate is still being derived from the old parent.

[1]: https://lore.kernel.org/r/20250716134717.4085567-3-mwalle@kernel.org/

Signed-off-by: Stephan Gerhold <stephan.gerhold@linaro.org>
---
Stephan Gerhold (2):
      driver core: platform: Add option to skip/delay applying clock defaults
      drm/msm: dp: Delay applying clock defaults until PHY is fully enabled

 drivers/base/platform.c             |  8 +++++---
 drivers/gpu/drm/msm/dp/dp_ctrl.c    | 10 ++++++++++
 drivers/gpu/drm/msm/dp/dp_display.c |  2 ++
 include/linux/platform_device.h     |  6 ++++++
 4 files changed, 23 insertions(+), 3 deletions(-)
---
base-commit: 8f5ae30d69d7543eee0d70083daf4de8fe15d585
change-id: 20250812-platform-delay-clk-defaults-44002859f5c5

Best regards,
-- 
Stephan Gerhold <stephan.gerhold@linaro.org>


