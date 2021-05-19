Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 57E2E388B7D
	for <lists+linux-arm-msm@lfdr.de>; Wed, 19 May 2021 12:16:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1347624AbhESKSR (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 19 May 2021 06:18:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40064 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1345568AbhESKSP (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 19 May 2021 06:18:15 -0400
Received: from mail-pg1-x532.google.com (mail-pg1-x532.google.com [IPv6:2607:f8b0:4864:20::532])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A8DCFC061761
        for <linux-arm-msm@vger.kernel.org>; Wed, 19 May 2021 03:16:56 -0700 (PDT)
Received: by mail-pg1-x532.google.com with SMTP id m190so9125279pga.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 19 May 2021 03:16:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=ErgaLn/LXwMYchnr1s78l4/CTrq8Ah6eCPn0flSFZZw=;
        b=x3DySxX2A8/YJP61UlCrtTmMJbXch0e/f1JNjywXSWN5PsQ2gC9JHwTXVnyEwFTpls
         KnH9Ie1E2weDg/fffT6Tdl+0ZG7qkZUfX0Yt+q0fuCQMOu7Iuky/ryoe+ccLzqyIOxhe
         MxW81slQl8oeZmhZsNtglsb2SNs6Tb5Ugj5NMKoDcJo7DOI4WOXVe5Oj3qhGz4CZkaxo
         cXCTDnfrZYYcoupsoreHxKNxVyc3ttIuxWYF7QTTKJFxEN7bipx1gUg7diT3f7CLStsE
         ncy+Nu4j2OaDojzJZs+geObOfgj5Y/cK870P6aecnjK/eYzReXNG2KJtRUgjdn4pjMxN
         Oj9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=ErgaLn/LXwMYchnr1s78l4/CTrq8Ah6eCPn0flSFZZw=;
        b=a8Gx1SxTcLgdtvh+Zsq3P13jUbsqs9g66vJ92tBsoHBVoYo/rPHWarEhW/P8JqiFO5
         ZM3FethcmtwnAyeV+motoiIPnvKXr8NwyY8kEfDhhZPwBamc+/i1ZdCRZ8C8SS1HzLXF
         m3sP9PQT+Qd5pdpxaT7LV3X1lavyEBqV9SlvlhodrPESqTneI9+PVrW6UTdV8h+I/0mw
         u7+yyOTvY8LSgwVtLwukCHicXnnVJhgtVMe6ZBo9KgBBGZr7Ynk2zMUKiugi0fTYH5rA
         opAOvBpF9cYRRUt1mvzTr3rh4OfahdELQBoVmtwc5MOcfeJkfWuGCIUP2ZxOYvfG1G/A
         pCRQ==
X-Gm-Message-State: AOAM533H3Dvq8tPfEgTwbzr194/x4zBJ3rb76JnMijkMfRjqnDg8CxGK
        k4cpXgIuoZw2fNElPW7OhasLv7iCwMFlgKvpR3bLLg==
X-Google-Smtp-Source: ABdhPJyQy8LhqHpPMUObOjzgs521n3KsIdr4cfRxqfNqEbvjyzuoRgHy0UWpJtBxppxfvKy2CTIblXYJ5s1KzdMyanw=
X-Received: by 2002:a62:a517:0:b029:2dc:9daf:5e91 with SMTP id
 v23-20020a62a5170000b02902dc9daf5e91mr10014131pfm.39.1621419416158; Wed, 19
 May 2021 03:16:56 -0700 (PDT)
MIME-Version: 1.0
References: <20210511180728.23781-1-jonathan@marek.ca> <20210511180728.23781-2-jonathan@marek.ca>
In-Reply-To: <20210511180728.23781-2-jonathan@marek.ca>
From:   Robert Foss <robert.foss@linaro.org>
Date:   Wed, 19 May 2021 12:16:44 +0200
Message-ID: <CAG3jFysn=2JNZD8Vcsks3=+5TaR0hgb+=8GYeBrOSt1vfbqgjA@mail.gmail.com>
Subject: Re: [PATCH 01/17] media: camss: csiphy-3ph: don't print HW version as
 an error
To:     Jonathan Marek <jonathan@marek.ca>
Cc:     MSM <linux-arm-msm@vger.kernel.org>,
        Andrey Konovalov <andrey.konovalov@linaro.org>,
        Todor Tomov <todor.too@gmail.com>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        "open list:QUALCOMM CAMERA SUBSYSTEM DRIVER" 
        <linux-media@vger.kernel.org>,
        open list <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hey Jonathan,

Thanks for submitting this series, and including some cleanups and fixes.

On Tue, 11 May 2021 at 20:08, Jonathan Marek <jonathan@marek.ca> wrote:
>
> Avoid unnecessary noise in normal usage (it prints every time CSIPHY is
> powered on).
>
> Signed-off-by: Jonathan Marek <jonathan@marek.ca>
> ---
>  drivers/media/platform/qcom/camss/camss-csiphy-3ph-1-0.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/media/platform/qcom/camss/camss-csiphy-3ph-1-0.c b/drivers/media/platform/qcom/camss/camss-csiphy-3ph-1-0.c
> index e318c822ab04..5948abdcd220 100644
> --- a/drivers/media/platform/qcom/camss/camss-csiphy-3ph-1-0.c
> +++ b/drivers/media/platform/qcom/camss/camss-csiphy-3ph-1-0.c
> @@ -163,7 +163,7 @@ static void csiphy_hw_version_read(struct csiphy_device *csiphy,
>         hw_version |= readl_relaxed(csiphy->base +
>                                    CSIPHY_3PH_CMN_CSI_COMMON_STATUSn(15)) << 24;
>
> -       dev_err(dev, "CSIPHY 3PH HW Version = 0x%08x\n", hw_version);
> +       dev_dbg(dev, "CSIPHY 3PH HW Version = 0x%08x\n", hw_version);
>  }
>
>  /*

Reviewed-by: Robert Foss <robert.foss@linaro.org>
