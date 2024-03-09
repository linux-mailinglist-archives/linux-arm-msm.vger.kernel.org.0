Return-Path: <linux-arm-msm+bounces-13757-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 61D738771C4
	for <lists+linux-arm-msm@lfdr.de>; Sat,  9 Mar 2024 16:08:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id E8948B20F71
	for <lists+linux-arm-msm@lfdr.de>; Sat,  9 Mar 2024 15:08:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9FF4243AC4;
	Sat,  9 Mar 2024 15:08:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="TqR+EJKN"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-yb1-f176.google.com (mail-yb1-f176.google.com [209.85.219.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EFAAF40879
	for <linux-arm-msm@vger.kernel.org>; Sat,  9 Mar 2024 15:07:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709996880; cv=none; b=j0BSkbbLSH9Y1Lf9lL7mPfeq2NqT5R2C1oBA0bMRixQgP/PHqrYEqno93jpARRpQ/KwZy0WztdUkQJsx0D92tGWGI3aRVRRvMNc+5SNMFeCOq3q3KQsMJ39Ny9okHNgrBxAKXgYdy6hIrw3cPhliirq3Pt/RXu20RKY9Lq537aM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709996880; c=relaxed/simple;
	bh=4m3hPqMvoFdvGn08wcU+Z5iHs4T7zsjJ+434nMiwhVI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=mqk3eZJ8LQJDDLPMxbQMn6RZDkq41vg0MZzQNFyChQjbhLZRg75JPTn/B4Itt1bVbcB3HFF5BFtkWLISWJNcZ8/vCb5CulN3pluKJUsb5cYmLH9d1xywvxhJI7wGXMA+/6sl5KPcM4Jl6KeymbdHc4N79ePqFcPXMBMkR8kCWLU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=TqR+EJKN; arc=none smtp.client-ip=209.85.219.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yb1-f176.google.com with SMTP id 3f1490d57ef6-db4364ecd6aso1989467276.2
        for <linux-arm-msm@vger.kernel.org>; Sat, 09 Mar 2024 07:07:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1709996878; x=1710601678; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=bsRsreksVUwY3JxwOHcn4AH1bjEDIW9wxkCIfNiLooU=;
        b=TqR+EJKNDp+gRQUVitt30nbxcZzS2rqNKdN/EW1WFiZASHPYmyH7HGRZ5HZnDe7iLp
         WoVqekJKiuY4m/RDLPhqSOqrNCQf2Od2306OJH233a6zyoM+5/8AtdKiLMOrz4bsrbLQ
         cmcfdVJ4cZg01fQQYee6RwoYPMarMi8JqHMbaLRn1jdEbBOVlWY42HQw4kaqE/3gljry
         GUMr5Oq6mAIwYiErzG3kVG7bQXHrEKTTCmTyEzjhcQiS18uakPvaxrbKUUjIMhATDgin
         DINaoiK01V2zKZBslGlGp4SZ+71yIkvbdedGEA21un29Xg5u68fO4Y6YdTcTmolw2tD/
         h6eQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709996878; x=1710601678;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bsRsreksVUwY3JxwOHcn4AH1bjEDIW9wxkCIfNiLooU=;
        b=CcucjMSxVZdX9OgSnEvdTMjmXDGdLjv40nfSu5xeDviBrRrYhbqcDPQ4Px0nZVXI9y
         w0cBUGdPZ8miGgIAncQzH8gtsEKdAmhuw/2tSGe8A1cRmtlVsqoSEJuJU+fx/AaOdXK+
         UPOsSkM3ZudkuwIPZodgASEdkFCQsQ9Wrpx6P8bphcXFc/FKHHQGXqSR7ADSk61spxLI
         a8O+Ijmvz6gLmNZtAEZ+QzY20ar8xkjlUJoJwvi662UcBRgBJgvyupclM19zeYdw6AJu
         80O/c55u7JwIIxlq/fBZXgj/FKV0CLENqYcaZ9otQekPLVFyXoVmGnIlpQ8N8g55jeDB
         uK/A==
X-Forwarded-Encrypted: i=1; AJvYcCUPRWTcLYXqdvTaiTQl0Oz/soUnu+UiMKHu3x8RpLSiaqQyZPksZlTTK7VIMyIVL0dndKoWWnTXcQW257bXOs9xafd0AVouTXX2BepXVA==
X-Gm-Message-State: AOJu0Yyjy6vy9JTmVfVAgMK3kNQjY6eF2Z7nQFD3DvmsZiw36d0pkAhP
	Xvty89qSkRpFwQeya0fq1j1pZXzmdaWrWtwGQxSuPkzX7AlJljgkFlTsIw7VN5JY0YUP0Cdpwfj
	BmTf7iSPQeZGiCC3+uv1BT+sUxNnKyp7BVqR/XQ==
X-Google-Smtp-Source: AGHT+IF0IfT5MeJdtuGLAxcGUPTzOLwhQqEBQY+xRVBBT6xtNAXgDJlcofP3guSftIG+E5LI1hh+Y6ALeP+yMak/1A0=
X-Received: by 2002:a25:6c09:0:b0:dd0:453b:485e with SMTP id
 h9-20020a256c09000000b00dd0453b485emr859326ybc.58.1709996877891; Sat, 09 Mar
 2024 07:07:57 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240306-wcn3990-firmware-path-v2-0-f89e98e71a57@linaro.org>
 <87plw7hgt4.fsf@kernel.org> <CAA8EJpr6fRfY5pNz6cXVTaNashqffy5_qLv9c35nkgjaDuSgyQ@mail.gmail.com>
 <87cys7hard.fsf@kernel.org> <CAA8EJpowyEEbXQ4YK-GQ63wZSkJDy04qJsC2uuYCXt+aJ1HSOQ@mail.gmail.com>
 <87v85wg39y.fsf@kernel.org>
In-Reply-To: <87v85wg39y.fsf@kernel.org>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Sat, 9 Mar 2024 17:07:46 +0200
Message-ID: <CAA8EJpq_XLUEMC67ck2tZRjqS0PazCkQWWMGmwydeWxTETHwcg@mail.gmail.com>
Subject: Re: [PATCH RFC v2 0/4] wifi: ath10k: support board-specific firmware overrides
To: Kalle Valo <kvalo@kernel.org>
Cc: Jeff Johnson <quic_jjohnson@quicinc.com>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, 
	Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konrad.dybcio@linaro.org>, 
	ath10k@lists.infradead.org, linux-wireless@vger.kernel.org, 
	netdev@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org, 
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Content-Type: text/plain; charset="UTF-8"

On Fri, 8 Mar 2024 at 17:19, Kalle Valo <kvalo@kernel.org> wrote:
>
> Dmitry Baryshkov <dmitry.baryshkov@linaro.org> writes:
>
> >> To be on the safe side using 'qcom-rb1' makes sense but on the other
> >> hand that means we need to update linux-firmware (basically add a new
> >> symlink) everytime a new product is added. But are there going to be
> >> that many new ath10k based products?
> >>
> >> Using 'qcm2290' is easier because for a new product then there only
> >> needs to be a change in DTS and no need to change anything
> >> linux-firmware. But here the risk is that if there's actually two
> >> different ath10k firmware branches for 'qcm2290'. If that ever happens
> >> (I hope not) I guess we could solve that by adding new 'qcm2290-foo'
> >> directory?
> >>
> >> But I don't really know, thoughts?
> >
> > After some thought, I'd suggest to follow approach taken by the rest
> > of qcom firmware:
>
> Can you provide pointers to those cases?

https://gitlab.com/kernel-firmware/linux-firmware/-/tree/main/qcom/sc8280xp/LENOVO/21BX

>
> > put a default (accepted by non-secured hardware) firmware to SoC dir
> > and then put a vendor-specific firmware into subdir. If any of such
> > vendors appear, we might even implement structural fallback: first
> > look into sdm845/Google/blueline, then in sdm845/Google, sdm845/ and
> > finally just under hw1.0.
>
> Honestly that looks quite compilicated compared to having just one
> sub-directory. How will ath10k find the directory names (or I vendor and
> model names) like 'Google' or 'blueline' in this example?

I was thinking about the firmware-name = "sdm845/Google/blueline". But
this can be really simpler, firmware-name = "blueline" or
"sdm845/blueline" with no need for fallbacks.

My point is that the firmware-name provides the possibility to handle
that in different ways.

-- 
With best wishes
Dmitry

