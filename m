Return-Path: <linux-arm-msm+bounces-40132-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 901209E2983
	for <lists+linux-arm-msm@lfdr.de>; Tue,  3 Dec 2024 18:40:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 665251649C3
	for <lists+linux-arm-msm@lfdr.de>; Tue,  3 Dec 2024 17:40:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 45D051FAC51;
	Tue,  3 Dec 2024 17:40:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JI0RWdkD"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com [209.85.167.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9CCAD1FAC49
	for <linux-arm-msm@vger.kernel.org>; Tue,  3 Dec 2024 17:40:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733247618; cv=none; b=Lhwqoesx1OH9ggcUCLXoWK04qTu9RJi3z6EU3UFwwgN5cV2M8TDw06m2F0YRZKMdsUvg0ABHLw1X6Uvj8s3AR5XE8uk7rb+/iVqytUBnFsziFAu9UlPDuNCAR7WVDrWOZG6RYWibO7r5tD07cX1e7bTuqTmdb/Nq/S6ux4ASD/s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733247618; c=relaxed/simple;
	bh=+51oj5AgIRYRYQcUGyIYOUavQkDe2vdQhkQyM0F7Ess=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Kf1JV0oGMg1tWlkfqJNRFICvVI763j3XkOj1mCwI96U9BE2b+PoZRt9v+gcxue4v4O73CeEglSw0p6bU6RxBt+mSLPyT16lIiIkfUSHb5xJtNohgMKA2i/jT/Bv3/UMc4HpYlNX81kAoVKbQ8Vq6WfGJKszq244uhYDqMIF4OiU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JI0RWdkD; arc=none smtp.client-ip=209.85.167.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-53dde5262fdso6783435e87.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 03 Dec 2024 09:40:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1733247615; x=1733852415; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=o45TGeBjwffMHzroCW3wP027izyDAOnE5VUTAs6kvFc=;
        b=JI0RWdkDl497pts9102hBuVPgZU8ZKkPQShLYHpzeUvBM2yWSbOdhyKHh23sUDoBr3
         lnqVX8yHq5igRBW0+GjuplKgs54zU2l0E3PQDxpT46qsuTltSWh0T+xTaCqiznT+o/zq
         pUCWUJNl8ivGyQVcpuTrOnsxWdzh3c+JbAeFpYPLeulgaMy8f2LM5Eih+662z7Y8aNOZ
         Vb7wgR/Ft8EHoMHAS7Zu9FzDq/Z7K7sbTDLAUoMZp0tMSHqz7XYrERObO5ve1YB33Lzh
         L8OEOkxGZDh/e4JO1VYSJc12mkJ7F0fXEXywTIP0OBCGEV/zlGAaWA2O+xBdRAN4CTPy
         1ffw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733247615; x=1733852415;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=o45TGeBjwffMHzroCW3wP027izyDAOnE5VUTAs6kvFc=;
        b=UiPvBZgpBjlco8QlNJn6Hi5QA5hy1ZPWxqpFkyVrJcpzoMfPJYmbUeY8RMsqMYSs08
         YfGvaCTCkhmSK96vp5T3aothyPqrshq7HKJ+rZSsiIILY5O07lLbPsWp7IYo34f8iUrh
         ifidcWngDwL2kujE6O/CGc1HYLkQdNIbDiJEZaAA9excr0ufJ0533qoS9/EQyIcWARhG
         g8cBmvZPDVtOFgZZ0Kc+nVr5BvWtGamwOkZdQwj+rx3CxIuvrc4x93gw2h0Xtv4ZZjVH
         aG+BVRWCj5M4vta9gUlPit1NyF1oFpGOENrz1k/T0B0GPxIKuYNXZ7j4V/tbbF6AwiTr
         L06Q==
X-Gm-Message-State: AOJu0YzEvXfJ9AfLLRvOYqQdfpgpxSxs9I7vDPxZ+G86ufpMci/WZnGw
	WGE/mHfhEVzRxXcFqkBIL0lkqueSeQ4KN6OPt6/RXbP2XWQnPuo/FPO7Z0QL
X-Gm-Gg: ASbGncsf/vwxvi58HjQdbVd8fwl9HN8QbG5nvUqjflRK1v0IohDCSvzX4zFU9/RTqVZ
	JuE0GxFBlwGeOuQKKXZiuroNx0eKQTvLyQe05+EAKTHf1Z5zf4+W4XNjjKfaPs5O6aLQCS4UGLk
	wwW/BtmTf2fAydYqN57tBVuG1s/H/ahGibSLv1l2kgWq9w4ggmF5KzcrcJFmKX2pmu+cP3csyc8
	HYuPjLygWhtpvw47GwrRjuIx85zRikjeewLPujKTdfC4Pg/qdwZ0B6Xd1eYCwRiKYDqXg==
X-Google-Smtp-Source: AGHT+IHyfyc9zXaTnCOmMl6VbehAO96siV58POqRcngPBtFnWCrliNbdFWBpVUngW+czn7b1hA2Hyw==
X-Received: by 2002:a05:6512:10d6:b0:53d:cd25:4a61 with SMTP id 2adb3069b0e04-53e12a22fd7mr2111831e87.42.1733247613145;
        Tue, 03 Dec 2024 09:40:13 -0800 (PST)
Received: from archlinux.tail7f7b1.ts.net ([195.136.68.87])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-53df644aab7sm1912115e87.106.2024.12.03.09.40.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Dec 2024 09:40:12 -0800 (PST)
From: Danylo Piliaiev <danylo.piliaiev@gmail.com>
X-Google-Original-From: Danylo Piliaiev <dpiliaiev@igalia.com>
To: Rob Clark <robdclark@gmail.com>,
	Sean Paul <sean@poorly.run>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Abhinav Kumar <quic_abhinavk@quicinc.com>,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
	Marijn Suijten <marijn.suijten@somainline.org>
Cc: linux-arm-msm@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	freedreno@lists.freedesktop.org,
	danylo.piliaiev@gmail.com
Subject: [PATCH v2 0/1] Expose UCHE_TRAP_BASE value via uapi
Date: Tue,  3 Dec 2024 18:40:10 +0100
Message-ID: <20241203174011.731980-1-dpiliaiev@igalia.com>
X-Mailer: git-send-email 2.46.2
In-Reply-To: <20241203095920.505018-1-dpiliaiev@igalia.com>
References: <20241203095920.505018-1-dpiliaiev@igalia.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Depends on https://patchwork.freedesktop.org/series/141667/

The parameter would be used in [1] to implement VK_KHR_shader_clock
and GL_ARB_shader_clock. On at least a6xx+, shader could read 64b
ALWAYSON counter from UCHE_TRAP_BASE+0 address.

Downstream driver exposes uche trap base via uapi only on A7XX+.
However, from testing, we could get correct shader clock on A6XX.
The uche trap base value is not used by Mesa for A4XX and A5XX.

[1] https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/29860

Danylo Piliaiev (1):
  drm/msm: Expose uche trap base via uapi

 drivers/gpu/drm/msm/adreno/a4xx_gpu.c   |  6 ++++--
 drivers/gpu/drm/msm/adreno/a5xx_gpu.c   | 10 ++++++----
 drivers/gpu/drm/msm/adreno/a6xx_gpu.c   | 12 +++++++-----
 drivers/gpu/drm/msm/adreno/adreno_gpu.c |  5 +++++
 drivers/gpu/drm/msm/adreno/adreno_gpu.h |  2 ++
 include/uapi/drm/msm_drm.h              |  1 +
 6 files changed, 25 insertions(+), 11 deletions(-)

-- 
2.46.2


