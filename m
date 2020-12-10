Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 98CD82D69BD
	for <lists+linux-arm-msm@lfdr.de>; Thu, 10 Dec 2020 22:26:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2404845AbgLJV0B (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 10 Dec 2020 16:26:01 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40932 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2404836AbgLJVZy (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 10 Dec 2020 16:25:54 -0500
Received: from mail-pg1-x543.google.com (mail-pg1-x543.google.com [IPv6:2607:f8b0:4864:20::543])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B9CB6C0617A7
        for <linux-arm-msm@vger.kernel.org>; Thu, 10 Dec 2020 13:25:13 -0800 (PST)
Received: by mail-pg1-x543.google.com with SMTP id f17so5443158pge.6
        for <linux-arm-msm@vger.kernel.org>; Thu, 10 Dec 2020 13:25:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:content-transfer-encoding:in-reply-to:references
         :subject:from:cc:to:date:message-id:user-agent;
        bh=vThmtEMe7O46c9tQqEWEVukUH1ChbZTC/moKCKUwtoE=;
        b=Mobm9meQeooIgSZlSVO4S32L1xZxAJLuDvBbtjdsL2XrRTA/XTO+EyDAVvG7/tQZPh
         Q9k1UtA+IPTVZqcGwj+5sxj5e+xuHNtmdgUfzkV9bxBzXtsYFkQ7q+1JZxc525hz2l/P
         RSphddRZ+ooFucxnsy74rJy9v+71iGgUU7pMM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:content-transfer-encoding
         :in-reply-to:references:subject:from:cc:to:date:message-id
         :user-agent;
        bh=vThmtEMe7O46c9tQqEWEVukUH1ChbZTC/moKCKUwtoE=;
        b=FkFqhd1yg1QpjYGeIEnTZq4B3U+vscLBL7KbNyQ5B5156oR1B2behHSOia5Hcm7owu
         aBtQPKW6tX2OIkjHvjDd6ZseH0NURxYS8xb4cUb5KTQm5Koyzbk7Ki02sZD+vmItDO/e
         /phq6JqZ0DCYbD2k7C1cTnsWXtZ5iumFRCRg4/WxCJyYTIO3TdwBnWgQ/i3vgKH1Odui
         ifulMgK0nPB88Lwwfp7hO4yENMS7idI9Pilvcq/ZzRJ6NqJB/v8D9/j2wvFw9T1zSkb7
         0ezVkHps4KJzXJGPm8z6ST1aZRMvrKxbojMs99EPAGUjznkMU6aoOPpoK52veWT4JlQ/
         XkEg==
X-Gm-Message-State: AOAM530ffCgnW+lZ5muFAklUds93vFZ6SV5K+GUWl8nWZ9BrzIf8EYfo
        1yuT/F8Ql/me8vF0SN7MLyZTLQ==
X-Google-Smtp-Source: ABdhPJzz2YTKP+M/SVJWkhcA3Ivcn1qhxENS+THxgIHuuHnX7c41Vd1LeCKyV++ewzAy6DYgtc32Lw==
X-Received: by 2002:a17:90b:3698:: with SMTP id mj24mr9434503pjb.149.1607635513275;
        Thu, 10 Dec 2020 13:25:13 -0800 (PST)
Received: from chromium.org ([2620:15c:202:201:3e52:82ff:fe6c:83ab])
        by smtp.gmail.com with ESMTPSA id e13sm7863703pgh.54.2020.12.10.13.25.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Dec 2020 13:25:12 -0800 (PST)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <CAD=FV=V2E6W_1PtqBy6Fo_Cxp6kygpeitEkaMG5bMRpv7gO53w@mail.gmail.com>
References: <20201210125709.1.Iec3430c7d3c2a29262695edef7b82a14aaa567e5@changeid> <160763420585.1580929.9586717907613124743@swboyd.mtv.corp.google.com> <CAD=FV=V2E6W_1PtqBy6Fo_Cxp6kygpeitEkaMG5bMRpv7gO53w@mail.gmail.com>
Subject: Re: [PATCH] mmc: sdhci-msm: Warn about overclocking SD/MMC
From:   Stephen Boyd <swboyd@chromium.org>
Cc:     Adrian Hunter <adrian.hunter@intel.com>,
        Ulf Hansson <ulf.hansson@linaro.org>,
        Veerabhadrarao Badiganti <vbadigan@codeaurora.org>,
        Taniya Das <tdas@codeaurora.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>,
        Linux MMC List <linux-mmc@vger.kernel.org>
To:     Doug Anderson <dianders@chromium.org>
Date:   Thu, 10 Dec 2020 13:25:11 -0800
Message-ID: <160763551118.1580929.6120205249234917665@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Doug Anderson (2020-12-10 13:20:03)
> On Thu, Dec 10, 2020 at 1:03 PM Stephen Boyd <swboyd@chromium.org> wrote:
> >
> >
> > Can we use dev_warn?
>=20
> What's here matches other prints including other ones in the same
> function and in much of the MMC subsystem.  mmc_hostname() shows
> "mmc1"
>=20
> > dev_warn(mmc_dev(mmc)
> > dev_warn(&msm_host->pdev->dev
>=20
> This show "sdhci_msm 7c4000.sdhci"
>=20
> I'm going to keep with tradition and keep using mmc_hostname().  In
> some parts of this file they use both (a dev_warn that also includes
> the mmc_hostname()) but that feels overkill.

Ok. This driver should be cleaned up I suppose.
