Return-Path: <linux-arm-msm+bounces-42769-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C4FEC9F76A4
	for <lists+linux-arm-msm@lfdr.de>; Thu, 19 Dec 2024 09:03:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 7977316100F
	for <lists+linux-arm-msm@lfdr.de>; Thu, 19 Dec 2024 08:03:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8A17021770F;
	Thu, 19 Dec 2024 08:03:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="rewZj2S2"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com [209.85.167.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1720217704
	for <linux-arm-msm@vger.kernel.org>; Thu, 19 Dec 2024 08:03:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734595410; cv=none; b=NSvOS4cacGTxMGlZx04J/CYnSG5BuJIirsPeryIAT6s0eLiks6EfWLpf4+72LBJ82js3s0ctSkAteQF7ZFT3oemK9YmDemK7kGAXCe0vPNxWqfA7GYAa9FkvxnOgAGtSEcCYZarYfZ77vUaamfCaQ5fPMQiFi4t6OHy/xNrCflA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734595410; c=relaxed/simple;
	bh=RgfHuGBXae1glgZFL17pBAgm97fYyxc7BJ/AXvBFTbQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=twgko4oqfMCUe4pDNUZlqTpBzehMNzR0lXPZRDW7X2GMjLL6M6PSaVy1NohWKPeO8sTN1jyMnz2dOpwICtX2QrQCSWCqC4MynASPUJXenlAahC6bVLc3Hke8m1WQu0g6AgzZt586pQvltW21vx0muAijeFUXruDanInlQqjNMsA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=rewZj2S2; arc=none smtp.client-ip=209.85.167.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-5401bd6ccadso390231e87.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 19 Dec 2024 00:03:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1734595407; x=1735200207; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ugXH4+JF66LMJJim+wfATXqMioH1c19K+Z5j5LyswP8=;
        b=rewZj2S23Phbx3yQbySaophrcoFibtPIkoIGaxH9Zss0wWMUbXgWPYNh+8e4t9Ob5M
         cvvEp3KkR22ssL660ugwOGEuEO11WNcbAQKBaGKFEtdWMwTxgRT3DmJyGOxOiAXksffn
         C5cTjSBLnwWewgjstpyiJMJ7/F6+ToG8aUt+Jo/bNlzI4wylvi+0S6XOy+tELV/Gzz3P
         uhihXyo3T96T0/kzmUr4obyKAUcLvJKrZvVm4UEbhAYLAkup8lsj4EgWSoSAo0onDMCh
         N+wY+SBhuCj8wk3/dx8MINyeR4qyh6+jZ4zbTrfjJ3ufp3cDRGYwnqQYkbyrMz2x+wBf
         MZQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734595407; x=1735200207;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ugXH4+JF66LMJJim+wfATXqMioH1c19K+Z5j5LyswP8=;
        b=ULNHglh4jubXv3LYNHYasMzhRT6J5TPSJbooc13NpKmm/SIxM5btTTS/WxoIfPMeqe
         x2AWHrh5uByqgWqzO8OFZkIaTJlIfRrGXcmM6vb5fFKKIOtHDh0IbLXmcFPqhzTjCcqx
         G7IIkFLA0h5y43Ta30UvCPfGmas+DoAF3BfdHFChePSZ9eqK8baQI7CYB1QZErZc8zjo
         JrAVCJYE/Dyhm/9qNJmaBErGVwFdFvY+9fXhcD3CuTY+x7I8wlxuTcqpg2LIGUeV/TqQ
         ip9zBRjwrhY3Fw9H7n7BkfQ7TeuNP9MdEq8mnOvZUaQ7MRyXd0lKCXSLMD4qi+EKozYC
         lKmw==
X-Forwarded-Encrypted: i=1; AJvYcCVSba49t3hCWCMuTqmmTpITA4YWaISSzEoVX+jv8XYcuvvKdXwiAkqPSJRYW7QJfM3ZTwbz0LScyzr4v/uC@vger.kernel.org
X-Gm-Message-State: AOJu0Yzub6/PmMcFn9AfHxZE/6KlztC063u65wp1E9ZcNRft0AWszZbQ
	qfFR8q/YnzoKPjVFwi62J+JfIjE/DP7M5eDholCYIdcpShRHIXmBdqZJpichhVmix2I9xV0npnE
	MwLk5mfasl07LC76B227vNQYdEQaK4MQPir00iVevRF83alra
X-Gm-Gg: ASbGncsVZThJDOsJ0FkyRdzP1QfyNhC2jO03VLG7Drxj84NMI1SJ5+pBrbWViPG2jqd
	nuI0IB4NCAdDX4CqwCPhWJBD/4RZpMdwdlv9ZiHT+ES50rR/r0gyriLQlq6C069Q6GvdsDQ==
X-Google-Smtp-Source: AGHT+IFRKO+emIlNQZoyNcMhoAfze1VoczKB32ps+HArJ9oMB44xWoJtMbeHURhGT7AmeGiL5tKkxwjtS5FU/ZOAuic=
X-Received: by 2002:a05:6512:33cf:b0:540:20f5:be77 with SMTP id
 2adb3069b0e04-54220fd29f2mr699782e87.3.1734595406555; Thu, 19 Dec 2024
 00:03:26 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241218-crypto-qce-sha-fix-clang-cleanup-error-v1-1-7e6c6dcca345@kernel.org>
In-Reply-To: <20241218-crypto-qce-sha-fix-clang-cleanup-error-v1-1-7e6c6dcca345@kernel.org>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Thu, 19 Dec 2024 09:03:15 +0100
Message-ID: <CAMRc=Md19mjs3J+RKTGg--bC+G6yFk5J00wCMohqtt2_O0k=9Q@mail.gmail.com>
Subject: Re: [PATCH] crypto: qce - revert "use __free() for a buffer that's
 always freed"
To: Nathan Chancellor <nathan@kernel.org>
Cc: Thara Gopinath <thara.gopinath@gmail.com>, Herbert Xu <herbert@gondor.apana.org.au>, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>, Neil Armstrong <neil.armstrong@linaro.org>, 
	linux-crypto@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev, patches@lists.linux.dev, 
	Linux Kernel Functional Testing <lkft@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Dec 18, 2024 at 9:13=E2=80=AFPM Nathan Chancellor <nathan@kernel.or=
g> wrote:
>
> Commit ce8fd0500b74 ("crypto: qce - use __free() for a buffer that's
> always freed") introduced a buggy use of __free(), which clang
> rightfully points out:
>
>   drivers/crypto/qce/sha.c:365:3: error: cannot jump from this goto state=
ment to its label
>     365 |                 goto err_free_ahash;
>         |                 ^
>   drivers/crypto/qce/sha.c:373:6: note: jump bypasses initialization of v=
ariable with __attribute__((cleanup))
>     373 |         u8 *buf __free(kfree) =3D kzalloc(keylen + QCE_MAX_ALIG=
N_SIZE,
>         |             ^
>
> Jumping over a variable declared with the cleanup attribute does not
> prevent the cleanup function from running; instead, the cleanup function
> is called with an uninitialized value.
>
> Moving the declaration back to the top function with __free() and a NULL
> initialization would resolve the bug but that is really not much
> different from the original code. Since the function is so simple and
> there is no functional reason to use __free() here, just revert the
> original change to resolve the issue.
>
> Fixes: ce8fd0500b74 ("crypto: qce - use __free() for a buffer that's alwa=
ys freed")
> Reported-by: Linux Kernel Functional Testing <lkft@linaro.org>
> Closes: https://lore.kernel.org/CA+G9fYtpAwXa5mUQ5O7vDLK2xN4t-kJoxgUe1ZFR=
T=3DAGqmLSRA@mail.gmail.com/
> Signed-off-by: Nathan Chancellor <nathan@kernel.org>
> ---

Yeah, that was probably overkill but I thought it makes sense if I'm
reworking the driver anyway.

Feel free to kill it.

Acked-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

