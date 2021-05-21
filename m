Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8F49B38D077
	for <lists+linux-arm-msm@lfdr.de>; Sat, 22 May 2021 00:02:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229613AbhEUWEV (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 21 May 2021 18:04:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59922 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229472AbhEUWEU (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 21 May 2021 18:04:20 -0400
Received: from mail-oi1-x22c.google.com (mail-oi1-x22c.google.com [IPv6:2607:f8b0:4864:20::22c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F1A74C061574
        for <linux-arm-msm@vger.kernel.org>; Fri, 21 May 2021 15:02:56 -0700 (PDT)
Received: by mail-oi1-x22c.google.com with SMTP id c196so12836964oib.9
        for <linux-arm-msm@vger.kernel.org>; Fri, 21 May 2021 15:02:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:in-reply-to:references:from:user-agent:date:message-id
         :subject:to:cc;
        bh=N4WDRHJzz65u4VfeYJW6joOLDC2TOf7BbCNb8jma3Ds=;
        b=lfkQEcoJDzWkpaNQkq45vsQfYAFYQvjFjWDhsaxUacnqXj1TyseJXeorDzXc0RtOQz
         Aiy46ofTKuXrN095DXIH4oEfrR9k5TP0SxQU4Xk07U+Gy/2ozQpC6gZI7ACKzlSrleuL
         +tvdyizaE58T36IItLv0VfNZs9UI4xHjHn4WQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:in-reply-to:references:from
         :user-agent:date:message-id:subject:to:cc;
        bh=N4WDRHJzz65u4VfeYJW6joOLDC2TOf7BbCNb8jma3Ds=;
        b=l3pVQMAORrPsflM9jzv+FPHeUhLqQTYJTvAcdmS8tOYJEkeI5fnelNVCT8Jo+pGUo0
         vaj0C++8pQrCOub7/oPZL+xcvkQZ+uMNiBbkWsfQqhaVFKndOa8kPzN2QBrItl1sGTMc
         ktsTfidRO3NakDcpkxmZ4bXzP9X3yOqjLgN6Xr3t9Y3hR7okjtf+K7xfjs9LCZA386r/
         +49RLSxIqEbEZPAeDSkH1fL21PzxWVUQ4vKNvrZnHgSTEXuZMUtj/V6LrDmQsC1FX1LO
         ZupMdvGQIHGn631Gj0SlLrjSRCzo6jDWNnKGmNMueK7ibymPrcKxZRrzDKQTzDE7ENVK
         xYRA==
X-Gm-Message-State: AOAM533V3fFX977C5PD4+ePqGAD/QyVixBtT4llLL5xU8XhSwTx7JczB
        IoDOqa9e72QhCvluuJWV4UOomPlFJQHBC7hI3nRtgT5gJ58=
X-Google-Smtp-Source: ABdhPJw8zLpWLEyiCx8j4huFdDMF7DGsGTaKrD11EDdPJJUOzIBohDVQogjM8wrT9jJfSnGqSuMKQOWpX69bGjp2DEs=
X-Received: by 2002:aca:654d:: with SMTP id j13mr3780480oiw.125.1621634576454;
 Fri, 21 May 2021 15:02:56 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Fri, 21 May 2021 15:02:55 -0700
MIME-Version: 1.0
In-Reply-To: <20210521140031.1.Ibaca694aedfaff823feefa06b29ae746c641dd1a@changeid>
References: <20210521140031.1.Ibaca694aedfaff823feefa06b29ae746c641dd1a@changeid>
From:   Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.9.1
Date:   Fri, 21 May 2021 15:02:55 -0700
Message-ID: <CAE-0n52vsTV_GPRQ4Fyvm7WQ0HHZ3r2GK4F+qv8qm9659WqTmg@mail.gmail.com>
Subject: Re: [PATCH 1/2] nvmem: core: constify nvmem_cell_read_variable_common()
 return value
To:     Douglas Anderson <dianders@chromium.org>,
        Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Cc:     Rajendra Nayak <rnayak@codeaurora.org>,
        linux-arm-msm@vger.kernel.org, Joe Perches <joe@perches.com>,
        linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Douglas Anderson (2021-05-21 14:00:57)
> The caller doesn't modify the memory pointed to by the pointer so it
> can be const.
>
> Suggested-by: Stephen Boyd <swboyd@chromium.org>
> Signed-off-by: Douglas Anderson <dianders@chromium.org>
> ---

Reviewed-by: Stephen Boyd <swboyd@chromium.org>
