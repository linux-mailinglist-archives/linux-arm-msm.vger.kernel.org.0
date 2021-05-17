Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F0A8838226C
	for <lists+linux-arm-msm@lfdr.de>; Mon, 17 May 2021 02:59:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231521AbhEQBAa (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 16 May 2021 21:00:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56918 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231491AbhEQBA3 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 16 May 2021 21:00:29 -0400
Received: from mail-pg1-x52e.google.com (mail-pg1-x52e.google.com [IPv6:2607:f8b0:4864:20::52e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D3697C061573
        for <linux-arm-msm@vger.kernel.org>; Sun, 16 May 2021 17:59:11 -0700 (PDT)
Received: by mail-pg1-x52e.google.com with SMTP id t30so3514962pgl.8
        for <linux-arm-msm@vger.kernel.org>; Sun, 16 May 2021 17:59:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=ANkYnem2igzEfr34lf0bWQfWO8rn1biLX4pTs2vIelE=;
        b=Oy4YpkMC6kL/1rEOyL11BEFzYzBYcifbZ28dhgYgYByQXG7loqbvCV8B0qtSC1IybD
         pqMlIbQ2itJQgJyWDtjuwn+pr9zJdZ5uvRPlxloumec2ZU9VKQtSFLo9+4nb71Tb/BLW
         jocglSfNOZzNKSPB0upRaQYI/aquzCNo1N94FlgrBohZXCpYDxSZAla2zJvQF4tt9b/1
         w+i3dgoOWmS+KVD9xA9kOvqFr5UM4RUdg+I979u7suzIZY1CPekBcSTdTWPVmgaMBOD/
         NwsFKLp9c52GSb98Ss8L2klMDBM5F+SceBFpIC3vEJyNH5g7qnP+7tEeMh/eZK7bhIzm
         GHiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=ANkYnem2igzEfr34lf0bWQfWO8rn1biLX4pTs2vIelE=;
        b=Khoawla3V7hWM1300yvQIn7vhDvC7X4FF5T8lxIIeZGRQlE8pPy51eW5bsyBkhJ6Q6
         JodFKwpJc/QUcHBnNl6itqDCXhNn/sKmOoUNtArgPQP7edtfuCogUERWj725nTOfN/hc
         vJJ+wXwedS5wADKs+teXf0CbvYYrJo/tl3aaU220lMIBxd+wlJHUAMTaDNjAJvLnDT2I
         d0IH+uaGJEyOSqUVN2AXHecFxqjl/ilrEvS4ZXIISGSDyCBsmDCC82RrXCZ6OdglVYT5
         djLVeHMPSHYxzGYgDHOwYKi6k+KyNobO2BXHK/6yyhlICtB+fznixzTObNOZW6ULX2O3
         huVQ==
X-Gm-Message-State: AOAM531oYGBqLNhE/YF2Rhd8dEiNgwszNGMrS8sPPapkcBzZ3H1Jhc0O
        UrRNyD0eQ1j07KUoCPPNknEpIA==
X-Google-Smtp-Source: ABdhPJzLGwP1y+N/BkES4LzGeZ0jZ19k0n5ykMvcpwJIFcCTOuwnK4pW6TqMNImRjZMVIjPJ8FIB/Q==
X-Received: by 2002:a05:6a00:1687:b029:253:f417:4dba with SMTP id k7-20020a056a001687b0290253f4174dbamr57212226pfc.5.1621213151386;
        Sun, 16 May 2021 17:59:11 -0700 (PDT)
Received: from dragon (80.251.214.228.16clouds.com. [80.251.214.228])
        by smtp.gmail.com with ESMTPSA id h22sm8562878pfn.55.2021.05.16.17.59.08
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 16 May 2021 17:59:10 -0700 (PDT)
Date:   Mon, 17 May 2021 08:59:04 +0800
From:   Shawn Guo <shawn.guo@linaro.org>
To:     Ard Biesheuvel <ardb@kernel.org>,
        Maximilian Luz <luzmaximilian@gmail.com>
Cc:     Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>,
        Jeffrey Hugo <jhugo@codeaurora.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        linux-efi <linux-efi@vger.kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH] arm64: efi: add check for broken efi poweroff
Message-ID: <20210517005903.GA15021@dragon>
References: <20210305065120.11355-1-shawn.guo@linaro.org>
 <CAMj1kXHOXOX6V735tLPxcVUAAM0AeZkLKyOUDKTPvazLjjrQ6Q@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMj1kXHOXOX6V735tLPxcVUAAM0AeZkLKyOUDKTPvazLjjrQ6Q@mail.gmail.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

+ Maximilian

On Fri, Mar 05, 2021 at 08:01:02AM +0100, Ard Biesheuvel wrote:
> On Fri, 5 Mar 2021 at 07:51, Shawn Guo <shawn.guo@linaro.org> wrote:
> >
> > Poweroff via UEFI Runtime Services doesn't always work on every single
> > arm64 machine.  For example, on Lenovo Flex 5G laptop, it results in
> > a system reboot rather than shutdown.  Add a DMI check to keep such
> > system stay with the original poweroff method (PSCI).
> >
> > Signed-off-by: Shawn Guo <shawn.guo@linaro.org>
> 
> What is the point of using EFI runtime services on this machine if
> poweroff doesn't work either? Can't we just boot this thing with
> efi=noruntime?

Ard,

With Maximilian playing ACPI kernel on Microsoft Surface Pro X, this
ResetSystem service issue triggers more discussion and testing [1].
Maximilian tested it with uefi-test-runner and reported that ResetSystem
actually works [2].

Looking at the kernel dump, I'm wondering if it's because that kernel
calls into the services with assuming they are in virtual addressing
mode, while actually they are in flat physical mode instead, due to
that SetVirtualAddressMap() call is skipped (efi_novamap).

Shawn

[1] https://github.com/Sonicadvance1/linux/issues/27#issuecomment-836103896
[2] https://github.com/Sonicadvance1/linux/issues/27#issuecomment-837184892
