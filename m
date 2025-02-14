Return-Path: <linux-arm-msm+bounces-48017-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A02AA35C3A
	for <lists+linux-arm-msm@lfdr.de>; Fri, 14 Feb 2025 12:13:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D43153AA214
	for <lists+linux-arm-msm@lfdr.de>; Fri, 14 Feb 2025 11:13:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5AF2C25EF86;
	Fri, 14 Feb 2025 11:13:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="ufVLPVS0"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88A2625A627
	for <linux-arm-msm@vger.kernel.org>; Fri, 14 Feb 2025 11:13:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739531631; cv=none; b=netkwpsFFkfQc+b54obrI4qECNMV6YfN3a2Qj5Jfw+xoCu3tNFm+i37Oy6uzae00vhqDSFv3SQecNgDkF5m1S9ypjTgQ6hFHXVaY/FX1Vp/y0+XhDGXUT6IrP9IL2jxg+l7asNEdjj03z8LKBNpbyszA4NMMi9Uq+U5e1QGq2MI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739531631; c=relaxed/simple;
	bh=rBR4qL1Ca7jnAhSSV6PIDts3fxRsSpa2e//l+WnX6cA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=eI9ADhqstMbo/xb4GzLpuZwbz6civPYNG1nua/qYeumlEc2HmXQHxf1ltyCqd9j1WqpB5oCrfI2q+bPZYJQLlNyw0ZoQiOeTlJAkGt1/CJdE1sNmcOz9bBbnwKRhVWMwADE8nFHjCoI1qROJMjVOUeE9rOAwiglKkrvjLtFnBGc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=ufVLPVS0; arc=none smtp.client-ip=209.85.208.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-ed1-f42.google.com with SMTP id 4fb4d7f45d1cf-5dccaaca646so3509558a12.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 14 Feb 2025 03:13:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1739531628; x=1740136428; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=HHuBlRfBTyi2tTfQoSCI1Ezf8XJ+sj6HiJ9YaJDrxFI=;
        b=ufVLPVS0ek8d17b89NLQ0BHxL3S6soqIBvOAwD6STc0jKZbrlJoN4YU0VYEQjloVV0
         TJVel6eNYljXbvumIs7EpZj5nghFt9AbSyCIvxFyjXri6ucPzMEegWBcJVpc5FONQGCv
         cCU5R0w8HIdo6R8r5DgDEUh5VBy3FWr8Ai4lYC/GwoR/3z22rK/AyuZiZ+7TNMu1+NG+
         LbCF7cm3YQURwQRevjx5ecqj4YYgzTL7LEvYmyOA7dlWIzsYOZvyupma2ChA9FMwNCCY
         7tz9aJqtr5OsxcHAK6skkBg+UaRM7d9XwrBcq+c2yKR+nCCR4RiHfd9yCL+ZMHptPQoy
         vJSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739531628; x=1740136428;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HHuBlRfBTyi2tTfQoSCI1Ezf8XJ+sj6HiJ9YaJDrxFI=;
        b=FlCPDFT+4hBOW6qu6ESOh+GnToUPWwT3rgPZR1oUz+C94n0uSL3The+l4m+oiRAAeK
         QebRppHrOglHLsxBM3OqGns/adJjO+Lu0uFuqegdEwIUqem2tUO1Gz1l1hiM4AB43aGB
         aRT7Pguh2B05lgrEMfACUUpajoJ0kfKdQsgwNMuNl7UxDbcEXANOmUAZKNy2CO75OAIQ
         ffw6yMsjJ5T70ht00WdfYsKxFxq3bHRdV7Uq57gEVL2GO9Udtb/vA+fta9xCO+RBaHle
         ZnBkBaP8QlGh5bep2FDSgBTIHNQdNmKKKKMHseopAX5b4Zoa9hNNLok3BsdTw2hQV1ds
         vTJQ==
X-Forwarded-Encrypted: i=1; AJvYcCWWm1CfuWjEktckObPl84OQ/NrcaBPsAJIYe1/PHKM/JlooZtaRGXx3I7B+VpC0yhoCbPcRMgLkGaW2Qh7S@vger.kernel.org
X-Gm-Message-State: AOJu0YyFcA4HIoiCOMw1aO96k3zKa5oIUyWP46O0rcrRwr5WvXcOT6nN
	3vB/ECf18JxqDd5d1O7qY+ZuXVARkIN5A+aFgTZtfY517PZoWem+UIkR4PAQQg==
X-Gm-Gg: ASbGncsoCPHe1V9T+9/ljS33NU3xUJsRiN611SXlIS6ZIddPiQw8Sj2f5iBpOhoeOkN
	ACsGYC3pFTcuDgiWyvqWwLpJnKG/+GWJgmVZrZ1uTnhHz2w7Y4/TIi3NRu/82ciYq5a7dLhK12B
	Xm+tCJLqDJqrxNSEL7bTMgwnlW0otK3gDAo6NKKDPge044t7ihnx7NmfAT4ZdKmxy6dKHJe5kNy
	YDQckhrBYXhMCN7eD5DwscEdEZHv04k/1GiWd0d1y+4iU+dqI9oiGbvJUUqxbDmmtA+qORfgx9P
	tbCfJHEo5sVZhzPPpvRYu5I4qFnkX15ZTcpgIc1DmSk8kW7mjjwT
X-Google-Smtp-Source: AGHT+IEmCSN39E0/jumPO+kRnNOBAw44OmowPjysP7dwud8ORl70XsWjK3FjsvNaHBVzgWAUCzcndA==
X-Received: by 2002:a05:6402:3507:b0:5dc:742c:c8eb with SMTP id 4fb4d7f45d1cf-5decba85751mr6054334a12.12.1739531627569;
        Fri, 14 Feb 2025 03:13:47 -0800 (PST)
Received: from google.com (229.112.91.34.bc.googleusercontent.com. [34.91.112.229])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5dece1d3738sm2872600a12.46.2025.02.14.03.13.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Feb 2025 03:13:46 -0800 (PST)
Date: Fri, 14 Feb 2025 11:13:41 +0000
From: Quentin Perret <qperret@google.com>
To: Patrick Roy <roypat@amazon.co.uk>
Cc: Fuad Tabba <tabba@google.com>, kvm@vger.kernel.org,
	linux-arm-msm@vger.kernel.org, linux-mm@kvack.org,
	pbonzini@redhat.com, chenhuacai@kernel.org, mpe@ellerman.id.au,
	anup@brainfault.org, paul.walmsley@sifive.com, palmer@dabbelt.com,
	aou@eecs.berkeley.edu, seanjc@google.com, viro@zeniv.linux.org.uk,
	brauner@kernel.org, willy@infradead.org, akpm@linux-foundation.org,
	xiaoyao.li@intel.com, yilun.xu@intel.com,
	chao.p.peng@linux.intel.com, jarkko@kernel.org, amoorthy@google.com,
	dmatlack@google.com, yu.c.zhang@linux.intel.com,
	isaku.yamahata@intel.com, mic@digikod.net, vbabka@suse.cz,
	vannapurve@google.com, ackerleytng@google.com,
	mail@maciej.szmigiero.name, david@redhat.com, michael.roth@amd.com,
	wei.w.wang@intel.com, liam.merwick@oracle.com,
	isaku.yamahata@gmail.com, kirill.shutemov@linux.intel.com,
	suzuki.poulose@arm.com, steven.price@arm.com,
	quic_eberman@quicinc.com, quic_mnalajal@quicinc.com,
	quic_tsoni@quicinc.com, quic_svaddagi@quicinc.com,
	quic_cvanscha@quicinc.com, quic_pderrin@quicinc.com,
	quic_pheragu@quicinc.com, catalin.marinas@arm.com,
	james.morse@arm.com, yuzenghui@huawei.com, oliver.upton@linux.dev,
	maz@kernel.org, will@kernel.org, keirf@google.com, shuah@kernel.org,
	hch@infradead.org, jgg@nvidia.com, rientjes@google.com,
	jhubbard@nvidia.com, fvdl@google.com, hughd@google.com,
	jthoughton@google.com
Subject: Re: [PATCH v3 09/11] KVM: arm64: Introduce
 KVM_VM_TYPE_ARM_SW_PROTECTED machine type
Message-ID: <Z68lZUeGWwIe-tEK@google.com>
References: <20250211121128.703390-1-tabba@google.com>
 <20250211121128.703390-10-tabba@google.com>
 <Z6t227f31unTnQQt@google.com>
 <CA+EHjTweTLDzhcCoEZYP4iyuti+8TU3HbtLHh+u5ark6WDjbsA@mail.gmail.com>
 <Z6t6_M8un1Cf3nmk@google.com>
 <d9645330-3a0d-4950-a50b-ce82b428e08c@amazon.co.uk>
 <Z6uEQFDbMGboHYx7@google.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z6uEQFDbMGboHYx7@google.com>

On Tuesday 11 Feb 2025 at 17:09:20 (+0000), Quentin Perret wrote:
> Hi Patrick,
> 
> On Tuesday 11 Feb 2025 at 16:32:31 (+0000), Patrick Roy wrote:
> > I was hoping that SW_PROTECTED_VM will be the VM type that something
> > like Firecracker could use, e.g. an interface to guest_memfd specifically
> > _without_ pKVM, as Fuad was saying.
> 
> I had, probably incorrectly, assumed that we'd eventually want to allow
> gmem for all VMs, including traditional KVM VMs that don't have anything
> special. Perhaps the gmem support could be exposed via a KVM_CAP in this
> case?
> 
> Anyway, no objection to the proposed approach in this patch assuming we
> will eventually have HW_PROTECTED_VM for pKVM VMs, and that _that_ can be
> bit 31 :).

Thinking about this a bit deeper, I am still wondering what this new
SW_PROTECTED VM type is buying us? Given that SW_PROTECTED VMs accept
both guest-memfd backed memslots and traditional HVA-backed memslots, we
could just make normal KVM guests accept guest-memfd memslots and get
the same thing? Is there any reason not to do that instead? Even though
SW_PROTECTED VMs are documented as 'unstable', the reality is this is
UAPI and you can bet it will end up being relied upon, so I would prefer
to have a solid reason for introducing this new VM type.

Cheers,
Quentin

