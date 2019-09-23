Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 16EAABAC34
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Sep 2019 02:45:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730405AbfIWAp2 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 22 Sep 2019 20:45:28 -0400
Received: from mail-io1-f67.google.com ([209.85.166.67]:42714 "EHLO
        mail-io1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730404AbfIWAp2 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 22 Sep 2019 20:45:28 -0400
Received: by mail-io1-f67.google.com with SMTP id n197so29373862iod.9
        for <linux-arm-msm@vger.kernel.org>; Sun, 22 Sep 2019 17:45:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=cqpLn56ftCZ3D2OqkmnD8h0ixYYYiXCXrh0JwWenL8g=;
        b=ZeuGpGJpAEjBfJH1N0u9mPuHqif+b2Bn6YI+YUXHDTbISBlqC9ugWAA7U9re1L7n6R
         y5FQ9jU4LTv48aDVAbzB2EDkg+laBqcqrP+gDJ9pJv1TRzjvmmVm5fzzZf7cCLCZc3jw
         tg/1QUn7X9uDWRQ7B6M3Bk/VFQjowuFxQv8x13IwlrW0DSack9yxox+EeTuShX5tIVjH
         My5TlFBVlnocLhrlBJq4CRUkDLYnuNPw1/NF2kT4hrkwXezaguaRSRyd3jR70KtUjeGO
         ahVHOtq49iKv5pmA7f2cBdqwrKqfjv4bH1ukkpgyqSjRIGikYwuEHsE+Z2U1Utekx8Q0
         FVmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=cqpLn56ftCZ3D2OqkmnD8h0ixYYYiXCXrh0JwWenL8g=;
        b=tBk+4EWGUFjbipo1xDoMpE5pH9sujC1wRePx488m4VJZUo26VjPnewugnnwLTw530q
         hUPA2qfvjISisCQcY84vM83EUGJ7qOLcOb7/Klto8tB6EeCCpmJQMVR+aOsUY9bbHU/M
         EGWfwcMgG73x0TJW7tfE7y+VGpsEo/RAfKbZtYgk+xFPVrmYzveb2m2bADN9mriA8vDK
         USPPKCyuajF0PoH/mL8qSqj50w6Gj7b8Gh05LPUtklEy9UsbYW0AvVVTPECl2n4uxh1n
         GFDm6F1jYiM2424Gz+2YzqxM3876Ft1/Z7aN2Ek80YHkdBEDQrzKx2eLSOswwAYLg2h8
         GoeQ==
X-Gm-Message-State: APjAAAXUUT65QUN4p8F0vnhAT471c7UzuAnVB7zP+VC3OR2EkZ4Rs87C
        GdEOBHcs2gDnTlCyaXpwszJtxmZQLz1rb0di9NU=
X-Google-Smtp-Source: APXvYqyMIbEO0sNm1MdaPV8JwkGnFJVnNrH75QeI6zGjPiZYD5y/r31davFH2Y7jcs+UrwZ8FTBhPw2LDZOVWvLcZHk=
X-Received: by 2002:a5e:a712:: with SMTP id b18mr16874651iod.263.1569199527197;
 Sun, 22 Sep 2019 17:45:27 -0700 (PDT)
MIME-Version: 1.0
References: <20190921100439.64402-1-kholk11@gmail.com> <20190921100439.64402-2-kholk11@gmail.com>
In-Reply-To: <20190921100439.64402-2-kholk11@gmail.com>
From:   Jeffrey Hugo <jeffrey.l.hugo@gmail.com>
Date:   Sun, 22 Sep 2019 18:45:16 -0600
Message-ID: <CAOCk7NrAoZw3NDPoW-f+Od+zb6WXav7OqGqoGJR3vcV8doTSqw@mail.gmail.com>
Subject: Re: [Freedreno] [PATCH 1/5] drm/msm/mdp5: Add optional TBU and TBU_RT clocks
To:     kholk11@gmail.com
Cc:     MSM <linux-arm-msm@vger.kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        freedreno <freedreno@lists.freedesktop.org>, marijns95@gmail.com,
        Jonathan Marek <jonathan@marek.ca>,
        Dave Airlie <airlied@linux.ie>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "open list:DRM PANEL DRIVERS" <dri-devel@lists.freedesktop.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Clark <robdclark@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Daniel Vetter <daniel@ffwll.ch>,
        Thomas Gleixner <tglx@linutronix.de>,
        Sean Paul <sean@poorly.run>,
        Georgi Djakov <georgi.djakov@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Sun, Sep 22, 2019 at 8:16 AM <kholk11@gmail.com> wrote:
>
> From: "Angelo G. Del Regno" <kholk11@gmail.com>
>
> Some SoCs, like MSM8956/8976 (and APQ variants), do feature these
> clocks and we need to enable them in order to get the hardware to
> properly work.
>
> Signed-off-by: Angelo G. Del Regno <kholk11@gmail.com>

I don't see these clocks documented in the mdp5 DT bindings document.
They need to be added in the DT first.
