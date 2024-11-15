Return-Path: <linux-arm-msm+bounces-37995-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id CB0699CDC9D
	for <lists+linux-arm-msm@lfdr.de>; Fri, 15 Nov 2024 11:32:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 2C9F3B28E2B
	for <lists+linux-arm-msm@lfdr.de>; Fri, 15 Nov 2024 10:32:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 418701AF0BF;
	Fri, 15 Nov 2024 10:31:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="NG2hrCZF"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71485192B9D
	for <linux-arm-msm@vger.kernel.org>; Fri, 15 Nov 2024 10:31:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731666688; cv=none; b=SppRnCCo4zK3HoUiFAG/w2mEKTaibs4PAcdzs7xVuc7QpxtaupmRsxKXvhbsGMED5hqlI6fLAGMqp1yZxYFU936QU1hFsZBPWCOz0KhcpU+zB2svinlKMendpHdB33FfHeT3WLrx53f4Pi+/2fkDXtX5sIMTJCyUTHWiuGpsNac=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731666688; c=relaxed/simple;
	bh=yvfezaSRQKzXueO363ieESFFIt2B4C9r0Uqrv+vvU08=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=RHevIwHNXHgLNMhoxI3NYiYzpqu+dAGF539ScByqw1n0MLGNRRMasBY17F3sjmB7pPz3vq1bs7121SEh4gzq3iqj5sKgltQ/GRgIfMVzmvJTz4wbfsJM1SfaStHJGKHiP9R3VqP04F6KC2WiiD312QSARQElecly4jrpzRzOTDI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=NG2hrCZF; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1731666685;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=2QzJEh1uH0p2OuQd5yMwTk7/0LxYqplTeSNY5bJ8Vss=;
	b=NG2hrCZF/4WCwOijUM4bVD8HlSQRKaINROvgNS2d1+JexwZn6he7lf1afkl72bbjD7syhF
	Xk1wTr7AF4yVCBwvV0ml+IozEipO3/gvEhDR20pHHuDOL0lO+mjqArv/o5hzg/0Ohajuyk
	TTvqQ82Dzjj3Y9bAJId7R1SHZcva/jI=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-362-zFdii-csNSq4ErX3z1LmXA-1; Fri, 15 Nov 2024 05:31:23 -0500
X-MC-Unique: zFdii-csNSq4ErX3z1LmXA-1
X-Mimecast-MFC-AGG-ID: zFdii-csNSq4ErX3z1LmXA
Received: by mail-wr1-f71.google.com with SMTP id ffacd0b85a97d-3822ec50b60so18979f8f.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 15 Nov 2024 02:31:22 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731666682; x=1732271482;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:from:references:cc:to:subject:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=2QzJEh1uH0p2OuQd5yMwTk7/0LxYqplTeSNY5bJ8Vss=;
        b=uNARzCcQUqZRKldU06ttXoYSgTxhycc7BbgKFwS3ukhunOew4pvTsLQLNJSwMzsVZM
         eI8Yf8KA8cIFEKPFOSU3JUth/WdnunxwRs6a0PwkzrmSqFoylFHSS0PZIvKjFs90QaGc
         EBkBUds8vgGup0uqoXdXygiUy2tZVtaou8vkWUbmXCQaRk/A1bZ93d212HcdKD80Fbev
         LQgFUQdv1NzrhPL9dIitip5r39LVdJDyPLztTsua3wPZX/L9HFqF0LWQ8hZWig10G7SI
         HNsvRMjre9EU4KWL1X/YUu6oJrY1BTT+mULyyNb7lB52ByibCnsJku80NCDnFZG+D8Pu
         YkcA==
X-Forwarded-Encrypted: i=1; AJvYcCWnAPQOKAe7nLTq8JBwuhXPzQB9mFI0tEnIuik2+N396ra0Es06r5F2vE3OP10ue9abcGvUDh+2R8GteB3W@vger.kernel.org
X-Gm-Message-State: AOJu0YxD6G8hPwT4NUV1CA0Nd4jahBd8YKJi6ARD1C+53BdmitwI7X5X
	uuLOW1+tYGn8+JKbD7IFU3jy1tuPK25mlVLoWmeejvCDbAnmk/RrVZzFc/FCFq59LriAexazXoY
	haAULHluOnDm/warb7PtEeScALVxJt5og4oTUa6Mj7MBfcdJkA9S8gYznUNH0tT0=
X-Received: by 2002:a05:600c:1d16:b0:431:60ec:7a96 with SMTP id 5b1f17b1804b1-432df78dde5mr16800575e9.25.1731666681921;
        Fri, 15 Nov 2024 02:31:21 -0800 (PST)
X-Google-Smtp-Source: AGHT+IERNMi7Q96XKnFK8FdJDpljOOIPF6yY+fTc2OudR307Gv0rqgqERoR3TbPa1yLm7FC9hbRIcA==
X-Received: by 2002:a05:600c:1d16:b0:431:60ec:7a96 with SMTP id 5b1f17b1804b1-432df78dde5mr16800295e9.25.1731666681603;
        Fri, 15 Nov 2024 02:31:21 -0800 (PST)
Received: from ?IPV6:2003:cb:c721:8100:177e:1983:5478:64ec? (p200300cbc7218100177e1983547864ec.dip0.t-ipconnect.de. [2003:cb:c721:8100:177e:1983:5478:64ec])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-432dab80a28sm49483705e9.24.2024.11.15.02.31.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 15 Nov 2024 02:31:20 -0800 (PST)
Message-ID: <1c524181-5518-44bb-9985-d9d12bb92073@redhat.com>
Date: Fri, 15 Nov 2024 11:31:19 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC v3 0/2] mm: Refactor KVM guest_memfd to introduce
 guestmem library
To: Elliot Berman <quic_eberman@quicinc.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 Sean Christopherson <seanjc@google.com>, Fuad Tabba <tabba@google.com>,
 Ackerley Tng <ackerleytng@google.com>, Mike Rapoport <rppt@kernel.org>,
 "H. Peter Anvin" <hpa@zytor.com>
Cc: James Gowans <jgowans@amazon.com>, linux-fsdevel@vger.kernel.org,
 kvm@vger.kernel.org, linux-coco@lists.linux.dev,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-mm@kvack.org
References: <20241113-guestmem-library-v3-0-71fdee85676b@quicinc.com>
From: David Hildenbrand <david@redhat.com>
Content-Language: en-US
Autocrypt: addr=david@redhat.com; keydata=
 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
 WNyWQQ==
Organization: Red Hat
In-Reply-To: <20241113-guestmem-library-v3-0-71fdee85676b@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 13.11.24 23:34, Elliot Berman wrote:
> In preparation for adding more features to KVM's guest_memfd, refactor
> and introduce a library which abtracts some of the core-mm decisions
> about managing folios associated with guest memory. The goal of the
> refactor serves two purposes:
> 
> 1. Provide an easier way to reason about memory in guest_memfd. KVM
>     needs to support multiple confidentiality models (TDX, SEV, pKVM, Arm
>     CCA). These models support different semantics for when the host
>     can(not) access guest memory. An abstraction for the allocator and
>     managing the state of pages will make it eaiser to reason about the
>     state of folios within the guest_memfd.
> 
> 2. Provide a common implementation for other users such as Gunyah [1] and
>     guestmemfs [2].
> 
> In this initial series, I'm seeking comments for the line I'm drawing
> between library and user (KVM). I've not introduced new functionality in
> this series; the first new feature will probably be Fuad's mappability
> patches [3].

Right, or the dummy mmap + vma->set_policy patches for NUMA handling.

-- 
Cheers,

David / dhildenb


