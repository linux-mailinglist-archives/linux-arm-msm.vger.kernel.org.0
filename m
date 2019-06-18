Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3D1B84A648
	for <lists+linux-arm-msm@lfdr.de>; Tue, 18 Jun 2019 18:09:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729809AbfFRQJw (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 18 Jun 2019 12:09:52 -0400
Received: from mail-qk1-f196.google.com ([209.85.222.196]:44615 "EHLO
        mail-qk1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729308AbfFRQJw (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 18 Jun 2019 12:09:52 -0400
Received: by mail-qk1-f196.google.com with SMTP id p144so8894189qke.11;
        Tue, 18 Jun 2019 09:09:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=rQiuEFdt0fTstaA0/MpZUJTX6xtT8pMw4bAveIx8/K4=;
        b=ZD+cnENfCyaSUCuacxA/KDm9k5lGVMefiwYAIxt5icjrii/c4T/W/bhRuEhsXzlWBJ
         8/eHQFufyNiUZhZcjRRTWhZuDJemSumP1y2eVPUFyYeWo2ZQSpkUR8nbOTHsis5PNNm7
         RutOpPq8gsWgSSWfot8Fs5P/G5hA4AKtsbpIQ9WmK2VwI5X5riIGijs4dKKaw1RL8i5W
         L/V8qg1dvd5ruvkHJ1EOq7BuwYO63dqXjj/wzHAZSMZ05LpQCNVyIwRw2KsxlJHS98hw
         cjzA4qDZj+826w0k/ua6s1HhaGdS1f+M2MSd2L7tMZQx+ZGa1xDIUcp6RqbK/Kjjs5F+
         s5Eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=rQiuEFdt0fTstaA0/MpZUJTX6xtT8pMw4bAveIx8/K4=;
        b=fTpMwsIFa844eA3h5nMFllSx7dh+r/p+g3LA+61goQCDbzjZJwhbfpKe4/QlDVnpTk
         7537i6DiOb5e50lVA/3vM0VK2MmTBzdwiIn6gctW6ff6Z/SY3iI87gn5NgiZfrtWlU3r
         dqCDF7lImTgPXkihYSG1laOavBRVFTEHUvXt6tGrmZZDqFN6okVb/AXDsW7kPTO8DWJc
         uL73LIQlyJCYi2Ln/pooUxe9c7JC8yJNdg8Z1o0AxfiRGR+71iY3YywFZmnIagEU7IEN
         CzG14mhisSGUXAnqhiSrgn3UYJQhA0zkVZffhJ+6U2IGzp482rFuHsWpq21RKDpTaJnj
         BaTg==
X-Gm-Message-State: APjAAAXMA8+afaSn2TFTbf8SvIB5E26inoM9K0vx4/cdSwxAWEFRRKxs
        CCqz/l8ZZQbXPJ4FHU/evEZylI/I76Pe/peZvn8=
X-Google-Smtp-Source: APXvYqz8wlIOllfsr7z2UMNrFB+2AftBDZ0nWYL4xCEShU5vMFWhMOxf0XfeUZIjHXwjoB/Ao3/Vg2BqPeM2yb+sHeg=
X-Received: by 2002:a37:9e4b:: with SMTP id h72mr92962125qke.297.1560874191287;
 Tue, 18 Jun 2019 09:09:51 -0700 (PDT)
MIME-Version: 1.0
References: <20190516142342.28019-1-smuchun@gmail.com> <20190524190443.GB29565@kroah.com>
 <CAPSr9jH3sowszuNtBaTM1Wdi9vW+iakYX1G3arj+2_r5r7bYwQ@mail.gmail.com>
 <CAPSr9jFG17YnQC3UZrTZjqytB5wpTMeqqqOcJ7Sf6gAr8o5Uhg@mail.gmail.com> <20190618152859.GB1912@kroah.com>
In-Reply-To: <20190618152859.GB1912@kroah.com>
From:   Muchun Song <smuchun@gmail.com>
Date:   Wed, 19 Jun 2019 00:09:40 +0800
Message-ID: <CAPSr9jFMKb1bQAbCFLqP2+fb60kcbyJ+cDspkL5FH28CNKFz3A@mail.gmail.com>
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

Greg KH <gregkh@linuxfoundation.org> =E4=BA=8E2019=E5=B9=B46=E6=9C=8818=E6=
=97=A5=E5=91=A8=E4=BA=8C =E4=B8=8B=E5=8D=8811:29=E5=86=99=E9=81=93=EF=BC=9A
>
> On Tue, Jun 18, 2019 at 09:40:13PM +0800, Muchun Song wrote:
> > Ping guys ? I think this is worth fixing.
>
> That's great (no context here), but I need people to actually agree on
> what the correct fix should be.  I had two different patches that were
> saying they fixed the same issue, and that feels really wrong.

Another patch:
    Subject: [PATCH v3] drivers: core: Remove glue dirs early only
when refcount is 1

My first v1 patch:
    Subject: [PATCH] driver core: Fix use-after-free and double free
on glue directory

The above two patches are almost the same that fix is based on the refcount=
.
But why we change the solution from v1 to v4? Some discussion can
refer to the mail:

    Subject: [PATCH] driver core: Fix use-after-free and double free
on glue directory

Thanks.

Yours,
Muchun
