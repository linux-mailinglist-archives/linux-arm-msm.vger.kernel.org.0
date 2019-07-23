Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id AB5507192E
	for <lists+linux-arm-msm@lfdr.de>; Tue, 23 Jul 2019 15:28:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731442AbfGWN23 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 23 Jul 2019 09:28:29 -0400
Received: from mail-pg1-f193.google.com ([209.85.215.193]:43178 "EHLO
        mail-pg1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731095AbfGWN23 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 23 Jul 2019 09:28:29 -0400
Received: by mail-pg1-f193.google.com with SMTP id f25so19430511pgv.10;
        Tue, 23 Jul 2019 06:28:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=chWP9LaVBb836yc/U3pqKBmIvWdwOkmxAAs2bRxtFvw=;
        b=EPi3Dkd8v/VtsrHLzX7ap6XGP0FBARnBudXPyGak7HIGeeP0DQgP6QZo/or50iOxWk
         09AytT6G0LogTTAUQbor/BUlMSMnqGu61cebV9+w6PdxzSFzlK+tp3YM0kzYX3g1e1jb
         hEm/pPKQSC37mc2D1XXRyiLL0bOtsRym7zdxgypStpQDNns7vODvU00shptG9Ice8fO+
         dden0FhCoJmuUx7zPLkQsf9uZWCEs7V51R3V51gLc13ATPBtoQ7gS1u9Aia52jX0VjeI
         KXBMe7urT0Y4/phuJaqXKlQBiD5bdnVxdg/NMRnEe3h8QsXx/UUXLrEmC6jhNta8TZjX
         064Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=chWP9LaVBb836yc/U3pqKBmIvWdwOkmxAAs2bRxtFvw=;
        b=BXIo8oaNtJTrkwVnONpR/H8yF+8dUi9bXTXUO6HIFBS7IP8HvNfAXLOmHZx68TS0qu
         KxK0zYXzOLfBb+dWoeF87/1aBeUPLKNnEPx5CwQV+Vwg/KvVz7xYdtZkj+rk2gS13cCH
         Sewp7G3KN9bkCgPDlSOqrFy3ZZDDVl72U3AAamHPcMxnDRjUSS0hnpkcfJBewavvNBRj
         ZigkqpUk4yZfEVulx7EthOUWyO/27FLLlTjXyfvqjo6AtHwWSGho44uPasYWyqSEOVAU
         ipS3tUXdg9FNXA7/dB9lIuLU+4pfS4WhA429u155sMBzqu64ovvxYC3CL0N8ACF9aw6P
         zWhQ==
X-Gm-Message-State: APjAAAVRXMJQ942+wmLQrT1xsIuCPoMGHOVoPLxVmF8jkx6ni8hRdzRh
        Ju9xRAGQtoOGwOIgaTfKJ98=
X-Google-Smtp-Source: APXvYqz3X/UAUv4paE8QYBDSGI/zMotmoIMk0BoKtNIzOWIkcDGtI1s1U3iatxn6YH3ZETfaRIRBow==
X-Received: by 2002:a63:c84d:: with SMTP id l13mr71688713pgi.154.1563888508740;
        Tue, 23 Jul 2019 06:28:28 -0700 (PDT)
Received: from localhost ([123.213.206.190])
        by smtp.gmail.com with ESMTPSA id h1sm53656426pfo.152.2019.07.23.06.28.27
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 23 Jul 2019 06:28:27 -0700 (PDT)
Date:   Tue, 23 Jul 2019 22:28:25 +0900
From:   Minwoo Im <minwoo.im.dev@gmail.com>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     Christoph Hellwig <hch@lst.de>,
        Marc Gonzalez <marc.w.gonzalez@free.fr>,
        MSM <linux-arm-msm@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>,
        Andy Gross <agross@kernel.org>,
        Stanimir Varbanov <svarbanov@mm-sol.com>,
        Rob Clark <robdclark@gmail.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Minwoo Im <minwoo.im.dev@gmail.com>
Subject: Re: [PATCH] firmware: qcom_scm: fix error for incompatible pointer
Message-ID: <20190723132825.GA7148@minwoo-desktop>
References: <20190719134303.7617-1-minwoo.im.dev@gmail.com>
 <7ea51e42-ab8a-e4e2-1833-651e2dabca3c@free.fr>
 <20190722093059.GA29538@lst.de>
 <20190722151234.GJ7234@tuxbook-pro>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20190722151234.GJ7234@tuxbook-pro>
User-Agent: Mutt/1.11.4 (2019-03-13)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

> > > > We just can cast phys_addr_t to dma_addr_t here.
> > > 
> > > IME, casting is rarely a proper solution.
> > 
> > *nod*
> > 
> > ptr_phys probably should be a dma_addr_t.  Unless this driver is so
> > magic that it really wants a physical and not a dma address, in which
> > case it needs to use alloc_pages instead of dma_alloc_coherent
> > and then call page_to_phys on the returned page, and a very big comment
> > explaining why it is so special.
> 
> The scm call takes physical addresses (which happens to be 1:1 with DMA
> addresses for this driver).
> 
> This allocation started off (downstream) as a simple kmalloc(), but
> while the scm call is being executed an access from Linux will cause a
> security violation (that's not handled gracefully). The properties of
> dma_alloc is closer, so that's where the code is today.
> 
> Optimally this should be something like alloc_pages() and some mechanism
> for unmapping the pages during the call. But no one has come up with a
> suitable patch for that.
> 
> 
> But there's a patch from Stephen for this already (not doing a
> typecast).  Apparently I missed merging this, so I'll do that.
> 
> https://lore.kernel.org/linux-arm-msm/20190517210923.202131-2-swboyd@chromium.org/

Bjron,

I appreciate for checking this.  And also thanks all you guys for the
comments here!

Thanks,
