Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A07BC290617
	for <lists+linux-arm-msm@lfdr.de>; Fri, 16 Oct 2020 15:14:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2407000AbgJPNOV (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 16 Oct 2020 09:14:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42626 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2404484AbgJPNOP (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 16 Oct 2020 09:14:15 -0400
Received: from mail-pf1-x444.google.com (mail-pf1-x444.google.com [IPv6:2607:f8b0:4864:20::444])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7A8E9C061755
        for <linux-arm-msm@vger.kernel.org>; Fri, 16 Oct 2020 06:14:13 -0700 (PDT)
Received: by mail-pf1-x444.google.com with SMTP id b26so1497482pff.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 16 Oct 2020 06:14:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=2v//XZb9addO+YnQGTuZ1rtYAQE5PbqfnjEF9yMyDoc=;
        b=CpB0A1qLkDsgmfvKFlr7UWapLdP1M00owIA2ts+xR/6P+6yK9aTnPfr/6RsH0lcJ+l
         rX5wPDmXPApN0QW7GUw/tRwsktOJgkS2wcU59h0u8CN8GJnM/Jtowgu1lUiN63H8RIKc
         wx3+f+RTXRcFKXiqmhSmnjdxEoPbQN1uj5++a3/5ThnGYl42h1HmtPI3AcKCgMbUrAjb
         vIIfwN2kfj2evVmwQ/OaNQDq4nl+TmJaTRNxpwtggZR8txOeD9QdwZhx2n1ZlKVL4k2R
         Gx3S4zpiFqE7TM9VVfbXNrvpt3gpBIWZeiJmmYFzZstDxfviyixPE2I7Gn+DXEbmaFli
         3tcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=2v//XZb9addO+YnQGTuZ1rtYAQE5PbqfnjEF9yMyDoc=;
        b=dqh09z+rpoadNFIlZAnM3rfH+JfRQYaIcqrzbqxfDXsCh6ajCRhmFMQXVc0vnd75RN
         FKtSTEhMuRQO2jX1hFov+DNcqBk5ncLHe3e8g2XHc0elzHsfOsrX+ftnm65VCfaqia6c
         ffY6oqmmQ9mVhdk9aENQHJYmAHsLJAH7AucR/TAdmftuBhlZhaLx9LGr7M7+Z+Ew5zVs
         it9SZrS9BI3KZUbGEnl+URSJiMsV5TFHhACG4BK6PteM6x8wKiRaO4vSwaQBboAmYd1N
         4gsdNTRZghOquBCmdzcPrdQHNSufq1RmI4Upm7UHKt+WQ/I9ohXdJl/3HXxSVDd7exFb
         NZqQ==
X-Gm-Message-State: AOAM531fiHz3YXwMw0N5OM0S2/IvilnKIwva6prPXnrnKpQ7ksLRfsbO
        lVv/rHmFlUdn2P6yU1zzFCP5lw==
X-Google-Smtp-Source: ABdhPJwpBt1lWaerL/zTVz8TqRFSN2H2X1ZaeEtayOXScEJOTVGGH1v+RUnnCnoUuu2gcA9u1B5ljg==
X-Received: by 2002:a63:1865:: with SMTP id 37mr3186358pgy.322.1602854052978;
        Fri, 16 Oct 2020 06:14:12 -0700 (PDT)
Received: from leoy-ThinkPad-X240s ([64.120.119.108])
        by smtp.gmail.com with ESMTPSA id e5sm3587979pjd.0.2020.10.16.06.14.09
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 16 Oct 2020 06:14:12 -0700 (PDT)
Date:   Fri, 16 Oct 2020 21:14:07 +0800
From:   Leo Yan <leo.yan@linaro.org>
To:     Suzuki Poulose <suzuki.poulose@arm.com>
Cc:     Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>,
        Denis Nikitin <denik@chromium.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        linux-arm-msm@vger.kernel.org, coresight@lists.linaro.org,
        linux-kernel@vger.kernel.org, Stephen Boyd <swboyd@chromium.org>,
        linux-arm-kernel@lists.infradead.org,
        Mike Leach <mike.leach@linaro.org>
Subject: Re: [PATCH] coresight: etm4x: Add config to exclude kernel mode
 tracing
Message-ID: <20201016131407.GA31839@leoy-ThinkPad-X240s>
References: <20201015124522.1876-1-saiprakash.ranjan@codeaurora.org>
 <20201015160257.GA1450102@xps15>
 <CADDJ8CXS8gGuXL45vR6xiHwJhZNcUJPvHMVYSGR6LDETRPJFiQ@mail.gmail.com>
 <20201016072401.GC4646@leoy-ThinkPad-X240s>
 <f73ba98c345161f1835458182e6a0002@codeaurora.org>
 <20201016092450.GG4646@leoy-ThinkPad-X240s>
 <f6ee4156-664c-7bff-8e35-5cd1acdbaa84@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <f6ee4156-664c-7bff-8e35-5cd1acdbaa84@arm.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Fri, Oct 16, 2020 at 12:38:47PM +0100, Suzuki Kuruppassery Poulose wrote:

[...]

> > > What happens to the sysfs mode of tracing? For that we would still
> > > need a config right to exclude kernel mode tracing completely.
> > 
> > IIUC, sysfs mode and perf mode both can apply the same approach, the
> > guest OS runs a thread context for the host, so when a guest OS is
> > switched in or out, the hypervisor can save/restore the context for
> > the guest OS; thus every guest OS will have its dedicated context and
> > trace data ideally.
> 
> I don't think Guest Context is something we can support as mentioned
> above, at least for systems without sysreg access for ETMs (and virtualizing
> ETRs is a different story !)

Thanks for sharing thoughts, Suzuki.

I missed the device virtulisation.  Here should virtualize all devices
(includes CoreSight ETM/funnel/ETR/ETF)?  Or only need to virtualize
ETRs?

Obviously, this is a difficult task :)

Thanks,
Leo
