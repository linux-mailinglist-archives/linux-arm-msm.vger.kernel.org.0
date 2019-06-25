Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 139B8552DB
	for <lists+linux-arm-msm@lfdr.de>; Tue, 25 Jun 2019 17:06:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731938AbfFYPGd (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 25 Jun 2019 11:06:33 -0400
Received: from mail-qk1-f194.google.com ([209.85.222.194]:45462 "EHLO
        mail-qk1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730607AbfFYPGd (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 25 Jun 2019 11:06:33 -0400
Received: by mail-qk1-f194.google.com with SMTP id s22so12838001qkj.12;
        Tue, 25 Jun 2019 08:06:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=bELmNNrnslYbuDFKjG/eQ34XIMdof74I0tg6yMjaKmA=;
        b=aYnVPF7zd1KE6zNs306l3HZM/2M5rLu9+bVjs4QvJiF2jbGzsH1JuOsZQqSrAfSNX+
         VUpY+0MvQFofyB8uhggGXMl5YQBuHFaBZeqqya2qhf7bbfe+OtccC3SuKJUDiSJDUT1E
         /zQalvONctY/tAqo6dX24Q5xSvR2iyVQ5nkCOfDdoSHOeq6J3NERy4CeiNwZH7Knn76H
         7jlMOBk/cP2BrsfrIWm6ajCFLoygSzCMc162Vg5JTUIUwwOBv0N5VOCQFCQHbA55jqC3
         4U6Rji/vRptvBs55J8COtor4tENBxhApB/NGsknY9ppLIkcKokKRRAEZLFTLKbt1whmE
         Un7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=bELmNNrnslYbuDFKjG/eQ34XIMdof74I0tg6yMjaKmA=;
        b=NK0wRnpgyrNq+YCy6IHMYgJVLu3bbGYzc4uNA3Lyc6rUbSUoF0juWRBUtpxSNM+x/k
         Q271QtIXvjQPXJ0M4XOGzf+z2xdy6Rskx3oBP4WVbS1eILw9g7t0YeVj8kRSim2/7fY0
         V+kskgtH7mjsVJPwzqOVl7CBYpzgthwEq5bWo+/c6o//DtYawgEbKJwB83mxLGN9FlMZ
         iVcfEIQUUg2v9ks1Y6qrDto8csBDNJo2S4EXptAsjEn3/xkf828OkrqiTqmhq4C1e8if
         LfaneUe8ixNlPJwCc79TvVqXW2su9xGHK075+yG3f9dahsoUwFqltPOUgcN23njB/KVV
         0iwg==
X-Gm-Message-State: APjAAAVZVM2QbFVE3SqXJgMUKEKkAZyhs22uJULPP4iPEtVbXT162O+X
        gH35hxx2GzFVt4FxXeuxg9saWEN7Rjz7AC5hLGU=
X-Google-Smtp-Source: APXvYqyx0QseH6SXwVmzmo+9GWLxHuefdKjKG8yiwmM0xM37iwxfQ7PzIdCh9+Lkkc3hvdOoPafVm/r8iodbKy+oXl0=
X-Received: by 2002:a37:ea0c:: with SMTP id t12mr56728789qkj.117.1561475192105;
 Tue, 25 Jun 2019 08:06:32 -0700 (PDT)
MIME-Version: 1.0
References: <20190516142342.28019-1-smuchun@gmail.com> <20190524190443.GB29565@kroah.com>
 <CAPSr9jH3sowszuNtBaTM1Wdi9vW+iakYX1G3arj+2_r5r7bYwQ@mail.gmail.com>
 <CAPSr9jFG17YnQC3UZrTZjqytB5wpTMeqqqOcJ7Sf6gAr8o5Uhg@mail.gmail.com>
 <20190618152859.GB1912@kroah.com> <CAPSr9jFMKb1bQAbCFLqP2+fb60kcbyJ+cDspkL5FH28CNKFz3A@mail.gmail.com>
 <20190618161340.GA13983@kroah.com> <e3e064d85790a56b661ef9641e02c571540c6f44.camel@kernel.crashing.org>
In-Reply-To: <e3e064d85790a56b661ef9641e02c571540c6f44.camel@kernel.crashing.org>
From:   Muchun Song <smuchun@gmail.com>
Date:   Tue, 25 Jun 2019 23:06:22 +0800
Message-ID: <CAPSr9jExG2C6U0D2TN-PUxgi9waD5QkSR-icxNPP1w9nJx3GUQ@mail.gmail.com>
Subject: Re: [PATCH v4] driver core: Fix use-after-free and double free on
 glue directory
To:     Benjamin Herrenschmidt <benh@kernel.crashing.org>,
        Greg KH <gregkh@linuxfoundation.org>
Cc:     "Rafael J. Wysocki" <rafael@kernel.org>,
        Prateek Sood <prsood@codeaurora.org>,
        Mukesh Ojha <mojha@codeaurora.org>, gkohli@codeaurora.org,
        linux-kernel <linux-kernel@vger.kernel.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        zhaowuyun@wingtech.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Benjamin Herrenschmidt <benh@kernel.crashing.org> =E4=BA=8E2019=E5=B9=B46=
=E6=9C=8819=E6=97=A5=E5=91=A8=E4=B8=89 =E4=B8=8A=E5=8D=885:51=E5=86=99=E9=
=81=93=EF=BC=9A
>
> On Tue, 2019-06-18 at 18:13 +0200, Greg KH wrote:
> >
> > Again, I am totally confused and do not see a patch in an email that
> > I
> > can apply...
> >
> > Someone needs to get people to agree here...
>
> I think he was hoping you would chose which solution you prefered here

Yeah, right, I am hoping you would chose which solution you prefered here.
Thanks.

> :-) His original or the one I suggested instead. I don't think there's
> anybody else with understanding of sysfs guts around to form an
> opinion.
>

Yours,
Muchun
