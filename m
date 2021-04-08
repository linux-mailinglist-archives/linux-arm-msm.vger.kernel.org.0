Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AD9ED358E05
	for <lists+linux-arm-msm@lfdr.de>; Thu,  8 Apr 2021 22:06:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232014AbhDHUGN (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 8 Apr 2021 16:06:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41638 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231451AbhDHUGM (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 8 Apr 2021 16:06:12 -0400
Received: from mail-ot1-x332.google.com (mail-ot1-x332.google.com [IPv6:2607:f8b0:4864:20::332])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 41F07C061761
        for <linux-arm-msm@vger.kernel.org>; Thu,  8 Apr 2021 13:06:01 -0700 (PDT)
Received: by mail-ot1-x332.google.com with SMTP id 91-20020a9d08640000b0290237d9c40382so3492480oty.12
        for <linux-arm-msm@vger.kernel.org>; Thu, 08 Apr 2021 13:06:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=aleksander-es.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=tMNaMbTulZVWFzBX43p/fXwF2BC09PvT07FCozD76VU=;
        b=wTQsR+4POzo16nXanctMMf2DY1pekJQorxnW8aa+rOq7fwPpmiyovyCeKhrHO0vpX/
         7DQdwXurJvdQj+IkuBbgJAbDaLZV/QKWsUWQLYRsShywUzf1cY0J7fqpXZL0lmoJzRAG
         tbW5zQC/IzJzksdHFL7gl5QH+uB4UrDJGlFfH9z3PrCQJb0hfA//fONntwDGLDc0NDME
         +KGGwqrXbKmD0LFcYRYXWe/AwPsCTGSRRLTLQLwM/w8gfkMwZPOSp0MYxcDObVc7nPUu
         ZazRA3CZOPqVHZOsfZH6IEC24WNXoOk60V7nBxRc1BJ6j2aKmAcbDBN4615xdM/jetri
         c8Ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=tMNaMbTulZVWFzBX43p/fXwF2BC09PvT07FCozD76VU=;
        b=PDtjSN8/Q45A/U1f9ase9iZ8oXAWGcC3T9zhWg06+30D5zQaYNTjKIFlzPdmGQX5Sl
         UwAans0uCuj14bsAPS1ivV1zP4ymgQEZj+cIjENbmeUcydDfDtKslhkRPEJ+FkBJ8Wq3
         G7hsRSN43ot3ssLQPicT+noistssfo/euEKgBVg49hIDPiJ0Hhb0Myza7NksOJ3aToQ3
         FdP8Ub/agVQaZjE84sHxlE7qhczhUZ8qVOIb2Ofi8CDPdZzJ7nTS1pkNBKxEyxIuyg6c
         9TbbUSa4mjXeV8OqdzLDrdAlpAfVub+mlZZ+GXE3U0yL/sQBxxdwGFh2+BR9W1kXOJnt
         vrDg==
X-Gm-Message-State: AOAM530G8ftZq8sSLGuhCUmnXVYywq/OSiF+8Nvaw8Lo9kbG5VZcYqNa
        /eMct/XvJkxd/fev5v8uJs3a9juPkgwhdhpuBpcv2Q==
X-Google-Smtp-Source: ABdhPJyRKoCsX4sQ1CWsl/fOPRNr5iqIQ90bMlXwepNyYKYjPrwT0TgnjRxObEps047wJcjvKBb30Zd/x9HMMK+beJM=
X-Received: by 2002:a05:6830:210e:: with SMTP id i14mr9235389otc.229.1617912360590;
 Thu, 08 Apr 2021 13:06:00 -0700 (PDT)
MIME-Version: 1.0
References: <1617616369-27305-1-git-send-email-loic.poulain@linaro.org>
 <ddc8cd0fd3212ccbba399b03a059bcf40abbc117.camel@redhat.com> <CAMZdPi_6hCYpiyf4=x1FdA2KHnVg6LFWnfEhCd8PMQP_yFXqCw@mail.gmail.com>
In-Reply-To: <CAMZdPi_6hCYpiyf4=x1FdA2KHnVg6LFWnfEhCd8PMQP_yFXqCw@mail.gmail.com>
From:   Aleksander Morgado <aleksander@aleksander.es>
Date:   Thu, 8 Apr 2021 22:05:49 +0200
Message-ID: <CAAP7ucL8Gc_w=BxFFY50XStJWghmdTWo2W2fdzdJjD3cfuWRRg@mail.gmail.com>
Subject: Re: [PATCH net-next v9 1/2] net: Add a WWAN subsystem
To:     Loic Poulain <loic.poulain@linaro.org>
Cc:     Dan Williams <dcbw@redhat.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jakub Kicinski <kuba@kernel.org>,
        David Miller <davem@davemloft.net>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        open list <linux-kernel@vger.kernel.org>,
        Network Development <netdev@vger.kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hey,

>
> * Note: Userspace tools like ModemManager are able to link control
> ports and netdev by looking at the sysfs hierarchy, it's fine for
> simple connection management, but probably not enough for 'multi PDN'
> support for which devices may have multiple netdev and ports
> targetting different 'PDN contexts'...
>

ModemManager is happy with those devices exposing multiple netdevs
(even connecting different net ports to different contexts/bearers and
such), as long as we can bind all those ports together to the same
"modem device". The sysfs hierarchy has been enough for now for that
purpose; or better said, without the sysfs hierarchy it would not have
worked properly. E.g. there are some drivers out there allowing to
instantiate virtual net ports from a master net port; without proper
links in sysfs to link those virtual net ports to the master net port,
the setup would be extremely unstable.

-- 
Aleksander
https://aleksander.es
