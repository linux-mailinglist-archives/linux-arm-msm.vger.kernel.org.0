Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 70E3525CE24
	for <lists+linux-arm-msm@lfdr.de>; Fri,  4 Sep 2020 00:55:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728692AbgICWzw (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 3 Sep 2020 18:55:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57988 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727804AbgICWzu (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 3 Sep 2020 18:55:50 -0400
Received: from mail-pg1-x541.google.com (mail-pg1-x541.google.com [IPv6:2607:f8b0:4864:20::541])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7CD53C061244
        for <linux-arm-msm@vger.kernel.org>; Thu,  3 Sep 2020 15:55:50 -0700 (PDT)
Received: by mail-pg1-x541.google.com with SMTP id 31so3268947pgy.13
        for <linux-arm-msm@vger.kernel.org>; Thu, 03 Sep 2020 15:55:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:content-transfer-encoding:in-reply-to:references
         :subject:from:cc:to:date:message-id:user-agent;
        bh=KThOpLxfiiQ/1JkMcjWmqK6Z2YygVIsJhTEGjO3bh+k=;
        b=KO5qumOhlDyAUT7wkFufwR+SaGNVjlmgv1uzgfFg0XTcJU4o0wm8Z5ZM4/EB7Pzyf8
         f3pRE57Ch1ziVrbEOZcoiNQZArKQ4sGfRCUgiOi0dYJwTmnHuyhatYbUJjd6Q3Mn7XVc
         8D3M3R0BR9T4AX2MNHIHmPtfIGP7f6oGzbed4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:content-transfer-encoding
         :in-reply-to:references:subject:from:cc:to:date:message-id
         :user-agent;
        bh=KThOpLxfiiQ/1JkMcjWmqK6Z2YygVIsJhTEGjO3bh+k=;
        b=AOPTCcGKOPM22dpw+aiEQVL4wIZub9W9WjtyEeFp/+/EtIAMhUKFdmnkg7PIKSFMTB
         /5CKI+gt3k5LBIgjLpydOJ68cC1pgMZeibYS9kpQO93KLqhDk0Dg2Ftn8IPsz5UWbFZi
         Nop5PnZ+aRz6ZtxbwOZ7ddLBTXwcLB9j0WkriFZXXMRVIbZmnEoy/s6lHanEsc+zmNjb
         n1PrPtoFUA2NJAJEkX+3c647Muo4IraW8qmt9hm0ApBDzvgnUKT7Vs9r2ijK2esyZRoo
         4Uxxf6Dh8PfOZ3PXrsVzJ4rF7VYU0RryuaRS3f2YkNXtRHZkxD7Xi+nI1ohY1cGrcPR7
         BXFA==
X-Gm-Message-State: AOAM530mmW3AFsbWfLie1Lz2+ZY+88oyd6+ScMrMw3zD845hkfZh8xFp
        QtW7SsgN2+6cT07cDHL9Tf+eCfa9TUQiqw==
X-Google-Smtp-Source: ABdhPJyXpP91L4mpWngVxy8GUyGX4M1TVrS2gDSIsc2kkLT0rveU7Vfi4YchW3pOUbvHOE/Lue2rNA==
X-Received: by 2002:a63:1521:: with SMTP id v33mr4916302pgl.374.1599173749829;
        Thu, 03 Sep 2020 15:55:49 -0700 (PDT)
Received: from chromium.org ([2620:15c:202:1:3e52:82ff:fe6c:83ab])
        by smtp.gmail.com with ESMTPSA id x192sm744137pfc.142.2020.09.03.15.55.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Sep 2020 15:55:49 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <62bdac87-b886-58c1-f071-095ec9945f68@linaro.org>
References: <20200826024711.220080-1-swboyd@chromium.org> <20200826024711.220080-7-swboyd@chromium.org> <335a0660-40e1-0c1e-3f7d-87f7024de18a@linaro.org> <159900847014.334488.14041376759905055412@swboyd.mtv.corp.google.com> <62bdac87-b886-58c1-f071-095ec9945f68@linaro.org>
Subject: Re: [PATCH v1 6/9] phy: qcom-qmp: Add support for DP in USB3+DP combo phy
From:   Stephen Boyd <swboyd@chromium.org>
Cc:     linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        Jeykumar Sankaran <jsanka@codeaurora.org>,
        Chandan Uddaraju <chandanu@codeaurora.org>,
        Vara Reddy <varar@codeaurora.org>,
        Tanmay Shah <tanmay@codeaurora.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Manu Gautam <mgautam@codeaurora.org>,
        Sandeep Maheswaram <sanm@codeaurora.org>,
        Douglas Anderson <dianders@chromium.org>,
        Sean Paul <seanpaul@chromium.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Jonathan Marek <jonathan@marek.ca>,
        Rob Clark <robdclark@chromium.org>
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Kishon Vijay Abraham I <kishon@ti.com>,
        Vinod Koul <vkoul@kernel.org>
Date:   Thu, 03 Sep 2020 15:55:47 -0700
Message-ID: <159917374772.334488.3072425606687060968@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Dmitry Baryshkov (2020-09-03 05:37:02)
> On 02/09/2020 04:01, Stephen Boyd wrote:
> > Quoting Dmitry Baryshkov (2020-09-01 06:36:34)
> >> With these functions I'm struggling between introducing
> >> PHY_TYPE_DP_V3/V4 and introducing callbacks into qmp_phy_cfg. What wou=
ld
> >> you prefer?
> >>
> >> What about the following struct?
> >>
> >> struct qmp_phy_dp_opts {
> >>          void (*dp_aux_init)(struct qmp_phy *qphy);
> >>          void (*dp_configure_tx)(struct qmp_phy *qphy);
> >>          void (*dp_configure_lanes)(struct qmp_phy *qphy);
> >> };
> >>
> >> I'm not sure about dp_calibrate().
> >>
> >=20
> > Is there v4 code somewhere that I can see? Another level of indirection
> > is always a solution, so it is probably fine. This driver is currently
> > written with many conditionals instead of function tables so I'm not
> > sure it fits in with the style of how things are done though. The
> > alternative is to use an enum and call different functions?
>=20
> Downstream DP driver sources can be found here:
> https://source.codeaurora.org/quic/la/platform/vendor/opensource/display-=
drivers/tree/msm/dp/dp_catalog_v420.c?h=3DLA.UM.8.12.r1-13900-sm8250.0
>=20
> https://source.codeaurora.org/quic/la/platform/vendor/opensource/display-=
drivers/tree/pll/dp_pll_7nm_util.c?h=3DLA.UM.8.12.r1-13900-sm8250.0
>=20

Awesome thanks for the pointer.

> >=20
> > The calibrate call is there to "turn the crank" on the aux settings.  I
> > need to cycle through the different values for that aux register so that
> > aux can be tuned properly. The AUX channel really has another phy that
> > needs tuning so we're sort of combining the aux and DP link phy together
> > here by letting the calibrate call tune the AUX phy and the configure
> > call tune the DP phy. I don't see any sort of concept of an AUX phy
> > though so this seemed ok. Does v4 need to tune more registers?
>=20
>=20
> It looks like four values are written to AUX_CFG1:
> 0x20, 0x13, 0x23, 0x1d
>=20

Ok, so still just AUX_CFG1 but now some different values. Maybe it
should come from DT if it really differs based on board design. I don't
know if it does though. If it does differ it would be nice to know what
the settings are and if it doesn't just make sense to iterate through
all 256 of them instead of targeting specific ones.
