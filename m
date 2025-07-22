Return-Path: <linux-arm-msm+bounces-66033-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B328B0D5FF
	for <lists+linux-arm-msm@lfdr.de>; Tue, 22 Jul 2025 11:30:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 5172B18884FC
	for <lists+linux-arm-msm@lfdr.de>; Tue, 22 Jul 2025 09:30:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B6A6C23D287;
	Tue, 22 Jul 2025 09:30:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="b+EyqEwx"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-qt1-f182.google.com (mail-qt1-f182.google.com [209.85.160.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28A4B2D9ED3
	for <linux-arm-msm@vger.kernel.org>; Tue, 22 Jul 2025 09:30:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753176621; cv=none; b=JyHW/Xu77Slrwi7z709ZIo5rBV94uL0j2I+sBdotGRrULhZKVPdmGJJLjTUsZ78WgL7W3Jfmaeolr4r7mBOlFClOa2awf0k4V1rtQSQ7iw8nl/LQjeoL4VmeCnJjvlfxRTxmBPX72AjnztbnGjsbe3w+17IBZceokjjhuSQ8+xg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753176621; c=relaxed/simple;
	bh=NZOwWDer9kFTaMnL2fjpUdAJbg9zTprfuYL3AUD+ssQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=mfizt+mvSlbkbSZ1yr96Z3YkfQE4pHZM4PMl/PZBTWcu7eIsa/L/GOSGUYuHdEB/3w4bJLVsts2OeejhPxbFd1XX4UvR5xL+QnuxOxwlNW8fwHA7WWMeeP6yCrJEHT5uznF2spoO+tVJSBdIN7V82AjreYEzzWRXrZ5QsIsGlTQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=b+EyqEwx; arc=none smtp.client-ip=209.85.160.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-qt1-f182.google.com with SMTP id d75a77b69052e-4ab86a29c98so276411cf.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 22 Jul 2025 02:30:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1753176619; x=1753781419; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=tJ3NUgk3lgCY61pzl+Ni6KBJ9PADbvzhkTcNBzb1Rl0=;
        b=b+EyqEwxW0WazZE08fRvdaKD1mmj+r1263WbnCtjsX3TfP1TMwSFkdMmKm8qQ+c/p3
         gUymifRs5uoUvj15Lb+s70lap+BPWlXLrGMx+lBgymYPsFjVvZQoqySs7Tit9G8fAfwa
         +Dyfoz6aZ8yHLSbqChGvFYrNhM4jdkL7YsgazeCSweZyDO3Dkud6QiiL+b5J5ScG/TZL
         o/ABqLnh1rM86Yu7IHo+OeSDVJw2sftBKfmPIXWd4m6jaln4GiJDHiJRrvbLNdiAAQPH
         rxvT9825L0dTaKWCOGCBKJoHQ8fV3e7JUuPRb8+we/ZT+/AA+ql+d5bp0nGXBHT6H5HT
         /T+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753176619; x=1753781419;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tJ3NUgk3lgCY61pzl+Ni6KBJ9PADbvzhkTcNBzb1Rl0=;
        b=uhaTQmcQYhWU1/sniIyuD8p9IqlJV7RZBtD3S6JgDuecAPE9uOloJ9gaRiHsV7X5lQ
         j5pNowgLgd46dlPwfkUtchw9/TbBfCnsc3lODO7xMLDmW/sV76UO1koBjwlpcMuen6qN
         yb967dYFyjyjHaf7naF/o/ZugchqC4roS0LDmhxKTYytS46G/tRoQsIOwqJHkEttRtmE
         J/lt2KHbVdF6ivrn00a0O556KS2HvJfLtsspe933Sa+hMwgTe4pixFp0PFeAd5tCprJq
         4JtrwTsApMi9J0YaOYwZ8U4BTMkzv10Ops04yHl3+X/2GzRB7Ly03EY5TgYKJx8fYnyA
         DTAA==
X-Forwarded-Encrypted: i=1; AJvYcCU4FazUHSSzjXhn7LvIgqqCg5WoEcza1Fehv7l8F/Voi1eLlPp9fRDYRqCZ8GO29proXpOrYnSpw4mBGMOU@vger.kernel.org
X-Gm-Message-State: AOJu0Yx66aLKwIQX3LKL6ox50iKi1nkMFe/StNPxc/xDr26HX0bSoPJ4
	x20nNzN1RXnCFJELZKVGvH+jqCtJvLMiwKXVTj82QLEZ1WE00AW2gvqDQK98tlpqN7nH4qsM7n1
	oXDqwt4KwcxAa3ccAKb6yucALjURorDi7shcJi2RL
X-Gm-Gg: ASbGncsci3qo3AiXVOI4rQLwJgWUSRHNrISJcOSGcn/IuE8H2pZq0Umcf9lgKGima+w
	omljhmXlMlM4JSNBSyqcyKZ5+k+CGWAFUODKqjWmv3JJDLhBJpslgPzi/3n0pg9f9Iogu7C1zze
	81VWei7qW4GZo8lzt7F8JnjJIWCKlnzMl17IZHGv1VKMxaegnrumVSTy7RALDS9T6b4MEEPS8Y2
	/TQBmPbgh61ueNgG38IwCBFm+PLfT2c3TKQ
X-Google-Smtp-Source: AGHT+IHbd/BHMQdknwRTeYIHxdE5noPZ3kOvGg+B20+8ARSixzBI5h5DcNA/xdxCHeDrHowFoGGJAOmBsTNjOtbFr6w=
X-Received: by 2002:ac8:5707:0:b0:4a9:d263:dbc5 with SMTP id
 d75a77b69052e-4ae5cdcbf2fmr3451501cf.20.1753176618461; Tue, 22 Jul 2025
 02:30:18 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250717162731.446579-1-tabba@google.com> <20250717162731.446579-3-tabba@google.com>
 <aH5uY74Uev9hEWbM@google.com> <CA+EHjTxcgCLzwK5k+rTf2v_ufgsX0AcEzhy0EQL-pvmsg9QQeg@mail.gmail.com>
 <aH552woocYo1ueiU@google.com>
In-Reply-To: <aH552woocYo1ueiU@google.com>
From: Fuad Tabba <tabba@google.com>
Date: Tue, 22 Jul 2025 10:29:42 +0100
X-Gm-Features: Ac12FXz-lwaWaACHfhK57yuAA5YnGjuXlhFfMAwyHrdRb3Dv43qkJ8E0aH-WQ58
Message-ID: <CA+EHjTwPnFLZ1OxKkV5gqk_kU_UU_KdupAGDoLbRyK__0J+YeQ@mail.gmail.com>
Subject: Re: [PATCH v15 02/21] KVM: Rename CONFIG_KVM_GENERIC_PRIVATE_MEM to CONFIG_KVM_GENERIC_GMEM_POPULATE
To: Sean Christopherson <seanjc@google.com>
Cc: kvm@vger.kernel.org, linux-arm-msm@vger.kernel.org, linux-mm@kvack.org, 
	kvmarm@lists.linux.dev, pbonzini@redhat.com, chenhuacai@kernel.org, 
	mpe@ellerman.id.au, anup@brainfault.org, paul.walmsley@sifive.com, 
	palmer@dabbelt.com, aou@eecs.berkeley.edu, viro@zeniv.linux.org.uk, 
	brauner@kernel.org, willy@infradead.org, akpm@linux-foundation.org, 
	xiaoyao.li@intel.com, yilun.xu@intel.com, chao.p.peng@linux.intel.com, 
	jarkko@kernel.org, amoorthy@google.com, dmatlack@google.com, 
	isaku.yamahata@intel.com, mic@digikod.net, vbabka@suse.cz, 
	vannapurve@google.com, ackerleytng@google.com, mail@maciej.szmigiero.name, 
	david@redhat.com, michael.roth@amd.com, wei.w.wang@intel.com, 
	liam.merwick@oracle.com, isaku.yamahata@gmail.com, 
	kirill.shutemov@linux.intel.com, suzuki.poulose@arm.com, steven.price@arm.com, 
	quic_eberman@quicinc.com, quic_mnalajal@quicinc.com, quic_tsoni@quicinc.com, 
	quic_svaddagi@quicinc.com, quic_cvanscha@quicinc.com, 
	quic_pderrin@quicinc.com, quic_pheragu@quicinc.com, catalin.marinas@arm.com, 
	james.morse@arm.com, yuzenghui@huawei.com, oliver.upton@linux.dev, 
	maz@kernel.org, will@kernel.org, qperret@google.com, keirf@google.com, 
	roypat@amazon.co.uk, shuah@kernel.org, hch@infradead.org, jgg@nvidia.com, 
	rientjes@google.com, jhubbard@nvidia.com, fvdl@google.com, hughd@google.com, 
	jthoughton@google.com, peterx@redhat.com, pankaj.gupta@amd.com, 
	ira.weiny@intel.com
Content-Type: text/plain; charset="UTF-8"

On Mon, 21 Jul 2025 at 18:33, Sean Christopherson <seanjc@google.com> wrote:
>
> On Mon, Jul 21, 2025, Fuad Tabba wrote:
> > > The below diff applies on top.  I'm guessing there may be some intermediate
> > > ugliness (I haven't mapped out exactly where/how to squash this throughout the
> > > series, and there is feedback relevant to future patches), but IMO this is a much
> > > cleaner resting state (see the diff stats).
> >
> > So just so that I am clear, applying the diff below to the appropriate
> > patches would address all the concerns that you have mentioned in this
> > email?
>
> Yes?  It should, I just don't want to pinky swear in case I botched something.

Other than this patch not applying, nah, I think it's all good ;P. I
guess base-commit: 9eba3a9ac9cd5922da7f6e966c01190f909ed640 is
somewhere in a local tree of yours. There are quite a few conflicts
and I don't think it would build even if based on the right tree,
e.g.,  KVM_CAP_GUEST_MEMFD_MMAP is a rename of KVM_CAP_GMEM_MMAP,
rather an addition of an undeclared identifier.

That said, I think I understand what you mean, and I can apply the
spirit of this patch.

Stay tuned for v16.
/fuad

> But goofs aside, yes, if the end result looks like what was the below, I'm happy.
> Again, things might get ugly in the process, i.e. might be temporariliy gross,
> but that's ok (within reason).

