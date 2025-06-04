Return-Path: <linux-arm-msm+bounces-60175-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 32A72ACD7BB
	for <lists+linux-arm-msm@lfdr.de>; Wed,  4 Jun 2025 08:06:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 5D3871897EEB
	for <lists+linux-arm-msm@lfdr.de>; Wed,  4 Jun 2025 06:06:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 603E6262FDD;
	Wed,  4 Jun 2025 06:05:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="eWlEeDv7"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A186A23BF9F
	for <linux-arm-msm@vger.kernel.org>; Wed,  4 Jun 2025 06:05:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749017154; cv=none; b=A8gi8+HU9eA2UkqHdjYXv6520muDV5NSFLOSWqc8wULK0TeAZcfOfg8KOBHKMUUCKL3Mxx4zRxaVuD1iaDnVh2XacHVZSHExSUmTq9zk9LTVgHH2UVyVEYZqpiFNVa0OCL4wr0viJe8j7TZoH6tciwCeVDTJ4iLFnNwp92vCssw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749017154; c=relaxed/simple;
	bh=+DmDA8gTVDEKW+xZT5XGMWbGqnwbVuk5pqFDvuYEQ68=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=K3SHfxHmxj7CnME/0uPCeJ7Ttfx9RLxLWxPzxkZdPRYN7IAN5nOnXGxPMNiDp/r7HRcHDKbQRE7npAGGEKQdliJt40eC8Y/saREv7+CBkKnEtDQ8btTl9IDn/Iawsl2dMpJVGmv7CJitM9pm7QUTRyUsHCyOOWTn23ptqt098Xk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=eWlEeDv7; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1749017151;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=/ltLi5ra24Jsb0STBHkenR2Lb1EgkF/r4FbLJPR1eTI=;
	b=eWlEeDv76/X/+FjRwZdVg1vLj+o9J7Tkaf1bZVjy1XBVzCYCTwhVkvmrb3ecUXYTgTnCIX
	wUTOI82AxM/4yDH9HxoM/aYgvOYn4KN/TdHR+Yb20et9fpIEAnaBnSMg9o4ZPaJAgVslri
	MMks1mh4AILJMPOBk3vvbQUv+DNVPTM=
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com
 [209.85.210.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-314-xdFgiiTZMZuLT-hH1HIq4w-1; Wed, 04 Jun 2025 02:05:49 -0400
X-MC-Unique: xdFgiiTZMZuLT-hH1HIq4w-1
X-Mimecast-MFC-AGG-ID: xdFgiiTZMZuLT-hH1HIq4w_1749017149
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-7395d07a3dcso4833339b3a.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 03 Jun 2025 23:05:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749017148; x=1749621948;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=/ltLi5ra24Jsb0STBHkenR2Lb1EgkF/r4FbLJPR1eTI=;
        b=dMNHK3W28ZCEyT2IscSjy6b8Sv9AU4nTkeJpQYvafebVr7+/xebCt/ya5UdXdwyFeY
         RsCeOVay74OUbsidwCbm8uTJfSp095HrE18dylGV35RgCAgRiZNDTz0L5Sf9uxkuPXpU
         G1qs39Auh1gERHJSfL+qx1ih7cUzEdgJvsu0Mts8YGAh4LOc9Ry/u36AbJMSYcVq1X7N
         uxU5hiNOKrCXfQ46dUfA+ShNrJ/XYYpLOjAJJrgNuH4e+mQ7Yaav94dmZxIc85VX2JQe
         DyfnqoL1iwXqTegX/L1DerxLJJi+wetkn4fFOjax8E2SA39VPG9hb0EvUSGLvsYq3OH/
         AI8w==
X-Forwarded-Encrypted: i=1; AJvYcCXjHY0J95uqc2kebId+6lUgiyCB8YpJJ+TlBCiQjMiL6OX94XIDscfUmzQYvCCIZgiwUr/X+3QXmvsAMngS@vger.kernel.org
X-Gm-Message-State: AOJu0Yz45/JXgwp3xOMlCpkEgZyX+6AbHEhtB2IzmxT8Zlv2Vo8sgEZl
	OjAVxm1CChUJQeoRQ5Xkmkq8x23O+pVRUf5hbUR0JxWobXM5WNkdITN1A0a8w2/Zjf7fuyE9LHD
	rhse16PWVNm7JcpV1aV7qpxEkRo3iPbtYQkooG35kZEAmMjusAeIYFpAHz47/F5uhkzs=
X-Gm-Gg: ASbGncvA0QIvMAQXddDNOa/ZcT3YdxRNgmzpVSM76ys3trG15FOYL8COFBuADwdijpM
	U0hfVB5jtWNm/rlQzA7daw28YgVRyghxomA+2Y6mhTxZ5Jvsjlr+jPsaq6xCLicbHENJtePNRPD
	n0up8u5cdk/2jAL3o1hJduU5F6oGX25DhKh5xQ8jVGEpGAdio9AJUxqKBKpbr6Ew4SHJMHARWLK
	u1xntgXfhbbgMjcifNu9fntKdC7ocp/V1cDeaJ4n3D4ptPaYtJAdSbQwKXSShNFa6XaL5+GEa9O
	SvCg1hTjFj3tiia/rGz1XBmoyt4XCQJf6JAqtky1jCtPaI7wZh22nyBBNxZSlg==
X-Received: by 2002:a05:6a00:1488:b0:742:a91d:b2f6 with SMTP id d2e1a72fcca58-7480b41ed78mr2603783b3a.13.1749017148684;
        Tue, 03 Jun 2025 23:05:48 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEBsfgsaAmGId0zrYF9y6DFo02h+riK2t8uOhUFLQymVW6YzwyhCaemYYcLF8v0T3nQ6io34Q==
X-Received: by 2002:a05:6a00:1488:b0:742:a91d:b2f6 with SMTP id d2e1a72fcca58-7480b41ed78mr2603694b3a.13.1749017148117;
        Tue, 03 Jun 2025 23:05:48 -0700 (PDT)
Received: from [192.168.68.51] (n175-34-62-5.mrk21.qld.optusnet.com.au. [175.34.62.5])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b2eceb0a005sm6938285a12.7.2025.06.03.23.05.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 03 Jun 2025 23:05:47 -0700 (PDT)
Message-ID: <19aa8bb5-7133-4005-a808-8cdc8a7acfc7@redhat.com>
Date: Wed, 4 Jun 2025 16:05:27 +1000
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v10 12/16] KVM: arm64: Refactor user_mem_abort()
 calculation of force_pte
To: Fuad Tabba <tabba@google.com>, kvm@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, linux-mm@kvack.org
Cc: pbonzini@redhat.com, chenhuacai@kernel.org, mpe@ellerman.id.au,
 anup@brainfault.org, paul.walmsley@sifive.com, palmer@dabbelt.com,
 aou@eecs.berkeley.edu, seanjc@google.com, viro@zeniv.linux.org.uk,
 brauner@kernel.org, willy@infradead.org, akpm@linux-foundation.org,
 xiaoyao.li@intel.com, yilun.xu@intel.com, chao.p.peng@linux.intel.com,
 jarkko@kernel.org, amoorthy@google.com, dmatlack@google.com,
 isaku.yamahata@intel.com, mic@digikod.net, vbabka@suse.cz,
 vannapurve@google.com, ackerleytng@google.com, mail@maciej.szmigiero.name,
 david@redhat.com, michael.roth@amd.com, wei.w.wang@intel.com,
 liam.merwick@oracle.com, isaku.yamahata@gmail.com,
 kirill.shutemov@linux.intel.com, suzuki.poulose@arm.com,
 steven.price@arm.com, quic_eberman@quicinc.com, quic_mnalajal@quicinc.com,
 quic_tsoni@quicinc.com, quic_svaddagi@quicinc.com,
 quic_cvanscha@quicinc.com, quic_pderrin@quicinc.com,
 quic_pheragu@quicinc.com, catalin.marinas@arm.com, james.morse@arm.com,
 yuzenghui@huawei.com, oliver.upton@linux.dev, maz@kernel.org,
 will@kernel.org, qperret@google.com, keirf@google.com, roypat@amazon.co.uk,
 shuah@kernel.org, hch@infradead.org, jgg@nvidia.com, rientjes@google.com,
 jhubbard@nvidia.com, fvdl@google.com, hughd@google.com,
 jthoughton@google.com, peterx@redhat.com, pankaj.gupta@amd.com,
 ira.weiny@intel.com
References: <20250527180245.1413463-1-tabba@google.com>
 <20250527180245.1413463-13-tabba@google.com>
Content-Language: en-US
From: Gavin Shan <gshan@redhat.com>
In-Reply-To: <20250527180245.1413463-13-tabba@google.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 5/28/25 4:02 AM, Fuad Tabba wrote:
> To simplify the code and to make the assumptions clearer,
> refactor user_mem_abort() by immediately setting force_pte to
> true if the conditions are met. Also, remove the comment about
> logging_active being guaranteed to never be true for VM_PFNMAP
> memslots, since it's not actually correct.
> 
> No functional change intended.
> 
> Reviewed-by: David Hildenbrand <david@redhat.com>
> Signed-off-by: Fuad Tabba <tabba@google.com>
> ---
>   arch/arm64/kvm/mmu.c | 13 ++++---------
>   1 file changed, 4 insertions(+), 9 deletions(-)
> 

Reviewed-by: Gavin Shan <gshan@redhat.com>


