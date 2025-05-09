Return-Path: <linux-arm-msm+bounces-57492-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DC622AB1EBB
	for <lists+linux-arm-msm@lfdr.de>; Fri,  9 May 2025 23:08:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 146EDA03690
	for <lists+linux-arm-msm@lfdr.de>; Fri,  9 May 2025 21:08:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E2AB725F98C;
	Fri,  9 May 2025 21:08:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Q03ts/B7"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-yw1-f174.google.com (mail-yw1-f174.google.com [209.85.128.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5319725F7A4
	for <linux-arm-msm@vger.kernel.org>; Fri,  9 May 2025 21:08:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746824922; cv=none; b=VNq4h6PDrLu4dKOZHmHQcvwvucfJ9tvwmaV1GmpYv4r2nfwkjimPXeS8qQQK8HBIbW90T4Wti9dQsLUQLVZKuZATwhigC/1QAEPg4EO9Rkt7ReFyRATqOt4wde3ocxVds1hmYhY3PM8X/g1khC5hxpcsaq+EGgQggY2gkYyLXRw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746824922; c=relaxed/simple;
	bh=bKjy5o6Z+ondQ2TvfmmpMS8RhxvRXN8ovbnY39ABwG4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ZyybHkW+yxMoCCByFKvjdX+Y4qVco+vG5zlVxv/J/ZM/Y6SpkRvH/h0IqhnhhX70k/VQIJXM9j02SjywlrWcPWZqpxPRjxRoQeICtqejJ6UvB7Ai7eE9MziqFYBA6LBHIw03mm//iqVyYXuXBJfAfiXYqyPknV/UfCGc58Yndzs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=Q03ts/B7; arc=none smtp.client-ip=209.85.128.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-yw1-f174.google.com with SMTP id 00721157ae682-70a1f2eb39aso25269067b3.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 09 May 2025 14:08:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1746824920; x=1747429720; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Qo3RbPhMUt0mCgRMJPwtrRn0GvPUWia8O9TOD3W3M9E=;
        b=Q03ts/B79D8ocNp4yC/jTGLGpO7JZ+XduNI7GomAxpBwu2rPtYXX4ajWrjMit3ghDZ
         E3I68vqI66sLf5tIMCYwHMao/eiP7ake1KDolj/zHKhYwwa4X9EqwdLniUZ8xmhXZoSu
         lY6ol0zCbx8RXEvRGdWevTzuGRJeEYM37pSGjiuyguCd28u57gVjwc7TKrgWVhHUUWbu
         CW3Lcm+hoTSmbmz1sBpBsOs2kegEsPOOL0LpZpEkVZGgLHrXW3MIcy7rCLW26NIidvas
         SD0/CU6NtIeNFpmhs1iPphzFwXAx6RefQIGmfK0dQVZd72WGr0QpAMti4TW7QX5TiiyQ
         CKPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746824920; x=1747429720;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Qo3RbPhMUt0mCgRMJPwtrRn0GvPUWia8O9TOD3W3M9E=;
        b=TMPwqH4v1V4IzNZyiQB/4DhcQnWQN/1fWjDgZAUDYQzJUHlDznMg3q8FryDejQgKAc
         2vSXP1nU3DeevTNbkrL4cEg4R9BwG31XKLuq/Is91mg2hjhPG3Qa7Y/EtdD4uk/X9dm5
         BzNpJIFENOsNcJ1v/FHP4i7lBJ1C8NCOwrGxPeb4SVnobnKL46tmh8ww65Cn+j5GIgaj
         k3Y+HlKy6IkXVQOEFd1j4CGf3qAocfiYszPAdUCia+i8z6DTUCDDq9qvMNesc5LylEn+
         pci420PQH2oi3/JZfWFLFKBcy1T2qnkhOrJRbNWzdl8pO/cEG6o38F1tZJbC7tXjS/Vi
         PCSw==
X-Forwarded-Encrypted: i=1; AJvYcCVwPQVd//1EfleTjXFpqCSQaRd+aSLu+rK3PfcSL82x/ERYaa3/sSvWZgdopV7yEbr6mu7y4GkEeCkbStiN@vger.kernel.org
X-Gm-Message-State: AOJu0Yw2/XsDdGnrqZAMjV+Vs791TVobOuhFGREyUwuGNjpsIkTCG9Ru
	KzxbMS+mRmmTvvXknc5gdea3WgoFG+3WVsS11QrosHJYea5bodVIyvOrkZ7iQkbRRqtOV1BvNnf
	RrcGyIOeC1VHUL/jr//CvzuBBrdqculaR4PlV
X-Gm-Gg: ASbGncvBeRXun5wQsK8EZBBicPXBNaUpUtiTaV/cBYbUauY9YjYyziJ2Ubz43QvicqS
	+WBMF7CP3J64sGUh8x50/PgJ6EzSI1JAvl+TBICKcR6kYoOjjrqbsjNSkfKUwpGEk1lb0KLlHO6
	XLSpLRCyZa9RDXKbK/cD4SpCuLUzU3Nn/66REd9h4OeTAFlHiswSAI2F+yqoTScUs=
X-Google-Smtp-Source: AGHT+IHlUY43o+HZ0IZSRVR6uZdUWzgGQW4sgrRuztNX3l5EWtjPTaxWVq34qMX7rTcXsfXBVazLRJrR5+apI8tdFAs=
X-Received: by 2002:a05:690c:2506:b0:702:5926:8609 with SMTP id
 00721157ae682-70a3fa261acmr66342917b3.12.1746824919913; Fri, 09 May 2025
 14:08:39 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250430165655.605595-1-tabba@google.com> <20250430165655.605595-12-tabba@google.com>
In-Reply-To: <20250430165655.605595-12-tabba@google.com>
From: James Houghton <jthoughton@google.com>
Date: Fri, 9 May 2025 14:08:04 -0700
X-Gm-Features: AX0GCFsK5fScWWx1HXD6KSAt3WJ74eLoLC_0XrLD4B-DnbvfPDyJoh9_VAJEPDY
Message-ID: <CADrL8HWo_u4CPHDkSspiZFCgASw_LoUAYP07pueX5rBEM1yDHQ@mail.gmail.com>
Subject: Re: [PATCH v8 11/13] KVM: arm64: Enable mapping guest_memfd in arm64
To: Fuad Tabba <tabba@google.com>
Cc: kvm@vger.kernel.org, linux-arm-msm@vger.kernel.org, linux-mm@kvack.org, 
	pbonzini@redhat.com, chenhuacai@kernel.org, mpe@ellerman.id.au, 
	anup@brainfault.org, paul.walmsley@sifive.com, palmer@dabbelt.com, 
	aou@eecs.berkeley.edu, seanjc@google.com, viro@zeniv.linux.org.uk, 
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
	peterx@redhat.com, pankaj.gupta@amd.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 30, 2025 at 9:57=E2=80=AFAM Fuad Tabba <tabba@google.com> wrote=
:
> +#ifdef CONFIG_KVM_GMEM
> +static inline bool kvm_arch_supports_gmem(struct kvm *kvm)
> +{
> +       return IS_ENABLED(CONFIG_KVM_GMEM);

How about just `return true;`? :)

