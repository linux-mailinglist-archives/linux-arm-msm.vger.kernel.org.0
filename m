Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 42D2F2F5928
	for <lists+linux-arm-msm@lfdr.de>; Thu, 14 Jan 2021 04:32:23 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725773AbhANDTU (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 13 Jan 2021 22:19:20 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33842 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726448AbhANDTR (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 13 Jan 2021 22:19:17 -0500
Received: from mail-pg1-x52b.google.com (mail-pg1-x52b.google.com [IPv6:2607:f8b0:4864:20::52b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C28D0C061575
        for <linux-arm-msm@vger.kernel.org>; Wed, 13 Jan 2021 19:18:36 -0800 (PST)
Received: by mail-pg1-x52b.google.com with SMTP id n25so2846883pgb.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 13 Jan 2021 19:18:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=9KvyLUw/MNCQEbe3tjE2c9/JIbvGTQFqwBC3CpFwsOs=;
        b=g/XFaWTuk6+EWdJ6oRfzspw7ThhXIPE9n7CDmiguOUVCS9Wmtv4AeUbjIHr56zagk0
         9Jb1TeIzcD2Zl8XTM0KeGnIQAgt4oLPHx9rcOMFQ/D665OBbf6dvDNzWptcdl+JbefuV
         ao4M0yGLnOmHg5Z8kbzhbZgwPkewYosZKOVarjiISQflrFcuuvFfvaf0Tc1l6osapd/H
         ykzgqlQH8l8jNpWdE5STQnSMVoFI3aEm0fx6OJnDd4w/3ws2IueShLR6nVJZlgSmsx1c
         PL0GQdduPJpyPv7Yyaqk/14Fg6oewn2Bi9TNssv0IWOqlfHRz2oTykPCkGYhbgdTLBkc
         cA7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=9KvyLUw/MNCQEbe3tjE2c9/JIbvGTQFqwBC3CpFwsOs=;
        b=ULNrvL+HJMXGdRZ7qqfYHuDudHzh+/5aEILS/L23ogxaq5xP0zt55YX73PgDKMR9Bt
         oRnkhO2OoaZ/Yi0SplM6/rNa9ruhGQL/GH9QuwXNpmlFaZEAWZpNTzCYUgltR57/IIoO
         FqSlMtMuDE6U8CrwrpsKsboyxe40Mrz9JyXp76YdVQuVNd9Kcg2F/jV2QrHNzrtZf4LA
         4jNI3HUTTq2iGiCDwMA2W6Kj6iT49NkSfIIJfe9wNf2bxvKkSdWRnASEFxmN9RHCPSLz
         TzDa0qq0xA5fT/nz6PB3gHgPWGUe2pxjF/f9NC85X4oGYAsEPZPfeEuVIc1E7Pj3L2fc
         Gd3g==
X-Gm-Message-State: AOAM530fjIDfOqWPGKip/WwQjNyJ/qjZ/MYvrJopeEkUBqBWlkaya2K9
        pQWUaz/1xLtizW1NfdNaywXSWg==
X-Google-Smtp-Source: ABdhPJwGvYXu9EoU4ZLsVotnuTVtRlmFtz1L+VmHHSLDcvEmHgPjX91MEkToeCXwysvjHm/4jqHx5Q==
X-Received: by 2002:a62:5844:0:b029:1a8:b9dc:77bf with SMTP id m65-20020a6258440000b02901a8b9dc77bfmr5281954pfb.39.1610594316311;
        Wed, 13 Jan 2021 19:18:36 -0800 (PST)
Received: from dragon (80.251.214.228.16clouds.com. [80.251.214.228])
        by smtp.gmail.com with ESMTPSA id c5sm4140344pjo.4.2021.01.13.19.18.33
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 13 Jan 2021 19:18:35 -0800 (PST)
Date:   Thu, 14 Jan 2021 11:18:29 +0800
From:   Shawn Guo <shawn.guo@linaro.org>
To:     AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@somainline.org>
Cc:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Akash Asthana <akashast@codeaurora.org>,
        linux-arm-msm@vger.kernel.org, konrad.dybcio@somainline.org,
        marijn.suijten@somainline.org
Subject: Re: [PATCH] soc: qcom: geni: shield ICC calls for ACPI boot
Message-ID: <20210114031828.GA24107@dragon>
References: <20201228135625.4971-1-shawn.guo@linaro.org>
 <32e270de-3d23-f26d-9dd3-85a654a4ad52@somainline.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <32e270de-3d23-f26d-9dd3-85a654a4ad52@somainline.org>
User-Agent: Mutt/1.9.4 (2018-02-28)
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu, Jan 14, 2021 at 12:17:23AM +0100, AngeloGioacchino Del Regno wrote:
> Il 28/12/20 14:56, Shawn Guo ha scritto:
> > Currently, GENI devices like i2c-qcom-geni fails to probe in ACPI boot,
> > if interconnect support is enabled.  That's because interconnect driver
> > only supports DT right now.  As interconnect is not necessarily required
> > for basic function of GENI devices, let's shield those ICC calls to get
> > GENI devices probe for ACPI boot.
> > 
> > Signed-off-by: Shawn Guo <shawn.guo@linaro.org>
> > ---
> >   drivers/soc/qcom/qcom-geni-se.c | 15 +++++++++++++++
> >   1 file changed, 15 insertions(+)
> > 
> Hello!
> 
> To avoid developers booting on ACPI getting "strange slownesses" and
> possibly timeouts with no apparent reason, wouldn't it be a bit more proper
> and friendly to actually send a kernel message to advertise that there is
> *no interconnect support* and that this may lead to the aforementioned
> potential issues?

Thanks for the comment.

The commit 58ffbba6a399 ("soc: qcom: geni: Support for ICC voting")
was landed just recently, and we have been running those geni-se device
drivers without ICC voting for years.  I doubt it would have been the
case if missing ICC from any of those geni-se will cause any strange
slowness or timeout issues. 

There are only a limited number of drivers on Snapdragon that support
ACPI boot right now.  We are running it with distro installer, and
haven't seen any slowness or timeout.

In short, I prefer to add warnings that are really helpful rather than
just something noisy.

Shawn
