Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F0AB13F0F0D
	for <lists+linux-arm-msm@lfdr.de>; Thu, 19 Aug 2021 02:09:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233866AbhHSAKW (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 18 Aug 2021 20:10:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43536 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234119AbhHSAKV (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 18 Aug 2021 20:10:21 -0400
Received: from mail-pg1-x531.google.com (mail-pg1-x531.google.com [IPv6:2607:f8b0:4864:20::531])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 46977C0613CF
        for <linux-arm-msm@vger.kernel.org>; Wed, 18 Aug 2021 17:09:46 -0700 (PDT)
Received: by mail-pg1-x531.google.com with SMTP id s11so4114651pgr.11
        for <linux-arm-msm@vger.kernel.org>; Wed, 18 Aug 2021 17:09:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=fEapmFlBKIuSpoPu4AyxSHs+c5eRGpigOktGw17Waoc=;
        b=RymtZDJzEG5vx1du3BYZlbKOwsHfxlhsmAW5/gxLcPrWYezAkX6atoyRb9N8Y/1V+S
         mVPlJytPA/Ap+BOLltZGwE6n+41KOFT8mVB6GgGClW7alh/gUBLat7aSJRwZ9yyoPo1Q
         AVqoZbTXZYbJy4uXyI25ybPOpZOUsLcWXlZVM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=fEapmFlBKIuSpoPu4AyxSHs+c5eRGpigOktGw17Waoc=;
        b=bMyk+gUzrOVABiTp+dZfPTIOJDcyVtzjcwSoSA6CYbJ+lAf1gAsl2S5AdK77j5BKuO
         sjFeoxcfuwC68iSMteou42MfQp65b6cg8lL8TpgpSemuRi2OuxnpwOq7E3NPErcHcQIU
         Mlf0tZUUd0MY6Y/ZdFxGpkkGHJYS4ulgookCGE1LwsmYtFDU4q3DH+p84udeg0crRpwb
         fPhv5RX3H6ZJ41YOT1y37AFYC5/nCgkJjEtNG5Jfije4+0bHU1IjrauiseN/oC6Sa8ZX
         QuIhWQmHTnohEpcPG1vQnwHBaJ7kME8fMJZ9tO6GzeKBFkqV1+1nMg1E+rV7KvTVRVQ0
         DIzg==
X-Gm-Message-State: AOAM532t45gcfb57n/AQ9DFe51p0otsMsHCSWRIJdnwY5d36+B+nvbJ1
        qyk5Dd/CJOcIOoM7tUkCyiWLRm1kLRjrSQ==
X-Google-Smtp-Source: ABdhPJyLsWTjkUT0KBiXdx6nZczfANK2GG0VdKXJbwFiPeRQGxg3w8CI2UyI1d0MvR/XcEb+bNDyOA==
X-Received: by 2002:a65:6459:: with SMTP id s25mr11405917pgv.7.1629331785510;
        Wed, 18 Aug 2021 17:09:45 -0700 (PDT)
Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com. [209.85.210.178])
        by smtp.gmail.com with ESMTPSA id n22sm937667pff.57.2021.08.18.17.09.45
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 18 Aug 2021 17:09:45 -0700 (PDT)
Received: by mail-pf1-f178.google.com with SMTP id t42so1256053pfg.12
        for <linux-arm-msm@vger.kernel.org>; Wed, 18 Aug 2021 17:09:45 -0700 (PDT)
X-Received: by 2002:a5d:9eda:: with SMTP id a26mr9282243ioe.166.1629331471737;
 Wed, 18 Aug 2021 17:04:31 -0700 (PDT)
MIME-Version: 1.0
References: <1628754078-29779-1-git-send-email-rajpat@codeaurora.org> <1628754078-29779-4-git-send-email-rajpat@codeaurora.org>
In-Reply-To: <1628754078-29779-4-git-send-email-rajpat@codeaurora.org>
From:   Doug Anderson <dianders@chromium.org>
Date:   Wed, 18 Aug 2021 17:04:18 -0700
X-Gmail-Original-Message-ID: <CAD=FV=Vb2_K7QDvdMkjPLYqbVNQMa9e=3_PqREAHYMMVX-9QVQ@mail.gmail.com>
Message-ID: <CAD=FV=Vb2_K7QDvdMkjPLYqbVNQMa9e=3_PqREAHYMMVX-9QVQ@mail.gmail.com>
Subject: Re: [PATCH V5 3/7] arm64: dts: sc7280: Add QUPv3 wrapper_0 nodes
To:     Rajesh Patil <rajpat@codeaurora.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Stephen Boyd <swboyd@chromium.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Rajendra Nayak <rnayak@codeaurora.org>,
        Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>,
        msavaliy@qti.qualcomm.com, satya priya <skakit@codeaurora.org>,
        Roja Rani Yarubandi <rojay@codeaurora.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi,

On Thu, Aug 12, 2021 at 12:42 AM Rajesh Patil <rajpat@codeaurora.org> wrote:
>
> @@ -542,8 +561,305 @@
>                         #address-cells = <2>;
>                         #size-cells = <2>;
>                         ranges;
> +                       iommus = <&apps_smmu 0x123 0x0>;
>                         status = "disabled";
>
> +                       i2c0: i2c@980000 {

Not a full review of your patch (I think Matthias has already looked
in a bunch of detail), but can I also request that you add i2c and spi
aliases in your next spin (I think you have to spin this anyway,
right?) Add these under the "aliases" mode before the mmc ones (to
keep sort order good):

i2c0 = &i2c0;
i2c1 = &i2c1;
i2c2 = &i2c2;
i2c3 = &i2c3;
i2c4 = &i2c4;
i2c5 = &i2c5;
i2c6 = &i2c6;
i2c7 = &i2c7;
i2c8 = &i2c8;
i2c9 = &i2c9;
i2c10 = &i2c10;
i2c11 = &i2c11;
i2c12 = &i2c12;
i2c13 = &i2c13;
i2c14 = &i2c14;
i2c15 = &i2c15;

...and these after:

spi0 = &spi0;
spi1 = &spi1;
spi2 = &spi2;
spi3 = &spi3;
spi4 = &spi4;
spi5 = &spi5;
spi6 = &spi6;
spi7 = &spi7;
spi8 = &spi8;
spi9 = &spi9;
spi10 = &spi10;
spi11 = &spi11;
spi12 = &spi12;
spi13 = &spi13;
spi14 = &spi14;
spi15 = &spi15;

The "Quad SPI" doesn't get an alias, but that's OK. It doesn't have a
well-defined number in the manual and it's fine to have it be
auto-assigned. It's really just confusing when there's something with
a well-defined number in the manual and it's a _different_ one in the
logs. ;-)

-Doug
