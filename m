Return-Path: <linux-arm-msm+bounces-16533-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id ED73C899EF1
	for <lists+linux-arm-msm@lfdr.de>; Fri,  5 Apr 2024 16:04:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9769C284150
	for <lists+linux-arm-msm@lfdr.de>; Fri,  5 Apr 2024 14:04:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A822016E88E;
	Fri,  5 Apr 2024 14:04:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="B70BVjZB"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0CD6316DED4
	for <linux-arm-msm@vger.kernel.org>; Fri,  5 Apr 2024 14:04:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712325892; cv=none; b=iOqWLEnOJ6uQ3NmrDDkvenJj7qAO4RBX0zlZ/FQnj/AVz1MDdPFiyXeLGXXTRjpMtvetTLCWubrQXvYs6F6Ff+rbFVWqxKWt2ktBbK4ovJvyuWy2Fs/J0LNt4Rw6u+4TWwF7Flfy1ZbPoRuv9FubRD5lDiZXqnLysGN0OTGUYrc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712325892; c=relaxed/simple;
	bh=YLppziVi18FS86lsRUFYbik4pdpKw9o5av3kYjqyrXM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Z+qeJg8cuQzg7jBgDN5od7pqxAUi5OOBtphdRRfY6ddOp/mDd4IZictK6GfqJOjdZECXbAgz7nT6n5YTOrpe2OAgi2nwS0hajpWgvbgMqpAc1yDCwFIFtzn7uiE6FfNo7X+Oc03P/uuADG/repq0xFHgRtAWbJYweEmyg4FC45s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=B70BVjZB; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1712325889;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=SJZjF5huZ/IS92CnJZN2AYaHFZSXzZinDMU0oFLcit0=;
	b=B70BVjZB2JEXjgcyYGaXixHEqyGt7P8yZ3wmDrE7Mf1MMq3QJG/z9hyeorlqyfuUv7nI7t
	dnQRM2Z3uj1gPHgFNNplQsdz5OjaECnI6bVuzJPnj/2mk+Qn34l6X89V0puVjwzj0SQmmz
	vONMyMLci3vJQyRhJRsCTpZmLz4MzoU=
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-581-07H9j7vCMPKYvPEd1tm3nA-1; Fri, 05 Apr 2024 10:04:48 -0400
X-MC-Unique: 07H9j7vCMPKYvPEd1tm3nA-1
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-78a687cc579so255256285a.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 05 Apr 2024 07:04:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712325887; x=1712930687;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SJZjF5huZ/IS92CnJZN2AYaHFZSXzZinDMU0oFLcit0=;
        b=Zvc1rqoNzqKv0fzTVs5Bb9xiadJQGxoEnrtDQiY3ZPbcII8STEhnrJhyGyLsnlOvZe
         tkDKeXscB2SIvNzTZtiWUtwD2m4ahTf+70lOG6WECidgR92ye7C0RdNSbpIb0v0Co6IE
         z36UdiiMIp9NGg1ssA0ghhKXIPYSp8Pme4ZHnlOTpRtX7y0MdYMhdkA4yhCfMYye5N+c
         Y2GDP4leExUKEe37WFIysdF/NARG6X6pN+xhizodspcQ7yWz1RIV7VqcG3GTLLoEG3Ju
         tIdHeWnmhu7eHDsWNuEOQzhySWJUL/CUDvAimxlOZi7RPk2C805u8I/ENr390lM7EKWj
         Tw/Q==
X-Gm-Message-State: AOJu0YxiDUN6JHxV+ggF29o5IpCYJObPPG8F1x0VCt/7UwTfW7gxPrP3
	Nx8kMwKeK+7e7OsnD8J2BzAQHwt+iNYDOps0yLQm6tafFLTbwWVSQaa1+Izi6iUewvNOkZOLCQj
	7vLGC2RkHFEL03+J78dmQNNr1Lr7Ttxw3gEcWRmqKr/JhDPaTSf+Y9pJg5dcWpIY=
X-Received: by 2002:a05:620a:2b84:b0:78a:72b3:b629 with SMTP id dz4-20020a05620a2b8400b0078a72b3b629mr1708179qkb.44.1712325887098;
        Fri, 05 Apr 2024 07:04:47 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHeHEjy/9A/4fTjZi0cCVsMnWNGemn3Slh0adyB59fLgBdpF4HyFXzqH7mBOCLvsV91+RB47w==
X-Received: by 2002:a05:620a:2b84:b0:78a:72b3:b629 with SMTP id dz4-20020a05620a2b8400b0078a72b3b629mr1708136qkb.44.1712325886596;
        Fri, 05 Apr 2024 07:04:46 -0700 (PDT)
Received: from x1gen2nano ([2600:1700:1ff0:d0e0::33])
        by smtp.gmail.com with ESMTPSA id s9-20020a05620a030900b00789fb5397d4sm654993qkm.100.2024.04.05.07.04.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Apr 2024 07:04:46 -0700 (PDT)
Date: Fri, 5 Apr 2024 09:04:43 -0500
From: Andrew Halaney <ahalaney@redhat.com>
To: Bjorn Andersson <quic_bjorande@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, robdclark@gmail.com, will@kernel.org, 
	iommu@lists.linux.dev, joro@8bytes.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, quic_c_gdjako@quicinc.com, quic_cgoldswo@quicinc.com, 
	quic_sukadev@quicinc.com, quic_pdaly@quicinc.com, quic_sudaraja@quicinc.com
Subject: Re: sa8775p-ride: What's a normal SMMU TLB sync time?
Message-ID: <lqdosfpb7gdjooqswgjnabzxapocndzam3ws7dq7god5bn55an@igvaowz6h7ye>
References: <kord5qq6mywc7rbkzeoliz2cklrlljxm74qmrfwwjf6irx4fp7@6f5wsonafstt>
 <Zg9vEJV5JyGoM8KY@hu-bjorande-lv.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Zg9vEJV5JyGoM8KY@hu-bjorande-lv.qualcomm.com>

On Thu, Apr 04, 2024 at 08:25:04PM -0700, Bjorn Andersson wrote:
> On Tue, Apr 02, 2024 at 04:22:31PM -0500, Andrew Halaney wrote:
> > Hey,
> > 
> > Sorry for the wide email, but I figured someone recently contributing
> > to / maintaining the Qualcomm SMMU driver may have some proper insights
> > into this.
> > 
> > Recently I remembered that performance on some Qualcomm platforms
> > takes a major hit when you use iommu.strict=1/CONFIG_IOMMU_DEFAULT_DMA_STRICT.
> > 
> > On the sa8775p-ride, I see most TLB sync calls to be about 150 us long,
> > with some spiking to 500 us, etc:
> > 
> >     [root@qti-snapdragon-ride4-sa8775p-09 ~]# trace-cmd start -p function_graph -g qcom_smmu_tlb_sync --max-graph-depth 1
> >       plugin 'function_graph'
> >     [root@qti-snapdragon-ride4-sa8775p-09 ~]# trace-cmd show
> >     # tracer: function_graph
> >     #
> >     # CPU  DURATION                  FUNCTION CALLS
> >     # |     |   |                     |   |   |   |
> >      0) ! 144.062 us  |  qcom_smmu_tlb_sync();
> > 
> > On my sc8280xp-lenovo-thinkpad-x13s (only other Qualcomm platform I can compare
> > with) I see around 2-15 us with spikes up to 20-30 us. That's thanks to this
> > patch[0], which I guess improved the platform from 1-2 ms to the ~10 us number.
> > 
> > It's not entirely clear to me how a DPU specific programming affects system
> > wide SMMU performance, but I'm curious if this is the only way to achieve this?
> > sa8775p doesn't have the DPU described even right now, so that's a bummer
> > as there's no way to make a similar immediate optimization, but I'm still struggling
> > to understand what that patch really did to improve things so maybe I'm missing
> > something.
> > 
> 
> The cause was that the TLB sync is synchronized with the display updates,
> but without appropriate safe_lut_tlb values the display side wouldn't
> play nice.

In my case we don't have display being driven at all. I'm not sure if
that changes the situation, or just complicates it. i.e. I'm unsure if
that means we're not hitting the display situation at all but something
else entirely (assuming this time is longer than ideal), or if the
safe_lut_tlb values still effect things despite Linux knowing nothing
about the display, which as far as I know is not configured by anyone
at the moment.

Any thoughts on that?

> 
> Regards,
> Bjorn
> 
> > I'm honestly not even sure what a "typical" range for TLB sync time would be,
> > but on sa8775p-ride its bad enough that some IRQs like UFS can cause RCU stalls
> > (pretty easy to reproduce with fio basic-verify.fio for example on the platform).
> > It also makes running with iommu.strict=1 impractical as performance for UFS,
> > ethernet, etc drops 75-80%.
> > 
> > Does anyone have any bright ideas on how to improve this, or if I'm even in
> > the right for assuming that time is suspiciously long?
> > 
> > Thanks,
> > Andrew
> > 
> > [0] https://lore.kernel.org/linux-arm-msm/CAF6AEGs9PLiCZdJ-g42-bE6f9yMR6cMyKRdWOY5m799vF9o4SQ@mail.gmail.com/
> > 
> 


