Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 68F4248E08D
	for <lists+linux-arm-msm@lfdr.de>; Thu, 13 Jan 2022 23:44:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235332AbiAMWoF (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 13 Jan 2022 17:44:05 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35582 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235318AbiAMWoF (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 13 Jan 2022 17:44:05 -0500
Received: from mail-pj1-x1043.google.com (mail-pj1-x1043.google.com [IPv6:2607:f8b0:4864:20::1043])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 233BBC06161C
        for <linux-arm-msm@vger.kernel.org>; Thu, 13 Jan 2022 14:44:05 -0800 (PST)
Received: by mail-pj1-x1043.google.com with SMTP id 59-20020a17090a09c100b001b34a13745eso20198413pjo.5
        for <linux-arm-msm@vger.kernel.org>; Thu, 13 Jan 2022 14:44:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:reply-to:from:date:message-id:subject:to;
        bh=YbEI3Q/NEjCtDTVCV1jkA7nYNYBH/Wfa2wk3IkVyJko=;
        b=FC7JMxhOdovrsQ7Lcs1duX9HHtY1Bp2XpIriujdEd5sWYWwEmU+IzCbJMpgsF4HvH6
         vGkfssSya+9lS8Se4/Pocs3eWVM59UHe3uEhSno2nkcnc/Diz3y8FsDdwQWaKfCaMo8L
         XqXNMRr9s1yMuYEl+MhYgxHB1G5Jx+LMjawuDRSZ+5wKvm1otCCb5ABOWAUiVZgI39os
         XvZKdH0Cyk7xUJSRusJTFhe80eRvF2QnrZ69eCtn1yN6CGGbRHhItwqkSezmtX1ygK1u
         /rw+rlQfzCqlRlC0Ey8crwDRaJsQgt7YINzmIIsZEin7/RIDzern1c1eXXZsWYXlZXFU
         udoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:reply-to:from:date:message-id
         :subject:to;
        bh=YbEI3Q/NEjCtDTVCV1jkA7nYNYBH/Wfa2wk3IkVyJko=;
        b=x7Bj8GKnLW0EM2ltz7QGd/XVtiScVTLCDGPIcgPf0dOBx0vhihuQIR4H6ZY5/XpYAT
         n+Bmq24rcIVQECHUiKLT/jZGWJii8bfjmtlTjmMHwSWdAEVrCiHd8uuCDKzeTaB/pMZN
         cdR95ctIssyluCBpddt+QVXahoKIgMqI3J8vqYjN6Nh4C8DStyyQJU63yMPzFBEdhSrc
         b31hUOvR+LuSs2Aww+kcU/u5ybfePbCUK+u/oF9f3T9usPVvm8+eRanTcZKMgHaYvOIg
         IbwyefacqUIQ7MnDyboQ/tGL9xMKzqfMLBQ/nnag2M7pBby32oiRZ4rSbIwb6G/eWRM1
         CWnA==
X-Gm-Message-State: AOAM532PArTOBFdtzHiKGXiZLY6QlXnjnWtNPdKSbQgeejjoYwWsm3iJ
        ClMaZL5x7xXBVQhc2GzVCPFpc0afb1glDsCnF+U=
X-Google-Smtp-Source: ABdhPJyYN9RvjDnI4OUpO8da/PcyxtA4YM1mgnER7WwL51fKqsuEaPHkbUZ+5D3xmmGwp04zCJx79o5KHgXj+r48uiA=
X-Received: by 2002:a17:90a:e454:: with SMTP id jp20mr17096537pjb.53.1642113844606;
 Thu, 13 Jan 2022 14:44:04 -0800 (PST)
MIME-Version: 1.0
Received: by 2002:a05:6a10:f38c:0:0:0:0 with HTTP; Thu, 13 Jan 2022 14:44:03
 -0800 (PST)
Reply-To: mchristophdaniel@gmail.com
From:   Marcus Galois <marcus.galois@gmail.com>
Date:   Thu, 13 Jan 2022 23:44:03 +0100
Message-ID: <CANqBaXV1_cSPgXpodC7uBysM_RJ0=f1MamuSyCvydEBYjJ2HAA@mail.gmail.com>
Subject: Good News Finally.
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hello friend.

You might find it so difficult to remember me, though it is indeed a
very long time, I am much delighted to contact you again after a long
period of time, I remember you despite circumstances that made things
not worked out as we projected then. I want to inform you that the
transaction we're doing together then finally worked out and I decided
to contact you and to let you know because of your tremendous effort
to make things work out then.

Meanwhile I must inform you that I'm presently in Caribbean Island for
numerous business negotiation with some partners. with my sincere
heart i have decided to compensate you with USD$900,000 for your
dedication then on our transaction, you tried so much that period and
I appreciated your effort. I wrote a cheque/check on your name, as
soon as you receive it, you let me know.

Contact my secretary now on his email: mchristophdaniel@gmail.com
Name: Mr. Christoph Daniel

You are to forward to him your Name........ Address.......,Phone
number......for shipment/dispatch of the cheque/Check to you

Regards,
Mr. Marcus Galois
