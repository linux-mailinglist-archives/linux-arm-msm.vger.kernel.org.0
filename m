Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 98202352134
	for <lists+linux-arm-msm@lfdr.de>; Thu,  1 Apr 2021 22:58:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234400AbhDAU6l (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 1 Apr 2021 16:58:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44898 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233710AbhDAU6k (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 1 Apr 2021 16:58:40 -0400
Received: from mail-qk1-x735.google.com (mail-qk1-x735.google.com [IPv6:2607:f8b0:4864:20::735])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 53475C0613E6
        for <linux-arm-msm@vger.kernel.org>; Thu,  1 Apr 2021 13:58:40 -0700 (PDT)
Received: by mail-qk1-x735.google.com with SMTP id c4so3634868qkg.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 01 Apr 2021 13:58:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=NvVk82m6hhIQriolRhQ8Z203iWxsgnrRsbJQOs66SaI=;
        b=Jp6vxVF8jtCYHT4xhyRLT1pBqz5GDZNABKErvGUTqaBEXVjovp2SdU6MbpSSRBmjcH
         gJ8hOJzEpvdOYZkV/hWKf40idl3T2ENatYEuD06xHrmvb27MsmEUFsqs1bhGOrCJDhhK
         fRtp8DUGhB4LRYsOA3XZqP9y9cAls0RiuNzZmnH8Q4+TNtYNxxL/L3ZaCsHUJZasXHO4
         a1Le0gjAvp/ZH5vvlpWedEtVlNsh7YMBAi+Gl2i3ap+nhtMe5wr6+lq+FZfvnuKeJ5Vt
         KlcIQa4rA9F1mZwjsjEQvrLtxvXwSVU7hF9govFej0Uh+/k/5nkGCsJr0eeh5LGMfsxL
         HmjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=NvVk82m6hhIQriolRhQ8Z203iWxsgnrRsbJQOs66SaI=;
        b=FSarrK7RXXhg1+9q+fM5lSqewXYMf/u4QEEFMuMid6KDhlyiKnOEVJNrrYsumTfZO9
         JALQSl+pvDuSW9WqeLONTa2lCCJEJV2C1EDCYroI6Dxk9RLjHJVMp1mPbOIjD3zAL2uT
         cJfqe/LJqWXjwsD/2Pn5IHrMaB2pUspLKdZxPWB2+Txr9uxVL7Ai/ahUUipG/DEW7CMU
         46veFX6C3i9+5zsPpwvXwcVhhGI34dSZ+b/hbtuCALW7nwfy6hjq06ORNcEt1PtO/WfZ
         1Ia6GJxKW0GHv2tSnDL3eJA8A1Z7dhrLKi4G4hDmrOV9NBnk/lffBwkItKu03wKb5f0J
         9PBA==
X-Gm-Message-State: AOAM533voiY3ZsrM3u/pUE/Mwhcu9ptMu/xyMSRVugHjFO3A9eZk8w9s
        g3DZln3nLcvnPZsWGOwTnSxSR2wkQqgoqN59baNPNQ==
X-Google-Smtp-Source: ABdhPJx1rpyYOOJdxKZQYFzQB+5i85Rx/659TiPzXswfiJPztzBFR+4XKyLpkO9bQ2aHwsg+kn8kW/Pj6TKqMaeS2mU=
X-Received: by 2002:a37:a016:: with SMTP id j22mr10434149qke.486.1617310719561;
 Thu, 01 Apr 2021 13:58:39 -0700 (PDT)
MIME-Version: 1.0
References: <20210325111144.2852594-1-dmitry.baryshkov@linaro.org>
 <20210325111144.2852594-7-dmitry.baryshkov@linaro.org> <4217c4a2-cb15-ef08-8c39-9a5f164d2b41@codeaurora.org>
 <CAA8EJpoNThCf-R8+CmjNWC9bGin8x60v-AjZrsm2x=ZE+UDjgw@mail.gmail.com> <161730706709.2260335.8947402948263904863@swboyd.mtv.corp.google.com>
In-Reply-To: <161730706709.2260335.8947402948263904863@swboyd.mtv.corp.google.com>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date:   Thu, 1 Apr 2021 23:58:28 +0300
Message-ID: <CAA8EJprOTzjoN_Yz8M5qsdg-7FEsLaVnhN+xP3iwXxp5p6_2-A@mail.gmail.com>
Subject: Re: [PATCH v1 06/15] clk: qcom: videocc-sc7180: drop unused enum entries
To:     Stephen Boyd <sboyd@kernel.org>
Cc:     Taniya Das <tdas@codeaurora.org>, Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Michael Turquette <mturquette@baylibre.com>,
        DRM DRIVER FOR MSM ADRENO GPU 
        <linux-arm-msm@vger.kernel.org>,
        "open list:COMMON CLK FRAMEWORK" <linux-clk@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu, 1 Apr 2021 at 22:57, Stephen Boyd <sboyd@kernel.org> wrote:
>
> Quoting Dmitry Baryshkov (2021-03-27 01:13:56)
> > Hi Tanya,
> >
> > On Sat, 27 Mar 2021 at 04:49, Taniya Das <tdas@codeaurora.org> wrote:
> > >
> > > Hi Dmitry,
> > >
> > > Thanks for the patch for cleanup.
> > > It is okay to remove TEST source, but you can still keep the sleep clock
> > > source as it could be still connected to certain RCGs and could be used
> > > to derive low frequencies if required.
> > >
> > > As these sources are generated from the HW plans it would be good if we
> > > keep them as they are except the TEST source.
> >
> > Please note that I've barely removed the unused enum entry, which is
> > not used in any of clock parent maps. So I'd suggest to either add it
> > to relevant clock parent maps and to the videocc bindings or to drop
> > unused enum entry.
> >
>
> Is this going to be resent?

Is there a reason to resend the patches?
I'm not removing any actual clock sources, only unused(!) enum entries
are removed. No functional changes.


-- 
With best wishes
Dmitry
