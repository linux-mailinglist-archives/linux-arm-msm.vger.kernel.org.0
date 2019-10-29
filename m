Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 113BBE8E7B
	for <lists+linux-arm-msm@lfdr.de>; Tue, 29 Oct 2019 18:41:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729927AbfJ2RlJ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 29 Oct 2019 13:41:09 -0400
Received: from mail-pg1-f196.google.com ([209.85.215.196]:40856 "EHLO
        mail-pg1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727726AbfJ2RlJ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 29 Oct 2019 13:41:09 -0400
Received: by mail-pg1-f196.google.com with SMTP id 15so10066599pgt.7
        for <linux-arm-msm@vger.kernel.org>; Tue, 29 Oct 2019 10:41:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=7xSEaHgPrL2UMVtxpL/QZyWiD7SSfTEWfSkyz0gH5eU=;
        b=wnTqEjP2Tr9b5JhJyLAz1L4c7C4QhzqJWcOY+tdXJYJElTH10oMGQKbeC8gEGeBUQ5
         +ZvVFkcSODbxuaTDpe6rNxjMftbhaKWI67YeVSEffZFgXWUNmPRKLIjG3PsgaBf5EBsV
         CDiIZGcJ4ucM39YfWheBfyk+rAm84/Nfl5TauR91/IC9moGCnGEC46jgKz0OWmH+6/H/
         8WDG665mJuuBWFUwhDE8IbfluKH90ODUX8xAIuMYVFnrxWvxdEkko0n3eoOVsFHoOUjP
         uvH16Yh2SRkrErzDMgMm8PcAS0FF7bpOp7W0rB7eEHO6fZ8ebQoF/dmUEFxfKFhH56V+
         Mzmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=7xSEaHgPrL2UMVtxpL/QZyWiD7SSfTEWfSkyz0gH5eU=;
        b=rkAnzmSuBQg9z/Rpv9h+sBRIHPZpm0qBUsqzNmb6V+NjritoVCKG6eBs/yabO0Dbb8
         mBtkcLRQcdxCid7rhmgwClLP2WBuK/7pTI2oWo4RX+9YY7ulp64HQ7Llze6yxg2ndmz2
         YarQJWnXvjyQTE/YcQ9xFuCbGHH2nQCQ6IWEKC5lfzRkZOTqCOBd85F4bq+ZG15pBNxd
         W0HT9IpOIGJEyNQcx+oqSWiqeydxgIvAVDBDx+QmExDpkfF/N66AAWxbBPg2keNGGs7h
         V0ssZEVVymlZ+J95jQwO+rq1w27LAMovRlU9dIgn/fWju9B8NDteR5Sb9XpbMB81CRmV
         VuXA==
X-Gm-Message-State: APjAAAXP0o5Mg/OgZNoMJs3xikF4nzai9dCos1iM46yrCey1DfnDrdIH
        2FeVbilyztcHc/Spa4MhrGN2HA==
X-Google-Smtp-Source: APXvYqyd4hqnHPf92+j9leQi9Xj5QEv/PWa7fTRzsFDdaeWRUCsbNJ3+iDfBuDtveWhmFNd+HdMKNQ==
X-Received: by 2002:a17:90a:5d04:: with SMTP id s4mr8087919pji.125.1572370868152;
        Tue, 29 Oct 2019 10:41:08 -0700 (PDT)
Received: from minitux (104-188-17-28.lightspeed.sndgca.sbcglobal.net. [104.188.17.28])
        by smtp.gmail.com with ESMTPSA id h186sm17651256pfb.63.2019.10.29.10.41.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Oct 2019 10:41:07 -0700 (PDT)
Date:   Tue, 29 Oct 2019 10:41:05 -0700
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Will Deacon <will@kernel.org>
Cc:     Catalin Marinas <catalin.marinas@arm.com>,
        Suzuki K Poulose <suzuki.poulose@arm.com>,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, stable@vger.kernel.org,
        Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH v2] arm64: cpufeature: Enable Qualcomm Falkor/Kryo errata
 1003
Message-ID: <20191029174105.GZ571@minitux>
References: <20191029171539.1374553-1-bjorn.andersson@linaro.org>
 <20191029173915.GC13281@willie-the-truck>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191029173915.GC13281@willie-the-truck>
User-Agent: Mutt/1.12.2 (2019-09-21)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue 29 Oct 10:39 PDT 2019, Will Deacon wrote:

> On Tue, Oct 29, 2019 at 10:15:39AM -0700, Bjorn Andersson wrote:
> > With the introduction of 'cce360b54ce6 ("arm64: capabilities: Filter the
> > entries based on a given mask")' the Qualcomm Falkor/Kryo errata 1003 is
> > no long applied.
> > 
> > The result of not applying errata 1003 is that MSM8996 runs into various
> > RCU stalls and fails to boot most of the times.
> > 
> > Give 1003 a "type" to ensure they are not filtered out in
> > update_cpu_capabilities().
> > 
> > Fixes: cce360b54ce6 ("arm64: capabilities: Filter the entries based on a given mask")
> > Cc: stable@vger.kernel.org
> > Reported-by: Mark Brown <broonie@kernel.org>
> > Suggested-by: Will Deacon <will@kernel.org>
> > Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
> > ---
> > 
> > Changes since v1:
> > - s/ARM64_CPUCAP_SCOPE_LOCAL_CPU/ARM64_CPUCAP_LOCAL_CPU_ERRATUM/
> > - Dropped 1009 "fix" as it already had a type from ERRATA_MIDR_RANGE_LIST()
> > 
> >  arch/arm64/kernel/cpu_errata.c | 1 +
> >  1 file changed, 1 insertion(+)
> > 
> > diff --git a/arch/arm64/kernel/cpu_errata.c b/arch/arm64/kernel/cpu_errata.c
> > index df9465120e2f..3facd5ca52ed 100644
> > --- a/arch/arm64/kernel/cpu_errata.c
> > +++ b/arch/arm64/kernel/cpu_errata.c
> > @@ -780,6 +780,7 @@ const struct arm64_cpu_capabilities arm64_errata[] = {
> >  	{
> >  		.desc = "Qualcomm Technologies Falkor/Kryo erratum 1003",
> >  		.capability = ARM64_WORKAROUND_QCOM_FALKOR_E1003,
> > +		.type = ARM64_CPUCAP_LOCAL_CPU_ERRATUM,
> >  		.matches = cpucap_multi_entry_cap_matches,
> >  		.match_list = qcom_erratum_1003_list,
> >  	},
> > -- 
> > 2.23.0
> 
> Thanks, I'll pick this up as a fix.
> 

Thank you!
