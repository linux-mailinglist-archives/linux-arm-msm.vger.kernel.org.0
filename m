Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D91E78E6A7
	for <lists+linux-arm-msm@lfdr.de>; Thu, 15 Aug 2019 10:36:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730682AbfHOIft (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 15 Aug 2019 04:35:49 -0400
Received: from mail-lf1-f65.google.com ([209.85.167.65]:38540 "EHLO
        mail-lf1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731075AbfHOIfp (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 15 Aug 2019 04:35:45 -0400
Received: by mail-lf1-f65.google.com with SMTP id h28so1150437lfj.5
        for <linux-arm-msm@vger.kernel.org>; Thu, 15 Aug 2019 01:35:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=LckeMEL++L98xkE6bRHUomn8itgtRqdrAYiiSW7aPt8=;
        b=jPedfFTQpgM6N16VFCMmcxfHRcTAvQLEVyl2L+pi2uNbG2bAZTYPJy6zsyYd/zsq75
         qLGM6kd/VOPA6/+zGy4f2K6XHTk26IBdEHY/QLWxecOs/9lvtdbmOJfZwKIQJ7DlE+sE
         YPADIXmnziNit+bcqcv1rMbb3OPAfelMCc27OtpaNVFdT2cms0GzvMd1b8R0vzNSkYZj
         89bhsFLRmjCXBeGnfb0+txiyL5JPTobZE1xPE4SJnCl4HZqvVhB6UcxWPwOK7DObetSQ
         fffSbk6TjILxq9Q88zUiRn1VeY8FagM25tADUr0X8nG874svkQvTRhpsxvLxr4M5G22L
         rQ2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=LckeMEL++L98xkE6bRHUomn8itgtRqdrAYiiSW7aPt8=;
        b=V/kDPPZ6d892VT4K9fLGV6t0fiMPEunnnHuCWyqz9TVSJbcHoh300QoXHWflbrGALp
         nOlj0iRUcycikCR5iY1ubm0BKD3sjS7RYm8KGb57NbhvbjFnAq5yzPwumDZYb7MeZ9iM
         xh0/aIP9dW/KnemMpxkylVgoQ6EDgajDcv1b04DFIbqTVawo9l0DYScgI34AOZjpuNC2
         r/VhebTb5w20bGziixGU6kmu9GRYBotjN9t1S4CMA9IL6etJt2zSf+o7hWgAUcFqhJKD
         Pyy5Ruth2aeiBeMd/2Vy6p1y2wABURwkkEvq453wSbFDvpGzHUhQ3fnRGsgtRT1Y1IR3
         6GgQ==
X-Gm-Message-State: APjAAAU8bqiFPvdJgq0THYp54VhLpTV+UxjixDsQpcZF5GSEZ99PJQi6
        bdKe5P5V8Jp/7YHQDDF15wvWocd/M9w4GzWzKTUG3w==
X-Google-Smtp-Source: APXvYqwK1EXF1OlxOI1zDtBRCI1LlnDOnp15wcax8wzG7tnNStvRwTaXt1N5txPI2Ni93wI6DJH8/9XBc1qmOdGdFeU=
X-Received: by 2002:a19:ed11:: with SMTP id y17mr1783154lfy.141.1565858143676;
 Thu, 15 Aug 2019 01:35:43 -0700 (PDT)
MIME-Version: 1.0
References: <20190815004854.19860-1-masneyb@onstation.org> <20190815004854.19860-9-masneyb@onstation.org>
In-Reply-To: <20190815004854.19860-9-masneyb@onstation.org>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Thu, 15 Aug 2019 10:35:31 +0200
Message-ID: <CACRpkdavMPW1gv8jGUJb-48+=9XCmT=_bsMQFEx3Tk06aQNcAA@mail.gmail.com>
Subject: Re: [PATCH 08/11] drm/msm/hdmi: silence -EPROBE_DEFER warning
To:     Brian Masney <masneyb@onstation.org>
Cc:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Andy Gross <agross@kernel.org>,
        Andrzej Hajda <a.hajda@samsung.com>,
        Neil Armstrong <narmstrong@baylibre.com>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Dave Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Mark Rutland <mark.rutland@arm.com>,
        Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
        Jonas Karlman <jonas@kwiboo.se>,
        Jernej Skrabec <jernej.skrabec@siol.net>,
        Enric Balletbo i Serra <enric.balletbo@collabora.com>,
        "open list:DRM PANEL DRIVERS" <dri-devel@lists.freedesktop.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        MSM <linux-arm-msm@vger.kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        freedreno <freedreno@lists.freedesktop.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu, Aug 15, 2019 at 2:49 AM Brian Masney <masneyb@onstation.org> wrote:

> Silence a warning message due to an -EPROBE_DEFER error to help cleanup
> the system boot log.
>
> Signed-off-by: Brian Masney <masneyb@onstation.org>

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
