Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3805C28FF08
	for <lists+linux-arm-msm@lfdr.de>; Fri, 16 Oct 2020 09:24:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2404540AbgJPHYH (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 16 Oct 2020 03:24:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44658 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2404529AbgJPHYH (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 16 Oct 2020 03:24:07 -0400
Received: from mail-pf1-x444.google.com (mail-pf1-x444.google.com [IPv6:2607:f8b0:4864:20::444])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 14CF7C0613CF
        for <linux-arm-msm@vger.kernel.org>; Fri, 16 Oct 2020 00:24:07 -0700 (PDT)
Received: by mail-pf1-x444.google.com with SMTP id 10so968225pfp.5
        for <linux-arm-msm@vger.kernel.org>; Fri, 16 Oct 2020 00:24:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=6rJmZWsTC3tZunlzMkeAL6DveINrC2rCniEtmBwJZXY=;
        b=QJSTV0vmxfvJQ+ezN1zSW/4ZDFdXSn2/+t4oCXg78Y1zZrCuNGLvyPvs9iYf5Qvx/i
         XMcFDmFUdD72lSwDB+vrYJlCQ1+m2nqMPTMJtWGnSmHs4kmyOqARDhMCz3LZ7kj0ceyH
         61aR5GkEGi8OxyNjWNiGLyrooObfSzr4GflwEZfLibA1wtZSb/muQx7Ps6I50NdiDTzp
         aUCWio+mlTbSbDIZdjOTg7Qzf6N8CrYvhxJDkn34SvbIAO1CKnlDyCb8dHLwECrp0to7
         Iibo76lGBXZyYe9WQMixuMZo6TqOAqA3+EOlzrPzrcCIEEPmhjUUUS2A9iHctYSmMD7o
         k6tQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=6rJmZWsTC3tZunlzMkeAL6DveINrC2rCniEtmBwJZXY=;
        b=lOnp6bMCUqM3rhckTuaRBORL3GWbelcBBEnNVsuMqkUAzP6j/8U+YB/uke6O2wtssr
         iDY+pi3YPoMex5avKzBuU9K7WUrOo8zMXRWLXZBAwRP5p2hLbGwnesuSJm4OXOVJgwMf
         toMen3qHJlIW8qRBKfnnexsWi1/Rjuab6oZ/9wuNiGzz1jiBbdNyCRov2rM3DrwXkuCh
         T0h4A3popNIXJ8IB7M3pBOBEmGhuqOmW6KM9cel06WX1jrLXVUM5uMo7RWbddQjKviim
         IBWc6RwpBw8k6ZQXeIiNjliE4KBHdS1mqdNOEqt8dGmENiVTI8nZvhH0gdg8AlCRxIJ3
         ep4g==
X-Gm-Message-State: AOAM532xsApW1DhbdMBiJ/sWQwImF1iTNALMe7D4jb1Zeikqp+KQjjE5
        fzaP33x/vOhUeSH2l7+MHQLq+w==
X-Google-Smtp-Source: ABdhPJwUWPGICoFq9SFicWYImHXUPoyuhFpWAGUJwIWPJ+ED/XYFz6/H/JF/bR5CuhfixOWgV5UDqw==
X-Received: by 2002:a62:37c4:0:b029:155:ebd8:304c with SMTP id e187-20020a6237c40000b0290155ebd8304cmr2585815pfa.73.1602833046302;
        Fri, 16 Oct 2020 00:24:06 -0700 (PDT)
Received: from leoy-ThinkPad-X240s ([64.120.119.108])
        by smtp.gmail.com with ESMTPSA id c15sm1586586pgg.77.2020.10.16.00.24.03
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 16 Oct 2020 00:24:05 -0700 (PDT)
Date:   Fri, 16 Oct 2020 15:24:01 +0800
From:   Leo Yan <leo.yan@linaro.org>
To:     Denis Nikitin <denik@chromium.org>
Cc:     Mathieu Poirier <mathieu.poirier@linaro.org>,
        Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>,
        linux-arm-msm@vger.kernel.org, coresight@lists.linaro.org,
        linux-kernel@vger.kernel.org, Stephen Boyd <swboyd@chromium.org>,
        linux-arm-kernel@lists.infradead.org,
        Mike Leach <mike.leach@linaro.org>
Subject: Re: [PATCH] coresight: etm4x: Add config to exclude kernel mode
 tracing
Message-ID: <20201016072401.GC4646@leoy-ThinkPad-X240s>
References: <20201015124522.1876-1-saiprakash.ranjan@codeaurora.org>
 <20201015160257.GA1450102@xps15>
 <CADDJ8CXS8gGuXL45vR6xiHwJhZNcUJPvHMVYSGR6LDETRPJFiQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CADDJ8CXS8gGuXL45vR6xiHwJhZNcUJPvHMVYSGR6LDETRPJFiQ@mail.gmail.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu, Oct 15, 2020 at 11:40:05PM -0700, Denis Nikitin wrote:
> Hi Mathieu,
> 
> I think one of the use cases could be VMs.
> Is there isolation between EL1 guest kernels which we can control from perf
> in a system wide mode?

Sorry for suddenly jumping in.

For KVM, I think we need to implement mechanism for saving/restoring
CoreSight context for every guest OS, the CPU PMUs has implemented
related features [1].

Thanks,
Leo

[1] https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/arch/arm64/kvm/pmu.c
