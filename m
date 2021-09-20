Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1036A4118A5
	for <lists+linux-arm-msm@lfdr.de>; Mon, 20 Sep 2021 17:53:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238167AbhITPyp (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 20 Sep 2021 11:54:45 -0400
Received: from mail.kernel.org ([198.145.29.99]:41164 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231184AbhITPyp (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 20 Sep 2021 11:54:45 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id C18E560FE6;
        Mon, 20 Sep 2021 15:53:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1632153198;
        bh=5JnmZvTrmabnfFrPmZLX8ru77g1rBdPWLZ198RN9T0Q=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=BbGXBgbFVJ8Ju4okRXC0a/Sw3Luvi4hQ71MxV/GLJry+uQfkc7MZsKgxUMn1O8KFn
         3EaRMD/uzOqhBlta5UFOVsBJKFUn7ZjG+By5qXrpTify3lRuGDHcfGhaRMO00LRGXR
         RmDEAy9WzDhYYx/u5Qxdvh5+y3olAdIL7uE5BNP01Yd2PfwQpPO7QG8VO85ny2i5BE
         uWs5418Jfsd91ub5z3qrJInqrxxcmV1da8/jzZNGTNxxN1nGWnx1NZbkTc/MAAhGDH
         uiiBBnzg2Qht3ICD4K9zBwjJOn+hxpapfzQU9G0sRRT4MZ122Oatdkh0AQ3qj1Qy6r
         xs/Ba8vHArFjg==
Received: by mail-wr1-f42.google.com with SMTP id d6so30913160wrc.11;
        Mon, 20 Sep 2021 08:53:18 -0700 (PDT)
X-Gm-Message-State: AOAM530+8GhlHPp0XqJ2YZdAOFUM8KYXvHqMXFKiVL329ezX2frpqHOZ
        Xs2eocZnrT+O0YPxEpDLDFrIQWdnmMeX+pt4fQU=
X-Google-Smtp-Source: ABdhPJw1xRvzwWqBP7bf6vDiDBT+K7EHT/mMtvl8wIJbPxV6GtlkcSqi+28AErLAt/Kgkdz3q/FBk6Qik9paII1fQZo=
X-Received: by 2002:adf:c10b:: with SMTP id r11mr29523005wre.336.1632153197199;
 Mon, 20 Sep 2021 08:53:17 -0700 (PDT)
MIME-Version: 1.0
References: <20210920100226.1448267-1-arnd@kernel.org> <CAD=FV=UYOSNG1we=MaNwqZCLjV9re7hHSvtYR3qmzAaLCvDJ=g@mail.gmail.com>
In-Reply-To: <CAD=FV=UYOSNG1we=MaNwqZCLjV9re7hHSvtYR3qmzAaLCvDJ=g@mail.gmail.com>
From:   Arnd Bergmann <arnd@kernel.org>
Date:   Mon, 20 Sep 2021 17:53:00 +0200
X-Gmail-Original-Message-ID: <CAK8P3a0HcvkCNLHabJ=ri13razk+xgC=3-f+e74ena9ZEymHmw@mail.gmail.com>
Message-ID: <CAK8P3a0HcvkCNLHabJ=ri13razk+xgC=3-f+e74ena9ZEymHmw@mail.gmail.com>
Subject: Re: [PATCH] PM: AVS: qcom-cpr: select CONFIG_NVMEM
To:     Doug Anderson <dianders@chromium.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Niklas Cassel <nks@flawful.org>, Arnd Bergmann <arnd@arndb.de>,
        John Stultz <john.stultz@linaro.org>,
        Lina Iyer <ilina@codeaurora.org>,
        Ulf Hansson <ulf.hansson@linaro.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Mon, Sep 20, 2021 at 3:37 PM Doug Anderson <dianders@chromium.org> wrote:
>
> https://lore.kernel.org/r/20210830083449.1.I38e95343209fe1f808c3b4860795a00a2b539701@changeid
>
> ...and Greg has applied it. I got a message 6 days ago saying it was in:
>
>     git://git.kernel.org/pub/scm/linux/kernel/git/gregkh/char-misc.git
> in the char-misc-linus branch.
>
> That being said, if people think that we should _also_ select NVMEM
> for this driver then I have no objections. The use of nvmem in this
> driver predates my patch.

It's there, I was still testing on -rc1 when I made the patch and only
verified that all my patches still worked on rc2 before sending them
out, but did not cross-check whether a different fix was applied.

       Arnd
