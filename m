Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 073792A0417
	for <lists+linux-arm-msm@lfdr.de>; Fri, 30 Oct 2020 12:28:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726240AbgJ3L2H (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 30 Oct 2020 07:28:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34564 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726078AbgJ3L2H (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 30 Oct 2020 07:28:07 -0400
Received: from mail-pf1-x444.google.com (mail-pf1-x444.google.com [IPv6:2607:f8b0:4864:20::444])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D0624C0613D4
        for <linux-arm-msm@vger.kernel.org>; Fri, 30 Oct 2020 04:28:06 -0700 (PDT)
Received: by mail-pf1-x444.google.com with SMTP id w65so5015315pfd.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 30 Oct 2020 04:28:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to
         :user-agent;
        bh=hxTRuwuwoz+yNxAP/6AWKELjPIZFSOzk04+9b9KVhAk=;
        b=LrI15tSUqq1g/++IsXJr71dx/QBn6k6L9Fbp9JFRnnkpYtM3Mid6lAljpFwTjKxdFI
         ryCb6zAG9h7WLR7zUbyXvcU3iMVHkzhzegveXZLDM94k/zDC5eyP1DvXuZN96JhsL9f7
         FunARwjR38C8GhD/kf3V0y6EhoXB0bNklTa+fQhbyvKaC+uo4hjasdJZRF6szEGoCoKb
         8lv1tO1aJdagIeVJpagB1zliwoXnLf9rigebiVErrPDhYBrbZdBdnBNmqwR5GD5iCKmy
         MQ8VS8FmeZybzY45j7a/cF3rThP0ZxGN5FQrEa7gI9BQh/8mhwYyvcZ8AWu52g8LiFEr
         ttuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to:user-agent;
        bh=hxTRuwuwoz+yNxAP/6AWKELjPIZFSOzk04+9b9KVhAk=;
        b=DkW7mEVGQ45hl7mjtTXYe2iANtxTTrVAPU2fS+te3pp5yZoOHPpl5zey49w+0VgKzY
         xo91AV5f2cF1n4pDSA8KQL39SHYNH5GdIcQTG3gA0+bO8X/bT4Ymgs5yWxnif9HePuHG
         87z0YdbtHjjSbhs8TYhMUKnb4DIWF2Kr8mTMI3fb1POGpd8yLlpylpg8YG5rtQbUwrlg
         uy7AHGnKYHZAvLQUpvICX+umuzcuuS5PZ+9ch4t0mOWmJi12c8Nq0C35W5Up6a6wwprZ
         m/z5Fl4PT6L0GAdM7uG/+b+D6pfSlzMEYjeFiKBZfxW38hyD7Y4gT03RxMjfkx+WIYc7
         TuOw==
X-Gm-Message-State: AOAM532R9uFohWiKdjv0jZ3dLY90vhWmQxMxYUoqB5RJHczBze9JtMMT
        NSY4s5IzD7GCcUSM5IBe9uebMw==
X-Google-Smtp-Source: ABdhPJwwggNEsnZknRY5cUfKVjS9yEm36sJPzqX9ONPiz7bO+HrPfpDp5q8F40r8hZSSop3cFhXPWA==
X-Received: by 2002:a17:90a:7bc5:: with SMTP id d5mr2184292pjl.99.1604057286210;
        Fri, 30 Oct 2020 04:28:06 -0700 (PDT)
Received: from localhost ([122.181.54.133])
        by smtp.gmail.com with ESMTPSA id 15sm5321549pgs.52.2020.10.30.04.28.04
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 30 Oct 2020 04:28:05 -0700 (PDT)
Date:   Fri, 30 Oct 2020 16:58:02 +0530
From:   Viresh Kumar <viresh.kumar@linaro.org>
To:     Frank Lee <tiny.windzz@gmail.com>
Cc:     Frank Lee <frank@allwinnertech.com>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        airlied@linux.ie, Daniel Vetter <daniel@ffwll.ch>,
        Viresh Kumar <vireshk@kernel.org>, Nishanth Menon <nm@ti.com>,
        Stephen Boyd <sboyd@kernel.org>,
        "Rafael J. Wysocki" <rjw@rjwysocki.net>, jcrouse@codeaurora.org,
        eric@anholt.net, kholk11@gmail.com, emil.velikov@collabora.com,
        gustavoars@kernel.org, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux PM <linux-pm@vger.kernel.org>
Subject: Re: [PATCH 2/3] opp: Add devres wrapper for dev_pm_opp_set_prop_name
Message-ID: <20201030112802.bptlthpxl2qvbvr6@vireshk-i7>
References: <20201012135517.19468-1-frank@allwinnertech.com>
 <20201012135517.19468-3-frank@allwinnertech.com>
 <20201028102942.zc5hgqpo2bfrn6in@vireshk-i7>
 <CAEExFWvNgK2wbvmxZjsJR4g-VBq=ggsBLew77rzmNdkpqTRuDA@mail.gmail.com>
 <20201028144628.qm2t2hbzmouqkciy@vireshk-i7>
 <CAEExFWtYrT3psuLC0fd7cX2GrmPaYxqZK65OLUv+2s97ehz97g@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAEExFWtYrT3psuLC0fd7cX2GrmPaYxqZK65OLUv+2s97ehz97g@mail.gmail.com>
User-Agent: NeoMutt/20180716-391-311a52
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 30-10-20, 19:19, Frank Lee wrote:
> GPU is also a relatively large number of opp consumers.

I was talking about the number of files or locations from which this
routine (the devm_* variant) is going to get called. And it is one
right now. And I don't see if any of the other callers are going to
use it for now.

> Most of the time, the dev_pm_opp_set_* functions will only be set once.

Right.

> If don't need the driver to dynamically manage and release the opp, it
> may be OK？

Every call to dev_pm_opp_set_supported_hw() increases the ref count of
the OPP table and if it isn't balanced with a call to
dev_pm_opp_put_supported_hw(), then the OPP table will never get
freed. So if the driver is a module and ends up creating an OPP table
every time, then this will lead to leakage.

The best way to fix this is by calling dev_pm_opp_put_supported_hw()
from the right place and then we are good.

-- 
viresh
