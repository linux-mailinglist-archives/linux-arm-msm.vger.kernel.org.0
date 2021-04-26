Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2233636B57F
	for <lists+linux-arm-msm@lfdr.de>; Mon, 26 Apr 2021 17:12:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234009AbhDZPMr (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 26 Apr 2021 11:12:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56314 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233674AbhDZPMq (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 26 Apr 2021 11:12:46 -0400
Received: from mail-qk1-x72f.google.com (mail-qk1-x72f.google.com [IPv6:2607:f8b0:4864:20::72f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7177CC061574
        for <linux-arm-msm@vger.kernel.org>; Mon, 26 Apr 2021 08:12:05 -0700 (PDT)
Received: by mail-qk1-x72f.google.com with SMTP id k127so1180519qkc.6
        for <linux-arm-msm@vger.kernel.org>; Mon, 26 Apr 2021 08:12:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=FmQ64T7yXc3Ewnqdqh0mZJFxFCTNDss0IH0vgoriwhU=;
        b=dscMyYbyFe5m9GUC+m/ly92AKKNY90yRuigrvZLG4ulZEuX9APwRcKYdBdjMAirZac
         2QAL0nuWKQeE18lHEQ+7tqWNM49OKdJgF1atj4WpFXp3vrEjmdgXjOSFqL0rmLGO/30U
         IkDteCR+6lzf1oz7Dc/4j+GVL58LeaQWqSmL8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=FmQ64T7yXc3Ewnqdqh0mZJFxFCTNDss0IH0vgoriwhU=;
        b=P+JJ6E/ICmnaUuihLS0gi0kq6EHSdt6BICqOv4odmyfMjMowf3RZX4gjMHpCfPooJX
         0WEt7ZKp6vgWuF0l3nBYLf3Xoch6U3mXr3Y0LDXDVdfAkihiNGPy3wbQWO4YZgYPFxcI
         RSymIT403ZuOnqPME/QaN1B6ds/OHFcFJ3yUmWaFrbvgqcVqLl+9LVmm3YC/9YdbBYKd
         0++AqeMEknbw4mMVsbMLT14Jq2qJyU6Y5pHssc6Qi8VcS42rQwipkTk63XswIVtCwzCF
         Q0D+o3bqhYsKCsfgDNynAPPB0jER/DWyqyW3hz53Ic7La/T8n+GC7cHenT9D75Q83i5z
         PZMg==
X-Gm-Message-State: AOAM532cb8hRSKNQfLTo2ppbANljyPSAOTPPPO42ntdGTc3/0JqP0fzS
        9QGSBsONNrMX2ExtEV8klChY9DGTRe56FA==
X-Google-Smtp-Source: ABdhPJylC0GDv5j1XzB38bi5WTytphqA0abHpsv+ZQsuJ+BREJr7haFfq5Ty1baNyVK0gEJ1uVcgzA==
X-Received: by 2002:ae9:e886:: with SMTP id a128mr18044271qkg.20.1619449924299;
        Mon, 26 Apr 2021 08:12:04 -0700 (PDT)
Received: from mail-yb1-f173.google.com (mail-yb1-f173.google.com. [209.85.219.173])
        by smtp.gmail.com with ESMTPSA id h8sm3034789qtp.47.2021.04.26.08.12.03
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 26 Apr 2021 08:12:03 -0700 (PDT)
Received: by mail-yb1-f173.google.com with SMTP id p3so44625262ybk.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 26 Apr 2021 08:12:03 -0700 (PDT)
X-Received: by 2002:a25:cc0b:: with SMTP id l11mr13831192ybf.276.1619449923205;
 Mon, 26 Apr 2021 08:12:03 -0700 (PDT)
MIME-Version: 1.0
References: <1619161503-8784-1-git-send-email-rnayak@codeaurora.org> <73945e7037ab61eb34a2a1af05aa3eef75c8f836.camel@perches.com>
In-Reply-To: <73945e7037ab61eb34a2a1af05aa3eef75c8f836.camel@perches.com>
From:   Doug Anderson <dianders@chromium.org>
Date:   Mon, 26 Apr 2021 08:11:52 -0700
X-Gmail-Original-Message-ID: <CAD=FV=WHqoeFsqq09fz_r_viBnKuwiTyAez7VaU5ZBFu71fWvg@mail.gmail.com>
Message-ID: <CAD=FV=WHqoeFsqq09fz_r_viBnKuwiTyAez7VaU5ZBFu71fWvg@mail.gmail.com>
Subject: Re: [PATCH] nvmem: qfprom: minor nit fixes, no functional change
To:     Joe Perches <joe@perches.com>
Cc:     Rajendra Nayak <rnayak@codeaurora.org>,
        Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>,
        "Ravi Kumar Bokka (Temp)" <rbokka@codeaurora.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi,

On Fri, Apr 23, 2021 at 8:13 AM Joe Perches <joe@perches.com> wrote:
>
> On Fri, 2021-04-23 at 12:35 +0530, Rajendra Nayak wrote:
> > Fix a missed newline, and update a comment which is stale
> > after the merge of '5a1bea2a: nvmem: qfprom: Add support for fuse
> > blowing on sc7280'
> > No other functional change in this patch.
> []
> > diff --git a/drivers/nvmem/qfprom.c b/drivers/nvmem/qfprom.c
> []
> > @@ -195,7 +196,7 @@ static int qfprom_enable_fuse_blowing(const struct qfprom_priv *priv,
> >       }
> >
> >       /*
> > -      * Hardware requires 1.8V min for fuse blowing; this may be
> > +      * Hardware requires a min voltage for fuse blowing; this may be
> >        * a rail shared do don't specify a max--regulator constraints
>
>                          so don't?
>
> >        * will handle.
> >        */
>
> but the comment doesn't make much overall sense to me.

What part of it doesn't make sense, exactly? Basically there's an
external regulator (voltage rail) that can be programmed to a range of
voltages. For simplicity, let's assume 1.7, 1.8, and 1.9 V. That
regulator powers several things on the board / SoC. The places where
the rail is hooked up can function over some range of voltages. Maybe
some of the things it's hooked up with function fine between 1.6V and
1.9 V. Some between 1.6V and 1.8V. Some between 1.8V and 1.9V. For
power savings we generally want the voltage rail to be as low as
possible.

In this case, the efuse hardware (and everything else the rail is
hooked up to) work fine with a lower voltage, except when you're
programming the efuse. When the efuse needs to be programmed then it
needs a higher voltage. Thus, normally, the system is allowed to run
this rail at some lower voltage. Maybe 1.7V. When we want to program,
though, we've got to run it at 1.8V (or something higher on a new
SoC).

In general it's up to the board-level regulator constraints to keep
everything happy. The person designing the board should setup a
minimum and maximum voltage for each rail to make sure that no
components are run at too high of a voltage or too low of a voltage.
Presumably those board-level constraints take into account the voltage
level needed to read the efuse and also take into account the maximum
voltage so we don't damage the efuse.

-Doug
