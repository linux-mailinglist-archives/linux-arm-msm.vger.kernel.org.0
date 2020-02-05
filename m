Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id ACD0F153743
	for <lists+linux-arm-msm@lfdr.de>; Wed,  5 Feb 2020 19:08:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727199AbgBESIK (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 5 Feb 2020 13:08:10 -0500
Received: from mail-lf1-f65.google.com ([209.85.167.65]:36703 "EHLO
        mail-lf1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727079AbgBESIJ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 5 Feb 2020 13:08:09 -0500
Received: by mail-lf1-f65.google.com with SMTP id f24so2164469lfh.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 05 Feb 2020 10:08:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=xxM2KM7SFU0OuxVauJZTx1kXhl4JXfEt7TGRJvg/kq4=;
        b=WP7q3SuitLJAbKGWLEGzBmTKDcmmUlPnu/WjZqrW3AduihyetE/g/gczvYpfzautL6
         18mEc2wQE2TWpn0PWNlNcERY3LsWVlL/rX6rAqCMX+/x9U55YT9RwSnLBHIaK7t5IRl+
         RRgU60ChxJtJzE81ltKegxet7Bbww509GWpFc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=xxM2KM7SFU0OuxVauJZTx1kXhl4JXfEt7TGRJvg/kq4=;
        b=W3Bq8vinoyWNrzFwRnPL5vrjjTxAkq3Mi8Yln4BOl4TWOGETAyW+68ZlhcPVC0zgCY
         I0OtTCXljw+Fx+z7E9Zsf8GzTwqRBvqBci44YrqGcwtT3cvLy85JJI7WgdSSCjk2dWSj
         W72nnGWKvxCTFTtByT63SXvQEcJE2wta1WWcBZ+ZLyPjzP5yv5uaa+HnSpAPVYZumfij
         7XDFoXb6QbegFQyEgVEJwhYVOjguvS8df9xZxflvNcPasURJVRanjjkErXbBCA3RdnRS
         QwwOui3PqWosmZplHj+SLBy7a5zSn6+uwcWk56myVaFxQccxzGq7vUDJBiGwLU80VNhe
         xkpA==
X-Gm-Message-State: APjAAAWMH9HZryg1KEYGPMN3YlxCT/1Gj1FbQyxR8ShikUb+Ri6QTddc
        WlebpxyNRpA1wVta1gwUX2Qh1Wl84po=
X-Google-Smtp-Source: APXvYqyIF2VuBMxwXsL5DeOe0PTxnpj4qhU+Dz3O6h55pqzaL5xy4oPT/nqcfvvKfHpx+rE4QaJD8w==
X-Received: by 2002:ac2:58cf:: with SMTP id u15mr18405993lfo.62.1580926087606;
        Wed, 05 Feb 2020 10:08:07 -0800 (PST)
Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com. [209.85.167.50])
        by smtp.gmail.com with ESMTPSA id d4sm108161lfn.42.2020.02.05.10.08.06
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 05 Feb 2020 10:08:06 -0800 (PST)
Received: by mail-lf1-f50.google.com with SMTP id y19so2148880lfl.9
        for <linux-arm-msm@vger.kernel.org>; Wed, 05 Feb 2020 10:08:06 -0800 (PST)
X-Received: by 2002:a19:c205:: with SMTP id l5mr18197762lfc.159.1580926086038;
 Wed, 05 Feb 2020 10:08:06 -0800 (PST)
MIME-Version: 1.0
References: <1580796831-18996-1-git-send-email-mkshah@codeaurora.org>
 <1580796831-18996-2-git-send-email-mkshah@codeaurora.org> <CAE=gft6DCqmX8=cHWXNeOjSTuRHL23t7+b_GZOrvUJAPfhVD8A@mail.gmail.com>
 <d95de83d-fbda-5ebf-1b87-126c19f4d604@codeaurora.org>
In-Reply-To: <d95de83d-fbda-5ebf-1b87-126c19f4d604@codeaurora.org>
From:   Evan Green <evgreen@chromium.org>
Date:   Wed, 5 Feb 2020 10:07:29 -0800
X-Gmail-Original-Message-ID: <CAE=gft7ESnpS8bYg4hmoAUtsuLiyek1D-AYEL+LWUKe=KubAJw@mail.gmail.com>
Message-ID: <CAE=gft7ESnpS8bYg4hmoAUtsuLiyek1D-AYEL+LWUKe=KubAJw@mail.gmail.com>
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

On Tue, Feb 4, 2020 at 8:14 PM Maulik Shah <mkshah@codeaurora.org> wrote:
>
>
> On 2/5/2020 6:05 AM, Evan Green wrote:
> > On Mon, Feb 3, 2020 at 10:14 PM Maulik Shah <mkshah@codeaurora.org> wrote:
> >> Currently rpmh ctrlr dirty flag is set for all cases regardless
> >> of data is really changed or not.
> >>
> >> Add changes to update it when data is updated to new values.
> >>
> >> Signed-off-by: Maulik Shah <mkshah@codeaurora.org>
> >> ---
> >>   drivers/soc/qcom/rpmh.c | 15 +++++++++++----
> >>   1 file changed, 11 insertions(+), 4 deletions(-)
> >>
> >> diff --git a/drivers/soc/qcom/rpmh.c b/drivers/soc/qcom/rpmh.c
> >> index 035091f..c3d6f00 100644
> >> --- a/drivers/soc/qcom/rpmh.c
> >> +++ b/drivers/soc/qcom/rpmh.c
> >> @@ -139,20 +139,27 @@ static struct cache_req *cache_rpm_request(struct rpmh_ctrlr *ctrlr,
> >>   existing:
> >>          switch (state) {
> >>          case RPMH_ACTIVE_ONLY_STATE:
> >> -               if (req->sleep_val != UINT_MAX)
> >> +               if (req->sleep_val != UINT_MAX) {
> >>                          req->wake_val = cmd->data;
> >> +                       ctrlr->dirty = true;
> >> +               }
> > Don't you need to set dirty = true for ACTIVE_ONLY state always? The
> > conditional is just saying "if nobody set a sleep vote, then maintain
> > this vote when we wake back up".
>
> The ACTIVE_ONLY vote is cached as wake_val to be apply when wakeup happens.
>
> In case value didn't change,wake_val is still same as older value and
> there is no need to mark the entire cache as dirty.
>

Ah, I see it now. We don't actually cache active_only votes anywhere,
since they're one time requests. The sleep/wake votes seem to be the
only thing that gets cached.

I was thinking it might be safer to also set dirty = true just after
list_add_tail, since in the non-existing case this is a new batch that
RPMh has never seen before and should always be written. But I suppose
your checks here should cover that case, since sleep_val and wake_val
are initialized to UINT_MAX. If you think the code might evolve, it
might still be nice to add it.

While I'm looking at that, why do we have this needless INIT_LIST_HEAD?
        INIT_LIST_HEAD(&req->list);
        list_add_tail(&req->list, &ctrlr->cache);

-Evan

> --
> QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum, hosted by The Linux Foundation
