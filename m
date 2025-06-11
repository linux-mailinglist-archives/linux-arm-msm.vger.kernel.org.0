Return-Path: <linux-arm-msm+bounces-61017-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 12DBBAD5E07
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Jun 2025 20:21:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id A57447A393A
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Jun 2025 18:19:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 73DBB235C1E;
	Wed, 11 Jun 2025 18:20:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="QFjUXWbQ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pf1-f201.google.com (mail-pf1-f201.google.com [209.85.210.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57D85224B06
	for <linux-arm-msm@vger.kernel.org>; Wed, 11 Jun 2025 18:20:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749666055; cv=none; b=WuStxh50OnqwHtp7SCyduTUEuOSwl0yjgKJNFytVZuTKtLuAqa7JooxnBbwUcJJARkWmj44C8ZRwB81uSUgC61j5DXKHr6+J4mH9TUtcRidNRoTea3OQq+Z/Uu8R2vLUXyVn1j3RToW13I4+SjNTBX4eLmdnoQ3hSLjPJo4Mzfw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749666055; c=relaxed/simple;
	bh=L+PQ8oC5SKj2Pvt3GVWZzPVy8l1E6eCuxqGGzJ4Ezoc=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=l/a479MAEj7mCde3FjWZiViJX3w7Niv6sB+90Dyo0YUTY1farmMbBnb8lvdofAokBHFXk5JLm0tM0YBmcjQIlLr6GkL0Oh9DtySEE5tdvj2BLaMI5+8zhCPa06dDbIuMSBOF8Dz+PpGC0Vc0jFrmasXHwcQTOSBRo2TD3crH1IM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--ackerleytng.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=QFjUXWbQ; arc=none smtp.client-ip=209.85.210.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--ackerleytng.bounces.google.com
Received: by mail-pf1-f201.google.com with SMTP id d2e1a72fcca58-742b6705a52so183595b3a.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 11 Jun 2025 11:20:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1749666052; x=1750270852; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=L+PQ8oC5SKj2Pvt3GVWZzPVy8l1E6eCuxqGGzJ4Ezoc=;
        b=QFjUXWbQLMPftCuT1i4VEZ6Lj5NFSWGeK8bRb305fIDeKZaauboNIzOo2rWQK/kNOJ
         VW+pLpU2joBY/klW5zV2kHMkdHadngmcVSlaDTgtCvB+FbosmJLaSJyn3v9upmqZL8IO
         kwnJkafTiKB0pAk717NujbU0OQL3vjn+5+Hmp7W+bhGda49y1KkGdDoOqIFrHV6Ub/it
         5iV/D+rLeNTtZPiPBuLzjnaGnOpk7vyGcdyJLR97/qGYlm3mCxkKBzBzG1+KSnXGT4/C
         JjMZsTpGO5EXk+k9meoITmZ3HvzQIKff+A7Nghggwo1RW9tFix1RrGwCuIGt06wdU/xe
         nAow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749666052; x=1750270852;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=L+PQ8oC5SKj2Pvt3GVWZzPVy8l1E6eCuxqGGzJ4Ezoc=;
        b=uTxi0CnLQXZxNksaBtcsY9aAC4NZLzmWJWQZlmScmBqopfZur2ljDc44XU8zJ2jopJ
         J6RpPSrX2rU4fmtNFn6TnMarnlwNHlhv6qSaWxd+8Ora7y6VElVtHiRQXudav1Gz4xWV
         7ZaMVSmr5GNoO8mbCuERTAhDgCisfzfWhkQSmZvI1pGjSh/ahI3dZJW2lX6vby5cEWb6
         2ZT52dQhhjDv3TsYaWlOBJGAhKLx2D0UT7zQxV9w29HrQrcsxKjjqadlg1RyOS91DVC1
         hKX/gfNU6jjaLJCHbmc7kj11H43zIUscZRDchsOZextQwlL2vcXoXrZYgUnxBO+KKoVw
         z5XA==
X-Forwarded-Encrypted: i=1; AJvYcCX+TvkUpkIrZSFBudDFOEcAdptLnim0da/Dkf1ugTKewmMlxALT1ofD+IWW0Y1rkN+ByuS0/le8thDxdPQ2@vger.kernel.org
X-Gm-Message-State: AOJu0YyOlZNHjA8Zpz2/l7Mf8Pg8OvggG+y2EsD8TQHXSrCmzSnl5r9A
	s6vp0/tlc72bZjTgANRStvZ0Ou+QcsdZxt3XRbZEldoopaAMsxdjxSo2k6djsBTegPrL+8PL2Kb
	su5LLAht7sGYzRIToqi38AZfCyw==
X-Google-Smtp-Source: AGHT+IF9dOmPoH3f/Yv0MDUAXNH7QyABROACGGNRSdkVBP3APUAHFDt+InrBgJ0rMfVnQW8MeeLtIRfDXx/Of21iag==
X-Received: from pfnx17.prod.google.com ([2002:aa7:84d1:0:b0:746:27ff:87f8])
 (user=ackerleytng job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6300:41:b0:1ee:d418:f764 with SMTP id adf61e73a8af0-21f978c4298mr1110324637.38.1749666051578;
 Wed, 11 Jun 2025 11:20:51 -0700 (PDT)
Date: Wed, 11 Jun 2025 11:20:49 -0700
In-Reply-To: <95fe5d24-560b-4c20-b988-6d7072ed2293@amd.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250605153800.557144-1-tabba@google.com> <20250605153800.557144-9-tabba@google.com>
 <ad4157a1-6e38-46df-ae24-76d036972fbc@redhat.com> <95fe5d24-560b-4c20-b988-6d7072ed2293@amd.com>
Message-ID: <diqz4iwmw35q.fsf@ackerleytng-ctop.c.googlers.com>
Subject: Re: [PATCH v11 08/18] KVM: guest_memfd: Allow host to map guest_memfd pages
From: Ackerley Tng <ackerleytng@google.com>
To: Shivank Garg <shivankg@amd.com>, David Hildenbrand <david@redhat.com>, Fuad Tabba <tabba@google.com>, 
	kvm@vger.kernel.org, linux-arm-msm@vger.kernel.org, linux-mm@kvack.org, 
	kvmarm@lists.linux.dev
Cc: pbonzini@redhat.com, chenhuacai@kernel.org, mpe@ellerman.id.au, 
	anup@brainfault.org, paul.walmsley@sifive.com, palmer@dabbelt.com, 
	aou@eecs.berkeley.edu, seanjc@google.com, viro@zeniv.linux.org.uk, 
	brauner@kernel.org, willy@infradead.org, akpm@linux-foundation.org, 
	xiaoyao.li@intel.com, yilun.xu@intel.com, chao.p.peng@linux.intel.com, 
	jarkko@kernel.org, amoorthy@google.com, dmatlack@google.com, 
	isaku.yamahata@intel.com, mic@digikod.net, vbabka@suse.cz, 
	vannapurve@google.com, mail@maciej.szmigiero.name, michael.roth@amd.com, 
	wei.w.wang@intel.com, liam.merwick@oracle.com, isaku.yamahata@gmail.com, 
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Shivank Garg <shivankg@amd.com> writes:

> On 6/6/2025 2:42 PM, David Hildenbrand wrote:
>> On 05.06.25 17:37, Fuad Tabba wrote:
>>> This patch enables support for shared memory in guest_memfd, including
>>> mapping that memory from host userspace.
>>>
>>> This functionality is gated by the KVM_GMEM_SHARED_MEM Kconfig option,
>>> and enabled for a given instance by the GUEST_MEMFD_FLAG_SUPPORT_SHARED
>>> flag at creation time.
>>>
>>> Co-developed-by: Ackerley Tng <ackerleytng@google.com>
>>> Signed-off-by: Ackerley Tng <ackerleytng@google.com>
>>> Signed-off-by: Fuad Tabba <tabba@google.com>
>>> ---
>>=20
>> [...]
>>=20
>>> +static bool kvm_gmem_supports_shared(struct inode *inode)
>>> +{
>>> +=C2=A0=C2=A0=C2=A0 u64 flags;
>>> +
>>> +=C2=A0=C2=A0=C2=A0 if (!IS_ENABLED(CONFIG_KVM_GMEM_SHARED_MEM))
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return false;
>>> +
>>> +=C2=A0=C2=A0=C2=A0 flags =3D (u64)inode->i_private;
>>=20
>> Can probably do above
>>=20
>> const u64 flags =3D (u64)inode->i_private;
>>=20
>>> +
>>> +=C2=A0=C2=A0=C2=A0 return flags & GUEST_MEMFD_FLAG_SUPPORT_SHARED;
>>> +}
>>> +
>
> I agree on using const will have some safety, clarity and optimization.
> I did not understand why don't we directly check the flags like...
>
> return (u64)inode->i_private & GUEST_MEMFD_FLAG_SUPPORT_SHARED;
>
> ...which is more concise.

Imo having an explicit variable name here along with the cast is useful
in reinforcing and repeating that guest_memfd is using inode->i_private
to store flags.

I would rather retain the explicit variable name, and looks like in v11
it was retained.

>
> Thanks,
> Shivank

