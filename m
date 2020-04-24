Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5E6761B7C6F
	for <lists+linux-arm-msm@lfdr.de>; Fri, 24 Apr 2020 19:12:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728632AbgDXRL7 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 24 Apr 2020 13:11:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40592 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726698AbgDXRL7 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 24 Apr 2020 13:11:59 -0400
Received: from mail-ua1-x943.google.com (mail-ua1-x943.google.com [IPv6:2607:f8b0:4864:20::943])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CAC28C09B046
        for <linux-arm-msm@vger.kernel.org>; Fri, 24 Apr 2020 10:11:58 -0700 (PDT)
Received: by mail-ua1-x943.google.com with SMTP id a7so2278805uak.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 24 Apr 2020 10:11:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Qpkl+qNwwY4WAWznVbHpk6dXXW1O6q1xf3B4ddtrOiY=;
        b=e13dIJUXiJ0D1CzVmUa5XR1DCgFtYc/vR94tal4DUJHTqNtqNAQXVnKbTKJUjexX/d
         bx10TBGZR1HkRAoeIfpdPEik3DNZMTSc9Cmwlg6escc325VWZfjF8eFvuZNPV/1Pd2JH
         nUOI1P9Jdou4oVcaF5PYZLkZXv0/bJg2tWlgg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Qpkl+qNwwY4WAWznVbHpk6dXXW1O6q1xf3B4ddtrOiY=;
        b=e6y67dysekpteUoy5O0EULkXu1erlMVatHWb0SUWbSj3995G0/nMqxd9sYeArA0xrv
         hKjeu5EYNgwAyx218U/pU0Q4BWPN+UZJsarYkCFZWqbGwgJ7tItrymMInu7kIWP7Nt7h
         s4f5ef5ADESnZHMEXTReLNfsInFTRIAnhjTaq0ggtl61tBWXzbE+2vKWXJga2IsELmaI
         pLNZzPinSnW6lrLjJumhPl/KH0u4Uw3IDCg4oPpGo8fqy9bkwfLxLjsSQvK6b/UAkifV
         NOB3aSrM2UPynfvIBLwcq4akZI+BuyYbxAmB5ljRqdcUrHu6xv2KkTujNFXr7OmSq15Z
         w0pw==
X-Gm-Message-State: AGi0PuZSYCq0Ei1YQD0N6SkcqQX0NDekzf38D7mfscoC3RXzJACBU8Tz
        KpAOf8YK8fkx8g1yySZLBoKtXUZDLeg=
X-Google-Smtp-Source: APiQypItHLRUjZxhSDsDebQAhjVNh3au3HUTc964FcW+XEDpGGr0q6T12m8DMcyEbWu2StzHx0Sz0A==
X-Received: by 2002:a67:63c3:: with SMTP id x186mr8283294vsb.63.1587748317131;
        Fri, 24 Apr 2020 10:11:57 -0700 (PDT)
Received: from mail-ua1-f41.google.com (mail-ua1-f41.google.com. [209.85.222.41])
        by smtp.gmail.com with ESMTPSA id t66sm1710998vkb.23.2020.04.24.10.11.55
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 24 Apr 2020 10:11:55 -0700 (PDT)
Received: by mail-ua1-f41.google.com with SMTP id t8so10207622uap.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 24 Apr 2020 10:11:55 -0700 (PDT)
X-Received: by 2002:a67:3293:: with SMTP id y141mr8719886vsy.54.1587748315110;
 Fri, 24 Apr 2020 10:11:55 -0700 (PDT)
MIME-Version: 1.0
References: <20200424045414.133381-1-swboyd@chromium.org> <20200424045414.133381-4-swboyd@chromium.org>
In-Reply-To: <20200424045414.133381-4-swboyd@chromium.org>
From:   Doug Anderson <dianders@chromium.org>
Date:   Fri, 24 Apr 2020 10:11:43 -0700
X-Gmail-Original-Message-ID: <CAD=FV=UYNKOtTHQO7v5ad4KgDV-SzbSnqy9G3vFkSZmWmW=NMg@mail.gmail.com>
Message-ID: <CAD=FV=UYNKOtTHQO7v5ad4KgDV-SzbSnqy9G3vFkSZmWmW=NMg@mail.gmail.com>
Subject: Re: [PATCH 3/3] soc: qcom: rpmh-rsc: Fold WARN_ON() into if condition
To:     Stephen Boyd <swboyd@chromium.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        LKML <linux-kernel@vger.kernel.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        Maulik Shah <mkshah@codeaurora.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi,

On Thu, Apr 23, 2020 at 9:54 PM Stephen Boyd <swboyd@chromium.org> wrote:
>
> Move the WARN_ON() into the if condition so the compiler can see that
> the branch is unlikely() and possibly optimize it better.
>
> Cc: Maulik Shah <mkshah@codeaurora.org>
> Cc: Douglas Anderson <dianders@chromium.org>
> Signed-off-by: Stephen Boyd <swboyd@chromium.org>
> ---
>  drivers/soc/qcom/rpmh-rsc.c | 4 +---
>  1 file changed, 1 insertion(+), 3 deletions(-)

Reviewed-by: Douglas Anderson <dianders@chromium.org>
