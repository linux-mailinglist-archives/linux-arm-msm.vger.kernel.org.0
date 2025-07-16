Return-Path: <linux-arm-msm+bounces-65242-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 89759B07653
	for <lists+linux-arm-msm@lfdr.de>; Wed, 16 Jul 2025 14:55:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id BFCC04A00AB
	for <lists+linux-arm-msm@lfdr.de>; Wed, 16 Jul 2025 12:55:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 563712F49EA;
	Wed, 16 Jul 2025 12:54:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="o4h55GH9"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-qt1-f177.google.com (mail-qt1-f177.google.com [209.85.160.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C26A728D82F
	for <linux-arm-msm@vger.kernel.org>; Wed, 16 Jul 2025 12:54:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752670495; cv=none; b=oIRkNzh4oJsit4NX5epqidrOVVuaG1O1AoRWVnvWDWMd6I/dWfh695DYHh7hDOF2XxrrZMwLh7pL4rVbhVuIjFDjiEQy/lUe61XZeiOjqn0x/RR/efa4QYfWR8KqM7oULfcjLXvLRIkNyna5bz9CKnc0CYZhTxmplyPkZR00HN8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752670495; c=relaxed/simple;
	bh=AAemU8l07qLqvOU5KWKHhv6y1M/uqASoO8wNBjzSk0Y=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=AFtfvWK/e/+6AfpYpNKGgSZ7AxHyjLEWO/JIu4feYzH0a3/pnlfiDEweJiNG9/YkUjnGW6ftRwwDf9/6laTitdIGzyvtfG7POtDHhiQMmi56yRE2rclubLX3od25Ntq5dxSHcN2N1yNCAnASP4muJrDV3JXTv6zdqudDCQbAGZA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=o4h55GH9; arc=none smtp.client-ip=209.85.160.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-qt1-f177.google.com with SMTP id d75a77b69052e-4ab3855fca3so192331cf.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 16 Jul 2025 05:54:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1752670493; x=1753275293; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=j8ldmZ55jy5ZaXuomv0Qov+zBm2r6aMGVRc2HGPVpC4=;
        b=o4h55GH9odi2rx+j0LLRWvj0iA4WqyD87/vWEC9fmmlv7QUPar/UQecWOgEuplfUQG
         jnnTvz5kS9ZlDH2m1eJJeJjQtQDOU3aFDdmOWiwNmDlQrRLSodXnSaN30kFb+5uGkQt8
         97IUTOiCR9vf3mKit2JC1o7vhyJpXFfi6hB+z22qSVOXNO6w0yKIctoyiNCN/XE0+Ube
         qHbVbheo9tv/GcxeEhIhyjWdmTVWeq5PJeI98YurSPRZcCUk063kk0rCGAr/iVAhE56I
         bo5lCof73AG93mKV1r8Pc99Tobak1waSj5wI9T/uvbG96X70cFPzs/cpBvZOv6fwAY6x
         mUuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752670493; x=1753275293;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=j8ldmZ55jy5ZaXuomv0Qov+zBm2r6aMGVRc2HGPVpC4=;
        b=MdUoOwD3btZgTx6iPQ7cCN5a25wOlujvYip5vYLdZRSbojVh6vP5yyT/bQ/AE7Hzhr
         QTPwEk0fq5dSv7xFsyRU0KE5CpdWaY7cMLlOrnm7MxyWfNffYzFqz2ey6Esw7DNbpGIS
         YimFCyvBR2wBDRxaUZpBzMGLClWRtgyJMbw8hxrudNu+r2DzqUKYRYXw9YWSG3sFj62V
         gIsWXH6syLl+zlKV8OEz1XEE9TUTfgXS1ANOipCFoS0TIZiPSWHaRiBkJhT/i61Plm6V
         pWI41YroTkS/0immamrUNRelqsZ5zzRMh0ei7694hGNpo8lH+jIQzQsjUqCnYp2NIgKZ
         mRdQ==
X-Forwarded-Encrypted: i=1; AJvYcCWkTGsLGUjFPVgnuNLoTNixz86IHKUe5OLqlNbMnRwCpMaFnCvi+oRw7USnQhtJmxRIZzErEvAhJ2K6+YNx@vger.kernel.org
X-Gm-Message-State: AOJu0Ywkyw3Dfkjdhs/KmNHAtlxfgNa5TdBx5yOZeGdtYNUSUQdi0vXh
	JBgD0RV/ueFWUtKy//LRWDe2fcrKfNWL0fbZ+qwPdKRjVuDgaiXTTULMO6VMYyHJHOj//TP3r0B
	aLwwG7+p/J+tKQoTWaYDXsZHam4fCMHh9YqCCGEXD
X-Gm-Gg: ASbGncupfF5bmv15/M8UeSRaqMf7GqhRN+HkVc2dxcutH+HZAaViGUZL6S2vlQsUNlp
	EuIzFEJnInE4/bfTM1sSgoqrA7XFOr8lKrwMUf4SpNZkawblYCikGgmUODE0vOmFB7HHpUNUWGX
	/yX6DZUxP0YAL6vonD2t1NdEyEg244NcMvjsw7hmxOh683w3wIMk+wPNcDwL8Nb1vry6i6fyuxk
	ME8Nvx2fJchz5Nm6PoXh4QrqZMoZaK6eBE=
X-Google-Smtp-Source: AGHT+IG5QZXwMh/pWZ7YvuTyEUvPla3aSmPB5N9IHixBAAJw9oVvqZOIDmKNLn+4MKe74P7oCrt5WimSbibRGo5z6oU=
X-Received: by 2002:a05:622a:1aa0:b0:4a9:b6e1:15a with SMTP id
 d75a77b69052e-4ab954d8746mr2689661cf.24.1752670492218; Wed, 16 Jul 2025
 05:54:52 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250715093350.2584932-1-tabba@google.com> <20250715093350.2584932-3-tabba@google.com>
 <a4091b13-9c3b-48bf-a7f6-f56868224cf5@intel.com> <CA+EHjTy5zUJt5n5N1tRyHUQN6-P6CPqyC7+6Zqhokx-3=mvx+A@mail.gmail.com>
 <418ddbbd-c25e-4047-9317-c05735e02807@intel.com> <778ca011-1b2f-4818-80c6-ac597809ec77@redhat.com>
 <6927a67b-cd2e-45f1-8e6b-019df7a7417e@intel.com> <CA+EHjTz7C4WgS2-Dw0gywHy+zguSNXKToukPiRfsdiY8+Eq6KA@mail.gmail.com>
 <47395660-79ad-4d22-87b0-c5bf891f708c@redhat.com> <fa1ccce7-40d3-45d2-9865-524f4b187963@intel.com>
 <f7a54cc4-1017-4e32-85b8-cf74237db935@redhat.com> <CA+EHjTzOqCpcaNU4caddh6N3bCO0GvrOoZ+rMApdRh4=+BEXNA@mail.gmail.com>
 <c8b74572-3ed3-4a93-8433-1207e59f56e7@intel.com>
In-Reply-To: <c8b74572-3ed3-4a93-8433-1207e59f56e7@intel.com>
From: Fuad Tabba <tabba@google.com>
Date: Wed, 16 Jul 2025 13:54:15 +0100
X-Gm-Features: Ac12FXyFhk5Ea2iRIAOGi8JPKWZm4iBDcstyagLqnmugwx2wsA5Hot8K1UY8_ZA
Message-ID: <CA+EHjTzjxGqkaUkGvsUn+GXgKxUh3nsajRSbVmOszsLcAqVzcA@mail.gmail.com>
Subject: Re: [PATCH v14 02/21] KVM: Rename CONFIG_KVM_GENERIC_PRIVATE_MEM to CONFIG_KVM_GENERIC_GMEM_POPULATE
To: Xiaoyao Li <xiaoyao.li@intel.com>
Cc: David Hildenbrand <david@redhat.com>, kvm@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	linux-mm@kvack.org, kvmarm@lists.linux.dev, pbonzini@redhat.com, 
	chenhuacai@kernel.org, mpe@ellerman.id.au, anup@brainfault.org, 
	paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu, 
	seanjc@google.com, viro@zeniv.linux.org.uk, brauner@kernel.org, 
	willy@infradead.org, akpm@linux-foundation.org, yilun.xu@intel.com, 
	chao.p.peng@linux.intel.com, jarkko@kernel.org, amoorthy@google.com, 
	dmatlack@google.com, isaku.yamahata@intel.com, mic@digikod.net, 
	vbabka@suse.cz, vannapurve@google.com, ackerleytng@google.com, 
	mail@maciej.szmigiero.name, michael.roth@amd.com, wei.w.wang@intel.com, 
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

Hi Xiaoyao,

<snip>
> Not really the same result.
>
> The two-step patches I proposed doesn't produce the below thing of this
> original patch. It doesn't make sense to select
> KVM_GENERIC_GMEM_POPULATE for KVM_SW_PROTECTED_VM from the name.

I think I see where you're going. That said, other than in the
configuration files, in all the actual code, the purpose of
KVM_GENERIC_PRIVATE_MEMis to guard  kvm_gmem_populate(). So
I disagree with you, and I think that this should be one patch that
fixes the name. That said, I agree with you regarding:

-       select KVM_GENERIC_PRIVATE_MEM if KVM_SW_PROTECTED_VM
+       select KVM_GENERIC_MEMORY_ATTRIBUTES if KVM_SW_PROTECTED_VM
+       select KVM_GMEM if KVM_SW_PROTECTED_VM

Cheers,
/fuad

