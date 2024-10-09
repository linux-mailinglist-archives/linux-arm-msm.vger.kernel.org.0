Return-Path: <linux-arm-msm+bounces-33617-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A4F15995FEE
	for <lists+linux-arm-msm@lfdr.de>; Wed,  9 Oct 2024 08:39:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 10E66B212A1
	for <lists+linux-arm-msm@lfdr.de>; Wed,  9 Oct 2024 06:39:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2B24F136341;
	Wed,  9 Oct 2024 06:39:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="mu2UqHSD"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F72740849
	for <linux-arm-msm@vger.kernel.org>; Wed,  9 Oct 2024 06:39:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728455967; cv=none; b=bRk/Tak93qZ/dK8tUFuTAmtF8DFKigREv+5hNZ+NG22TGw4MJjf6fI8KCckIKsUzUq5uv7j3e8VyLDLVop+uFAsb64mcjKr55fuKcXsAKSLl3+KIF2AUTvhi9KAiIsG2HlAwo6m6WJgTl93kB0Dlrm+DnAP/+J5LcH9S/epiRZg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728455967; c=relaxed/simple;
	bh=SCHjFQIsdR1TnrGkWnIJtwSLbGJzA/1R84z2bftBMLs=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=mSZ8QwBWJ3755A++0CL37KL+e59C78JLSQeRybXCVg6Niwv41XnexD8ZAkWfbnhBd0wFYsikO5dkoYB7fV7M+rddHZ0psqEEhsUMl6C06OzS+F6UXCIQIRTVw0UAd2Vu6uDSbnJ1IXWiNsTMaqeBbkSnlEpLhh8oW23hna6ZnKM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=mu2UqHSD; arc=none smtp.client-ip=209.85.210.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-pf1-f174.google.com with SMTP id d2e1a72fcca58-71df7632055so3652385b3a.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 08 Oct 2024 23:39:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1728455965; x=1729060765; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=PrrPIemNfkhENWcftefzia6KqrGXwnglRYTMtDKqEiM=;
        b=mu2UqHSDMrw6Gs2kYDKY4SSkjwykOyxNWrrvYfDGGYVlvmVEW8pHGZ5GaNyC2AbBoc
         0Vr27ttOek7wuODKJ/uQFNFqzshUaFOXq8g8gomeydf5fr7md9UWyNmHxfcbC+6J8Hcl
         lXIaOXIHT61RhoMUk7pX77bFbFw5OlPJpcQaDPMc50JMp8o9nEhJWVmRWtD3ZLq8FYXI
         6ulIvNYN6AHIHVbOBfW67hr00ru4VNc0AXJO5T4U9L09/AQsC2AQTIsgkPX+3khZ7M2A
         4J1+zTh4IJsK9XVu485jWlrhKCpfBob1qaLp1siRReKrKznNmj3IAEUCfMETVrZKkWVT
         rWqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728455965; x=1729060765;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PrrPIemNfkhENWcftefzia6KqrGXwnglRYTMtDKqEiM=;
        b=bPxkCVdjIwlu62sMFBf9SLQbHGSb7+bGe4LhDNZrAJ9yDvU7nNDxf3Pozalxsjoq8R
         tMTnYeEq5JxoKV05u0/bbgHf1scBYIhdpiwwSy3os6BSVozO3t8BesirObsexE/0GZ3N
         TOAyS/BkDra5TRNQ75IgFvO2L/LyZbERqVXGs/f79I19HgKgq6+72DiwUlLyt+Z2DO/1
         l4tjyGNpT8DwaHAPyVgv+1nMFcuhpCLKexR14uKJaxkIB3drwKvffL4Sj8M5nTHO8LJQ
         0UWuQ6I0PwifdR4/vyyY4eBhE3sy6Hi3thXlef5siVhqJch10SaaOuvJhMZGPs7bLmpD
         kJeg==
X-Gm-Message-State: AOJu0YxVmI8mteD2puvL+tWokVb5TIG0EfS8Y76jzehAkWNcz9eoMeuk
	FKj6/pyhUENZHtdWgZKmZ2iIX+7byst5K5HpEUvuawBVeer/22pqB/nHD/2+nQE=
X-Google-Smtp-Source: AGHT+IGBfTNGbev/m+8IxDePf8DpPM9r2qpGbcQIw0raY8KgA6eNQUqQG4EvltrCwsXM7gWXCsUt4w==
X-Received: by 2002:a05:6a00:17a7:b0:714:2069:d90e with SMTP id d2e1a72fcca58-71e1dbcf4cdmr2006826b3a.26.1728455964787;
        Tue, 08 Oct 2024 23:39:24 -0700 (PDT)
Received: from [127.0.1.1] ([112.65.12.217])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-71df0d7d209sm7077396b3a.208.2024.10.08.23.39.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Oct 2024 23:39:24 -0700 (PDT)
From: Jun Nie <jun.nie@linaro.org>
Subject: [PATCH 0/2] drm/msm/dpu: Support different number of DSC
Date: Wed, 09 Oct 2024 14:38:41 +0800
Message-Id: <20241009-sm8650-v6-11-hmd-pocf-mdss-quad-upstream-20-v1-0-139511076a9f@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAPEkBmcC/x3NQQ6CMBBG4auQWfsnU8RKvYpx0dBBuijUDhATw
 t1tXH6b9w5SKVGUHs1BRfaocZkrzKWhYfLzWxBDNbXcdobZQVNvb4zdwhhMKSAvw4gUVPHZfMC
 WdS3iE1qG6+QuV2cd945qMRcZ4/d/e77O8wfc5mMVfQAAAA==
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Jun Nie <jun.nie@linaro.org>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1728455958; l=983;
 i=jun.nie@linaro.org; s=20240403; h=from:subject:message-id;
 bh=SCHjFQIsdR1TnrGkWnIJtwSLbGJzA/1R84z2bftBMLs=;
 b=paM/lwN/b8w8+thx4R5FIkzdnLqhpd0r7l/R9H63EDwsjBlXSEOcTI6++wUc1xuL+02xnlbIL
 PpD+gZ/dO9qAf/qpxuISXRSijfXtsDDjZd0SxXWWzkPe34V8D64Aa0r
X-Developer-Key: i=jun.nie@linaro.org; a=ed25519;
 pk=MNiBt/faLPvo+iJoP1hodyY2x6ozVXL8QMptmsKg3cc=

If DSC is enabled, the only case is with 2 DSC engines so far. And
DSC in all pipes are configured by default.

More usage case will be added, such as 4 DSC in 4:4:2 topoplogy.
Pipe number is extended in future to support quad-pipe. But only
some of 4 pipes are used in non quad-pipe. So number of DSC is
not aligned with maximum pipes.

Thus we support DSC flexiblely with this patch set with storing
the number and configuring DSC with it.

Signed-off-by: Jun Nie <jun.nie@linaro.org>
---
Jun Nie (2):
      drm/msm/dpu: Do not fix number of DSC
      drm/msm/dpu: configure DSC per number in use

 drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.h    |  2 ++
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c | 18 +++++++++++-------
 2 files changed, 13 insertions(+), 7 deletions(-)
---
base-commit: 6fc951e4d05d152cfc3c4442cc4e304c927dbf5e
change-id: 20241009-sm8650-v6-11-hmd-pocf-mdss-quad-upstream-20-94e7e3969089

Best regards,
-- 
Jun Nie <jun.nie@linaro.org>


