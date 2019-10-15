Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 21634D7719
	for <lists+linux-arm-msm@lfdr.de>; Tue, 15 Oct 2019 15:09:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730318AbfJONJm (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 15 Oct 2019 09:09:42 -0400
Received: from mail-wm1-f65.google.com ([209.85.128.65]:51921 "EHLO
        mail-wm1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730180AbfJONJl (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 15 Oct 2019 09:09:41 -0400
Received: by mail-wm1-f65.google.com with SMTP id 7so20833127wme.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 15 Oct 2019 06:09:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=AZLh4M45F8+IHDYQfQ59rTfgOYaS9KZGvrjR75EFs2c=;
        b=AxS3jNtI/paOnEUyOVl8yf+sRnICTDCB/pSCdYKfqkRkvuJ48UwgjiyPnmBbdvcUs8
         3bWp50PWeCqic3cx0h/bmR/N91vRZx/oZafvItIrV5SGwMPhvzxGlNKbK4sYYgdXiQkz
         ptjWMVNHgLfdJ/glRcVuUQhaNdBkL6ntYldvg9qQY1GrLBFM8wQsygF5/N/WS/h7CGTD
         Lg/C+nW4EG1Kuve3pGCEP/ieDMFTRCjKVzxSDqgl4fJjyOxzAMmZYAcsEFahsfv7y2TL
         t1fQZNKcB5KO9ky8Wf27LlVxKnJwkNISTUlal+eOASfb4iJtpubaWu7Ypb/w6wvranm1
         LUNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=AZLh4M45F8+IHDYQfQ59rTfgOYaS9KZGvrjR75EFs2c=;
        b=l+7j5W3B/2d17d85qzCWVtU4/cJkigWyX7WE/BQZcbJ6VinwGWTpbOaHlRuHec+nRf
         r4UrCBdZVHorlRyqtCYakm2xzaAPoIENMhEut2JXxgenxckmREL6AvYvFKvMME0yu0J1
         CuRy4bPixMgPvTyEs+cn7/mePqyM6tYHT7WSfOXk6+rcoITqzLvDiFKc/ND4PeNArdtk
         1sX2TB+s32zaOqS7mkJkPBRM5oN0aXDnuCmmIosaMFz1V5Rj+5+vYXZPrgPiUvDpPwV/
         Km5pdbv6lEjR7ha9ZsL8Djflfa9JEBjxyInusbWEi8LztgbxLHMXPH09/haiiilqdI2E
         E7zw==
X-Gm-Message-State: APjAAAW4+OheL+dEp5wOx2H4s6jcDIhAZbpbUoq0w7DQWhBl6qLMTfkq
        KjksSqiesxOS8TbhCKHxxw3Ptv49to7TwMUDpOSiV1Win40=
X-Google-Smtp-Source: APXvYqw7BzekgKwEuFDENzlpilT/WQOhMMJM0W/kjTFmA6tcRQKrddwRlgXqkc9dE6v0IjOeWL5ccaRoNMDX9hiAPU4=
X-Received: by 2002:a1c:a651:: with SMTP id p78mr19694786wme.53.1571144979978;
 Tue, 15 Oct 2019 06:09:39 -0700 (PDT)
MIME-Version: 1.0
References: <20191001220205.6423-1-kholk11@gmail.com> <20191001220205.6423-2-kholk11@gmail.com>
 <20191015111454.GG14518@8bytes.org> <CAK7fi1YZXW=mqC5HWtfBWsioAq-duejAk6RgtD8npKZR=af38w@mail.gmail.com>
 <20191015124008.GB17570@8bytes.org>
In-Reply-To: <20191015124008.GB17570@8bytes.org>
From:   AngeloGioacchino Del Regno <kholk11@gmail.com>
Date:   Tue, 15 Oct 2019 15:09:29 +0200
Message-ID: <CAK7fi1YT_Or0bD3DwofQ_BLUsKyY3M7T8XCmDp1PAK9To7b64g@mail.gmail.com>
Subject: Re: [PATCH v4 1/7] firmware: qcom: scm: Add function to set IOMMU
 pagetable addressing
To:     Joerg Roedel <joro@8bytes.org>
Cc:     MSM <linux-arm-msm@vger.kernel.org>,
        iommu@lists.linux-foundation.org, marijns95@gmail.com,
        Andy Gross <agross@kernel.org>, Rob Clark <robdclark@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Il giorno mar 15 ott 2019 alle ore 14:40 Joerg Roedel
<joro@8bytes.org> ha scritto:
>
> On Tue, Oct 15, 2019 at 02:33:47PM +0200, AngeloGioacchino Del Regno wrote:
> > Il giorno mar 15 ott 2019 alle ore 13:14 Joerg Roedel
> > <joro@8bytes.org> ha scritto:
> > >
> > > On Wed, Oct 02, 2019 at 12:01:59AM +0200, kholk11@gmail.com wrote:
> > > > From: "Angelo G. Del Regno" <kholk11@gmail.com>
> > > >
> > > > Add a function to change the IOMMU pagetable addressing to
> > > > AArch32 LPAE or AArch64. If doing that, then this must be
> > > > done for each IOMMU context (not necessarily at the same time).
> > >
> > > This patch lacks a Signed-off-by.
> > >
> >
> > I'm sorry for that. Should I resend or is it enough for me to write it here?
> >
> > Signed-off-by: AngeloGioacchino Del Regno <kholk11@gmail.com>
>
> Please resend, but you are free to wait for the reviews/acks from Rob
> Clark, which I'd like to see on the series.
>
> Regards,
>
>         Joerg

Okay, no problem. I will wait for the reviews/acks from Rob before
resending in order to limit the amount of emails in everyone's inbox :))

Angelo
