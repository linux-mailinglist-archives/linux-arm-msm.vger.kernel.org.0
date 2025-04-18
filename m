Return-Path: <linux-arm-msm+bounces-54769-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C247A93CE1
	for <lists+linux-arm-msm@lfdr.de>; Fri, 18 Apr 2025 20:35:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 404DB1B65141
	for <lists+linux-arm-msm@lfdr.de>; Fri, 18 Apr 2025 18:35:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 453C2227B88;
	Fri, 18 Apr 2025 18:34:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="U6s/4g4+"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3B66215F48;
	Fri, 18 Apr 2025 18:34:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745001284; cv=none; b=jiX9Os9rj2G0NmezKyvijtBi4nRkhDyNpbhFKJ2F0tfUPbwe9xQiWoCARTV3ZOmX4t9TCkIA1pCwriG6IeFQg3JrFjVLuiEX6JaCvE6nErxAwP0tkjsvEnxux/WBGH8OuR4OfhruYIwpvcLdAk1o64VeIV+hu2m08cF5+aYznaY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745001284; c=relaxed/simple;
	bh=GEL5hwj4ZcKmQgInqqPjANGqLqKJKFxTEKIu2C+lufU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Z5VQ6eNkh8Du/Jn5JCUUzpaj3cxWEyCTq6D9dd9WzHvdiFigLzgySZV1yDfH7Zw7WXEfl4rTW0V0OVzhswxJZylKFvV7ux9YKAcUPIXjbY0ErUrkAFHQDAI2+r+qK+3imO7NlnKeYPl7AekcPlumyNKB7lgzeMqgQKq2qujN3NM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=U6s/4g4+; arc=none smtp.client-ip=209.85.214.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-22c336fcdaaso23706115ad.3;
        Fri, 18 Apr 2025 11:34:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745001282; x=1745606082; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GEL5hwj4ZcKmQgInqqPjANGqLqKJKFxTEKIu2C+lufU=;
        b=U6s/4g4+OAhScfCPQVSkzf5GFYCy/K00wCXYO6NAyVRvYF++yX4obR8cU7nujjjT+4
         bDlHiQgD/05x8BLqqKSUPoQMg06qAqbwyAP45QGSU9BIk5jVxaVWcePtEN2C8LFgrlL+
         tyvyzUvBkTMcto1EIY9fXHIOSjRIubsBnC1tcMH+a40jHEGf/ZoNbefatodtsZuM47Cr
         lTVBbWX9cFwZdgzFkt6wR8qhA+kQCjRY7kWs2s4F29vyJh6WDBi4wDYQaPKHqugS5uvq
         3Yno6Nu27mYJzBnomeZr8qLGuB+YH12qPyUbEhDrE06vZVXjONutfsKdoBc+au8ZLIbg
         u87g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745001282; x=1745606082;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GEL5hwj4ZcKmQgInqqPjANGqLqKJKFxTEKIu2C+lufU=;
        b=nVzbG4031Fvs2RI4yr1Sbo3RO5sUsszYPSehF/0H98ZlXQ80AOL6g55Uqvf2FDs8uc
         xO7UezIiAAwmc7OCWoDwhGdHOZIM4wheP0SFKsfJB9U8ieXLZlgiy1uT9lPMwi9Hoyoc
         jjTz3WRCePJe4v5+eRuNynu663okd2Y7yCEyyLRtCE5ExPVoZFj3kAeOWhi4vENwtnoH
         km737XOuimpatgBAWWT9rPjvLsjW+e2oO+xXctDmyGQXbR5YIGRY6InqnPEtfhEmWwML
         /dexrptLT3Gbq3IDGbrP7xXogsUhLF632D5O5m9Kd7WOufkkSn6DRLszVZ8CdFt6Xsx+
         cIrg==
X-Forwarded-Encrypted: i=1; AJvYcCUmHGFzEc9cuBRvHGXSH4dqAcuLJ9jJGtlNs0Xs+4l/cWhUduZVY23JcPNoqyE/TZuStoGkDxfGSA7EiJ+/@vger.kernel.org, AJvYcCXunhfd9RWmDaLNSJIMoQlR+WI+Hfy5FaPKd+1dHTsWSbhcIDETpdq3X5GBKAewDNOAy60jQOn/9vcmJIAd@vger.kernel.org
X-Gm-Message-State: AOJu0YyT/gOk+wzzJdwlZjuicrz+GtY2Xy/V7XT5WdvqXtwNeWFenuVB
	84LIbpmOyaCjtZtZ3MwwhV8/dx6DwVPxljnJdeG5oCKJSg7uGDuJ
X-Gm-Gg: ASbGncsO+Izojz+KM1TPU1Y5Js+8pijMVFAcvEZg0aF6AHVWaExJFIs3OX2zKUDPNYJ
	4Dx7WqU4Rydw1F4IAh+0j0dAX7X5u24zx+Qur7WVrmMaf2oANh5Va9sfL+RYdoGd4XC5ZLgX/t/
	7wP3q156Q9d7QEZYqWmBaJwJ0MCWMRH7OWvs24NmPu7wECwAsixJ9TrbWLZalNhrvFfVTRLraE7
	8OVK01q/w+KEmMlDRE7qwbXE4zw4KVPvSMxmTL60SLt6Gx+JFfSPzdahErA0b0TxfR1xz1hHXNB
	FWC2I6TjtC2CDBaq3jSpJiYt9peGM4iWQ8Q4hh8=
X-Google-Smtp-Source: AGHT+IGAg/lnXCq2oW7mJKwA03rXOp9bjmqxNymxHwT8OBsAUwilnAGzFjMlghfXVPNRrh8L2LFXNg==
X-Received: by 2002:a17:90b:1f8c:b0:2ff:5ed8:83d0 with SMTP id 98e67ed59e1d1-3087bb631d7mr5824623a91.16.1745001281749;
        Fri, 18 Apr 2025 11:34:41 -0700 (PDT)
Received: from nuvole.. ([144.202.86.13])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3087dee325bsm1774222a91.9.2025.04.18.11.34.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Apr 2025 11:34:41 -0700 (PDT)
From: Pengyu Luo <mitltlatltl@gmail.com>
To: jun.nie@linaro.org
Cc: airlied@gmail.com,
	dmitry.baryshkov@linaro.org,
	dri-devel@lists.freedesktop.org,
	freedreno@lists.freedesktop.org,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	marijn.suijten@somainline.org,
	quic_abhinavk@quicinc.com,
	quic_jesszhan@quicinc.com,
	robdclark@gmail.com,
	sean@poorly.run,
	simona@ffwll.ch
Subject: Re: [PATCH v8 00/15] drm/msm/dpu: Support quad pipe with dual-DSI
Date: Sat, 19 Apr 2025 02:32:36 +0800
Message-ID: <20250418183236.209236-1-mitltlatltl@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250303-sm8650-v6-14-hmd-deckard-mdss-quad-upstream-oldbootwrapper-36-prep-v8-0-eb5df105c807@linaro.org>
References: <20250303-sm8650-v6-14-hmd-deckard-mdss-quad-upstream-oldbootwrapper-36-prep-v8-0-eb5df105c807@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Mon, 03 Mar 2025 23:14:29 +0800 Jun Nie <jun.nie@linaro.org> wrote:
> 2 or more SSPPs and dual-DSI interface are need for super wide panel.
> And 4 DSC are preferred for power optimal in this case due to width
> limitation of SSPP and MDP clock rate constrain. This patch set
> extends number of pipes to 4 and revise related mixer blending logic
> to support quad pipe. All these changes depends on the virtual plane
> feature to split a super wide drm plane horizontally into 2 or more sub
> clip. Thus DMA of multiple SSPPs can share the effort of fetching the
> whole drm plane.
>
> The first pipe pair co-work with the first mixer pair to cover the left
> half of screen and 2nd pair of pipes and mixers are for the right half
> of screen. If a plane is only for the right half of screen, only one
> or two of pipes in the 2nd pipe pair are valid, and no SSPP or mixer is
> assinged for invalid pipe.
>
> For those panel that does not require quad-pipe, only 1 or 2 pipes in
> the 1st pipe pair will be used. There is no concept of right half of
> screen.
>
> For legacy non virtual plane mode, the first 1 or 2 pipes are used for
> the single SSPP and its multi-rect mode.
>
> To test bonded DSI on SM8650, the 5 patches for active-CTL improvement
> are needed:
> https://gitlab.freedesktop.org/lumag/msm/-/commits/dpu-4k?ref_type=heads
>

[...]

> base-commit: b44251a8c179381b9f3ed3aa49be04fe1d516903

Hi, Jun. The display of my sm8650 device requires 4:4:2(lm, dsc, intf)
topology, I want to test this series, these patches can't be applied to
the latest linux-next tree, and I can't find the commit id in linux-next
or msm-next. Where can I fetch the tree?

Best wishes,
Pengyu

