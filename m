Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B3C7C10090B
	for <lists+linux-arm-msm@lfdr.de>; Mon, 18 Nov 2019 17:19:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726725AbfKRQTe (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 18 Nov 2019 11:19:34 -0500
Received: from mail-io1-f68.google.com ([209.85.166.68]:41653 "EHLO
        mail-io1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726635AbfKRQTd (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 18 Nov 2019 11:19:33 -0500
Received: by mail-io1-f68.google.com with SMTP id r144so19374030iod.8
        for <linux-arm-msm@vger.kernel.org>; Mon, 18 Nov 2019 08:19:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=E9E85CtL9td3M11CPpft7JLYpTsiRw80DDYN+NBSTjo=;
        b=inz6BKPqZnuPFIBOaggS5p7Eq85z3j336Z6TV07+Al4rjRDU6kXtvyQ+UbLZ+grkc7
         F9IoCrhDHv9E0jbh24OtIzDmmwE+a0DYcrXe6lMlciR7KxmFm0bRRidgAu/DP2Y6bS0M
         eryoP6eftPzMcIOhTmUSN+/UFMaYfEBxLPQPA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=E9E85CtL9td3M11CPpft7JLYpTsiRw80DDYN+NBSTjo=;
        b=RXNsEs06kOVfBeuY0FIgsEI+7nZL7iRdelfnokEf9ysmGt5RTJvKBrS1xL1o9sjWUo
         CoGxUrgHuhqRN9O1Wm/CLxuOrxZ99v5DeP6nf4P+Q254HG98fY5IRgDjOoXfrTEsvt6M
         TwbUqfCpQmRGD+KNdSy2cZ+CnIyoZpLFxikthoQbBQBx7hhLSsuOx0QmW9DUEUiU6jjD
         PM9O6w3QomCvcWUqBd8NKn/08GWWfenZc00OcVe2ePddvNpKBQUJ8Kly8oaQEfXktvmI
         +QbvUDY1PvuA/bfUrKwjTXwu+QR9Ufmhc9HXMImEIRK5iYDIcMqqmHXU1kbWkx8ZLX1o
         G4qA==
X-Gm-Message-State: APjAAAULDtKOHpN1cPn/VwymDguoPQLUh2866DSAZ0k65q3oLRJQMIyp
        mQNj0cKIim5W2zhF5yflM1qP2Qb3Hfg=
X-Google-Smtp-Source: APXvYqzDgnwvFZfLX0Yu/dXVw2I3/PHLgF8cSckhLER/29Er2eXioE+HVIK6lflUhFv+KEwDzh3CsA==
X-Received: by 2002:a5d:88c6:: with SMTP id i6mr8136381iol.251.1574093971602;
        Mon, 18 Nov 2019 08:19:31 -0800 (PST)
Received: from mail-il1-f171.google.com (mail-il1-f171.google.com. [209.85.166.171])
        by smtp.gmail.com with ESMTPSA id c21sm4636048ilg.31.2019.11.18.08.19.30
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 18 Nov 2019 08:19:30 -0800 (PST)
Received: by mail-il1-f171.google.com with SMTP id o18so16510997ils.12
        for <linux-arm-msm@vger.kernel.org>; Mon, 18 Nov 2019 08:19:30 -0800 (PST)
X-Received: by 2002:a92:109c:: with SMTP id 28mr16767271ilq.142.1574093970462;
 Mon, 18 Nov 2019 08:19:30 -0800 (PST)
MIME-Version: 1.0
References: <20190214173633.211000-1-dianders@chromium.org>
In-Reply-To: <20190214173633.211000-1-dianders@chromium.org>
From:   Doug Anderson <dianders@chromium.org>
Date:   Mon, 18 Nov 2019 08:19:18 -0800
X-Gmail-Original-Message-ID: <CAD=FV=WD4r-GAM6mnTg9qB04aaX7JJzHajhtb+N8Yq9UR1WZAA@mail.gmail.com>
Message-ID: <CAD=FV=WD4r-GAM6mnTg9qB04aaX7JJzHajhtb+N8Yq9UR1WZAA@mail.gmail.com>
Subject: Re: [PATCH] soc: qcom: rpmhpd: Set 'active_only' for active only
 power domains
To:     Andy Gross <andy.gross@linaro.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rajendra Nayak <rnayak@codeaurora.org>
Cc:     Stephen Boyd <swboyd@chromium.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        David Brown <david.brown@linaro.org>,
        LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Bjorn / Andy,

On Thu, Feb 14, 2019 at 9:36 AM Douglas Anderson <dianders@chromium.org> wrote:
>
> The 'active_only' attribute was accidentally never set to true for any
> power domains meaning that all the code handling this attribute was
> dead.
>
> NOTE that the RPM power domain code (as opposed to the RPMh one) gets
> this right.
>
> Fixes: 279b7e8a62cc ("soc: qcom: rpmhpd: Add RPMh power domain driver")
> Signed-off-by: Douglas Anderson <dianders@chromium.org>
> ---
>
>  drivers/soc/qcom/rpmhpd.c | 2 ++
>  1 file changed, 2 insertions(+)

Somehow this fell through the cracks and was never applied.  Can you
pick it up?  Given that it's been a year and nobody has noticed this
it seems like 5.5 is fine, but maybe you could add Cc: stable since it
seems like something that stable trees would want...

Thanks!

-Doug
