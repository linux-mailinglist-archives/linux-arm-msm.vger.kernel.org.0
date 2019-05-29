Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 21E292D571
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 May 2019 08:23:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725903AbfE2GXc (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 29 May 2019 02:23:32 -0400
Received: from mail-lj1-f196.google.com ([209.85.208.196]:35580 "EHLO
        mail-lj1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726120AbfE2GXb (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 29 May 2019 02:23:31 -0400
Received: by mail-lj1-f196.google.com with SMTP id h11so1243809ljb.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 28 May 2019 23:23:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Y1SBl/NhErMiMqrSROQABj44p6n5fylOaEGm2rxHFac=;
        b=oqk/J0AF4QeADPOdicRdeDUwsHkDSXWjWx8dSgJe6kYqicSzaWT6We5F12PmUwMZ65
         LMtry+PPgl9aZ+ehVfQ3aYUPdsUA+0G/0MxVYzVP3GQ7nbyVaWAFtqS14q9Cz/sXTVWw
         WStWmxJlYuL0EZHA9ZLPC+k+8DEk47jsreW/64yj3ouY/mC8ANmDOehvx6T5ccr5eMGf
         1WHWfK+w0dKIuRVlMUYtK5EJTnE70DhNt1doisAzvDA3kA4nYYZdqKIMaavmi3/4P3dM
         OFEXNXqpmonqPRobjHOdNVf7Lw0XFzgEPkX3HUfI1XRrIa4g+PCInqe2zu8U3pN8pT/h
         jBAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Y1SBl/NhErMiMqrSROQABj44p6n5fylOaEGm2rxHFac=;
        b=UZ7vKAyIA1tQcFAlM1uzk/1eFYxLcP1QXYzB2BiD2R4ytVEa7lEauBvI7h6FNcrT0S
         oxN6aHB58fiHnfiohVVgObFjLrE2YET8B1gmn9BnGm9H1At/6iQHkt0wJvl++8+QCvjP
         h1O8M/ncGd3ZcQqaydUO4ho6pbpQtGjMeOXcK1cAd363tE2kxLEuuG/l1vhgJ2gsezcj
         lUaiuL49PCTtkdPurAVgpaxIkBTQ8BmMRm1MYEOEOtj4bO/oofITuyixN12bSfLYmmLL
         Az1WWXj+5PXBHVit9Ki/aZVHLBJMYFUg+GTH36aPlpAOCJB9kQ8iHhAfVHbrhEK4O4Ct
         Mn7w==
X-Gm-Message-State: APjAAAWxY/luGd/s+J+7e0TDmMkORNbYdEbVfZAQfKBYfcyzPO3+wnbG
        SVVD+QjDu3Sg6dvYqWJuoA2TJ8F9YDBQy+0qrru5uQ==
X-Google-Smtp-Source: APXvYqwIsl1wSDxK9EPcOc6HNZDGzaYIXxohtHwHpz4z0RvbNyq1y2+YZmevdVoB7By354baiJgjeTvrt9wKyS/5rzA=
X-Received: by 2002:a2e:8997:: with SMTP id c23mr1321995lji.94.1559111009909;
 Tue, 28 May 2019 23:23:29 -0700 (PDT)
MIME-Version: 1.0
References: <20190509020352.14282-1-masneyb@onstation.org> <CACRpkda-7+ggoeMD9=erPX09OWteX0bt+qP60_Yv6=4XLqNDZQ@mail.gmail.com>
 <20190529011705.GA12977@basecamp>
In-Reply-To: <20190529011705.GA12977@basecamp>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Wed, 29 May 2019 08:23:17 +0200
Message-ID: <CACRpkdZu5KxKTMqAM5rueWbrXbfPNorOOerezCAA3vgAR6cD5g@mail.gmail.com>
Subject: Re: [PATCH RFC v2 0/6] ARM: qcom: initial Nexus 5 display support
To:     Brian Masney <masneyb@onstation.org>
Cc:     Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        "open list:DRM PANEL DRIVERS" <dri-devel@lists.freedesktop.org>,
        MSM <linux-arm-msm@vger.kernel.org>,
        freedreno@lists.freedesktop.org, Dave Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Jonathan Marek <jonathan@marek.ca>,
        Rob Herring <robh@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Wed, May 29, 2019 at 3:17 AM Brian Masney <masneyb@onstation.org> wrote:

> It's in low speed mode but its usable.

How low speed is that?

> I assume that it's related to the
> vblank events not working properly?

They are only waiting for 50 ms before timing out, I raised it
to 100ms in the -next kernel. I'm still suspicious about this
even though I think you said this was not the problem.

For a command mode panel in LP mode it will nevertheless
be more than 100ms for sure, the update is visible to the
naked eye.

Raise it to 10000 ms or something and see what happens.
drivers/gpu/drm/drm_atomic_helper.c:
 msecs_to_jiffies(50)

Yours,
Linus Walleij
