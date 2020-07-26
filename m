Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4174622DEBE
	for <lists+linux-arm-msm@lfdr.de>; Sun, 26 Jul 2020 13:42:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727909AbgGZLl1 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 26 Jul 2020 07:41:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44434 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725794AbgGZLl0 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 26 Jul 2020 07:41:26 -0400
Received: from mail-ed1-x544.google.com (mail-ed1-x544.google.com [IPv6:2a00:1450:4864:20::544])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5516CC0619D2;
        Sun, 26 Jul 2020 04:41:26 -0700 (PDT)
Received: by mail-ed1-x544.google.com with SMTP id a1so10066212edt.10;
        Sun, 26 Jul 2020 04:41:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=lseWHrFGrBMnahk5IsFpxWMdJQwHw9KSOQ+YjXuxbFA=;
        b=aQBpC9fzSLDnNvo+7B291mUv7CYE5RDCBIF21+v6M1aGzer6EfkLoJTc2o7eM2K6MG
         AEwWL5yYBW7duIplNuwImdTx2S1RNduHQeqEz7mgWGH8phlB4lVmG8WraFLhUQJQ98Z2
         zUqMA7AMx1KI9m0wjq5Pggp54FnyaY97h8fptUzqQQSzxWh98jXHZHPHVbaEyQRKgrzd
         i2cvvdyI3MRlbqk0xdTUVTqT7iJB3HtXVtuiJeb5ouEVGh1+FGE608Ek0ww5PSUYS0h2
         CeGhysTrPHi4pC+EoRw7apKj2jD5TkDMRVMNrR+Ty5Y6JJ8bb8ZBiE0hUl/tm2l1AE7l
         L86A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=lseWHrFGrBMnahk5IsFpxWMdJQwHw9KSOQ+YjXuxbFA=;
        b=oC/cjnLFM/fGqrB02GyoWkFBBWg0aExw8LZDsKSi3ULbkqPKPXxjHJqvnaMqPvBISU
         1B/lHkaVfEndtxZ4mjrecYbKxXJZfglh2owRZw8uJ8qQ2KNvMdbNlddtufm+3eh07/hz
         N4rCChVPVJtDjlCoBPgJiYX7EXfU05aIuN6bNNtcvtV+rGNfsJnbJ0ngsCb9JK3JiMzm
         qktmu1cn+zl7lqBSiWg40e9yC4F5Nrn2jqlynFmtHHt0CqNp+dErz0YDQOOk1qJ5aSRx
         LRhgucRfr6CN0BRI7uV+lJx0mqtCZzHclpfI73hZQGRVtY5b5ibLABg5B73jPTST5XxS
         RAOg==
X-Gm-Message-State: AOAM532qvym97B82eTSYLGdjP69wRaYRip9rDQJKU92sN/LtYzKJsnVx
        8G3L5US3qwCwehNl+OG1DInssHzJLaMtUQArJSpdMYDaoMg=
X-Google-Smtp-Source: ABdhPJwLaN8pOziusRtdh65jeRMP/q7PrsLl/HAajDABeyO6M98X1ss/F/xt4CRsnqgpobZve6SjTOQeV/4Mrj+BHWc=
X-Received: by 2002:a05:6402:1ade:: with SMTP id ba30mr16127632edb.231.1595763685099;
 Sun, 26 Jul 2020 04:41:25 -0700 (PDT)
MIME-Version: 1.0
References: <20200726111215.22361-1-konradybcio@gmail.com> <20200726111215.22361-10-konradybcio@gmail.com>
 <20200726112920.GA1286220@kroah.com>
In-Reply-To: <20200726112920.GA1286220@kroah.com>
From:   Konrad Dybcio <konradybcio@gmail.com>
Date:   Sun, 26 Jul 2020 13:40:46 +0200
Message-ID: <CAMS8qEV7jhbHqpXE2UOaXBVM5WbCThaGrcD3wiH9kf6h_K-qeA@mail.gmail.com>
Subject: Re: [PATCH 9/9] soc/qcom: Add REVID driver
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     Martin Botka <martin.botka1@gmail.com>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Rob Herring <robh+dt@kernel.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Kishon Vijay Abraham I <kishon@ti.com>,
        Vinod Koul <vkoul@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Felipe Balbi <balbi@kernel.org>,
        Jordan Crouse <jcrouse@codeaurora.org>,
        zhengbin <zhengbin13@huawei.com>,
        Jeffrey Hugo <jeffrey.l.hugo@gmail.com>,
        AngeloGioacchino Del Regno <kholk11@gmail.com>,
        Ben Dooks <ben.dooks@codethink.co.uk>,
        Krzysztof Wilczynski <kw@linux.com>,
        Harigovindan P <harigovi@codeaurora.org>,
        Brian Masney <masneyb@onstation.org>,
        Sam Ravnborg <sam@ravnborg.org>,
        Xiaozhe Shi <xiaozhes@codeaurora.org>,
        Manu Gautam <mgautam@codeaurora.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        "open list:DRM PANEL DRIVERS" <dri-devel@lists.freedesktop.org>,
        freedreno <freedreno@lists.freedesktop.org>,
        DTML <devicetree@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-usb@vger.kernel.org, linux-clk@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Greg, thanks for your review!

>Why do we need this noise in the kernel log?

I guess it could be left there as a debug print? Knowing your hardware
revision seems like a good, but yeah, not a necessary thing.

>You can drop the GPL boilerplate text and add a proper SPDX line at the
>top.

Seems I only did that in my other local tree.. whoops!

>Drivers should always use dev_err() and friends, as you have access to a
>struct device * always.  Please fix up the driver here to use that api
>instead, no pr_* should be needed at all.

Will do.

>Horrible global symbol name.  Who calls this?

Welcome to development on qcom platforms :D

>This is the last patch in
>the series, so if there is no user for this, please don't export it.

Other downstream drivers make use of it.. need to get this up first, sorry :V

>Why do you need a .h file in the include directory if only a single .c
>file needs it?  Just put that info in the .c file itself.

Again, other downstream drivers which some people and I intend to
bring to upstream standards use that to access the PMIC model/hw revision.

>But again, who uses this module?  If it's only good for a single line in
>the kernel log, that feels like a huge waste to me.

downstream-kernel-dir$ rg -l qpnp-revid.h | wc -l
25

So yeah, quite a bunch of other qcom-specific drivers.

I'll try to fix these and send a v2.

Regards
Konrad
