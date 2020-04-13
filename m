Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 81A961A6FAA
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Apr 2020 01:03:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389880AbgDMXDG (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 13 Apr 2020 19:03:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34394 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S2389876AbgDMXDE (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 13 Apr 2020 19:03:04 -0400
Received: from mail-pl1-x642.google.com (mail-pl1-x642.google.com [IPv6:2607:f8b0:4864:20::642])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D39EFC0A3BE2
        for <linux-arm-msm@vger.kernel.org>; Mon, 13 Apr 2020 16:03:05 -0700 (PDT)
Received: by mail-pl1-x642.google.com with SMTP id z6so3945100plk.10
        for <linux-arm-msm@vger.kernel.org>; Mon, 13 Apr 2020 16:03:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:content-transfer-encoding:in-reply-to:references
         :subject:from:cc:to:date:message-id:user-agent;
        bh=h2sIvTceF35aFkiIKZfFM32t9JQH+EErBjRKPMZEYiE=;
        b=I4VYUHnDBf9A4/iFP0gk+CGl3j981lE16xQX7X4sjSYpfYAQKy/zIiYb92tEdPG1HN
         vknxSRHaGiMSthPNcFx+EEZO+lHqxCXHi6i6CEfxZf2f1VSP6+awnNhXsahEWuTgycVK
         OrDUtQEJwcUmgRxbfyZMA7SLLyGUZPYSHlwkM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:content-transfer-encoding
         :in-reply-to:references:subject:from:cc:to:date:message-id
         :user-agent;
        bh=h2sIvTceF35aFkiIKZfFM32t9JQH+EErBjRKPMZEYiE=;
        b=XJbC42SIn5Q4VWf2LchhxjLSlhH8jXWWCc8BCct6Z6IqjV7trxMqgWHatG2FgilJjU
         +Gl9uPb+ziC9D9abay1B692jF1+ToHLmZQETZ6LD/IYQkvqinOeeHyIT3b8G+mbjhIfF
         GYlHYQf7stnJR2fBI9Erazd6BMZZLa4bwppiY1IcXuNNSfAwPsoEcbRunD4sIXrXtYlm
         kTOg+lVChEIT7vsX1/QSiQVY0fMOh92BDBNaY4PWFh0FqcGP1fWFINo/k7HYsDywps2O
         IJKLsDHEsWAZAPpz8ydHRQE4W/hFpoEd3wtDtdxKTUNGyXjVcpUBd1KwZ8Pxa+bGeu8l
         osFg==
X-Gm-Message-State: AGi0PubWllRCftLFc7V/xmdLMrhOimSkMN3BCRqYc6UScALiK5NCLWJT
        UUMFWZyjoBomFoA1BTvL/j5kng==
X-Google-Smtp-Source: APiQypJIcS4GPoA3k3XyUodt0rJnI/uwbOybscDUN75AXKhksNHvi5jmRSLQBcE9fj7zW/BH8XI3ww==
X-Received: by 2002:a17:90a:898d:: with SMTP id v13mr25438532pjn.12.1586818985332;
        Mon, 13 Apr 2020 16:03:05 -0700 (PDT)
Received: from chromium.org ([2620:15c:202:1:fa53:7765:582b:82b9])
        by smtp.gmail.com with ESMTPSA id c15sm9477687pfo.139.2020.04.13.16.03.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Apr 2020 16:03:04 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20200413100321.v4.9.I07c1f70e0e8f2dc0004bd38970b4e258acdc773e@changeid>
References: <20200413170415.32463-1-dianders@chromium.org> <20200413100321.v4.9.I07c1f70e0e8f2dc0004bd38970b4e258acdc773e@changeid>
Subject: Re: [PATCH v4 09/10] drivers: qcom: rpmh-rsc: Caller handles tcs_invalidate() exclusivity
From:   Stephen Boyd <swboyd@chromium.org>
Cc:     mka@chromium.org, Rajendra Nayak <rnayak@codeaurora.org>,
        evgreen@chromium.org, Lina Iyer <ilina@codeaurora.org>,
        Douglas Anderson <dianders@chromium.org>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Douglas Anderson <dianders@chromium.org>,
        Maulik Shah <mkshah@codeaurora.org>
Date:   Mon, 13 Apr 2020 16:03:04 -0700
Message-ID: <158681898406.84447.2307984865936998508@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Douglas Anderson (2020-04-13 10:04:14)
> Auditing tcs_invalidate() made me worried.  Specifically I saw that it
> used spin_lock(), not spin_lock_irqsave().  That always worries me
> unless I can trace for sure that I'm in the interrupt handler or that
> someone else already disabled interrupts.
>=20
> Looking more at it, there is actually no reason for these locks
> anyway.  Specifically the only reason you'd ever call
> rpmh_rsc_invalidate() is if you cared that the sleep/wake TCSes were
> empty.  That means that they need to continue to be empty even after
> rpmh_rsc_invalidate() returns.  The only way that can happen is if the
> caller already has done something to keep all other RPMH users out.
> It should be noted that even though the caller is only worried about
> making sleep/wake TCSes empty, they also need to worry about stopping
> active-only transfers if they need to handle the case where
> active-only transfers might borrow the wake TCS.
>=20
> At the moment rpmh_rsc_invalidate() is only called in PM code from the
> last CPU.  If that later changes the caller will still need to solve
> the above problems themselves, so these locks will never be useful.
>=20
> Continuing to audit tcs_invalidate(), I found a bug.  The function
> didn't properly check for a borrowed TCS if we hadn't recently written
> anything into the TCS.  Specifically, if we've never written to the
> WAKE_TCS (or we've flushed it recently) then tcs->slots is empty.
> We'll early-out and we'll never call tcs_is_free().
>=20
> I thought about fixing this bug by either deleting the early check for
> bitmap_empty() or possibly only doing it if we knew we weren't on a
> TCS that could be borrowed.  However, I think it's better to just
> delete the checks.
>=20
> As argued above it's up to the caller to make sure that all other
> users of RPMH are quiet before tcs_invalidate() is called.  Since
> callers need to handle the zero-active-TCS case anyway that means they
> need to make sure that the active-only transfers are quiet before
> calling too.  The one way tcs_invalidate() gets called today is
> through rpmh_rsc_cpu_pm_callback() which calls
> rpmh_rsc_ctrlr_is_busy() to handle this.  When we have another path to
> get to tcs_invalidate() it will also need to come up with something
> similar and it won't need this extra check either.  If we later find
> some code path that actually needs this check back in (and somehow
> manages to be race free) we can always add it back in.
>=20
> Signed-off-by: Douglas Anderson <dianders@chromium.org>
> Reviewed-by: Maulik Shah <mkshah@codeaurora.org>
> Tested-by: Maulik Shah <mkshah@codeaurora.org>
> ---

Reviewed-by: Stephen Boyd <swboyd@chromium.org>
