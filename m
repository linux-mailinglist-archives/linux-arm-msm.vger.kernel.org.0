Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8FA0991C0F
	for <lists+linux-arm-msm@lfdr.de>; Mon, 19 Aug 2019 06:33:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725958AbfHSEd1 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 19 Aug 2019 00:33:27 -0400
Received: from mail-pf1-f194.google.com ([209.85.210.194]:36503 "EHLO
        mail-pf1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725768AbfHSEd1 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 19 Aug 2019 00:33:27 -0400
Received: by mail-pf1-f194.google.com with SMTP id w2so404674pfi.3
        for <linux-arm-msm@vger.kernel.org>; Sun, 18 Aug 2019 21:33:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=72ELnDTzM6YoNYA5xuMcBDOagLAJM+myxC5fFXnFV48=;
        b=Z9vuTLauhILmFT4izzT0W9vrtgqP/Xr0XOa45NfzQa5oXQEh15wihhLl9XXLTBEyfS
         PGuiI5f1/qyvjSDjE7/U3rMq8VEh/8Z3XlXNAPid/v+5T/L1dckkH4m68hOzakwYsmiS
         DR4jU7yr8VWRNYqwux35MvR3ALybBBLxvrJ29v88gCnILUTZNjv07FH4zuXQZiOE4Bek
         z3AjR4vwfq3poqp2dvl0cnpg6DLBxxeI+YURikqDXfQMxaIYf4C6aFRwebA4kkbqBXYg
         K4S2rOTLfy9dpAB3cPRCdHq8mO5StS09+MNiM/OJkPQrgAKaNxuLijm3Cni0/J+X5E0K
         mUrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=72ELnDTzM6YoNYA5xuMcBDOagLAJM+myxC5fFXnFV48=;
        b=qIR2JURh6BuvDX0fGfBBCJ7DSHbDnhnIn+Pw6GIvw+jaWpvW/aHABZkfv4awVU639l
         bfGtdgEOmOIGpk6JOAAbb21J/syb4K0X73Q+EkiWUP5Mt4yJ/3liNMdBbU7NQnlRJYrt
         XNzBDOagf+Xha9Yz0PVuRiu/cubwpbvr+dE63lCsfgo463HsXnPzqKQJf/oAL/bgEzFq
         JE16zW5n4xX3lLS7RU104oQxG3H6OyrNHC3cFcVbzWOfPmoU3vP4DnovkXtPE49WLtOT
         fLTejrC0eT6Fqlo5F0eSZU00uMS8L/Aa/niR0MsPpM5fTLWBKuQ5NR+SGiYXCyTzhQvQ
         5qyg==
X-Gm-Message-State: APjAAAVtgTh1XM8xUSNo/kefvNyf1E+FVPLgiNXlMTsoQtyVa1a0Fv87
        xJiIt/NILfgCyiWfR2nuh5w1Cw==
X-Google-Smtp-Source: APXvYqx0GITYVJU0+6/P8ffsNYIHIW1krQG1LL8IcUsIyyFWccg1orw3OU3X7LPPaX0vGUeYIUGxjA==
X-Received: by 2002:a63:62c6:: with SMTP id w189mr18101877pgb.312.1566189206207;
        Sun, 18 Aug 2019 21:33:26 -0700 (PDT)
Received: from tuxbook-pro (104-188-17-28.lightspeed.sndgca.sbcglobal.net. [104.188.17.28])
        by smtp.gmail.com with ESMTPSA id f14sm15192021pfn.53.2019.08.18.21.33.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 18 Aug 2019 21:33:25 -0700 (PDT)
Date:   Sun, 18 Aug 2019 21:35:08 -0700
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Mark Brown <broonie@kernel.org>
Cc:     Andy Gross <agross@kernel.org>,
        kernel-build-reports@lists.linaro.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-arm-msm@vger.kernel.org
Subject: Re: next/master boot: 254 boots: 16 failed, 231 passed with 4
 offline, 1 untried/unknown, 2 conflicts (next-20190726)
Message-ID: <20190819043508.GY26807@tuxbook-pro>
References: <5d3aef79.1c69fb81.111b9.a701@mx.google.com>
 <20190726134843.GC55803@sirena.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190726134843.GC55803@sirena.org.uk>
User-Agent: Mutt/1.12.1 (2019-06-15)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Fri 26 Jul 06:48 PDT 2019, Mark Brown wrote:

> On Fri, Jul 26, 2019 at 05:18:01AM -0700, kernelci.org bot wrote:
> 
> The past few versions of -next failed to boot on apq8096-db820c:
> 
> >     defconfig:
> >         gcc-8:
> >             apq8096-db820c: 1 failed lab
> 
> with an RCU stall towards the end of boot:
> 
> 00:03:40.521336  [   18.487538] qcom_q6v5_pas adsp-pil: adsp-pil supply px not found, using dummy regulator
> 00:04:01.523104  [   39.499613] rcu: INFO: rcu_preempt detected stalls on CPUs/tasks:
> 00:04:01.533371  [   39.499657] rcu: 	2-...!: (0 ticks this GP) idle=9ca/1/0x4000000000000000 softirq=1450/1450 fqs=50
> 00:04:01.537544  [   39.504689] 	(detected by 0, t=5252 jiffies, g=2425, q=619)
> 00:04:01.541727  [   39.513539] Task dump for CPU 2:
> 00:04:01.547929  [   39.519096] seq             R  running task        0   199    198 0x00000000
> 
> Full details and logs at:
> 
> 	https://kernelci.org/boot/id/5d3aa7ea59b5142ba868890f/
> 
> The last version that worked was from the 15th and there seem to be
> similar issues in mainline since -rc1.

As you might have seen this problem has come and gone on the
apq8096-db820c and I've finally managed to narrow it down a little bit.

The problem first appears on next-20190701, with the introduction of
CONFIG_RANDOMIZE_BASE in the defconfig, but after further efforts I've
concluded that disabling kpti removes or hides the problem.

With kpti=no on the command line I've now successfully booted the db820c
100+ times without problems (a clear improvement from the 75% failure
rate with kpti=yes).


Unfortunately I'm not yet certain why this is causing issues and I'm
also seeing the same rcu stall on SDA845 under certain (erroneous?)
conditions (where I don't expect them). 

Regards,
Bjorn
