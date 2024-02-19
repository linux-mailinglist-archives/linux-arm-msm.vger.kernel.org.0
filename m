Return-Path: <linux-arm-msm+bounces-11672-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id D3E4B85A360
	for <lists+linux-arm-msm@lfdr.de>; Mon, 19 Feb 2024 13:31:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8F0F3283910
	for <lists+linux-arm-msm@lfdr.de>; Mon, 19 Feb 2024 12:31:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DBFDD34CD3;
	Mon, 19 Feb 2024 12:30:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="E6cNGddu"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3397733CD3
	for <linux-arm-msm@vger.kernel.org>; Mon, 19 Feb 2024 12:30:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708345852; cv=none; b=HIQBJYD/3ZBqvPGuSO+RPhsGZ1WnUxbGb6Q4xQOh+YvWZyudnPkE9gUuhMXTqhnVyvWovtYF6oPboZerBccZuXNNCq8omZtusJR9FmBdHaRLKyQVoH/RQfhKQWMS02KI0e0fp2WayfcbAfoevzyWeOwNvGy/hW6eNLTu5lfM4GE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708345852; c=relaxed/simple;
	bh=lM5BoKA4jWos8sTMIF0nHqaP7SVakRXi/4s/lsIKnAQ=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=lUPK+XKMHSpzrAJDMLI81zaSn0XXz9csDKAYO1zG406CeH5cUBMX0i+OX++40InDT3tgQZmCK1QYFU5/Z7xqoOScwu+fAHBWfmXFXyOxonl20nuVZzboaQ62GquOducdDTH6mWKsTelV/115tImqTLHx4uRxrazAG7y5elSiRsw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=E6cNGddu; arc=none smtp.client-ip=209.85.167.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-512a65cd2c7so1983241e87.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 19 Feb 2024 04:30:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1708345849; x=1708950649; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rIWqlE1cPX165do3NEp9Vd40+qOG9WCTV6W/duazB5M=;
        b=E6cNGdduxE6TPYGdD4iVnfsYjyYM87Iogv5JmlWb8mklTqF0W9fduWLHIqQ7zdfkNn
         Ur0iVNEPRmGDeNhSVg2cOvdZuu2NMH9jLbqzpXYcBarkvje15JHppzjXh8E8BqXYyStk
         +JxpLGLFXLgbO9lvrA83jX53VPo2HCwrL7U0pDZJ9JU0oLjLWctDlAxkgcnRR0Rt0RCI
         8qRCxGhMvQLRboStPVBj7RZqHdAFuVc+yTWKP+f924C7AIBnORlboQiL3HD1MO72Hk0W
         igoHmOT4QunsJnkFys0Ug/lppIHeRo4s6aXJYK7DVJjweqILhdixhtvVTAIQdHIB3ZyQ
         +/Fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708345849; x=1708950649;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rIWqlE1cPX165do3NEp9Vd40+qOG9WCTV6W/duazB5M=;
        b=TVQenPfjfS2h6I7iP3cJzcj0BXeBzG5uXpcUpgjO9PGfIAsj5jR8fz45vrJVYHhoNc
         O5wumt7nu4P7N2kKmt4G+CUWYoFPGmwkkTNDfomM3S7lUDERGsPRFCHiKbvw6v21jmL7
         MGFQCii57BZUbbwxxDIt1W+6EZC+87XlU2fN6WhQfbaQ+dDwecwuucbXHjrtdBla42XW
         OugAwJt0J34aeX0/lv+ANLRfMt130+N1+VR2ZiDm4Db3SbPzSjuK00c0VMa5z+HamuA2
         si9ALEv4CAvjkX+ZbBwAWy5orLWhJ/bQ0tdhfck4Prh6+4LurMng0GgbNEgRYwKY9XDa
         r2sg==
X-Gm-Message-State: AOJu0YzzWU1Nfig/USR0D8DCt76irCZCIvQQWMfeL5BSvRBuztJisAc1
	tGIAwFMz+eQUwcZz4iTatijrTDepUvrL9+rc6ZAO8jn1+aGFMQ262AmugAdhsdc=
X-Google-Smtp-Source: AGHT+IFgAhvmZh5LxpfhxpuBO8bVNoLr52ZnhCi1bbOTANuMQKRN0YvmuCTEPJPwH7nXK+wPUAek/A==
X-Received: by 2002:a19:ee13:0:b0:512:aaf2:f2f7 with SMTP id g19-20020a19ee13000000b00512aaf2f2f7mr2579515lfb.23.1708345849425;
        Mon, 19 Feb 2024 04:30:49 -0800 (PST)
Received: from umbar.unikie.fi ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id i6-20020ac25226000000b00512bde4cddfsm90466lfl.148.2024.02.19.04.30.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Feb 2024 04:30:48 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>,
	Abhinav Kumar <quic_abhinavk@quicinc.com>,
	Sean Paul <sean@poorly.run>,
	Marijn Suijten <marijn.suijten@somainline.org>,
	David Airlie <airlied@gmail.com>,
	Daniel Vetter <daniel@ffwll.ch>,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: linux-arm-msm@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	freedreno@lists.freedesktop.org
Subject: Re: [PATCH v4 0/5] drm/msm/dpu: remove dpu_encoder_phys_ops::atomic_mode_set callback
Date: Mon, 19 Feb 2024 14:30:36 +0200
Message-Id: <170834569502.2610898.892456628815949762.b4-ty@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240208-fd_remove_phys_ops_atomic_mode_set-v4-0-caf5dcd125c0@linaro.org>
References: <20240208-fd_remove_phys_ops_atomic_mode_set-v4-0-caf5dcd125c0@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Thu, 08 Feb 2024 17:20:40 +0200, Dmitry Baryshkov wrote:
> The dpu_encoder_phys_ops::atomic_mode_set() callback is mostly
> redundant. Implementations only set the IRQ indices there. Move
> statically allocated IRQs to dpu_encoder_phys_*_init() and set
> dynamically allocated IRQs in the irq_enable() callback.
> 
> The writeback backend of the dpu_encoder is the only user of the
> dpu_encoder_phys_ops::atomic_check() callback. Move corresponding code
> to the DPU's drm_writeback_connector implementation (dpu_writeback.c)
> and drop corresponding callback code.
> 
> [...]

Applied, thanks!

[1/5] drm/msm/dpu: split irq_control into irq_enable and _disable
      https://gitlab.freedesktop.org/lumag/msm/-/commit/c6f60037bfa0
[2/5] drm/msm/dpu: split _dpu_encoder_resource_control_helper()
      https://gitlab.freedesktop.org/lumag/msm/-/commit/ca8c1fd3eed8
[3/5] drm/msm/dpu: drop dpu_encoder_phys_ops.atomic_mode_set
      https://gitlab.freedesktop.org/lumag/msm/-/commit/d13f638c9b88
[4/5] drm/msm/dpu: move writeback's atomic_check to dpu_writeback.c
      https://gitlab.freedesktop.org/lumag/msm/-/commit/71174f362d67
[5/5] drm/msm/dpu: drop dpu_encoder_phys_ops::atomic_check()
      https://gitlab.freedesktop.org/lumag/msm/-/commit/b0b621f41b45

Best regards,
-- 
Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

