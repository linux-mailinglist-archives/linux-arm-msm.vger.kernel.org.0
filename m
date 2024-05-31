Return-Path: <linux-arm-msm+bounces-21196-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id C5BD58D5B8A
	for <lists+linux-arm-msm@lfdr.de>; Fri, 31 May 2024 09:33:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 0310F1C20D6E
	for <lists+linux-arm-msm@lfdr.de>; Fri, 31 May 2024 07:33:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AFB0C74049;
	Fri, 31 May 2024 07:33:29 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-yw1-f179.google.com (mail-yw1-f179.google.com [209.85.128.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4982C74047;
	Fri, 31 May 2024 07:33:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717140809; cv=none; b=hmpEOxyPIhYIRwED+pZ46ATARP7q/nRR77iyUtqrpaCQmdheq/l3mmT+zYzz8Zk+av6tvJ01KUT7tXHesLxAdh65YXHyIow8gsaxpfeRe72KrV+h/OPYYnQzRq+0SbuShE1wwFrcEEwy0rCL+2TNvEQffr3P5/u3G3fiaxCRRmY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717140809; c=relaxed/simple;
	bh=MRK+h1WZYjHuu1URYD6M3YcSUxV8DuY5UvqxFU3Arco=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=fLi41JNFu4vqwRUhFRwSc3PR0Obhd08+Mi4cysWr2+BKcBkApbyr53K/1HjHCu3wpfr5L00uJ1WHBcqUZLM8+9gMHXJ1OkFODj44g9iPH1Km0f3Id0lrEXbA541Jwn/mvkSdfXxussQnvncRK/32aFP8lHvi5IQlFhPH+iCP8ZA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.128.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yw1-f179.google.com with SMTP id 00721157ae682-62a08092c4dso16308297b3.0;
        Fri, 31 May 2024 00:33:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717140806; x=1717745606;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qj6EusQ3A409SsVzLb4gC8GqQaE/mFAcX8PaYZZXXLw=;
        b=JceygU38JHpZckXkKFZCw2qyrNFL0JL+USD0MVdIbGnVUvue+kR3PjiB8XbGdfBsjM
         0KO6CYGiJwycKIksF7nQeM/Ftcp8zoRc6I0r9n4wxUD1rfLwW4d85syCtukMczKjPPoI
         WfbJL1m4o40JGT+HqHKsoiuSZ29oe2Bbv/5inBZXqi3AjbzEaXFwKBCP0ygQcsunvw+l
         uz9Ldp6K4HKEFmjmmHFv6pKNgyA8g2fdpIWkJchLCwYLnv1v8O7WYELnCubxLqjFytDF
         9HhumcwszBYiz8ox+1/wwMu2hgBGEIR0zejHPlw7IRu/97Tb97qAsLblM+MCu0Np5bnU
         bCFw==
X-Forwarded-Encrypted: i=1; AJvYcCWrphmlhzi8QxhBhM1wBFLPzGHb7gcsbzwwb3TIkBX7dnwXu16XayXt3/jV+uuuuWAniqBm14CPm6/yyQGJdoViEs5Vp7K5lMpsEH+q7Tok+zexvsS07JZLzcJFbOAplyc9E6ScXpoDBYVpFlfn655QkEpxpxMbuY4UE2LsDrGDP5tSsCjq90iNuwBVpVYo5GN0zexabVEBh/NjQbbiElsPEg==
X-Gm-Message-State: AOJu0YzJPSI9ZK0tOXDBlsYG1SXaffzzT7a3q4nqzUqaI4YhbGxZhJMV
	aQjCx2YN1D29Hjr1RZ3+NXhhYQVVe0rHxmJXfovGyP/DtsGednhmf+iRGOUt
X-Google-Smtp-Source: AGHT+IFmOC9gyYJlnq2XG+VOY995hsrtRsSVtZMswMEQHLjPlqRyZzDo2GAIE0QjImTFYKu91eqFEg==
X-Received: by 2002:a81:b609:0:b0:622:df58:2cf6 with SMTP id 00721157ae682-62c7982af56mr9370827b3.50.1717140804270;
        Fri, 31 May 2024 00:33:24 -0700 (PDT)
Received: from mail-yb1-f181.google.com (mail-yb1-f181.google.com. [209.85.219.181])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-62c765b8d35sm2404337b3.17.2024.05.31.00.33.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 31 May 2024 00:33:24 -0700 (PDT)
Received: by mail-yb1-f181.google.com with SMTP id 3f1490d57ef6-df4f05e5901so1809109276.0;
        Fri, 31 May 2024 00:33:24 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUfRImCO7HuQMzOP7ify0lkE/bh6P66/iVMUkVlVJ/vZFA4IrZOAaLjxcPvhUJAa0UPYYdJBgH1buRHw7oRfxLGr+Wn21YXa3bkaCxv3TJ+CDl9iBoyacuRRULTzj8bq87DAYgRbKQAlwmQ+6GVZMwBVPJO5YamnZNwDanYatWOx+bDEoDs1kmnE9CKxZrqNlPeQ0y0FO8wikBPNzAirCD8+g==
X-Received: by 2002:a25:d047:0:b0:dfa:56a9:8869 with SMTP id
 3f1490d57ef6-dfa73c48294mr1121789276.34.1717140803859; Fri, 31 May 2024
 00:33:23 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240509-python-version-v1-1-a7dda3a95b5f@linaro.org>
 <87o79faq4a.fsf@meer.lwn.net> <D1N564M136RW.3CRPYTGKMW1NP@gmail.com>
In-Reply-To: <D1N564M136RW.3CRPYTGKMW1NP@gmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 31 May 2024 09:33:12 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVA7MU8LMUW6rR=VWtCDs8erpKgx30woL5eUucRYiK-Fg@mail.gmail.com>
Message-ID: <CAMuHMdVA7MU8LMUW6rR=VWtCDs8erpKgx30woL5eUucRYiK-Fg@mail.gmail.com>
Subject: Re: [PATCH] docs: document python version used for compilation
To: Thierry Reding <thierry.reding@gmail.com>
Cc: Jonathan Corbet <corbet@lwn.net>, Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
	Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>, 
	Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>, 
	workflows@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Masahiro Yamada <masahiroy@kernel.org>, 
	linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	freedreno@lists.freedesktop.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Thierry,

On Thu, May 30, 2024 at 7:07=E2=80=AFPM Thierry Reding <thierry.reding@gmai=
l.com> wrote:
> Alternatively, maybe Kconfig could be taught about build dependencies?

git grep "depends on \$(" -- "*Kconf*"

Gr{oetje,eeting}s,

                        Geert

--=20
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k=
.org

In personal conversations with technical people, I call myself a hacker. Bu=
t
when I'm talking to journalists I just say "programmer" or something like t=
hat.
                                -- Linus Torvalds

