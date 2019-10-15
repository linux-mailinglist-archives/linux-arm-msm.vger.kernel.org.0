Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BF2C2D769F
	for <lists+linux-arm-msm@lfdr.de>; Tue, 15 Oct 2019 14:34:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726144AbfJOMeA (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 15 Oct 2019 08:34:00 -0400
Received: from mail-wm1-f67.google.com ([209.85.128.67]:36639 "EHLO
        mail-wm1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725815AbfJOMeA (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 15 Oct 2019 08:34:00 -0400
Received: by mail-wm1-f67.google.com with SMTP id m18so20109596wmc.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 15 Oct 2019 05:33:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=pta6WG0m1licwTELBUahHWPs5ve4bkpHKrIjLjCTFXo=;
        b=pVPxJXaEKScekgPoPiNAztYkLRcCZHIbAT9TrvXta0ONBRWEGtWWmDyDTvU4IALvw6
         p52Mouf6ymoyAv56OHrE7V9tM+AV30j8jcB+BwQIc29tsM8G5QjyF1wzLxreWY+g2kIc
         zEo2p+9kLl6C6eb2RyRmD5yuA/z2ekFqFwJJpd9siU1dhmGrj+DN0oKxsYzjdBVm422O
         eo+Rt+HV36fr2zGHuTHHchy7uVFaSxNbSMzQFcE2zZt544Gp16hAzbNAFrYBD7lQes1Y
         kceoEPVazIrBythxCusA2aVFbRNfHg/CSzNBY8XdslzAbkSAxzZfnU3XAsn4AYvKGlth
         nlaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=pta6WG0m1licwTELBUahHWPs5ve4bkpHKrIjLjCTFXo=;
        b=BRQIckvM63XxFR/Uv7KrpY4oOjZ8IPUSPl82PuAPlMJAdcQCJZla3ZNz+steEa7wyH
         wKeu+GNoEymkJ9vEYyrcKLrYVX0bJPs7n4etNMX6LbhmLeN1ihckIMzEGtuUTeGoq0jc
         clKZS9cxZuYXI8CO60eO9jhFH80zAV0YolhZh5+jwYBzOpfIN1EPNDeLCvIBl4cfstqc
         3s0mTyjfg1zZV034eFgv+96V3d9BQ3Kn+J5MbeiGWfRNjsLHpw3EDrNPpFStz0UK6UDc
         b0X0l6geXqkrOe1PuuhPV/espkyBu0/NaI2kYSsADSoeBYsmsa10/YdwBdEv+gKzFmBQ
         QVqw==
X-Gm-Message-State: APjAAAWYvGS/XezLCJSd8na1ZDVcLoExJV3WQ/OPKipTLuidiieY+2z5
        6GQGewOKnilsbpRK1xClrp5KfyXg4fUWDXJnsHo=
X-Google-Smtp-Source: APXvYqwfSxDz4F0TO4TR3MMN5xI7DrzuI/j7paSKEi/qey1AGBdwGOds15+WV0NSvEUuUdy9kHQCCY1WBrnecFqjjwo=
X-Received: by 2002:a7b:c4d4:: with SMTP id g20mr17887838wmk.123.1571142838002;
 Tue, 15 Oct 2019 05:33:58 -0700 (PDT)
MIME-Version: 1.0
References: <20191001220205.6423-1-kholk11@gmail.com> <20191001220205.6423-2-kholk11@gmail.com>
 <20191015111454.GG14518@8bytes.org>
In-Reply-To: <20191015111454.GG14518@8bytes.org>
From:   AngeloGioacchino Del Regno <kholk11@gmail.com>
Date:   Tue, 15 Oct 2019 14:33:47 +0200
Message-ID: <CAK7fi1YZXW=mqC5HWtfBWsioAq-duejAk6RgtD8npKZR=af38w@mail.gmail.com>
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

Il giorno mar 15 ott 2019 alle ore 13:14 Joerg Roedel
<joro@8bytes.org> ha scritto:
>
> On Wed, Oct 02, 2019 at 12:01:59AM +0200, kholk11@gmail.com wrote:
> > From: "Angelo G. Del Regno" <kholk11@gmail.com>
> >
> > Add a function to change the IOMMU pagetable addressing to
> > AArch32 LPAE or AArch64. If doing that, then this must be
> > done for each IOMMU context (not necessarily at the same time).
>
> This patch lacks a Signed-off-by.
>

I'm sorry for that. Should I resend or is it enough for me to write it here?

Signed-off-by: AngeloGioacchino Del Regno <kholk11@gmail.com>
