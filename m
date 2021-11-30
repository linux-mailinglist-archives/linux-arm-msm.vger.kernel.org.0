Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D9F5B462E91
	for <lists+linux-arm-msm@lfdr.de>; Tue, 30 Nov 2021 09:31:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239675AbhK3IfM (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 30 Nov 2021 03:35:12 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56384 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239668AbhK3IfJ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 30 Nov 2021 03:35:09 -0500
Received: from mail-pf1-x42c.google.com (mail-pf1-x42c.google.com [IPv6:2607:f8b0:4864:20::42c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0B85CC061714
        for <linux-arm-msm@vger.kernel.org>; Tue, 30 Nov 2021 00:31:51 -0800 (PST)
Received: by mail-pf1-x42c.google.com with SMTP id n26so19876812pff.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 30 Nov 2021 00:31:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=X2rX5g1aB3ao6Mz+KBNuCJKa2ATJHaYDNFIn2W26y0k=;
        b=Vvf9yRDbDirxKAxZG/3T/MRzfvWn4X3bVmO6Q+T9At9jezo3XTJLTr08aof/C6VMCs
         UvFx4/WoENskJGjeiCmK8jw97ea/Jdl4KfUggvOUN76ztl1VY5lM32kGoY2hxFjTl8U8
         efCQioAGrR1sRorj4bRQx+3fORaIuoWJbjyWJ9p6jZ2Ds2X4suinMYYQ3jKiTUWri3qj
         bfOHpCdmd8WhoCNWfMXdnFDGYmJePi2FuvreIqLtqG3HUsaVi+5v0UkEwUvfrdLE6ugm
         40SaVQ28WKa3/bm6lVk7batcP8lwtUFkSCjfhGjdKWw8Ib6UYBf8w9EgVUYvrSiGdh8x
         exhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=X2rX5g1aB3ao6Mz+KBNuCJKa2ATJHaYDNFIn2W26y0k=;
        b=dqyc3MKohdtt/vZLa1XqmJwqiiudXwVmFuXkcaxCdq4UdcPbn9KIKtHh33aVd3fet0
         VX5hKQk42ticPqQFvgtxlGxCT6jRqZbVSpbHXv+bB5eC8zZH0Ftgu34UqjBK+0qHy14e
         Kqg2ZDs5y6ZCnWdDNlQDxRtUT9/XIHIEKXqOmuLx46RlAkcPXXiCMGg3dlq8B4m4mZtp
         QbccmDaUA3qKqiosITbYKiUg/MalLv/tdnFAgad/yiGOBnSPs4teQKvKKsyMJMCCjQ28
         gcLDPQdPKgcVe3YGckUbw6EOnW5N8LlWW6JhMbL29kC8htdGSDcaW+9QVfI97DYIwwzb
         wRPg==
X-Gm-Message-State: AOAM531h3pduG2q2zbfz/5pZVIPIEcqs07l2dbiiKUJeWZ4Pg/1ZEVnd
        NA1HgJ8g5oyW4XlT7RSQbpkSIQ==
X-Google-Smtp-Source: ABdhPJxX/0BAg0okPbx9lj9wYat5fdBiNW3O/EylVD0yCf550J23PN1GTSeFNwRiBtqdIFYDPTcwPQ==
X-Received: by 2002:a62:1a03:0:b0:494:64b5:3e01 with SMTP id a3-20020a621a03000000b0049464b53e01mr45220700pfa.35.1638261110526;
        Tue, 30 Nov 2021 00:31:50 -0800 (PST)
Received: from dragon (80.251.214.228.16clouds.com. [80.251.214.228])
        by smtp.gmail.com with ESMTPSA id z15sm19622141pfc.2.2021.11.30.00.31.48
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 30 Nov 2021 00:31:50 -0800 (PST)
Date:   Tue, 30 Nov 2021 16:31:44 +0800
From:   Shawn Guo <shawn.guo@linaro.org>
To:     Maulik Shah <quic_mkshah@quicinc.com>
Cc:     Marc Zyngier <maz@kernel.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Loic Poulain <loic.poulain@linaro.org>,
        devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/2] irqchip: Add Qualcomm MPM controller driver
Message-ID: <20211130083143.GF10105@dragon>
References: <20211126093529.31661-1-shawn.guo@linaro.org>
 <20211126093529.31661-3-shawn.guo@linaro.org>
 <87czmmbu8k.wl-maz@kernel.org>
 <20211129133308.GB10105@dragon>
 <87pmqjm1c8.wl-maz@kernel.org>
 <20211130023151.GD10105@dragon>
 <2e821841-a921-3fda-9ee6-3d5127653033@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2e821841-a921-3fda-9ee6-3d5127653033@quicinc.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue, Nov 30, 2021 at 01:19:48PM +0530, Maulik Shah wrote:
>    Hi Shawn,
> 
>    On 11/30/2021 8:01 AM, Shawn Guo wrote:
> 
> +       do {
> +               r_val = readl(priv->base + offset);
> +               udelay(5);
> +       } while (r_val != val);
> 
> What? Is this waiting for a bit to clear? Why isn't this one of the
> read*_poll_timeout*() function instead? Surely you can't wait forever
> here.
> 
> This is taken from downstream, and it seems to double check the written
> value by reading it back.  But to be honest, I'm not really this is
> necessary.  I will do some testing with the read-back check dropped.
> 
> How about asking for specs instead? There are QC people on Cc, and
> many more reading the list. Hopefully they can explain what this is
> all about.
> 
> Maulik,
> 
> If you have some information about this, that would be great.
> 
>    This can be converted to read poll_timeout(). This was introduced in
>    place of wmb() to make sure writes are completed.

Hmm, in this case, writel() will just do the right thing, as it wraps
wmb() there.  Or am I missing something?

Shawn
