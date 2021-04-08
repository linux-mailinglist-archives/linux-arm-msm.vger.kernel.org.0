Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F1601358F13
	for <lists+linux-arm-msm@lfdr.de>; Thu,  8 Apr 2021 23:18:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232387AbhDHVSk (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 8 Apr 2021 17:18:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57414 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232332AbhDHVSj (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 8 Apr 2021 17:18:39 -0400
Received: from mail-pf1-x431.google.com (mail-pf1-x431.google.com [IPv6:2607:f8b0:4864:20::431])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 08BE9C061761
        for <linux-arm-msm@vger.kernel.org>; Thu,  8 Apr 2021 14:18:28 -0700 (PDT)
Received: by mail-pf1-x431.google.com with SMTP id a85so2340106pfa.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 08 Apr 2021 14:18:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:content-transfer-encoding:in-reply-to:references
         :subject:from:cc:to:date:message-id:user-agent;
        bh=eMJqD/fqXJ5uLABupYwuAFtb+eXg8FbLVYjFY1l+JZE=;
        b=WXrRoVzuMf9BD4yUg+IpXzC2x3gX/wbaMSa6eADIuq8tW2NcrsTP8iBbT0ZE+BBspY
         UdjqkArP2IGzTenHhET/UYo7gZvZSBSoDn+GrXCgbPMMTAPdkUJxEi6hN2K7Ds8w9Orh
         GQgnI7o1QA3fn+jTBiFwoLOPpElxYm+J6VCqQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:content-transfer-encoding
         :in-reply-to:references:subject:from:cc:to:date:message-id
         :user-agent;
        bh=eMJqD/fqXJ5uLABupYwuAFtb+eXg8FbLVYjFY1l+JZE=;
        b=d7hUtfbqfLFLfaPorfATGEiUNBM1yRTP/79Tj7WVUFzzOd2h3DrB27vaq7G3Lg/cH0
         bOfPer7KCUvE3xIiOsU3QG2tlkMNb37AlwOtfTaNYt9YmF8cbmPr9+a/aQvs9UvE/gsW
         74Fej0LdQOCa9HJyZBQ2w4pAo2B3e4KlYYxTBE24Wzwai+PIvxFDipHnckhbtx2X7qAT
         OYgger/MQ76IRFUDsx2KE/3cQ3TfZPsn62Pmq6hXrrT1gpIdUa+jpb2veFyrr1DkVN46
         zRVijPSG7YM8ZdU7rSGYs1BQG0JmO75CJH9PaSgdAWaXO3M267aHAvpEeqczBy/G2zFx
         2VLQ==
X-Gm-Message-State: AOAM533ovz9WTxCF2XLIFdMUE+/Lm+KRT1y66blaYiZsRXPhvCr+YULi
        pDJyZ9EOwFNLAhYqja5eAEJoSg==
X-Google-Smtp-Source: ABdhPJzqcrjJVjp7Jz1iRbl6acGeE5u8fk0+tkP162pfieOXXOIbCvRvJBqRdizl0jmycyffZ7/RVw==
X-Received: by 2002:a05:6a00:1595:b029:217:49e9:2429 with SMTP id u21-20020a056a001595b029021749e92429mr9440770pfk.80.1617916707523;
        Thu, 08 Apr 2021 14:18:27 -0700 (PDT)
Received: from chromium.org ([2620:15c:202:201:44c3:3248:e7f5:1bbd])
        by smtp.gmail.com with ESMTPSA id z20sm243105pfk.21.2021.04.08.14.18.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Apr 2021 14:18:26 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <YG6ukFxSMAZ7biYh@gerhold.net>
References: <20210323224336.1311783-1-swboyd@chromium.org> <6ec0ca8d-85c7-53d6-acf2-22c4ac13e805@codeaurora.org> <161734672825.2260335.8472441215895199196@swboyd.mtv.corp.google.com> <YGbvXFrMg6X7q3qL@gerhold.net> <161738411853.2260335.5107124874054215375@swboyd.mtv.corp.google.com> <YGsHkoNEaIvCRdpx@gerhold.net> <161784072681.3790633.7665111601750934002@swboyd.mtv.corp.google.com> <YG6ukFxSMAZ7biYh@gerhold.net>
Subject: Re: [PATCH v2] firmware: qcom_scm: Only compile legacy calls on ARM
From:   Stephen Boyd <swboyd@chromium.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Elliot Berman <eberman@codeaurora.org>,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        Brian Masney <masneyb@onstation.org>,
        Jeffrey Hugo <jhugo@codeaurora.org>,
        Douglas Anderson <dianders@chromium.org>
To:     Stephan Gerhold <stephan@gerhold.net>
Date:   Thu, 08 Apr 2021 14:18:25 -0700
Message-ID: <161791670545.3790633.14772376161713976241@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Stephan Gerhold (2021-04-08 00:19:44)
> Personally, I think it would be best to introduce a new, SMC64 only
> compatible (e.g. "qcom,scm-64" like I mentioned). Then you can skip the
> detection check for the boards that opt-in by adding the compatible.
> You can then use it on all newer boards/SoCs/firmwares where you know
> exactly that there is SMC64.
>=20
> I would just like to avoid breaking any existing boards where we don't
> know exactly if they have SMC32 or SMC64.

Ok that's fair.

> >=20
> > Heh, it tried to ensure we use the right calling convention but broke
> > things in the process, because the way of detecting the convention isn't
> > always there. I wouldn't be surprised if this comes up again for other
> > boards that use TF-A.
>=20
> Ah okay, this sounds like a better reason than just trying to avoid the
> "overhead" of the detection step. :) I still think it should work if you
> just start marking all newer boards/SoCs/... as "qcom,scm-64" or
> something like that, right?

Sure. I can cook up a set of patches for this.
