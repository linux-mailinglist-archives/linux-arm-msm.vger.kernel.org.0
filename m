Return-Path: <linux-arm-msm+bounces-54215-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id BE7F7A87D4C
	for <lists+linux-arm-msm@lfdr.de>; Mon, 14 Apr 2025 12:16:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C90BB16207F
	for <lists+linux-arm-msm@lfdr.de>; Mon, 14 Apr 2025 10:16:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BAE9E5D738;
	Mon, 14 Apr 2025 10:16:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="OtevI2R7"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-qt1-f172.google.com (mail-qt1-f172.google.com [209.85.160.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34C92263C78
	for <linux-arm-msm@vger.kernel.org>; Mon, 14 Apr 2025 10:16:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744625779; cv=none; b=sjyO0TlWFyRAWMV+y7Krx9iwTUz8PpJfjwv1cpdYuYtGOpefD6Hh1pjVpM/lhO/a41DptrFuQO2wpabLxsm1mb6ki/+kndA5OtVY38TpBY5TYzqk783AfMsxZB/wE9hJqd6bQWPM3xY5qDluj517+qCY+wCTogxmT6vDK35su14=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744625779; c=relaxed/simple;
	bh=xSIJ0vFFb2+XHasdF5PAsBtux4dzXFv+jYFSL30pvgA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=gCYrP3a1K+lHn5lEvXsbv8WnFrdAwTdE8vonSSoycsDhna0fa+mj5JlycCgjtkjCp8eA4G8r896j5Zxm9yZVdOSrzgKXRdZeIk4md2bq0yYlM0loeNix3/TiLvWXIpmWS7UStDsDAfmx/0+OKFyOgKETHBkmvQ+frnON3bAX/II=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=OtevI2R7; arc=none smtp.client-ip=209.85.160.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-qt1-f172.google.com with SMTP id d75a77b69052e-4774611d40bso561411cf.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 14 Apr 2025 03:16:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1744625777; x=1745230577; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=m1CFhU+Us34qKNcUetLtx8bVGJXglYvmORKZst7qknM=;
        b=OtevI2R7itWmdlsrUxGnakazuHZw5UzMq+22CMPxh1eoI5dUrcx3gSZA4j34QGjRIe
         IsNsg1LUcPHopKs96MfNqJ8EuLBDZijLjrmRNNibmsJ88XWkhN9USmRb1l9TBChlvxqp
         35zQxh947RlNHJp/SS3b2KzWKYslpuD8kC2AW3AzeXF2bCseu0hU9zlho3pEMEnOuy17
         xtZJxvSPCAzQV3wtjhaUlQjmyJm6bZXTprRyMzgUfGmw1b6jdKpAzXN3Vc2UgFF4XgcR
         8Qfqtt6ZW362T/PAyBtKeQM81jqptwcrdZST/RRORess3bdGRsN0ANqnxj8VpjvYyFey
         UzNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744625777; x=1745230577;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=m1CFhU+Us34qKNcUetLtx8bVGJXglYvmORKZst7qknM=;
        b=Kw6C2yuKks2iMgprles0smWQEmTchqM96kN5GSERFv50yyZK3/g1/t2VcKyr7rkw3U
         ezDyrqcXoZ084nZsGx8xjMofB2tHVpDVtIUO6oqSdlCGcXdA7d7LHdhVvI719d18eSn6
         GnwQvPpTvYC3HmJIycnj/d8NBuMpMiYuWNopjTTdnPWWjU/cCjte19JDnIJ30/Lzkmjm
         +kfs3WEGdr078o8eer4F96M/cTnj5d9okxtxveKyNJES5jRNCG6OK1LKQ40fGqv94cTx
         ZuIde6fdRJgGvSihBU+6QVFeu1i02a9RzkNiPUckAmlVta2YHf4FP8zI+BIadXm5wmCn
         LC4w==
X-Forwarded-Encrypted: i=1; AJvYcCUsf6Agsl1aJjptZbDB1hqNS1jCvpzdCv9DcKvv+JG3wsz38hQX5slFGqOP0qzLDLjXqTMAxlDY/H/42wJU@vger.kernel.org
X-Gm-Message-State: AOJu0YxEv98AAMP3Vp7/Yr5cPPghr5sB99Awt46j1W5CsKx+v6lhXlCH
	2dCw1f+u+McfvlLpGGIkotx2tw33+21gbilRnro5y9Vtq2MJbeOoocWmRX1v/hRz7mgtwJ6QUr6
	v6gWHBTZoShgZuVjwkXiM+9a3U9X8F3CjYhtW
X-Gm-Gg: ASbGnctPQ1g9/Zy6qJ0FAflDP5ogXoX+C2H4+o9Vkg18umfxNBXalKoORGP1rTXCUj0
	tQIUbyeeIonpCBTqgtT4AegtnAxLlGpzHLlYwPeY4dv27r1t6kVooTm/zmWTejaLdrLLmqgoaq/
	3KE5JNqhq8W/1BEq/Jy8qtKQ==
X-Google-Smtp-Source: AGHT+IE7N7CQyu6cJnoqxB5sCy6LSjPZ11zuPXGLhynUeIQf8hFCrB+6p/8yJNraIeugxZleuOsQPHl+eTNzV+QZxtk=
X-Received: by 2002:a05:622a:181f:b0:477:871c:5e80 with SMTP id
 d75a77b69052e-479824864a1mr6442931cf.5.1744625776707; Mon, 14 Apr 2025
 03:16:16 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250318161823.4005529-1-tabba@google.com> <20250318161823.4005529-4-tabba@google.com>
 <e3c26b84-5388-43f8-87ed-bee034f327b8@redhat.com>
In-Reply-To: <e3c26b84-5388-43f8-87ed-bee034f327b8@redhat.com>
From: Fuad Tabba <tabba@google.com>
Date: Mon, 14 Apr 2025 11:15:40 +0100
X-Gm-Features: ATxdqUFTBJlpnwSmrV77Tym0H8Hp9RCIeXMAAODOU2G7ZtkMx-Y5jKinNbiiJow
Message-ID: <CA+EHjTzpboCX7xseY5R1r0GHnea=mkMPi7h=vQp6ZCs7aKaXWQ@mail.gmail.com>
Subject: Re: [PATCH v7 3/9] KVM: guest_memfd: Allow host to map guest_memfd() pages
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

On Mon, 14 Apr 2025 at 11:06, David Hildenbrand <david@redhat.com> wrote:
>
>
> > +     /*
> > +      * Shared folios would not be marked as "guestmem" so far, and we only
> > +      * expect shared folios at this point.
> > +      */
> > +     if (WARN_ON_ONCE(folio_test_guestmem(folio)))  {
> > +             ret = VM_FAULT_SIGBUS;
> > +             goto out_folio;
> > +     }
>
> With that dropped for now
>
> Acked-by: David Hildenbrand <david@redhat.com>

Thanks!
/fuad

> --
> Cheers,
>
> David / dhildenb
>

