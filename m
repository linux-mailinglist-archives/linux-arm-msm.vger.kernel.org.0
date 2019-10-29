Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9506BE8DC5
	for <lists+linux-arm-msm@lfdr.de>; Tue, 29 Oct 2019 18:11:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2390827AbfJ2RLz (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 29 Oct 2019 13:11:55 -0400
Received: from mail.kernel.org ([198.145.29.99]:46780 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2390787AbfJ2RLz (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 29 Oct 2019 13:11:55 -0400
Received: from willie-the-truck (236.31.169.217.in-addr.arpa [217.169.31.236])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 753E0204FD;
        Tue, 29 Oct 2019 17:11:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1572369114;
        bh=a8J3E226HwdH6en4L5EYVMCVtE8D6UkmSmKh15CsHkM=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=yPyaZrqI7TnypsOIHD2s0sr0X3sXzLl2lGc1Kbeo8orKWeXGHH4ILHvmzDRXhz43B
         i9h/DFmButTJM/AO+b2b90WlCcSBoX+I7bIjtXXfq4djA4rsIBdQ25KynfeO+l1VCr
         FKl5yba81M9QrkCCaM5kfWtuPF5vWDo7aPzygc6k=
Date:   Tue, 29 Oct 2019 17:11:50 +0000
From:   Will Deacon <will@kernel.org>
To:     Jeffrey Hugo <jhugo@codeaurora.org>
Cc:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH] arm64: cpufeature: Enable Qualcomm Falkor errata 1009
 for Kryo
Message-ID: <20191029171149.GB13281@willie-the-truck>
References: <20191029060604.1208925-1-bjorn.andersson@linaro.org>
 <20191029115008.GD12103@willie-the-truck>
 <16ccb343-8253-0224-e957-c73f51f110a1@codeaurora.org>
 <d9700408-b11e-b5c8-db9d-f70ccd1bde73@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <d9700408-b11e-b5c8-db9d-f70ccd1bde73@codeaurora.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue, Oct 29, 2019 at 09:07:53AM -0600, Jeffrey Hugo wrote:
> On 10/29/2019 7:44 AM, Jeffrey Hugo wrote:
> > On 10/29/2019 4:50 AM, Will Deacon wrote:
> > > On Mon, Oct 28, 2019 at 11:06:04PM -0700, Bjorn Andersson wrote:
> > > > The Kryo cores share errata 1009 with Falkor, so add their model
> > > > definitions and enable it for them as well.
> > > > 
> > > > Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
> > > > ---
> > > >   arch/arm64/include/asm/cputype.h | 4 ++++
> > > >   arch/arm64/kernel/cpu_errata.c   | 2 ++
> > > >   2 files changed, 6 insertions(+)
> > > > 
> > > > diff --git a/arch/arm64/include/asm/cputype.h
> > > > b/arch/arm64/include/asm/cputype.h
> > > > index b1454d117cd2..8067476ea2e4 100644
> > > > --- a/arch/arm64/include/asm/cputype.h
> > > > +++ b/arch/arm64/include/asm/cputype.h
> > > > @@ -84,6 +84,8 @@
> > > >   #define QCOM_CPU_PART_FALKOR_V1        0x800
> > > >   #define QCOM_CPU_PART_FALKOR        0xC00
> > > >   #define QCOM_CPU_PART_KRYO        0x200
> > > > +#define QCOM_CPU_PART_KRYO_GOLD        0x211
> > > > +#define QCOM_CPU_PART_KRYO_SILVER    0x205
> > 
> > These are not Kryo part numbers (8998+).  They are Hydra ones.
> > 
> > > 
> > > Can you double-check this, please? My Pixel-1 phone claims something with
> > > 0x201, but I don't know if that's what you were aiming for. It would be
> > > great if Qualcomm could document these register fields somewhere,
> > > especially
> > > since we're trying to work around their hardware errata for them.
> > 
> > I wish I could point you to public documentation.  I don't happen to
> > know where it is.  As far as 8996 goes, there are quite a few part
> > numbers.  The ones I could find are:
> > 201
> > 205
> > 211
> > 241
> > 251
> > 
> > 281 happens to be QDF2432
> 
> From asking around, I found someone in the know.  We don't have public
> documentation, but I can follow up to try to create something - its likely
> going to take a bit.  I was given the following information to share.  This
> is specific to Hydra only-
> 
> MIDR[15:12] = PART[11:8]
> Hydra and technology node differentiator (0x1 = Hydra 16nm; 0x2 = Hydra
> 14nm; 0x3 = Hydra 10nm)
> 
> MIDR[11:10] = PART[7:6]
> This corresponds to the cluster revision number
> 
> MIDR[9:8] = PART[5:4]
> Technology variant within the node
> 
> MIDR[7:6] = PART[3:2]
> 0b00 = 512KB L2
> 0b01 = 1MB L2
> 0b10 = 2MB L2
> 0b11 = 4MB L2
> 
> MIDR[5:4] = PART[1:0]
> 0b00 = uni-core
> 0b01 = dual-core cluster
> 0b10 = tri-core cluster
> 0b11 = quad-core cluster

Thanks for digging up the details, Jeffrey. As far as I can tell, our
'is_kryo_midr()' function will return 'true' for all of these, so I think
that's what we should be using for this erratum workaround. Would that work
for you?

Will
