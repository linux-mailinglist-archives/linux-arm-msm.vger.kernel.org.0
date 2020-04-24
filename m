Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E8D531B7CB8
	for <lists+linux-arm-msm@lfdr.de>; Fri, 24 Apr 2020 19:27:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726920AbgDXR1L (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 24 Apr 2020 13:27:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43210 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728598AbgDXR1J (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 24 Apr 2020 13:27:09 -0400
Received: from mail-pg1-x544.google.com (mail-pg1-x544.google.com [IPv6:2607:f8b0:4864:20::544])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 43BF0C09B047
        for <linux-arm-msm@vger.kernel.org>; Fri, 24 Apr 2020 10:27:09 -0700 (PDT)
Received: by mail-pg1-x544.google.com with SMTP id g6so4918768pgs.9
        for <linux-arm-msm@vger.kernel.org>; Fri, 24 Apr 2020 10:27:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:content-transfer-encoding:in-reply-to:references
         :subject:from:cc:to:date:message-id:user-agent;
        bh=757eATNy6DcXBD0dJfNd9a4RLKac7QDmicHrKgoTBRA=;
        b=bJkJTJHj/GzTZ3ywmcf915mvKDOklF2XfK+t7rWKq7rhQhj0drdqd9RnHoHT4DyW7L
         5BAqgXJ87NBW/oEc8K4aIaEl/i4N36Kp4CF09P9sfMbK2tAp1Nz7MuzwUvcvovxF0h2R
         B8oxkci5KmV88Y079GFKPyGw//Hhbg2UqBrIg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:content-transfer-encoding
         :in-reply-to:references:subject:from:cc:to:date:message-id
         :user-agent;
        bh=757eATNy6DcXBD0dJfNd9a4RLKac7QDmicHrKgoTBRA=;
        b=lP1yX2tUM5G22m3pStbs1tRN6LihPPRxRgyeMdXdtMiZ0D2YBc/smflXhGgw/38U4c
         65iWnzyvAgyrSAOhYUZVGmoWDf+JQbJpdX4/XA8hn5X0FmXjbzN/mZmv3jTyeIIhtZTP
         AHAeNk9WXljvUJ80mbisHPx9lh9qhBi6IHu8L1QPS+7I37Og44JACP5hTNrBJThiVa8/
         MxA0QP8xFgVe2sqwu7p/JWZIFuKmszHC9axgJ6uodys56mWILhzbebSrkytfEyo3k3q0
         ko9w70ap3fcFSWylGUMWIpwG/aCWNm7kxVZhIvt5VoPnP0D6Itp1buV1edo5jMjJe+Lt
         IotQ==
X-Gm-Message-State: AGi0PuZjlhMHkETTV6XyLHtsYD7jPAo5BnMXy9K9vSyQi69igr5Gw/Nj
        8mU2KI8gtHJ2IEqw1HOlMmLTAg==
X-Google-Smtp-Source: APiQypKw5WR5DnbdToP85PGHkarWb37+RaJrV6IbrFuNZsd1ng8JTeIUGSD+QIQsNJ+078GoGRpPTA==
X-Received: by 2002:a63:3242:: with SMTP id y63mr1578172pgy.28.1587749228820;
        Fri, 24 Apr 2020 10:27:08 -0700 (PDT)
Received: from chromium.org ([2620:15c:202:1:fa53:7765:582b:82b9])
        by smtp.gmail.com with ESMTPSA id d18sm6327663pfq.177.2020.04.24.10.27.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Apr 2020 10:27:08 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <CAD=FV=V7KfjEpdQdkXdnGK86cEkpO_SxcDgFiXqAr8oj25P_zw@mail.gmail.com>
References: <20200424045414.133381-1-swboyd@chromium.org> <20200424045414.133381-3-swboyd@chromium.org> <CAD=FV=U6YiD=ORDuuRsYVRJriv+jJie3=HoF7MokWbj5Wx0rew@mail.gmail.com> <CAD=FV=V7KfjEpdQdkXdnGK86cEkpO_SxcDgFiXqAr8oj25P_zw@mail.gmail.com>
Subject: Re: [PATCH 2/3] soc: qcom: rpmh-rsc: Loop over less bits in irq handler
From:   Stephen Boyd <swboyd@chromium.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        LKML <linux-kernel@vger.kernel.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        Maulik Shah <mkshah@codeaurora.org>
To:     Doug Anderson <dianders@chromium.org>
Date:   Fri, 24 Apr 2020 10:27:07 -0700
Message-ID: <158774922735.135303.1360850783025067093@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Doug Anderson (2020-04-24 10:13:43)
> Hi,
>=20
> On Fri, Apr 24, 2020 at 10:11 AM Doug Anderson <dianders@chromium.org> wr=
ote:
> >
> > Hi,
> >
> > On Thu, Apr 23, 2020 at 9:54 PM Stephen Boyd <swboyd@chromium.org> wrot=
e:
> > >
> > > readl returns a u32, and BITS_PER_LONG is different on 32-bit vs. 64-=
bit
> > > architectures. Let's make the type we stash the readl into a u32 and
> > > then loop over the bits set in that type instead of potentially loopi=
ng
> > > over more bits than we will ever need to.
> > >
> > > Cc: Maulik Shah <mkshah@codeaurora.org>
> > > Cc: Douglas Anderson <dianders@chromium.org>
> > > Signed-off-by: Stephen Boyd <swboyd@chromium.org>
> > > ---
> > >  drivers/soc/qcom/rpmh-rsc.c | 4 ++--
> > >  1 file changed, 2 insertions(+), 2 deletions(-)
> >
> > Reviewed-by: Douglas Anderson <dianders@chromium.org>
>=20
> Oh, I suppose one nit is s/less/fewer/ in the subject.  "bits" are
> discrete / countable, not continuous / uncountable.
>=20

Ok that's good.
