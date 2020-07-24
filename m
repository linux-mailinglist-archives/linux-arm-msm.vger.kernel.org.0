Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id ED03922CF19
	for <lists+linux-arm-msm@lfdr.de>; Fri, 24 Jul 2020 22:11:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726572AbgGXULc (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 24 Jul 2020 16:11:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44444 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726455AbgGXULc (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 24 Jul 2020 16:11:32 -0400
Received: from mail-pl1-x642.google.com (mail-pl1-x642.google.com [IPv6:2607:f8b0:4864:20::642])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 93A3CC0619D3
        for <linux-arm-msm@vger.kernel.org>; Fri, 24 Jul 2020 13:11:32 -0700 (PDT)
Received: by mail-pl1-x642.google.com with SMTP id x9so5163038plr.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 24 Jul 2020 13:11:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:content-transfer-encoding:in-reply-to:references
         :subject:from:cc:to:date:message-id:user-agent;
        bh=bs1aX7lFDIpMImaAa30odJrsbjxTgzOIzVfQ0iVdnGU=;
        b=UJR6Qi/G0RCAPylYoDDP6ro7bWAdTsABFrM3DQu2TYtYADCQM3+wMQOYOur6BiKfxI
         bz8Cm2Gl6vTqsY20UHa0PjMh41cQMPEmqpLhfM5zKlFQT2AeYPzNW8zw8B50s1vQKxEZ
         SQLAwaNPwcAMq0O25XJs8rNeS7i2mSR99Zszs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:content-transfer-encoding
         :in-reply-to:references:subject:from:cc:to:date:message-id
         :user-agent;
        bh=bs1aX7lFDIpMImaAa30odJrsbjxTgzOIzVfQ0iVdnGU=;
        b=THiHpz064SJvCdIjqladaZ5rKyN8MN27fLUMMiTLXdslck5q806NguWgjS08d0x+qv
         7Mb1kjufOrV3LsswH58YJIqURuV1rN/B2j0kHIo0mJ5eAQPdVpyaQprGw824Ke3WDzqd
         qTiO5483idgZOJEQmActd9VE8do0PnivZLZLpH13tHGPou2gkHC0zM9r2zsyyxK91DGx
         JfgZTkhEsbwZ+fjVwzmC5wVwnLp3FPg1GDIU1c6+et95GeX0elWOztjmjAxbUQvT3HyT
         4gvwsGeLcEFT09aywttOxZkOE/v3qHr5+mhf52ddXdCikAgySnpCTeI2B4bYIA3BECDk
         GV3Q==
X-Gm-Message-State: AOAM533yCV4LpfqilkolOlR+lHlumZdXbMYvKrmZaC3mtAyfXifhbyUD
        dsJEsMtpHti/rdjl6KqfifFmyg==
X-Google-Smtp-Source: ABdhPJz25ykO0sRmUj0w0Jh4M7RsJU6ajIMRWPsG0iakfnZwP1VeDqzM8GLYna05GDUUGctTSuzWnw==
X-Received: by 2002:a17:902:7605:: with SMTP id k5mr3645859pll.331.1595621492121;
        Fri, 24 Jul 2020 13:11:32 -0700 (PDT)
Received: from chromium.org ([2620:15c:202:1:3e52:82ff:fe6c:83ab])
        by smtp.gmail.com with ESMTPSA id a17sm7038876pgw.60.2020.07.24.13.11.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Jul 2020 13:11:31 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20200724200841.GJ9185@codeaurora.org>
References: <20200723010137.3127584-1-swboyd@chromium.org> <CAD=FV=WtjyYY+bmocc17S9NbRs6inkAWjj7=c9qBsVf3LtG99Q@mail.gmail.com> <159561988523.3847286.14763422711224252201@swboyd.mtv.corp.google.com> <CAD=FV=WH1vKKe=MPVdtBJZWnSzxNLO0uyM02GFG6oCJfSEwehQ@mail.gmail.com> <159562087212.3847286.9484527206999948907@swboyd.mtv.corp.google.com> <20200724200841.GJ9185@codeaurora.org>
Subject: Re: [PATCH] soc: qcom: rpmh-rsc: Sleep waiting for tcs slots to be free
From:   Stephen Boyd <swboyd@chromium.org>
Cc:     Doug Anderson <dianders@chromium.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        LKML <linux-kernel@vger.kernel.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        Maulik Shah <mkshah@codeaurora.org>
To:     Lina Iyer <ilina@codeaurora.org>
Date:   Fri, 24 Jul 2020 13:11:30 -0700
Message-ID: <159562149056.3847286.11191144133990578500@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Lina Iyer (2020-07-24 13:08:41)
> On Fri, Jul 24 2020 at 14:01 -0600, Stephen Boyd wrote:
> >Quoting Doug Anderson (2020-07-24 12:49:56)
> >> Hi,
> >>
> >> On Fri, Jul 24, 2020 at 12:44 PM Stephen Boyd <swboyd@chromium.org> wr=
ote:
> >I think Lina was alluding to this earlier in this
> >thread.
> I was thinking more of threaded irq handler than a kthread to post the
> requests. We went away from post-thread approach a few years ago.
>=20

Ok, got it. Why was the kthread approach abandoned?
