Return-Path: <linux-arm-msm+bounces-42216-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id CD56E9F1B9B
	for <lists+linux-arm-msm@lfdr.de>; Sat, 14 Dec 2024 01:55:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E6C6616248E
	for <lists+linux-arm-msm@lfdr.de>; Sat, 14 Dec 2024 00:55:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 320DAD528;
	Sat, 14 Dec 2024 00:53:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="DSyIGI9m"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f178.google.com (mail-lj1-f178.google.com [209.85.208.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5DA7AD53C
	for <linux-arm-msm@vger.kernel.org>; Sat, 14 Dec 2024 00:53:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734137623; cv=none; b=kedcX0aAqmo9+G4QC1pXaDkvs9jVVcLfhh3HwfKxvFtTDzMo7C2DsXwXZCGE1AlhYXlAFl8gc1moDdqJXwvVIR5Tk01N+eLfWCf7iqzB7mBzsDcnUcCvgIB3A56E47l8yuvcO4eXEkKmh3z4/C+lcWF08bG15StJd8i6EQiZoGY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734137623; c=relaxed/simple;
	bh=cGPU+ei2UNXPVjxwRtXib9gV3ppcgfLysjVG+R1rZDo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=SOB4Eudz/Xs6vUPbKWKq/q/dOZlfyfCv9wdX/LiOGzNM3LMdJYo2qrwYsxrH0VHj9G2inoctE6KHKgg7xqfLWNK5JnFajR6gawhQG0+zTgQoy0N2juvq9hOMZCbJ6aJY1EAudqz5vfXtNMUYQGfhgER7z0vMpwSb/Vg1WCpQZTo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=DSyIGI9m; arc=none smtp.client-ip=209.85.208.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-lj1-f178.google.com with SMTP id 38308e7fff4ca-3001e7d41c5so23180991fa.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 13 Dec 2024 16:53:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1734137619; x=1734742419; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cGPU+ei2UNXPVjxwRtXib9gV3ppcgfLysjVG+R1rZDo=;
        b=DSyIGI9mxD0EaklErzzE+VC1RUj2b+fTYgPmXPObnZGYP28SZFWZKKVoudlAHWdUnO
         H5nqtSE/IJlTZs879WFpGZJZiYhhvazLJCBvJmerTK+SK4WGVklTKIj48zJ0KKGpPkAa
         U/FA8fXlZ1RP0dRLtIdItjjkxbHQQZM43QnUA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734137619; x=1734742419;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cGPU+ei2UNXPVjxwRtXib9gV3ppcgfLysjVG+R1rZDo=;
        b=jQprCgUJtVHs3iqOGYeAg1eZjaItU3kFmp6gum+bjSqvtIAN6XArCmiQ84tLBC5g2s
         cSy8YnfvuOE1aKv4K6NOXhSM0wnsF+DJPNB2swYDqhXi4nx0UcZwF6ar2WDi/TyB6uqI
         9UIeXHGi/tJPaRjRZlLq4l61mciwVwu7KImeK5U1cnROhB7Csel24MCjUwRvI39hZ6WP
         RXrvqfn6zyXNmdsk4v4uWtO1hdt7XLi+kNle3gcst2snk7F/1nkxTJOYmvjWVO7aeScV
         uaa6rn7vcOu1LtS0RnJfilMUilKAvn+nKQyGtrrGZPqPXJtSLVLNHYt3QqM+PsuzzGPX
         ytxw==
X-Forwarded-Encrypted: i=1; AJvYcCWcBOZSkJ0cL0GmQYC2do2xHHjZibbQZ6YbK3s+G30yMhkJ1nWAoZJTw5lvS7HpWgQcfMGQn/fyWDc7hHLT@vger.kernel.org
X-Gm-Message-State: AOJu0YwjR25FNyWUhhtqKFWNET7GKoyt4vvdeW52tb5356+N53vKNBLs
	yd6gA6WA38PxF9b5YMTb8k1scr0rhsqgFVJoHLWo7vVxIqsGPnmKBYq5e/3CifPbommNCfyOfNE
	xhAev
X-Gm-Gg: ASbGncu4oQ9U1DVxr5NUUGm+Q17rBaYw7sqoNW+/PewxbIK0XWFgfhhBZoSgdCmWOmc
	QLl+tf4/kh1WajyMFwVJuxXe0uXMxyZk77CsuI+PTcr8iUJw8eEQJ6a836xGotC7vjxlOB9YGiS
	B1oqLNj7317M6Kp458oh/qUMsKd6T2rag8o02OMP6led/GGHdrzLpDdEB7mYb8ItWVbtDV/S/de
	+1JeCHcTkNyTDf3zEA6fUd3Q3CLYpiSeAQEd2sKRr9VyRePEV/hKxyFPJ9of/mFSU64gAUw6WYv
	uWiiirWA5ml4zR7FJan/wN8g
X-Google-Smtp-Source: AGHT+IFmbnIwnj/KFjYSXqZmybOf5Yw2UR2r0/uFy1WGva1+bbpqn8G8A3UxKcpsxE3QouWj997KcA==
X-Received: by 2002:a05:651c:1503:b0:300:2a48:fb63 with SMTP id 38308e7fff4ca-30254423253mr15608511fa.6.1734137618715;
        Fri, 13 Dec 2024 16:53:38 -0800 (PST)
Received: from mail-lj1-f182.google.com (mail-lj1-f182.google.com. [209.85.208.182])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3034443371csm654441fa.85.2024.12.13.16.53.37
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 13 Dec 2024 16:53:37 -0800 (PST)
Received: by mail-lj1-f182.google.com with SMTP id 38308e7fff4ca-3003c82c95cso18486581fa.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 13 Dec 2024 16:53:37 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCWUzRPzzqFv+Ejuj+Wk4FIcOgY1B4r+F7UWyF3+U3xPkth8jte4os8wU+jAywQ/stafG+9TP9tliEeB6Xcu@vger.kernel.org
X-Received: by 2002:a05:6512:3b90:b0:53e:3a73:d367 with SMTP id
 2adb3069b0e04-5409055de77mr1099342e87.25.1734137617142; Fri, 13 Dec 2024
 16:53:37 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241209174430.2904353-1-dianders@chromium.org>
 <20241209094310.5.I41e227ed809ea607114027209b57d02dc0e98384@changeid> <l5rqbbxn6hktlcxooolkvi5n3arkht6zzhrvdjf6kis322nsup@5hsrak4cgteq>
In-Reply-To: <l5rqbbxn6hktlcxooolkvi5n3arkht6zzhrvdjf6kis322nsup@5hsrak4cgteq>
From: Doug Anderson <dianders@chromium.org>
Date: Fri, 13 Dec 2024 16:53:25 -0800
X-Gmail-Original-Message-ID: <CAD=FV=WQf+ig21u316WvQh0DoKsdKAmZgqPn5LB-myDXsJtXig@mail.gmail.com>
X-Gm-Features: AbW1kvYMP3ofEliinmKmD5c4JW-mKQ4nNcdLo-yjvAZoISWzi-Wl91dy2zD3Sw4
Message-ID: <CAD=FV=WQf+ig21u316WvQh0DoKsdKAmZgqPn5LB-myDXsJtXig@mail.gmail.com>
Subject: Re: [PATCH 5/6] arm64: errata: Add QCOM_KRYO_5XX_GOLD to the spectre_bhb_k24_list
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Mark Rutland <mark.rutland@arm.com>, Julius Werner <jwerner@chromium.org>, 
	Jeffrey Hugo <quic_jhugo@quicinc.com>, Roxana Bradescu <roxabee@google.com>, 
	bjorn.andersson@oss.qualcomm.com, linux-arm-kernel@lists.infradead.org, 
	Trilok Soni <quic_tsoni@quicinc.com>, linux-arm-msm@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

On Mon, Dec 9, 2024 at 3:07=E2=80=AFPM Dmitry Baryshkov
<dmitry.baryshkov@linaro.org> wrote:
>
> On Mon, Dec 09, 2024 at 09:43:15AM -0800, Douglas Anderson wrote:
> > Qualcomm Kryo 500-series Gold cores appear to have a derivative of an
> > ARM Cortex A77 in them. Since A77 needs Spectre mitigation then the
> > Kyro 500-series Gold cores also should need Spectre mitigation.
> >
> > Signed-off-by: Douglas Anderson <dianders@chromium.org>
> > ---
> > Yes. I know. This patch DOESN'T COMPILE because
> > MIDR_QCOM_KRYO_5XX_GOLD is not defined. That value needs to come from
> > Qualcomm or from testing on hardware, which I don't have. Qualcomm
> > needs to chime in to confirm that this Spectre mitigation is correct
> > anyway, though. I'm including this patch so it's obvious that I think
> > these cores also need the mitigation.
>
> Kryo 5xx (SM8250) identify themselves as 0x41/0xd0d (Gold, Prime) and
> 0x51/0x805 (Silver)

Interesting. So the Gold/Prime are actually IDing themselves as
straight Cortex A77. The Silver is IDing itself the same as
KRYO_4XX_SILVER. ...so in that sense there's nothing to do here for
those cores.


-Doug

