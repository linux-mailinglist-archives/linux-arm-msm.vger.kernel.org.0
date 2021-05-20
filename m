Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AB23038BA7F
	for <lists+linux-arm-msm@lfdr.de>; Fri, 21 May 2021 01:43:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234438AbhETXos (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 20 May 2021 19:44:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40200 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234446AbhETXop (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 20 May 2021 19:44:45 -0400
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com [IPv6:2a00:1450:4864:20::130])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4E7A6C061574
        for <linux-arm-msm@vger.kernel.org>; Thu, 20 May 2021 16:43:22 -0700 (PDT)
Received: by mail-lf1-x130.google.com with SMTP id x19so27039211lfa.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 20 May 2021 16:43:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=53C1hfvSqmgg+nungZ28Wt68bSH0DONGE5fhh6kZnQc=;
        b=ENX17ixMrZ6LlFjW2Hbl22WtfgniaMbSi4okNpeMs4vVauku+eqDwyn6oEZESJXMxY
         PQyf7UprsW4oHu38k5myavH9faHMeACdc956gz0xg+9c6hfrXYWwf/ttU5SyDqe6HIkC
         XwI52FPB/ACpKyTG/3ghEmAoxWRpNz0TsnvXVvFGzHD6pRaKLL+KWov4ezpDXg2Z7hoZ
         HRqXf7x6XKl73GWbkCgRLdaKQ55VON9F+LfovOgkqN2So3Es3oA/Ht70YfUXv1VoPM6/
         dtmNHBcLemlfAUVve/bIApLnwG+SdheSFgmZHY3nlzA4EdEIi6+qXAxcjnFpGiAbebZ/
         zcXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=53C1hfvSqmgg+nungZ28Wt68bSH0DONGE5fhh6kZnQc=;
        b=a8JjPjDHdtZo17cj6ThOcvKiBAtYMivYMzMMZ/clTldPBidy4efb0zsdLiOpbV1JYx
         Hp9h5BFk9FetmjHS9EOSQ40vrfGE7BFDm5qYRqLXFf/H9++qtNe0htidf8jN1LGMZRbj
         gyaN5/+ovaSn84OEfcCda35GvAQWn2azO9WMqtg1yeBk/V7is3Be4S71klkZGTl+d1Le
         nkTkzNMzGUZ129plHE3Vr2nNJH+2sj+9rdo9OAB9Z12v1Z+yHGFvYnnub/f8HAwswWAa
         NsbyKHwMRl8iwkXdtv+edhQd1VYflBEUwdiEEVMkcv1cJePlYBVC7lj41MCAEzBDwMo/
         p2ew==
X-Gm-Message-State: AOAM5310H5AT4NeeJrHZZHh8jqiVEf/9yobhRAC37VVd2Rrl4pCB3s73
        36LvViSwvFhXeDo2iCqZSYY7aNWTpLK8yGhBs4+XZQ==
X-Google-Smtp-Source: ABdhPJygNMj5WuHzIbvLGIODNPR3orcEL5Kz4yD//0OspA/+6bWSXTMD99hFbettxaKcI97pqpWgO+KAhFftCGBncM0=
X-Received: by 2002:a05:6512:49b:: with SMTP id v27mr4401lfq.29.1621554200649;
 Thu, 20 May 2021 16:43:20 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1621518686.git.geert+renesas@glider.be> <8abfe44e2ad77b6309866531ec662c5daf1e4dbf.1621518686.git.geert+renesas@glider.be>
In-Reply-To: <8abfe44e2ad77b6309866531ec662c5daf1e4dbf.1621518686.git.geert+renesas@glider.be>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Fri, 21 May 2021 01:43:09 +0200
Message-ID: <CACRpkdY1XY55HMEtkdUa-GDdy9v-47rD2aHQ90yObSKo3cmzVg@mail.gmail.com>
Subject: Re: [PATCH 3/5] ARM: dts: qcom-apq8060: Correct Ethernet node name
 and drop bogus irq property
To:     Geert Uytterhoeven <geert+renesas@glider.be>,
        Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     Rob Herring <robh+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
        Andy Gross <agross@kernel.org>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        "David S . Miller" <davem@davemloft.net>,
        Jakub Kicinski <kuba@kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>, netdev <netdev@vger.kernel.org>,
        MSM <linux-arm-msm@vger.kernel.org>, linux-mips@vger.kernel.org,
        linux-kernel <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu, May 20, 2021 at 3:58 PM Geert Uytterhoeven
<geert+renesas@glider.be> wrote:

> make dtbs_check:
>
>     ethernet-ebi2@2,0: $nodename:0: 'ethernet-ebi2@2,0' does not match '^ethernet(@.*)?$'
>     ethernet-ebi2@2,0: 'smsc,irq-active-low' does not match any of the regexes: 'pinctrl-[0-9]+'
>
> There is no "smsc,irq-active-low" property, as active low is the
> default.
>
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

I think Bjorn Andersson has to apply this patch.

Yours,
Linus Walleij
