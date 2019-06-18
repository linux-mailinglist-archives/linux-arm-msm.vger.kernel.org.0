Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 622DD4A27D
	for <lists+linux-arm-msm@lfdr.de>; Tue, 18 Jun 2019 15:40:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726248AbfFRNkW (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 18 Jun 2019 09:40:22 -0400
Received: from mail-qt1-f195.google.com ([209.85.160.195]:42466 "EHLO
        mail-qt1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728575AbfFRNkW (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 18 Jun 2019 09:40:22 -0400
Received: by mail-qt1-f195.google.com with SMTP id s15so15277294qtk.9;
        Tue, 18 Jun 2019 06:40:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=sip8yqMGL5HYkSNzPjSutbtzx9pAVqlJddD+spZ1ESY=;
        b=pp21Rn8pPivLH1E0kWFM/2lZm6bAb6etwe8om3ogOsCmNAdAZr/20x0WkVbcH+Ts8i
         Gy/sKFAitaG1OGtu7+E9oy0LRLWKIfDm6sdI0ppIyu5x0DwTvHcM5MbWY2Y8H2nUHoW8
         vs/KIMEB5EIrydlsRkjo7HuxXD1zFkfSIgrzCdSVd6BxZ6j+UvWTwBxL7qS0UbEwxj7l
         U8Vu4joCvZcx85u86932CARZXbVX8cFH2eZ3gZ30vDx3rHxNLgS/MYPvNS1ocLhfkBbP
         yvxey/ZWIq4Mvh4TIIz4olDxKv7cIwLtFkjI5L0sXh3RNlbuWS2+nwR64rI2Zhca/DXR
         /QhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=sip8yqMGL5HYkSNzPjSutbtzx9pAVqlJddD+spZ1ESY=;
        b=YoyxoTklf6QckrWr4lukK3kiiUvHXz4zTRapfnIOz4KBwY1U16T53V2+gvBQ6e2mRK
         KGZF29Yarx+w0/YcCD1wB7ULmmi6MHsEuw/031K05LoYKH5la6waVQrYsN+1ehByf9+I
         0wIPMMT0kc6YFVqDbBGF8r1unowVVMos7T4s9MKE112dKIf1gKTm4K6PeI1UhyVsGqMk
         1aHNjp/HgDQIPcM7y4ZgcbmI53K+2ATTkBVm3CjAmUTct+/R8tOSzQNA+TjI9ehawFhU
         9fxTyCQqzQYc3ihBujliOrrobmpYr2mgMfq3+FnyjdWtPfoU2jyYFHPlAMbs7n54LXDz
         YPaA==
X-Gm-Message-State: APjAAAVR5U7EYIZebCuYBjvUY/Wu2Tw3vihABJCV9VDXEtDp2GnTgw/Y
        kp6Akoz0xEGk9rPqAp6CmpFFgjrvhgMe8FAUIwk=
X-Google-Smtp-Source: APXvYqwTfW9SHCCil6M0GXO+K/MKJJdO+3TnQJ+aCdN91TMQKTLKOVFZggy0oZ+qNvBcOUNJoMdhkSoLWnhSiYaDxL0=
X-Received: by 2002:a0c:b159:: with SMTP id r25mr26932527qvc.219.1560865221304;
 Tue, 18 Jun 2019 06:40:21 -0700 (PDT)
MIME-Version: 1.0
References: <20190516142342.28019-1-smuchun@gmail.com> <20190524190443.GB29565@kroah.com>
 <CAPSr9jH3sowszuNtBaTM1Wdi9vW+iakYX1G3arj+2_r5r7bYwQ@mail.gmail.com>
In-Reply-To: <CAPSr9jH3sowszuNtBaTM1Wdi9vW+iakYX1G3arj+2_r5r7bYwQ@mail.gmail.com>
From:   Muchun Song <smuchun@gmail.com>
Date:   Tue, 18 Jun 2019 21:40:13 +0800
Message-ID: <CAPSr9jFG17YnQC3UZrTZjqytB5wpTMeqqqOcJ7Sf6gAr8o5Uhg@mail.gmail.com>
Subject: Re: [PATCH v4] driver core: Fix use-after-free and double free on
 glue directory
To:     Greg KH <gregkh@linuxfoundation.org>
Cc:     "Rafael J. Wysocki" <rafael@kernel.org>,
        Benjamin Herrenschmidt <benh@kernel.crashing.org>,
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

Ping guys ? I think this is worth fixing.

Muchun Song <smuchun@gmail.com> =E4=BA=8E2019=E5=B9=B45=E6=9C=8825=E6=97=A5=
=E5=91=A8=E5=85=AD =E4=B8=8B=E5=8D=888:15=E5=86=99=E9=81=93=EF=BC=9A

>
> Hi greg k-h,
>
> Greg KH <gregkh@linuxfoundation.org> =E4=BA=8E2019=E5=B9=B45=E6=9C=8825=
=E6=97=A5=E5=91=A8=E5=85=AD =E4=B8=8A=E5=8D=883:04=E5=86=99=E9=81=93=EF=BC=
=9A
> >
> > On Thu, May 16, 2019 at 10:23:42PM +0800, Muchun Song wrote:
> > > There is a race condition between removing glue directory and adding =
a new
> > > device under the glue directory. It can be reproduced in following te=
st:
> >
> > <snip>
> >
> > Is this related to:
> >         Subject: [PATCH v3] drivers: core: Remove glue dirs early only =
when refcount is 1
> >
> > ?
> >
> > If so, why is the solution so different?
>
> In the v1 patch, the solution is that remove glue dirs early only when
> refcount is 1. So
> the v1 patch like below:
>
> @@ -1825,7 +1825,7 @@ static void cleanup_glue_dir(struct device *dev,
> struct kobject *glue_dir)
>                 return;
>
>         mutex_lock(&gdp_mutex);
> -       if (!kobject_has_children(glue_dir))
> +       if (!kobject_has_children(glue_dir) && kref_read(&glue_dir->kref)=
 =3D=3D 1)
>                 kobject_del(glue_dir);
>         kobject_put(glue_dir);
>         mutex_unlock(&gdp_mutex);
> -----------------------------------------------------------------------
>
> But from Ben's suggestion as below:
>
> I find relying on the object count for such decisions rather fragile as
> it could be taken temporarily for other reasons, couldn't it ? In which
> case we would just fail...
>
> Ideally, the looking up of the glue dir and creation of its child
> should be protected by the same lock instance (the gdp_mutex in that
> case).
> -----------------------------------------------------------------------
>
> So another solution is used from Ben's suggestion in the v2 patch. But
> I forgot to update the commit message until the v4 patch. Thanks.
>
> Yours,
> Muchun
