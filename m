Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0EC6D1A69AF
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Apr 2020 18:18:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731431AbgDMQSP (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 13 Apr 2020 12:18:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38916 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1731428AbgDMQSM (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 13 Apr 2020 12:18:12 -0400
Received: from mail-ua1-x944.google.com (mail-ua1-x944.google.com [IPv6:2607:f8b0:4864:20::944])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A7F0AC0A3BDC
        for <linux-arm-msm@vger.kernel.org>; Mon, 13 Apr 2020 09:18:12 -0700 (PDT)
Received: by mail-ua1-x944.google.com with SMTP id a6so3304915uao.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 13 Apr 2020 09:18:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=oxavWCT24jIuFXqrtLF2I2Zgrd6r4LKh480arMC2+lQ=;
        b=msSaILPI9zCObtNnipbVnToRXsRM3FDo1JT47d/JoGzgTaXbk68YCd2H6SUljk50+7
         D3PSOkFLlcDUf/wGiSzQRVp1NU/KdaOYBIwd5LPCkUOBI4c8L7MgThKgwg5CnvAUq+5g
         mhDZbMLfCJuP1MAe3AXbA25tc1ztHL0MaO1Eo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=oxavWCT24jIuFXqrtLF2I2Zgrd6r4LKh480arMC2+lQ=;
        b=jM3nntIaAJSZiWml7/KeAkzQH9nzXTf5mqT9/FVeEnrM8Er+erVLIQkQwklrpIlsBm
         2uX9AwKYPX0I01jT0J3F6Qd7/3RZJfQ5sl32hZkP29OIIj+yjNI8Nh1PqnQUT0SniRR4
         xZ7hBey8ahEPsldZ0XqU95FG2lUuAz337NqFEzJO5zIPw3j00h7ls1mKjyLVJ0rpYzfv
         YSqKPoU3lJH/VB5c7clNcJqsLx8OS3dIlnm0i3CcQbffsAv/wsFkgXZUFK5Ycvb7g8rD
         o4eFRJkp/goHhfwXQKKpSVLoZmL11QLVvP+6690BLRsUJZohrUMSm0pu6JEjUrkMDpJI
         Pd9A==
X-Gm-Message-State: AGi0PuYRIl2uXjDfRh4+L+tX3hLW82VL1fWg7NfQ1VT2NF/Bpsni9oU3
        siJLW1DrjysSlsWFdUm/iDliCE/hDFI=
X-Google-Smtp-Source: APiQypJdDjjfVxGw8kt+ZxmnaD7UISBCWWembABRyNuHtoXxQNbJq6urTU2+kezn3VjBRpthGN+dtA==
X-Received: by 2002:ab0:2858:: with SMTP id c24mr12287429uaq.74.1586794691226;
        Mon, 13 Apr 2020 09:18:11 -0700 (PDT)
Received: from mail-vs1-f52.google.com (mail-vs1-f52.google.com. [209.85.217.52])
        by smtp.gmail.com with ESMTPSA id r188sm571622vsb.20.2020.04.13.09.18.09
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 13 Apr 2020 09:18:10 -0700 (PDT)
Received: by mail-vs1-f52.google.com with SMTP id h189so5696978vsc.13
        for <linux-arm-msm@vger.kernel.org>; Mon, 13 Apr 2020 09:18:09 -0700 (PDT)
X-Received: by 2002:a67:8dc8:: with SMTP id p191mr12836211vsd.198.1586794688896;
 Mon, 13 Apr 2020 09:18:08 -0700 (PDT)
MIME-Version: 1.0
References: <1586703004-13674-1-git-send-email-mkshah@codeaurora.org> <1586703004-13674-5-git-send-email-mkshah@codeaurora.org>
In-Reply-To: <1586703004-13674-5-git-send-email-mkshah@codeaurora.org>
From:   Doug Anderson <dianders@chromium.org>
Date:   Mon, 13 Apr 2020 09:17:56 -0700
X-Gmail-Original-Message-ID: <CAD=FV=WknGB=MRzf3J_FtN5p7V3Y1PVpEhBVDXOH+kEvatkn1w@mail.gmail.com>
Message-ID: <CAD=FV=WknGB=MRzf3J_FtN5p7V3Y1PVpEhBVDXOH+kEvatkn1w@mail.gmail.com>
Subject: Re: [PATCH v17 4/6] soc: qcom: rpmh: Invoke rpmh_flush() for dirty caches
To:     Maulik Shah <mkshah@codeaurora.org>
Cc:     Stephen Boyd <swboyd@chromium.org>,
        Evan Green <evgreen@chromium.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        LKML <linux-kernel@vger.kernel.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        Andy Gross <agross@kernel.org>,
        Matthias Kaehlcke <mka@chromium.org>,
        Rajendra Nayak <rnayak@codeaurora.org>,
        Lina Iyer <ilina@codeaurora.org>, lsrao@codeaurora.org
Content-Type: text/plain; charset="UTF-8"
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi,

On Sun, Apr 12, 2020 at 7:50 AM Maulik Shah <mkshah@codeaurora.org> wrote:
>
> --- a/drivers/soc/qcom/rpmh.c
> +++ b/drivers/soc/qcom/rpmh.c
> @@ -5,6 +5,7 @@
>
>  #include <linux/atomic.h>
>  #include <linux/bug.h>
> +#include <linux/lockdep.h>
>  #include <linux/interrupt.h>
>  #include <linux/jiffies.h>
>  #include <linux/kernel.h>

A, B, L, C, D, E, F, G, H, I, J, K

...which letter doesn't belong?  ;-)

IMO could be fixed in a follow-up patch or by a maintainer when applying.

-Doug
