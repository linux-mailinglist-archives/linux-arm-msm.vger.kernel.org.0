Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0EF7F1B7CBC
	for <lists+linux-arm-msm@lfdr.de>; Fri, 24 Apr 2020 19:28:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727033AbgDXR2f (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 24 Apr 2020 13:28:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43454 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727063AbgDXR2e (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 24 Apr 2020 13:28:34 -0400
Received: from mail-pj1-x1043.google.com (mail-pj1-x1043.google.com [IPv6:2607:f8b0:4864:20::1043])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DAF11C09B049
        for <linux-arm-msm@vger.kernel.org>; Fri, 24 Apr 2020 10:28:30 -0700 (PDT)
Received: by mail-pj1-x1043.google.com with SMTP id a31so2256912pje.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 24 Apr 2020 10:28:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:content-transfer-encoding:in-reply-to:references
         :subject:from:cc:to:date:message-id:user-agent;
        bh=vbEqXfaL54AfhJ4npcAoZ7HbWa5wguFP+Av2lpKJi2A=;
        b=X9O/ERZj2xJ0YL55Nob0jzqnqFCgGKnwLhHbYF3mO+mgvWJRtcdT4uaKePsCLmwGXm
         Iz5UiY/PW+9jwH3jHHJsy9oR1cq0ynzGJAmtF800KvvyTqrkS2r8VWzooNp1+6tF4Gzr
         Y1BsaPD+l5mEYmgcPSW6Cmz19BO4kGl07GGoE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:content-transfer-encoding
         :in-reply-to:references:subject:from:cc:to:date:message-id
         :user-agent;
        bh=vbEqXfaL54AfhJ4npcAoZ7HbWa5wguFP+Av2lpKJi2A=;
        b=GyJOWCrF7ZCvTU+TbkrKeRID7YWQKH9/NFbCCw+z1eyABPd7XzXYhJ9Tq1s9lJmL1E
         dEuIylo/mog2Z/oHNNdgWiHfI0MDHSuxmyb8U47SwQYcrBRvo0gI4FbUURXGn40U/kOP
         nYTeC1NqZ3shcPjnyKSYsIenevNcNASbXp67hHrFZs5oi0v9FsrNoI3+ukfiqTyTrvxp
         I01d1ijZBDd1BXr9R3iYMKVOkYtxBlAA0y4T51udiVwqTvGtYDGvttp2bm6OJK4Y4lZ1
         zirSeZjw5PCOBuAJ4rSWJszBFwf8Q8tGOJdtegE0PK30v1rMPvuO0OetJdjwTF47uBk6
         psgw==
X-Gm-Message-State: AGi0PuaciXkdXB28XAQl+ldMQ8PNGnahZspQbkHKBt/e8tVgr7bEw4E+
        7v6FTursUT0vqJtc93JmFpXeiA==
X-Google-Smtp-Source: APiQypLU3bzunfrfhJUL85QtiJqsJkujcGke3q5ieGkSoz15JrT2JAij9hhDu3DSOtgoCGO7hbW5Zg==
X-Received: by 2002:a17:902:a40f:: with SMTP id p15mr10746662plq.154.1587749310454;
        Fri, 24 Apr 2020 10:28:30 -0700 (PDT)
Received: from chromium.org ([2620:15c:202:1:fa53:7765:582b:82b9])
        by smtp.gmail.com with ESMTPSA id o68sm6336898pfb.206.2020.04.24.10.28.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Apr 2020 10:28:30 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <CAD=FV=WT1rw9H34GjQSjbubR6y61=v-jR-gEvRtN4tU_NwviHA@mail.gmail.com>
References: <20200424045414.133381-1-swboyd@chromium.org> <20200424045414.133381-2-swboyd@chromium.org> <CAD=FV=WT1rw9H34GjQSjbubR6y61=v-jR-gEvRtN4tU_NwviHA@mail.gmail.com>
Subject: Re: [PATCH 1/3] soc: qcom: rpmh-rsc: Remove tcs_is_free() API
From:   Stephen Boyd <swboyd@chromium.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        LKML <linux-kernel@vger.kernel.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        Maulik Shah <mkshah@codeaurora.org>
To:     Doug Anderson <dianders@chromium.org>
Date:   Fri, 24 Apr 2020 10:28:29 -0700
Message-ID: <158774930920.135303.8846586262429360001@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Doug Anderson (2020-04-24 10:12:04)
> On Thu, Apr 23, 2020 at 9:54 PM Stephen Boyd <swboyd@chromium.org> wrote:
> > +       unsigned long i;
> >
> > -       for (i =3D 0; i < tcs->num_tcs; i++) {
> > -               if (tcs_is_free(tcs->drv, tcs->offset + i))
> > -                       return tcs->offset + i;
> > -       }
> > +       i =3D find_next_zero_bit(drv->tcs_in_use, MAX_TCS_NR, tcs->offs=
et);
>=20
> Rather than passing MAX_TCS_NR would it be legit to pass "tcs->offset
> + tcs->num_tcs"?  You are passing that as "size" above in
> check_for_req_inflight().

Yeah I think that should work. I'll roll it in.
