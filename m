Return-Path: <linux-arm-msm+bounces-11212-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A6B27856A9E
	for <lists+linux-arm-msm@lfdr.de>; Thu, 15 Feb 2024 18:10:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id ED3FBB29A38
	for <lists+linux-arm-msm@lfdr.de>; Thu, 15 Feb 2024 17:07:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4FB57133280;
	Thu, 15 Feb 2024 17:07:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FM4Frm6U"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 741C6136982
	for <linux-arm-msm@vger.kernel.org>; Thu, 15 Feb 2024 17:07:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708016829; cv=none; b=Vt2Hzsu6JxdSgAhdettYdjwKSTtzw49PcBNyzyMkhGzH1d4ZRZRntdgSCRjyAwNh2eAtFD33pm+XUOgjOkmpNer1hmfszE5BT5QsO9QbR+jz6V9a1an/EBty9YzgYzDlmkZWMETeFConzh/x4SkvasXluVQphqazq368ryvJHBQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708016829; c=relaxed/simple;
	bh=pFkEYjhRyiVvnWaKVrGsyu3fH7xh0jxPovSUEGQL6NE=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=ksntwMUagpGBdtOpD3nAuqwK44vnAv0HA11PCJIQZysGPmDaHsh727pYg1u9KiSZuGv4GQdy+BFPWauDYgE2pIKV/oKXeic5KrrP4RQgS1/K7g7O8dsPadkpQRPjWo78VBvUyfBfFD3NmJWC7CI7mcj+FEapsr2ZIY1XON7RRjk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FM4Frm6U; arc=none smtp.client-ip=209.85.208.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-562178003a1so1408070a12.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 15 Feb 2024 09:07:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1708016826; x=1708621626; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=NaFZCKNRyy9AI0T22Z2pSTOZSHkLFwL4nJxKMKuEj5w=;
        b=FM4Frm6UHfVtuu8IqIZFFJUY/2FIOoHNfhiMppx0Z1dm4wtW448/T7vsB94ilCdzU2
         +js0Rumwt0bwMtqJAHMiPKYVlSQfmGLM/78HSq+H54BSLf1pbIYAwCtsZR+gNaKr0snx
         HtmJblHMvjV17Mutpe9QdV7yM0aOg7Usu4GPeM5fgVgrXXqFPv8n1hN1yLofudg5oIvi
         W8rJh3w4YQzruAm6030VMqkATjc0IEAWLr5Jp0Xs9G5yPbiSdaRuZB9/dOKIYmFDXEhb
         OA9OM7xBtEncoaKs8bm6iez07CvMx7yxcAM75Rmxcw4C6DBxoKyEhArrhTf+6xAuj/VS
         eVsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708016826; x=1708621626;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=NaFZCKNRyy9AI0T22Z2pSTOZSHkLFwL4nJxKMKuEj5w=;
        b=gZfIwhvdBmdOUVTioSwv8bsQCysrkWGoqjYm8UZyP1HKXVn9z4HPiBI5d4j+QaGSob
         GPuANeOlf3MBkS9xEm9oG2WeRx1F3aHiZ3dveqyyC8AuUrwhfJwRekANBp6DFGi1Sb2u
         Zh8wnBzPP0LzOhE9erkUaarysFaueBfOyc45sdseYC9KEHsKybt4KtgjLWoOzZT29lzX
         zx2hdGnyBAuCRkMhImY06LTpaIwTsrWgQqZMICbuB85+lRCWhmaJqKHbyE0xDGopkF30
         PLs35RgdvsQpAnT/6iAyNMUu3Rv9iIa1iS8pXwyXuAklbiyMAUxEky8OGTURwmrnO2jZ
         ngVg==
X-Forwarded-Encrypted: i=1; AJvYcCWbJQOTzVze7Y3fQi3zhmsOeJloKvjYaAktTwJRFHH5pN8mxzdfqswQEqcGQUy0x0JHY34Y4ySv+y/6w+Xq8W5KucbcNl5e69l0ddrdAQ==
X-Gm-Message-State: AOJu0Yx7shUcfCH90T4k4LSUKfnkYZnZwRWoVF4t33WxiVvG9laZ44F1
	u9y2B/DQGmw71HvN31a16NSfIUzS+Ubr3Mt7jO9Lyv3vBDItL7iiFjACScFLHW/dUiXbbBnbLn5
	12LiRq6zSsfgnXwmO1wEgD9fQxOk=
X-Google-Smtp-Source: AGHT+IHQnssP+8eYTlr7x1l/6mWdxxayrT6Dpil17YQWLjvn/WEv95g6hveEQFy6V7FoCfJZi+1coBgfQdZsV9QNqNw=
X-Received: by 2002:a05:6402:268f:b0:563:cb4d:80a6 with SMTP id
 w15-20020a056402268f00b00563cb4d80a6mr1039139edd.16.1708016825489; Thu, 15
 Feb 2024 09:07:05 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: Rob Clark <robdclark@gmail.com>
Date: Thu, 15 Feb 2024 09:06:53 -0800
Message-ID: <CAF6AEGszDSiw66+a=ttBr-hat+zrcBtfc_cZ4LQqXu89DJ0UeQ@mail.gmail.com>
Subject: [pull] drm/msm: drm-msm-fixes-2024-02-15 for v6.8-rc5
To: Dave Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
Cc: dri-devel <dri-devel@lists.freedesktop.org>, 
	linux-arm-msm <linux-arm-msm@vger.kernel.org>, freedreno <freedreno@lists.freedesktop.org>, 
	Abhinav Kumar <quic_abhinavk@quicinc.com>, Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Content-Type: text/plain; charset="UTF-8"

Hi Dave,

Another fixes pull, this time actually including the GPU fixes left
out of last week's fixes due to miss-applied label, plus addition of a
tlb invalidation fix.  Description below.

The following changes since commit 8d35217149daa33358c284aca6a56d5ab92cfc6c:

  drm/msm/mdss: specify cfg bandwidth for SDM670 (2024-01-25 14:36:04 -0800)

are available in the Git repository at:

  https://gitlab.freedesktop.org/drm/msm.git tags/drm-msm-fixes-2024-02-15

for you to fetch changes up to 8c7bfd8262319fd3f127a5380f593ea76f1b88a2:

  drm/msm: Wire up tlb ops (2024-02-15 08:51:31 -0800)

----------------------------------------------------------------
Fixes for v6.8-rc5

GPU:
- dmabuf vmap fix
- a610 UBWC corruption fix (incorrect hbb)
- revert a commit that was making GPU recovery unreliable
- tlb invalidation fix

----------------------------------------------------------------
Dmitry Baryshkov (1):
      drm/msm/a6xx: set highest_bank_bit to 13 for a610

Rob Clark (3):
      drm/msm/gem: Fix double resv lock aquire
      Revert "drm/msm/gpu: Push gpu lock down past runpm"
      drm/msm: Wire up tlb ops

 drivers/gpu/drm/msm/adreno/a6xx_gpu.c |  2 +-
 drivers/gpu/drm/msm/msm_gem_prime.c   |  4 ++--
 drivers/gpu/drm/msm/msm_gpu.c         | 11 +++++------
 drivers/gpu/drm/msm/msm_iommu.c       | 32 +++++++++++++++++++++++++++++---
 drivers/gpu/drm/msm/msm_ringbuffer.c  |  7 +++++--
 5 files changed, 42 insertions(+), 14 deletions(-)

