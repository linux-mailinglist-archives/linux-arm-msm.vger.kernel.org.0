Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8026E814A8
	for <lists+linux-arm-msm@lfdr.de>; Mon,  5 Aug 2019 11:01:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727802AbfHEJBr (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 5 Aug 2019 05:01:47 -0400
Received: from mail-lj1-f193.google.com ([209.85.208.193]:42337 "EHLO
        mail-lj1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726423AbfHEJBr (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 5 Aug 2019 05:01:47 -0400
Received: by mail-lj1-f193.google.com with SMTP id t28so78626063lje.9
        for <linux-arm-msm@vger.kernel.org>; Mon, 05 Aug 2019 02:01:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=ofL+84/X8WTQ87INym+beTDzeijUUSg8XFUdF2WJ2nY=;
        b=HmmKYJ7mhl+/8zgV9AOWeEOrzP4ybrJE9LPi6oF9/4j1y1StKRkLvw3DtlIUUtQwuE
         gCDxlJNM1DvxV89sqaeJ0toUIG+U4tE8sIKq5Dd/5U6w3hx5i8swa1xLCQYKyMNkXkcZ
         339+gnXSRpxc91M+kGqwLni0gcEs37hlPMyfftjiD2YsRS/RwRFoAbuG14NcUAH2iUTh
         K4CZxw1SQEirbsAbhXBwme1CPbreRdfMGuORnDUe83NO9lWk1irmvVb7FokaCIt3/yfo
         HHQm7fIHSOd7JZpxApSeRGwiKwNDJCyobxFYtzlpWJkRw6LhOwJ0dYGu7VnO6m6DTvce
         7Fow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=ofL+84/X8WTQ87INym+beTDzeijUUSg8XFUdF2WJ2nY=;
        b=U0VIvLYDEOcpAQNNtHuEvBDysis5AQkQj68brl9VyFhtOW0/5jqM7M2AmU13LxbrzH
         bAj0+uV6OsMmaQTlK+zPmVwdayMRzEkrlFLxEbVC3XSnBlxM6ofihB6Mbc/faRls/Ubg
         1SKTqYyoFIlFPbj6a7m7aDJpO29Vj3PrPu3KaTJdy3+5zVAu4PyzML2ebTyE4OXPl93z
         dL6X6urkuInnwscmEFtNGczjcmBS6y4iYKpQi6EwRF/tN1vPzcDdohkwE2i9/WNkgF1l
         IJ4LVlfETRAOhJ0h3qf5fE153C3jpQhFciFPdiibtkRZbpufoLGugdrMM2P+fxrMUTnc
         yGtg==
X-Gm-Message-State: APjAAAWcfXoN3a1GpBUG8RErRTn0uaYiBFTwrCVFPbQJLZHjvjCMa/ZV
        EliBWQHThfDAK38dQgku1Er2OKiRJ/8cP9ofTNnJNg==
X-Google-Smtp-Source: APXvYqyy6J/Oydbl1XgI8D9WR+GWwiKIDSANNwFAP8xjqs4qVcz/MsRWaN94GdaujXiAmgVlHAwCD5VXOfoYorScUgQ=
X-Received: by 2002:a2e:2c14:: with SMTP id s20mr16260537ljs.54.1564995705613;
 Mon, 05 Aug 2019 02:01:45 -0700 (PDT)
MIME-Version: 1.0
References: <20190629125933.679-1-linus.walleij@linaro.org> <CACRpkdZ-6qBxzTTY4=CV+-ZmnTRPmPNAWrHMb_cMXTYdaNeYQQ@mail.gmail.com>
In-Reply-To: <CACRpkdZ-6qBxzTTY4=CV+-ZmnTRPmPNAWrHMb_cMXTYdaNeYQQ@mail.gmail.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Mon, 5 Aug 2019 11:01:34 +0200
Message-ID: <CACRpkdaf7ZOr-ci0VnYcS=cVpmHyvQrDS2PY_tE18ZfhLfmRGA@mail.gmail.com>
Subject: Re: [PATCH 1/7] drm/msm/mdp4: Drop unused GPIO include
To:     "open list:DRM PANEL DRIVERS" <dri-devel@lists.freedesktop.org>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <maxime.ripard@bootlin.com>,
        Sean Paul <sean@poorly.run>
Cc:     Linux ARM <linux-arm-kernel@lists.infradead.org>,
        Rob Clark <robdclark@gmail.com>,
        MSM <linux-arm-msm@vger.kernel.org>,
        freedreno <freedreno@lists.freedesktop.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Sun, Jul 28, 2019 at 12:02 PM Linus Walleij <linus.walleij@linaro.org> wrote:
> On Sat, Jun 29, 2019 at 3:01 PM Linus Walleij <linus.walleij@linaro.org> wrote:
>
> > This file is not using any symbols from <linux/gpio.h> so just
> > drop this include.
> >
> > Cc: Rob Clark <robdclark@gmail.com>
> > Cc: Sean Paul <sean@poorly.run>
> > Cc: linux-arm-msm@vger.kernel.org
> > Cc: freedreno@lists.freedesktop.org
> > Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
>
> Rob & friends: can this be merged to wherever you merge
> the MSM DRM patches? If it is in drm-misc I can apply it
> but I need some ACKs.

Ping on this!

Yours,
Linus Walleij
