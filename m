Return-Path: <linux-arm-msm+bounces-47620-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DD729A31159
	for <lists+linux-arm-msm@lfdr.de>; Tue, 11 Feb 2025 17:30:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id B95797A1FDB
	for <lists+linux-arm-msm@lfdr.de>; Tue, 11 Feb 2025 16:29:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 301EE24C679;
	Tue, 11 Feb 2025 16:29:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="o95N7Zr1"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 647CC26BD8E
	for <linux-arm-msm@vger.kernel.org>; Tue, 11 Feb 2025 16:29:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739291396; cv=none; b=hi7s98GdAA2bQsnHPtoxxRGb3Yh/7voioTxxus4/OQU8xScc8y4OZ8IHVWusmxdMxOABBMTlNUH+dqWysmB2P3uuogsq43d0pYCb8SgIFUgdlsR+BK9Y/fvwBfOmEuing6Pvbsr/edw+t99wBEPqhe9N3CqMb0HTTyMIp4W4UsQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739291396; c=relaxed/simple;
	bh=TGWJJNl/ouS8GrPV1JAQvbYqfNVgYK/o5wsywdkv0k0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bwfqhurynaypCn/I5VLPWKiXQY14kOhUNuPXdk2ExrkSQfnlq0mZQJug64TCwRZyCmBDTlMT+AkFzpKWDYSJa7UWMewgR/L27f1dPqRYymi6F2lXZ9MLulBnpB0OVihld1jKfcO4nsRfrvaeYenKKgtiTCRlIBVauGapOkVfZ/s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=o95N7Zr1; arc=none smtp.client-ip=209.85.218.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-aaee2c5ee6eso937146266b.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 11 Feb 2025 08:29:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1739291393; x=1739896193; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=oTKc8O2xhSlItJQZLHeJlYNUY/i+GeTW1EidQ/oJtlk=;
        b=o95N7Zr1MU72gecSMOBnnUxunFLpIILsH1fGxxo5wj81E40HLuLVu/M1tSfaNZv3Uq
         +Xqi3vQIO0X1msL+raTp5FqwLkGpPiBmb9FRLsZaegN4WmFG7TDjvTwAw4G9BHUbKHO4
         7xzpb5yAwGpvlnePVyzWL8isd+nu/6lg/fAPGyoEUUfH5ds6t/8j3dEvakAY9a84CiDt
         U9vhT6KWVHcRjB/v8BliN9Qzkbda5ufoJr5wRgrOrtFKqmSfAcEXXU1sJ442zW1zAs/a
         5JDH/nnS8qQ/UHMNrT8FHOuSQI1EzTXVJzYOI+CvSs4Qy7T2tZRqYgXbz8GPjep8Kuwu
         eNnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739291393; x=1739896193;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oTKc8O2xhSlItJQZLHeJlYNUY/i+GeTW1EidQ/oJtlk=;
        b=LxM0T0ru/PBrybrPXxyWzyTJpXySp47pSz+0y/0uqATd/C7qNdeFRIQaS+YxCiCwti
         XgFaZh1WFHqmoOl+3JumfObWD4bJDqPtj0jdHsfjBfmaYoIusbw48Rb5ERg/0wyFsKha
         hZ128py655KI1HW+Kh+ASMWwvQtB2F58mUTxYIxkCtKLSM95jW335nEAez4pBuFQ7coY
         BcuhPzfJv7JEYW78eBk8e9SwH8OI2M6dqtwb4nxYzfbUyqrFfPIHJnlxsK/sriX7H5W+
         gOWVWwalZNRHOkI0Q5INykWeZ1oHkqMx9Y2eDGJZCt7oPcAprydKDxJVRd7oOWatbf43
         X4FQ==
X-Forwarded-Encrypted: i=1; AJvYcCXGPTi7lefnCDX/Dxb7u6j4gYjNKiKbCANKn6XeT1Yxh6VK4dqStfUjw4B79RF9Xcf1MnuAnYONmyA6sY0f@vger.kernel.org
X-Gm-Message-State: AOJu0YwXsKVwtSZPzqi84IoMBRBv2dp07S7D937pQPjUEgnI2iz2PfnK
	7KcNWp1tmwL+abIBRAhYm0MQJXQQAK4aOBYN3MhNN+qWPDe5PK3CWBXvCll9vA==
X-Gm-Gg: ASbGncsXCb8YB3cspJjDwVQ0X/5+/6rFP/+HmPZptv0jOvrj4uBW4W9Qs4TXK7E53lX
	l7Vsc8KGwhFEi6PDbnVTayY6tL7d5uum1oIRp8WC2l6roUEVHAJr4g0GpW1v8I3T9NcM2eNLs8c
	xXjFOE9r5c1c0oHo2mMSZMlzm5C9eY43AzLbFL0XTUSX9TJl3c7zw3QNad9WKZJVwILFkGse6ZZ
	b3DTphNKDpc82W1+ILMTnHsFTS4ZOrv2dIJHiTc2Tcgt+WDIAEOyqy1jqtEg91iH+KC4XHOXKnq
	s2V2ZXNegVSKtm4M8SJ2ChzE87vHu6/Wa63wnVBRzInLLZ5Z1RXl
X-Google-Smtp-Source: AGHT+IHsyVU9J+CUk3viX6pcLm6IInJq+JNASwlrWLBMLzojURwPpJGFPY0UrOtJAuuwI/PYinzVhw==
X-Received: by 2002:a17:907:720d:b0:ab7:e91c:77e5 with SMTP id a640c23a62f3a-ab7e91c7d7emr239441166b.11.1739291392390;
        Tue, 11 Feb 2025 08:29:52 -0800 (PST)
Received: from google.com (229.112.91.34.bc.googleusercontent.com. [34.91.112.229])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ab7b35b0d2csm564886966b.122.2025.02.11.08.29.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Feb 2025 08:29:51 -0800 (PST)
Date: Tue, 11 Feb 2025 16:29:48 +0000
From: Quentin Perret <qperret@google.com>
To: Fuad Tabba <tabba@google.com>
Cc: kvm@vger.kernel.org, linux-arm-msm@vger.kernel.org, linux-mm@kvack.org,
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
	maz@kernel.org, will@kernel.org, keirf@google.com,
	roypat@amazon.co.uk, shuah@kernel.org, hch@infradead.org,
	jgg@nvidia.com, rientjes@google.com, jhubbard@nvidia.com,
	fvdl@google.com, hughd@google.com, jthoughton@google.com
Subject: Re: [PATCH v3 09/11] KVM: arm64: Introduce
 KVM_VM_TYPE_ARM_SW_PROTECTED machine type
Message-ID: <Z6t6_M8un1Cf3nmk@google.com>
References: <20250211121128.703390-1-tabba@google.com>
 <20250211121128.703390-10-tabba@google.com>
 <Z6t227f31unTnQQt@google.com>
 <CA+EHjTweTLDzhcCoEZYP4iyuti+8TU3HbtLHh+u5ark6WDjbsA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CA+EHjTweTLDzhcCoEZYP4iyuti+8TU3HbtLHh+u5ark6WDjbsA@mail.gmail.com>

On Tuesday 11 Feb 2025 at 16:17:25 (+0000), Fuad Tabba wrote:
> Hi Quentin,
> 
> On Tue, 11 Feb 2025 at 16:12, Quentin Perret <qperret@google.com> wrote:
> >
> > Hi Fuad,
> >
> > On Tuesday 11 Feb 2025 at 12:11:25 (+0000), Fuad Tabba wrote:
> > > diff --git a/include/uapi/linux/kvm.h b/include/uapi/linux/kvm.h
> > > index 117937a895da..f155d3781e08 100644
> > > --- a/include/uapi/linux/kvm.h
> > > +++ b/include/uapi/linux/kvm.h
> > > @@ -652,6 +652,12 @@ struct kvm_enable_cap {
> > >  #define KVM_VM_TYPE_ARM_IPA_SIZE_MASK        0xffULL
> > >  #define KVM_VM_TYPE_ARM_IPA_SIZE(x)          \
> > >       ((x) & KVM_VM_TYPE_ARM_IPA_SIZE_MASK)
> > > +
> > > +#define KVM_VM_TYPE_ARM_SW_PROTECTED (1UL << 9)
> >
> > FWIW, the downstream Android code has used bit 31 since forever
> > for that.
> >
> > Although I very much believe that upstream should not care about the
> > downstream mess in general, in this particular instance bit 9 really
> > isn't superior in any way, and there's a bunch of existing userspace
> > code that uses bit 31 today as we speak. It is very much Android's
> > problem to update these userspace programs if we do go with bit 9
> > upstream, but I don't really see how that would benefit upstream
> > either.
> >
> > So, given that there is no maintenance cost for upstream to use bit 31
> > instead of 9, I'd vote for using bit 31 and ease the landing with
> > existing userspace code, unless folks are really opinionated with this
> > stuff :)
> 
> My thinking is that this bit does _not_ mean pKVM. It means an
> experimental software VM that is similar to the x86
> KVM_X86_SW_PROTECTED_VM. Hence why I didn't choose bit 31.
> 
> From Documentation/virt/kvm/api.rst (for x86):
> 
> '''
> Note, KVM_X86_SW_PROTECTED_VM is currently only for development and testing.
> Do not use KVM_X86_SW_PROTECTED_VM for "real" VMs, and especially not in
> production.  The behavior and effective ABI for software-protected VMs is
> unstable.
> '''
> 
> which is similar to the documentation I added here.

Aha, I see, but are we going to allocate _another_ bit for protected VMs
proper once they're supported? Or just update the doc for the existing
bit? If the latter, then I guess this discussion can still happen :)

Thanks,
Quentin

