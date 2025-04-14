Return-Path: <linux-arm-msm+bounces-54214-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id ADBABA87D4A
	for <lists+linux-arm-msm@lfdr.de>; Mon, 14 Apr 2025 12:16:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1D0CB3B6187
	for <lists+linux-arm-msm@lfdr.de>; Mon, 14 Apr 2025 10:15:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 934E82620FA;
	Mon, 14 Apr 2025 10:16:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="jeH2cPJ0"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-qt1-f175.google.com (mail-qt1-f175.google.com [209.85.160.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9996258CCF
	for <linux-arm-msm@vger.kernel.org>; Mon, 14 Apr 2025 10:16:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744625762; cv=none; b=pIRoL/OPWmNvQzEeu3huumwUvQzCx2nFeydBkz5JWrfctkcWIn4r+NznGs7c/TVRXCACC7oRcVzdDDbPJcEYjCzb7AX0yEHLdhXmkAHVlNYC7Sre4BiELrrTPzTMVaxSFiqKf+dNi9lH6AehTcIC3BiHNsEEdu1hh1ijOzBcq2Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744625762; c=relaxed/simple;
	bh=OcLJDnrFkO8e8oXnJcW6VAoR6xwGl1kDtwgUjWBGRiI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=AQ5em5bOdHv4aR2vwRtpBqdnlRgTcMOCB7R4DvDLmh9PWidCVDgVvSjOgWzwRwO7pm6+df7K1t9KntNlmMnGGU6dy9fJ0NezsnlC73Wqlq4QhhW4wGbKwcX9Ixj659pIixbDQBho57/kwnk/tMT3Bw5XTSPUQ/yxCJynQ7vbO5k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=jeH2cPJ0; arc=none smtp.client-ip=209.85.160.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-qt1-f175.google.com with SMTP id d75a77b69052e-4769e30af66so600241cf.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 14 Apr 2025 03:16:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1744625760; x=1745230560; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=OcLJDnrFkO8e8oXnJcW6VAoR6xwGl1kDtwgUjWBGRiI=;
        b=jeH2cPJ0KL+BeppKe8tyHYwdcAEVMAyve1JeeOdYlqEPTSre/KOYRNK01x+GMdnm05
         S0BDAwqQsjx9DCaHgr6pN9Ga9O8Y4b/Ej0FayV4Ch8Yy7yWLzCRphw6nTvtEkXa+qvnY
         GwgwEX6oYSUVmaNzUweY7DGJtZRKJo2cRdd3ZLPajO7k/sBrlzKW8W1iQ3miO8HtRgwC
         tyjV0BsdJP2El6Q0b+lH87QoLmEDx4krp6anHwWs3eZREFmpgUjTnPB2DBL9Rn5/GhuZ
         gZ6vNCWKtoG073AhwhUbxeAQ3wsPDJRMfUMwnl7gVdDV/rCNMxRrm6CiOuBUUYGLnHyK
         u9yw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744625760; x=1745230560;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=OcLJDnrFkO8e8oXnJcW6VAoR6xwGl1kDtwgUjWBGRiI=;
        b=N9cAdXcZd/vj1kMlQeR1fPG8mjSwbfcpQowLM3hzDVeFXsrYbhz5whH+zWU+pPYbPm
         SBHI5U/KKAJI8bpIFxGCA8ENP6pc8bBAghRAIZKccy0rKOxZIAHqCJ10na+2xD44NtjX
         Pi8HjTlOFimyR5uPQ5F5D/KAuAz9OHpi4qUs0SFg/vMez+Tmc+IN5B+by1rWj2bNpKxr
         Of57rvfgx0Q0jKM84+tfxVZ205Onon8DbGfqXuERfJlOH1U93T/jN3GbThCAy7e3r1RV
         QR/1rSgv+H2WBB1fCV3280wHWGNfCmlmSNpFJ1L/Yi/PJun7wkMKwFg66PLIpNZdB6B/
         hpEg==
X-Forwarded-Encrypted: i=1; AJvYcCWpXJDosNxwEmT3kxVmZ8vavON++2uTZO+JW033TVO9KevX1vdWMygcr77eB3XqIEXlpP1G6oBModNuMpHB@vger.kernel.org
X-Gm-Message-State: AOJu0YzO5ggHeqfFmttGETarrdFWVun5p5zRqtboSgvHPWtqUzZ5o44J
	Hmlw/WZsYMWDtqUsoCOIX0nBccLQuQhhCjxIjfT3P4m0quS7V6wUM39D+K95oACDZkODyKX/Vux
	opb7474Q+rW7rl+P/EAXXybaCWmZ1Xs7052Ka
X-Gm-Gg: ASbGncsG7hkXTH4gmj1ai+5t9Sob/Q3D3Y8bw99ehQhzP3MZiI7JTx64bB9DGCaBG4d
	FNlQurFwNEigOUfJAVBZTWy9ikLGTawA3vdesqKSCVbhuZO56J09NlkN4McukcygCdOJ2pwz+sy
	Nk/hzAEGKSqrUbCNjii3Rq7g==
X-Google-Smtp-Source: AGHT+IGCz8tRzMWzZ7k1b4BNH1NUIjgUIZI2IRy23Z5IEMrMl0Yq7yQbo8Xe1bpouJ0DZWpGxsoWemisIh3ijjXh1mA=
X-Received: by 2002:a05:622a:11:b0:479:973:46f1 with SMTP id
 d75a77b69052e-479815f5c0emr7965841cf.22.1744625759359; Mon, 14 Apr 2025
 03:15:59 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250318161823.4005529-1-tabba@google.com> <20250318161823.4005529-2-tabba@google.com>
 <96ed1b7e-a4ec-417f-a766-237229231017@redhat.com>
In-Reply-To: <96ed1b7e-a4ec-417f-a766-237229231017@redhat.com>
From: Fuad Tabba <tabba@google.com>
Date: Mon, 14 Apr 2025 11:15:22 +0100
X-Gm-Features: ATxdqUGYDtD0-17Blas24LtFzrv5L-nhb2QSHzRNpC2CiejHvLicJITFfxnMcJ0
Message-ID: <CA+EHjTyky=2Jy=Ctvy3n81as+aq_-m_Rxwu2VRi_-0X=VFFe+w@mail.gmail.com>
Subject: Re: [PATCH v7 1/9] mm: Consolidate freeing of typed folios on final folio_put()
To: David Hildenbrand <david@redhat.com>
Cc: kvm@vger.kernel.org, linux-arm-msm@vger.kernel.org, linux-mm@kvack.org, 
	pbonzini@redhat.com, chenhuacai@kernel.org, mpe@ellerman.id.au, 
	anup@brainfault.org, paul.walmsley@sifive.com, palmer@dabbelt.com, 
	aou@eecs.berkeley.edu, seanjc@google.com, viro@zeniv.linux.org.uk, 
	brauner@kernel.org, willy@infradead.org, akpm@linux-foundation.org, 
	xiaoyao.li@intel.com, yilun.xu@intel.com, chao.p.peng@linux.intel.com, 
	jarkko@kernel.org, amoorthy@google.com, dmatlack@google.com, 
	isaku.yamahata@intel.com, mic@digikod.net, vbabka@suse.cz, 
	vannapurve@google.com, ackerleytng@google.com, mail@maciej.szmigiero.name, 
	michael.roth@amd.com, wei.w.wang@intel.com, liam.merwick@oracle.com, 
	isaku.yamahata@gmail.com, kirill.shutemov@linux.intel.com, 
	suzuki.poulose@arm.com, steven.price@arm.com, quic_eberman@quicinc.com, 
	quic_mnalajal@quicinc.com, quic_tsoni@quicinc.com, quic_svaddagi@quicinc.com, 
	quic_cvanscha@quicinc.com, quic_pderrin@quicinc.com, quic_pheragu@quicinc.com, 
	catalin.marinas@arm.com, james.morse@arm.com, yuzenghui@huawei.com, 
	oliver.upton@linux.dev, maz@kernel.org, will@kernel.org, qperret@google.com, 
	keirf@google.com, roypat@amazon.co.uk, shuah@kernel.org, hch@infradead.org, 
	jgg@nvidia.com, rientjes@google.com, jhubbard@nvidia.com, fvdl@google.com, 
	hughd@google.com, jthoughton@google.com, peterx@redhat.com
Content-Type: text/plain; charset="UTF-8"

Hi David,

On Mon, 14 Apr 2025 at 11:00, David Hildenbrand <david@redhat.com> wrote:
>
> On 18.03.25 17:18, Fuad Tabba wrote:
> > Some folio types, such as hugetlb, handle freeing their own
> > folios. Moreover, guest_memfd will require being notified once a
> > folio's reference count reaches 0 to facilitate shared to private
> > folio conversion, without the folio actually being freed at that
> > point.
> >
> > As a first step towards that, this patch consolidates freeing
> > folios that have a type. The first user is hugetlb folios. Later
> > in this patch series, guest_memfd will become the second user of
> > this.
> >
> > Suggested-by: David Hildenbrand <david@redhat.com>
> > Acked-by: Vlastimil Babka <vbabka@suse.cz>
> > Acked-by: David Hildenbrand <david@redhat.com>
> > Signed-off-by: Fuad Tabba <tabba@google.com>
> > ---
>
> As discussed in the last upstream meeting, we should focus on using the
> folio_put() hook only for the post-truncate case where required (e.g.,
> re-assemble hugetlb).
>
> For shared->private conversion doing it synchronously (unmap, try
> freezing refcount) and failing if impossible to signal user space to
> retry is a better first approach.
>
> So this patch will be dropped from your series for now, correct?

Yes it will.

Thanks,
/fuad

> --
> Cheers,
>
> David / dhildenb
>

