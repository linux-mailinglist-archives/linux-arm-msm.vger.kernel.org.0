Return-Path: <linux-arm-msm+bounces-42690-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E60FA9F6B4B
	for <lists+linux-arm-msm@lfdr.de>; Wed, 18 Dec 2024 17:36:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id CE54B7A4097
	for <lists+linux-arm-msm@lfdr.de>; Wed, 18 Dec 2024 16:36:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 869F21F668A;
	Wed, 18 Dec 2024 16:35:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="F/VdIRsY"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-qt1-f182.google.com (mail-qt1-f182.google.com [209.85.160.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC9C11F63C0
	for <linux-arm-msm@vger.kernel.org>; Wed, 18 Dec 2024 16:35:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734539759; cv=none; b=YOEwsJ0ka9xcmPJ99yFFC6bfQySPi10gFnBxqOQSxgJJK/hBkZxvoCgcnUbBN3gK7dmkQd7yWCSdsEnzMZPtniDyBfqGBDZsMzc6/BaJsy0Ij8lNQz8Ba4mizwGHQWoyqFc8x6biOOEkNDtM+lSSgFPPSRqiNlsHKtR6hjBPUhQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734539759; c=relaxed/simple;
	bh=hU1Z8+lcg+ptXSveEoYze+mbRwLw9U4+cd4zYPlrev0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=GCWTYapzUOkU8o3lDXTgtVdjy4yFehg+BoaLX4k3HcIjXv6eYZIK9Qo0lc144GFq/2WNZOjTo6SuXZ9VdQHPba0Ieax20MCxnNX9CA+z+D2Qhs348n2pI0phJcepXaul1GkGcwYhBES8iMfSaqfLNE5W1dj1nKDp0lwGrtDnIzk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=google.com; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=F/VdIRsY; arc=none smtp.client-ip=209.85.160.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-qt1-f182.google.com with SMTP id d75a77b69052e-4678c9310afso272171cf.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 18 Dec 2024 08:35:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1734539757; x=1735144557; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=hU1Z8+lcg+ptXSveEoYze+mbRwLw9U4+cd4zYPlrev0=;
        b=F/VdIRsYwXK1dQbrUcbPT/flAVPHZxisaN0oKSmxc+lqigThPZZVjTORDu+AitL0wX
         0N7+jOX3xMmtkxvBzgt8onR//WtGJtqs8UZCXShPCZw85SvxdcHtv5m9K5EBw8kZGuFp
         +iPG8Tfo4+rd5vycz6MtFxZ9RnwUgiuzguHTU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734539757; x=1735144557;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hU1Z8+lcg+ptXSveEoYze+mbRwLw9U4+cd4zYPlrev0=;
        b=ULqoX+Nmd6G0O0js8Apsp0ocLB9nUv+7trsXjd7zUtt0FhY4K9uPTgK3wgogkTjNKJ
         7qxL0MMHExmLwyyQ9CfE/dayYKyO45fmGCky4eqJc+JGhE777W0Vw1hmg6r+xCPnD2GL
         bUnSj7FqoKGHqZLSx4cAcut+NRXy0a8/OqioB/7tavQJx9vu+fp2nQtmhHgcYgU+Z30k
         jzzqXEfXGU6RFU6CSlrEl5J3RaqjzpK6d7zUn7BGvSFx2fuzx79g2jp2Ptr9saXM7RNm
         Esb05RDYFQApybSaXjkkiY5HlrJmx97Gdl1fpS/6VOibDLkbcf7yf0xl0MpUJajvPFDK
         9XNg==
X-Forwarded-Encrypted: i=1; AJvYcCX9463sGHZuNgpPRpLCMzveWBjZesTWolZbqDP1mVTalPLs2odWo4w0L71F3Qg40dj1wHAW/YKx77niT2sV@vger.kernel.org
X-Gm-Message-State: AOJu0Yx7v3XgHTSdb177YMXF5w+VIJqrllOreYeMItzjFFklbHN9Hakf
	McCnOr67VjqOPT4U+ntz7oB0QJvFleGjy4TEeg1PfC60yMETF5DsRn7WyvsxJL8F1NcJUdnplxj
	K9lj3n+Av0FUIhWdBGj3lW+MfZpRNrWZj3aqN
X-Gm-Gg: ASbGncs6ddj0RWmSd3NHWvmeiIgsNOYC6UVTMl/nSOTDa7Z/sQzYmkYz72zFyEha4PI
	aiOW+Iw9RoKondzHRJRNfItBJu2QBmfpFT58yk1YP/nq1ZNz+bAZwwTv4atOCRdVJ2x0lGw==
X-Google-Smtp-Source: AGHT+IGlf+Wlv9h2+51DeY+YpWsJpttrKLiQ4T5hKVUT5e2IblIuVjyaICps4zat75Zd9spNCR9Zv3byB1374eRD8gw=
X-Received: by 2002:ac8:5f49:0:b0:467:7ef7:88a3 with SMTP id
 d75a77b69052e-469090dc683mr4277431cf.16.1734539756443; Wed, 18 Dec 2024
 08:35:56 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241214005248.198803-1-dianders@chromium.org>
 <20241213165201.v2.1.I2040fa004dafe196243f67ebcc647cbedbb516e6@changeid>
 <CAODwPW_c+Ycu_zhiDOKN-fH2FEWf2pxr+FcugpqEjLX-nVjQrg@mail.gmail.com>
 <CAD=FV=UHBA7zXZEw3K6TRpZEN-ApOkmymhRCOkz7h+yrAkR_Dw@mail.gmail.com>
 <CAODwPW8s4GhWGuZMUbWVNLYw_EVJe=EeMDacy1hxDLmnthwoFg@mail.gmail.com> <CAD=FV=X61y+RmbWCiZut_HHVS4jPdv_ZB8F+_Hs0R-1aKHdK4w@mail.gmail.com>
In-Reply-To: <CAD=FV=X61y+RmbWCiZut_HHVS4jPdv_ZB8F+_Hs0R-1aKHdK4w@mail.gmail.com>
From: Julius Werner <jwerner@chromium.org>
Date: Wed, 18 Dec 2024 17:35:45 +0100
Message-ID: <CAODwPW_UNVkyXKxyhZv830bhzsy5idu6GiuR9mut+-qGOtv1pw@mail.gmail.com>
Subject: Re: [PATCH v2 1/6] arm64: errata: Assume that unknown CPUs _are_
 vulnerable to Spectre BHB
To: Doug Anderson <dianders@chromium.org>
Cc: Julius Werner <jwerner@chromium.org>, Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>, linux-arm-msm@vger.kernel.org, 
	Jeffrey Hugo <quic_jhugo@quicinc.com>, linux-arm-kernel@lists.infradead.org, 
	Roxana Bradescu <roxabee@google.com>, Trilok Soni <quic_tsoni@quicinc.com>, 
	bjorn.andersson@oss.qualcomm.com, stable@vger.kernel.org, 
	James Morse <james.morse@arm.com>, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

> Given that I'm not going to change the way the existing predicates
> work, if I move the "fallback" setting `max_bhb_k` to 32 to
> spectre_bhb_enable_mitigation() then when we set `max_bhb_k` becomes
> inconsistent between recognized and unrecognized CPUs.

A clean way to fix that could be to change spectre_bhb_loop_affected()
to just return the K-value (rather than change max_bhb_k directly),
and then set max_bhb_k to the max() of that return value and the
existing value when it is called from spectre_bhb_enable_mitigation().
That way, max_bhb_k would only be updated from
spectre_bhb_enable_mitigation().

> I would also say that having `max_bhb_k` get set in an inconsistent
> place opens us up for bugs in the future. Even if it works today, I
> imagine someone could change things in the future such that
> spectre_bhb_enable_mitigation() reads `max_bhb_k` and essentially
> caches it (maybe it constructs an instruction based on it). If that
> happened things could be subtly broken for the "unrecognized CPU" case
> because the first CPU would "cache" the value without it having been
> called on all CPUs.

This would likely already be a problem with the current code, since
spectre_bhb_enable_mitigations() is called one at a time for each CPU
and the max_bhb_k value is only valid once it has been called on all
CPUs. If someone tried to just immediately use the value inside the
function that would just be a bug either way. (Right now this should
not be a problem because max_bhb_k is only used by
spectre_bhb_patch_loop_iter() which ends up being called through
apply_alternatives_all(), which should only run after all those CPU
errata cpu_enable callbacks have been called.)

