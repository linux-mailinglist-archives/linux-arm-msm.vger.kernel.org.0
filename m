Return-Path: <linux-arm-msm+bounces-24883-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CFBE923E3A
	for <lists+linux-arm-msm@lfdr.de>; Tue,  2 Jul 2024 14:57:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 4DD04B20EA9
	for <lists+linux-arm-msm@lfdr.de>; Tue,  2 Jul 2024 12:57:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DED6315DBAE;
	Tue,  2 Jul 2024 12:56:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KJ/1zvP1"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com [209.85.167.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2136E1448E1
	for <linux-arm-msm@vger.kernel.org>; Tue,  2 Jul 2024 12:56:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719925016; cv=none; b=DISerWGI+Tb1xZor5oNDAu2jvQrePZDN9QUWcViVrJltq9ObaoNXCMl6Utf31J1/fbd0cRSyD1EMLtpeomAc8WVqb1pVv9FNt1OyBlgLOLkFdXLXzYzGhJq/jNDJLQ5ofYTFF4c+c3x1EeEKsFrOnUxUiEq9Xro7dRZzFPZdhxg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719925016; c=relaxed/simple;
	bh=EoHtW0NOXouEkZEr4A06pqVHdFXl2lYVE5XaTb4In2w=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=Whv7+dkvF0OcuE7BsGERToXbxup0nxJwC3OckD85sY24OkU/ScYr6QKLMPHR+3G8ik4mV7puqwHI4A0DC6PQoQZfspWsoGuDfQptrZIJYmVD2b8EWb5ISEJeJUzyeDchfz0SKlksNL7jyXzDxqUG35/NXbc7ldc9xDyN0aG8mQY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KJ/1zvP1; arc=none smtp.client-ip=209.85.167.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-52cdd03d6aaso4711820e87.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 02 Jul 2024 05:56:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1719925013; x=1720529813; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=xgnbq3jUTcy/6MNLj2tPlk01abBu0Jq+t0cyqJTz5OU=;
        b=KJ/1zvP1QpbKBDob4PISRnKYrvkCqQK2XBbQGxpmr4oEdmtgkQDiDzs5KT/Hs1yxmB
         5bs95cBSby9yymJMm7/uKZUq1fGS4AWs7k78BF2vGyrJD2CU7cREAoMk23PeRYQ8ysF/
         L5MmVqNAJ4/BZ7Q+ohBf9qWXfrsGc1vPLzhKwv0Wdr1E6aXmfgdqRQlOcGNnfN1wntvR
         Rww5caWTNXVrYi9XsN5P6FtsYIGOjyaEfvlbYgIEnkjq1tmkBPSlONY3N4u0I1Pta217
         iO0WTlKZ1D/nSGRkndGY3nUWWOBbIFIPkb4st0V40yTd+xuW9bAGEwWN2uMBPYtdLIeF
         JpLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719925013; x=1720529813;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xgnbq3jUTcy/6MNLj2tPlk01abBu0Jq+t0cyqJTz5OU=;
        b=ALhQcrTWIX9zXiKIVHGXcA/9zfyoGkam9bbtSz6v3vMbCldzoY2ftknVnC6rdAzo59
         LkWYaat0a7++KBQbrpZ3Lbe85U2K2aA1UBYdMm6CpnRx7NNmzkm0/GHfwGXqIXyGO2+g
         Ihoi+assBZAecBJTCaSHRgNiqRoWJI0f+YU7l6yIXLAS3yMoGvsn8zIKJWyeyi2sdiY+
         U4HfB227hEU9SRQtSgK2wWvo39i20ESzqG94Lu1ek9KxrfVgYqXDbPsn+OWSAVMwspuf
         v80PfKOvpy+w7+PSDbUZrqKW1Jrh0UpLpzKYY0wSvIxUWPPcbDJ7/5gZUleA/biTrEye
         Escw==
X-Gm-Message-State: AOJu0YyOMinGsHvzmCfqbDdil2EQ8XKf1Ts3rg6XnV71CHPrGWP1TqUM
	IhdW4tTz2EhdtN20HpuH5dmJkb0zAYsRICQo9D0sKi5efOSdeeNw
X-Google-Smtp-Source: AGHT+IFdw2lJuMZsppZJcnSV+suq85WDLiqyPtRbsT6xf4mXjvpIyGLJEBiRIJAm5Ydwnpu6qubveg==
X-Received: by 2002:a05:6512:39d4:b0:52c:df99:6c62 with SMTP id 2adb3069b0e04-52e8266ede5mr6504980e87.28.1719925012920;
        Tue, 02 Jul 2024 05:56:52 -0700 (PDT)
Received: from [192.168.0.20] (cpc115152-dals23-2-0-cust532.20-2.cable.virginm.net. [86.12.82.21])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3675a0fc429sm13145533f8f.68.2024.07.02.05.56.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Jul 2024 05:56:52 -0700 (PDT)
From: Connor Abbott <cwabbott0@gmail.com>
Subject: [PATCH 0/3] drm/msm: Further expose UBWC tiling parameters
Date: Tue, 02 Jul 2024 13:56:29 +0100
Message-Id: <20240702-msm-tiling-config-v1-0-adaa6a6e4523@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAP74g2YC/x2MQQqAIBAAvyJ7TtClCPpKdChdayE1NCIQ/550G
 uYwUyBTYsowiQKJHs4cQxPdCTDHGnaSbJsDKuzVqLT02cubTw67NDE4bhgcIrrBbtpA665Ejt/
 /OS+1fl1YRfljAAAA
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
 Marijn Suijten <marijn.suijten@somainline.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, Connor Abbott <cwabbott0@gmail.com>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1719925011; l=2743;
 i=cwabbott0@gmail.com; s=20240426; h=from:subject:message-id;
 bh=EoHtW0NOXouEkZEr4A06pqVHdFXl2lYVE5XaTb4In2w=;
 b=hnsHTrc3i9/sGvm8IY1LIito3FiH4X3hjeHgzGPZrpCwnCKLAfC+OE7gD/IbqtxtJEZreHsJL
 ia4TLii52J6BtFIq0MSD9R4+Dsq8eiP1sQs/G36j7ZFkbiVCXTz/bPt
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
Connor Abbott (3):
      drm/msm: Update a6xx register XML
      drm/msm: Expand UBWC config setting
      drm/msm: Expose expanded UBWC config uapi

 drivers/gpu/drm/msm/adreno/a5xx_gpu.c         |    4 +
 drivers/gpu/drm/msm/adreno/a6xx_gpu.c         |   36 +-
 drivers/gpu/drm/msm/adreno/adreno_gpu.c       |    6 +
 drivers/gpu/drm/msm/adreno/adreno_gpu.h       |    3 +-
 drivers/gpu/drm/msm/registers/adreno/a6xx.xml | 1617 ++++++++++++++++++++++++-
 include/uapi/drm/msm_drm.h                    |    2 +
 6 files changed, 1644 insertions(+), 24 deletions(-)
---
base-commit: c39e6f4f08c40710c15a372f5a29de7b84f47fd9
change-id: 20240701-msm-tiling-config-c5f222f5db1c

Best regards,
-- 
Connor Abbott <cwabbott0@gmail.com>


