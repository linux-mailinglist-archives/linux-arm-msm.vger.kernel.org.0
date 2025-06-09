Return-Path: <linux-arm-msm+bounces-60564-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id ACBF2AD18D5
	for <lists+linux-arm-msm@lfdr.de>; Mon,  9 Jun 2025 09:06:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 982787A1916
	for <lists+linux-arm-msm@lfdr.de>; Mon,  9 Jun 2025 07:05:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E9851280A4C;
	Mon,  9 Jun 2025 07:06:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="hth+lJFS"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-qt1-f169.google.com (mail-qt1-f169.google.com [209.85.160.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6329A27FB38
	for <linux-arm-msm@vger.kernel.org>; Mon,  9 Jun 2025 07:06:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749452800; cv=none; b=SEFY7wrfLjPSGzTVPpcx9VT+xeZRSuIKSQoOiSdmUJhIwxHaAMdzv9E2yFCRMMsGzqzNSzt2tlggBGTmiq2T4aQJxm2xrHPydSPTUdXRNpNf8zCGxvNXgfKBdZIUAOq+/+mxy3iWIaOlSee7sDA+FnK4B5R+8G4NQaJLFXQJ9u0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749452800; c=relaxed/simple;
	bh=/nYlTVFkGT0OGtHTSp/hNQUXe1GD1QSrgJLAsAVqlnE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=CAbqMSWQO6hhtbbhVlvzVqfBTBIBm1CIUW+ni0vtLJ6nXdugOIJaaqTczH+pfq42KnrBOy05ZRnKmMTd4thDg6dOuORV1e2KTEIYd2FDz2EebO1riGAplCi5zUtwr7M77Eb8PhNRQ+Lr68DbEjK8/bAKITh8Vqyl3IHAmh6lUKo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=hth+lJFS; arc=none smtp.client-ip=209.85.160.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-qt1-f169.google.com with SMTP id d75a77b69052e-47e9fea29easo510701cf.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 09 Jun 2025 00:06:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1749452798; x=1750057598; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=njmwY/aoE2EHkI0yhj8tKMubAoBenpVg25f6lK/8keo=;
        b=hth+lJFSHydmbbi17hgU8iLqstIB/4OHC7dLwB6AGUcM3wqjbj2hplV6CBCGCUHg4j
         24z1Li76yKFWoq+q6RSll0OtQWUJjT8UDXtxgRz28+/WCvBvYtjI51n66st9EXjb9pvM
         bvxtW54Vff3hfoUVjWPyD5u4eZF5aVKaaeukPuJCxXl/220yBab6jKLC0klScLzN3YxN
         c3E2WMXsovqxcwEsQA3Qo4AtVQaUsc/XoUyIBmA+5WJY1iD96ZiV+atoe6c1zn+u7GpM
         wr9uN2iugDS9/jTMoL9KlzfAbNdHdMY1awtQ2YQIeV1EdHiqa6uUXqYSHatey6xcMte5
         ByFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749452798; x=1750057598;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=njmwY/aoE2EHkI0yhj8tKMubAoBenpVg25f6lK/8keo=;
        b=TJS/WMv5C7tU2e/L6UHd44/4YsLBup7qC/dbvTCfqtRoxLrVZadm4R7fGhsp547uLy
         Lafpw8dXMpHfzmRZzgOmM94yFELW6i0wx165QOjXGBCPBMdj8NLIxTH9vwEs0NOuMC2d
         7wEeO0wtX9hAcCzq5lLMa7YEQnoNYfZ/pcRT3ZJg+QCTnpIpwelizSXtCT6rDWQ6rKLD
         DnTfXS9/NF2T5wcVmPaJThGU1GLTqj+4UxrfTAWCuaJP5wVdHCM71I2T8E+uybV3R45C
         vq55pRdNVSql2w+puIHzUz72trXZL9fymDfZG8mM4QhyTx7ynzZXYjjANObscKOcQf75
         4BvQ==
X-Forwarded-Encrypted: i=1; AJvYcCWYxkbX6rissqV4cNC3yXBW7sSc1Kg4ZlVIyHtTBHjsBbyOFb2u2+1HIaeBLKtLB+kqxEpMjrvh6uFT9GQK@vger.kernel.org
X-Gm-Message-State: AOJu0YzsAI6KVNEQQc9uAT/4oXvoxoFRsffp1NGRsPh8+/rfkxO8vTNX
	ro/XZ15yYp5dMAZ5Yy+BEXlDkuBa/P7LKN5UDJPlmiTvFwTmSwXEmsHF0CZaYW/j0tk4OTD60Xa
	NiKCSlFWoK7iLMVokNk2t/svUVkl2p7vaiCZwyhwQ
X-Gm-Gg: ASbGncuicVTj4DFvuRj1Wgg5u0Hluad6lUBC4/ZkJl0Kz9Iy7iBYCEUZsOQdOnfpuBY
	ZLKhxl7I7R2L10aUXi3Ks5vRNXw3qW9nNZ/Htlm0HFHUH8guEbaXzahn5arxNMnLw8rcXlws5ux
	/czI3/VG+cKWsRwNsD/UVWfWxnbjFcEPEBkadRAqCrmp5wV9UEkh5QSQ==
X-Google-Smtp-Source: AGHT+IGchZ7SLhMAZ8W5hxY3EegUp7fjwAy75x4g922pGqe4NGnjJFDVi+3Q9Wgft0rlGl/fT20Fa5nQRkS1NNQ9g2g=
X-Received: by 2002:a05:622a:309:b0:494:b06f:7495 with SMTP id
 d75a77b69052e-4a6efa728a3mr5651671cf.24.1749452797818; Mon, 09 Jun 2025
 00:06:37 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250605153800.557144-1-tabba@google.com> <20250605153800.557144-19-tabba@google.com>
 <df4bfc32-d395-4f0b-8664-5c65e05f5af0@redhat.com>
In-Reply-To: <df4bfc32-d395-4f0b-8664-5c65e05f5af0@redhat.com>
From: Fuad Tabba <tabba@google.com>
Date: Mon, 9 Jun 2025 08:06:01 +0100
X-Gm-Features: AX0GCFtgC2aghzzNsqRBIEjFjyqySUxgD1FLhPdmCAmQ5m2-5RHKx5fP1W3VLwk
Message-ID: <CA+EHjTxoBSpcLUVDhSq=0dmvP9znKqPRtN-mDZ2YTP+6un8NVA@mail.gmail.com>
Subject: Re: [PATCH v11 18/18] KVM: selftests: guest_memfd mmap() test when
 mapping is allowed
To: Gavin Shan <gshan@redhat.com>
Cc: kvm@vger.kernel.org, linux-arm-msm@vger.kernel.org, linux-mm@kvack.org, 
	kvmarm@lists.linux.dev, pbonzini@redhat.com, chenhuacai@kernel.org, 
	mpe@ellerman.id.au, anup@brainfault.org, paul.walmsley@sifive.com, 
	palmer@dabbelt.com, aou@eecs.berkeley.edu, seanjc@google.com, 
	viro@zeniv.linux.org.uk, brauner@kernel.org, willy@infradead.org, 
	akpm@linux-foundation.org, xiaoyao.li@intel.com, yilun.xu@intel.com, 
	chao.p.peng@linux.intel.com, jarkko@kernel.org, amoorthy@google.com, 
	dmatlack@google.com, isaku.yamahata@intel.com, mic@digikod.net, 
	vbabka@suse.cz, vannapurve@google.com, ackerleytng@google.com, 
	mail@maciej.szmigiero.name, david@redhat.com, michael.roth@amd.com, 
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
Content-Type: text/plain; charset="UTF-8"

On Mon, 9 Jun 2025 at 00:44, Gavin Shan <gshan@redhat.com> wrote:
>
> On 6/6/25 1:38 AM, Fuad Tabba wrote:
> > Expand the guest_memfd selftests to include testing mapping guest
> > memory for VM types that support it.
> >
> > Co-developed-by: Ackerley Tng <ackerleytng@google.com>
> > Signed-off-by: Ackerley Tng <ackerleytng@google.com>
> > Signed-off-by: Fuad Tabba <tabba@google.com>
> > ---
> >   .../testing/selftests/kvm/guest_memfd_test.c  | 201 ++++++++++++++++--
> >   1 file changed, 180 insertions(+), 21 deletions(-)
> >
> > diff --git a/tools/testing/selftests/kvm/guest_memfd_test.c b/tools/testing/selftests/kvm/guest_memfd_test.c
> > index 341ba616cf55..1612d3adcd0d 100644
> > --- a/tools/testing/selftests/kvm/guest_memfd_test.c
> > +++ b/tools/testing/selftests/kvm/guest_memfd_test.c
> > @@ -13,6 +13,8 @@
> >
>
> Reviewed-by: Gavin Shan <gshan@redhat.com>


Thanks for the reviews!
/fuad

