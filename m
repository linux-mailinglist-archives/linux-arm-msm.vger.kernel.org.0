Return-Path: <linux-arm-msm+bounces-37817-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C0E5A9C7778
	for <lists+linux-arm-msm@lfdr.de>; Wed, 13 Nov 2024 16:41:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8588C2816BC
	for <lists+linux-arm-msm@lfdr.de>; Wed, 13 Nov 2024 15:41:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E3B2216130C;
	Wed, 13 Nov 2024 15:39:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="Rzsn1zz8"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5914712BEBB
	for <linux-arm-msm@vger.kernel.org>; Wed, 13 Nov 2024 15:39:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731512369; cv=none; b=l5WHhL+1O8dMw31bu9WlYNAstrBoF1KqRdP8qZPFdVDZ09mEA+nVR/eXA4mKubqwLDMDHPQnSKG9hG9W9CZ7gGDRORANGSIFb6TeWHOClWD9WIKnBN5G4bnya+1hmgvIxaFFSgoqzawP8GRflYhavEhA1JoRAYE79i4HxkusWxM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731512369; c=relaxed/simple;
	bh=xAWJcl+eo8fDG63BX3szgOn6IaJOIPMK6Bb4yZDvNEY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=V337BnSznao+Inm+paOhv/63DVl/dL7JS/zj8BP0gd28liozNjoGEfaipSsEjJsjGLwFSo1Jwk6B/+ZifJHo3x+pF2fv6QIq7eG/+i4NRXwqnrt8a1hscDAP6Rl4oLO7Nrh9ekPpwkVsDBAZyZe0Z2fqVCAkNAHycCKXJp7pn8s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=Rzsn1zz8; arc=none smtp.client-ip=209.85.208.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-5cedf5fe237so8530089a12.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 13 Nov 2024 07:39:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1731512366; x=1732117166; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SJEl/Mmjz/g2W7QrHkYPcZb6PPJpxdKufP7Duu2dNVc=;
        b=Rzsn1zz8D7TT7QX9e9vkHZJOYM3ed/7eoQJjnRVfdvtagzRbeo4Bl8kZIkCcL/kK56
         uegoCuAFJegeYki9wUYf/Nl+m04rSqQGdXzCSudTarkvkdyLRSyPk2SjkpRx1YE3C7mk
         1z/1syFsZfV5iz3bLjvTISZmR1KhWK7XFU2bh/hRgDwXPcrs5mFZRFRExrLXsA1YIxaZ
         PuNmrINyVXifaPhYkfouoswKyJsVSaRz6wImhuAS3ReaqnpJQZ6A5yUl4pRIdC/0+od1
         waIaa05RA03H6haw29zChn9RF/eF17Ci3A5pyrbLHDNM6z6VzZ7ebcpJaR7d+6DFJpE9
         fwhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731512366; x=1732117166;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SJEl/Mmjz/g2W7QrHkYPcZb6PPJpxdKufP7Duu2dNVc=;
        b=q5RhHPpfb4VKh1CAtULBSIUf5fWQDcUOi9TYukj+B0B9QeyLtw/wDY7KIPn67Xu++l
         ed9ztnSkequTAg3v4NeBeUqCNYo/DVswlz7UWyq1Toj5M3v2WvWc7Hb5B58/J59J80x2
         RMWPc0vSb/r4gVQ3BqEGwn20rOOQOggkJKGJi5jWOtL7HnjDLawapDBIHk3Gsx0vTbG6
         mJhQmRLpMtm2vgG+DCwSgNid5nG7ybe+hSe0hgR1nwAyzdz7fWbGeGMa8hC8sowW6TjX
         dltLvzl7vJdA9O/nZtwCRBJIGj6PG+pzUw6ckJ1cE/wJGDPiXAJZhBfV/v5DvStjyDWr
         xnsg==
X-Forwarded-Encrypted: i=1; AJvYcCX36eQmnA5Cqc0yoebyP72UMtMq7vB4ECQxtb83r+sNKnsZxItSZZfdpTIZOH+avAzHxHGjGkj8Z36NIRGK@vger.kernel.org
X-Gm-Message-State: AOJu0YwNcYdCXm2+q/MFvbyIhQrjZh5MHuIZp1n575LF8fUP+1TuwMcr
	+1HXLZX6MkawqCx1fy/5LfMWMZBFVjOCJpdcEJDpKmXIfsD4Qm7fzfMm08tGv2A=
X-Google-Smtp-Source: AGHT+IEH31trENazh65pWh+DuCi9K649WDgplI3ecb3+way3WoWqkg3GJ5Qx7vBZEHweQ+aIMZ3bWg==
X-Received: by 2002:a17:907:7e8f:b0:a99:f887:ec09 with SMTP id a640c23a62f3a-a9eeff39e7amr2164151766b.35.1731512365541;
        Wed, 13 Nov 2024 07:39:25 -0800 (PST)
Received: from brgl-uxlite.home ([2a01:cb1d:dc:7e00:1b75:191:f7eb:da75])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a9ee0def8ecsm876882866b.152.2024.11.13.07.39.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Nov 2024 07:39:25 -0800 (PST)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Andi Shyti <andi.shyti@kernel.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	linux-arm-msm@vger.kernel.org,
	linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] i2c: qup: use generic device property accessors
Date: Wed, 13 Nov 2024 16:39:23 +0100
Message-ID: <173151232541.92239.8233789832026323394.b4-ty@linaro.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20241008160947.81045-1-brgl@bgdev.pl>
References: <20241008160947.81045-1-brgl@bgdev.pl>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>


On Tue, 08 Oct 2024 18:09:47 +0200, Bartosz Golaszewski wrote:
> There's no reason for this driver to use OF-specific property helpers.
> Drop the last one in favor of the generic variant and no longer include
> of.h.
> 
> 

Applied, to the GPIO tree as the maintainer has been unresposive for two
months and the change is trivial.

[1/1] i2c: qup: use generic device property accessors
      commit: 400913bd4edd76ef1775bfd95543846bd6f5ed71

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

