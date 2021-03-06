Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B1EF032F947
	for <lists+linux-arm-msm@lfdr.de>; Sat,  6 Mar 2021 11:06:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229917AbhCFKF3 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 6 Mar 2021 05:05:29 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59918 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229714AbhCFKFP (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 6 Mar 2021 05:05:15 -0500
Received: from mail-pg1-x529.google.com (mail-pg1-x529.google.com [IPv6:2607:f8b0:4864:20::529])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5D503C061760
        for <linux-arm-msm@vger.kernel.org>; Sat,  6 Mar 2021 02:05:14 -0800 (PST)
Received: by mail-pg1-x529.google.com with SMTP id x29so3061140pgk.6
        for <linux-arm-msm@vger.kernel.org>; Sat, 06 Mar 2021 02:05:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=IxxG7+/Jf2xeis/L0iB2HVcjDnZPIqtkUD4U9LiGxFA=;
        b=F1ly1E3BLIqrYvco/cS6aH0WiDIbpt7rf2lq6DlhBmIhkxcbOEG8aMACert8PfQ18F
         rpzeXziheyELB8AkpzWs19zKWtSlaojSnPdshF+g5U+wG/IqzV2Q5Qq/34e1LcY38swH
         LPvIHpRk8Z53yRT5HsPmDCXSMkHOfTJ/2NA/XLIM2b1ZBQtEkXZ5MDZ8rkxQb9IQfOTu
         WpJBHwsEwWgDqigpM52DLrXmVvTOmnJsPKU79aoPiU4KElKjxQT+jk2YOYCMPJGdRQu6
         v9kND2nbrn0kkGwoTvjCKwr7c92a91xdLaCItYY7gCMAMgPh9XN06BwJRLTVc+WHU0Qk
         KS1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=IxxG7+/Jf2xeis/L0iB2HVcjDnZPIqtkUD4U9LiGxFA=;
        b=aa+jf1iIar50vKhbW1OVf3j3QueAjkGOGSjU141WImYduLjjdT5ONWeAgp17wrzpUT
         QNQdQpA6861dbdAyyqZMl5aPRqSUi/F3FFC3IT9BkAlW8IFSj73lpXsDihrDMvP9tTuQ
         Do+aZguDcqDkjdcF3UlCH3quO8qCrfprhv1lYLOHlSWTPd4CS+eSMtbToQQcF+xSvP25
         C1EJB7h6m0mPJjGSSOIsR+6Awg2mNTPgu1XQxdZYK33COEaEnyLToECyE7ags3thLViP
         vJAOGTrqKltJdnDEj5lS1oT63XEZPTvVujaSJ2YrbBvEJ536UXyxvefXeo5sIGZcN/mD
         1wfg==
X-Gm-Message-State: AOAM5309We6tgQhtFE3WsPrgKhkOXW3n23utzdD0YjJ4o15aro6xWAQO
        d6g+dHrE4TSMCqqMk28JrdfTMQ==
X-Google-Smtp-Source: ABdhPJymaVvjjY6JwKfnCmUAVajzElj1JzVdJdUkNylxHTbSHDDGxSbXi1aiiyoTBmpE05nZ+9pBUQ==
X-Received: by 2002:a62:1e46:0:b029:1f3:ad4f:9c6b with SMTP id e67-20020a621e460000b02901f3ad4f9c6bmr718644pfe.64.1615025113705;
        Sat, 06 Mar 2021 02:05:13 -0800 (PST)
Received: from dragon (80.251.214.228.16clouds.com. [80.251.214.228])
        by smtp.gmail.com with ESMTPSA id e185sm4944223pfe.117.2021.03.06.02.05.11
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sat, 06 Mar 2021 02:05:13 -0800 (PST)
Date:   Sat, 6 Mar 2021 18:05:08 +0800
From:   Shawn Guo <shawn.guo@linaro.org>
To:     Ard Biesheuvel <ardb@kernel.org>
Cc:     linux-efi@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        Jeffrey Hugo <jhugo@codeaurora.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Clark <robdclark@gmail.com>,
        Leif Lindholm <leif@nuviainc.com>,
        linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH 0/1] use RT_PROPERTIES table to implement efi=novamap
Message-ID: <20210306100507.GO17424@dragon>
References: <20210305093958.187358-1-ardb@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210305093958.187358-1-ardb@kernel.org>
User-Agent: Mutt/1.9.4 (2018-02-28)
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Fri, Mar 05, 2021 at 10:39:57AM +0100, Ard Biesheuvel wrote:
> This patch addresses an oversight on my part when I implemented Linux
> side support for the EFI RT properties table: SetVirtualAddressMap() is
> itself a runtime service which is only callable at runtime to begin with,
> and so the EFI stub should only call it if it is not marked as unsupported.
> 
> This may be useful for the Snapdragon EFI based laptops, which already rely
> on a special EFI driver to expose the correct DT based on metadata exposed
> by EFI. These systems ship with a broken implementation of SetVirtualAddressMap,
> which is currently being worked around by passing efi=novamap on the kernel.
> command line.
> 
> After applying this patch (which I intend to propose for backporting to 5.10),
> the same can be achieved by exposing a RT_PROP table that marks SetVAMap() as
> unsupported. And while at it, better mark the variable services as unsupported
> as well, since they don't work under Linux either.
> 
> I'm open to extending this with a Linux specific override value kept in a
> EFI variable, so that platforms that cannot support DtbLoader are able to
> implement something similar.

Yes, that will be much appreciated!  IMHO, this is definitely an useful
addition, as DtbLoader shouldn't be mandated.  In some cases, people may
choose to load DTB with other means, or DTB is not required at all.
Yeah, ACPI kernel is already useful for these laptops, not only for
running installer but also as a console based native arm64 machine.

Looking forward to something for testing :)

Shawn
