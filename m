Return-Path: <linux-arm-msm+bounces-27989-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 37A3094922E
	for <lists+linux-arm-msm@lfdr.de>; Tue,  6 Aug 2024 15:53:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 5BB1B1C211EA
	for <lists+linux-arm-msm@lfdr.de>; Tue,  6 Aug 2024 13:53:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C512C200127;
	Tue,  6 Aug 2024 13:51:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="VDm38b4m"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 494C01EB4AD
	for <linux-arm-msm@vger.kernel.org>; Tue,  6 Aug 2024 13:51:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722952291; cv=none; b=O3CgOTqJ7d4IZPiMV5v3VJfdX7oprDPdxyVwpJWY01IQzrvUuAtCxiyrulbyzuFpLZkx8UJLD95YWFKd8m76MUCHl/3kLZX8wUwPM3dFjMcXjw/sn3ykp5onRwmAk4YZNGQD787R6U2QPZ6nKXMj151HhkPyyLxSG/1V91Maw2A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722952291; c=relaxed/simple;
	bh=rEBQTpBlU5qZsZdAhDM90yzdJFf0K91AKjalTus1ncA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=mQOKgDMghfa/LViSgEyE09ER9riYObPKi5L1kxRc/DvXSEb8PLnsTAz0JfTp43WmNNlqw1M0PYIZ+KcjYP0EePHu6eh6/LrZkRUhmQz5pGTPZNC23InbCE7JYt3QfSa15VzIE+LDWoD76WoOROL9Q+i5+SGE4zC+oCfAa2h67ls=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=VDm38b4m; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1722952289;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=TKxQXuHwcQJALgByJr3flxDLBtQkotXdNCYtFESS9F0=;
	b=VDm38b4maQ7EUnwdBSiQ+Y65Lyx8ck85OSIOy7Eto7RZ3Fh84fxr6sMbqBYr6u772SIGaf
	s1J65SwizQYOfrK6TGXy77ewmqvNc8jfLcM8ykVX40gLH7jSqBIveB2Nr0XP5lXoAkq2JX
	6vWdW0luqXYK9xZf2vHS0Tiw2nEAPqk=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-645-y3Ja8FCcNE6AbFKrpoNpsQ-1; Tue, 06 Aug 2024 09:51:25 -0400
X-MC-Unique: y3Ja8FCcNE6AbFKrpoNpsQ-1
Received: by mail-wr1-f71.google.com with SMTP id ffacd0b85a97d-36832c7023bso360230f8f.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 06 Aug 2024 06:51:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722952285; x=1723557085;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:from:references:cc:to:subject:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=TKxQXuHwcQJALgByJr3flxDLBtQkotXdNCYtFESS9F0=;
        b=DZYhnhyJ4l6kfYqFUEIePqV9/sPQb9EDgzp4lgtg+lGXB5psiMyY8XX9vSnW74f7h+
         6sUXXq/ZAxTrs91jBWpqfK7kp0uyfsVi8KflI1i0xw/SJFEYyPdxnuVxPoaaloDOQWAO
         8/I+X9XKOqkctTltQP+v7KCwYDW/7+Nc6vnRv234Mfis6w+2SxQUO4k424tqV2HYhwuh
         ca5TpohfTzE13XBFettrBON3AekwkUoQ2INNCiZB6OU/plkGnstp1OmS3S8mHFMqNSiY
         sACM91vz19oTKhNfT4tnyF3bQ7lpewksLddBbCaI6NIyzAuD46Bd4QkR5aQk76WA73pK
         03mw==
X-Forwarded-Encrypted: i=1; AJvYcCXuSq2HZfq2+7q6/YU0kk49bGngNCbrcc8/lwMCsc/fiLHytMxppAhq172KpJ8fpdAV0pNj29oVk7EwxweJsm76cUcwLa+IPNVGHgEmWQ==
X-Gm-Message-State: AOJu0YyQQB10K2BOnqgGg9JPVreU+GqAAodSn5mWuBTgta1SMI5LBcH+
	9HDYEFNAYIrrGhRq6YOy060pKqF7Oy8iYh8TEGEilr1BfbFubYUgVaA/sozu/djV0EMRUhrzY1U
	dlxjlYpQZOmQfksbbztE1PGggdybIUgQb9XYCV8zbxQ83h0w2KopZIiSHOHQwV0o=
X-Received: by 2002:a5d:6ace:0:b0:367:9904:e6b9 with SMTP id ffacd0b85a97d-36bbc14f5ddmr7578830f8f.44.1722952284776;
        Tue, 06 Aug 2024 06:51:24 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHelcZaOAarnAunkGJ+91tlqo9Er1YHXmnpFNYHx9jhtZLMq3Wf5yH0Osq+mxeHAPytAVNyBQ==
X-Received: by 2002:a5d:6ace:0:b0:367:9904:e6b9 with SMTP id ffacd0b85a97d-36bbc14f5ddmr7578806f8f.44.1722952284287;
        Tue, 06 Aug 2024 06:51:24 -0700 (PDT)
Received: from ?IPV6:2003:cb:c73f:8500:f83c:3602:5300:88af? (p200300cbc73f8500f83c3602530088af.dip0.t-ipconnect.de. [2003:cb:c73f:8500:f83c:3602:5300:88af])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-36bbd06fbfdsm12912183f8f.106.2024.08.06.06.51.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 06 Aug 2024 06:51:23 -0700 (PDT)
Message-ID: <4cdd93ba-9019-4c12-a0e6-07b430980278@redhat.com>
Date: Tue, 6 Aug 2024 15:51:22 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC 4/4] mm: guest_memfd: Add ability for mmap'ing pages
To: Elliot Berman <quic_eberman@quicinc.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Sean Christopherson
 <seanjc@google.com>, Fuad Tabba <tabba@google.com>,
 Patrick Roy <roypat@amazon.co.uk>, qperret@google.com,
 Ackerley Tng <ackerleytng@google.com>
Cc: linux-coco@lists.linux.dev, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-mm@kvack.org, kvm@vger.kernel.org
References: <20240805-guest-memfd-lib-v1-0-e5a29a4ff5d7@quicinc.com>
 <20240805-guest-memfd-lib-v1-4-e5a29a4ff5d7@quicinc.com>
From: David Hildenbrand <david@redhat.com>
Content-Language: en-US
Autocrypt: addr=david@redhat.com; keydata=
 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
 WNyWQQ==
Organization: Red Hat
In-Reply-To: <20240805-guest-memfd-lib-v1-4-e5a29a4ff5d7@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

>   
> -	if (gmem_flags & GUEST_MEMFD_FLAG_NO_DIRECT_MAP) {
> +	if (!ops->accessible && (gmem_flags & GUEST_MEMFD_FLAG_NO_DIRECT_MAP)) {
>   		r = guest_memfd_folio_private(folio);
>   		if (r)
>   			goto out_err;
> @@ -107,6 +109,82 @@ struct folio *guest_memfd_grab_folio(struct file *file, pgoff_t index, u32 flags
>   }
>   EXPORT_SYMBOL_GPL(guest_memfd_grab_folio);
>   
> +int guest_memfd_make_inaccessible(struct file *file, struct folio *folio)
> +{
> +	unsigned long gmem_flags = (unsigned long)file->private_data;
> +	unsigned long i;
> +	int r;
> +
> +	unmap_mapping_folio(folio);
> +
> +	/**
> +	 * We can't use the refcount. It might be elevated due to
> +	 * guest/vcpu trying to access same folio as another vcpu
> +	 * or because userspace is trying to access folio for same reason

As discussed, that's insufficient. We really have to drive the refcount 
to 1 -- the single reference we expect.

What is the exact problem you are running into here? Who can just grab a 
reference and maybe do nasty things with it?

-- 
Cheers,

David / dhildenb


