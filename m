Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 56E63390F0A
	for <lists+linux-arm-msm@lfdr.de>; Wed, 26 May 2021 06:00:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229553AbhEZECV (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 26 May 2021 00:02:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59802 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229522AbhEZECV (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 26 May 2021 00:02:21 -0400
Received: from mail-ot1-x336.google.com (mail-ot1-x336.google.com [IPv6:2607:f8b0:4864:20::336])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1F58EC061756
        for <linux-arm-msm@vger.kernel.org>; Tue, 25 May 2021 21:00:50 -0700 (PDT)
Received: by mail-ot1-x336.google.com with SMTP id 69-20020a9d0a4b0000b02902ed42f141e1so30755481otg.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 25 May 2021 21:00:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=1/0s4irIAHrEsalg1vYZ8qoD26aC19QWgqCayWmosVw=;
        b=nfyuAbLzS6wleb8opN1gCeIdANOfcVxizXhDbL12q+twpO+KfBaDDqzQbkybbQkHuW
         fy752HROUtfXiVARGwEt/9jYpplrjGUgXL04OszzgQhKbtktBx1arPwSVhE7F9hRBLyj
         rtpaq7XKvwrhwEUdm+LcF/tVsnaM8Lea640urg+RmWA9GaSMjqX86CBR/D7AQcdEahRG
         BmFjbncstNSXWASJbEmlSgBo7JaXA1/bnM+b9UNVYuDeFl3vIxU79Y7dzNbjEnOiV5z9
         TTud1wsGlR+h2YLDsORMthKkb9eCG6tIC4KR+1H8Y5Z5ZeRwIHy+5TNmnCqKy40QU7xn
         22Ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=1/0s4irIAHrEsalg1vYZ8qoD26aC19QWgqCayWmosVw=;
        b=BryeETFjWHlkkiwyABhTEfTzGcK6EReWapL6GnZLzQOphgHMV2TrRrLbf31sZB88NZ
         pZaWpjBqyKRT9n0nbg/igsUV1nNLRPz8btCy2Pbr0u3TqcOkr7Wg77J4ooo0832ccART
         5LsZ1vsk2eO0/t/brtcheI+ylsDMSFKadLD9cY4Wsv3Iaro/9GAwmm7grXbS5vZ4Rtsa
         03g2bqH6jsdHUEK0zo1CoX7SAi0o9mqC5v+Fe8DOOkNLUU1Caqqy2TfPQR15w1Kplzs/
         MkOgRfI8i5ZognubP0bHPmTQPxVMh3EtVVNfB5F26AKGqg41OCGLqpnW3yfMV6UvSCg7
         es4A==
X-Gm-Message-State: AOAM533cgnwMEn6/WWVttL43Enl97GDUTOid9R+Y7UciCVnaIQ+4HcIh
        90z4Jnq/BItOrCFnsQUexYUuVw==
X-Google-Smtp-Source: ABdhPJzk1HhgeuWiLDaU1PfKNdSJXCB+4kVlv9S0wuamiLM7l8i7S9GOa6B0UO5B2unyeDujQDsvhA==
X-Received: by 2002:a9d:30d2:: with SMTP id r18mr750948otg.170.1622001649055;
        Tue, 25 May 2021 21:00:49 -0700 (PDT)
Received: from builder.lan (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id z9sm4248004oti.37.2021.05.25.21.00.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 May 2021 21:00:48 -0700 (PDT)
Date:   Tue, 25 May 2021 23:00:46 -0500
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Maulik Shah <mkshah@codeaurora.org>
Cc:     swboyd@chromium.org, mka@chromium.org, evgreen@chromium.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        agross@kernel.org, dianders@chromium.org, linux@roeck-us.net,
        rnayak@codeaurora.org, lsrao@codeaurora.org,
        Mahesh Sivasubramanian <msivasub@codeaurora.org>,
        Lina Iyer <ilina@codeaurora.org>
Subject: Re: [PATCH v7 2/5] soc: qcom: Add SoC sleep stats driver
Message-ID: <YK3H7m7bpL2DJt9R@builder.lan>
References: <1617704857-19620-1-git-send-email-mkshah@codeaurora.org>
 <1617704857-19620-3-git-send-email-mkshah@codeaurora.org>
 <20210412234317.GE1538589@yoga>
 <cd54214e-8c60-8f92-3c0b-f7367f1bd42e@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cd54214e-8c60-8f92-3c0b-f7367f1bd42e@codeaurora.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Fri 21 May 06:10 CDT 2021, Maulik Shah wrote:
> On 4/13/2021 5:13 AM, Bjorn Andersson wrote:
> > On Tue 06 Apr 05:27 CDT 2021, Maulik Shah wrote:
[..]
> > > diff --git a/drivers/soc/qcom/soc_sleep_stats.c b/drivers/soc/qcom/soc_sleep_stats.c
[..]
> > > +MODULE_SOFTDEP("pre: smem");
> > I believe this should be "qcom_smem",
> the module has smem.ko file so "smem" looks proper.
> >   but given that you call
> > qcom_smem_get() in your code you have a hard dependency in place
> > already. So, can you help me understand what use this softdep provide?
> 
> If both smem and soc_sleep_stats are compiled as DLKMs, this is to make sure
> smem module was loaded first by keeping pre soft dependency.
> 

But we're making a direct function call into the qcom_smem driver, so we
already have a hard dependency on qcom_smem.ko being loaded.

Regards,
Bjorn
