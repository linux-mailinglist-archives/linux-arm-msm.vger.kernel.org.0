Return-Path: <linux-arm-msm+bounces-50640-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B9D75A5690F
	for <lists+linux-arm-msm@lfdr.de>; Fri,  7 Mar 2025 14:38:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 711873AE6F2
	for <lists+linux-arm-msm@lfdr.de>; Fri,  7 Mar 2025 13:37:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8203D21885D;
	Fri,  7 Mar 2025 13:37:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="irJauzcN"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com [209.85.167.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D7E521A45B
	for <linux-arm-msm@vger.kernel.org>; Fri,  7 Mar 2025 13:37:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741354672; cv=none; b=VxwApX4RTpJ39s/WZyvrXJ2uDleMPxMh+tV8UoI6Qg4DUBAiUirOxeczGbc4ZUdAU+sqEAbEpOvJGKH4QG4uVGozKG+p+68zGTRl0PikgdTgbU1h0atUPe7cZEJZmq1IBRUoI9cjgSFScVmaF3S8hds8aLvoVWYBP8xRwJiX8lk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741354672; c=relaxed/simple;
	bh=yhAiG+qi3GeaVQhP5HW92YO4rjUq5KzIddSEtmQYAwo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=cMBa4NKDvjaiGlOrhg8yp+6ThZyp7rvsfTv3EZarTDK77uEsP339J8sdAQUNOL1Fd0zZjsceyXwFHr0wG1SawzkESyLS8XeXyGNO/UOq0Al05/XLlziQpQUFrV84ucwItEnI5dS3qE4VL7ho0eKJegbipfJHOr/JTFu04dU2r/U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=irJauzcN; arc=none smtp.client-ip=209.85.167.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-5496301c6afso3194360e87.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 07 Mar 2025 05:37:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1741354669; x=1741959469; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yhAiG+qi3GeaVQhP5HW92YO4rjUq5KzIddSEtmQYAwo=;
        b=irJauzcNX9RDwDK9m+6GWPRDXgRBdNV8bbXKLyQZoDe2uDbJ2TF+W7sp047ao4GAOV
         vEA0K+KD3zb/BnhJXXcQrFXHTI6nE9ht+9vhHBfoLTg7perJFZ7rCaqkKsUgVRJVG4Ar
         VhvnLjqGmVZNL1By4jKht4tITJrB2X0q7NgBjPP8n0N6bqETEe0eDK8bb0wfwDzVsR7s
         t1rCH4GmTFB+VDMhcYOpSi6zK/D5R4vwuw73GUN6biYbuSZ2eWfXe8PXbceQxMmTZxx8
         kEs2icMEbbE3R8IXT46WkoUC/Z9T/Z8ZhQmydwhjlUI7PsWngT0xnNwN+547VQCNCfVK
         H50w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741354669; x=1741959469;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yhAiG+qi3GeaVQhP5HW92YO4rjUq5KzIddSEtmQYAwo=;
        b=ZJNIOT4gRz1pGT6eykku4AsJyE8GgKOBLU4KRtGl7vVSZPomhmFAP7llYFKfTD7bBi
         hs5DtHqEud8fqjwaBGFbJOtYQeDzxsTF1twqCAtX8N9J/pVdVjKqTfond988PGd7UToi
         6pqnDOE0PpZhvp5N2Pdvk4P2ybcqzM/zAlFxQjBgG0b3tEgdfJsCUJZRGG5N4hMwopR1
         X0A1Y9vyiXoGLsBjxaEpO+h5kzfMmHSvz7Zj4kZ3OnN7J4+ltKIU3qeyiJHhB5vLTuQQ
         mA+pZFk9HlrNmqzwCdyIS5qIyf4LuMUHhkNvoN1CJGWeAm97rjwuSdPqCL8QCod9UFXr
         jJ/A==
X-Forwarded-Encrypted: i=1; AJvYcCVEj0/hpmhxgFNx7eIZ6neWEa1FVq6JvK6uSTIo2FomC2yBZJczN/CO/zZJrAzPrGr4QfOaGoHiM40JJHc6@vger.kernel.org
X-Gm-Message-State: AOJu0Yzow9AB37QAlj+bhP8mLrCYPpAVQ5zBrG42WFdHwYMEJspFvvOx
	/ln3vAE0zO3RQbVfqHY8FwWlhYAq9qAZPWd0jOTWWWf0POrFS8TOZ0T5UpMU/dfTL0COQUL2ePA
	MFamk38cCUmDkZ/lFlWmq1SoZ9Ffot3/IIIiK0A==
X-Gm-Gg: ASbGncvE1Sq/vI1zZSJ3mRdds2FqpJmanMWCkrx9rTR/f5eosFEEFtYJbPI35iI/e/I
	xnFLVuRhUD47d9uqX5EdKxF24VGS3qnD+8Klv2DAmcaf7OGvaWokHSrDAh7xYms5wmq56vs7lK1
	mOF4Y/hddv+AF/1OlICEdNCfCwFiVANxSxtUunQxt6G+Mtf4S0veM7q51e
X-Google-Smtp-Source: AGHT+IGzkNoMHjmvOj1hQqXkv2F5z2g3i4Jr8kD59wAfvhlOi53g3cqwXoU/0aqTwNXIKKE8Ssj4pheG14cvE/77p9o=
X-Received: by 2002:a05:6512:3048:b0:549:5769:6af6 with SMTP id
 2adb3069b0e04-549903f6a2dmr1550533e87.9.1741354668560; Fri, 07 Mar 2025
 05:37:48 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250115103004.3350561-1-quic_mdalam@quicinc.com> <20250115103004.3350561-4-quic_mdalam@quicinc.com>
In-Reply-To: <20250115103004.3350561-4-quic_mdalam@quicinc.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Fri, 7 Mar 2025 14:37:37 +0100
X-Gm-Features: AQ5f1JpFjLgvIBX6jbFKPzEzBuYS5kNiIudISoUHjkmPBU-Dykoze86uPUbnTss
Message-ID: <CAMRc=Mc641VWZp_2cMxrvs2ErwwkE04903GZ8BzDAZg3+H19NQ@mail.gmail.com>
Subject: Re: [PATCH v6 03/12] dmaengine: qcom: bam_dma: add bam_pipe_lock flag support
To: Md Sadre Alam <quic_mdalam@quicinc.com>
Cc: vkoul@kernel.org, corbet@lwn.net, thara.gopinath@gmail.com, 
	herbert@gondor.apana.org.au, davem@davemloft.net, martin.petersen@oracle.com, 
	enghua.yu@intel.com, u.kleine-koenig@baylibre.com, dmaengine@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-crypto@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	quic_utiwari@quicinc.com, quic_srichara@quicinc.com, quic_varada@quicinc.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jan 15, 2025 at 11:33=E2=80=AFAM Md Sadre Alam <quic_mdalam@quicinc=
.com> wrote:
>
> BAM IP version 1.4.0 and above only supports this LOCK/UNLOCK
> feature. So adding check for the same and setting bam_pipe_lock
> based on BAM SW Version.
>

Why do we need to read it at run-time if we already know the version
of the IP from the compatible?

Bartosz

