Return-Path: <linux-arm-msm+bounces-31949-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id ABE5F97B937
	for <lists+linux-arm-msm@lfdr.de>; Wed, 18 Sep 2024 10:21:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3E8871F25064
	for <lists+linux-arm-msm@lfdr.de>; Wed, 18 Sep 2024 08:21:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4587117A599;
	Wed, 18 Sep 2024 08:18:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="EGog5r/M"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-f66.google.com (mail-ej1-f66.google.com [209.85.218.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0554B17967F
	for <linux-arm-msm@vger.kernel.org>; Wed, 18 Sep 2024 08:18:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.66
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726647504; cv=none; b=nKUS0e8AW77n9IhM5EMJd4QGIuYIDufEsFDwxWxFLjEcBhMMjeLhyZdzqaV8kZJ390s/t1uI+h232jXQdJ1iiH/3pdzuj6AwUdcv9ptTxxwUhrq1gOuIOJAWuD55TXCDEOmnHqsRuXXLrv6FrJoinNAidlS/rNmtjQ22L2YYbls=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726647504; c=relaxed/simple;
	bh=fl5Szw0BaQjN8co3XgZhzhJhVuUWOHhLQd8bcOW++uw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hIUP+yj2xCQY0qi6q83XqgJ4c5YMXCSyzLlrd+cacuPHYXQvf4EYo9yDB5takxDjvvb7LJGJ0s9nSvGVnfhYKj/I+kjOwxBJb4h3jsSD5Nph40IaP1io5KwXngAsoWDCG+fZDPzzgf0zC4GqYfkqYFPubqCRbY1X6MFBm1QcH/4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=EGog5r/M; arc=none smtp.client-ip=209.85.218.66
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f66.google.com with SMTP id a640c23a62f3a-a8d4979b843so888413266b.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 18 Sep 2024 01:18:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1726647499; x=1727252299; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=ADDecU6io5qXLPo72Y1njDAmtAkj5Evq/Lc+OmYs5AM=;
        b=EGog5r/MvVNvyUuv85H1Jf5O0KXZ1NFH1kT+DYGKip184z/PHQw7Vqu2Vuowx2LwyV
         OtXqXXPUKpdKWruRjXqEQoZ7uFkbPGPqcwe3mD6Ltq8U2NMHGwMNtb9/uVbTSm9OczLK
         ZpcudoP5ar7gHTUtlmpUipXKXkOoOE2NN0prKrFxmOoZ0cgCbTHbGpLSBRWYv2xvwDS3
         XlQvhV8vy6r/7zmaq7s7XzVW2ROn6yQ5ex4exOaHi6BuLxTvPNMzGb+BC0tSVViGxTg6
         o2GKVFLqetZHcK1aQKR0cGNX8KETN+xVzUr500LBc453Q8y/66ZIklJYFwHVBCmuA1zZ
         zTcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726647499; x=1727252299;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ADDecU6io5qXLPo72Y1njDAmtAkj5Evq/Lc+OmYs5AM=;
        b=dbtxo8jYxmnhK0cJ65Y8+foglB6cwCmsKherpjn1xPp8+/JWM9BFpOiWXeSyZOFoU0
         J4bwpcuiU+8d4NsRnZW41RUq7aqgYuXnkU9bTLmXdRQ7yWH8f2q6i7Sx539ttehCFGO3
         Tkcg4OU8m9l2ueIbxPc2hlBYhTKGgLwpcPF4C7G2bwJpE7/IN+ZUAOFlGFyOf93Rudvk
         F9CBtfdUlUVE9nHH65dK6TbhZJCmT9iixJdGET1hRy2BjdVsgzs5Ijy+HpSSt6o689ae
         aoZPwpdLkBW3BTc61UdxCGvzv5/FGrkNIPrwnm+DAfygXqXwXCR2txKtwizfIaqxo+Kv
         rdQg==
X-Forwarded-Encrypted: i=1; AJvYcCX7CNwIVw0KICsfsJEWfyu5FWyqbilvIelLXK9ufyzN+wc3wGiUtGSxB4EBFkSRyVTXkbdU4h7iE/jxv0qf@vger.kernel.org
X-Gm-Message-State: AOJu0YxIB0ACeCo2a/p1bv24dXXraW2jHkc13jwubHLmqIutBEi+cONH
	qjxCrA7HjZvxI7pWI/+m1jBbfvEy7+k2m0MjfbBSJXuI2pzuSMfBgJlqn7rY/7Y=
X-Google-Smtp-Source: AGHT+IGQKF2A68DlLQDzcD2GEIWf/ojqOq08unamj88s0l+BssIWLJsicrTzijNPepLnl71COH8BEA==
X-Received: by 2002:a17:907:e644:b0:a77:b4e3:4fca with SMTP id a640c23a62f3a-a902941e770mr1917846666b.9.1726647499217;
        Wed, 18 Sep 2024 01:18:19 -0700 (PDT)
Received: from linaro.org ([2a02:2454:ff21:ef80:af58:2647:ac01:c408])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a90612b4321sm546104566b.113.2024.09.18.01.18.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Sep 2024 01:18:18 -0700 (PDT)
Date: Wed, 18 Sep 2024 10:18:13 +0200
From: Stephan Gerhold <stephan.gerhold@linaro.org>
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Andrew Halaney <ahalaney@redhat.com>,
	Elliot Berman <quic_eberman@quicinc.com>,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
	Rudraksha Gupta <guptarud@gmail.com>,
	"Linux regression tracking (Thorsten Leemhuis)" <regressions@leemhuis.info>,
	linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: Re: [PATCH v2 2/2] firmware: qcom: scm: fall back to kcalloc() for
 no SCM device bound
Message-ID: <ZuqMxetUzZ8UCZUx@linaro.org>
References: <20240911-tzmem-null-ptr-v2-0-7c61b1a1b463@linaro.org>
 <20240911-tzmem-null-ptr-v2-2-7c61b1a1b463@linaro.org>
 <ZuhgV1vicIFzPGI-@linaro.org>
 <CAMRc=MevCNHSs2jMbMXjoFYY7V8NqKha8jd3aDCgGNvuL3LwEw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAMRc=MevCNHSs2jMbMXjoFYY7V8NqKha8jd3aDCgGNvuL3LwEw@mail.gmail.com>

On Tue, Sep 17, 2024 at 12:17:19PM +0200, Bartosz Golaszewski wrote:
> On Mon, Sep 16, 2024 at 6:44 PM Stephan Gerhold
> <stephan.gerhold@linaro.org> wrote:
> > On Wed, Sep 11, 2024 at 11:07:04AM +0200, Bartosz Golaszewski wrote:
> > > From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> > >
> > > Older platforms don't have an actual SCM device tied into the driver
> > > model and so there's no struct device which to use with the TZ Mem API.
> > > We need to fall-back to kcalloc() when allocating the buffer for
> > > additional SMC arguments on such platforms which don't even probe the SCM
> > > driver and never create the TZMem pool.
> > >
> > > Fixes: 449d0d84bcd8 ("firmware: qcom: scm: smc: switch to using the SCM allocator")
> > > Reported-by: Rudraksha Gupta <guptarud@gmail.com>
> > > Closes: https://lore.kernel.org/lkml/692cfe9a-8c05-4ce4-813e-82b3f310019a@gmail.com/
> > > Tested-by: Rudraksha Gupta <guptarud@gmail.com>
> > > Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> > > ---
> > >  drivers/firmware/qcom/qcom_scm-smc.c | 28 ++++++++++++++++++++++++----
> > >  1 file changed, 24 insertions(+), 4 deletions(-)
> > >
> > > diff --git a/drivers/firmware/qcom/qcom_scm-smc.c b/drivers/firmware/qcom/qcom_scm-smc.c
> > > index 2b4c2826f572..88652c38c9a0 100644
> > > --- a/drivers/firmware/qcom/qcom_scm-smc.c
> > > +++ b/drivers/firmware/qcom/qcom_scm-smc.c
> > > [...]
> > > @@ -173,9 +182,20 @@ int __scm_smc_call(struct device *dev, const struct qcom_scm_desc *desc,
> > >               smc.args[i + SCM_SMC_FIRST_REG_IDX] = desc->args[i];
> > >
> > >       if (unlikely(arglen > SCM_SMC_N_REG_ARGS)) {
> > > -             args_virt = qcom_tzmem_alloc(mempool,
> > > -                                          SCM_SMC_N_EXT_ARGS * sizeof(u64),
> > > -                                          flag);
> > > +             /*
> > > +              * Older platforms don't have an entry for SCM in device-tree
> > > +              * and so no device is bound to the SCM driver. This means there
> > > +              * is no struct device for the TZ Mem API. Fall back to
> > > +              * kcalloc() on such platforms.
> > > +              */
> > > +             if (mempool)
> > > +                     args_virt = qcom_tzmem_alloc(
> > > +                                     mempool,
> > > +                                     SCM_SMC_N_EXT_ARGS * sizeof(u64),
> > > +                                     flag);
> > > +             else
> > > +                     args_virt = kcalloc(SCM_SMC_N_EXT_ARGS, sizeof(u64),
> > > +                                         flag);
> >
> > I'm afraid this won't work. For kcalloc, we would need to flush the
> > cache since it returns cached memory. In v6.10 this was done using the
> > dma_map_single() call that you removed when moving to the tzmem
> > allocator.
> >
> 
> Indeed, I missed this but it's not very hard to re-add here.
> 
> > Actually, taking only the first patch in this series should be enough to
> > fix the crash Rudraksha reported. None of the older platforms should
> > ever reach into this if statement. I think the rough story is:
> >
> >  1. The crash Rudraksha reported happens in qcom_scm_set_cold_boot_addr()
> >     during SMP CPU core boot-up. That code runs very early, AFAIK even
> >     before the device model is initialized. There is no way to get
> >     a device pointer at that point. Even if you add the scm node to DT.
> >
> >  2. AFAIK all the ARM32 platforms without PSCI support implement the
> >     legacy calling convention (see qcom_scm-legacy.c). They will only
> >     reach qcom_scm-smc.c once during convention detection (see
> >     __get_convention()). This is a SCM call with just a single argument
> >     that won't go inside the if (unlikely(arglen > SCM_SMC_N_REG_ARGS)).
> >     And qcom_scm-legacy.c does not use the tzmem allocator (yet?).
> >
> 
> No and I didn't plan to add it. Let me know if I should?
> 

I'm not sure if there is any advantage aside from slightly more
consistent code. None of these old platforms will have support for the
SHM bridge. We would need to test the changes carefully to make sure
there are no regressions. It's probably easier (and safer) to just leave
that code as-is.

Thanks,
Stephan

