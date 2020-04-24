Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 400BB1B6B80
	for <lists+linux-arm-msm@lfdr.de>; Fri, 24 Apr 2020 04:41:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726027AbgDXClc (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 23 Apr 2020 22:41:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45172 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725884AbgDXClb (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 23 Apr 2020 22:41:31 -0400
Received: from mail-pf1-x442.google.com (mail-pf1-x442.google.com [IPv6:2607:f8b0:4864:20::442])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 51675C09B044
        for <linux-arm-msm@vger.kernel.org>; Thu, 23 Apr 2020 19:41:31 -0700 (PDT)
Received: by mail-pf1-x442.google.com with SMTP id w65so4057359pfc.12
        for <linux-arm-msm@vger.kernel.org>; Thu, 23 Apr 2020 19:41:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:content-transfer-encoding:in-reply-to:references
         :subject:from:cc:to:date:message-id:user-agent;
        bh=IamAn4a0tQXNMZ5u6FtEHO8gII/iIo7Dkt5XESJ77dQ=;
        b=mkp2gRYNtVroJL0E5FpN6TQ1ABuX3Q+1ke0nW3i6W26Jc9tboDBV1/i77MwsBJ3FYx
         ejQXMEoqNJs5kQ/L3baIEXrXYDy71UBWrs3vxusMVBHr8B5OnDSG27PmRphMS0E7OsMq
         xhhsoUhzxkI6F0+B8I8WhwwsuwLs3fMCRvh1w=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:content-transfer-encoding
         :in-reply-to:references:subject:from:cc:to:date:message-id
         :user-agent;
        bh=IamAn4a0tQXNMZ5u6FtEHO8gII/iIo7Dkt5XESJ77dQ=;
        b=TeSR94YUV1WZBchTGdn9JU99wCwNK3x7Bi/6knpm/W0t4Y87BN2M3ugPhONzmWyhum
         Sin9gTGBJEGdeucylx706S5BKvmuOr6iSD65PxCgcY8OAMB545zwsvaDBVq+dP8SI8pf
         aPQcwLKZjdup9NSI43gpdpZ7CKbfXjYa2ZK7aFo1n7nkNs6A/kTHA4TPCKTezyW814Yy
         Ox/w0DgHtv+u60xgxL0fj0wj7dP+R3q945slRn99j0MEGypY2suJ5bd9QQHdr+VDfbGh
         khIfAMKFwW6UrNi6/ioOH/opzGGza6a8bpDP4KPWojwfkCR+heSGqQeaD5bhCbBJPgIi
         CImA==
X-Gm-Message-State: AGi0PuYOAp5HoCdDBQonNHgC2OQTe5Iv0UMF6yFH2Td/rz7Q3Ghgw99u
        dVTU4JoadbYJgMZ/nvZpVUiN6A==
X-Google-Smtp-Source: APiQypLfcGqGen5mp5XKqJ1vdbdXM4bxAywugE5RO8B7Z7gEjxWlAJTv+Do9/rhgBJdrxbbr6Y8rww==
X-Received: by 2002:a63:6342:: with SMTP id x63mr3762256pgb.185.1587696090768;
        Thu, 23 Apr 2020 19:41:30 -0700 (PDT)
Received: from chromium.org ([2620:15c:202:1:fa53:7765:582b:82b9])
        by smtp.gmail.com with ESMTPSA id b24sm3361024pfi.4.2020.04.23.19.41.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Apr 2020 19:41:30 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <158769590404.135303.4049749400685142607@swboyd.mtv.corp.google.com>
References: <20200422145408.v4.1.Ic7096b3b9b7828cdd41cd5469a6dee5eb6abf549@changeid> <20200422145408.v4.2.I1927d1bca2569a27b2d04986baf285027f0818a2@changeid> <158769590404.135303.4049749400685142607@swboyd.mtv.corp.google.com>
Subject: Re: [PATCH v4 2/5] soc: qcom: rpmh-rsc: We aren't notified of our own failure w/ NOTIFY_BAD
From:   Stephen Boyd <swboyd@chromium.org>
Cc:     mka@chromium.org, mkshah@codeaurora.org, evgreen@chromium.org,
        Douglas Anderson <dianders@chromium.org>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Douglas Anderson <dianders@chromium.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        rafael.j.wysocki@intel.com
Date:   Thu, 23 Apr 2020 19:41:29 -0700
Message-ID: <158769608929.135303.4217396252503884167@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Stephen Boyd (2020-04-23 19:38:24)
> Quoting Douglas Anderson (2020-04-22 14:55:00)
> > When a PM Notifier returns NOTIFY_BAD it doesn't get called with
> > CPU_PM_ENTER_FAILED.  It only get called for CPU_PM_ENTER_FAILED if
> > someone else (further down the notifier chain) returns NOTIFY_BAD.
> >=20
> > Handle this case by taking our CPU out of the list of ones that have
> > entered PM.  Without this it's possible we could detect that the last
> > CPU went down (and we would flush) even if some CPU was alive.  That's
> > not good since our flushing routines currently assume they're running
> > on the last CPU for mutual exclusion.
> >=20
> > Fixes: 985427f997b6 ("soc: qcom: rpmh: Invoke rpmh_flush() for dirty ca=
ches")
> > Signed-off-by: Douglas Anderson <dianders@chromium.org>
> > ---
>=20
> Reported-by: Stephen Boyd <swboyd@chromium.org>

Scratch that one! Copy/paste for the lose.
