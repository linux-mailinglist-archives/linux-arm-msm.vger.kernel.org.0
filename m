Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1A0E3196F02
	for <lists+linux-arm-msm@lfdr.de>; Sun, 29 Mar 2020 19:44:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728041AbgC2RoU (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 29 Mar 2020 13:44:20 -0400
Received: from mail-pf1-f196.google.com ([209.85.210.196]:38378 "EHLO
        mail-pf1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727942AbgC2RoU (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 29 Mar 2020 13:44:20 -0400
Received: by mail-pf1-f196.google.com with SMTP id c21so6766067pfo.5
        for <linux-arm-msm@vger.kernel.org>; Sun, 29 Mar 2020 10:44:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=kmRMCVebQwKolZ1owfxZgEJ3Z36wIWAyCqEaSASHlvY=;
        b=Bq06fe9AJChcuooMu7thhI4C1GMIK7gBxwAa5A71KCW1ABGzEVfx/U97uOufooY5Hk
         fb73LsjUD0AuOAFgeEoeyRLu9vHh2p1QuQoIz1x0YmdQuURcftUjh1s3aNTqabzM1tKA
         glBN7VgzxkikA71e2C0Mm1VFJ8syJGrqmRMFE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=kmRMCVebQwKolZ1owfxZgEJ3Z36wIWAyCqEaSASHlvY=;
        b=Ry6MUk6azasgXOXSfjnaN1pxdo4/Arb2tUknxJ3DeGEtCnUwY1XYpjdBF2bz+uhAfT
         ost4QjQKML/jMhqfXP0NUwmQX8BucKeTlOeEYneIWH4I2Uqje/hxcKwiBgkAdFFNmOwQ
         5MTC6GyH3hh1wH5cNetmT8mHx7ioGF+sHWbqxapu6gHqgK600/tsOkdLEN41guQpu4z2
         Q6ebnt7oV+fQT3rRLDYFZcMeIdI9T9T5WFseG4KjXXngKg1+sJXaMRAnnPwEz9h7i1UT
         NvbL1MqRgD6AsCbBL5qf6GGCqJgLf/3heOKqkZ0yRqKGytoY1ZIczMwueMIY6XRkY334
         moXA==
X-Gm-Message-State: ANhLgQ020yItFuGjI61kNLbVOa9oB+1GPbP5JNmJUmgZ+AjvpRhlxfFl
        PNeoMurj/0ylvclBg0UkENOQ5A==
X-Google-Smtp-Source: ADFU+vs0uMGtGWmK6rFkOfdAMPSqn9eO9elktCgbjLQA+xwo3JFqty5Dy0EluvHOkdf0DrnOXdwAWg==
X-Received: by 2002:a62:7950:: with SMTP id u77mr9691072pfc.34.1585503858884;
        Sun, 29 Mar 2020 10:44:18 -0700 (PDT)
Received: from localhost ([2620:15c:202:1:4fff:7a6b:a335:8fde])
        by smtp.gmail.com with ESMTPSA id o14sm8393537pfh.147.2020.03.29.10.44.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 29 Mar 2020 10:44:18 -0700 (PDT)
Date:   Sun, 29 Mar 2020 10:44:17 -0700
From:   Matthias Kaehlcke <mka@chromium.org>
To:     Sam Ravnborg <sam@ravnborg.org>
Cc:     Harigovindan P <harigovi@codeaurora.org>,
        dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
        freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
        sean@poorly.run, seanpaul@chromium.org
Subject: Re: [PATCH v10 0/2] Add support for rm69299 Visionox panel driver
 and add devicetree bindings for visionox panel
Message-ID: <20200329174417.GB199755@google.com>
References: <20200327073636.13823-1-harigovi@codeaurora.org>
 <20200328204047.GG32230@ravnborg.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20200328204047.GG32230@ravnborg.org>
User-Agent: Mutt/1.12.2 (2019-09-21)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Sam,

On Sat, Mar 28, 2020 at 09:40:47PM +0100, Sam Ravnborg wrote:
> Hi Harigovindan
> 
> On Fri, Mar 27, 2020 at 01:06:34PM +0530, Harigovindan P wrote:
> > Adding support for visionox rm69299 panel driver and adding bindings for the same panel.
> > 
> > Harigovindan P (2):
> >   dt-bindings: display: add visionox rm69299 panel variant
> >   drm/panel: add support for rm69299 visionox panel driver
> 
> I have only the first patch, which is now applied.
> Please resend second patch as it is lost somewhere.

Yes, it seems for v8, v9 and v10 only the bindings were sent, even
though the cover letter and subject say it's a series of two patches.

To my knowledge the latest version of the driver patch is this:

https://patchwork.kernel.org/patch/11439689/
