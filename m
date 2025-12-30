Return-Path: <linux-arm-msm+bounces-87000-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 753FFCEA1FD
	for <lists+linux-arm-msm@lfdr.de>; Tue, 30 Dec 2025 17:03:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id F09813043906
	for <lists+linux-arm-msm@lfdr.de>; Tue, 30 Dec 2025 16:02:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2B4C631B111;
	Tue, 30 Dec 2025 16:02:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel-dk.20230601.gappssmtp.com header.i=@kernel-dk.20230601.gappssmtp.com header.b="b7QAS6hG"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ot1-f52.google.com (mail-ot1-f52.google.com [209.85.210.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23454246768
	for <linux-arm-msm@vger.kernel.org>; Tue, 30 Dec 2025 16:02:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767110570; cv=none; b=VVppaQT/yPEqJGoPXMYcghywmDRxFYfVE7z/UM2DV5SenGmRLTq4sdBH0y9GWXF5NEb0JehVSP9Lkwd0Mw6/cag2DVjgmBgsavXrK7Wz5AO+KwwPkB3PVonP+00Dq7GDVbrjx9EH4Qi3JW+hD1KD9BdUnvlpOZtBiM0krrsOe+A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767110570; c=relaxed/simple;
	bh=Xw6TO8h/kPeXMQ21igMPIJ59SDwm8QLsSUoqZglBoBQ=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=kYhurJS4WXYCg/av+WFK+YZU23PQNh1BjctruhNdQhzGfQkQw+M1k2gOSRS2Ic4nQpcTy1FlcJ1aKw8PTZbcFrUCcQQlDlAv256saHqmYi2m5QA3uMwWgaw9buBdR0plcRM9zsydrtuMN3DRGTHp5YyJ/a2zQtCLwP/tTgbcXjU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk; spf=pass smtp.mailfrom=kernel.dk; dkim=pass (2048-bit key) header.d=kernel-dk.20230601.gappssmtp.com header.i=@kernel-dk.20230601.gappssmtp.com header.b=b7QAS6hG; arc=none smtp.client-ip=209.85.210.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.dk
Received: by mail-ot1-f52.google.com with SMTP id 46e09a7af769-7cae2330765so7036689a34.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 30 Dec 2025 08:02:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20230601.gappssmtp.com; s=20230601; t=1767110566; x=1767715366; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3nF06fY/Z52Z+Clk0d49datcv/n2O+xADnW0BhLtR+Y=;
        b=b7QAS6hGt1E+4PrcvzKWxJObxgYMQcL++KNOYRNZFRtLafNDM/BDZSfpqNtuUylYwW
         54nfXWqiMPdT9zAUo0DOVcbtR8HpWrIDOX9t/MLP1vt9AHjaIsPoPYmWBcYMNq20VlxP
         FQXBtQrZwN5rqnPZZ6heWT3lm5ndYeCG2mVUUf5Bx7sTA2TIj/v2/ptJ6dHiNZ+4Ch//
         vMHkhnwijbZqTv3sNgT9IeHp5FoXaO/TM/KwgiHDnbOgO3nBEEqJ0JpQuxrD/l8tYHat
         TwauFfxqPlUC8HQoVNug4CNQLBG+Wo/kGnQ4zaQtPcu/YHSvCGOD4t9S97TLRDB1SOvx
         izLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767110566; x=1767715366;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=3nF06fY/Z52Z+Clk0d49datcv/n2O+xADnW0BhLtR+Y=;
        b=Bj92mLle/bOLTS6HrV37DkbTP3YirZoqcAqXW+QU64IKo1LOW/9EpQ7uP4XTFkluZs
         Rni/WNpZ34SU1h2AYLen3Kgpl6/IjfrajRxu2aheaZUUsW21AQTQe+uszEXvF5u0XsuK
         7gkKkDzMJ8HGOUUIWDR/Rgo8FRyMRWlKykbgl2jgkpe93hZ1Pqjvn15lrDTaMfRezR2u
         1XgvSIJ/QTu2D3JzCOUWD2awv9MVx4KB9wbRw1OwQTZsHkt81yMsmG+aBoQatjHwZReU
         qJJTEBKx6hvy++FHW1WP0+KE4E8XoyUlFQEnHmgtHAI2/wHIVnBUcx6sHXA1zCq24wLZ
         Z23g==
X-Gm-Message-State: AOJu0YykiYQPXE3vTKHaqx8T9ZBJ0i0uvm5p7sGScaiYtJRQ7pSm4GTq
	LO3WVEc9vSWiZVOtWd6eUUEmcpQLGyBS5e4UE8GVsqGsRCLS/2N7J/B+bdiX0TKjW3ecCk0QdNa
	NSRwe
X-Gm-Gg: AY/fxX7B57GcytA6Efo0D+dGWsQmz6s33Ll6AXQGSlIhza+pCsK9PdPMjt+pTVKb1c9
	ZhGLPmBX6gbJL+z55XqN8uEF50eKoNTnb946ssNCjoCi4embiUy9cTvdPBFjPk6MbC27tjbeYVK
	7j2b7Tl8dwCZxzjHyP4JXwl8K5e4IJyorQI8/ThOopXsIkI3+mdi67Hz3+Lt3ksI6g1P13qOpm6
	Gc2dwPX/GveW3xlD56VR+DpcsN4FAe/0mZwk4Qcc8JndI0OIvL3i585gzCsyf5yyPXp7s7V+e1p
	vAy53oGv8XpCA5Ha3Es9ncJbgHFkEL8REGUbCbakIhxJoSD+22IjTpR9rQHo5jhd6F1A4qh06US
	E9q53EOVkG6NmEumtFuKV/D9uIOuFg9h5KYidefaAnMGCxpXqDZ0mDjWZo8Q7CMj4qo5rZkjHQH
	2MeFI=
X-Google-Smtp-Source: AGHT+IH0zzRE7zHifu5tv1rtpqUc/VKQnCmbhseAtXuWESK7KrUpxUmRxMQzTAEpNlHJkixRota+lQ==
X-Received: by 2002:a05:6808:1205:b0:450:b249:71bb with SMTP id 5614622812f47-457a292c5bdmr16339873b6e.19.1767110566337;
        Tue, 30 Dec 2025 08:02:46 -0800 (PST)
Received: from [127.0.0.1] ([198.8.77.157])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-457b3f1761csm15918931b6e.22.2025.12.30.08.02.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Dec 2025 08:02:45 -0800 (PST)
From: Jens Axboe <axboe@kernel.dk>
To: Cong Zhang <cong.zhang@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-block@vger.kernel.org, 
 linux-kernel@vger.kernel.org
In-Reply-To: <20251230-blk_mq_no_ctx_checking-v1-1-2168131383e6@oss.qualcomm.com>
References: <20251230-blk_mq_no_ctx_checking-v1-1-2168131383e6@oss.qualcomm.com>
Subject: Re: [PATCH] blk-mq: skip CPU offline notify on unmapped hctx
Message-Id: <176711056497.410043.6155561525733424852.b4-ty@kernel.dk>
Date: Tue, 30 Dec 2025 09:02:44 -0700
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.3


On Tue, 30 Dec 2025 17:17:05 +0800, Cong Zhang wrote:
> If an hctx has no software ctx mapped, blk_mq_map_swqueue() never
> allocates tags and leaves hctx->tags NULL. The CPU hotplug offline
> notifier can still run for that hctx, return early since hctx cannot
> hold any requests.
> 
> 

Applied, thanks!

[1/1] blk-mq: skip CPU offline notify on unmapped hctx
      commit: 10845a105bbcb030647a729f1716c2309da71d33

Best regards,
-- 
Jens Axboe




