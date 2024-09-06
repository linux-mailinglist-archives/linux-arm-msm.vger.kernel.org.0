Return-Path: <linux-arm-msm+bounces-31102-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C6B596F320
	for <lists+linux-arm-msm@lfdr.de>; Fri,  6 Sep 2024 13:33:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 315411F21EB9
	for <lists+linux-arm-msm@lfdr.de>; Fri,  6 Sep 2024 11:33:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F08ED1CB306;
	Fri,  6 Sep 2024 11:33:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="iT7na9vS"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-yw1-f173.google.com (mail-yw1-f173.google.com [209.85.128.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 619E715852B
	for <linux-arm-msm@vger.kernel.org>; Fri,  6 Sep 2024 11:33:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725622408; cv=none; b=EbcyXjCkMtpvJfw1stgBRQesjUF3QSyyOb5ny98uWR6PIoIn/QVLRfveMM10KDmOC1VU2NL10eRSzdGMHDMtRznqrgz8bLiU2POKyVW/PELQmHs7KQ+eVpnYBMLusVwmrkcUgSkBIS6nf9if9FkZy0D7pD1XSK6KWUGuGACUnIk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725622408; c=relaxed/simple;
	bh=a1oiwHXhTP5k1qDN8Kz5shKpgHS7gkdYtvq/dlluG9A=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=k5VPSaXVtrs5qwbzJCIt94woth9CZF4qcuIjaPwVVW220fIDAdh5ytci1ME/5jqnN1lRu6LjCa8qENYmvcLYCahydfj4gWfF9od9UlqnxbKH7Smsv7w0V8zi4m/i0tzgVipSK8vjgTqXWoTyYpfzD1nr5/4IZlqH5/3jt+olj7I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=iT7na9vS; arc=none smtp.client-ip=209.85.128.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yw1-f173.google.com with SMTP id 00721157ae682-6d47d860fc4so15388167b3.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 06 Sep 2024 04:33:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1725622406; x=1726227206; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=a1oiwHXhTP5k1qDN8Kz5shKpgHS7gkdYtvq/dlluG9A=;
        b=iT7na9vSVMNMOa4G0amg5V2y+C3JlFr5Dz0ewo8hhVHtJ0l68SilcsGyW/t2RwOauC
         NExXmexDyAe0HVgooQO2lIYOEXCOQJJQE6gM/KZrwncqI761m4EkYJgOJBKwxag6nBog
         rjPKoR+/pr4qnqTRS6I6GgXMa0Jzzm6ECGGtlhvYiRt5agiiA1Xr69p1Goti2GnRm4R4
         6fe+4fTh7acfuSjwjls+PETbbMa3pTyH1Yiw1DWZ7jA/P+nk6qKF5cSuSbNie5txJeaL
         TDosmEygY5hRYdWX+W8zHFuMEsXRhtNXjadAXlff9g3wyZvdjfBkpDM8juXtKPJagaVS
         aEAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725622406; x=1726227206;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=a1oiwHXhTP5k1qDN8Kz5shKpgHS7gkdYtvq/dlluG9A=;
        b=fCDEWEVipKM8LwkXc2Rrh9xpz6H0bY1H8VMu4Ld5hcWEKi0H8OZLMd0ZD6KkBJQMyF
         MkZGeE7dApZEJAi0EDVrWFKMQolWALZanqN3E86+Gh17gsrn/wooX4T2oTRt9a79SBrR
         1pLp/7q85qIJ5wZ+ujntMRQ0fVO50ZIwtlc9++nlgqXiL5gI8KgZ2mHjXeXA0xIM0o4d
         WI/LcHrhVhE1GLkmS3cC46h3SiCwjyEwafZ10SxD1LvLEhQVvU943sBPzs+rrRuNtfk2
         ReqYYoT65Bxg7X6/mq2LZ8wESphTYJLTBwXQ3NanE6PlFzzZuub3QLKZjUcvtUwsv5+k
         G1/A==
X-Forwarded-Encrypted: i=1; AJvYcCVytyXCjdp2rDUvEaIcrDbA8kfWcjnugZa4+7lF01XotfNdctH53wovvNXqoqrBXQ2Aho0L6DICFOGQdtBL@vger.kernel.org
X-Gm-Message-State: AOJu0YzYkrEXSvDrhHehjRdElhv1F+gTg3vFaldOrqAYoeXfsf/HF+QI
	ScJ/dLUkecv1xIenQKZinuV2lL28BwyVOrhlQK9s7QKUmuDNwmgg8gwD7uxs21NbL6EM/XvfoB8
	j+PBxl5WLHXbpwXuQhfruUfXOQs115YbK+HxFQZxRB0ICXTniMso=
X-Google-Smtp-Source: AGHT+IGkcx0LnZHoHukMiwPH2fOzPIp/adODmKyPix5sHHzkQiP21pFZVgYcCTOOmpTmXp2A5oULIb0ksyDmO2p8kGw=
X-Received: by 2002:a05:690c:6384:b0:6af:125a:1c6a with SMTP id
 00721157ae682-6db452d6a58mr25663227b3.41.1725622406397; Fri, 06 Sep 2024
 04:33:26 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <692cfe9a-8c05-4ce4-813e-82b3f310019a@gmail.com>
In-Reply-To: <692cfe9a-8c05-4ce4-813e-82b3f310019a@gmail.com>
From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Date: Fri, 6 Sep 2024 13:33:15 +0200
Message-ID: <CACMJSes4cnCNUHiZUr4CF-K2c8-1VYzuh=T8JDi_erqfShkuZA@mail.gmail.com>
Subject: Re: [REGRESSION] firmware: qcom: scm: smc: switch to using the SCM allocator
To: Rudraksha Gupta <guptarud@gmail.com>
Cc: regressions@lists.linux.dev, brgl@bgdev.pl, andersson@kernel.org, 
	konrad.dybcio@linaro.org, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, robimarko@gmail.com, quic_gurus@quicinc.com, 
	luzmaximilian@gmail.com, catalin.marinas@arm.com, will@kernel.org, 
	srinivas.kandagatla@linaro.org, arnd@arndb.de, quic_eberman@quicinc.com, 
	elder@kernel.org, linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	kernel@quicinc.com, ahalaney@redhat.com, quic_djaggi@quicinc.com
Content-Type: text/plain; charset="UTF-8"

On Sun, 25 Aug 2024 at 08:51, Rudraksha Gupta <guptarud@gmail.com> wrote:
>
> Hello all,
>
>
> Found a regression with a platform that has the msm8960 SoC. Was hoping
> to code up a fix myself, but I'm not adept in ARM architecture or the
> Linux kernel, so I'm just reporting it here. Reverting this commit seems
> to fix it as well. Please let me know if there is anything else I should
> provide for this regression report.
>
> #regzbot introduced 449d0d84bcd8246b508d07995326d13c54488b8c
>
> Error: https://pastebin.com/SDRENUGk
>
> Defconfig: https://pastebin.com/CRDjC39a
>

Looks like qcom_scm_get_tzmem_pool() returns NULL. Not sure how this
happens. Can you confirm that the QCom SCM driver probed correctly?

Bart

> Platform:
> https://wiki.postmarketos.org/wiki/Samsung_Galaxy_Express_SGH-I437_(samsung-expressatt)
>
>
> Thanks,
> Rudraksha
>

