Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 92C4034E29E
	for <lists+linux-arm-msm@lfdr.de>; Tue, 30 Mar 2021 09:56:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231330AbhC3H4G (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 30 Mar 2021 03:56:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44698 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231469AbhC3Hzu (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 30 Mar 2021 03:55:50 -0400
Received: from mail-pj1-x102e.google.com (mail-pj1-x102e.google.com [IPv6:2607:f8b0:4864:20::102e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1BCB8C061764
        for <linux-arm-msm@vger.kernel.org>; Tue, 30 Mar 2021 00:55:50 -0700 (PDT)
Received: by mail-pj1-x102e.google.com with SMTP id cl21-20020a17090af695b02900c61ac0f0e9so892396pjb.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 30 Mar 2021 00:55:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=/c3GASuuPMBQglyP8lkfmM8q4ruB4dYk26XBHy6dn94=;
        b=b/mKdnOi6RfiHabB6Qo0oOdn+udskSQkriHCYcOmDuR0e9x+J+Lkpi95iTeCGeGyZw
         YErIKP3SVb0AoWKzhk1JQN5MYa5aW9Mn3H1T3ioJLInLSjpT8sjHiob9p7ARpCoHi0g9
         EMdqELL+d77fv5s2tm2/l8TGsSvS4kDGTQHYi7EWKscq0oV0zCWt+ERW6YjkU7WzWx4J
         LyigO7vSLWvlarDbXAJUwp4i2ECASIy9ZP+2p90oQ9P8ANwHJKfik1utedQLn5avzzqA
         Hfnddw+F6zWvL1ZYtEtHHqTelSTtNheGDY188dW7I1FiF6wdd/KGuYHxHbJ8lCnt0gn7
         iyRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=/c3GASuuPMBQglyP8lkfmM8q4ruB4dYk26XBHy6dn94=;
        b=eOanj5KTnR4i1ZvYk9Xz6amm1BapZAmhoPYjKJfEj89IFuLw8QLFxnD4Tb0mvBPNql
         EnX1aOrTBl0TBnH0fTUyvyGnMZEQ23vMYxNhJCHVW19jMFHcHHwq5Iv1Y94LICiblRqa
         NSzAqMhgY+Ya/VZj2hrZ6DSpDKovYlLYDBHAd7b2zBB8IR9Ls9xME0lo7grk4WH1khLR
         0mPOr5OUOHmP9KlOp7mkgCPcQ7yPPVU/OMXtLM0GhTUcW54PqzLt+L+jhJ6YpjW4psmb
         HE6slquDriV+ZIXnQz8HTeZ5IlJrN3o5kfoPnccmCAt2+o7QyAsbhDUlbih311RE7lHH
         lL5Q==
X-Gm-Message-State: AOAM5337Y7ZWDNUxTBDM/IjOcvU5AgB6603OwihQxifpfBbDbE2UXLOt
        iitA7vWDsnqSxaO2EP3o8lK/UETR/Xx/iJgvRbAO5g==
X-Google-Smtp-Source: ABdhPJx+5pezFSSeWqNkADQyGDP8qtmVf0mbPcVYSfpv3XD7QsDX/2Vfnxo/gsmtGXbovQoH5Dkg+KL1Gks5TArbAw0=
X-Received: by 2002:a17:902:b088:b029:e6:e1d8:20cc with SMTP id
 p8-20020a170902b088b02900e6e1d820ccmr32129126plr.27.1617090949609; Tue, 30
 Mar 2021 00:55:49 -0700 (PDT)
MIME-Version: 1.0
References: <1617067704-28850-1-git-send-email-bbhatt@codeaurora.org> <1617067704-28850-8-git-send-email-bbhatt@codeaurora.org>
In-Reply-To: <1617067704-28850-8-git-send-email-bbhatt@codeaurora.org>
From:   Loic Poulain <loic.poulain@linaro.org>
Date:   Tue, 30 Mar 2021 10:03:58 +0200
Message-ID: <CAMZdPi9PujJ-ZC22TvOdyyG0g9k6G2z+LRx+drvhQn7GG-Fi0w@mail.gmail.com>
Subject: Re: [PATCH v1 7/7] bus: mhi: core: Improve state strings for debug messages
To:     Bhaumik Bhatt <bbhatt@codeaurora.org>
Cc:     Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        Hemant Kumar <hemantk@codeaurora.org>,
        Jeffrey Hugo <jhugo@codeaurora.org>,
        open list <linux-kernel@vger.kernel.org>,
        =?UTF-8?B?Q2FybCBZaW4o5q635byg5oiQKQ==?= <carl.yin@quectel.com>,
        Naveen Kumar <naveen.kumar@quectel.com>,
        abickett@codeaurora.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue, 30 Mar 2021 at 03:28, Bhaumik Bhatt <bbhatt@codeaurora.org> wrote:
>
> As of now abbreviations are being used for many state and
> execution environment strings. Improve and expand those such that
> debug messages are clear.
>
> Signed-off-by: Bhaumik Bhatt <bbhatt@codeaurora.org>
> Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>

Reviewed-by: Loic Poulain <loic.poulain@linaro.org>
