Return-Path: <linux-arm-msm+bounces-42396-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id E7A1C9F3CC9
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Dec 2024 22:29:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D4191167CA4
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Dec 2024 21:29:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DAC321D47AE;
	Mon, 16 Dec 2024 21:29:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="isnOhTst"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com [209.85.167.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 015C71D4607
	for <linux-arm-msm@vger.kernel.org>; Mon, 16 Dec 2024 21:29:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734384570; cv=none; b=PfHiy6j7LZaXiVYAeGVPnpg8KzJkEXtONwO/lWA3kAlU0KlWpRFlJWJ46NZJDtw8tMnOfKVkeY/oRUIZrTaJGER2JK+jWq8O7ali00jFfmzXf5JYpoyEmprUuFqUr04DnnTcnkxUw1idR0qOMhbdiN5NMu1GDWUIrjApVMRzehM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734384570; c=relaxed/simple;
	bh=G/NWvy/T67wNQqnhJzeR7JlZsIpKitZV5e9Xln/qnac=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=mWwqep24gtEdvOe0Z7OhKUmG2SvU1QIAaYFnHvcllTdox88F6LwlAIHTjr265Eni6URiwNIPkNCSqf7YNpEI/QJMw8OmanwkHyO0IRZTru9iG7nplPNHO2hykrXHyFza5fLP7bBNPIEDa/eLjxYmU39YWtxlv0H1gglFX4gSSTQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=isnOhTst; arc=none smtp.client-ip=209.85.167.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-53f22fd6887so4701687e87.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 16 Dec 2024 13:29:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1734384565; x=1734989365; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=G/NWvy/T67wNQqnhJzeR7JlZsIpKitZV5e9Xln/qnac=;
        b=isnOhTstgGhcEf+8Ubq7BLyCbO+PZIK1YL9Pn9c7aARaYTZ+MD4J8uDgT60xa2EYL3
         NTG6Tutm+UeaPlYOO+w6o9HUEDHk0UvKuv4uMAW+6EbfyBRP7v/q0b5YuQVTC8+TGAb+
         bjrcLZtfZUtI+UuKCsvtfcaEaaNC75xLdUQsM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734384565; x=1734989365;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=G/NWvy/T67wNQqnhJzeR7JlZsIpKitZV5e9Xln/qnac=;
        b=r04tmh6Oh/P1BgSuzm1RLvIElnnydUke4Lews7RFtp5E42LenyI1nDwkbYRhGtMeXz
         d5Nnq1HATUvgtMiiKAaoAo26sexlE1P88AWY2LicKDSZrGQt7kOnADEh+4md1FxBOlKW
         wwSreOQcCYceUnwb0hufdHie9MtmVa9ll1NmYh5v0RkrjkPykmHdmHtCrcaL5p2+sLc9
         f1FvwcWR3f2aH5vsuNfnMxmde6OeT3kF9ovlgu8duWKwnBOhsT4H26x1g2G00Tm4HbQT
         MxT0UdrU/OFubv4VSVDfErLYH8DLQSg39S3O7Apn/zrjbtmgTPL2YRqmL0nNiWy36eH+
         AzIA==
X-Forwarded-Encrypted: i=1; AJvYcCVIIvit3NpedIgwzOJVT8OLvKSWKpY/KxnqyLclg5HIoAsHmHPI14Mr8LV+15x9e5UJaMKXA9JQcDDio51C@vger.kernel.org
X-Gm-Message-State: AOJu0YxRr4Ydmx/JY5RB1Xq7uzdvvfMu+86hROiavMFlcaIAjdDpI61O
	+5ZFq03SwgaRaJ1rRt/AumVK+2jm1LjWXhTW5Fka3eNhIhJ64aRU9wfGARmlIlZ7mtG9nE90jNA
	Zvg==
X-Gm-Gg: ASbGncurL5FdWzqIiW9qD1EVachG0RTfdAmqczwp75ud949a6tHqi9xt25OCIvSy0rD
	MCTFYDM+Dz5Ga3QVHw60pVe+2Lzumq6XaIo3QpNbDX2wYB3A6de1FBVcySYZfmB3wB/ZA1m378X
	lVK5xZ7RwlszJbQy38HaxVQoh5UAOFXyNHTF9igbzMSukGFaotTIguh2p4qCiat2PBDPn/o9CTQ
	rKDrrgypKhfDupkfa/CRQE4GK0CC2i/uFp9CoJEfPKcHrNgOOm6vvgE2ZedDODFz5xgPL+fLJgK
	iZYDnuv39nVn3eItnxO/
X-Google-Smtp-Source: AGHT+IFwIZnEd/hkl3efwDy5dX/B1HYoTXDt/P64VVn74Fh/fgWWYHGuClnhV8MFEBJ4HSpZMtLFuQ==
X-Received: by 2002:a05:6512:108e:b0:540:2567:469b with SMTP id 2adb3069b0e04-54090556d26mr5373929e87.16.1734384564839;
        Mon, 16 Dec 2024 13:29:24 -0800 (PST)
Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com. [209.85.167.42])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54120bffc8csm962761e87.146.2024.12.16.13.29.23
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 16 Dec 2024 13:29:24 -0800 (PST)
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-54024aa9febso4575742e87.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 16 Dec 2024 13:29:23 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCWoyUtZ+HMezW6+IwrYXbn6u5GjOt0lX/TKQ9rTTTN9fNSahx40NZgTbZiHr85HNHEQ1SQ0/moixmNxp+Pk@vger.kernel.org
X-Received: by 2002:a05:6512:b94:b0:540:353a:df8e with SMTP id
 2adb3069b0e04-540905ab051mr4197028e87.39.1734384562829; Mon, 16 Dec 2024
 13:29:22 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241214005248.198803-1-dianders@chromium.org>
 <20241213165201.v2.1.I2040fa004dafe196243f67ebcc647cbedbb516e6@changeid> <CAODwPW_c+Ycu_zhiDOKN-fH2FEWf2pxr+FcugpqEjLX-nVjQrg@mail.gmail.com>
In-Reply-To: <CAODwPW_c+Ycu_zhiDOKN-fH2FEWf2pxr+FcugpqEjLX-nVjQrg@mail.gmail.com>
From: Doug Anderson <dianders@chromium.org>
Date: Mon, 16 Dec 2024 13:29:10 -0800
X-Gmail-Original-Message-ID: <CAD=FV=UHBA7zXZEw3K6TRpZEN-ApOkmymhRCOkz7h+yrAkR_Dw@mail.gmail.com>
X-Gm-Features: AbW1kvbmXu3MO-VJHQBuZxXwEAVNjn8ERCKhnS19UuE5S2BYm8ga04moQxlHz9o
Message-ID: <CAD=FV=UHBA7zXZEw3K6TRpZEN-ApOkmymhRCOkz7h+yrAkR_Dw@mail.gmail.com>
Subject: Re: [PATCH v2 1/6] arm64: errata: Assume that unknown CPUs _are_
 vulnerable to Spectre BHB
To: Julius Werner <jwerner@chromium.org>
Cc: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Mark Rutland <mark.rutland@arm.com>, linux-arm-msm@vger.kernel.org, 
	Jeffrey Hugo <quic_jhugo@quicinc.com>, linux-arm-kernel@lists.infradead.org, 
	Roxana Bradescu <roxabee@google.com>, Trilok Soni <quic_tsoni@quicinc.com>, 
	bjorn.andersson@oss.qualcomm.com, stable@vger.kernel.org, 
	James Morse <james.morse@arm.com>, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

On Fri, Dec 13, 2024 at 6:25=E2=80=AFPM Julius Werner <jwerner@chromium.org=
> wrote:
>
> I feel like this patch is maybe taking a bit of a wrong angle at
> achieving what you're trying to do. The code seems to be structured in
> a way that it has separate functions to test for each of the possible
> mitigation options one at a time, and pushing the default case into
> spectre_bhb_loop_affected() feels like a bit of a layering violation.
> I think it would work the way you wrote it, but it depends heavily on
> the order functions are called in is_spectre_bhb_affected(), which
> seems counter-intuitive with the way the functions seem to be designed
> as independent checks.
>
> What do you think about an approach like this instead:
>
> - Refactor max_bhb_k in spectre_bhb_loop_affected() to be a global
> instead, which starts out as zero, is updated by
> spectre_bhb_loop_affected(), and is directly read by
> spectre_bhb_patch_loop_iter() (could probably remove the `scope`
> argument from spectre_bhb_loop_affected() then).

Refactoring "max_bhb_k" would be a general cleanup and not related to
anything else here, right?

...but the function is_spectre_bhb_affected() is called from
"cpu_errata.c" and has a scope. Can we guarantee that it's always
"SCOPE_LOCAL_CPU"? I tried reading through the code and it's
_probably_ SCOPE_LOCAL_CPU most of the time, but it doesn't seem worth
it to add an assumption here for a small cleanup.

I'm not going to do this, though I will move "max_bhb_k" to be a
global for the suggestion below.


> - Add a function is_spectre_bhb_safe() that just checks if the MIDR is
> in the new list you're adding
>
> - Add an `if (is_spectre_bhb_safe()) return false;` to the top of
> is_spectre_bhb_affected

That seems reasonable to do and lets me get rid of the "safe" checks
from is_spectre_bhb_fw_affected() and spectre_bhb_loop_affected(), so
it sounds good.


> - Change the `return false` into `return true` at the end of
> is_spectre_bhb_affected (in fact, you can probably take out some of
> the other calls that result in returning true as well then)

I'm not sure you can take out the other calls. Specifically, both
spectre_bhb_loop_affected() and is_spectre_bhb_fw_affected() _need_ to
be called for each CPU so that they update static globals, right?
Maybe we could get rid of the call to supports_clearbhb(), but that
_would_ change things in ways that are not obvious. Specifically I
could believe that someone could have backported "clear BHB" to their
core but their core is otherwise listed as "loop affected". That would
affect "max_bhb_k". Maybe (?) it doesn't matter in this case, but I'd
rather not mess with it unless someone really wants me to and is sure
it's safe.


> - In spectre_bhb_enable_mitigations(), at the end of the long if-else
> chain, put a last else block that prints your WARN_ONCE(), sets the
> max_bhb_k global to 32, and then does the same stuff that the `if
> (spectre_bhb_loop_affected())` block would have installed (maybe
> factoring that out into a helper function called from both cases).

...or just reorder it so that the spectre_bhb_loop_affected() code is
last and it can be the "else". Then I can WARN_ONCE() if
spectre_bhb_loop_affected(). ...or I could just do the WARN_ONCE()
when I get to the end of is_spectre_bhb_affected() and set "max_bhb_k"
to 32 there. I'd actually rather do that so that "max_bhb_k" is
consistently set after is_spectre_bhb_affected() is called on all
cores regardless of whether or not some cores are unknown.

