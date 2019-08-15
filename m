Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9E3A78E619
	for <lists+linux-arm-msm@lfdr.de>; Thu, 15 Aug 2019 10:18:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730042AbfHOISm (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 15 Aug 2019 04:18:42 -0400
Received: from mail-lf1-f67.google.com ([209.85.167.67]:34870 "EHLO
        mail-lf1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729890AbfHOISm (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 15 Aug 2019 04:18:42 -0400
Received: by mail-lf1-f67.google.com with SMTP id p197so1136236lfa.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 15 Aug 2019 01:18:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=n93Dng/Ji8MdS4CMyB8lWHjceWaq72wrZdpqfUie2jw=;
        b=n917679wlyShUhrE5Ig3CFfBox9eY1vDh5kRoK7P3mDg7njrsuDaJ4qJSjP0n0hbvN
         6XifsLDIS3pWYVy7ZekSuZ95mPYr4uznZ084qrwwJW9GSUwY02fmoiMMGjcPWsPLiNYJ
         BJt4KywfKUnhrIVLnU600Uws2yZ9Et0XWqrlcCzH7U6LxN7OD1HNTr293DBvwy30Q1cs
         11+aPHS28sOkmSS/L2JI9Bmr2f3qQsIvSylZyRF9Pv2QANJ0oTZ7TKwfE6F/SM1L/Nyw
         XBCZnmBV99kF3Gb8iTlXZgSaY1JtoKpN45vN06DanE0j0nSsx191aIGKHyhj6a+FPHth
         etVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=n93Dng/Ji8MdS4CMyB8lWHjceWaq72wrZdpqfUie2jw=;
        b=AboAvZoF8N9dEZORuAs1jZJPapQJi7nQzzBK4ESY82mO26FKTA5g05f0agHN3A2LZD
         T7u2RJxWOHTal9jAaVrEh3+I4FcU0j+8rpL/qpKk+8vvidioWFILSbpZmzplC17wes88
         4XuX2syL+4OOSxI0GfZxuLyKo8qWRChhjh00ZZU5PX+2VaiwXrebP+Z658M1htHhJbbG
         cFcp0adVbIaf27mvox+bFh/MoNSmgYT6velaoTMoJiOfmwoCmgDCySmuma/iPwM9wZT2
         8iapAVCuFduzmT8kGcQ/YX9P388HWNGI/D6Z1JjkhrxruXA+jwIG+MpUpC/gyLMOystY
         wwkA==
X-Gm-Message-State: APjAAAVUzWsvL1aBcY8UE25mMLqgp8P77ZsM6wDkQ5BTEt2MQYVnCsgm
        F3Q6NlN8WBQ0XWcZbp8cEV7pnPClrMx3aH1T9ceBLg==
X-Google-Smtp-Source: APXvYqz+3m9CpHTiryHGgaHMtDawA41PP43UTCZWzylvPS7O0bar1RDoxUlI3ihahWRnC9SzzajOeS5xqZGxmVYZE8o=
X-Received: by 2002:ac2:59d0:: with SMTP id x16mr1883275lfn.60.1565857119990;
 Thu, 15 Aug 2019 01:18:39 -0700 (PDT)
MIME-Version: 1.0
References: <20190815004854.19860-1-masneyb@onstation.org> <20190815004854.19860-5-masneyb@onstation.org>
In-Reply-To: <20190815004854.19860-5-masneyb@onstation.org>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Thu, 15 Aug 2019 10:18:28 +0200
Message-ID: <CACRpkdbj10yneOP4JKFGXyiY4e1vS6-oB=W2vs6nj_X2uAY=pQ@mail.gmail.com>
Subject: Re: [PATCH 04/11] drm/bridge: analogix-anx78xx: convert to i2c_new_dummy_device
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

> The i2c_new_dummy() function is deprecated since it returns NULL on
> error. Change this to use the recommended replacement
> i2c_new_dummy_device() that returns an error code that can be read with
> PTR_ERR() and friends.
>
> Signed-off-by: Brian Masney <masneyb@onstation.org>

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
