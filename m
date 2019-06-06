Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 04388372A1
	for <lists+linux-arm-msm@lfdr.de>; Thu,  6 Jun 2019 13:18:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726092AbfFFLSr (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 6 Jun 2019 07:18:47 -0400
Received: from smtp.codeaurora.org ([198.145.29.96]:59416 "EHLO
        smtp.codeaurora.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726066AbfFFLSr (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 6 Jun 2019 07:18:47 -0400
Received: by smtp.codeaurora.org (Postfix, from userid 1000)
        id 2A2C9605FE; Thu,  6 Jun 2019 11:18:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1559819926;
        bh=2bQeIUl0Sqcf4C18lybozSEspZJp3/TZIWNvfiD9Wsk=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=fFsx4LOVEiHkaYzS4WsBO6H47QY99htobSNLwTsYwkrYdPzcExCTQ6LapJK7t2Z6l
         SbCwmcZ1sE1y/6AtpYjbIfkPRswfpWCIQYCkrB9x/sw/szmzgC1HTmdp/3Ed7sYPrR
         hGj5Zy1XDMFYj9UfBzrtNksW5OCu7BCQrgc5rTlk=
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        pdx-caf-mail.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.7 required=2.0 tests=ALL_TRUSTED,BAYES_00,
        DKIM_INVALID,DKIM_SIGNED,SPF_NONE autolearn=no autolearn_force=no
        version=3.4.0
Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: vivek.gautam@smtp.codeaurora.org)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 83500602C3;
        Thu,  6 Jun 2019 11:18:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1559819924;
        bh=2bQeIUl0Sqcf4C18lybozSEspZJp3/TZIWNvfiD9Wsk=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=LhdZc33S/F4QvJdXEcT1pBCyAQ1AOzFE6v16OMWlXo1zb/orQQ2gvs97QSB8y7C0M
         0Cxb9H9l20rwFCY9/h1+23mCo0OkcgLLsjyXZjtkAbQIv3wkuTChjVBuBQlcXhDnbs
         8UTQFmqdmwogpXAx7YyI37AHOBlfdoTazISnwopw=
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 83500602C3
Authentication-Results: pdx-caf-mail.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: pdx-caf-mail.web.codeaurora.org; spf=none smtp.mailfrom=vivek.gautam@codeaurora.org
Received: by mail-ed1-f43.google.com with SMTP id c26so2832067edt.1;
        Thu, 06 Jun 2019 04:18:44 -0700 (PDT)
X-Gm-Message-State: APjAAAXqzVDv5WYdT77HdC8ywdIMsOawMcI8cyTr3Ma5hkqxDUBodWY6
        OVPhs7P1JRJbLiwxu2PLKLbUveyN3iE7ihKbUC8=
X-Google-Smtp-Source: APXvYqywciaOK50k3dYNiGNenR853IMjbXcIeW6KCMTsTQOrLx/1JWr+4cSt95XYaChU3AAORpJLqjht8ZoXsl40UKs=
X-Received: by 2002:a17:906:8d8:: with SMTP id o24mr40716009eje.235.1559819923348;
 Thu, 06 Jun 2019 04:18:43 -0700 (PDT)
MIME-Version: 1.0
References: <20190527102616.28315-1-vivek.gautam@codeaurora.org> <20190605082221.GB15169@ravnborg.org>
In-Reply-To: <20190605082221.GB15169@ravnborg.org>
From:   Vivek Gautam <vivek.gautam@codeaurora.org>
Date:   Thu, 6 Jun 2019 16:48:31 +0530
X-Gmail-Original-Message-ID: <CAFp+6iEXZyXaGvTeCqLmDgo3OvBZr172nrba2iX6sTYJCORESg@mail.gmail.com>
Message-ID: <CAFp+6iEXZyXaGvTeCqLmDgo3OvBZr172nrba2iX6sTYJCORESg@mail.gmail.com>
Subject: Re: [PATCH 1/1] drm/panel: truly: Add additional delay after pulling
 down reset gpio
To:     Sam Ravnborg <sam@ravnborg.org>
Cc:     David Airlie <airlied@linux.ie>,
        "thierry.reding" <thierry.reding@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        dri-devel <dri-devel@lists.freedesktop.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        open list <linux-kernel@vger.kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Wed, Jun 5, 2019 at 1:54 PM Sam Ravnborg <sam@ravnborg.org> wrote:
>
> Hi Vivek,
>
> On Mon, May 27, 2019 at 03:56:16PM +0530, Vivek Gautam wrote:
> > MTP SDM845 panel seems to need additional delay to bring panel
> > to a workable state. Running modetest without this change displays
> > blurry artifacts.
> >
> > Signed-off-by: Vivek Gautam <vivek.gautam@codeaurora.org>
>
> added to drm-misc-next

Thanks a lot.

Best regards
Vivek

>
>         Sam
>
> > ---
> >  drivers/gpu/drm/panel/panel-truly-nt35597.c | 1 +
> >  1 file changed, 1 insertion(+)
> >
> > diff --git a/drivers/gpu/drm/panel/panel-truly-nt35597.c b/drivers/gpu/drm/panel/panel-truly-nt35597.c
> > index fc2a66c53db4..aa7153fd3be4 100644
> > --- a/drivers/gpu/drm/panel/panel-truly-nt35597.c
> > +++ b/drivers/gpu/drm/panel/panel-truly-nt35597.c
> > @@ -280,6 +280,7 @@ static int truly_35597_power_on(struct truly_nt35597 *ctx)
> >       gpiod_set_value(ctx->reset_gpio, 1);
> >       usleep_range(10000, 20000);
> >       gpiod_set_value(ctx->reset_gpio, 0);
> > +     usleep_range(10000, 20000);
> >
> >       return 0;
> >  }
> > --
> > QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member
> > of Code Aurora Forum, hosted by The Linux Foundation
> >
> > _______________________________________________
> > dri-devel mailing list
> > dri-devel@lists.freedesktop.org
> > https://lists.freedesktop.org/mailman/listinfo/dri-devel



-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member
of Code Aurora Forum, hosted by The Linux Foundation
