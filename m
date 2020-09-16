Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7653826CA0C
	for <lists+linux-arm-msm@lfdr.de>; Wed, 16 Sep 2020 21:44:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727589AbgIPTnO (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 16 Sep 2020 15:43:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53690 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727958AbgIPTnG (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 16 Sep 2020 15:43:06 -0400
Received: from mail-pl1-x642.google.com (mail-pl1-x642.google.com [IPv6:2607:f8b0:4864:20::642])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 582D2C06174A
        for <linux-arm-msm@vger.kernel.org>; Wed, 16 Sep 2020 12:42:50 -0700 (PDT)
Received: by mail-pl1-x642.google.com with SMTP id r19so3751768pls.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 16 Sep 2020 12:42:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:content-transfer-encoding:in-reply-to:references
         :subject:from:cc:to:date:message-id:user-agent;
        bh=uI2M1b5CJmiot/6Hd8YrKzzoCzUgOR4d8982RGbGjD8=;
        b=mdqEeSdYH5tz+BxLF4boEJJhntqAmdYlAI6RJyaLW8zNxInQKWsMvG5jjeXIsjftb0
         WdtN41v/JR3azTNc97XwywJ+LpJfFCvgdrs0j5Z+ZRkFSW8Y46I7SAcZ7+Ry+1Qi3Sk3
         vA4gXc8kWMF9jk1hykVzXWlj046Zhvz8rCXbs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:content-transfer-encoding
         :in-reply-to:references:subject:from:cc:to:date:message-id
         :user-agent;
        bh=uI2M1b5CJmiot/6Hd8YrKzzoCzUgOR4d8982RGbGjD8=;
        b=mf/K9ZhRiwhfhzjCVcnEWXMOloHqCLpuR+msTMEJ9GnV29IWcAztFVIpdHsZA2taWQ
         is5tg9dQAj7QjG3fuch46RdqNI6yHS9foHuhOTTDso9FmarsrUqBXL53PDSBCz8RX1ci
         JKFi2mfGMtBZ8lLcoeyUwHANKFf8lZnwR2mwqbjK8zRy3i3jbL4yDaNMJwNY4WaiArCM
         qJbkkX7+9VqKWLCKcxk9YUgs+Qy2EIm2/6rMnvD97j44AsDCA5CPE9WCfuSbGa9/AxBC
         ku92fFY+MKb5TWRn78KBomFlMkHNFuiLtEHqdImXrnbuQtNB+D0jzRwPAEAkpliT3IJ0
         WUEA==
X-Gm-Message-State: AOAM531wcX7qyoLI3+xiBQb31bKWPVJfwgpSJp4u2AnKqpuP8I9/ViyA
        vXX4PBr0LD79lqMn7Km6C2ussA==
X-Google-Smtp-Source: ABdhPJykmzdZLk88uv+LmjEE31cyv5pE9gp7ym7Z31sba/goptxv5DmuVBCotn6wnasSvqYZ3LdHQw==
X-Received: by 2002:a17:90a:bf8c:: with SMTP id d12mr5450291pjs.157.1600285369764;
        Wed, 16 Sep 2020 12:42:49 -0700 (PDT)
Received: from chromium.org ([2620:15c:202:1:3e52:82ff:fe6c:83ab])
        by smtp.gmail.com with ESMTPSA id y6sm3468330pji.1.2020.09.16.12.42.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Sep 2020 12:42:48 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20200915202432.GA2435458@bogus>
References: <20200910004902.2252694-1-swboyd@chromium.org> <20200910004902.2252694-2-swboyd@chromium.org> <159972050159.2295844.14715100754744266014@swboyd.mtv.corp.google.com> <20200915202432.GA2435458@bogus>
Subject: Re: [PATCH v3 01/10] dt-bindings: phy: qcom,qmp-usb3-dp: Add DP phy information
From:   Stephen Boyd <swboyd@chromium.org>
Cc:     Kishon Vijay Abraham I <kishon@ti.com>,
        Vinod Koul <vkoul@kernel.org>, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org,
        Jeykumar Sankaran <jsanka@codeaurora.org>,
        Chandan Uddaraju <chandanu@codeaurora.org>,
        Vara Reddy <varar@codeaurora.org>,
        Tanmay Shah <tanmay@codeaurora.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Manu Gautam <mgautam@codeaurora.org>,
        Sandeep Maheswaram <sanm@codeaurora.org>,
        Douglas Anderson <dianders@chromium.org>,
        Sean Paul <seanpaul@chromium.org>,
        Jonathan Marek <jonathan@marek.ca>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        devicetree@vger.kernel.org, Rob Clark <robdclark@chromium.org>
To:     Rob Herring <robh@kernel.org>
Date:   Wed, 16 Sep 2020 12:42:46 -0700
Message-ID: <160028536666.4188128.14311541474912461984@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Rob Herring (2020-09-15 13:24:32)
> On Wed, Sep 09, 2020 at 11:48:21PM -0700, Stephen Boyd wrote:
> > Quoting Stephen Boyd (2020-09-09 17:48:53)
> > > This binding only describes the USB phy inside the USB3 + DP "combo"
> > > phy. Add information for the DP phy and describe the sub-nodes that
> > > represent the DP and USB3 phys that exist inside the combo wrapper.
> > > Remove reg-names from required properties because it isn't required n=
or
> > > used by the kernel driver.
> > >=20
> > > Cc: Jeykumar Sankaran <jsanka@codeaurora.org>
> > > Cc: Chandan Uddaraju <chandanu@codeaurora.org>
> > > Cc: Vara Reddy <varar@codeaurora.org>
> > > Cc: Tanmay Shah <tanmay@codeaurora.org>
> > > Cc: Bjorn Andersson <bjorn.andersson@linaro.org>
> > > Cc: Manu Gautam <mgautam@codeaurora.org>
> > > Cc: Sandeep Maheswaram <sanm@codeaurora.org>
> > > Cc: Douglas Anderson <dianders@chromium.org>
> > > Cc: Sean Paul <seanpaul@chromium.org>
> > > Cc: Jonathan Marek <jonathan@marek.ca>
> > > Cc: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > > Cc: <devicetree@vger.kernel.org>
> > > Cc: Rob Herring <robh+dt@kernel.org>
> > > Cc: Rob Clark <robdclark@chromium.org>
> > > Signed-off-by: Stephen Boyd <swboyd@chromium.org>
> > > ---
> > >  .../bindings/phy/qcom,qmp-usb3-dp-phy.yaml    | 91 +++++++++++++++++=
--
> > >  1 file changed, 81 insertions(+), 10 deletions(-)
> >=20
> > I noticed that I didn't document the new compatible string I'm using,
> > qcom,sc7180-qmp-usb3-dp-phy, ugh.
> >=20
> > Should I copy the whole file over and make a new document for the new
> > compatible string? That feels like the better solution vs. making this
> > binding have min/max stuff where it fails to enforce the DP part of the
> > phy. We can delete this binding once the kernel tree isn't using it,
> > right?
>=20
> It generally depends on how much if/then schema you have (or should=20
> have) vs. how much is common, but it's a judgement call. It looks=20
> like you are just extending the binding for the most part. If there's=20
> dtb warnings until the existing stuff gets updated, that's fine.
>=20

Ok. I'll just add in the extra compatible and then we can drop the older
ones at some point.
