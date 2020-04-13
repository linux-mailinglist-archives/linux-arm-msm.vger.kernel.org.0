Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1A0BC1A6E87
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Apr 2020 23:41:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389198AbgDMVlj (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 13 Apr 2020 17:41:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50078 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S2388914AbgDMVli (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 13 Apr 2020 17:41:38 -0400
Received: from mail-pj1-x1042.google.com (mail-pj1-x1042.google.com [IPv6:2607:f8b0:4864:20::1042])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 92F38C0A3BDC
        for <linux-arm-msm@vger.kernel.org>; Mon, 13 Apr 2020 14:41:37 -0700 (PDT)
Received: by mail-pj1-x1042.google.com with SMTP id e16so4108411pjp.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 13 Apr 2020 14:41:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:content-transfer-encoding:in-reply-to:references
         :subject:from:cc:to:date:message-id:user-agent;
        bh=/hy8nLHvdTBMRghLyVXwwmQ5YcXeiHdKIF9wDS2i7kI=;
        b=kuOz9s/8Ctd97eNnQDhrbMEyE9BZYrACSMLZTK8jdUD/+7+Z+ozhqhuOxtl40MzpC2
         YPWI+5e+b6GLgEdM1Yym3RekZXM+xGNnS7Y6fKaKSCnI+gF0GV7JjVw2G/aFr7pPHKcE
         1FAAlqm2U2WK6q4YcKQBfI9gQy0sEBgNmCSk8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:content-transfer-encoding
         :in-reply-to:references:subject:from:cc:to:date:message-id
         :user-agent;
        bh=/hy8nLHvdTBMRghLyVXwwmQ5YcXeiHdKIF9wDS2i7kI=;
        b=t4uqgqU97mB+VAVEx0FrjbMNxlm/cIWf49vBn+fuNMU7GxkzKdRHXeCSr3l6NDaQ1p
         dXsFg7b05axmU3C9avXi1m9sCe3Lu7mfghFBGqIRb9ZpJWfcwTmHch1lakEhWz05Yc/z
         cMnXawBRzBRBPNDxvc4mRSYURP+3dIvBbge9FPmMFDmmU2eom9r6UzTkOBjiHx/QPz7b
         gOIRUBMOyJgoMRFVRQ0+iJP+7E3V05AtSjND0+Dh8+NwO6uavsFKOc5toNn0l6P33Wn+
         lw1NiYar8wfqX1UYZU1dReUOWjcRCrLQktCcQei/mnET0Xpu1Qi/mCLq3+qNIYUz8Q40
         XUHw==
X-Gm-Message-State: AGi0PuaRuQScu1RcywveSfSGe64scJUGoGyXFy6IKThTPFMWbzH096Ph
        aYdzWYL8pTrOIOTe/jOCGe8ocg==
X-Google-Smtp-Source: APiQypIi362EzWlhsp87E35Oet2vA8/7qkL8XRkNyQ5+K1ATgnf3YK/665PQSOiWUnuPlweJRACj9g==
X-Received: by 2002:a17:902:322:: with SMTP id 31mr19463754pld.103.1586814097120;
        Mon, 13 Apr 2020 14:41:37 -0700 (PDT)
Received: from chromium.org ([2620:15c:202:1:fa53:7765:582b:82b9])
        by smtp.gmail.com with ESMTPSA id fy21sm102409pjb.25.2020.04.13.14.41.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Apr 2020 14:41:36 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20200413100321.v4.5.I6d3d0a3ec810dc72ff1df3cbf97deefdcdeb8eef@changeid>
References: <20200413170415.32463-1-dianders@chromium.org> <20200413100321.v4.5.I6d3d0a3ec810dc72ff1df3cbf97deefdcdeb8eef@changeid>
Subject: Re: [PATCH v4 05/10] drivers: qcom: rpmh-rsc: Kill cmd_cache and find_match() with fire
From:   Stephen Boyd <swboyd@chromium.org>
Cc:     mka@chromium.org, Rajendra Nayak <rnayak@codeaurora.org>,
        evgreen@chromium.org, Lina Iyer <ilina@codeaurora.org>,
        Douglas Anderson <dianders@chromium.org>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Douglas Anderson <dianders@chromium.org>,
        Maulik Shah <mkshah@codeaurora.org>
Date:   Mon, 13 Apr 2020 14:41:35 -0700
Message-ID: <158681409564.84447.15749412606958274934@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Douglas Anderson (2020-04-13 10:04:10)
> The "cmd_cache" in RPMH wasn't terribly sensible.  Specifically:
>=20
> - The current code doesn't realy detect "conflicts" properly any case

s/realy/really/

>   where the sequence being checked has more than one entry.  One
>   simple way to see this in the current code is that if cmd[0].addr
>   isn't found that cmd[1].addr is never checked.

s/that/then/ ?

> - The code attempted to use the "cmd_cache" to update an existing
>   message in a sleep/wake TCS with new data.  The goal appeared to be
>   to update part of a TCS while leaving the rest of the TCS alone.  We
>   never actually do this.  We always fully invalidate and re-write
>   everything.
> - If/when we try to optimize things to not fully invalidate / re-write
>   every time we update the TCSes we'll need to think it through very
>   carefully.  Specifically requirement of find_match() that the new
>   sequence of addrs must match exactly the old sequence of addrs seems
>   inflexible.  It's also not documented in rpmh_write() and
>   rpmh_write_batch().  In any case, if we do decide to require updates
>   to keep the exact same sequence and length then presumably the API
>   and data structures should be updated to understand groups more
>   properly.  The current algorithm doesn't really keep track of the
>   length of the old sequence and there are several boundary-condition
>   bugs because of that.  Said another way: if we decide to do
>   something like this in the future we should start from scratch and
>   thus find_match() isn't useful to keep around.
>=20
> This patch isn't quite a no-op.  Specifically:
>=20
> - It should be a slight performance boost of not searching through so
>   many arrays.
> - The old code would have done something useful in one case: it would
>   allow someone calling rpmh_write() to override the data that came
>   from rpmh_write_batch().  I don't believe that actually happens in
>   reality.
>=20
> Signed-off-by: Douglas Anderson <dianders@chromium.org>
> Reviewed-by: Maulik Shah <mkshah@codeaurora.org>
> Tested-by: Maulik Shah <mkshah@codeaurora.org>
> ---

Reviewed-by: Stephen Boyd <swboyd@chromium.org>
