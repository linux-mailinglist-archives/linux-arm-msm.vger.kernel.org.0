Return-Path: <linux-arm-msm+bounces-15068-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id CBE9288AB95
	for <lists+linux-arm-msm@lfdr.de>; Mon, 25 Mar 2024 18:27:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 0435D1C37CE2
	for <lists+linux-arm-msm@lfdr.de>; Mon, 25 Mar 2024 17:27:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A1A5E13048D;
	Mon, 25 Mar 2024 16:20:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="n19dpSU2"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ot1-f45.google.com (mail-ot1-f45.google.com [209.85.210.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 187D312FB32
	for <linux-arm-msm@vger.kernel.org>; Mon, 25 Mar 2024 16:20:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711383613; cv=none; b=kfwIRdSJN3aZF7Lgf9to0enFnBgqFDql9zLy8QwJu1E2OcrGOZZihXGhBYEO7srC93SPuL/USeMcyp8dgLTDNKBV3AOpPAqTP5ivht6YKnAkQq6qJNRZngyMerJJAJImdHwhAQ/pZChAqfzkIlO0zVD67kD7VQBOBjHcu9zEIL4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711383613; c=relaxed/simple;
	bh=A843Ssrq3Y9wYnaYppe8XjmG2PpCDGW6HiDXf0QJKws=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=YjtPJ6AZM5DsBNYRKd1N8W4jmlSQOclSrjPtl6z1j4xzjmSP1IWmLoFDwKShd2fqNVwvQQHHgNI/gCVG7AO7TM8C2BVXVHDB9m+hzyRUd8yCPDhbfxBuLC1lHMhcxHkProDesNGkPns6dJBhJSHK00zhXkRxnNKTZ3JG0ww5Rm4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=n19dpSU2; arc=none smtp.client-ip=209.85.210.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-ot1-f45.google.com with SMTP id 46e09a7af769-6dc8b280155so2755811a34.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 25 Mar 2024 09:20:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1711383609; x=1711988409; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=O9xAtZXJvpwpsev5gWghEp0MSIRB0SQuoLdXgBJreDE=;
        b=n19dpSU249zLiPm5edX5Zp2uHEo3MCkOcxs2fSxJybq6D7AinHeGetOAXgwzGEtTAS
         yn948OrHgMhG6D0oLEuw7ZN7//CKVGgSvEOuIF8ADc+jZly5EbkMkhfjeXUk0gLTYMWS
         Pa5oB7+l9N+TT/8dqvJcRXibDS/KVKTYsqQ6o=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711383609; x=1711988409;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=O9xAtZXJvpwpsev5gWghEp0MSIRB0SQuoLdXgBJreDE=;
        b=h4JGsYBYwaiyo292gUvo6C6NINC6frFtrCDl+UoaVuw98ddS6X/5jCuAsUikRiNrRP
         HDz2cKFiLo20KpkZf7TuOa2faHCf1xWTfEJTzE3WZSW+nCifCtwg1PFiLzz34oCTONoK
         dP9CRoEjIviz7QRL3krjc8HqZGJzEv1AW0wgyUuo3H6orT5D+wup4J4BnaNdqCWYwFOt
         f5DukQEguhW5UFcUF2X1lqZy84CD9/gkdYqYTIRfhph7tDytORdyvcRlWGsWjzwfvjIC
         Az4OnqtnazjYBWv7OyKOq6SWuUDqJSp+C3C+YBTpF9fIJhAoSEhrjmc/LHeTLWOoG4WS
         9vUg==
X-Forwarded-Encrypted: i=1; AJvYcCWxSY61Zkiz5wziPUX7kVBbqDuxU4JqjZD6RTvtBB92zHVDcnPzdLaUSNykzC6rzkI14nQQULT8ETeZbekHmahRrJyTj2x05rGv/Dm2tQ==
X-Gm-Message-State: AOJu0YyxwrCCVxGrCHXVZD09DsjJcPGX1pSK4QAQ7B/TUJzVSfxjJphs
	PnsoUnejXpidghJeXgGDqDMSpbmnzTMGVvVk8VfIAaQNYo4C0E1UnVooGqN48oJWqvEMnddhhCA
	=
X-Google-Smtp-Source: AGHT+IHShUVJUINwPkB08JgKVy5186OQ6nNNfo0qIOcFyc7gTArAWzqXH43l2XVw3GubqxK+TYSFmQ==
X-Received: by 2002:a05:6870:9714:b0:229:cea1:243e with SMTP id n20-20020a056870971400b00229cea1243emr7304938oaq.0.1711383608940;
        Mon, 25 Mar 2024 09:20:08 -0700 (PDT)
Received: from mail-qt1-f178.google.com (mail-qt1-f178.google.com. [209.85.160.178])
        by smtp.gmail.com with ESMTPSA id n16-20020ac86750000000b00431665237f0sm198830qtp.47.2024.03.25.09.20.08
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 25 Mar 2024 09:20:08 -0700 (PDT)
Received: by mail-qt1-f178.google.com with SMTP id d75a77b69052e-431347c6c99so487761cf.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 25 Mar 2024 09:20:08 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCX+qtT6b0B2eNNbXKZdu474Uxl1jOXPszyrB4I8Loh07ajdfkVq992zL0mVPcXsSek5qtpIbxBJj8+MikVZQeNo72hfcmMWwDvUNP8bsA==
X-Received: by 2002:a05:622a:3c7:b0:430:a5df:a3af with SMTP id
 k7-20020a05622a03c700b00430a5dfa3afmr1093586qtx.5.1711383607574; Mon, 25 Mar
 2024 09:20:07 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240325054403.592298-1-sboyd@kernel.org> <20240325054403.592298-6-sboyd@kernel.org>
In-Reply-To: <20240325054403.592298-6-sboyd@kernel.org>
From: Doug Anderson <dianders@chromium.org>
Date: Mon, 25 Mar 2024 09:19:51 -0700
X-Gmail-Original-Message-ID: <CAD=FV=X13_5Kubq3A=y8gnz==6tt2bsfc0PiFAj06HX9V7_+mg@mail.gmail.com>
Message-ID: <CAD=FV=X13_5Kubq3A=y8gnz==6tt2bsfc0PiFAj06HX9V7_+mg@mail.gmail.com>
Subject: Re: [PATCH 5/5] clk: Get runtime PM before walking tree for clk_summary
To: Stephen Boyd <sboyd@kernel.org>
Cc: Michael Turquette <mturquette@baylibre.com>, linux-kernel@vger.kernel.org, 
	linux-clk@vger.kernel.org, patches@lists.linux.dev, 
	linux-arm-msm@vger.kernel.org, Taniya Das <quic_tdas@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

On Sun, Mar 24, 2024 at 10:44=E2=80=AFPM Stephen Boyd <sboyd@kernel.org> wr=
ote:
>
> Similar to the previous commit, we should make sure that all devices are
> runtime resumed before printing the clk_summary through debugfs. Failure
> to do so would result in a deadlock if the thread is resuming a device
> to print clk state and that device is also runtime resuming in another
> thread, e.g the screen is turning on and the display driver is starting
> up.
>
> Fixes: 1bb294a7981c ("clk: Enable/Disable runtime PM for clk_summary")
> Cc: Taniya Das <quic_tdas@quicinc.com>
> Cc: Douglas Anderson <dianders@chromium.org>
> Signed-off-by: Stephen Boyd <sboyd@kernel.org>
> ---
>  drivers/clk/clk.c | 6 +++++-
>  1 file changed, 5 insertions(+), 1 deletion(-)

Shouldn't this also squash in a revert of commit 1bb294a7981c ("clk:
Enable/Disable runtime PM for clk_summary")? As it is,
clk_summary_show_subtree() is left with an extra/unnecessary
clk_pm_runtime_get() / clk_pm_runtime_put(), right?

Other than that, this looks good to me:

Reviewed-by: Douglas Anderson <dianders@chromium.org>

