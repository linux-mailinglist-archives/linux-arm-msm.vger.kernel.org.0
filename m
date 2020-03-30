Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 40F80198353
	for <lists+linux-arm-msm@lfdr.de>; Mon, 30 Mar 2020 20:24:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727745AbgC3SYs (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 30 Mar 2020 14:24:48 -0400
Received: from mail-vs1-f53.google.com ([209.85.217.53]:34645 "EHLO
        mail-vs1-f53.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727714AbgC3SYq (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 30 Mar 2020 14:24:46 -0400
Received: by mail-vs1-f53.google.com with SMTP id b5so11774437vsb.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 30 Mar 2020 11:24:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=NBiWhVp0IqfyFDNmwRRGA/s+Dtxuu8Q2mjZHUKcx0uk=;
        b=mlJLtlVPXBg1gWOsSAxsoafEcJT38NiNpF0UOqjmzXlo8GohAqgw297ZK1Swt56Bly
         V3nGgPyqvQPMeDtng5baT7oly6ktnoBEa56u9lCaFRUnAvGmc515iPKUrcWy2Hs+fCMI
         IFS1C4dlShgMqMwCUu2tNPruIHdi1VqoM0tac=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=NBiWhVp0IqfyFDNmwRRGA/s+Dtxuu8Q2mjZHUKcx0uk=;
        b=Quv/CjJKHWJof51vMjF0YsS5gFlEZQw1mpkDsjvQ8S4bqIrEkhdLz3fWnxB3RJJYm6
         MYGsMBkdjxw5gF4fwnAQv8BsusrC7s7E/cxKUoLAmQRNI6OQLxGS3QAsWn5xf3FclPjq
         UrDvNOeS5Qz9YrCSE4mYKfKyDTkJo+dwlS3mPotUsiov9Sevnw5ShG/P9ISZWg4Ob2pO
         uQQ8xo6cPEiFE8jIm3SQiEPoANUNLTabV7vmRzjP9j2kpDEHwbyDajnlYM24oRSt55Bz
         i06q+vOt7K2VXJ2aRk+JefEfsWntK9mJR7sIXBm8A6F4QGzM2Yrbgn3GuH4wM14S6HmI
         en5w==
X-Gm-Message-State: AGi0Puaq1AsHyoJo97Hf2P6CR6Km+UsAwbY+64XyX0bQwoTEbJu8QnKa
        o3hZwN/hqo7IhNsu1+z2GVGimr5uY9w=
X-Google-Smtp-Source: APiQypKmIuhE+fPEsbua2Gp5A7QbJwpfv40syWMeRj6AuZ0Il0B60E/Ii+7BYVWgoYWy99nEyigoSQ==
X-Received: by 2002:a67:6e85:: with SMTP id j127mr9839440vsc.55.1585592683309;
        Mon, 30 Mar 2020 11:24:43 -0700 (PDT)
Received: from mail-vk1-f177.google.com (mail-vk1-f177.google.com. [209.85.221.177])
        by smtp.gmail.com with ESMTPSA id j206sm5824882vke.22.2020.03.30.11.24.42
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 30 Mar 2020 11:24:42 -0700 (PDT)
Received: by mail-vk1-f177.google.com with SMTP id o124so4974608vkc.4
        for <linux-arm-msm@vger.kernel.org>; Mon, 30 Mar 2020 11:24:42 -0700 (PDT)
X-Received: by 2002:a1f:a9d2:: with SMTP id s201mr8815125vke.92.1585592681966;
 Mon, 30 Mar 2020 11:24:41 -0700 (PDT)
MIME-Version: 1.0
References: <20200327132852.10352-1-saiprakash.ranjan@codeaurora.org>
 <0023bc68-45fb-4e80-00c8-01fd0369243f@arm.com> <37db9a4d524aa4d7529ae47a8065c9e0@codeaurora.org>
 <5858bdac-b7f9-ac26-0c0d-c9653cef841d@arm.com> <d60196b548e1241b8334fadd0e8c2fb5@codeaurora.org>
In-Reply-To: <d60196b548e1241b8334fadd0e8c2fb5@codeaurora.org>
From:   Doug Anderson <dianders@chromium.org>
Date:   Mon, 30 Mar 2020 11:24:30 -0700
X-Gmail-Original-Message-ID: <CAD=FV=WXTN6xxqtL6d6MHxG8Epuo6FSQERRPfnoSCskhjh1KeQ@mail.gmail.com>
Message-ID: <CAD=FV=WXTN6xxqtL6d6MHxG8Epuo6FSQERRPfnoSCskhjh1KeQ@mail.gmail.com>
Subject: Re: [PATCH] iommu/arm-smmu: Demote error messages to debug in
 shutdown callback
To:     Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
Cc:     Robin Murphy <robin.murphy@arm.com>, Will Deacon <will@kernel.org>,
        Joerg Roedel <joro@8bytes.org>,
        "list@263.net:IOMMU DRIVERS <iommu@lists.linux-foundation.org>, Joerg
        Roedel <joro@8bytes.org>," <iommu@lists.linux-foundation.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi,

On Sat, Mar 28, 2020 at 12:35 AM Sai Prakash Ranjan
<saiprakash.ranjan@codeaurora.org> wrote:
>
> > Of course the fact that in practice we'll *always* see the warning
> > because there's no way to tear down the default DMA domains, and even
> > if all devices *have* been nicely quiesced there's no way to tell, is
> > certainly less than ideal. Like I say, it's not entirely clear-cut
> > either way...
> >
>
> Thanks for these examples, good to know these scenarios in case we come
> across these.
> However, if we see these error/warning messages appear everytime then
> what will be
> the credibility of these messages? We will just ignore these messages
> when
> these issues you mention actually appears because we see them everytime
> on
> reboot or shutdown.

I would agree that if these messages are expected to be seen every
time, there's no way to fix them, and they're not indicative of any
problem then something should be done.  Seeing something printed at
"dev_error" level with an exclamation point (!) at the end makes me
feel like this is something that needs immediate action on my part.

If we really can't do better but feel that the messages need to be
there, at least make them dev_info and less scary like:

  arm-smmu 15000000.iommu: turning off; DMA should be quiesced before now

...that would still give you a hint in the logs that if you saw a DMA
transaction after the message that it was a bug but also wouldn't
sound scary to someone who wasn't seeing any other problems.

-Doug
