Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 93F8248B9F7
	for <lists+linux-arm-msm@lfdr.de>; Tue, 11 Jan 2022 22:53:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S245577AbiAKVxx (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 11 Jan 2022 16:53:53 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48586 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S245576AbiAKVxw (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 11 Jan 2022 16:53:52 -0500
Received: from mail-pj1-x102d.google.com (mail-pj1-x102d.google.com [IPv6:2607:f8b0:4864:20::102d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8C476C061748
        for <linux-arm-msm@vger.kernel.org>; Tue, 11 Jan 2022 13:53:52 -0800 (PST)
Received: by mail-pj1-x102d.google.com with SMTP id l16-20020a17090a409000b001b2e9628c9cso1197249pjg.4
        for <linux-arm-msm@vger.kernel.org>; Tue, 11 Jan 2022 13:53:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=HVDl/2NqIhK0g8SQy1/Hn7dbw7ukaYpwfxidGEMrUW0=;
        b=NXnKp1BeM26sd9pKJ0qzJ7+BV5yNK8Sg7KP+uFnTa0gDIcfxt0im9Z6OmC/HuNpfTi
         ysMOERa3j5EiZInROVa+VQOedKpAkqftGgECroQ9XFHQF76bo3v2RyIQE6A98TUep06Y
         UbCWY1xPG21fUMj1AQtddzcdcNxsmx5IzTsLE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=HVDl/2NqIhK0g8SQy1/Hn7dbw7ukaYpwfxidGEMrUW0=;
        b=o14Ymhj/B+aNeyhJ2ZgUYkEqHqF03ytVIAMDsJCvLXoeITAKp2SXsXAyCaET3n7/lr
         rKEyqhF2xgCaLEG4SXmCGSMe6SN+9KmpkfYeZkSi0J8pSbfjxdPHiSzo9SR/f1F52IXo
         lyXMrti7ODRVf3A9cDlLXXABl43doBXH0J1NjTtv6YkugfBWEz6St3sUP4j4LN38gRNR
         rbug5z0HE0udjeFmt54fVOMM3cpnrzQG9Omde5oNTL7lcI60X/W9NAa67/T4n9xDcw8O
         eQIdA5e9GRds1fCbwB2mArqTAltEY8GRp5JxtHg1cGm2PkTDe6voz+jWxh+Mwxnk8nda
         LekQ==
X-Gm-Message-State: AOAM531H4pkEauctYDpzdMtzubessM4N2FXdNpfrK1fw9reKbhYeVQYf
        Tkodlh7jR5FhhR3CpXydpqhZVyB2cpkZgA==
X-Google-Smtp-Source: ABdhPJyCubwFlWipUFQ93Pqn9T+zkPi14jU0TNV3UonYGojfMMlnPojt7XR/Ps5IBTcD+zF+ALc7cw==
X-Received: by 2002:a17:902:8d8d:b0:149:2d7c:da6c with SMTP id v13-20020a1709028d8d00b001492d7cda6cmr6326064plo.134.1641938032084;
        Tue, 11 Jan 2022 13:53:52 -0800 (PST)
Received: from localhost ([2620:15c:202:201:f0a7:d33a:2234:5687])
        by smtp.gmail.com with UTF8SMTPSA id u20sm5792539pfg.105.2022.01.11.13.53.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 11 Jan 2022 13:53:51 -0800 (PST)
Date:   Tue, 11 Jan 2022 13:53:50 -0800
From:   Matthias Kaehlcke <mka@chromium.org>
To:     Alex Elder <elder@linaro.org>
Cc:     davem@davemloft.net, kuba@kernel.org, jponduru@codeaurora.org,
        avuyyuru@codeaurora.org, bjorn.andersson@linaro.org,
        agross@kernel.org, cpratapa@codeaurora.org,
        subashab@codeaurora.org, evgreen@chromium.org, elder@kernel.org,
        netdev@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH net 2/2] net: ipa: prevent concurrent replenish
Message-ID: <Yd38brbLi2RDYT0P@google.com>
References: <20220111192150.379274-1-elder@linaro.org>
 <20220111192150.379274-3-elder@linaro.org>
 <Yd3miKw2AIY8Rr0F@google.com>
 <7a145d96-9c33-b91d-b0cd-ed2fb8ef6cb4@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <7a145d96-9c33-b91d-b0cd-ed2fb8ef6cb4@linaro.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue, Jan 11, 2022 at 02:58:16PM -0600, Alex Elder wrote:
> On 1/11/22 2:20 PM, Matthias Kaehlcke wrote:
> > On Tue, Jan 11, 2022 at 01:21:50PM -0600, Alex Elder wrote:
> > > We have seen cases where an endpoint RX completion interrupt arrives
> > > while replenishing for the endpoint is underway.  This causes another
> > > instance of replenishing to begin as part of completing the receive
> > > transaction.  If this occurs it can lead to transaction corruption.
> > > 
> > > Use a new atomic variable to ensure only replenish instance for an
> > > endpoint executes at a time.
> > > 
> > > Fixes: 84f9bd12d46db ("soc: qcom: ipa: IPA endpoints")
> > > Signed-off-by: Alex Elder <elder@linaro.org>
> > > ---
> > >   drivers/net/ipa/ipa_endpoint.c | 13 +++++++++++++
> > >   drivers/net/ipa/ipa_endpoint.h |  2 ++
> > >   2 files changed, 15 insertions(+)
> > > 
> > > diff --git a/drivers/net/ipa/ipa_endpoint.c b/drivers/net/ipa/ipa_endpoint.c
> > > index 8b055885cf3cf..a1019f5fe1748 100644
> > > --- a/drivers/net/ipa/ipa_endpoint.c
> > > +++ b/drivers/net/ipa/ipa_endpoint.c
> > > @@ -1088,15 +1088,27 @@ static void ipa_endpoint_replenish(struct ipa_endpoint *endpoint, bool add_one)
> > >   		return;
> > >   	}
> > > +	/* If already active, just update the backlog */
> > > +	if (atomic_xchg(&endpoint->replenish_active, 1)) {
> > > +		if (add_one)
> > > +			atomic_inc(&endpoint->replenish_backlog);
> > > +		return;
> > > +	}
> > > +
> > >   	while (atomic_dec_not_zero(&endpoint->replenish_backlog))
> > >   		if (ipa_endpoint_replenish_one(endpoint))
> > >   			goto try_again_later;
> > 
> > I think there is a race here, not sure whether it's a problem: If the first
> > interrupt is here just when a 2nd interrupt evaluates 'replenish_active' the
> > latter will return, since it looks like replenishing is still active, when it
> > actually just finished. Would replenishing be kicked off anyway shortly after
> > or could the transaction be stalled until another endpoint RX completion
> > interrupt arrives?
> 
> I acknowledge the race you point out.  You're saying another
> thread could test the flag after the while loop exits, but
> before the flag gets reset to 0.  And that means that other
> thread would skip the replenishing it would otherwise do.
> 
> To be honest, that is a different scenario than the one I
> was trying to prevent, because it involves two threads, rather
> than one thread entering this function a second time (via an
> interrupt).  But regardless, I think it's OK.
> 
> The replenishing loop is intentionally tolerant of errors.
> It will send as many receive buffers to the hardware as there
> is room for, but will stop and "try again later" if an
> error occurs.   Even if the specific case you mention
> occurred it wouldn't be a problem because we'd get another
> shot at it.  I'll explain.
> 
> 
> The replenish_backlog is the number of "open slots" the hardware
> has to hold a receive buffer.  When the backlog reaches 0, the
> hardware is "full."
> 
> When a receive operation completes (in ipa_endpoint_rx_complete())
> it calls ipa_endpoint_replenish(), requesting that we add one to
> the backlog (to account for the buffer just consumed).  What this
> means is that if the hardware has *any* receive buffers, a
> replenish will eventually be requested (when one completes).
> 
> The logic in ipa_endpoint_replenish() tolerates an error
> attempting to send a new receive buffer to the hardware.
> If that happens, we just try again later--knowing that
> the next RX completion will trigger that retry.
> 
> The only case where we aren't guaranteed a subsequent call
> to ipa_endpoint_replenish() is when the hardware has *zero*
> receive buffers, or the backlog is the maximum.  In that
> case we explicitly schedule a new replenish via delayed
> work.
> 
> Now, two more points.
> - If the while loop exits without an error replenishing,
>   the hardware is "full", so there are buffers that will
>   complete, and trigger a replenish call.  So if the race
>   occurred, it would be harmless.
> - If the while loop exits because of an error replenishing
>   one buffer, it jumps to try_again_later.  In that case,
>   either the hardware has at least one receive buffer (so
>   we'll get another replenish), or it has none and we will
>   schedule delayed work to to schedule another replenish.
> 
> So I think that even if the race you point out occurs, the
> replenish logic will eventually get another try.
> 
> I don't claim my logic is flawless; if it's wrong I can
> find another solution.

Thanks for the detailed description!

I agree the race isn't an actual issue as long as it is
guaranteed that the function is called again 'soon' after
the race occurred. It seems that should be always the case.
