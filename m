Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E43332FF038
	for <lists+linux-arm-msm@lfdr.de>; Thu, 21 Jan 2021 17:28:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387848AbhAUQ2D (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 21 Jan 2021 11:28:03 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49718 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2387790AbhAUQ0a (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 21 Jan 2021 11:26:30 -0500
Received: from mail-vs1-xe33.google.com (mail-vs1-xe33.google.com [IPv6:2607:f8b0:4864:20::e33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8D3D3C0613ED
        for <linux-arm-msm@vger.kernel.org>; Thu, 21 Jan 2021 08:25:37 -0800 (PST)
Received: by mail-vs1-xe33.google.com with SMTP id o186so1368534vso.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 21 Jan 2021 08:25:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=rL3ud9Vf/X+++k4tiy/q4pzVuK3HWoXCz/1tF4KhcLQ=;
        b=afJkIrxDnrv2GPISJA76WpVyiOOIp4mwv+9wCXGWPBK7gOODZcE0eVNEtc2u1JJ0kC
         ZTOjRj23JaI05nIKkdc507H0iX8M2Qe6eARVYJzw7rHSTTkK3GloLQyZhzy9TgRsoTTh
         cpVETAaEyxkTDSWolKIchsUKMbeu/iUDPge21LJkKZZuQzgogezpRSmtAibMrbUYt4+i
         J2gKjN6GK2MDmJWjsvJ1npSBuz6M0gfI4XdDO6SPvrYlan0eD2kdSYMhRURaYclJMRjS
         Hbj5o3SCpafEQb9xXLd2mvbNtRF9QjYoCVRm+hkTj2at5BXtYySkhcQBuBf+Z014g01u
         O9Nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=rL3ud9Vf/X+++k4tiy/q4pzVuK3HWoXCz/1tF4KhcLQ=;
        b=g/F1pKqL0vNeh43wKmaNef6X5MAUmJd5jbz7Yn3bZVp/sH9Fiudy0eb09QSS3Max8f
         +GkKdPSZj/yB3Ot6v8rQkCR034lF9cfkvl+b/GptQ41vadTqKcKrmaL7H1URdoIVLl6x
         SZbxJcspl4zWDchqoWJ/FKdJNEbHCgWRZGwISvHbY0oR7c94YE54r5Zyq3Ya0VqfycCg
         3XfmKMjh5zljT47kQLI6ifRtdea4EFAsUnRiIYvWu7DZdXf8ocAi8zByVUsVcbrZneZf
         jYtlP14a67doDicCEYebNs3FRNlVJoZIUUXvivSXzp6npqsFGccnqWZD641RubBfizQY
         FYdg==
X-Gm-Message-State: AOAM532DLSCSsisJpsQsF4lmqsL01Q0bmEID3ShV2qLRs0Vtwxr8iPoy
        WFmCODsyripdBO0U99ekXYP50Cf+ZK7xBjBCZSW/Cw==
X-Google-Smtp-Source: ABdhPJzJvTkIcNEdg8zsT0LPClur5FXw3BifEhr402K54ugCLYzcHRX+pZ6qEJBCYmXu/6zaakvHU4157/HX5lQWWJU=
X-Received: by 2002:a67:facb:: with SMTP id g11mr247740vsq.19.1611246336783;
 Thu, 21 Jan 2021 08:25:36 -0800 (PST)
MIME-Version: 1.0
References: <20210121090140.326380-1-ebiggers@kernel.org> <20210121090140.326380-7-ebiggers@kernel.org>
 <CAPDyKFoOL2Dsqb=nKw5hF5hiVLn-TDHWH4Th9icvoLY4aJtpSA@mail.gmail.com> <YAmd/b2y7vvp7udE@builder.lan>
In-Reply-To: <YAmd/b2y7vvp7udE@builder.lan>
From:   Ulf Hansson <ulf.hansson@linaro.org>
Date:   Thu, 21 Jan 2021 17:25:00 +0100
Message-ID: <CAPDyKFpzwj=hrOLCbWcoVd9ZNM5-BtgPP7Y2L-78SpC2OsB8Bg@mail.gmail.com>
Subject: Re: [PATCH v5 6/9] firmware: qcom_scm: update comment for ICE-related functions
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     Eric Biggers <ebiggers@kernel.org>,
        "linux-mmc@vger.kernel.org" <linux-mmc@vger.kernel.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        Satya Tangirala <satyat@google.com>,
        Andy Gross <agross@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu, 21 Jan 2021 at 16:30, Bjorn Andersson
<bjorn.andersson@linaro.org> wrote:
>
> On Thu 21 Jan 08:42 CST 2021, Ulf Hansson wrote:
>
> > - trimmed cc-list
> >
> > On Thu, 21 Jan 2021 at 10:03, Eric Biggers <ebiggers@kernel.org> wrote:
> > >
> > > From: Eric Biggers <ebiggers@google.com>
> > >
> > > The SCM calls QCOM_SCM_ES_INVALIDATE_ICE_KEY and
> > > QCOM_SCM_ES_CONFIG_SET_ICE_KEY are also needed for eMMC inline
> > > encryption support, not just for UFS.  Update the comments accordingl=
y.
> > >
> > > Reviewed-by: Satya Tangirala <satyat@google.com>
> > > Signed-off-by: Eric Biggers <ebiggers@google.com>
> >
> > Bj=C3=B6rn, may I have your ack on this one? I intend to queue this via=
 my mmc tree.
> >
>
> Certainly, sorry for not paying attention.
>
> Acked-by: Bjorn Andersson <bjorn.andersson@linaro.org>

Thanks!

>
>
> And I presume I'll take the dts patch (8/9) through the Qcom tree...

Yep, I leave that for you.

[...]

Kind regards
Uffe
