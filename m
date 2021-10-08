Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D2BD2426218
	for <lists+linux-arm-msm@lfdr.de>; Fri,  8 Oct 2021 03:37:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229552AbhJHBjq (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 7 Oct 2021 21:39:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41614 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229526AbhJHBjq (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 7 Oct 2021 21:39:46 -0400
Received: from mail-oi1-x233.google.com (mail-oi1-x233.google.com [IPv6:2607:f8b0:4864:20::233])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3EE0EC061714
        for <linux-arm-msm@vger.kernel.org>; Thu,  7 Oct 2021 18:37:52 -0700 (PDT)
Received: by mail-oi1-x233.google.com with SMTP id z11so11674706oih.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 07 Oct 2021 18:37:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:in-reply-to:references:from:user-agent:date:message-id
         :subject:to:cc;
        bh=yVAkjeIZi/RbzxYhdceixworGw/JG9cDOxqyScssBzU=;
        b=CJatcbsfmIt8VOcjDy6VK/c4MgLoP+YSH4Vh+1zhbf06EXs5ffcEmOL36kTm2u5Fp9
         4KUU/PEHnASbvGn2Rb9wxHUHv7VSrxFVcY2KR8okjiELFtQxff/HUcc9DgQQjw1+r+5u
         vk68wSomU4qloYAhHg38a9fccY7A/6pfYKeWY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:in-reply-to:references:from
         :user-agent:date:message-id:subject:to:cc;
        bh=yVAkjeIZi/RbzxYhdceixworGw/JG9cDOxqyScssBzU=;
        b=sMqhhYaFWLS6ytab+EEuhFp+Gcu7DSQSHRh6YfvLsqQfgTNGTX2uoOXH2lmKusRYu4
         NFRf0BhkFIBNQqicG/gj/63NalQB7iXaHwCw6RCsUKOKi/W5ybsSL5ktvDw3doo6yakc
         8wZl1iPrKdA65INYeWYud/heMJZR8FPMyn03JLPePdByYCbRldREHiOK7BX1+lBx5Aca
         Ysp+xVc4VwVUJwh0zyZLOPnl0CEgcWbEm7UmPdVWTqhBl1Td9ozLSNA85mpVJbBAIqSl
         Xvn+TOMv9Hv/+H53aDsJgJLF0+Nc2/qdnZd+LRT8RouqvaDmfyw7W+zXCXotDrrrlCjJ
         q8jQ==
X-Gm-Message-State: AOAM533MnvWJYaoxJgcAoJzbs+RDcbGlQZBbNaFljrjRDyGyrdF9DDyE
        E+UCOD10MkAbJsyBb9/yLIFC+3LNTGqxKz3G2hCJbg==
X-Google-Smtp-Source: ABdhPJwG27QOLOYB0BYRIv+qYzPsjyc+Fm+gkPI77N3rDpZ12HYcKlJ51jPrBtfX7D/I+FlamQPJfMTeoN7KcVFQPow=
X-Received: by 2002:aca:42d7:: with SMTP id p206mr14522862oia.32.1633657071628;
 Thu, 07 Oct 2021 18:37:51 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 7 Oct 2021 21:37:51 -0400
MIME-Version: 1.0
In-Reply-To: <CAGETcx9+pL1DxDyZOBGFFVsmb0haAzJTFtyQFEO9ab9u8N=FXQ@mail.gmail.com>
References: <20211006193819.2654854-1-swboyd@chromium.org> <20211006193819.2654854-3-swboyd@chromium.org>
 <CAGETcx9T59dHXodt9MW=tTV_hYhtNOZzYFT=35D--VN7WJ0GqQ@mail.gmail.com>
 <CAE-0n50YqKr1nKy-4WaxsfuwPiJ5kZcf46t-U_4i-TpfXzOX1g@mail.gmail.com>
 <CAE-0n532XYgT=dTTCyLcwikvxgUyGi=TcybDh=v3wQTNb=wqyw@mail.gmail.com>
 <CAGETcx_0GRg7u3dAxP9u0qO-hfJ0N3V44CGLwFFX1kVxZ00g+w@mail.gmail.com>
 <CAE-0n52ytNtf5atojYrLviuAKOt3v+mLVoPeqtRUf-6uBpkiJA@mail.gmail.com> <CAGETcx9+pL1DxDyZOBGFFVsmb0haAzJTFtyQFEO9ab9u8N=FXQ@mail.gmail.com>
From:   Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.9.1
Date:   Thu, 7 Oct 2021 21:37:51 -0400
Message-ID: <CAE-0n51DJc9FNDZM-ybsP8ivoGN6ARsJN_MALr80SmDn5FXLpA@mail.gmail.com>
Subject: Re: [PATCH v2 02/34] component: Introduce the aggregate bus_type
To:     Saravana Kannan <saravanak@google.com>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        Daniel Vetter <daniel.vetter@ffwll.ch>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Rob Clark <robdclark@gmail.com>,
        Russell King <rmk+kernel@arm.linux.org.uk>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Saravana Kannan (2021-10-07 18:32:20)
> On Thu, Oct 7, 2021 at 6:24 PM Stephen Boyd <swboyd@chromium.org> wrote:
> >
> > Anyway, I think we still have to do a rescan so that we can try to bind
> > the aggregate device. Is there a better API to use for that?
>
> If you know the exact device, you could call device_attach()? That's
> what bus_rescan_devices() eventually calls, but you skip the
> unnecessary looping over all the other devices.
>

Unfortunately we don't know the device. At this point it's possible that
the aggregate device hasn't even been registered yet.
