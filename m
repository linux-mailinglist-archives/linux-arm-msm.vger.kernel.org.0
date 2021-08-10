Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A662F3E7EEA
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Aug 2021 19:36:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231129AbhHJRgE (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 10 Aug 2021 13:36:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50554 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233279AbhHJRfI (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 10 Aug 2021 13:35:08 -0400
Received: from mail-lj1-x243.google.com (mail-lj1-x243.google.com [IPv6:2a00:1450:4864:20::243])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E61C2C0619CE
        for <linux-arm-msm@vger.kernel.org>; Tue, 10 Aug 2021 10:33:23 -0700 (PDT)
Received: by mail-lj1-x243.google.com with SMTP id h9so30316471ljq.8
        for <linux-arm-msm@vger.kernel.org>; Tue, 10 Aug 2021 10:33:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:reply-to:from:date:message-id:subject:to;
        bh=y3BZ+wT7TMDVjM2/WQcyPOhYkG/NWjvDbJIsMqFI2RA=;
        b=RsiBBdA9QKOcTCF5lGXKVsjmClQ3sMV8nYRHi5UzQ6RFRdaZ6t981j56diJ7q3WLiT
         dSrogDmRt6kwHS+J+pcIdphvlu5Vk62bOJudqb0dzEOf5Tr6sAVMWTY2NbEn++ZnSdaf
         F4yj6h4F7VBk6uVCXN4p2StSiBpSckLhr0NJoCtUTvVh+gCrpSdvA2dss+nT8Q4XWg+b
         4x9fMuBGMminOSzPCK8njOsWexpWsfb2omBFXa3GLhHqzUauC1r8oyB3fDvFuiS7qNjT
         fDqijYMWxjmP3EeBvtWaIUY7Z5YEma/9OhqmI5Ya7ZKqW/5hzlkm8xAdNsqyzESz/5Xj
         5sZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:reply-to:from:date:message-id
         :subject:to;
        bh=y3BZ+wT7TMDVjM2/WQcyPOhYkG/NWjvDbJIsMqFI2RA=;
        b=ivTqqKlYGA4K+m7BqU1ziHaomJMwHz31Y/AAh6k9GE17pPSI7LsCIxBiZPv4nKAuMq
         ZugMi3fWUwReu1rtjxuUNhvBZMZIet2AZXE4TGu64umSXaIsYrnbse+cROemgDqYaoPE
         9kf5YT4KGc20QrX2qCjkpgbvt0Y/9VkISPqognemu1tJTbbUcSQzLhvdo68yp6h3QIBt
         c/l1MESCi4/w17sg7OWqU3r2fG97GrBWgwYh7hWzWjLt+Mba5LJsbKgx3O6WO3Jrb6lf
         P4hl6Lh3Wc5MEby21DpuH2jSCpQytUXM6FMq4Ae4drtQWz/xW7I+bQBtbGQe6U02V8S5
         s44Q==
X-Gm-Message-State: AOAM533P3mlffJaxQRGU19zfH84TW7kgIF4riTGYe1+LJFTI12SLsY90
        3PxWaaVdYKBArrMIdJ7lBa7KZb2eI9x3BNJUKuLFUL1UsN0=
X-Google-Smtp-Source: ABdhPJw+sC+pBQw0G+0ULVvin/r/jCVVb1V7XUqN67UCoWrnBzyIXnaSzK5br1SZrCupI/L0LIZWgMfi7vhpZK+Wcm0=
X-Received: by 2002:a05:651c:32c:: with SMTP id b12mr1745558ljp.198.1628616792032;
 Tue, 10 Aug 2021 10:33:12 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:ac2:5d2e:0:0:0:0:0 with HTTP; Tue, 10 Aug 2021 10:33:10
 -0700 (PDT)
Reply-To: majidmuzaffar8@gmail.com
From:   Majid Muzaffar <ing.abdullabin.rishid.me@gmail.com>
Date:   Tue, 10 Aug 2021 20:33:10 +0300
Message-ID: <CAFsu49XXzY7ugKhGzJm5OPKe2LG1R35c-Dkp83VgS3+u27y=sQ@mail.gmail.com>
Subject: Proposal
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Salam alaikum,

I am the investment officer of UAE based investment company who are
ready to fund projects outside UAE, in the form of debt finance. We
grant loan to both Corporate and private entities at a low interest
rate of 3% ROI per annum. The terms are very flexible and interesting.
Kindly revert back if you have projects that needs funding for further
discussion and negotiation.

Thanks

investment officer
