Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1FC932F4AF7
	for <lists+linux-arm-msm@lfdr.de>; Wed, 13 Jan 2021 13:08:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726742AbhAMMGL (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 13 Jan 2021 07:06:11 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34368 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726509AbhAMMGL (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 13 Jan 2021 07:06:11 -0500
Received: from mail-ej1-x632.google.com (mail-ej1-x632.google.com [IPv6:2a00:1450:4864:20::632])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3E3F4C061575;
        Wed, 13 Jan 2021 04:05:31 -0800 (PST)
Received: by mail-ej1-x632.google.com with SMTP id jx16so2667183ejb.10;
        Wed, 13 Jan 2021 04:05:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=KLddFM7Ct0ZzIGnlm6iZDFsPVXgrYGbAJWbAjweQIpc=;
        b=uEnlxlSjkPZ3m4eJPwM8x6E1SemvIcHCEXpbFKzAeeaivi4SwJUXJyERWClsV+Q03R
         JW5in+6gXdM9UvjzWnOeGWZ3+MqLlTEfoteyIwY/ImvV3ZoEqgeOpyORjuirsoOylVT6
         Nsn+NH3mbWj/Mesma2QaiWwaa9qIm1RLxmwCGxtOlCa4tBhdeUWfQ9jtpNU8ZrJD0NG8
         zH62MvmbwC+ZY+GlHf2S6qT2iY8ujBRDy+FLGONlr5V2dj+8dXnXTya3xZByQ049Qrjz
         7MQHeUcdb4y5C7DKcbFd/Wf6lTAK6Ro1mE6CR5ZhDQvh3AFfATy5qbGZxNbMKfgvOnvz
         h2oQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=KLddFM7Ct0ZzIGnlm6iZDFsPVXgrYGbAJWbAjweQIpc=;
        b=DhUIQRpvEwMOmADMtSv1fULnePHsLY+CDWibVVZMKzC9p000gL3YmN1nzCL/Jg/Or7
         gV6cnFCoDCqzBeU01dzfAY8l61fTs5TQ3CiOak/qtKyPHokaiN3yZe4Iy5WCVpm+WYOk
         Gpw+/rGaRPOJ4o2s5+ikM20MPzQ3InRty0ZU/AwJaC39CBndQQfvrG3WvdDeE3biUO+0
         BfWuKVi/bJ2gMxnAPRg6QnORV+hPDwLsY0U9rVNUscbZrJNSqTcdBCwIZEgxQx0YFVDo
         41LnaEDQ1l/0yWNabwBBAzwuoqSJ1XMMCT+29VMn412skwJEMc/7FEZh9uxnREdiyO2L
         S6AQ==
X-Gm-Message-State: AOAM533fJZFoQZTu7EniAR/TXIfYm5j1A2IJv2djrtwytBINptMhulAU
        T3Lxn1M6UXQVaAuZ8HtYPJrLeN/fnK0Q2bqrbcM=
X-Google-Smtp-Source: ABdhPJyxDzdRBgA9m006VOsEmMuVwU+jGuo6QNzvtRQNY+GRXcD9plNi7OTnRbAHVDabgzpXjZL9IpoxAHgrXoFwCwQ=
X-Received: by 2002:a17:906:4c55:: with SMTP id d21mr1356389ejw.116.1610539529892;
 Wed, 13 Jan 2021 04:05:29 -0800 (PST)
MIME-Version: 1.0
References: <CAOuPNLiUBhJdsgw9bjQxxhkeBHQFoE_vN_Na6kw3ksr89r+HOg@mail.gmail.com>
 <X/2Rr5LDNbxGz456@kroah.com>
In-Reply-To: <X/2Rr5LDNbxGz456@kroah.com>
From:   Pintu Agarwal <pintu.ping@gmail.com>
Date:   Wed, 13 Jan 2021 17:35:18 +0530
Message-ID: <CAOuPNLiVP2d29td0b20Tx7=UBy5fGk5S9Yt=usUH+VtSYORe+w@mail.gmail.com>
Subject: Re: [BUG]: Kernel 4.9: Kernel crash at fs/sysfs/file.c : sysfs_kf_seq_show
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     open list <linux-kernel@vger.kernel.org>,
        "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" 
        <linux-arm-kernel@lists.infradead.org>, landy.gross@linaro.org,
        David Brown <david.brown@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-soc@vger.kernel.org,
        indranilghsh428@gmail.com, stephen@networkplumber.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue, 12 Jan 2021 at 17:39, Greg Kroah-Hartman
<gregkh@linuxfoundation.org> wrote:
>
> On Tue, Jan 12, 2021 at 05:31:54PM +0530, Pintu Agarwal wrote:
> > Hi,
> >
> > I am using Kernel: 4.9.217 for one of the ARM32 boards for Qualcomm SOC.
> > https://github.com/android-linux-stable/msm-4.9
> >
> > But I think this is a general bug applicable to :Kernel 4.9 under
> > fs/sysfs/file.c
> > So, I wanted to quickly check here if others are familiar with this
> > issue and if it is fixed already.
> > Note, this issue does not occur in 4.14 Kernel.
> >
> > When I execute below command, the Kernel is crashing.
> > I tried to add few debug prints to find more details. I see that the
> > ops->show pointer is not valid (seems corrupted).
> > So I wanted to understand how this can happen only for this particular node.
> > Other sysfs entries are working fine.
> >

I see that this issue was reported earlier as well by others.
https://syzkaller.appspot.com/bug?id=2ec2a9da5c711df3d3d12071bac487b96e75e103
https://gitlab.freedesktop.org/drm/amd/-/issues/413
https://bugzilla.redhat.com/show_bug.cgi?id=1615070

So it seems to be common issue and thus I wanted to check here if its similar.

Thanks,
Pintu
