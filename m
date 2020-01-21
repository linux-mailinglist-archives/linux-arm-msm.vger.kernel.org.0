Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 18A30143B0F
	for <lists+linux-arm-msm@lfdr.de>; Tue, 21 Jan 2020 11:34:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728792AbgAUKeT (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 21 Jan 2020 05:34:19 -0500
Received: from mail-oi1-f193.google.com ([209.85.167.193]:41842 "EHLO
        mail-oi1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727220AbgAUKeT (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 21 Jan 2020 05:34:19 -0500
Received: by mail-oi1-f193.google.com with SMTP id i1so2066946oie.8
        for <linux-arm-msm@vger.kernel.org>; Tue, 21 Jan 2020 02:34:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sartura-hr.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=a0MVgCnluJiMvFhGYkbzOfOm4vvDltuuGX2V8bpoeSQ=;
        b=I9D+koBskXL5blj9fOtJPHzQsoaNLIUHVie3LbW4BdqtIgVyV6TWic+D3oDuT1dNAi
         kqSHTeU5fBGb/sm5z0GwKrw/tJV9oiL5HWXlm2MCDA2JDHqQRQGEVJkBUbNDljOIzGTi
         CIAV+RpE6mdzABSRh2A0/73T55d4QY7nZuZdv6w71dAtYPsKX9itDvrONiDM1ydxgD7m
         GwkKwqRHovulmCn4b8C3G590wJ9IkvPpXUf0Jg/AHViwyKXlQdYKLIeXZ/VyeBYXvQ+v
         WvB40Yf8lCByo21io7yVLDgS+PBnki+gIqW/ojvdG43QHR3QQnL7fouRQTji/BumOhVo
         VhHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=a0MVgCnluJiMvFhGYkbzOfOm4vvDltuuGX2V8bpoeSQ=;
        b=pAVBLHcblOw/BSuNO3wiZPqNuj/kOGklM2pfuXdWDJyJqXVcnUswabrmBKwhiCP8GX
         bnZiqJPSDdLvdmRKcrpBF7yHHUlbpkACtTowknG99Ht7RaTEyJN810gO1hfWmCDCpHJI
         KB3Wf8FfskHPEQnnBZeR/HIe4zS20zKy2Qyncs4Ti6O+mfH4PD6noAln/gAxzSLgyCtx
         OY44vrmdywuOeVi0Nu9cFbJTyj020VJb/pp2FJAHBWi7RQKKOe62jisvuthyNpFdAUvp
         LPSXhE16HAkQuszTPMxGWpiG5uEGcB6g0na2KpIxaGMfkO1Q3ISjOf+jae3Apuu97IkK
         CQHQ==
X-Gm-Message-State: APjAAAWU1I6k33/usM9Wl3KIM26A7Wt3DazZ6HShAJQm7dZ24RaA59my
        m+5+nE3yACdhuYsT7do03UEZ6KsdiFaj0d5YyvphEQ==
X-Google-Smtp-Source: APXvYqwxCUTgHCfeET2MXXcfDwKd6srogmeuOy//4ezAASWynGRuaiNf2uhm9j68C5vLFw/71bSa27wWojHBc3Cz0J8=
X-Received: by 2002:aca:4106:: with SMTP id o6mr2431621oia.173.1579602858490;
 Tue, 21 Jan 2020 02:34:18 -0800 (PST)
MIME-Version: 1.0
References: <20200112113003.11110-1-robert.marko@sartura.hr>
 <20200112113003.11110-2-robert.marko@sartura.hr> <20200113144101.GM3897@sirena.org.uk>
In-Reply-To: <20200113144101.GM3897@sirena.org.uk>
From:   Robert Marko <robert.marko@sartura.hr>
Date:   Tue, 21 Jan 2020 11:34:07 +0100
Message-ID: <CA+HBbNEBxw5B2gxJLv6sKrqszymg_ccbW6syZRiEivk+dpFpzA@mail.gmail.com>
Subject: Re: [PATCH 2/3] dt-bindings: vqmmc-ipq4019-regulator: add binding document
To:     Mark Brown <broonie@kernel.org>
Cc:     lgirdwood@gmail.com, robh+dt@kernel.org,
        linux-kernel@vger.kernel.org, agross@kernel.org,
        linux-arm-msm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Mon, Jan 13, 2020 at 3:41 PM Mark Brown <broonie@kernel.org> wrote:
>
> On Sun, Jan 12, 2020 at 12:30:02PM +0100, Robert Marko wrote:
>
> > +  regulator-min-microvolt:
> > +    description: smallest voltage consumers may set
> > +
> > +  regulator-max-microvolt:
> > +    description: largest voltage consumers may set
>
> Why are these explicitly specified in this binding?
You are right, I can simply include them from regulator.yaml
>
> > +  regulator-always-on:
> > +    description: boolean, regulator should never be disabled
> > +    type: boolean
>
> If it's not physically possible to disable the regulator then
> specifying this property is redundant so...
Yes, regulator cant be turned off.
>
> > +required:
> > +  - compatible
> > +  - reg
> > +  - regulator-name
> > +  - regulator-min-microvolt
> > +  - regulator-max-microvolt
> > +  - regulator-always-on
>
> ...requiring it doesn't seem useful.  All the other
> regulator-specific properties shouldn't be required either,
> unless the user specifies a voltage range we won't allow changes
> at all which should be safe and the name is purely cosmetic.
Are bindings even required at all here then?
