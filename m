Return-Path: <linux-arm-msm+bounces-2461-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id EFD9A7FD7DD
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 Nov 2023 14:22:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id EF2181C20C8E
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 Nov 2023 13:22:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1F2A3200C6;
	Wed, 29 Nov 2023 13:22:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fooishbar-org.20230601.gappssmtp.com header.i=@fooishbar-org.20230601.gappssmtp.com header.b="tZ0e393k"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ed1-x533.google.com (mail-ed1-x533.google.com [IPv6:2a00:1450:4864:20::533])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0D2C1A3
	for <linux-arm-msm@vger.kernel.org>; Wed, 29 Nov 2023 05:22:38 -0800 (PST)
Received: by mail-ed1-x533.google.com with SMTP id 4fb4d7f45d1cf-54bb9024378so2133765a12.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 29 Nov 2023 05:22:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fooishbar-org.20230601.gappssmtp.com; s=20230601; t=1701264156; x=1701868956; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=/VP3ii8qzlwzBFXOUvCIlM2ChKhNv0Z2flI0ZUJ06go=;
        b=tZ0e393k6tGqc7Kfw0mVPdohIqElSw69RXqLpX8IwWMLhdVRjk2+lGHUCDMdL35iVT
         VhEnZDDghUrA+ZSFTlGpI2xPDFPoqJVBUMnn6rt3QxyFWKUfq/Ujde27tTe9cffSaB85
         +yI1Sd5CdrOnyAReBZHQSjBrONOvCVCKMAtRKXSYfXEABpvbHhQfKFwMuYJfperB/X4a
         tLlggBN/LzPTJL/794bzw/k7dWpS12qPEUK2A+EQ2miVEPon3fjBQbiCgsYSWqcyMr4k
         uJSqvYRewfMuGhaPteitj06eDuPPfEoqwH2G9jBk7FwvrUac+HfMFVGdv1PMyeJkcE7+
         7OTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701264156; x=1701868956;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/VP3ii8qzlwzBFXOUvCIlM2ChKhNv0Z2flI0ZUJ06go=;
        b=SpVw00b9bY/eETnUcTbgkb+allSBRlvJ93lAKU6g4xHc++LHHJEx2VnJCkEdy/PYff
         uHDBOUq5wDTeekAx/QleD6eNxqwWhRZaUqIqjD+XZgKo9aaDu0macBHbTND9dBkc07sg
         /GMVc81fvqjPh5LBSrGZsYqCMc1yTMZ62BL1u8/Qa3B9m7+5QidevCRf9CAUKPb8eSGf
         5TATkxt3A7h8oPrUiNY9exIQNqh43ZlgQioApNQhwmIf+TNurP/B/Q4Viic3koV/U+Os
         kF1QSq6hmG7Wq6GCsXQIvvMYzNNryxAa1BFdPYmieuRsdu+Px1bs5mDy8KOkYJoxENQb
         zZMg==
X-Gm-Message-State: AOJu0YwCKSkrV/UVLLYqJGpkkGrjNyX+FqCuNTwKkIdy1BMf1ZG86WyM
	xk7EJkOfm8WrwTt5D7kHEZ7WHf9RdTfCWneBdd/G8w==
X-Google-Smtp-Source: AGHT+IESfQEmd7uikH5eYlpIkIXnzdfz7yOnSZr9KANdmLWdgeBrFVefxKHw37NvqQrsvZJsay74wE6WyTTIfjyDBNw=
X-Received: by 2002:a17:906:3f88:b0:a02:a2cc:66b8 with SMTP id
 b8-20020a1709063f8800b00a02a2cc66b8mr11788067ejj.14.1701264156218; Wed, 29
 Nov 2023 05:22:36 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20231129121841.253223-1-vignesh.raman@collabora.com> <20231129121841.253223-7-vignesh.raman@collabora.com>
In-Reply-To: <20231129121841.253223-7-vignesh.raman@collabora.com>
From: Daniel Stone <daniel@fooishbar.org>
Date: Wed, 29 Nov 2023 13:22:24 +0000
Message-ID: <CAPj87rPKywWa8KxTCeJQz4vvgTwhPzL+y4aCX9zxZDkkfrvsoQ@mail.gmail.com>
Subject: Re: [PATCH v6 06/10] drm: ci: mediatek: Set IGT_FORCE_DRIVER for mt8173
To: Vignesh Raman <vignesh.raman@collabora.com>
Cc: helen.koike@collabora.com, airlied@gmail.com, daniel@ffwll.ch, 
	daniels@collabora.com, emma@anholt.net, gustavo.padovan@collabora.com, 
	linux-arm-msm@vger.kernel.org, guilherme.gallo@collabora.com, 
	sergi.blanch.torne@collabora.com, linux-kernel@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, virtualization@lists.linux-foundation.org, 
	david.heidelberg@collabora.com, linux-mediatek@lists.infradead.org, 
	linux-rockchip@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"

Hi Vignesh,

On Wed, 29 Nov 2023 at 12:19, Vignesh Raman <vignesh.raman@collabora.com> wrote:
> Expected driver for mt8173 is "mediatek" and for mt8183
> it is "panfrost". Set IGT_FORCE_DRIVER to 'mediatek' as
> the expected driver for mt8173.

Actually, for mt8183 it's both. And for mt8173 it will probably be
mediatek+pvr pretty soon. Each of these SoCs (like most Arm devices)
have a separate display controller and GPU, with different drivers for
each. They'll run different tests with different xfails. So we should
figure out a way to support igt running for both devices on the one
system.

Cheers,
Daniel

