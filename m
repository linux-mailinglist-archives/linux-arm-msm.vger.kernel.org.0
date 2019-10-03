Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 87789C9E34
	for <lists+linux-arm-msm@lfdr.de>; Thu,  3 Oct 2019 14:18:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729193AbfJCMS4 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 3 Oct 2019 08:18:56 -0400
Received: from mail-lf1-f65.google.com ([209.85.167.65]:34059 "EHLO
        mail-lf1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729330AbfJCMS4 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 3 Oct 2019 08:18:56 -0400
Received: by mail-lf1-f65.google.com with SMTP id r22so1680014lfm.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 03 Oct 2019 05:18:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=gKFKePabTD1eOvwmyyZFiqnLejhQ9oKYDwkVZ0ztKVU=;
        b=gE9aCLkU+HUkyDWPPSzlObegTNQaCKpp8gn7md0zriecl039Tw4imgWwXthG0mDvz0
         eHIr/Hm/AU5HBvVr1y57VpLbkfURQluNd+9TPyHWCL6OZ2doM77HkAvkUgbY/h2tegkk
         lf+yO9lNMbutkV7xay82pr01OhMbpO2as93K7JzqQtlGNyk6fBHj8Dm+I0RQoWBOmDIw
         VvwmGvu6VTXyWEi1dUkDLbE0ibBEsUyMPE3Z17/PpKgit/zlgfLv/gfye8gLaBPNCF/D
         GIFFDZgBsW20y0DpffzVhDBBPsP2TM1IcKuf7azQY42hmk799WIKHd1aGbCC7SUX5qi4
         GTxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=gKFKePabTD1eOvwmyyZFiqnLejhQ9oKYDwkVZ0ztKVU=;
        b=Qmiovu7ltfGVvR7zwvXu1pyskbT2yG7H0UV+xufTW1Hh4110YWhpY+x/pCGEOGvZk7
         8BJ5y/29uWpDZzu81fCFS2ZuiyMJqL8Ws9v5GyJXstbERuq9CSAeBLavo3OWshTi8O65
         ryg3miFylonPWxWBd33cceXx/HFVPSaPeRDsOySmaoh0UsY0Qe6Niz5+tS7MB5L2Om0g
         XFJZtAVfL1Nk2F5c/YhbkWgZf2W4D51+QXfp7j0sW971TypmCsiSSzRlbM72RXvFTDYQ
         5DKFunUwSG7TUilEbBqL9mNfYVOYX4szIXDjh766u6Ce+hVjMivgVasAM9JJci4Ju87u
         rBEg==
X-Gm-Message-State: APjAAAVtqiBDNZlqJ2Yutz7km6sbagbh11qeHMiUG4hNubComiqi6ID3
        EHL0z1zBo4XPIxloPjWmhyqtWokoT3e7yZu3fYl27g==
X-Google-Smtp-Source: APXvYqy4ldz+Wc1aAPF/pbz6ZO/x6cgivxofY8VD+reWEZ8AWkh8iIOzKT3mib7xlGScF5RKod4tsA82CwjBy/zOloo=
X-Received: by 2002:a19:48c3:: with SMTP id v186mr5595003lfa.141.1570105134340;
 Thu, 03 Oct 2019 05:18:54 -0700 (PDT)
MIME-Version: 1.0
References: <1568411962-1022-1-git-send-email-ilina@codeaurora.org> <1568411962-1022-12-git-send-email-ilina@codeaurora.org>
In-Reply-To: <1568411962-1022-12-git-send-email-ilina@codeaurora.org>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Thu, 3 Oct 2019 14:18:42 +0200
Message-ID: <CACRpkdYErXVLAvwBoKhHiKZBOR3CSKYUrTPngb9pWJGBiKCyDg@mail.gmail.com>
Subject: Re: [PATCH RFC v2 11/14] drivers: pinctrl: sdm845: add PDC wakeup
 interrupt map for GPIOs
To:     Lina Iyer <ilina@codeaurora.org>
Cc:     Stephen Boyd <swboyd@chromium.org>,
        Evan Green <evgreen@chromium.org>,
        Marc Zyngier <maz@kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        MSM <linux-arm-msm@vger.kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        mkshah@codeaurora.org,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Fri, Sep 13, 2019 at 11:59 PM Lina Iyer <ilina@codeaurora.org> wrote:

> Add interrupt parents for wakeup capable GPIOs for Qualcomm SDM845 SoC.
>
> Signed-off-by: Lina Iyer <ilina@codeaurora.org>
> ---
> Changes in RFC v2:
>         - Rearranged GPIO wakeup parent map

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
