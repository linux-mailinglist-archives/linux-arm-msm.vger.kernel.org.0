Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A291DA56EA
	for <lists+linux-arm-msm@lfdr.de>; Mon,  2 Sep 2019 15:01:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729953AbfIBNBm (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 2 Sep 2019 09:01:42 -0400
Received: from mail-lj1-f196.google.com ([209.85.208.196]:32987 "EHLO
        mail-lj1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729770AbfIBNBm (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 2 Sep 2019 09:01:42 -0400
Received: by mail-lj1-f196.google.com with SMTP id z17so12832341ljz.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 02 Sep 2019 06:01:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=5NR6SvqKZT8L7ZtanApWaNMwb/LKNTFMGGSxMB6t2dk=;
        b=bGuiQvFbYJWc9O7OONGeyRj9kfrDmMmvY/nKW221nA3ldxyh17lVPvcxl+/ltWNeXg
         jENWFnEjUX3HX5mWR4sBd4vwTZN8334r1qqD2Dmvv9JgSUm/LLekdNCq9rjSWoHF4xY/
         VDH0VIXtFW+rA1Sqb2VEakMkCmN4BsSi5LvumP88szkjYrIXLy+R+FSwzqlPWig4ohGK
         AOH4A1E8uf3g7Jg4wlGXZ8kEALQNREsvqAmPKLTLSJhPLp8IGS3r2nLGgpn5bMK9Vswe
         Pqrzl+dqNvqtb/Ie4ZtE1B6y2QNvW9f/fi1tgKgn8gwDmPOQTnP3OazT7cA2+UEfDi+H
         MFKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=5NR6SvqKZT8L7ZtanApWaNMwb/LKNTFMGGSxMB6t2dk=;
        b=bpvhORlpXLtkPCDQuOkvy9HYykL270mPklOBsvm6dHifnETiBF42VsvIRXUP6H+oTH
         9+8tT9zvq4wJGLwEuxB2/J0ZGhQtHi0BQwGZHZ0TyZFk1JD0EfzhSeVU+eMJalfOkASk
         3srczRSdBJIoAXdemgzZlVyxHX/yTho2xygB6qKQcHWbrzGWL2yu5babzGyGrCrlJEAX
         gHZmbG/bwc0JEaAwve+mXK6RSyz0EKAgU2yN0TLofJONTLZOAtnjyPSVhRI1r5JaAbl1
         CHOfGvyFasyJVwkSFLNpBoy+vwzhSsADaTOwvgu8Ty75mcrpr7TiAGhnl80kB29/G2xK
         WAxA==
X-Gm-Message-State: APjAAAWxG/m4LNxxaqm4rUIwraCeB2BVce+hrKoRpYKu4+LImx0h7NJH
        i0jndyp4kFnUZFoB2EaQSepROf4OHEifTnKHQ5vIkImIxRw=
X-Google-Smtp-Source: APXvYqxF27ULThXbJYCc6j0IIoVfgOfuo8St/uOkqnhFcc5aJJkkUk/jebNzy01Hbjqux/cfhiZnA41Nn6YMdw1FVf8=
X-Received: by 2002:a05:651c:28c:: with SMTP id b12mr16399878ljo.69.1567429300022;
 Mon, 02 Sep 2019 06:01:40 -0700 (PDT)
MIME-Version: 1.0
References: <20190823073448.8385-1-linus.walleij@linaro.org>
 <20190823073448.8385-5-linus.walleij@linaro.org> <CAF6AEGvPtoEfAsB0KSP3ydmHGTdwnnM--Ru+dUY+7EEpw_8v_g@mail.gmail.com>
In-Reply-To: <CAF6AEGvPtoEfAsB0KSP3ydmHGTdwnnM--Ru+dUY+7EEpw_8v_g@mail.gmail.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Mon, 2 Sep 2019 15:01:28 +0200
Message-ID: <CACRpkdYVwBsr+_vpFPytYZ+432ofm50RWZcGPTVvm-vnXp57fg@mail.gmail.com>
Subject: Re: [PATCH 5/6 v2] drm/msm/hdmi: Bring up HDMI connector OFF
To:     Rob Clark <robdclark@gmail.com>
Cc:     Sean Paul <sean@poorly.run>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        freedreno <freedreno@lists.freedesktop.org>,
        dri-devel <dri-devel@lists.freedesktop.org>,
        Brian Masney <masneyb@onstation.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Sun, Sep 1, 2019 at 6:28 PM Rob Clark <robdclark@gmail.com> wrote:

> I'm picking up the earlier patches in this series..

Thanks a lot :)

> although I won't
> have a good way to test on devices which use the hdmi block for a few
> weeks (when I complete my move, and get back a bunch of boards that
> are in boxes right now) so I'm going to wait on the last two I think.

That's fine. It is just occasional drive-by coding anyway.

Yours,
Linus Walleij
