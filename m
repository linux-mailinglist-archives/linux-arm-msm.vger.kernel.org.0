Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 338CE3DF0CE
	for <lists+linux-arm-msm@lfdr.de>; Tue,  3 Aug 2021 16:53:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235860AbhHCOxN (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 3 Aug 2021 10:53:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35946 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235607AbhHCOxM (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 3 Aug 2021 10:53:12 -0400
Received: from mail-pj1-x1031.google.com (mail-pj1-x1031.google.com [IPv6:2607:f8b0:4864:20::1031])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3BA8AC061757
        for <linux-arm-msm@vger.kernel.org>; Tue,  3 Aug 2021 07:53:01 -0700 (PDT)
Received: by mail-pj1-x1031.google.com with SMTP id t7-20020a17090a5d87b029017807007f23so997789pji.5
        for <linux-arm-msm@vger.kernel.org>; Tue, 03 Aug 2021 07:53:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=lgVK9ZbTP/U+rzYnFQXvKsYzGeMwMr76Bjv4R6T0s2M=;
        b=FtpYOtM1+nZ3GZri+I+h2G7gLQ1QUhyFRJMljb6L33QhTbBkd+09quDw2Khs79WFrl
         Ogp49kdG/11d2ZTOz6FS3dny18RJ4XSbjTzJpbrNw9fsyUEmdy/6af7tSvyDwsIk7tSi
         PRmRrgaZLWXVM/lsN72TDe7I8W6qRZs4/F5W/VGOk8tmIPA1KXdeNV5jBABOnI1t3eFK
         2k409W/MZjDdpBXw6RSHurCghX7BPweC/W/P4NmVygSLvNRNRDSI8/0XWmcOh00NFL/7
         NezYbzO3YUm05xPr/NFA/buOhKJfD5No+DrH0/c/fIfxltiYB8X/WMBRiKFxK+P2F3Cm
         hY3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=lgVK9ZbTP/U+rzYnFQXvKsYzGeMwMr76Bjv4R6T0s2M=;
        b=eCBJY4ZNzcQPRkO9vUoXlNv1Y9DKhw6onDeZEa/wKmj76BZY9/EcoIlXWQjcwzJ5hC
         KRyn6Yc9QwWi9rFqaisghewaj+WedWZDVN/dsQxo0xIBpQva/IXRiBZVq9WEVPyyJi+g
         h6DHugUZ/GEw52s0XDCYDgU2IXRPLhbqyeS0DvpWALX4JO8TWH4ojVr82mj4H1K3GZVz
         m3SbDdOHlAeHUvt460WrFh4L/cC7udWTmG8KYenJqmmUjRddKhxxJBC2R+P3hSrn1Pqw
         G7XS1vO/av7mSckxHd/Mi8bohGbYkMCGet7QC4KF9XHJ/yq/+ILc0fVWDHZ5XZpcJd+h
         ZLxQ==
X-Gm-Message-State: AOAM530sKRrKVJU/tchYnQ90gQ1vuQjMYI/2QZssSzffH4silQb5Myxb
        YOWuSeiEjxIovTM5JhXGXIEbCy0+R9mq/tfOU+lQOw==
X-Google-Smtp-Source: ABdhPJy9sLQilythvxDZdUqpa/x4Q4N5dlRFJEbQ65qMKk4DkJR/VfO07Sg03a0RPOSTFLVGuj62Zt4w+NLbgTe+Fs4=
X-Received: by 2002:a63:dc58:: with SMTP id f24mr217833pgj.303.1628002380556;
 Tue, 03 Aug 2021 07:53:00 -0700 (PDT)
MIME-Version: 1.0
References: <1e288e5bee3f2a18e0ddb8b7a50158ecb793822d.camel@bootlin.com>
 <CAMZdPi-qydatnYYLPY9pZ_4XNZOKB+GBVw2M5rqD1WuVEQLwOg@mail.gmail.com>
 <4a9b0d64f1d7ead1f183b2ad0af32379e64d9b82.camel@bootlin.com>
 <CAMZdPi-22FjHwUqQ-K2huaHV_9zDrZShi74w7LCUiMjf-Ss_OQ@mail.gmail.com>
 <680ccb5730cc1724bbadb2b21638b696@codeaurora.org> <a7ff4a6e65d12b35719831bdf50ce1e9ae21027b.camel@bootlin.com>
In-Reply-To: <a7ff4a6e65d12b35719831bdf50ce1e9ae21027b.camel@bootlin.com>
From:   Loic Poulain <loic.poulain@linaro.org>
Date:   Tue, 3 Aug 2021 17:02:44 +0200
Message-ID: <CAMZdPi_+j9jDhZH7CTHWV5Hzw0X+=OCwz9F7doZpF8VH1nSHtg@mail.gmail.com>
Subject: Re: MHI driver issue with Sierra Wireless AirPrime EM919X
To:     Thomas Perrot <thomas.perrot@bootlin.com>
Cc:     Bhaumik Bhatt <bbhatt@codeaurora.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Thomas,

> Thanks to both of you, to increase the timeout to 24000ms, in addition
> to disabling the power management seems to correct the issue.

Would you be able to submit a fix patch for the timeout_ms (with CC stable)?

I'm a bit worried about that PM issue, not sure why it does not work,
could you please double check you have this change:
"mhi: pci_generic: Fix inbound IPCR channel"

Regards,
Loic
