Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 835D7403610
	for <lists+linux-arm-msm@lfdr.de>; Wed,  8 Sep 2021 10:26:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1348087AbhIHI1K (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 8 Sep 2021 04:27:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33036 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1348080AbhIHI1J (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 8 Sep 2021 04:27:09 -0400
Received: from mail-qt1-x830.google.com (mail-qt1-x830.google.com [IPv6:2607:f8b0:4864:20::830])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 036D1C061757
        for <linux-arm-msm@vger.kernel.org>; Wed,  8 Sep 2021 01:26:02 -0700 (PDT)
Received: by mail-qt1-x830.google.com with SMTP id r21so1143171qtw.11
        for <linux-arm-msm@vger.kernel.org>; Wed, 08 Sep 2021 01:26:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=I2GYoAF05W4QlTQNUCm2X4ED9hxXNWtrDyXhLShUptk=;
        b=e7g/IsbTln55dVeqTe5gmEnqabfSh7kHTb727uLUnyovBvkSGw8go8jXg95jjjF7tX
         R3bxp8omNg2Es3zR/CXIfV9ZMzXzQv+UEh4eSsWJkGl23Kssli7oOmRZQy9Pkaz7gEQy
         T44E5FFPOfRGx0HrA7fHZ6ZY2+IQ+KdzAvmJAeRJMA//xqk3Km7DEs34HVTG8+rE4tdi
         Nbz5dPeEyxoWv4I3QLfTHj1lYqM5Pp+pZfwjb075mSYqkvPbTo02Io6Avm0Rim4MyC0R
         4CYSQPxj0VXCNf6T7mcbGmua46gZ5pVoJTpvZBN/cJg4xb18jQYmvSm3Laik4qD63ecW
         Eo7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=I2GYoAF05W4QlTQNUCm2X4ED9hxXNWtrDyXhLShUptk=;
        b=ppcb5g0DMKMmaAmDV2CM5NVKXr8Tm/E8NeX+GH1b3bKE93okFytbYuu8NH/JhsRA1B
         GqtVNaC14U/3hu8JQyN9CBCEDzohiHzImJUTb9jO2NVUYoNkfELywA2eBcslJYXokrdw
         fVBmMlCUeaxVzsaHb5maNNWTmL4PnbJeG63XTT9IFENdHL8j8sS4rT7G8RYFd0xSKpQm
         r26ljDBawW+MziMp4nOGnoUTwi5RcvaFs2f1VTqSr2RMHteqgvU7yO9OnyBgrA431fx5
         Wf6xQevGqnMuqUH+5ciC/xixo+oJk06CO/Ume+PtXp9QZuCIFhnM+C10xrv3lhLQ9eMO
         i3vA==
X-Gm-Message-State: AOAM532gmcqfxQy9JF0KbTAa+PngIltOIJmQsJ7rC0kU7EOTkkm7RXhq
        jwiKOKU2rNNEFLHZxYlI0+Q88pUakRMfaU8J7fmGZPLMQZA=
X-Google-Smtp-Source: ABdhPJxJhjzUMRnWrBQrlHB5E1FH9Zjc6focYT3nA4MBbnlIPOsA5Rm9xuH5jYYfBZrGvUDOGlMTALwyLQ7v5Mh8YaQ=
X-Received: by 2002:ac8:578e:: with SMTP id v14mr2471269qta.285.1631089561173;
 Wed, 08 Sep 2021 01:26:01 -0700 (PDT)
MIME-Version: 1.0
References: <20210901181138.1052653-1-angelogioacchino.delregno@somainline.org>
 <20210901181138.1052653-2-angelogioacchino.delregno@somainline.org> <CAOCk7NoOdjxp0vxu9XJzYsi7a04kpqpTOZHm42ApAN3MqkqtDw@mail.gmail.com>
In-Reply-To: <CAOCk7NoOdjxp0vxu9XJzYsi7a04kpqpTOZHm42ApAN3MqkqtDw@mail.gmail.com>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date:   Wed, 8 Sep 2021 11:25:50 +0300
Message-ID: <CAA8EJpp6tj10A0QUR1E75t7BZf2Y3jHUyVNniYhEUd9rXj8Vrg@mail.gmail.com>
Subject: Re: [Freedreno] [PATCH 2/3] drm/msm/dpu1: Add MSM8998 to hw catalog
To:     Jeffrey Hugo <jeffrey.l.hugo@gmail.com>
Cc:     AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@somainline.org>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Dave Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Abhinav Kumar <abhinavk@codeaurora.org>,
        Rob Herring <robh+dt@kernel.org>,
        MSM <linux-arm-msm@vger.kernel.org>,
        "open list:DRM PANEL DRIVERS" <dri-devel@lists.freedesktop.org>,
        freedreno <freedreno@lists.freedesktop.org>,
        lkml <linux-kernel@vger.kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Martin Botka <martin.botka@somainline.org>,
        ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        paul.bouchara@somainline.org, DTML <devicetree@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi,

On Tue, 7 Sept 2021 at 22:13, Jeffrey Hugo <jeffrey.l.hugo@gmail.com> wrote:
>
> On Wed, Sep 1, 2021 at 12:11 PM AngeloGioacchino Del Regno
> <angelogioacchino.delregno@somainline.org> wrote:
> >
> > Bringup functionality for MSM8998 in the DPU, driver which is mostly
> > the same as SDM845 (just a few variations).
> >
> > Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>
>
> I don't seem to see a cover letter for this series.
>
> Eh, there are a fair number of differences between the MDSS versions
> for 8998 and 845.
>
> Probably a bigger question, why extend the DPU driver for 8998, when
> the MDP5 driver already supports it[1]?  The MDP/DPU split is pretty
> dumb, but I don't see a valid reason for both drivers supporting the
> same target/display revision.  IMO, if you want this support in DPU,
> remove it from MDP5.
>
> [1] https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?h=v5.14&id=d6c7b2284b14c66a268a448a7a8d54f585d38785

I don't think that we should enforce such requirements. Having support
both in MDP5 and DPU would allow one to compare those two drivers,
performance, features, etc.
It might be that all MDP5-supported hardware would be also supported
by DPU, thus allowing us to remove the former driver. But until that
time I'd suggest leaving support in place.

-- 
With best wishes
Dmitry
