Return-Path: <linux-arm-msm+bounces-33571-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 064489950E8
	for <lists+linux-arm-msm@lfdr.de>; Tue,  8 Oct 2024 16:02:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B007C1F2577D
	for <lists+linux-arm-msm@lfdr.de>; Tue,  8 Oct 2024 14:02:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A99271DF97B;
	Tue,  8 Oct 2024 14:01:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="MBAuS3bw"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-yb1-f170.google.com (mail-yb1-f170.google.com [209.85.219.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E89971E4B0
	for <linux-arm-msm@vger.kernel.org>; Tue,  8 Oct 2024 14:01:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728396079; cv=none; b=GywE0lVW2GkIwWmiUfpZ2pU/Ws4YsbK97h0FcUbZ3r0P+SIB4rl58CQwHyks7USAt6xAqKvM7l8nBAHwNNz9m+u2O0Tg4SbV6owtBdViO7ZSQrXcSY+kh/lO+8ODr8Ru0SVtiX23GZ9ot+kM6o+Dk/lB4MJ/AashLAjDYnvqmrM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728396079; c=relaxed/simple;
	bh=mmoCWWBPMNWN5Pi3PCZomIL/c01m10Ls09k6EAKhgOQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=qpN/yCT/jhqSrVshV2tGs2Ph0mGRgFFMJPLSvfFHLBFJP6cWTcs4zdwTAZyPh3jZJf118Owv/vgOq+oV8ywbKFk8DusdjtXWSouv4Xx5u8m3XjL4YP5mjBEIi9e87806VeHHv/n+iBwSR25WzKuqu3FnAr8/TIZp9flwKruew+s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=MBAuS3bw; arc=none smtp.client-ip=209.85.219.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yb1-f170.google.com with SMTP id 3f1490d57ef6-e263920b6bbso4596677276.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 08 Oct 2024 07:01:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1728396077; x=1729000877; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=QE44MjvjGlXQo09X4aaBHeiy26kXCM/N88w8ksHxsYY=;
        b=MBAuS3bw5xb8b7v/CDwLubK8FowYK+3HfFrFV2cGSbysjONNHUxJVJMwMeMiCd4W1Y
         YEfnoj2vE3gQpgz6Da2apn8VA7NPp64x9HLDyTr7IR5le6svttU7oHqiBMDbGgBRIztK
         +tTYm84a9XKFeHbMpMIuw1SGW8gT6OsyQo2rzwAA3NQCG90bAlA7tVW2g0ckPUhAV7eZ
         VQQrpVZgXJvaZZhs0VfVrWxZGLvFsWTgtCFKXFSelOc+/sQSSkrBcH8pcgcyGrlsxiyQ
         V+ontU2i5HePpgvd0LpXqW0O4ZCU3HMgsjiIunqUOCbRIzmvjUsKwB840lkRcnGXNnsB
         ZH+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728396077; x=1729000877;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QE44MjvjGlXQo09X4aaBHeiy26kXCM/N88w8ksHxsYY=;
        b=FYTggGVQgmaLilE0SgLs3KJyy2WvUSU8Lsv/rCRxDrT4Nn6UgUARN3pnwkd6LwxfSC
         QU0PuW6878dXo3nL5IqUMQf8A3ojfRdUyIoaFwvE00QHonnF1z1K10TUVJmWowju+19u
         UeAflTpiPKEcfV7ttLSwkXkPqHFleV43fjisG3rR73zWlGl6yl5Yc+Ee3SzqZWjvF434
         eyvNXqcg7AAe5m5Br5bPACkhJQyW6imVOMj5klpb3UQBefcdQ1QsKAAm5vypQsqZ3dYz
         tuqHHa/jMXBgi5mpVY7OqA4ap8sIfSvRjxP+40HQRk7LOln+qvuO/LlgGjOb3JZBW/lf
         eUhA==
X-Forwarded-Encrypted: i=1; AJvYcCX9M5vs2XnrCtAcvyJk3YqalZCCEvx3k6FqzXroxugzRf0imiHZ8ABP3IdYXsv3rbcikcpCLZdL5SDaMF4A@vger.kernel.org
X-Gm-Message-State: AOJu0Yw0K+zRbQFCJ25jI50I/zSg/X3tOlpc+8IzDiF4P3AJYVDkRLYA
	Jlk0gSPUOqXuC1jATITSX0AUJRtqPXVCBNlsBDOeo5ml0DJsaZidSwdtv0Fi2brQUm/tefLWxsp
	dlXRLF5VJ/BerNqaT8FVM2yqmancfANp+GRcDAA==
X-Google-Smtp-Source: AGHT+IGTV6VC/pNSzGY+RUb51i/BTSuNpuC7jBoq5cv/Bck9LWu2cuxkJriYebercZ+lkwSPCxUa4kcq1oYG0RIOv+c=
X-Received: by 2002:a05:6902:727:b0:e25:c6a3:797d with SMTP id
 3f1490d57ef6-e28936c984amr13384867276.6.1728396076638; Tue, 08 Oct 2024
 07:01:16 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241006135530.17363-1-quic_spuppala@quicinc.com> <20241006135530.17363-2-quic_spuppala@quicinc.com>
In-Reply-To: <20241006135530.17363-2-quic_spuppala@quicinc.com>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Tue, 8 Oct 2024 16:00:39 +0200
Message-ID: <CAPDyKFpXh0vZrK6PU2V+y92Q_+y6Q2+VUEONXiBrqAp_qqp_jA@mail.gmail.com>
Subject: Re: [PATCH RFC v3 1/2] mmc: core: Add vendor hook to control
 reprogram keys to Crypto Engine
To: Seshu Madhavi Puppala <quic_spuppala@quicinc.com>
Cc: Adrian Hunter <adrian.hunter@intel.com>, linux-mmc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	quic_rampraka@quicinc.com, quic_nitirawa@quicinc.com, 
	quic_sachgupt@quicinc.com, quic_bhaskarv@quicinc.com, 
	quic_neersoni@quicinc.com, quic_gaurkash@quicinc.com
Content-Type: text/plain; charset="UTF-8"

On Sun, 6 Oct 2024 at 15:55, Seshu Madhavi Puppala
<quic_spuppala@quicinc.com> wrote:
>
> Add mmc_host_ops hook avoid_reprogram_allkeys to control
> reprogramming keys to Inline Crypto Engine by vendor as some
> vendors might not require this feature.
>
> Signed-off-by: Seshu Madhavi Puppala <quic_spuppala@quicinc.com>
> Co-developed-by: Ram Prakash Gupta <quic_rampraka@quicinc.com>
> Signed-off-by: Ram Prakash Gupta <quic_rampraka@quicinc.com>
> ---
>  drivers/mmc/core/crypto.c | 8 +++++---
>  drivers/mmc/host/sdhci.c  | 6 ++++++
>  include/linux/mmc/host.h  | 7 +++++++
>  3 files changed, 18 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/mmc/core/crypto.c b/drivers/mmc/core/crypto.c
> index fec4fbf16a5b..4168f7d135ff 100644
> --- a/drivers/mmc/core/crypto.c
> +++ b/drivers/mmc/core/crypto.c
> @@ -14,9 +14,11 @@
>
>  void mmc_crypto_set_initial_state(struct mmc_host *host)
>  {
> -       /* Reset might clear all keys, so reprogram all the keys. */
> -       if (host->caps2 & MMC_CAP2_CRYPTO)
> -               blk_crypto_reprogram_all_keys(&host->crypto_profile);
> +       if (host->ops->avoid_reprogram_allkeys && !host->ops->avoid_reprogram_allkeys()) {
> +               /* Reset might clear all keys, so reprogram all the keys. */
> +               if (host->caps2 & MMC_CAP2_CRYPTO)
> +                       blk_crypto_reprogram_all_keys(&host->crypto_profile);

Don't you even need to call this once, during the first initialization
of the card?

> +       }
>  }
>

[...]

Kind regards
Uffe

