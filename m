Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C710B30D78A
	for <lists+linux-arm-msm@lfdr.de>; Wed,  3 Feb 2021 11:30:33 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233804AbhBCK3r (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 3 Feb 2021 05:29:47 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59722 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233890AbhBCK3f (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 3 Feb 2021 05:29:35 -0500
Received: from mail-pg1-x531.google.com (mail-pg1-x531.google.com [IPv6:2607:f8b0:4864:20::531])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D5063C06174A
        for <linux-arm-msm@vger.kernel.org>; Wed,  3 Feb 2021 02:28:52 -0800 (PST)
Received: by mail-pg1-x531.google.com with SMTP id o16so17044807pgg.5
        for <linux-arm-msm@vger.kernel.org>; Wed, 03 Feb 2021 02:28:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=dQc4VqUY/lG+QkN2eY8uXO6Zl0zKF+CdXtLi3xY+yZE=;
        b=AT+wcFzl3Z04MbsFWoquh4HaYbwQtnBr6Fpjn7U3oAwHFTA3WgbZzLHoy4A6BWb4G0
         /RUGAw/UhWpDoWVWbKfbIE6COFu876n1Y2+MkL6812t0FsYVO2skhKE9bLOnGX7xhE0Z
         jT3vQHENc+/mgnDrfhzUf5rBJZw0xxUK3QAmUiDbW4Lm/miEAfpkFB7+vcNMcX4PU5OJ
         uLF5bDWwB6BShvdkm4W+FSd2sAlCDFoa/yFPVxEkb0paK1Y+A3BUwBvVLe3mak/KizOV
         QSAKDfFKer6ZGZWvlYrzUsdmNwZO366e/nrt/l8Qe2bB6XxJ+yP20sI89Zv3sjbtgUnH
         sYlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=dQc4VqUY/lG+QkN2eY8uXO6Zl0zKF+CdXtLi3xY+yZE=;
        b=ipN4E1SmUecIwSlUJTNQUzQL6HSjsrHC3ICx8iBYYBpz9s8RooCSGLpgZtADsiuEfe
         p0a1eTdoMoRFI4W6FGNoknasrpVENhQUyPqz+wtf+ix+maCzP3VNDwKqit8smaN1ma0Y
         hC2+FiNaVRtWn80+j+rXRNQNFtRzmjS+tTAki5vrYsGK06DzZpmJ0ZR82AM13G7APDOe
         LYaNi3Nq1puPSaUniYgSXmrBPRS48W21KvU63Neg1dAWSGgKKbPujrXLIu72GJZyvOZZ
         UQRMgw+Fj9Ciijjowa1cfSbFIVpDCXJaK/RtSdVSHtFuzkVrXTtV2jK/kju8YVcwbJMj
         714Q==
X-Gm-Message-State: AOAM532YuzQHWBYYG0SWl4wZ4wZhjAWkVo7lMJDTCcJCYKsXrzUXN+F5
        aElN8EEUhbjdauOAxlLKk9C+KYMdQBY4E0GHhKP+mg==
X-Google-Smtp-Source: ABdhPJyBxwH/Guc1GIPuZtZZTBNWAlhACpxeqrJtF+bnhwoSIvd17FLBa8HNwnxaxx6iB201cO246CT03j14v8YIVqE=
X-Received: by 2002:a63:5b4f:: with SMTP id l15mr2903821pgm.339.1612348132298;
 Wed, 03 Feb 2021 02:28:52 -0800 (PST)
MIME-Version: 1.0
References: <20210127144930.2158242-1-robert.foss@linaro.org>
 <20210127144930.2158242-20-robert.foss@linaro.org> <YBnVsUTapsiosHtF@builder.lan>
In-Reply-To: <YBnVsUTapsiosHtF@builder.lan>
From:   Robert Foss <robert.foss@linaro.org>
Date:   Wed, 3 Feb 2021 11:28:41 +0100
Message-ID: <CAG3jFys8UAX4=0ZWAnUey45CTyXud=gJ53y-mXXH1Yt5xnkruA@mail.gmail.com>
Subject: Re: [PATCH v3 19/22] arm64: defconfig: Build Qcom CAMSS as module
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     Andy Gross <agross@kernel.org>, Todor Tomov <todor.too@gmail.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>, shawnguo@kernel.org,
        leoyang.li@nxp.com, Geert Uytterhoeven <geert+renesas@glider.be>,
        Arnd Bergmann <arnd@arndb.de>, Anson.Huang@nxp.com,
        michael@walle.cc, agx@sigxcpu.org, max.oss.09@gmail.com,
        angelogioacchino.delregno@somainline.org,
        MSM <linux-arm-msm@vger.kernel.org>,
        linux-media <linux-media@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        linux-kernel <linux-kernel@vger.kernel.org>,
        "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" 
        <linux-arm-kernel@lists.infradead.org>,
        AngeloGioacchino Del Regno <kholk11@gmail.com>,
        Rob Herring <robh@kernel.org>,
        Andrey Konovalov <andrey.konovalov@linaro.org>,
        Tomasz Figa <tfiga@chromium.org>,
        Azam Sadiq Pasha Kapatrala Syed <akapatra@quicinc.com>,
        Sarvesh Sridutt <Sarvesh.Sridutt@smartwirelesscompute.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Jonathan Marek <jonathan@marek.ca>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hey Bjorn,

On Tue, 2 Feb 2021 at 23:44, Bjorn Andersson <bjorn.andersson@linaro.org> wrote:
>
> On Wed 27 Jan 08:49 CST 2021, Robert Foss wrote:
>
> > Build camera ISP driver as a module.
> >
>
> Isn't this enabled since b47c5fc15d88 ("arm64: defconfig: Enable
> Qualcomm CAMCC, CAMSS and CCI drivers")?

You are right, thanks for catching this!

I'll drop this patch for v4.

>
> Regards,
> Bjorn
>
> > Signed-off-by: Robert Foss <robert.foss@linaro.org>
> > ---
> >  arch/arm64/configs/defconfig | 1 +
> >  1 file changed, 1 insertion(+)
> >
> > diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
> > index 838301650a79..cb224d2af6a0 100644
> > --- a/arch/arm64/configs/defconfig
> > +++ b/arch/arm64/configs/defconfig
> > @@ -640,6 +640,7 @@ CONFIG_VIDEO_RENESAS_FDP1=m
> >  CONFIG_VIDEO_RENESAS_FCP=m
> >  CONFIG_VIDEO_RENESAS_VSP1=m
> >  CONFIG_SDR_PLATFORM_DRIVERS=y
> > +CONFIG_VIDEO_QCOM_CAMSS=m
> >  CONFIG_VIDEO_RCAR_DRIF=m
> >  CONFIG_VIDEO_IMX219=m
> >  CONFIG_VIDEO_OV5645=m
> > --
> > 2.27.0
> >
