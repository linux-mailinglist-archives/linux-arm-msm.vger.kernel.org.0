Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id DBC7AE8E04
	for <lists+linux-arm-msm@lfdr.de>; Tue, 29 Oct 2019 18:24:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726321AbfJ2RYh (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 29 Oct 2019 13:24:37 -0400
Received: from mail-pl1-f193.google.com ([209.85.214.193]:36340 "EHLO
        mail-pl1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725870AbfJ2RYh (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 29 Oct 2019 13:24:37 -0400
Received: by mail-pl1-f193.google.com with SMTP id g9so7358599plp.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 29 Oct 2019 10:24:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to
         :user-agent;
        bh=D988j7nxePJvhbrARcDGhWwamnWrYkBVzSnWRIC5KfI=;
        b=xYlRm4ukFhyZyY8yGMyhb9fCZy4Sypc+bwJb/yS5r1Xqo8fiyDFKw295jEd1AzGhIt
         N2SUI+ob8lY7eJV6MMkP6s66E7w8NsTySgW/k7+uVJrFGQ3Owa8Jy0W697G0fB8+Gq3D
         A9lhs5D2EUmeXE4FVENWdKkFaUjRE3PAPwCoBMiuhcB5V5z87LZyFaYPPzp6TX4Dtjgb
         mBxP+++NODKRl1fjWLQDsR/t0mQn7uqw7zGeN9rz2D73eEvrNsD4WU0SThjGh4v+2E0N
         RJ/CRwTo+kdRKrI/wh81tBP+P5rGE3zXKrlhIOM8OtfbPiLx5Ih2MsBBORlozoWy6eLT
         JqvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to:user-agent;
        bh=D988j7nxePJvhbrARcDGhWwamnWrYkBVzSnWRIC5KfI=;
        b=Tug4FR6/zX9yj45KZEew4IDY1fBAK0t6UCKUICHSpo/8rMd//aYovYW08gjux46QMW
         YvIUBJtZEdzXDIrSuRthA3uCirRUKHdKaF8TuJbglKAX485xs42NiZNKG5I3mwrkRdvQ
         towwwsVnvZ4RBy9JDmUmZlnrLMqjooPQla4XDb7xT1McxPj/ncvegVRdXINIJDI5U/yN
         nKHoiIc2zAlYN+wk69G6S8smxOnqXLMzb6l0QYpQTD/74bGXRU5GW0v4VR6fsRKpjRmE
         gpgvYMZ3cTHcbAi9WP6qbnnOQcnp2VJWyND/F101FWgDPOsWDPyAof/vSzCGmtInGQ3q
         vU+Q==
X-Gm-Message-State: APjAAAV5zHI3wWpwD6l1lNEZk/sUaeAQxMK18+paaV90jRAxvRMg3u4Z
        6hZn3sSjpxcZrmGOU21qTaXbAw==
X-Google-Smtp-Source: APXvYqwb/AiauyxMbmB6UShIuFo/DUzUsBmBhxbUgEo7JDSSYS/27dWFw9Km+BO5e2aT7ZNARHN3jg==
X-Received: by 2002:a17:902:9b93:: with SMTP id y19mr5168098plp.96.1572369874655;
        Tue, 29 Oct 2019 10:24:34 -0700 (PDT)
Received: from minitux (104-188-17-28.lightspeed.sndgca.sbcglobal.net. [104.188.17.28])
        by smtp.gmail.com with ESMTPSA id t1sm4288687pgp.9.2019.10.29.10.24.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Oct 2019 10:24:33 -0700 (PDT)
Date:   Tue, 29 Oct 2019 10:24:31 -0700
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Will Deacon <will@kernel.org>
Cc:     Jeffrey Hugo <jhugo@codeaurora.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH] arm64: cpufeature: Enable Qualcomm Falkor errata 1009
 for Kryo
Message-ID: <20191029172431.GY571@minitux>
References: <20191029060604.1208925-1-bjorn.andersson@linaro.org>
 <20191029115008.GD12103@willie-the-truck>
 <16ccb343-8253-0224-e957-c73f51f110a1@codeaurora.org>
 <d9700408-b11e-b5c8-db9d-f70ccd1bde73@codeaurora.org>
 <20191029171149.GB13281@willie-the-truck>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20191029171149.GB13281@willie-the-truck>
User-Agent: Mutt/1.12.2 (2019-09-21)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue 29 Oct 10:11 PDT 2019, Will Deacon wrote:

> On Tue, Oct 29, 2019 at 09:07:53AM -0600, Jeffrey Hugo wrote:
> > On 10/29/2019 7:44 AM, Jeffrey Hugo wrote:
> > > On 10/29/2019 4:50 AM, Will Deacon wrote:
> > > > On Mon, Oct 28, 2019 at 11:06:04PM -0700, Bjorn Andersson wrote:
> > > > > The Kryo cores share errata 1009 with Falkor, so add their model
> > > > > definitions and enable it for them as well.
> > > > > 
> > > > > Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
> > > > > ---
> > > > >   arch/arm64/include/asm/cputype.h | 4 ++++
> > > > >   arch/arm64/kernel/cpu_errata.c   | 2 ++
> > > > >   2 files changed, 6 insertions(+)
> > > > > 
> > > > > diff --git a/arch/arm64/include/asm/cputype.h
> > > > > b/arch/arm64/include/asm/cputype.h
> > > > > index b1454d117cd2..8067476ea2e4 100644
> > > > > --- a/arch/arm64/include/asm/cputype.h
> > > > > +++ b/arch/arm64/include/asm/cputype.h
> > > > > @@ -84,6 +84,8 @@
> > > > >   #define QCOM_CPU_PART_FALKOR_V1        0x800
> > > > >   #define QCOM_CPU_PART_FALKOR        0xC00
> > > > >   #define QCOM_CPU_PART_KRYO        0x200
> > > > > +#define QCOM_CPU_PART_KRYO_GOLD        0x211
> > > > > +#define QCOM_CPU_PART_KRYO_SILVER    0x205
> > > 
> > > These are not Kryo part numbers (8998+).  They are Hydra ones.
> > > 
> > > > 
> > > > Can you double-check this, please? My Pixel-1 phone claims something with
> > > > 0x201, but I don't know if that's what you were aiming for. It would be
> > > > great if Qualcomm could document these register fields somewhere,
> > > > especially
> > > > since we're trying to work around their hardware errata for them.
> > > 
> > > I wish I could point you to public documentation.  I don't happen to
> > > know where it is.  As far as 8996 goes, there are quite a few part
> > > numbers.  The ones I could find are:
> > > 201
> > > 205
> > > 211
> > > 241
> > > 251
> > > 
> > > 281 happens to be QDF2432
> > 
> > From asking around, I found someone in the know.  We don't have public
> > documentation, but I can follow up to try to create something - its likely
> > going to take a bit.  I was given the following information to share.  This
> > is specific to Hydra only-
> > 
> > MIDR[15:12] = PART[11:8]
> > Hydra and technology node differentiator (0x1 = Hydra 16nm; 0x2 = Hydra
> > 14nm; 0x3 = Hydra 10nm)
> > 
> > MIDR[11:10] = PART[7:6]
> > This corresponds to the cluster revision number
> > 
> > MIDR[9:8] = PART[5:4]
> > Technology variant within the node
> > 
> > MIDR[7:6] = PART[3:2]
> > 0b00 = 512KB L2
> > 0b01 = 1MB L2
> > 0b10 = 2MB L2
> > 0b11 = 4MB L2
> > 
> > MIDR[5:4] = PART[1:0]
> > 0b00 = uni-core
> > 0b01 = dual-core cluster
> > 0b10 = tri-core cluster
> > 0b11 = quad-core cluster
> 
> Thanks for digging up the details, Jeffrey. As far as I can tell, our
> 'is_kryo_midr()' function will return 'true' for all of these, so I think
> that's what we should be using for this erratum workaround. Would that work
> for you?
> 

Yes, I agree. There's a fair amount of variants involved, so let's go
for is_kryo_midr() (which should be is_hydra_midr()).

Regards,
Bjorn
