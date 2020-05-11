Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D2D881CE6C6
	for <lists+linux-arm-msm@lfdr.de>; Mon, 11 May 2020 23:05:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732208AbgEKVDi (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 11 May 2020 17:03:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44736 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1732203AbgEKVDh (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 11 May 2020 17:03:37 -0400
Received: from mail-ed1-x544.google.com (mail-ed1-x544.google.com [IPv6:2a00:1450:4864:20::544])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2CD43C061A0C;
        Mon, 11 May 2020 14:03:37 -0700 (PDT)
Received: by mail-ed1-x544.google.com with SMTP id f12so9226366edn.12;
        Mon, 11 May 2020 14:03:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=7kphY5Feu5GjDCyOhiwD3l7TIWgkPBf49fwmfgZutZM=;
        b=pi2B1oEEkaOLcGDjYguTzZ1wVBUAaddjGKvbTSIB33jMGte38wfkA0RWPar7kH5D16
         TuvXrhWYBBST5nztNM/k6ZK3rdZbNpHdgQN6WkuJp1Je5EUenMjPMKteynJV6Sc4qI+a
         AAUzW8Dj9Xxd8T4ggFrXmvSjakXJm0oNtXKoKgh5ZimIvOx3y3gj5Z/lQa2FR30djnBj
         kmCN9Hvtb0cIpyBQMdqoBKyQ4yCOi600/WwUG278KA6r5ih2jpYF9CyU5f6CYRDa2y3g
         HYmUOqPlGVf9JTE7N5BzTFM1WGzL0Bqxhiw6kE0sFMZmbh32/muIFoexknNSy7J6/lGj
         bmEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=7kphY5Feu5GjDCyOhiwD3l7TIWgkPBf49fwmfgZutZM=;
        b=FOqUENhESjvv+c2VlZnA61UDtdMTxRS7uATuIBpFLiz0ihaVc1e52kTEgl2J099aYr
         czQ2TuNzyD2cri0ikwmznmd1ksSCCoyj79OfTbb22Jm/GMfPJ27vZVB1at4TjMSoMoc3
         u1D6tW8i0GCkoJt2Yf8YFNALLVl5cXpHzjVnuJhqJAkotsD2nII9A8Pw+WDcFiSAXnst
         PuWCJeZOQVabeJRUrIaSJSGTPkiwUT0lw7YzamInpYlWjcsWSdEYsKWTWqbWOEmzxpo3
         85QbfH1MzIpO4UKJ5U8fCGtD1tfO6nbQM6OOHdbYcYjFxdznQUjAajkAODnjfMy5v8WN
         OWFg==
X-Gm-Message-State: AGi0PuYFE9u6yufdBRje77ZCB4+8jVy8HXsrRafsfBDFE9pKgmWdVUGQ
        l3BKPaU7Pi4R25FgwI1h98ixpLMLGW2KgfcnZas=
X-Google-Smtp-Source: APiQypLxSSuCw1Ty0QrHn8r+5pFK0ZY0obh40lVL+pboWUJzbPHEHgusS2MaIPc+AXlLln+Srs+52jPCEAvCaqzoFUQ=
X-Received: by 2002:aa7:dcc3:: with SMTP id w3mr14329504edu.231.1589231015906;
 Mon, 11 May 2020 14:03:35 -0700 (PDT)
MIME-Version: 1.0
References: <20200501205201.149804-1-konradybcio@gmail.com> <CAOCk7NqbOsQ2Bz1K8Gkeh75pLHDaUn6MhE1T7NkMYEHOPoL0NQ@mail.gmail.com>
In-Reply-To: <CAOCk7NqbOsQ2Bz1K8Gkeh75pLHDaUn6MhE1T7NkMYEHOPoL0NQ@mail.gmail.com>
From:   Konrad Dybcio <konradybcio@gmail.com>
Date:   Mon, 11 May 2020 23:03:00 +0200
Message-ID: <CAMS8qEWNuuo5t+D1Xq_aNbh5-GSvVSMJM6BpKX4SR=-2eBegpQ@mail.gmail.com>
Subject: Re: [PATCH] drivers: gpu: drm: Add MDP5 configuration for MSM8x36 and
 its derivatives, such as MSM8939.
To:     Jeffrey Hugo <jeffrey.l.hugo@gmail.com>
Cc:     skrzynka@konradybcio.pl, Rob Clark <robdclark@gmail.com>,
        Sean Paul <sean@poorly.run>, David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Allison Randal <allison@lohutok.net>,
        Alexios Zavras <alexios.zavras@intel.com>,
        zhengbin <zhengbin13@huawei.com>,
        Thomas Gleixner <tglx@linutronix.de>,
        AngeloGioacchino Del Regno <kholk11@gmail.com>,
        Ben Dooks <ben.dooks@codethink.co.uk>,
        MSM <linux-arm-msm@vger.kernel.org>,
        "open list:DRM PANEL DRIVERS" <dri-devel@lists.freedesktop.org>,
        freedreno <freedreno@lists.freedesktop.org>,
        lkml <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

>Is the "| 0" really adding value here?

As far as I can see, it is present in every other config.
