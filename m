Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 070E348F5C7
	for <lists+linux-arm-msm@lfdr.de>; Sat, 15 Jan 2022 08:50:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232638AbiAOHuf (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 15 Jan 2022 02:50:35 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57350 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232629AbiAOHue (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 15 Jan 2022 02:50:34 -0500
Received: from mail-oi1-x233.google.com (mail-oi1-x233.google.com [IPv6:2607:f8b0:4864:20::233])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C7BF2C061574
        for <linux-arm-msm@vger.kernel.org>; Fri, 14 Jan 2022 23:50:32 -0800 (PST)
Received: by mail-oi1-x233.google.com with SMTP id r138so15598218oie.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 14 Jan 2022 23:50:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:in-reply-to:references:from:user-agent:date:message-id
         :subject:to:cc;
        bh=h3PgS0CNglNFEriFcIB5fPEGJsKvjMbV56HeR6dLGrE=;
        b=EmUyNC5+fyl6EfcWg7V5NP/+/kTDIH/EdOvuowOUADAQekSeyTVMo2Pw+R7MGnNyr3
         5F8QHuI+3uuwmjE0hhIplcSf2WL7/QNRQcOV1244KFMSs7KyWUA1l2Wf6ku/ze8CULMO
         JrK0FD1KD6O13Y02WDkLJ8qPwwJwBY8Rk79Pk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:in-reply-to:references:from
         :user-agent:date:message-id:subject:to:cc;
        bh=h3PgS0CNglNFEriFcIB5fPEGJsKvjMbV56HeR6dLGrE=;
        b=2Uit2x11H7JdcWahYaFQfLX7ZTEI9zl37Bhold6f3iQae3UtumC2oOw/C3x1bk15Hb
         NFNI2tcCAHxU2bkdcSCe7rCWBoHg3qd039oBucoGqYT59+UCmGOONwpNrD0qREZ0Cg4M
         4G2rCCVcOPesx+/dayefx5HubSPwb03AXlDtE0nZYQB5T6kya3c9HHFUBTcORTW6Gg/9
         /syGNEJjkghEUi3Zn+6reVdhZNk2qKc8xhLgR8lhNC/8MFGtK/UlOUOsnv7EfZcaENzK
         wiCGb3oowDDXBvaZr8wdA6ZzAce5h8VK7TADqeMS+5gk3kzvKzRbAWanBXPxqEHm95j5
         FhDw==
X-Gm-Message-State: AOAM532B7fSxuOvMK8CwlGMB5uQsgO5VXfqC6Bd0NJNPLLYmX2RyTipe
        n1eud0NSxmU05E4T6mLuLwxMc8VQJOR4mrnx17opRQ==
X-Google-Smtp-Source: ABdhPJx02kIfoT6/5m/ATyYIlU8INhZ26iHsr9xTblSQKWo5tlo36oAirP0TSNUr8dUl4s8qhL52VFzPwIS7Yj/lE4c=
X-Received: by 2002:aca:a953:: with SMTP id s80mr15972957oie.164.1642233032027;
 Fri, 14 Jan 2022 23:50:32 -0800 (PST)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Sat, 15 Jan 2022 01:50:31 -0600
MIME-Version: 1.0
In-Reply-To: <fc7207eb9958c487fec5679da73d8f3595cc7bb1.camel@mediatek.com>
References: <20220106214556.2461363-1-swboyd@chromium.org> <20220106214556.2461363-26-swboyd@chromium.org>
 <1a3b368eb891ca55c33265397cffab0b9f128737.camel@mediatek.com>
 <CAE-0n53Y3WRy4_QvUm9k9wjjWV7adMDQcK_+1ji4+W25SSeGwg@mail.gmail.com>
 <ff81bc1fe1f1c2060fcf03ba14f1bef584c47599.camel@mediatek.com>
 <CAE-0n53FAHDmCznJ35Xh2aTwXBVwukAM3ioKx8SU9VowSaQSqA@mail.gmail.com>
 <69a10908622512c60790f97942731a8ab989b727.camel@mediatek.com>
 <CAE-0n53ao52UX3sJ67UQ3dgj0-DZ0xTeo-NrmW5YVAuXfAnxZw@mail.gmail.com> <fc7207eb9958c487fec5679da73d8f3595cc7bb1.camel@mediatek.com>
From:   Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.10
Date:   Sat, 15 Jan 2022 01:50:31 -0600
Message-ID: <CAE-0n52kPPXuZH8srbQXC6iPpaM_+2Qewn6-HQ0RNKMxi5Jdsg@mail.gmail.com>
Subject: Re: [PATCH v5 25/32] iommu/mtk: Migrate to aggregate driver
To:     Yong Wu <yong.wu@mediatek.com>
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Douglas Anderson <dianders@chromium.org>,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>,
        Daniel Vetter <daniel.vetter@ffwll.ch>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Rob Clark <robdclark@gmail.com>,
        Russell King <rmk+kernel@arm.linux.org.uk>,
        Saravana Kannan <saravanak@google.com>,
        linux-mediatek@lists.infradead.org,
        iommu@lists.linux-foundation.org, youlin.pei@mediatek.com
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Yong Wu (2022-01-14 23:39:52)
> On Fri, 2022-01-14 at 15:30 -0600, Stephen Boyd wrote:
> >
> > This sounds more correct to me. I'm not an expert on runtime PM
> > though
> > as I always have to read the code to remember how it works. if the
> > device isn't ready for runtime PM until the component bind function
> > is
> > called then runtime PM shouldn't be enabled on the component device.
>
> Anyway, We should update the SMI driver for this case. I prepare a
> patch into this patchset or I send it independently? which way is
> better?

I can roll it into this patch. It needs to be combined otherwise it
breaks the bisectability of the series.
