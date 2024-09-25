Return-Path: <linux-arm-msm+bounces-32463-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id B51F2985694
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Sep 2024 11:46:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 70172286B54
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Sep 2024 09:46:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A1E7B13C810;
	Wed, 25 Sep 2024 09:46:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="Mc9toR6d"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com [209.85.167.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E16708120C
	for <linux-arm-msm@vger.kernel.org>; Wed, 25 Sep 2024 09:46:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727257564; cv=none; b=E4xaDTfDhpYsD6aQ2AO/Av9Y0cOCbSsO25N9P/OgmtwSECPLSDeaqKrUY1/E/FdgfO9ktOOJKQk/Q1pLolSYseXxFCNcWLJQ6hZ2asMQ8Yz0I+7GtM3+3D9Okp19kERW/bobeYpg3OCA3lteha7MYyohx+PF/uSQwsAgys7QtEI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727257564; c=relaxed/simple;
	bh=NgD5S9pyeEL0whX5CofWYtse3Eype5qITL1jwQePx/4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=n+AIXD8F9nX0csDQdDPoX3tUI4mxfySZOtJy4g14KNKvYee6TsQy5fVYl6F4Ez4FpnmtVRteizQyRk+v/FzSjM0d33s3Ms14X4cgsS739h8m/8HQykg1NkZGhkA0boaY+M3f6rLaSyaFljJA4WJagldEFxGmz/lEc/2GPec/yzs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=Mc9toR6d; arc=none smtp.client-ip=209.85.167.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-53654e2ed93so7734890e87.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 25 Sep 2024 02:46:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1727257561; x=1727862361; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NgD5S9pyeEL0whX5CofWYtse3Eype5qITL1jwQePx/4=;
        b=Mc9toR6d9TvkDamEcm9C96rX+OHNcOGvpzds1b9zuGCLm6fE5XlbibhWn1uJa9/50V
         7z2ekHBEp/LfStDvuhZI5qdWXoJvt8Mw0aLbIyJxnCOKwTj/3/DsevmbeOlAnPdMBoQx
         44NXzw7MdNjqkLI7KtPjCEWrNjeTHYXbJfaAzmNhmn9YegmpclOfnjqIwrupyU5WXf6P
         oF9891vqvKACvbQkLf9Ma4olgjqIaTeqlhxJV7BmPcjSb/Z6aEkHZlbF3RtJl0qPEhdS
         Z7hPpL4yK6FpWT0gow6ndKzETfgQSo0EZGJtdV0ysCHfZyuVb5a1lyXkJxkXkD3YYF8h
         llJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727257561; x=1727862361;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NgD5S9pyeEL0whX5CofWYtse3Eype5qITL1jwQePx/4=;
        b=RWSAIr1s6L+L6ccwpepOJZhv359tzAb+NYE1tL9iGIJAo6qsR8Zg1YhqIKfMkW7g+v
         Sir51SDP5+qCq9ecSjYDnl8xs7+/2yUNQQAo+szZc6/iSlqf5dAFwRHGC+v6AJKhgjIn
         vNg7J2R45Q0mq309W9HrHmWPmTEJdZCoeSkTSK391ewulz7rXp91Tey0EssPJT1V1w2D
         uW+EtFUX6UMpg6+0qjySMKdEjLLjZdz9cieaFZRLyw9VH+WD91Q1VPjsqWGm6GO+IQ4Q
         eBIDAkRUG6dK3hmmAMwNK7oLlU0I/TcNyf+PfkHk41/HFxQa6M4AoP9xekS1xGoET7En
         hFGA==
X-Forwarded-Encrypted: i=1; AJvYcCWuliGUKgYhbecj79cvpUBdZgTKaT26VMCmkjeOiKQJObCcHYjccXwJfpadye6oD5YzicG8lCCYnQP46tsN@vger.kernel.org
X-Gm-Message-State: AOJu0Yzxkf/tjHyc0GowYism1xggfgJM99UVSmQqsWWbA1+j84hm8nB6
	7qVOGzNpObRMxEiw9Kos21XfIT3tnoI01CkbNy4jRqUEk7xKRve1w/55Tgqx9GrrcDdwqetaiGo
	kJooA9nA8bFvkZl+vSyVwp5ZZSReHJBTck7lVpA==
X-Google-Smtp-Source: AGHT+IGpIsWwcArxaXl2nN/jmHZ9mZk4PS6iOVoWxDnyGMawf9jGJkP8UCfY9YHJq1XUYoIoHK/PxmvoTaQAXkJyg9w=
X-Received: by 2002:a05:6512:1384:b0:535:3c94:70c2 with SMTP id
 2adb3069b0e04-538704979e7mr1306012e87.19.1727257560704; Wed, 25 Sep 2024
 02:46:00 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240911-tzmem-null-ptr-v2-0-7c61b1a1b463@linaro.org> <e1089f44-5415-4a46-a8fb-9711f122a6bd@leemhuis.info>
In-Reply-To: <e1089f44-5415-4a46-a8fb-9711f122a6bd@leemhuis.info>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Wed, 25 Sep 2024 11:45:49 +0200
Message-ID: <CAMRc=MdmZ7_oHv_7Ja9E0pfuoF5wWeGz_1=Yq=G-gE_cpsBGSA@mail.gmail.com>
Subject: Re: [PATCH v2 0/2] firmware: qcom: scm: fix SMC calls on ARM32
To: Linux regressions mailing list <regressions@lists.linux.dev>
Cc: Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	Andrew Halaney <ahalaney@redhat.com>, Elliot Berman <quic_eberman@quicinc.com>, 
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Rudraksha Gupta <guptarud@gmail.com>, 
	linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 25, 2024 at 11:35=E2=80=AFAM Linux regression tracking (Thorste=
n
Leemhuis) <regressions@leemhuis.info> wrote:
>
> On 11.09.24 11:07, Bartosz Golaszewski wrote:
> > The new TZ Mem allocator assumes the SCM driver is always probed which
> > apparently isn't the case on older platforms. Add a proper workaround.
> >
> > Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> > ---
> > Changes in v2:
> > - use likely() for the more likely branch in smc_args_free()
> > - Link to v1: https://lore.kernel.org/r/20240909-tzmem-null-ptr-v1-0-96=
526c421bac@linaro.org
>
> Thx for working on this. This afaics is fixing a regression from the
> 6.11 cycle; we already missed fixing this for 6.11[1], but please allow
> me to ask: is that something that bothers many people and thus should
> maybe be fixed rather sooner than later? No pressure, just wondering, as
> it seems the review is making slow progress.
>
> Ciao, Thorsten
>

Bjorn should pick up patch 1/2 from this series into the QCom branch.
If it doesn't happen by the end of the merge window, I'll resend it
separately on Monday.

Bart

