Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 458EF32F929
	for <lists+linux-arm-msm@lfdr.de>; Sat,  6 Mar 2021 10:46:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229672AbhCFJpx (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 6 Mar 2021 04:45:53 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55708 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229662AbhCFJph (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 6 Mar 2021 04:45:37 -0500
Received: from mail-pj1-x1030.google.com (mail-pj1-x1030.google.com [IPv6:2607:f8b0:4864:20::1030])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 76D34C061760
        for <linux-arm-msm@vger.kernel.org>; Sat,  6 Mar 2021 01:45:25 -0800 (PST)
Received: by mail-pj1-x1030.google.com with SMTP id q6-20020a17090a4306b02900c42a012202so491607pjg.5
        for <linux-arm-msm@vger.kernel.org>; Sat, 06 Mar 2021 01:45:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=OrPR8SCgp/TDBWi7TQcMhS3IkX8qoHvZgwUCqJ/NqdI=;
        b=VRreclAG1k+qmJNdv7UCkdEcWxdRgIfw2KSUezw924U3rjLMNqMTDHdg1v44ppVbr3
         buAc14quQHiobY0ltDDBCIBL/eEY4D880Eyx6ukMYOzN1mXqVVJpd5ue+4H25bTFqqZ7
         O3/wkdGUiRkZJMtPsd83OIU3uB6EAfawWEEC3ro3EnUURtiFx0rfeer0J2Hce1LZB4EP
         GHCPkwSx760blDs3L84B1FADusrcw0Gqi1xlpSltBqaKmh7fqi5urGVW7wA2Hf9ppBGY
         3iVDz+f9NMgy/bNxGNwJDpjiJCe81q6D/15WClkIFl0TDVxFDgVkZaNkbSqpvIVIch+x
         +jCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=OrPR8SCgp/TDBWi7TQcMhS3IkX8qoHvZgwUCqJ/NqdI=;
        b=hUX6rYl64vNDLa+b4mjqqvzQ2Uhqi6UtWefUF4h76rTke72sWvFu1sA4qkJzvQVMT/
         7APqzHL1gMBZDwC0UBehC31nDz6qdbxBhAqbHuyglB5gPFKb2ZvwUozsAyfsCWBJF3zE
         C+qZpK6i8djFU9Xtziv1U0fxm3wvfdSjP7DbFrRyhPMj3TQj/f4d78xoZawB5Z60ogom
         PWLXOaA39K4ItlxbO8M5Rl3bpkO1/zwzb4l4ZbaziTxlOT2edD+mKQL2hyjh/jexFZK7
         wb5kiRIdS/aJmwkDfjmDyx9mwiyNHzyzLXdMZsFVTsWBquOiqVh1LDO03hWaerW6KomE
         ec/w==
X-Gm-Message-State: AOAM531aLPBQ4MkA1w9DL6Kq6s/W14niYiLW2Rnbe3x/WUrJVO6luKcH
        dbxh5ToW+CdCRtURJooix5VazA==
X-Google-Smtp-Source: ABdhPJww6KoYOO4ImE2czyutBV0PbuLHuBQcrCidHeKDkwgK+a87ViuaTr0ShjnDZt5YWmStw5MrNw==
X-Received: by 2002:a17:902:768b:b029:e3:fb85:1113 with SMTP id m11-20020a170902768bb02900e3fb851113mr12606639pll.3.1615023925014;
        Sat, 06 Mar 2021 01:45:25 -0800 (PST)
Received: from dragon (80.251.214.228.16clouds.com. [80.251.214.228])
        by smtp.gmail.com with ESMTPSA id e1sm4573038pjt.10.2021.03.06.01.45.22
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sat, 06 Mar 2021 01:45:24 -0800 (PST)
Date:   Sat, 6 Mar 2021 17:45:18 +0800
From:   Shawn Guo <shawn.guo@linaro.org>
To:     Ard Biesheuvel <ardb@kernel.org>
Cc:     linux-efi@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        Jeffrey Hugo <jhugo@codeaurora.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Clark <robdclark@gmail.com>,
        Leif Lindholm <leif@nuviainc.com>,
        linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH 1/1] efi: stub: omit SetVirtualAddressMap() if marked
 unsupported in RT_PROP table
Message-ID: <20210306094517.GN17424@dragon>
References: <20210305093958.187358-1-ardb@kernel.org>
 <20210305093958.187358-2-ardb@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210305093958.187358-2-ardb@kernel.org>
User-Agent: Mutt/1.9.4 (2018-02-28)
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Fri, Mar 05, 2021 at 10:39:58AM +0100, Ard Biesheuvel wrote:
> The EFI_RT_PROPERTIES_TABLE contains a mask of runtime services that are
> available after ExitBootServices(). This mostly does not concern the EFI
> stub at all, given that it runs before that. However, there is one call
> that is made at runtime, which is the call to SetVirtualAddressMap()
> (which is not even callable at boot time to begin with)
> 
> So add the missing handling of the RT_PROP table to ensure that we only
> call SetVirtualAddressMap() if it is not being advertised as unsupported
> by the firmware.
> 
> Signed-off-by: Ard Biesheuvel <ardb@kernel.org>

On Lenovo Yoga C630 laptop:

Tested-by: Shawn Guo <shawn.guo@linaro.org>

It's a great help to dropping 'efi=novamap' kernel cmdline, which is a
very nice thing for distros to support Snapdragon laptops.

Thanks much, Ard!

Shawn
