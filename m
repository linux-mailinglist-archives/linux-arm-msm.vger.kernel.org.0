Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7817F15241D
	for <lists+linux-arm-msm@lfdr.de>; Wed,  5 Feb 2020 01:36:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727673AbgBEAge (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 4 Feb 2020 19:36:34 -0500
Received: from mail-lj1-f194.google.com ([209.85.208.194]:34940 "EHLO
        mail-lj1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727689AbgBEAge (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 4 Feb 2020 19:36:34 -0500
Received: by mail-lj1-f194.google.com with SMTP id q8so552484ljb.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 04 Feb 2020 16:36:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=MjWXCXEdOOwOMkJJTNAHcUDq4zVsPSajy/GXrZmEiag=;
        b=VT9hTnG+dCpN1oUkTy15tykgYxQNI3vmF23pTk/136wicIDfFXnU1lBcH6cchRsKpj
         bSE7kppl3FvhhKU2qOSlNuQ01A213YcbbvQtFqQMtuUoH8Pc7or8v4KxolAK6vp21o8N
         AQKDmeLLPLIAIT3qI/FHSsJCREix1XNwkRx2I=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=MjWXCXEdOOwOMkJJTNAHcUDq4zVsPSajy/GXrZmEiag=;
        b=M1AoPZ1vYaXSodve05IYmq9gEB61Fe5qDjiJ3gmyGdgelos+PupiPG4XS0NM0Vpusd
         tcNOSLenF2gimcfnRDNi2Sf3P8ocZAjrDiEJ16x5zlIo51vIEUssIgM6FR2flXRfOE2g
         hRR6QBiDMA5qeHosKmaJRNUZLOQ2CVUgdk9P2YLvSfa/ovPqtYWYVIv6bjmxdkRfGRp2
         AfS8bcStNqGNJ0QEzZKKWlBEZKEYzsUsGjvE24xuaBfOHaK9qW0nVDa1fcFCt9iyNjHL
         FxJWYjeBK+U6jLcVelNkOkV6yv/RKoxz/ITEl3nd18lDJlU1TImajtk08+41qYyXB74d
         lXQg==
X-Gm-Message-State: APjAAAWv5CRPmFZBpcfiWx8cPv494p9T1YJ7VaWRKvslKQd837RlBzn2
        ClDhWbM9s7ncNmK+RSeMi+ADqD7NeAs=
X-Google-Smtp-Source: APXvYqyD/+nMCFVdRhIDwdLBnTfMPVRB5pCsu9chO4+wzGSLRnmXiI7xymHBMG+tSJ/wCFUEHVsWzQ==
X-Received: by 2002:a2e:b177:: with SMTP id a23mr18312323ljm.202.1580862991597;
        Tue, 04 Feb 2020 16:36:31 -0800 (PST)
Received: from mail-lj1-f171.google.com (mail-lj1-f171.google.com. [209.85.208.171])
        by smtp.gmail.com with ESMTPSA id i13sm12294645ljg.89.2020.02.04.16.36.30
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 04 Feb 2020 16:36:30 -0800 (PST)
Received: by mail-lj1-f171.google.com with SMTP id w1so533289ljh.5
        for <linux-arm-msm@vger.kernel.org>; Tue, 04 Feb 2020 16:36:30 -0800 (PST)
X-Received: by 2002:a2e:3e10:: with SMTP id l16mr18417534lja.286.1580862990119;
 Tue, 04 Feb 2020 16:36:30 -0800 (PST)
MIME-Version: 1.0
References: <1580796831-18996-1-git-send-email-mkshah@codeaurora.org> <1580796831-18996-2-git-send-email-mkshah@codeaurora.org>
In-Reply-To: <1580796831-18996-2-git-send-email-mkshah@codeaurora.org>
From:   Evan Green <evgreen@chromium.org>
Date:   Tue, 4 Feb 2020 16:35:53 -0800
X-Gmail-Original-Message-ID: <CAE=gft6DCqmX8=cHWXNeOjSTuRHL23t7+b_GZOrvUJAPfhVD8A@mail.gmail.com>
Message-ID: <CAE=gft6DCqmX8=cHWXNeOjSTuRHL23t7+b_GZOrvUJAPfhVD8A@mail.gmail.com>
Subject: Re: [PATCH 1/3] soc: qcom: rpmh: Update dirty flag only when data changes
To:     Maulik Shah <mkshah@codeaurora.org>
Cc:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Andy Gross <agross@kernel.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>,
        Stephen Boyd <swboyd@chromium.org>,
        Doug Anderson <dianders@chromium.org>,
        Rajendra Nayak <rnayak@codeaurora.org>,
        Lina Iyer <ilina@codeaurora.org>, lsrao@codeaurora.org
Content-Type: text/plain; charset="UTF-8"
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Mon, Feb 3, 2020 at 10:14 PM Maulik Shah <mkshah@codeaurora.org> wrote:
>
> Currently rpmh ctrlr dirty flag is set for all cases regardless
> of data is really changed or not.
>
> Add changes to update it when data is updated to new values.
>
> Signed-off-by: Maulik Shah <mkshah@codeaurora.org>
> ---
>  drivers/soc/qcom/rpmh.c | 15 +++++++++++----
>  1 file changed, 11 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/soc/qcom/rpmh.c b/drivers/soc/qcom/rpmh.c
> index 035091f..c3d6f00 100644
> --- a/drivers/soc/qcom/rpmh.c
> +++ b/drivers/soc/qcom/rpmh.c
> @@ -139,20 +139,27 @@ static struct cache_req *cache_rpm_request(struct rpmh_ctrlr *ctrlr,
>  existing:
>         switch (state) {
>         case RPMH_ACTIVE_ONLY_STATE:
> -               if (req->sleep_val != UINT_MAX)
> +               if (req->sleep_val != UINT_MAX) {
>                         req->wake_val = cmd->data;
> +                       ctrlr->dirty = true;
> +               }

Don't you need to set dirty = true for ACTIVE_ONLY state always? The
conditional is just saying "if nobody set a sleep vote, then maintain
this vote when we wake back up".
