Return-Path: <linux-arm-msm+bounces-37251-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id B99B49C0837
	for <lists+linux-arm-msm@lfdr.de>; Thu,  7 Nov 2024 14:56:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 51EEAB2128A
	for <lists+linux-arm-msm@lfdr.de>; Thu,  7 Nov 2024 13:56:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 198BD21265E;
	Thu,  7 Nov 2024 13:56:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="bDKIzJg9"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f181.google.com (mail-lj1-f181.google.com [209.85.208.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E16921263E
	for <linux-arm-msm@vger.kernel.org>; Thu,  7 Nov 2024 13:56:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730987770; cv=none; b=C7DaTHGzGVo8cONvAoZlQS/31hz8eD1s2wRogNCchz8oZldu/Cf57HV44t3hOqzojccYetfWk+IencbAr+LOHjkzyg65iMaIi3is+pwyuk7nNNBRVAkkP3LISASInw0RJPcp6b2V7eMA4Vw0KnZgPzOwPiz2crTC5/bE5nfLKyk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730987770; c=relaxed/simple;
	bh=2HB8S68hF9jRWaNI9mJ35YjWMaC3waBLoGHDR9I3wbQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=OsAr+ZW474e47ibVvy498ZnZZ3jMGmlbfuCJvxLcFpe8XPIG54Kxuj5oSK8jHSNJfo/VTxbfnEdGI3LQ4IPWyExRKMLFQZbxvGwSCXAQ26Tcy4Jx3dSvWc6GpEcb+IKeMYIcSy853DprJ4WQ3MlWmy6RRgUD/ttgdI39DPcj/TI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=bDKIzJg9; arc=none smtp.client-ip=209.85.208.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f181.google.com with SMTP id 38308e7fff4ca-2fb3c3d5513so9577291fa.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 07 Nov 2024 05:56:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1730987766; x=1731592566; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2HB8S68hF9jRWaNI9mJ35YjWMaC3waBLoGHDR9I3wbQ=;
        b=bDKIzJg9ZbquNDb6gNnxI9oDNAQ37vdCWXGc+7/4t/Y++MnqJV1uF3kOJ8pMUc8RcT
         /to2xlkwxYymF5vwrKVFQjiId9JmgCCNkdzHeAXnZDsA2U730LXi3dnND8GPVuEsZlMM
         521LQbdqs5h54rJ+9TaEnq1gwyDMZSFkTIdQpO8o6+6KEO9SMumVPiLnFUxHe+eelQ+l
         e2LhgVo6bC3NL7zrTRE663YPYDfy/nwSzAopLLHIUrB6aj7AY4SnRDVJF6fda3rdSsDP
         hVHQPTukImu0zbamnt2/hx6ntiKQFwi/qX5JQXWKiuUIlLuFCQ7fdarJCtKFzgmEK9cl
         YkrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730987766; x=1731592566;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2HB8S68hF9jRWaNI9mJ35YjWMaC3waBLoGHDR9I3wbQ=;
        b=sKMx5sMuF+3BYwZb6UubpxIBniOlN7WBCHUaiZRVbOm//vt3bNmUyCyZjPtWsd8pM8
         qm3gMqWq3xGv8Ii6G5gWfFZkrPIqkYBZm180vVo2FUvZ5FiGJlXxhXVb+/n+cf8NMAbo
         xWEB1Rf8B8ZQCj1C1btmnMovjrTnpMXudHFY1IbCKmBw1qARejoWvoXFiGhtNLLLaaTe
         e7ty0nyiStUjL2WyxAS1Vo61udfxfMM3JzeKBCeWEnguIPQJLFzfQcKFgOk4rWOvOEbx
         mUvBZ9r+4Lm07WuhqxYyLNz11+WVeUZwz5/6N617/cqdKUNdSRAV9ZTN63Y921Dh1V6V
         BqTQ==
X-Forwarded-Encrypted: i=1; AJvYcCWerZVEpjlBXXfsvODZwOZJgdQs3eW+zeaLTMB20G6ImzXD0KD21GwH/B6zTFEtrCx65R9+zGNS0pIah7Mr@vger.kernel.org
X-Gm-Message-State: AOJu0YzHQYechGw5+z6dqWAIT5+aUMjC+a3LcNC3EysnxE/td6TUCi8a
	SC87MgU70DLdUJRpNQSpitl7eavNhzbTetKVSsyVf7BQiJdLkMZeQTCj4+96WehZ+fVFNA6zd1O
	VXj82dEF550qQ0hAOJzMlYujmHA/l8Ax8AA7gIg==
X-Google-Smtp-Source: AGHT+IFrud7HairE/9EIYpHYq1Qq4YumL/GF1pww8t5Xiei+et58qHUoVolZLH2rni1Z35DhKc3CTAu8t4LeeyRCaLs=
X-Received: by 2002:a2e:bd0a:0:b0:2fb:5014:8eb9 with SMTP id
 38308e7fff4ca-2ff1e8b49e0mr470261fa.10.1730987766341; Thu, 07 Nov 2024
 05:56:06 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241014-armv7-cacheinfo-v2-0-38ab76d2b7fa@linaro.org>
In-Reply-To: <20241014-armv7-cacheinfo-v2-0-38ab76d2b7fa@linaro.org>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Thu, 7 Nov 2024 14:55:55 +0100
Message-ID: <CACRpkdbfckBBW5W5sEvz1LwzdOvTKi_fi7tDu+9nPeKumYkPeA@mail.gmail.com>
Subject: Re: [PATCH v2 0/2] ARM: implement cacheinfo support (for v7/v7m)
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Sudeep Holla <sudeep.holla@arm.com>, Ard Biesheuvel <ardb@kernel.org>, 
	Russell King <linux@armlinux.org.uk>, linux-arm-kernel@lists.infradead.org, 
	linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	Arnd Bergmann <arnd@arndb.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Dmitry,

On Mon, Oct 14, 2024 at 3:55=E2=80=AFPM Dmitry Baryshkov
<dmitry.baryshkov@linaro.org> wrote:

> Follow the ARM64 platform and implement simple cache information driver.
> As it reads data from CTR (ARMv6+) and CLIDR (ARMv7+) registers, it is
> limited to the ARMv7 / ARMv7M, providing simple fallback or just
> returning -EOPNOTSUPP in case of older platforms.
>
> In theory we should be able to skip CLIDR reading and assume that Dcache
> and Icache (or unified L1 cache) always exist if CTR is supported and
> returns sensible value. However I think this better be handled by the
> maintainers of corresponding platforms.
>
> Other than just providing information to the userspace, this patchset is
> required in order to implement L2 cache driver (and in the end CPU
> frequency scaling) on ARMv7-based Qualcomm devices.
>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

I added my review tags to the v2 patches, can you put them
into Russell's patch tracker?

Yours,
Linus Walleij

