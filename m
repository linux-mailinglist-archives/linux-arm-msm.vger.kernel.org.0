Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 88BAC2A458
	for <lists+linux-arm-msm@lfdr.de>; Sat, 25 May 2019 14:15:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726672AbfEYMPM (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 25 May 2019 08:15:12 -0400
Received: from mail-qk1-f194.google.com ([209.85.222.194]:41603 "EHLO
        mail-qk1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726585AbfEYMPM (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 25 May 2019 08:15:12 -0400
Received: by mail-qk1-f194.google.com with SMTP id m18so11445362qki.8;
        Sat, 25 May 2019 05:15:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=CI7ttPADnJtss52RoDmvpzmLV0bLTdZPHkKxKXHIPjk=;
        b=er2/8T5CV3MzmDJdfMWUujS1J1x82zYzIPkgkjqH7a9V4K5soGGMPs2PEDidokCMlC
         D5vu3eP22ZSsiEWRYK+8pIprRdrraOfj+mbGdiuzyiCorS7pmKHCBxunj474C8iR4xCw
         FSDbzdxMHDSp75oqZVedkRxazUPE8pjUDcEFSc0exw98EuFVwJ2N72On5fRP6h5mS/ct
         pvfYeFQleb+ec/YRZZi0cyL18Pw5Xf1xmBjKE/up13+AHGQpECM88YOQBqkISj/T7TSp
         MUCaHQzN4jaxpCOtAczDCtuPhTxF87M7/kHJ0hgNxjZw5tpjb6vWdMMA5Rmxb3dAYpvZ
         3YmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=CI7ttPADnJtss52RoDmvpzmLV0bLTdZPHkKxKXHIPjk=;
        b=TNcHd6sW+pvc/10zvrurLgqb0qxD1yG3qcODnOxQsZDzYhzvJw2qW3freprV7gCuRb
         qH2/jUCPAsXw+xOOLrHr8nSFGEHDd7TtzZuTVCriGTfgZfSnAoNIfYoSD6tviMEewk8D
         fsaKeGaOs6a8pfbN389YChuSUVTvCjPP5JnAYvovvPoab/rjk/9NxvyyNEAYalnpdkBP
         TAx12CNhmcOljWJAyNWjiD+l9RWzZHzt5fNbhbc6fx4DkKLqF6eYckv38Rm4YaV3zhh4
         Bodpo639MsLkGoaExNKpup8fRF9BnxM3eyiEVBqsyvEyyKEyLfOFYSa6PCEEa7Z7ZCha
         hvzQ==
X-Gm-Message-State: APjAAAWl+tIh2e7MEMn3EYv05sF0EIY/slSHZjGe3S5EIAKX2unPqDl+
        dqOQz6KnR7iGr6ZP/S9jyYGUyiMAZTnD+fBKOHo=
X-Google-Smtp-Source: APXvYqw3GNOrMQEvjC733XaXf9DlE+1Rh/K7VOmXL8/uy/w6mxyYRh7PflgQJacJy7QqRi1X+t52ZFWgrts8DS7UioY=
X-Received: by 2002:a0c:b15a:: with SMTP id r26mr5320644qvc.219.1558786511379;
 Sat, 25 May 2019 05:15:11 -0700 (PDT)
MIME-Version: 1.0
References: <20190516142342.28019-1-smuchun@gmail.com> <20190524190443.GB29565@kroah.com>
In-Reply-To: <20190524190443.GB29565@kroah.com>
From:   Muchun Song <smuchun@gmail.com>
Date:   Sat, 25 May 2019 20:15:01 +0800
Message-ID: <CAPSr9jH3sowszuNtBaTM1Wdi9vW+iakYX1G3arj+2_r5r7bYwQ@mail.gmail.com>
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

Hi greg k-h,

Greg KH <gregkh@linuxfoundation.org> =E4=BA=8E2019=E5=B9=B45=E6=9C=8825=E6=
=97=A5=E5=91=A8=E5=85=AD =E4=B8=8A=E5=8D=883:04=E5=86=99=E9=81=93=EF=BC=9A
>
> On Thu, May 16, 2019 at 10:23:42PM +0800, Muchun Song wrote:
> > There is a race condition between removing glue directory and adding a =
new
> > device under the glue directory. It can be reproduced in following test=
:
>
> <snip>
>
> Is this related to:
>         Subject: [PATCH v3] drivers: core: Remove glue dirs early only wh=
en refcount is 1
>
> ?
>
> If so, why is the solution so different?

In the v1 patch, the solution is that remove glue dirs early only when
refcount is 1. So
the v1 patch like below:

@@ -1825,7 +1825,7 @@ static void cleanup_glue_dir(struct device *dev,
struct kobject *glue_dir)
                return;

        mutex_lock(&gdp_mutex);
-       if (!kobject_has_children(glue_dir))
+       if (!kobject_has_children(glue_dir) && kref_read(&glue_dir->kref) =
=3D=3D 1)
                kobject_del(glue_dir);
        kobject_put(glue_dir);
        mutex_unlock(&gdp_mutex);
-----------------------------------------------------------------------

But from Ben's suggestion as below:

I find relying on the object count for such decisions rather fragile as
it could be taken temporarily for other reasons, couldn't it ? In which
case we would just fail...

Ideally, the looking up of the glue dir and creation of its child
should be protected by the same lock instance (the gdp_mutex in that
case).
-----------------------------------------------------------------------

So another solution is used from Ben's suggestion in the v2 patch. But
I forgot to update the commit message until the v4 patch. Thanks.

Yours,
Muchun
