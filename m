Return-Path: <linux-arm-msm+bounces-25114-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 837B3925B2E
	for <lists+linux-arm-msm@lfdr.de>; Wed,  3 Jul 2024 13:05:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 04FF828765C
	for <lists+linux-arm-msm@lfdr.de>; Wed,  3 Jul 2024 11:05:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CAC63181BAE;
	Wed,  3 Jul 2024 10:54:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DlsVzwaB"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com [209.85.167.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0060C1741C5
	for <linux-arm-msm@vger.kernel.org>; Wed,  3 Jul 2024 10:54:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720004043; cv=none; b=UDLHNVvk9Lgd0Z2GBfFwvBNcYuEduJ3cuiVkiOkRmDWUKX4AkUcJSeAeGIMHAZE38CnmdY9UOTUTOXWhol03cwzdKKRnTczCow3h5J6aaGkmDr6MikevFFcQqTAePhvi6raoFx5B02EOCurycw2WjDennpYQJPcbtFUT/8GgJ3w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720004043; c=relaxed/simple;
	bh=91WqejSHR/XydRSh41id9TxMAoPMOEROcJqEHJtCL5g=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=Sy/HWxHmz6HueafY6byB5i0NbQh0u22C2EuE0O9uPL449/XoXPr+0/A4FVOio4wHK6b/6aKnWBJWfTdig/vWq1OQPv+6bMsi1DQ6rLVTOWrLw0Q0Kfp0A8usGIWoZE/fKK1kPT9OcyTscUUTTRvt9eAhF352Hu+hU4jiNi6X+1A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DlsVzwaB; arc=none smtp.client-ip=209.85.167.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-52cdfb69724so6418128e87.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 03 Jul 2024 03:54:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1720004040; x=1720608840; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=5gdBDjQ20XQ7SVw3EzrpDlQunPS7byq4AhzdM2NXok4=;
        b=DlsVzwaBg1lgTADOolRTUIMqYq26R5qIjuIIEbDt5BslR6lXQ1Ko5GpsLWySmAsDmF
         nkanof9bI2ePIEGiaCcCsxUbBIEmE79PE/qqIyyMipJx9/pNj6NosgMEIYTAKEviR53i
         ltsEqcs6IkeVTlDTNJjtfj+3X2goyzynL4OJ2LQaWMbnTA/OEc7AP9FBUD92LZshQ7wm
         ZLfKlYrZF8+VcLfAAadZtnwHZe4l4HrQgh+iFi5WppZScN+Lg0WxCS6Bnnq4u4XssHGK
         TwiJSOx2xzypwbhz/SF0jWzq2yvKP+OFar/OB1MrDb1uqh6WYXjXjs49x+G/RWmwDjHl
         rrpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720004040; x=1720608840;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5gdBDjQ20XQ7SVw3EzrpDlQunPS7byq4AhzdM2NXok4=;
        b=EzX1BxokFwBOBMS5EGKo2So3YPXADehqFDdsPxiBmNu7Fu9ljVzq2D7fKHjSd3xJmI
         euPojDuHZ3mkEyi97wCVBY30QO8g3AY4Nc9pZ+BNsJr5gemnMEDvdbUSvBWC/ffPt8Pg
         c1xa/l9vLmTOLHdy9RVKU9lQHliVLxZWHUIglgpth3HQSnR+tNKJhI0KncUFiMAMnu4D
         43GFJWETIfnwdA9AEgQdju9ABKoKw9+tOOvGczLdMwubdVcg9d2dglF6GOzOuBVlshaU
         gertgGQm65LGZbkXHaUNFQne9Y2TT8XPXZXMqhq53dmryPz0JXhce6d5UtM46K2GaW3h
         /tOA==
X-Gm-Message-State: AOJu0Yzq9RfwGQ2GfHRriZCgdzdnBjKIUeb20CZVWEcjcOkOxeNwJ+di
	Oqm5YodqZQDD+5xV88d/pReP4rl7uMIPLqTp9xjkaohf9SJZgo+X
X-Google-Smtp-Source: AGHT+IFGiNlyeKKdQUBUTifB2xNrGH9KZSWcWmEdTHbBn4ETRzKvqI6oL3Qj7y8wytAAyZ0Ucq21Zg==
X-Received: by 2002:a05:6512:3ba0:b0:52c:cb77:2b8 with SMTP id 2adb3069b0e04-52e8264e638mr7269721e87.5.1720004039874;
        Wed, 03 Jul 2024 03:53:59 -0700 (PDT)
Received: from [192.168.0.20] (cpc115152-dals23-2-0-cust532.20-2.cable.virginm.net. [86.12.82.21])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3675a0d9b1dsm15644879f8f.42.2024.07.03.03.53.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Jul 2024 03:53:59 -0700 (PDT)
From: Connor Abbott <cwabbott0@gmail.com>
Subject: [PATCH v2 0/3] drm/msm: Further expose UBWC tiling parameters
Date: Wed, 03 Jul 2024 11:53:46 +0100
Message-Id: <20240703-msm-tiling-config-v2-0-b9da29ab6608@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIALothWYC/22NywrCMBREf6XctZHk2lRw5X+ULmIe7YUmkaQEp
 eTfjQV3roYzMGd2yDaRzXDrdki2UKYYGuCpA72oMFtGpjEgx55fuWA+e7bRSmFmOgZHLaRDRCf
 NQ2hou2eyjl6Hc5waL5S3mN7HRRHf9mfDP7YiGGfKKDWowfYSL/fZK1rPOnqYaq0fd0Xh9rIAA
 AA=
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
 Marijn Suijten <marijn.suijten@somainline.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, Connor Abbott <cwabbott0@gmail.com>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1720004038; l=2937;
 i=cwabbott0@gmail.com; s=20240426; h=from:subject:message-id;
 bh=91WqejSHR/XydRSh41id9TxMAoPMOEROcJqEHJtCL5g=;
 b=XgIv/Bcd54kvT1aMJXwmAcyJTxMtum9ggy0m6tOwyV94Tp+5hgPWdCk/1CBGDLCRvWrm+q57P
 2Rwni/4A+5FAQfwmI0+8kDtvTVkdQ+QkP2hZdkpL1wxjYbqr8bdwrCE
X-Developer-Key: i=cwabbott0@gmail.com; a=ed25519;
 pk=dkpOeRSXLzVgqhy0Idr3nsBr4ranyERLMnoAgR4cHmY=

After testing, there are more parameters that we're programming which
affect how UBWC tiles are laid out in memory and therefore affect
the Mesa implementation of VK_EXT_host_image_copy [1], which includes a
CPU implementation of tiling and detiling images. In particular we have:

1. ubwc_mode, which is used to enable level 1 bank swizzling to go back
   to UBWC 1.0 when the implementation supports UBWC 2.0. a610 sets
   this.
2. macrotile_mode, which we previously left as default but according to
   downstream we shouldn't for a680.
3. level2_swizzling_dis, which according to downstream has to be set
   differently for a663.

I want as much as possible to avoid problems from people trying to
upstream Mesa/kernel support not knowing what they're doing and blindly
copying things, so let's make this very explicit that you must set the
correct parameters in the kernel and then make sure that Mesa always
gets the right parameters from the "source of truth" in the kernel by
adding two new UAPI parameters. The Mesa MR has already been updated to
use this if available.

A secondary goal is to make the adreno settings look more like the MDSS
settings, by combining ubwc_mode and level2_swizzling_dis into a single
ubwc_swizzle parameter that matches the MDSS one. This will help with
creating a single source of truth for all drivers later. The UAPI also
matches this, and it makes the Mesa tiling and detiling implementation
simpler/more straightforward.

For more information on what all these parameters mean, see the comments
I've added in the first commit and the giant comment in
src/freedreno/fdl/fd6_tiled_memcpy.c I've added in [1].

Testing of the Mesa MR both with and without this series is appreciated,
there are many different SoCs out there with different UBWC
configurations and I cannot test them all.

[1] https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/26578

Signed-off-by: Connor Abbott <cwabbott0@gmail.com>
---
Changes in v2:
- Move ubwc_config field descriptions to kerneldoc comments on the struct
- Link to v1: https://lore.kernel.org/r/20240702-msm-tiling-config-v1-0-adaa6a6e4523@gmail.com

---
Connor Abbott (3):
      drm/msm: Update a6xx register XML
      drm/msm: Expand UBWC config setting
      drm/msm: Expose expanded UBWC config uapi

 drivers/gpu/drm/msm/adreno/a5xx_gpu.c         |    4 +
 drivers/gpu/drm/msm/adreno/a6xx_gpu.c         |   34 +-
 drivers/gpu/drm/msm/adreno/adreno_gpu.c       |    6 +
 drivers/gpu/drm/msm/adreno/adreno_gpu.h       |   32 +-
 drivers/gpu/drm/msm/registers/adreno/a6xx.xml | 1617 ++++++++++++++++++++++++-
 include/uapi/drm/msm_drm.h                    |    2 +
 6 files changed, 1664 insertions(+), 31 deletions(-)
---
base-commit: 269b88cb92e62e52718cd44c07b7517265193157
change-id: 20240701-msm-tiling-config-c5f222f5db1c

Best regards,
-- 
Connor Abbott <cwabbott0@gmail.com>


