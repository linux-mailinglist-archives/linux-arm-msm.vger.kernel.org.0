Return-Path: <linux-arm-msm+bounces-67163-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B5E3B161FA
	for <lists+linux-arm-msm@lfdr.de>; Wed, 30 Jul 2025 15:55:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6D0343B6226
	for <lists+linux-arm-msm@lfdr.de>; Wed, 30 Jul 2025 13:55:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2BAEB2D8DC3;
	Wed, 30 Jul 2025 13:55:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="U4D8eQXA"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62D392D8DA6
	for <linux-arm-msm@vger.kernel.org>; Wed, 30 Jul 2025 13:55:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753883730; cv=none; b=KzI5Ecv01A9VpzmiQK9pV+Ec0MeBQQKYsQpL/iIa8OzMbPC3suKhFxyAUNGBbm9WGWbTJ0YmSw1mY0KJ5NN1mwqtfHQYpP4urupJ4NGgL0bki6SoiuCqw/bmFriU4+rFWuG3j2HgC6gxkTXDcmPyMJjsCOoM3AoqG7ZZvb/TTo4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753883730; c=relaxed/simple;
	bh=03dvLXzJnjJL/BzSORv5mrGgeHu9RiQtwL9YnjAKfQw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=tesI5+agdNcH4FEqCrwXtYSYdI73jUi5hGJss5r8MNtJa+36YqiaoLBcThd3n5iXV7Obc6O/u9PqxTE3RBYbT3q/norE3KZaOaKCrwfRmlM4QOINm18sigFtmg6K9qpmfxQhskv6aBTbVfosLb0wNNryPR3BkOCQTOC2UN46Skw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=U4D8eQXA; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1753883727;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=3VcFQqoev4ndFVh1DgWdnNI6LwW73kLIz7RUlLHtApU=;
	b=U4D8eQXA+5wuPHvqhTS/DElTxJb5SXU6AfRUn+4VEWgSUlULNE0DNEbTLXvDGBlLex0u2A
	vLlZ4YGleS7WkEKJD6ERsdKOUIXqM2ALqE+DL0lWroyURD9blrIRlXIG52lYYh+AZWrJKd
	agq4jY8v8Ve2jUrRzByL9YpwHrEPYAI=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-380--1RPmEd4Mk2rRGl2e6tYRw-1; Wed, 30 Jul 2025 09:55:26 -0400
X-MC-Unique: -1RPmEd4Mk2rRGl2e6tYRw-1
X-Mimecast-MFC-AGG-ID: -1RPmEd4Mk2rRGl2e6tYRw_1753883725
Received: by mail-ej1-f71.google.com with SMTP id a640c23a62f3a-ae6d6b8eacbso523674366b.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 30 Jul 2025 06:55:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753883725; x=1754488525;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:from:references:cc:to:subject:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=3VcFQqoev4ndFVh1DgWdnNI6LwW73kLIz7RUlLHtApU=;
        b=HosauR/ZesM9qHbLZaniFb0N8ZZZrZzafdrb1zRGKDOomDConAiZ3JGztGRnEq7X4S
         KyL4afVM8XaNaKE0Ai4bIFvM36o1vLB0KUX4WA2PEK/CRYt+6n0JEKxrTz92EA0RE1Gz
         8TdcAeTfdGbBMIM9EtTVgU5IKYsE3tuWyw/kV46hjUbFtF/AJoTJmuE820UiuZsKg5JP
         rMD3ViiFSKLtq2F2J4rtQYAsaMXYV035jGnX6f4e/Yg5JbJ/WEL8Wc0sm7oF9ZmtkhoT
         qexT8qs0ipq6rVXvrkJ+nYUArm3RmbhTcvPeidLv8W0NyINLJQ2MuGNXhzT6Y2wwj+Y/
         x3+Q==
X-Forwarded-Encrypted: i=1; AJvYcCVx4pJOosMcWS90OXNHuk9qIAk/+mjOirtOMKcQW/ZLM0qXM5P1KuQ7ye8uDFJPmz2AeyW1QahU1UHO9TyQ@vger.kernel.org
X-Gm-Message-State: AOJu0Ywz3VRWWx/qndKObpr6dr/DatYkKZFrntc/vQQjVDNvwUi1R45+
	kDwV52FEryR51xqSJY9eupyqqT0D7jh5jj/xthq9bAVfDAg8F0zb3EQaxiJ9hTyT4l8E82vAQlh
	RjkVDpbRlndTDa1RTKOJvE6sdMCEzNpvDp8V1M0ULwekZpqYIIayxd6tHz0UBkVNdFrw=
X-Gm-Gg: ASbGnct8p/coRvG1w2dlYOMnghE2tVF9bZzzngfg+dkC99Ph9VPMdeNTeqM1FwYNi1F
	9wKTSn7bOgLq76xPBhnpSLHBSL3Pvfmvk4uKHSiUwHSim4CPBs5+Sv750Z1UYIinZNtZmMJIjcA
	dev9VLSc/3AcyHbfhVjUC5gyMY/pTZmpVACrw3+WTykR9EXYoX0yz7YKOyj/zzuj/SnHQ6SNdES
	nh0a05G2r6kO0UnkMdFt0ZTWLMd7vGqn7jdfcPIDRkgz1Z/aZBbKWEFlCB4tzjRknB3aufszpA8
	nmGzVRoKy7QkunqcnqibQiJ1to0AZxevON7j/aFO5aOUSO9BOYy4Rh9HXZwKug==
X-Received: by 2002:a17:907:3f16:b0:ada:4b3c:ea81 with SMTP id a640c23a62f3a-af8fd957532mr381802066b.39.1753883724934;
        Wed, 30 Jul 2025 06:55:24 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGnFvdC4+f6/eJenyOa18wsoa3h5I67gwGBhJ32KqQ2TAENVXY/DrKoXNbTnHSurkHrTJi8SA==
X-Received: by 2002:a17:907:3f16:b0:ada:4b3c:ea81 with SMTP id a640c23a62f3a-af8fd957532mr381798266b.39.1753883724471;
        Wed, 30 Jul 2025 06:55:24 -0700 (PDT)
Received: from [10.32.64.156] (nat-pool-muc-t.redhat.com. [149.14.88.26])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-af63585fff3sm750425466b.21.2025.07.30.06.55.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 30 Jul 2025 06:55:23 -0700 (PDT)
Message-ID: <7ecaae9e-a088-4c1b-9caf-6a006a756544@redhat.com>
Date: Wed, 30 Jul 2025 15:55:22 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC][PATCH v2 16/29] mm/show_mem: Annotate static information
 into Kmemdump
To: Eugen Hristev <eugen.hristev@linaro.org>, linux-kernel@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, linux-arch@vger.kernel.org,
 linux-mm@kvack.org, tglx@linutronix.de, andersson@kernel.org,
 pmladek@suse.com
Cc: linux-arm-kernel@lists.infradead.org, linux-hardening@vger.kernel.org,
 corbet@lwn.net, mojha@qti.qualcomm.com, rostedt@goodmis.org,
 jonechou@google.com, tudor.ambarus@linaro.org
References: <20250724135512.518487-1-eugen.hristev@linaro.org>
 <20250724135512.518487-17-eugen.hristev@linaro.org>
From: David Hildenbrand <david@redhat.com>
Content-Language: en-US
Autocrypt: addr=david@redhat.com; keydata=
 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
 g3eXuA==
Organization: Red Hat
In-Reply-To: <20250724135512.518487-17-eugen.hristev@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 24.07.25 15:54, Eugen Hristev wrote:
> Annotate vital static information into kmemdump:
>   - _totalram_pages
> 
> Information on these variables is stored into dedicated kmemdump section.
> 
> Signed-off-by: Eugen Hristev <eugen.hristev@linaro.org>
> ---
>   mm/show_mem.c | 2 ++
>   1 file changed, 2 insertions(+)
> 
> diff --git a/mm/show_mem.c b/mm/show_mem.c
> index 41999e94a56d..93a5dc041ae1 100644
> --- a/mm/show_mem.c
> +++ b/mm/show_mem.c
> @@ -14,12 +14,14 @@
>   #include <linux/mmzone.h>
>   #include <linux/swap.h>
>   #include <linux/vmstat.h>
> +#include <linux/kmemdump.h>
>   
>   #include "internal.h"
>   #include "swap.h"
>   
>   atomic_long_t _totalram_pages __read_mostly;
>   EXPORT_SYMBOL(_totalram_pages);
> +KMEMDUMP_VAR_CORE(_totalram_pages, sizeof(_totalram_pages));

Tagging these variables that way is really rather ... controversial.

As these are exported globals, isn't there a way to have a list of what 
to include and what not somewhere else?

Not sure if any of that would win a beauty price, though.

-- 
Cheers,

David / dhildenb


