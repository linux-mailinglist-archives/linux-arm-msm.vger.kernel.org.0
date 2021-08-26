Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id ABACB3F8D64
	for <lists+linux-arm-msm@lfdr.de>; Thu, 26 Aug 2021 19:55:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243092AbhHZR4a (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 26 Aug 2021 13:56:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51488 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232159AbhHZR4a (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 26 Aug 2021 13:56:30 -0400
Received: from mail-pj1-x1035.google.com (mail-pj1-x1035.google.com [IPv6:2607:f8b0:4864:20::1035])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 06F8AC0613C1
        for <linux-arm-msm@vger.kernel.org>; Thu, 26 Aug 2021 10:55:43 -0700 (PDT)
Received: by mail-pj1-x1035.google.com with SMTP id oa17so2750356pjb.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 26 Aug 2021 10:55:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=5QpB1GS1bNm9c/XkPMFobCG51c0nT9lIzApBMHol1ns=;
        b=fUBgcOfiPdHqZ5kIwdTonbiILh8nStgbawVBub001+mLIXxQSRMYvffkZCAhEM1NQH
         Sg5qBN6Abk8Xt9gUtW1hC1Ln5Xn0sfasGyqNiYlx7ec4HWywdDooyvmBS+v74UemDofu
         NOvc2phjwXVJEPk1Q6vJOeuUhAvFEGsRlqqZw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=5QpB1GS1bNm9c/XkPMFobCG51c0nT9lIzApBMHol1ns=;
        b=JekKt42jMYDbJN2uyFP6vaD8gzFzrNjAzWL/VC1ODVWLuUYlcuq3eiIKQvhPKdZK0s
         VBw8+h8aklh6LUV7jhpU/m6DWMm8a640bgC9JJXd9ju9GmDO7ttdJ/gxMXblI3XP4vIv
         LZDUrIeYhbHDw08+sAWJdTXb/g/vIIOCoAHxbQ0GnPAW/BdZY9i6RTo5amAaQzM/iZG/
         uvxXz2AVhlVN/KG/HvvLa9U1h+OwFq5r5j4auyiGydKMnB6X3xC6MCJ+lOsl4i/eXWA2
         nmXkUHa3CkSF2RYRkjvi799/UyWBpahP9FtGZHyOPsVPqpF192KAXg3PjqpTcjHlLi5F
         I1Qw==
X-Gm-Message-State: AOAM5304U+4SYg6irt2MKp9m25lmUkcjIMT9He6Z0I2thaN3VHall/G8
        uQWR3o1fBOJyFOOMs/AbSGGWuQ==
X-Google-Smtp-Source: ABdhPJzG+SCorxuLWOXOn1Ede81vBcYmHRu514PXPvO54BZrWLJCoFq6ylHVMNpo/iOganlPrc/6Pw==
X-Received: by 2002:a17:90a:1f09:: with SMTP id u9mr17872717pja.206.1630000542589;
        Thu, 26 Aug 2021 10:55:42 -0700 (PDT)
Received: from localhost ([2620:15c:202:201:bd0b:bcb8:ebdb:c24d])
        by smtp.gmail.com with UTF8SMTPSA id b17sm4462648pgl.61.2021.08.26.10.55.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 26 Aug 2021 10:55:42 -0700 (PDT)
Date:   Thu, 26 Aug 2021 10:55:39 -0700
From:   Matthias Kaehlcke <mka@chromium.org>
To:     Zijun Hu <zijuhu@codeaurora.org>
Cc:     marcel@holtmann.org, johan.hedberg@gmail.com, luiz.dentz@gmail.com,
        linux-kernel@vger.kernel.org, linux-bluetooth@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, bgodavar@codeaurora.org,
        c-hbandi@codeaurora.org, hemantg@codeaurora.org,
        rjliao@codeaurora.org, tjiang@codeaurora.org
Subject: Re: [PATCH v5] Bluetooth: btusb: Add support using different nvm for
 variant WCN6855 controller
Message-ID: <YSfVm10e2Z6bIwfS@google.com>
References: <1629793683-28770-1-git-send-email-zijuhu@codeaurora.org>
 <YSS34JcZcoZwWg5D@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <YSS34JcZcoZwWg5D@google.com>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue, Aug 24, 2021 at 02:12:00AM -0700, Matthias Kaehlcke wrote:
> On Tue, Aug 24, 2021 at 04:28:03PM +0800, Zijun Hu wrote:
> > From: Tim Jiang <tjiang@codeaurora.org>
> > 
> > we have variant wcn6855 soc chip from different foundries, so we should
> > use different nvm file with suffix to distinguish them.
> 
> Similar question as on v4: why is it necessary to know where a chip was
> manufactured? Is the hardware different? Should the FW behave differently
> for some reason (e.g. regulatory differences)?

Tim briefly responded in private, I'm not sure if I'm allowed to share it
publicly.

I still doubt whether the 'foundry' is the right way to split things, I'm
more inclined towards the concept of a 'variant', which is more flexible.

Anyway, I'll leave it to the maintainers, if they are happy with the foundry
thing I'm fine with it.
