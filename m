Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2121719C77B
	for <lists+linux-arm-msm@lfdr.de>; Thu,  2 Apr 2020 19:00:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389802AbgDBRAd (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 2 Apr 2020 13:00:33 -0400
Received: from mail-io1-f68.google.com ([209.85.166.68]:35820 "EHLO
        mail-io1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2387700AbgDBRAc (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 2 Apr 2020 13:00:32 -0400
Received: by mail-io1-f68.google.com with SMTP id o3so4427551ioh.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 02 Apr 2020 10:00:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=yAXnATgltKUt8JMPeZQ2QoLKhjD+I0oS+JV71CRscYo=;
        b=VWkIwk/U438PU8PFC5RLXzJh+UiWU35S9JxG0hJvmhEm2bVrSQ5PeaOcvJekQUU9RR
         v9KO+X9c1YK2DPHsRPRQPNs+zLx6pEv+Nba5jUV/kpaKd4nYkJe4YmJnAU8FkoZyolD7
         RDh+IXARR7NRquZpMHtBg31E/8HjPHu/pifwI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=yAXnATgltKUt8JMPeZQ2QoLKhjD+I0oS+JV71CRscYo=;
        b=Y/RhM5u4igCeRoxCRpW/dWnZ7+c1gGtmD4NozbRQlS4Gqs27Y9D119ZURH9bInQzdo
         2KVapHTTht83FHQG9ztLsr6Bb/3iOaGD9UJMm9bYF0Cg0QqL39vEsRH9LWppOO/Gc3LF
         YrrmW26iGMaUaF6tuH+9taFwPN1sfjecCWUNzUNh2uSENqKzTjQxXPNWwjZK0MJObO/r
         FeneT2WDivxVzDSs5Z9VWprnqx6ucGr1Iff8ywwp8rnLSwpj71oVwFPFbMW6hlrBYbIj
         xTUoGgM7Nlo/A0/dixhOWHe8dnKzNAQAfBpJ0Xkrv7aTCEoZJBX5xFmRCmvmyOo/ON39
         CVZw==
X-Gm-Message-State: AGi0PuZNHZuRpsMcAO6ntLA9Flur0bNQDLHZuEKHUXQY5Mjwme/VYREK
        3FoXrstIU08yCWohHThg5aH+iKY0sQw=
X-Google-Smtp-Source: APiQypJOUBD1CdRkCm8C98ubLe1mck5tGTs2I6slKWoWchVPxMsSVL1O30KpQgPk62zwOX4zk7+x9Q==
X-Received: by 2002:a02:7a18:: with SMTP id a24mr4366154jac.54.1585846827300;
        Thu, 02 Apr 2020 10:00:27 -0700 (PDT)
Received: from mail-il1-f176.google.com (mail-il1-f176.google.com. [209.85.166.176])
        by smtp.gmail.com with ESMTPSA id k81sm1914901ilf.44.2020.04.02.10.00.24
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 02 Apr 2020 10:00:25 -0700 (PDT)
Received: by mail-il1-f176.google.com with SMTP id i75so4274652ild.13
        for <linux-arm-msm@vger.kernel.org>; Thu, 02 Apr 2020 10:00:24 -0700 (PDT)
X-Received: by 2002:a92:35db:: with SMTP id c88mr4163161ilf.187.1585846823937;
 Thu, 02 Apr 2020 10:00:23 -0700 (PDT)
MIME-Version: 1.0
References: <1585660782-23416-1-git-send-email-mkshah@codeaurora.org> <1585660782-23416-5-git-send-email-mkshah@codeaurora.org>
In-Reply-To: <1585660782-23416-5-git-send-email-mkshah@codeaurora.org>
From:   Doug Anderson <dianders@chromium.org>
Date:   Thu, 2 Apr 2020 10:00:12 -0700
X-Gmail-Original-Message-ID: <CAD=FV=X1t5bxgDqg5uPz4NrxfFMSCrGVwMgtnE5snDu330s78Q@mail.gmail.com>
Message-ID: <CAD=FV=X1t5bxgDqg5uPz4NrxfFMSCrGVwMgtnE5snDu330s78Q@mail.gmail.com>
Subject: Re: [PATCH v15 4/7] soc: qcom: rpmh-rsc: Save base address of drv
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

On Tue, Mar 31, 2020 at 6:20 AM Maulik Shah <mkshah@codeaurora.org> wrote:
>
> Add changes to save drv's base address for rsc. This is
> used to read drv's configuration such as solver mode is
> supported or to write into drv's registers.
>
> Signed-off-by: Maulik Shah <mkshah@codeaurora.org>
> ---
>  drivers/soc/qcom/rpmh-internal.h |  2 ++
>  drivers/soc/qcom/rpmh-rsc.c      | 11 +++++------
>  2 files changed, 7 insertions(+), 6 deletions(-)

I still see no usage of "drv->base" outside of the probe function even
after applying your whole patch series.  That implies that it can just
stay as a local variable.

If you have a later patch series that needs "drv->base" in some other
RPMH function then this patch should be moved to the front of that
series.  Until then it feels like it should be dropped.


-Doug
