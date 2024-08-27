Return-Path: <linux-arm-msm+bounces-29678-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id BE67E9619D7
	for <lists+linux-arm-msm@lfdr.de>; Wed, 28 Aug 2024 00:04:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 438A31F23EBD
	for <lists+linux-arm-msm@lfdr.de>; Tue, 27 Aug 2024 22:04:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DFC1F158DD0;
	Tue, 27 Aug 2024 22:04:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="l7oR4XZJ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D7E515F3FB;
	Tue, 27 Aug 2024 22:04:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724796297; cv=none; b=BZKfwl5zISM3OeHH9RA39iBl0JBpp8RC+ibEPn77gQ+gU/R5fWIJTRtksytcJ1actgYRSgGvZT1pBNdlR2ZgzKchjGUPFn6nVshC7TmAxvCMa5XSamjaMqN30ksqQV7RyKZKIeQ44GlMkuHEOew0AXqmMeRArAuAPwMPiHPgL7g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724796297; c=relaxed/simple;
	bh=9rGkUgOufBi7Mzv+5uM4oeDmEyRh5mYHyw6X74RrwqA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=kwbM1l4m+ZcTc6cVyovnEYyXgwpqoaybQ9Zo/ZCEWvmFE+TSvJpQiUiRrNuw6pwmti+hNZtrV+7XKa34VoUFURES2Hbui/Et0LoLV0PrDvTMeV8ca6gZe1JGM4YHjWGpDhXQzs8JEo9fgTq9jcZJOYN2858iXuJdwi6gWHWZoEo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=l7oR4XZJ; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-42812945633so51395285e9.0;
        Tue, 27 Aug 2024 15:04:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1724796294; x=1725401094; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VZgyQZttbFN6Mpv5C6Zqi3PHF1KkrD2jrO7egIws/+I=;
        b=l7oR4XZJcfGSx7WJoHvuGB68QiDbZUi2H0rHm1e6b/eVaycenLHB5TGKy907n5AYm/
         aPKj4Lz7VwmNXNDbaF0rtZ+92cPPbzn8UImuSzmGGEIyF2cH5Rvqou+0bV75NGB3Pszk
         iCH3x4XaxPTyC3UQaXIA497WLyzh/yFGEP7hiVqIlnCKv5PsmBXMgQyGAcgm+l0kSx1l
         gLApTqNucWU302wLFmwS3yCneCYeOZNXWIoG1qQ/+r2Ma3RnqtyuaREZY/6ySRTmIDpp
         VJ0YR/ZnJnMQ352BpNvjiBN2roOpw504PKNlEUvDFWpJABeZe1mz7aVFvmNLcJpTBD7W
         xXTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724796294; x=1725401094;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VZgyQZttbFN6Mpv5C6Zqi3PHF1KkrD2jrO7egIws/+I=;
        b=VgCTZh5NkyDTkEBzu9Ov1/DsDN7PUD99GrsbFGPn7rru5lKNaxefEmitAHI1iISdj+
         5DOYk5iUjyv0orTcA2g9E45f/87x125P/fun/OJpAAaW1Ex0YzNtq+x05ZVf/CMReXhm
         sF40TNTruYC435I6s72aLJNuSw3wUcCh1VBpZGAVvKTF1uoZXdQu0mE3OH9VZJmFwuBi
         9H3qvFeLt/Hnee216UvyVYRWlFmt56F+1+ogp2qVJPxxUeQrgAWTs1D/tw/qRk26Z4OP
         2IvsIvF4Ik+smcVXedpo+7nisHJaNBZafN/fWckQgCDd9ezXQ1UvTxO7nIoa0tMQoC6u
         7xZw==
X-Forwarded-Encrypted: i=1; AJvYcCVUYVvuH9YrD2LoPBXH9OW1HeQ01T78IBoZanfWbCyvj9zlUwYo3qA3GoUcNFJw3ohJtsvIM0C7P71doh3i@vger.kernel.org, AJvYcCWZaqz6VePvuRNPwMmnd+Q2ZlJVzLYrE7vQcNZHhcq/OEJW9JexyEYyBeZXRL5dzdCp4V9blo7rddO1DHhW@vger.kernel.org
X-Gm-Message-State: AOJu0Yx0PhPtYnz86MhOR0YxwhNF82yPcjCmQPnFXAfxRsEbR8WzzbkQ
	0a9lsTJ1CfIk6xp62KVw2ajtDRVytScTvlyBTgV2MSGpfCuMxlWAKYtALvx9JNpg+nMjJxiIB1B
	RFC/yJSj7kuyDx6vpOVf/NKfeaLg=
X-Google-Smtp-Source: AGHT+IHWk+OQ6gg8FUjgV2v4vECfE0Fa9RJ/6lK2GykuDqzWb1DzW5pw5cVNOpUVhtAQtCWvfc0gKwWGbXHqNy0EXDs=
X-Received: by 2002:a05:6000:8d:b0:368:747c:5a04 with SMTP id
 ffacd0b85a97d-3731185ad48mr7748341f8f.25.1724796293984; Tue, 27 Aug 2024
 15:04:53 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240820070818.1124403-1-vignesh.raman@collabora.com>
In-Reply-To: <20240820070818.1124403-1-vignesh.raman@collabora.com>
From: Rob Clark <robdclark@gmail.com>
Date: Tue, 27 Aug 2024 15:04:42 -0700
Message-ID: <CAF6AEGu-T4=3jPRcnq3BFBtfb_yhmWE2b8EgxgTm5Q0bqSv04Q@mail.gmail.com>
Subject: Re: [PATCH v1] drm/ci: increase timeout for all jobs
To: Vignesh Raman <vignesh.raman@collabora.com>
Cc: dri-devel@lists.freedesktop.org, daniels@collabora.com, 
	helen.koike@collabora.com, airlied@gmail.com, daniel@ffwll.ch, 
	guilherme.gallo@collabora.com, sergi.blanch.torne@collabora.com, 
	deborah.brouwer@collabora.com, linux-mediatek@lists.infradead.org, 
	linux-amlogic@lists.infradead.org, linux-rockchip@lists.infradead.org, 
	amd-gfx@lists.freedesktop.org, linux-arm-msm@vger.kernel.org, 
	intel-gfx@lists.freedesktop.org, virtualization@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Aug 20, 2024 at 12:09=E2=80=AFAM Vignesh Raman
<vignesh.raman@collabora.com> wrote:
>
> Set the timeout of all drm-ci jobs to 1h30m since
> some jobs takes more than 1 hour to complete.
>
> Signed-off-by: Vignesh Raman <vignesh.raman@collabora.com>

Acked-by: Rob Clark <robdclark@gmail.com>

> ---
>  drivers/gpu/drm/ci/test.yml | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/ci/test.yml b/drivers/gpu/drm/ci/test.yml
> index b6f428cdaf94..09d8447840e9 100644
> --- a/drivers/gpu/drm/ci/test.yml
> +++ b/drivers/gpu/drm/ci/test.yml
> @@ -10,6 +10,7 @@
>  .lava-test:
>    extends:
>      - .test-rules
> +  timeout: "1h30m"
>    script:
>      # Note: Build dir (and thus install) may be dirty due to GIT_STRATEG=
Y
>      - rm -rf install
> @@ -71,6 +72,7 @@
>      - .baremetal-test-arm64
>      - .use-debian/baremetal_arm64_test
>      - .test-rules
> +  timeout: "1h30m"
>    variables:
>      FDO_CI_CONCURRENT: 10
>      HWCI_TEST_SCRIPT: "/install/igt_runner.sh"
> @@ -215,7 +217,6 @@ panfrost:rk3399:
>    extends:
>      - .lava-igt:x86_64
>    stage: i915
> -  timeout: "1h30m"
>    variables:
>      DRIVER_NAME: i915
>      DTB: ""
> @@ -414,6 +415,7 @@ panfrost:g12b:
>
>  virtio_gpu:none:
>    stage: software-driver
> +  timeout: "1h30m"
>    variables:
>      CROSVM_GALLIUM_DRIVER: llvmpipe
>      DRIVER_NAME: virtio_gpu
> @@ -436,6 +438,7 @@ virtio_gpu:none:
>
>  vkms:none:
>    stage: software-driver
> +  timeout: "1h30m"
>    variables:
>      DRIVER_NAME: vkms
>      GPU_VERSION: none
> --
> 2.43.0
>

