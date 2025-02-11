Return-Path: <linux-arm-msm+bounces-47615-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 5559EA310E1
	for <lists+linux-arm-msm@lfdr.de>; Tue, 11 Feb 2025 17:14:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id EE26A3AA7E1
	for <lists+linux-arm-msm@lfdr.de>; Tue, 11 Feb 2025 16:13:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AC6E3254AFE;
	Tue, 11 Feb 2025 16:12:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="p2mapvzQ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2D242505C8
	for <linux-arm-msm@vger.kernel.org>; Tue, 11 Feb 2025 16:12:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739290339; cv=none; b=fEH5zDc5jg6/Z2kLb+iEQ80sMl3YWdZ94JQ4IQ8PakhPpjZ1eiZpJKR3YFY7lOMKZQMN3mPlacqSLe5ksOQXM2P7fAy/Xh0Zenc066nY3vAPkTnzLXca8RPFfIDokLSFS3sXnAMefJWXZaiCdmK8WvaaofqCpOK93XtBFjXBZ2o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739290339; c=relaxed/simple;
	bh=I67uYaPn61REPW4U1VDeEVAHoIiiTMdqz+BBTaX+76g=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MKjMO/FnhOC7oWBJ3nVV0ocnwULRiPA9AB0o8MGhkr0oW/j/Wl0AdacM6Al09TeW1fekX0La5DFEC4bAxMukAZScSp/raKvTZHmQMATiPN0x4gRP40TL3nSquVQOLN/TtNYhL3J9n0ixZ43sx0FjrjaUpNz/+QoM2dGoniwFu/I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=p2mapvzQ; arc=none smtp.client-ip=209.85.218.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-ab7d601bda0so252557466b.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 11 Feb 2025 08:12:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1739290336; x=1739895136; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=ksYhiNxYXxIQXSCUbIP2PVxMkppBVi7a3p8q7qKHPhU=;
        b=p2mapvzQ2JfqsB0JodTUuXi8FLr1wGjna4k4IBHYZIeNN6dgGE8OX35SfftQAABXxZ
         GscREQEdJ93izX4t3YKUNf+C9L3zoGOnKUncb/cdGNioYKAGqurHp0cXNfi4/M58R19K
         7KmcRDBGMssA0KXfu77Q6V18/DbwVbqIQakA6kFFuJGjJkzm0dOHEg6+yarIZvLdkVw5
         NfG9F62LA5airqBlHAc4r/Vtr17sWVhhUOURFRo8Cq6DLRutgG6/Wk1hPNK1w5Yc+nzJ
         Tr+QT/Pg+uYSPZgWi7b0i/BOU9qxgYTz9UsDGAI/708VF4R5p1gKOI9XmJm3O4+i+qFP
         SsTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739290336; x=1739895136;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ksYhiNxYXxIQXSCUbIP2PVxMkppBVi7a3p8q7qKHPhU=;
        b=iifaHC3UnZUP2a7+J03zCc9+UzcK474tIXgpHuyME2KaDU0eqOjEfiyMUCxWwwVziN
         kTeLHmvYWfZyxqKz4xby/Ay4bHza6J5WATwv2/YxKj1FMWxirvf1XK0akuSOtfhKfAmP
         GcKmEKqGCfTj7Dd4s+A/HNbDkwd0VpQHEu2Ye3wnECI6M7Ek76XM4i6tZGvqaMwo5MlR
         sayxe7Ng2fn0B+cER7TbOs+KA7OdaEsuwaczUhAr1fQ2fkJoMML6xHjWZpTWCoWMg+x/
         JRspn/rsTXUQZQV80i6/2O2bsUhDLrpYOz9qJGQ1HX/TWelpAfsWCoN0hANHPYrSKUA2
         bt7A==
X-Forwarded-Encrypted: i=1; AJvYcCU3yjC0BL8bwLr4j1NXMSsgqCCLArTK9q0c132PYy/LVA5WpX3CDZtnLqC7cBazykCRJtO7iuM01ZCrbgX2@vger.kernel.org
X-Gm-Message-State: AOJu0YzyVo7MzYlenrlZDSY+7rWN+CZkQwmJehUc9+S5xS9ZHPifsQ4e
	eR5EjBXdTuE0N5jXNGdj87RSgSB0qQvF75jbcjSHZtt46jW+pVz7gzs/iM0cgQ==
X-Gm-Gg: ASbGnctElyVx0mV10SJrgmF87vZh6bu4NP9GscDMdfzrxW1T0qdi4LnyPE6pXxp85+V
	PvHwzyQUbnwNK1N7pS9LzMAj2DksmzmSLiCrUT7XPctfkDs6ZB4IBmqBSGFDzps4bsc3nPbc8vz
	6Oc5cNrJqOl0kCupS7HRN+Dj4eNMQzh0SbPqQASVnMo7e+nE+aiz9XIwn4QU6TyiguD5VFNlEC/
	SA+5hyoLwX3Tagh3BmCxAGHf429CitXQcPYgjX3TCmyjsQxQOkv1wG+CNidBROCPhuB7ETxtncY
	0YrnZa0cghl8IAk7qyai/BEwNnoxM2QxpY32uYrFIJVTQFKxhd3e
X-Google-Smtp-Source: AGHT+IHArNcP+f9MjN7EP3uzU7DHYs7lXHuAPyrJhIGf+osevoSlQPPB7u5M+tNFRK6c5XzjVmPf/Q==
X-Received: by 2002:a17:906:c146:b0:aa6:96ad:f903 with SMTP id a640c23a62f3a-ab789bcb704mr2131203366b.31.1739290335795;
        Tue, 11 Feb 2025 08:12:15 -0800 (PST)
Received: from google.com (229.112.91.34.bc.googleusercontent.com. [34.91.112.229])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ab7bcd53bf5sm467078566b.87.2025.02.11.08.12.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Feb 2025 08:12:15 -0800 (PST)
Date: Tue, 11 Feb 2025 16:12:11 +0000
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
Message-ID: <Z6t227f31unTnQQt@google.com>
References: <20250211121128.703390-1-tabba@google.com>
 <20250211121128.703390-10-tabba@google.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250211121128.703390-10-tabba@google.com>

Hi Fuad,

On Tuesday 11 Feb 2025 at 12:11:25 (+0000), Fuad Tabba wrote:
> diff --git a/include/uapi/linux/kvm.h b/include/uapi/linux/kvm.h
> index 117937a895da..f155d3781e08 100644
> --- a/include/uapi/linux/kvm.h
> +++ b/include/uapi/linux/kvm.h
> @@ -652,6 +652,12 @@ struct kvm_enable_cap {
>  #define KVM_VM_TYPE_ARM_IPA_SIZE_MASK	0xffULL
>  #define KVM_VM_TYPE_ARM_IPA_SIZE(x)		\
>  	((x) & KVM_VM_TYPE_ARM_IPA_SIZE_MASK)
> +
> +#define KVM_VM_TYPE_ARM_SW_PROTECTED	(1UL << 9)

FWIW, the downstream Android code has used bit 31 since forever
for that.

Although I very much believe that upstream should not care about the
downstream mess in general, in this particular instance bit 9 really
isn't superior in any way, and there's a bunch of existing userspace
code that uses bit 31 today as we speak. It is very much Android's
problem to update these userspace programs if we do go with bit 9
upstream, but I don't really see how that would benefit upstream
either.

So, given that there is no maintenance cost for upstream to use bit 31
instead of 9, I'd vote for using bit 31 and ease the landing with
existing userspace code, unless folks are really opinionated with this
stuff :)

Thanks,
Quentin

> +#define KVM_VM_TYPE_MASK	(KVM_VM_TYPE_ARM_IPA_SIZE_MASK | \
> +				 KVM_VM_TYPE_ARM_SW_PROTECTED)
> +
>  /*
>   * ioctls for /dev/kvm fds:
>   */
> -- 
> 2.48.1.502.g6dc24dfdaf-goog
> 

