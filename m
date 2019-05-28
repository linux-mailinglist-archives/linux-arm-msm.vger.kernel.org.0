Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 007E72C812
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 May 2019 15:46:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727545AbfE1Nq2 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 28 May 2019 09:46:28 -0400
Received: from mail-lf1-f65.google.com ([209.85.167.65]:42315 "EHLO
        mail-lf1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727039AbfE1Nq1 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 28 May 2019 09:46:27 -0400
Received: by mail-lf1-f65.google.com with SMTP id y13so14614783lfh.9
        for <linux-arm-msm@vger.kernel.org>; Tue, 28 May 2019 06:46:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=uimJHxg6x5yQ0SkHYR4jhNo2jzcs/560scjjidJxXaA=;
        b=wIhuxC/qafCCzj9xj0e1GyrPTHQ9LBOu5VnQiwMSnJKjudJatYnjbRzVzl7upG0ngG
         cWtzKZmvp4vPIiRmvem2OWDEplCrgRfOuYzeq7EjL6eblc1GzwDuuKZ/uZmXUkyNAH6M
         h9ICrKl5D7CVaL58rjVCvLBqaPUOu/RAf73EcQDaGcodz0JIMVeJAaFbOlYrV7vaY7hb
         QOvaCL5bfa8tmpaGCOdUxmeU8tEyo+OhnsBwZdL+LTvxyjKmLP60bPkiyBYGH1eR6nw8
         87ZbuRmU9ShywtYnKzjS+OIQJmbJ9jsjjuUx2i0hIDJr5LWtHvg2bAOY8ivWaoxDmWM0
         b3Yg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=uimJHxg6x5yQ0SkHYR4jhNo2jzcs/560scjjidJxXaA=;
        b=Q/VlkjAcbMivA+M/IvM5VBvcYjLboGrpUFbqu6uZoDgetT7VOkTf068SFOTWxYDKW9
         7/Vgw/Oa5qev0FZZ7kkIBGR3+wGzcBzOkJnpNh279pRNT+VmiRdJukbmrLLR4Zwj+/YZ
         UmYhdesDvoMbgMuyNPNf2EZmenBxxqQk34UzpoOXGrFs91UGPSk1IoeMXsXCtcxy78Xm
         f/Q6ZpAVaxtifJlbjga9asTfHFnzfWyz2FaZg7xW1UEAveBYttLXIZ9qcHf5R7xb7UKY
         Kt4Mgrp3jJQslG5s7NFB8AUEruftWJN3jgObhfj9BMhYjjP5N74rfX7ZpilnFA1fykrA
         m23A==
X-Gm-Message-State: APjAAAWmDvD/6robh0bKn1Dhd/iBoPw1fBPdrWZLtM5rZFClqB9HJoM7
        vNH9GOMK3xYoy8Y/hpB5RIKyoZvSjzxpL9HGXiTivA==
X-Google-Smtp-Source: APXvYqy4gMwzBlvFh/Ib5gpRrpfYM0F0Z553OBKhHwqFjc4A6FVcEqQkL1jjwcIYhdWJgpLzcJ0GmyoVFzYPjUkcRek=
X-Received: by 2002:ac2:48ad:: with SMTP id u13mr33425124lfg.60.1559051186146;
 Tue, 28 May 2019 06:46:26 -0700 (PDT)
MIME-Version: 1.0
References: <20190509020352.14282-1-masneyb@onstation.org>
In-Reply-To: <20190509020352.14282-1-masneyb@onstation.org>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Tue, 28 May 2019 15:46:14 +0200
Message-ID: <CACRpkda-7+ggoeMD9=erPX09OWteX0bt+qP60_Yv6=4XLqNDZQ@mail.gmail.com>
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

On Thu, May 9, 2019 at 4:04 AM Brian Masney <masneyb@onstation.org> wrote:

> Here is a patch series that adds initial display support for the LG
> Nexus 5 (hammerhead) phone. It's not fully working so that's why some
> of these patches are RFC until we can get it fully working.
>
> The phones boots into terminal mode, however there is a several second
> (or more) delay when writing to tty1 compared to when the changes are
> actually shown on the screen. The following errors are in dmesg:

I tested to apply patches 2-6 and got the console up on the phone as well.
I see the same timouts, and I also notice the update is slow in the
display, as if the DSI panel was running in low power (LP) mode.

Was booting this to do some other work, but happy to see the progress!

Yours,
Linus Walleij
