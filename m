Return-Path: <linux-arm-msm+bounces-56489-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 01736AA713E
	for <lists+linux-arm-msm@lfdr.de>; Fri,  2 May 2025 14:08:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 183E43A7210
	for <lists+linux-arm-msm@lfdr.de>; Fri,  2 May 2025 12:08:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 29A5D230BD2;
	Fri,  2 May 2025 12:08:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="GSnBGksC"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-qt1-f179.google.com (mail-qt1-f179.google.com [209.85.160.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BCCF22A7E2
	for <linux-arm-msm@vger.kernel.org>; Fri,  2 May 2025 12:08:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746187713; cv=none; b=GRkET3DLumk7xzrNPvjc6EIpvhtjbjM1WSWEAYQDC8AdYZc8oN4VCxvGiS/uqSuZxlPf+6GxOf7zPKkMdvpnylNUTslyXuVS8FmkZrBQ3xr7Q9lzhMNyXs5cJN8WqcqzQhfZ/kmMhlaSmlPt5y12XMczl4hZACs1kAdR19fCXiY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746187713; c=relaxed/simple;
	bh=QOYAWpKobYqIjKphpV8Z/XKHUtk5wosLnvilAePfXLE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Kqbujf5HWjoDAzMjh1tdJggn8gRfAQ8Q73mADnSQXtU6k8UuldzmYwYkfoJXKLXuIRdflSIYLXd/xSgbbNOOItvo9poawhY1EmCGCtzE2NVevIwCHlD4jPhaPzrZiyLqr8CbjPU/fuFvhIrOYKO4yMaOHEoVNz4v8JqzIRSOB8E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=GSnBGksC; arc=none smtp.client-ip=209.85.160.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-qt1-f179.google.com with SMTP id d75a77b69052e-47666573242so276531cf.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 02 May 2025 05:08:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1746187710; x=1746792510; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=QOYAWpKobYqIjKphpV8Z/XKHUtk5wosLnvilAePfXLE=;
        b=GSnBGksChFEouPySf6ys9/HEZS7t/eR4bbS/j9IbvKkvC8IWykxDrys5sA4Sf8B1ww
         ShklWetyejpVkyGTBYNvFDtudKarmbPfEvu7vQkldjtN3Ar+V83Zp+62s//E6Uzm2xe2
         G0pTH7fV8ZNgh1Y40D8oS8I3fUexAOlG1XXVkHwbO/GER4Gmq+d7NoQUhn+FIJqcH+nM
         7DLZ5cKzt/0t9qO7ObFdbi4t3LXKEeZmDVq12tutmqzTn6ld5KBvIcrxpFIMtjpRRcGK
         FglYljHIIHdIUL2PTuES8watsGzHnNdaiCgsXEf8NioNlWBNMp09TlnnUTEhEicfi+nE
         fI0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746187710; x=1746792510;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QOYAWpKobYqIjKphpV8Z/XKHUtk5wosLnvilAePfXLE=;
        b=cfUq0e7Oehj5r1DQtzmm3Tfd9DwXjAzuK4DyptLN713jVM961fsxAnPPOIWjjYokOr
         fDw2xAZIRkppX1LGRUg+D1mGXP/94vlUWlYC+CT+Uxx6DWT15v3imdqo8V5yUfS4YU38
         JjSNF26yl2I7PfpPuhIIVe2mktiHdKLChK0djsTqI28sT2fqMecrPXbLROovFYUwYFPF
         NTCLiwyN0pD86RUVsNZkkhgWx5lfYw144qoG3bMIUVcghXeuF4HCF3FOVyQMj45ByzOf
         TYURE4bYjUy1t7Xwzcgx3mj2xc2InIFMDaDz03rc0nk4Ps9d7r6SkZlnYSSG1d++CUP/
         R2AQ==
X-Forwarded-Encrypted: i=1; AJvYcCUt7cB7sDzDrvuNCK4HIKOs574SKRBRD6WIzra38qNH+Dkbn+S3VPyHzqugp+Dd13MIqGeTujsnoHuAqv93@vger.kernel.org
X-Gm-Message-State: AOJu0YzCjUTfICruhZ0AVvU9eoZIiYfy3OJsLTNYjDgnPGAX7JRbGcCF
	2N9DIwEE3XGTjzQvUhRHN4gD/kQf+hnUc0w8+E21jk0MpeAVzawkFASkwf+KDTVF8auaae/qGJF
	tnQISuSnu/1ElbA8NNy6Fth/jSVtPKxYxVeuK
X-Gm-Gg: ASbGncsMOUiSavE/wnugIZ3GquaO8mg2cyCYOJ6pxljrHYKo5KBch7T/L4fq7BKvZnz
	x7MCR6WbPHVFQcboBkwXVJUR3pnSZ0LKzTTy2yU6pyr17GuQ1+XqFzaIgH+DgjIHGoZA1Ou2ufQ
	1qaXK1QTrvYH9+yX1yYq91Yz8=
X-Google-Smtp-Source: AGHT+IFD/MsTgc6vAXhalHp3lSHY/zI6yBsMV+4pwk8VJYi3tcrdAsdF1VYpeQlCegmMmQLptp5frPe2rF3QY8nkeMQ=
X-Received: by 2002:ac8:5f50:0:b0:466:8887:6751 with SMTP id
 d75a77b69052e-48b0dfdf479mr7304751cf.23.1746187710146; Fri, 02 May 2025
 05:08:30 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250430165655.605595-1-tabba@google.com> <20250430165655.605595-8-tabba@google.com>
 <6813eb1d4a3c7_2751462949f@iweiny-mobl.notmuch>
In-Reply-To: <6813eb1d4a3c7_2751462949f@iweiny-mobl.notmuch>
From: Fuad Tabba <tabba@google.com>
Date: Fri, 2 May 2025 13:07:53 +0100
X-Gm-Features: ATxdqUEyPJsH6qCjTcFpIIVKvFZgDnFG5sJ_CyENlF3D_EvMdzHrMzHO_DPv0oc
Message-ID: <CA+EHjTwmC=+tzKHvkH5t_mgg0irOwwZyD0N8BiCSYkyre+=JCw@mail.gmail.com>
Subject: Re: [PATCH v8 07/13] KVM: Fix comments that refer to slots_lock
To: Ira Weiny <ira.weiny@intel.com>
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
	jthoughton@google.com, peterx@redhat.com, pankaj.gupta@amd.com
Content-Type: text/plain; charset="UTF-8"

On Thu, 1 May 2025 at 22:43, Ira Weiny <ira.weiny@intel.com> wrote:
>
> Fuad Tabba wrote:
> > Fix comments so that they refer to slots_lock instead of slots_locks
> > (remove trailing s).
> >
> > Signed-off-by: Fuad Tabba <tabba@google.com>
>
> Reviewed-by: Ira Weiny <ira.weiny@intel.com>

Thank you for the reviews!
/fuad

> [snip]

