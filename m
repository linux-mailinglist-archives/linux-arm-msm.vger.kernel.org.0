Return-Path: <linux-arm-msm+bounces-48734-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id DD264A3E0CC
	for <lists+linux-arm-msm@lfdr.de>; Thu, 20 Feb 2025 17:31:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 48E24188C68A
	for <lists+linux-arm-msm@lfdr.de>; Thu, 20 Feb 2025 16:29:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 98F80200BA8;
	Thu, 20 Feb 2025 16:29:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="zYgSBQeO"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB4611FECD0
	for <linux-arm-msm@vger.kernel.org>; Thu, 20 Feb 2025 16:29:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740068964; cv=none; b=kBcsXY0Yc2PvZPa4t70UJCIh2Gi3Hch0DnReNgNHBLdyQzl4H7sRw1jD7SCDjcSSc3tLI4tx6Dc9zgwl9WVOGKPWokFLuWXuWfCHQ+mGUJouJg/9Kk0CSuIajPzKWmBW4I8Jfs3uOvjxt2f8ynO8w1lRUdZL2w6ssm1mk2Py3K8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740068964; c=relaxed/simple;
	bh=zT+KI4WcFHKjsYVAFKapOCUJXXn7d1Fjj9NRnfss8wQ=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=K+i/O74lcdlI6kKiJvd1aQSyh0SXiyjBMUJbnYIKNAkLLBPI75gO8APjQuHNwZESjiV82Oxj0KGM0yEvZXT7Gnx3oTirnkYSvQvNtE2QcGChqyvyLXAPo5i9Hw6PF/Oa1UsTHlUKlQBEpvR8dmz9MUgbmfxrnRYzUsDE7AlI6t4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=zYgSBQeO; arc=none smtp.client-ip=209.85.221.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-38f403edb4eso668422f8f.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 20 Feb 2025 08:29:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1740068961; x=1740673761; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=bZKdzzhd6qiS30Fu8KqeF6do85NZpqdplWUIHWAq4YQ=;
        b=zYgSBQeOD6kC4CdHqhSobbv1M5PMIUhV+M9EKLzOmuXAoBegv4nu5B0VvVxrATsY+W
         mT8gU8d85ZdthO+gjJwk4SmmVMBJAENznnbNQzvolCNtdvn3UkEKrbJQr5Q4Ao4yuFGC
         neJUAJBbBTAegOlHDU5wI9HGKEyILUMg024Pr+mxj7M8QFhjIiKpsnERKhg5oEp4b+m1
         fQxONc9Cjzbl3O6PYelav18u31lqFmYTg5qV/7G/ectE3B5SPUr9K8vap5WM2l7ldLnR
         R9MQQiUeX+RmY4vfUdKlBlWdh0fhRnzuqYu7Ao5SyNOBGERgI/MmljBza6DokiTy4G8V
         SV3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740068961; x=1740673761;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bZKdzzhd6qiS30Fu8KqeF6do85NZpqdplWUIHWAq4YQ=;
        b=KyRTWwOvgl6MoAT9YYj+v2nDKSPXtAexiJO8UvFjN+5M3aZUUqNu0L4LYLye2CpQaf
         qfFDtMIYXFdvu2zV7MervaUjleq/gjZnvZMacketdGwe3GfhNuGCR4VeW80O5H5b696s
         coFkzIWc8tt4Ago6aQk8ZjQpt+phz4oqomg4jJATvw6ijDGBqQwUxuhKDSafSD0aYUzY
         JHzvnazVOo2PlI7kdJyjnMCqcCjdT+HdAVzEyOQlEJX3wjjjx3cP8tB2l4UUrBYgQujd
         ROqjMo9Ghk+7fCvntqO9erW/2ddva8w58lsnhgV48WZCodp74zNtyPj7+pMLidmHwvtd
         vURw==
X-Forwarded-Encrypted: i=1; AJvYcCXZsojHvknyieApnUHCMwTzynPbpp+WAyKzW8KqY8/Y9rl9kwtMUF8FNaspSYpf4tEiuU50Zv4nc9Uy06hY@vger.kernel.org
X-Gm-Message-State: AOJu0Yxi53WtCcb3qtAl7JfbrJ/tBUczA8dZKVLwSX5cM2WqlqP+c3mf
	VvS8G3jfdTfxgXTV+bbs5ZxV/WkS/zF3fRVXXvoa33HX1yiFNgs10A8OcVsl3PY=
X-Gm-Gg: ASbGncv82T9aPs7lIscxabVybrePWDQl0PXiC9oUzHo9FuWAaFct+I0L74ol8e++LT9
	jaiE0crJ38ftMPtK9vKcP46kTHtBewsHPH0q6oMtj95PIc8/RkUpjibVJzeI8w11XF0VjxrCPid
	l91xvC6kp9enzN8y0VR6GavGqiiVy1PfMNSA5XygtEE2FqlEeiqYlPP1+g7tEacxsv8OWTPhSZ+
	n9y5i2QEpYRoL8kDr4YgwlVz2tDiwJmjg1K5HRS9lKk5KbD6I1Zbskm6jvrXeTZd9cINdlQzrMl
	gMtRW/OFgf5I1FhkIjpK6PfYmyScJciaAt/4oN5d
X-Google-Smtp-Source: AGHT+IH2gjQh7JBQ8ejAnR21ptNUN/KQFBPj5kyJgCsQVyb/b2MhEDxyhW0FhxZk7ZUcbhlqfOowSQ==
X-Received: by 2002:a5d:6402:0:b0:38f:2f0e:980c with SMTP id ffacd0b85a97d-38f33f57c13mr14497953f8f.47.1740068961049;
        Thu, 20 Feb 2025 08:29:21 -0800 (PST)
Received: from localhost.localdomain ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38f258f5fabsm20813753f8f.45.2025.02.20.08.29.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Feb 2025 08:29:20 -0800 (PST)
From: srinivas.kandagatla@linaro.org
To: broonie@kernel.org
Cc: perex@perex.cz,
	tiwai@suse.com,
	krzysztof.kozlowski@linaro.org,
	linux-sound@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	dmitry.baryshkov@linaro.org,
	johan+linaro@kernel.org,
	Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Subject: [PATCH v2 0/5] ASoC: q6apm: fix under runs and fragment sizes
Date: Thu, 20 Feb 2025 16:28:42 +0000
Message-Id: <20250220162847.11994-1-srinivas.kandagatla@linaro.org>
X-Mailer: git-send-email 2.39.5
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>

On Qualcomm Audioreach setup, some of the audio artifacts are seen in
both recording and playback. These patches fix issues by
1. Adjusting the fragment size that dsp can service.
2. schedule available playback buffers in time for dsp to not hit under runs 
3. remove some of the manual calculations done to get hardware pointer.

With these patches, am able to see Audio quality improvements.

Any testing would be appreciated.

thanks,
Srini

Changes since v1:
	- added new patches to fix the fragment size, pointer
	  calculations
	- updated to schedule only available buffers.

Srinivas Kandagatla (4):
  ASoC: q6apm-dai: schedule all available frames to avoid dsp under-runs
  ASoC: q6apm: add q6apm_get_hw_pointer helper
  ASoC: q6apm-dai: make use of q6apm_get_hw_pointer
  ASoC: qdsp6: q6apm-dai: set correct period size
  ASoC: q6apm-dai: remove redundant hw_constraints setup

 sound/soc/qcom/qdsp6/q6apm-dai.c | 94 +++++++++++++-------------------
 sound/soc/qcom/qdsp6/q6apm.c     | 18 +++++-
 sound/soc/qcom/qdsp6/q6apm.h     |  3 +
 3 files changed, 57 insertions(+), 58 deletions(-)

-- 
2.39.5


