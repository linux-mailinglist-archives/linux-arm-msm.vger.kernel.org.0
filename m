Return-Path: <linux-arm-msm+bounces-23208-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A458F90EABB
	for <lists+linux-arm-msm@lfdr.de>; Wed, 19 Jun 2024 14:18:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id F18ACB25CE9
	for <lists+linux-arm-msm@lfdr.de>; Wed, 19 Jun 2024 12:18:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8CDC8144D3E;
	Wed, 19 Jun 2024 12:17:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="M8p72cWm"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 172D21411E7
	for <linux-arm-msm@vger.kernel.org>; Wed, 19 Jun 2024 12:17:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718799451; cv=none; b=KSRy8XxsdeOBPULgvyhB6LIxUgFfjuEa4A683tfInMk9NV24NZ8Hwcn3ISmmQ89ZVcBol6amGKe0iP872UVMQkltriEAwksOEDPXujDViXhUcySUBF73KWpBENoO6kt0f+jO8w8VKPgRIMRORlZm9Ajzojf+ED7Mhg+q95HB3uM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718799451; c=relaxed/simple;
	bh=VedNq7jAWhCJczFirkEeMN3CFznq2DMq9bNcALqh9BE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=njuMlxeYuLpH/7L5lDEyNrBomNC55SELYg7XedLAs5Czh9BSfArmobaq4lPj1ocvkKzB77L5ieyqG+Ep1v//9PORumBpMxH0qOUsLQjvX/3jrLgJSDSlfkYAELXPKkY5hP0gEx2QJ68g20FITZI79d1s4fhqBX5je6DtDRA9zso=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=M8p72cWm; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1718799449;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=lZ1lipemd3G7go03yyEVao/dwpQoR8YSEVZm+xRYvig=;
	b=M8p72cWmF43v9wTt7YA07XLSC0wR6nLm8gNPQQCDnwEklFzy3+cEA94lF5ihcUeyoGSoky
	KJym9yu8HmwB/IW+1XFB5Nw20jXNq+uueEoG+Tfty3YRCtprpdgAHGLhEqveSCvQGNElS6
	24q2OR/CYVFXEUnmnq+SBdT588u10j8=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-642-aIAji-N-MTmVpBcZnf5enA-1; Wed, 19 Jun 2024 08:17:27 -0400
X-MC-Unique: aIAji-N-MTmVpBcZnf5enA-1
Received: by mail-wr1-f72.google.com with SMTP id ffacd0b85a97d-363edcf12a3so148501f8f.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 19 Jun 2024 05:17:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718799446; x=1719404246;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lZ1lipemd3G7go03yyEVao/dwpQoR8YSEVZm+xRYvig=;
        b=NXZnTPxHuAxC/A87L/h9axcBHiiLa1Rw92wsMg8DORcT+5yWewuKfQ6J0GAa8Txkdu
         opWv2mIscvb3zEwp0If/cwpUR66JunfTAXNC885sGpOrY8qb1pfr7DUFojHIjNB/90ML
         EAPSs3HQQW3qWSaS3QVYEU1Yubrvhl3GshoLL9VUSWi3Xq9r7BMD1O2Pf/WENDu/AAzK
         E4VIMCyQGyrd13t8M/JRgOxytG/nst6OZv/uvQtP19kUI5Z45CLHwo/Q1f6/a+fMvbCh
         9c2MOdxgrGvNKSNa9tcqGC7IVjlV52XFxs2fQSlm5u2euq2FAxbwa6UwXLCdN/vj+Q8o
         DSWQ==
X-Forwarded-Encrypted: i=1; AJvYcCXRVz72OIWeDlpocFCRT59lJReMFmZGmnBW9nKYpa8sy7In2zwznGLrxb4hBwnOWatXhty7hx/Idzfm6jfp3zNvPyeGrkZUBFcZElCPKg==
X-Gm-Message-State: AOJu0YxGs8vCDWb0PmuBzNK6RSIdxKhKUDZvSc03rkpOYpF4XjIG+b0d
	zys+CW/MIS1foZl7KDc2uQjHyhbkpJ6yM+iyjXXUf2Wd6BcH+HZhpQTRdaOtA3hDZVwmaoFtQ+8
	Ha6QTL2Ukj83QekJadkAikT5dZAQ/VM7AnF0MUamaU/W+GZgenb/6QLFZjzhWcLc=
X-Received: by 2002:a05:6000:1146:b0:360:9d23:67f8 with SMTP id ffacd0b85a97d-3631998f12dmr1750059f8f.69.1718799446095;
        Wed, 19 Jun 2024 05:17:26 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG15+go0m6xYcMCYjQISUCMDOIqOUeXuwWm3aQLyIfQuja4/fwqu/Zl6QauD/uzXJPMT0keww==
X-Received: by 2002:a05:6000:1146:b0:360:9d23:67f8 with SMTP id ffacd0b85a97d-3631998f12dmr1750038f8f.69.1718799445689;
        Wed, 19 Jun 2024 05:17:25 -0700 (PDT)
Received: from ?IPV6:2003:cb:c705:ab00:f9b6:da12:cad4:6642? (p200300cbc705ab00f9b6da12cad46642.dip0.t-ipconnect.de. [2003:cb:c705:ab00:f9b6:da12:cad4:6642])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-36394d5ef0dsm1579567f8f.64.2024.06.19.05.17.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 19 Jun 2024 05:17:24 -0700 (PDT)
Message-ID: <095dd4fb-956b-40f4-984d-14544d726f97@redhat.com>
Date: Wed, 19 Jun 2024 14:17:23 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC 0/5] mm/gup: Introduce exclusive GUP pinning
To: Jason Gunthorpe <jgg@nvidia.com>, Fuad Tabba <tabba@google.com>
Cc: John Hubbard <jhubbard@nvidia.com>,
 Elliot Berman <quic_eberman@quicinc.com>,
 Andrew Morton <akpm@linux-foundation.org>, Shuah Khan <shuah@kernel.org>,
 Matthew Wilcox <willy@infradead.org>, maz@kernel.org, kvm@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, linux-mm@kvack.org,
 linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org,
 pbonzini@redhat.com
References: <20240618-exclusive-gup-v1-0-30472a19c5d1@quicinc.com>
 <7fb8cc2c-916a-43e1-9edf-23ed35e42f51@nvidia.com>
 <14bd145a-039f-4fb9-8598-384d6a051737@redhat.com>
 <CA+EHjTxWWEHfjZ9LJqZy+VCk43qd3SMKiPF7uvAwmDdPeVhrvQ@mail.gmail.com>
 <20240619115135.GE2494510@nvidia.com>
Content-Language: en-US
From: David Hildenbrand <david@redhat.com>
Autocrypt: addr=david@redhat.com; keydata=
 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
 WNyWQQ==
Organization: Red Hat
In-Reply-To: <20240619115135.GE2494510@nvidia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

> If the memory can't be accessed by the CPU then it shouldn't be mapped
> into a PTE in the first place. The fact you made userspace faults
> (only) work is nifty but still an ugly hack to get around the fact you
> shouldn't be mapping in the first place.
> 
> We already have ZONE_DEVICE/DEVICE_PRIVATE to handle exactly this
> scenario. "memory" that cannot be touched by the CPU but can still be
> specially accessed by enlightened components.
> 
> guest_memfd, and more broadly memfd based instead of VMA based, memory
> mapping in KVM is a similar outcome to DEVICE_PRIVATE.
> 
> I think you need to stay in the world of not mapping the memory, one
> way or another.

Fully agreed. Private memory shall not be mapped.

-- 
Cheers,

David / dhildenb


