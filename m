Return-Path: <linux-arm-msm+bounces-77379-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id AE5AFBDE61F
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Oct 2025 14:04:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 2455B19A7CDA
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Oct 2025 12:04:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 460202D7810;
	Wed, 15 Oct 2025 12:04:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fooishbar.org header.i=@fooishbar.org header.b="gbHinxms"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-qk1-f178.google.com (mail-qk1-f178.google.com [209.85.222.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 655CE17A2EA
	for <linux-arm-msm@vger.kernel.org>; Wed, 15 Oct 2025 12:04:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760529848; cv=none; b=ZEYKZQTylvUmeC1OotRZ683dmohE/LxLPq446C21K/tc9x7Rw9FEqnmNMftQLagAeDPNmNAHJ/KoIMnS/EA1RT9sELIJawvAjgJYekRyj4Ui/CAxu/RhwpNZQLSg1enWcb46c76Vhscx947FxHczYreZu77icOnl1IWiwwwavYw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760529848; c=relaxed/simple;
	bh=cYYrig6PV1TMFUpvdrC38s6x3cKU7TXE8XEtRmDi518=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=o13n6G4uNHEKdflv3aibJwlQ8OI0cKEKnrc9ir0Ay75tXW6g2ebjWI2aBp1DK+dtgKAljz7T+aLO2qvwn3l988vhY6itwzkrZL/mctFV5jqdIitG6LW2LShpW5iE1N5ijrBCOzkQ2GBy/ocx7f3am/u1qlM402rfehzWe0205OU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=fooishbar.org; spf=pass smtp.mailfrom=fooishbar.org; dkim=pass (2048-bit key) header.d=fooishbar.org header.i=@fooishbar.org header.b=gbHinxms; arc=none smtp.client-ip=209.85.222.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=fooishbar.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fooishbar.org
Received: by mail-qk1-f178.google.com with SMTP id af79cd13be357-88e371e3cbfso95176085a.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 15 Oct 2025 05:04:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fooishbar.org; s=google; t=1760529845; x=1761134645; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=X3tSr4HAvbS0zz40z1XcCEFjgrGlF3qXMnfs2AVWb3Y=;
        b=gbHinxms3waUS1kvo/4o42nFi5wR5zATAEeFcTdXakPaO2JmB3AEw04uJ7vkNJcEPa
         sU+kXRoxb8GKeD4muJSOKxC5VPywpgosH0tjG0Ayy3I8ehYimALfavjCaVh/IMmNLgUG
         J880YDrd8s8Xt8yFm93mOQ99BtA3EFoOyz6CQkMRARWDnnJ7oSQ5Hunodj6UVuXfyY9p
         g4+viF4NKNsqdxnmWI1sG539HetY1GY28q864trXmjWyrG3VJyIO8xDvBtGbIVYf9Le5
         yYLLbKf2O/yTXzFHoBlT25kKCdHSTDGouLNz05teZHKCrmyzi1T5VAf9+AIEAqg2GhHS
         w9SA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760529845; x=1761134645;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=X3tSr4HAvbS0zz40z1XcCEFjgrGlF3qXMnfs2AVWb3Y=;
        b=CRclN46zPQdLUePVkCA01g4trGAMg6vrxHA7K0gFAkTjKsK73nlsD/a183qcF1pO8f
         xtBjCRK47ps8a9+6h5I2tSqLgVdBzRn/pacPw9oIwEUOysKHTZ2R14EtWmPXPgKukZqD
         eHAfAs7iMtI0P0s/6ic5djokaumb4igk0ipxWlnQ22S2rd2nHp/3TuR1PlOdnZ+TGLLW
         hzUFRlTFQuee1ePn4vczi39dbPOy4s9uRGNOgtRDgX+0BhT5lVaPvq7yqMcdqq718Qer
         /5uzzUoNE0tgqAKptc5Ef+mMjRPvAKqvaD5GE4EKEOy1Sj+aU/JQcBM5x0YJWqVB/wUB
         bqSQ==
X-Forwarded-Encrypted: i=1; AJvYcCWUcxDxLJEZDqvT2XT7DpSmj8jnqp1EGM1p5hvJMYFe6XVpsXjyKaxJ7jyqvbnznNDqkdkii1mrJbnUAFlU@vger.kernel.org
X-Gm-Message-State: AOJu0YzgOpei9pX/JPN7y5xdaWw5XzK9sxrONXBJsSIOODEhJuy3m73L
	g1YzldHf7UKSU74dPSF8TsmaDWtMjweE9zMzMwRE3uDNhQarBgaotS8pI6wFSRodCAUZ/U84mYl
	MeQt+RGthNsdW0EAZ52+zBmNYGmU3ASoD7Wl07hXZPw==
X-Gm-Gg: ASbGncu75ogSJaNew+Zy8LlYxL5NOXqy2tKhVBFC4qhsvn98jW/bkkyPogiGwOtrklr
	sM9T3r8QuIocTuYobzMgNLF06iaf7GBMRgDF7AtGnz++QbQb/P3aAxMzb5C4INV0RRho6Yx0bCA
	yAgYkeOr8HA8EHZ8XFl79fZgJ8r5d3RGYRGdEJoDAm8INqAB7riQPYTCEdeFR816BSYkc7DRRUI
	M+TUDDuU8h5mP8cnNlpBAaNlnK4RMXGBg==
X-Google-Smtp-Source: AGHT+IHqCTndsaW9mNNOpEoxqpK+g671TVftkJwHJncfJRnISWrovh6jkW0GrLsJk4LzlYEdY/SfnIetRnQxqll+9N8=
X-Received: by 2002:a05:620a:d89:b0:859:7e5d:efb0 with SMTP id
 af79cd13be357-883521dbdb5mr3978297485a.43.1760529845105; Wed, 15 Oct 2025
 05:04:05 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250718105407.32878-1-vignesh.raman@collabora.com>
In-Reply-To: <20250718105407.32878-1-vignesh.raman@collabora.com>
From: Daniel Stone <daniel@fooishbar.org>
Date: Wed, 15 Oct 2025 13:03:53 +0100
X-Gm-Features: AS18NWCXawAF8rrUemNB4cY6pOyINS36FA1C_QZssu58BBI9i4GnKsHpaQ9lquo
Message-ID: <CAPj87rMRKdm4BvfD8gMmSF3jjeMK4nurzTKPOFY15V0tBr4pyw@mail.gmail.com>
Subject: Re: [PATCH v1 0/7] drm/ci: add new jobs, uprev IGT and mesa
To: Vignesh Raman <vignesh.raman@collabora.com>
Cc: dri-devel@lists.freedesktop.org, daniels@collabora.com, 
	helen.fornazier@gmail.com, airlied@gmail.com, simona.vetter@ffwll.ch, 
	robdclark@gmail.com, guilherme.gallo@collabora.com, 
	sergi.blanch.torne@collabora.com, valentine.burley@collabora.com, 
	lumag@kernel.org, linux-mediatek@lists.infradead.org, 
	linux-amlogic@lists.infradead.org, linux-rockchip@lists.infradead.org, 
	amd-gfx@lists.freedesktop.org, linux-arm-msm@vger.kernel.org, 
	intel-gfx@lists.freedesktop.org, virtualization@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi VIgnesh,

On Fri, 18 Jul 2025 at 11:54, Vignesh Raman <vignesh.raman@collabora.com> wrote:
> This series introduces new jobs to drm-ci for testing the following
> devices:
> - rk3588-rock-5b
> - mt8192-asurada-spherion-r0
>
> Other updates include:
> - Uprev IGT and updating test expectations accordingly.
> - Adapting to recent changes in Mesa CI, such as:
>    - LAVA overlay-based firmware handling
>    - Container/job rule separation
>    - Removal of the python-artifacts job
>    - Use of the Alpine container for LAVA jobs
>    - Various other CI improvements
> - Disabling bare-metal jobs for apq8016 and apq8096, as these devices
>   are being migrated to LAVA.
> - Updating the runner tag for i915: cml (switching from hatch to puff)
>   to improve device availability.
> - Adjusting parallelism in jobs (sm8350-hdk, amly) to better utilize
>   test resources.

Series is:
Reviewed-by: Daniel Stone <daniels@collabora.com>

Cheers,
Daniel

