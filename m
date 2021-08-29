Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 917773FACEF
	for <lists+linux-arm-msm@lfdr.de>; Sun, 29 Aug 2021 17:58:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235628AbhH2PzH (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 29 Aug 2021 11:55:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54648 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231216AbhH2PzG (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 29 Aug 2021 11:55:06 -0400
Received: from mail-qv1-xf31.google.com (mail-qv1-xf31.google.com [IPv6:2607:f8b0:4864:20::f31])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 860A2C06175F
        for <linux-arm-msm@vger.kernel.org>; Sun, 29 Aug 2021 08:54:14 -0700 (PDT)
Received: by mail-qv1-xf31.google.com with SMTP id e18so7024382qvo.1
        for <linux-arm-msm@vger.kernel.org>; Sun, 29 Aug 2021 08:54:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=2lFAxhd8GYho/4ODjYlv7uZMw/0eD5pCCmeHLl+hjPs=;
        b=mhx9ENQXODT+mzzMPqmHKUrwyDP2qJQeuDuWMS01gHPl43XhTaDa7GIwT5EZrzsKlW
         XYrJjSXdlg7yFUzDfgrCTeHHFsuK2dGZzpV4e6dDVB43n3znpV5NEOSV5Jb1W542jRuk
         3Ofp66c2GUjahl/LYi4ixx1JYqgz/DPjN3n81ynmXWItJ02c662hvQlZJ1N7wNrBFO+d
         LdaHQwaSptg/CV5S2SQ5h/HKx10wJDGKG7Ca5b+kZqHAA7E2f6cJi7/dwGX3PtU2JrjL
         3R1ypHe5H4Nhg5SwUbFTCZPhLiX53TmhoEGWfqxj67tEbpLDIljuQerpXkUz8qslJ05v
         IL0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=2lFAxhd8GYho/4ODjYlv7uZMw/0eD5pCCmeHLl+hjPs=;
        b=n0kB35E32S+UcYeQUt2pQUlHoNKNmBWLOa/SMFCDdTiv2Lxm9ytf0w4kf/oc925EFm
         q/oCjOM9zAFaEVHa7ooj3coJ+QXiAWXs+lWVUg5hg/kXXYvvjU7KsNkmemE9IqyRbxIg
         C8BXqZ03ntmp1KM/q49XTyKUucLKPrpPfbQHPS5gk0/sKL8ewM3tyt1YDCd/MERapX9c
         2g+cEkh++GX+s3I4qpRoGSUkfNQxVRLLbhxpiziH6F+2NXzysymWMbF8Rfd491g4ARfx
         3Isci7IWswzzHvsm+SHjO+FlW9BGxfUb5ibaUB9xW+PEF2Tf5+mJ99zEXp5yqsAxmwWw
         s9yA==
X-Gm-Message-State: AOAM530r4T45VWYMaXoWRcLD6CfYBk2FBMRN4BrlCwez3H7ysjDLx2fL
        G4JiKhPPZB/7qmXgYuIZufMK0E0nsoELSN9pynLBJkwFCxk=
X-Google-Smtp-Source: ABdhPJxe1bgF3xh2bIKzCa9HbcdEnoBohTsx5XK2a6WNzZeS4ponlbCpnvpXa1C9Dxt2513WX+SXZNaLMUhG2s0WPzc=
X-Received: by 2002:a0c:cb8f:: with SMTP id p15mr19218569qvk.2.1630252453659;
 Sun, 29 Aug 2021 08:54:13 -0700 (PDT)
MIME-Version: 1.0
References: <20210727202004.712665-1-dmitry.baryshkov@linaro.org>
 <163000270629.1317818.2836576068466077505@swboyd.mtv.corp.google.com>
 <42c3fa20-7ffa-255f-ca28-6f0aa2aa4a13@linaro.org> <163020909027.2218116.11109424225803296345@swboyd.mtv.corp.google.com>
In-Reply-To: <163020909027.2218116.11109424225803296345@swboyd.mtv.corp.google.com>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date:   Sun, 29 Aug 2021 18:54:02 +0300
Message-ID: <CAA8EJppo8Zze5ViYOWooHy=RR4ueXNeWiBFyKdtpUcm5Cs69ew@mail.gmail.com>
Subject: Re: [PATCH v6 0/6] clk: qcom: use power-domain for sm8250's clock controllers
To:     Stephen Boyd <sboyd@kernel.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Jonathan Marek <jonathan@marek.ca>,
        Michael Turquette <mturquette@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>,
        Taniya Das <tdas@codeaurora.org>,
        "open list:DRM DRIVER FOR MSM ADRENO GPU" 
        <linux-arm-msm@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        "open list:COMMON CLK FRAMEWORK" <linux-clk@vger.kernel.org>,
        "Bryan O'Donoghue" <bryan.odonoghue@linaro.org>,
        Mark Brown <broonie@kernel.org>,
        Ulf Hansson <ulf.hansson@linaro.org>,
        open list <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Sun, 29 Aug 2021 at 06:51, Stephen Boyd <sboyd@kernel.org> wrote:
>
> Quoting Dmitry Baryshkov (2021-08-26 14:56:23)
> > On 26/08/2021 21:31, Stephen Boyd wrote:
> > > Quoting Dmitry Baryshkov (2021-07-27 13:19:56)
> > >> On SM8250 both the display and video clock controllers are powered up by
> > >> the MMCX power domain. Handle this by linking clock controllers to the
> > >> proper power domain, and using runtime power management to enable and
> > >> disable the MMCX power domain.
> > >>
> > >> Dependencies:
> > >> - https://lore.kernel.org/linux-arm-msm/20210703005416.2668319-1-bjorn.andersson@linaro.org/
> > >>    (pending)
> > >
> > > Does this patch series need to go through the qcom tree? Presumably the
> > > dependency is going through qcom -> arm-soc
> >
> > It looks like Bjorn did not apply his patches in the for-5.15 series, so
> > we'd have to wait anyway. Probably I should rebase these patches instead
> > on Rajendra's required-opps patch (which is going in this window).
> >
>
> Ok. Thanks. I'll drop it from my queue for now.

Just for the reference. I've sent v7 of this patchset. After thinking
more about power domains relationship, I think we have a hole in the
abstraction here. Currently subdomains cause power domains to be
powered up, but do not dictate the performance level the parent domain
should be working in. While this does not look like an issue for the
gdsc (and thus it can be easily solved by the Bjorn's patches, which
enforce rpmhpd to be powered on to 'at least lowest possible'
performance state, this might be not the case for the future links. I
think at some point the pd_add_subdomain() interface should be
extended with the ability to specify minimum required performance
state when the link becomes on. Until that time I have changed code to
enforce having clock controller in pm resume state when gdsc is
enabled, thus CC itself votes on parent's (rpmhpd) performance state.


-- 
With best wishes
Dmitry
