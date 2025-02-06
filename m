Return-Path: <linux-arm-msm+bounces-46997-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 60749A29F4D
	for <lists+linux-arm-msm@lfdr.de>; Thu,  6 Feb 2025 04:18:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 17DC07A392D
	for <lists+linux-arm-msm@lfdr.de>; Thu,  6 Feb 2025 03:17:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DF0817DA6A;
	Thu,  6 Feb 2025 03:18:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="nxYYt/tr"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pl1-f202.google.com (mail-pl1-f202.google.com [209.85.214.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83EAC6F30F
	for <linux-arm-msm@vger.kernel.org>; Thu,  6 Feb 2025 03:18:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738811888; cv=none; b=CvkNpILMCIDqiVt9vJyvdbLjTWgcZaMVuYbA0JcvPZoRqjpLE3CVup0F88YVub1qPHvNbip7RKvKPkQUx854YxrF6v0YdYNuL3MXZlSDuHg9UCJSzcMkzBmSGiVMFCsjUr1VSxy+cToz3oN6AcMDxfOVNNYADCWgZmAQOfHtUOU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738811888; c=relaxed/simple;
	bh=47DEQpj8HBSa+/TImW+5JCeuQeRkm5NMpJWZG3hSuFU=;
	h=Date:In-Reply-To:Mime-Version:Message-ID:Subject:From:To:Cc:
	 Content-Type; b=U1RZIaIW2cKQ8eWOcdi1UFzJ+2TYLqe5+kUzTNk5G6gDLobiLR7cLgzTOz+mfE0lOB/NEZFrSf3qn5NS7ykUeyk9PqLS76KwmNxRbMihblNKAjUfsv8A5QvIiDY6Yr6peU3nlbKXTvEWBB07Amez8MlfsslCd/+BCTCieSoXoOQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--ackerleytng.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=nxYYt/tr; arc=none smtp.client-ip=209.85.214.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--ackerleytng.bounces.google.com
Received: by mail-pl1-f202.google.com with SMTP id d9443c01a7336-21f37eaef03so1814095ad.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 05 Feb 2025 19:18:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1738811887; x=1739416687; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:mime-version:in-reply-to:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=47DEQpj8HBSa+/TImW+5JCeuQeRkm5NMpJWZG3hSuFU=;
        b=nxYYt/tr3LZaB7Y+qMOSD/jZmjOqXmtuLW5gTnw/fTXuMyd6eVAXvqRGjEcRNkS32Q
         s8Im9eVpewoWWbpSOA3E3sNfXLaXyahsm/mvOsAWufydxQ6G+5zRX9f3uPOaB40Vvzk2
         /mMZFJ4Nrn93Sw9kb3SSzAQO3zXWAXrztj3FaEBVUj+/Fcy0ZaUTHZPLPNHHclGmSSqi
         098Ll6M6+pdidH+0LSxOvKKLCjJoOOQ5wGVaWncc2N7a4uKLy3hpTlHnVhg3uSi1rdPa
         /805PRLWlSF7nss0mYlBQ0LvCFfl8oHOm4vbt9cfDHScYw008vs7OIP9+L+ubB8uTRHt
         TYqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738811887; x=1739416687;
        h=cc:to:from:subject:message-id:mime-version:in-reply-to:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=47DEQpj8HBSa+/TImW+5JCeuQeRkm5NMpJWZG3hSuFU=;
        b=vkHmHucxaPIJu9WHUy28OQc/kRq5sCy/IDvPQYHhucOCULoZdfFcaftSJ5Pgk6Rm/Q
         AZKjyaUE650xxkbi/onDmJBgVXHgn6JeObGh0IyRHEFJVyzgsJ4DuBvUWNq9graJs2zp
         gKGegvdDU/yJ0t4twnW65JyMZivSYfAL5gsJAbDX4j6w2PWTlwmqyQtpyJnCsFH0R5en
         bWDjofEyrjx7wUaQMApazPoobVPFyP7xDUzszuF0QqhH9VHrRy1XsRuWfjuyjuWpB0oi
         v1LVpdLoaCF23aPoTfPGseledjwDxlqz57ClEIunh5HyxSu0lP33TcSqz7nfgxTGA4Zu
         hGpw==
X-Forwarded-Encrypted: i=1; AJvYcCUTpeVQllScPLtL0+S2lBHKhJL3Tl1KaB+gwGv+dJVozMGAiS4cqgvdW8mUNFziIpsb4ZB8Eant1WXd+7ya@vger.kernel.org
X-Gm-Message-State: AOJu0Yz8yZL0IcEi8peuBW1seF2vliKvHHa6Y3GTjuFBbR91jx2vDIVq
	jPRc4Dnr3UGOXBhJZOGzWVTGiIGkvkMtJ6q0yE+JD/wfBmGmp3d4/4dkh/cBcfndynwXUXZFbck
	y3GhZbev5lGvm7iDkNuK5jQ==
X-Google-Smtp-Source: AGHT+IEYWUr9XYWAl9VfD8M6tGsEcmMIrj94f/xQ66OItUGZ223OtfUcvUSjSKLFBgzFwxMNgf2NfB2UWbEyyCQV8g==
X-Received: from pfaw12.prod.google.com ([2002:a05:6a00:ab8c:b0:725:f324:ad1c])
 (user=ackerleytng job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6a20:d04e:b0:1e0:d89e:f5bc with SMTP id adf61e73a8af0-1ede883b82fmr9504056637.11.1738811886593;
 Wed, 05 Feb 2025 19:18:06 -0800 (PST)
Date: Thu, 06 Feb 2025 03:18:05 +0000
In-Reply-To: <CA+EHjTyToQEHoKOQLgDxdjTCCvawrtS8czsZYLehRO1N_Ph2EQ@mail.gmail.com>
 (message from Fuad Tabba on Thu, 23 Jan 2025 11:00:28 +0000)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Message-ID: <diqz8qqjsqvm.fsf@ackerleytng-ctop.c.googlers.com>
Subject: Re: [RFC PATCH v5 06/15] KVM: guest_memfd: Handle final folio_put()
 of guestmem pages
From: Ackerley Tng <ackerleytng@google.com>
To: Fuad Tabba <tabba@google.com>
Cc: vbabka@suse.cz, kvm@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	linux-mm@kvack.org, pbonzini@redhat.com, chenhuacai@kernel.org, 
	mpe@ellerman.id.au, anup@brainfault.org, paul.walmsley@sifive.com, 
	palmer@dabbelt.com, aou@eecs.berkeley.edu, seanjc@google.com, 
	viro@zeniv.linux.org.uk, brauner@kernel.org, willy@infradead.org, 
	akpm@linux-foundation.org, xiaoyao.li@intel.com, yilun.xu@intel.com, 
	chao.p.peng@linux.intel.com, jarkko@kernel.org, amoorthy@google.com, 
	dmatlack@google.com, yu.c.zhang@linux.intel.com, isaku.yamahata@intel.com, 
	mic@digikod.net, vannapurve@google.com, mail@maciej.szmigiero.name, 
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
	jthoughton@google.com
Content-Type: text/plain; charset="UTF-8"


