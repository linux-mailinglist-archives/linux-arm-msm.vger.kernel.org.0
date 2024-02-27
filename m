Return-Path: <linux-arm-msm+bounces-12658-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 89097868CA5
	for <lists+linux-arm-msm@lfdr.de>; Tue, 27 Feb 2024 10:49:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B23F71C2101E
	for <lists+linux-arm-msm@lfdr.de>; Tue, 27 Feb 2024 09:49:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3BDF41369B8;
	Tue, 27 Feb 2024 09:49:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="JI6vBKO1"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 907E6135A68
	for <linux-arm-msm@vger.kernel.org>; Tue, 27 Feb 2024 09:49:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709027380; cv=none; b=UczwBYqLN/TnE1v6SJQ9cUw4FsJGMSQJebNud0drPAwZFDQoH/hFMr+0hqka8oodS5+JPGUHwBwmpSSbg6InyE0osKLDEvAUcE27f2G+dv++2sWGElmcgyXR10b2E7FjI2/dcObua3MfcLV4u/TdUb4FInyBeeNf3udD60e1mIk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709027380; c=relaxed/simple;
	bh=eM1jOyGccXhfAqWDZxycXnwHdgXUi/cszVVXxT5H+F0=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=cO6i1J6QLwE8v/rHVhADVE+qdDTJuwgb+2bZPIgUIT7UsUGj2g5SxffjMKDjKBCbx2KPX3C+FqbSEhnNm7dd+4Q+mMLdoYxNR3jvXtj5svhMmA9tT3U47H6+zCxPsQNC36XkYHYs07wEBeEU4Wmfi4W5MvQai8WOTG/BRf/QHes=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=JI6vBKO1; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1709027377;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=K9Wy9hH8J7IASYziq/iVvUDp2uf5+n8c1Y4zRrtlQTM=;
	b=JI6vBKO1KSwlzcL6zulgWR91BM5oPeJQpY6Cvy4lX7sMvavaLY/M0b+RA8URvdg6OvkGZX
	FW5fgsWX/tjF56lyMPMego/KBFW351JSS76H2dWc/L09mtqbMWRKsYMnSRy9KiT6q46kNF
	aRTaymK79NApwOiQs1c+L52vEtzT6bw=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-440-B374J-GJOI25s_h4nED0oA-1; Tue, 27 Feb 2024 04:49:36 -0500
X-MC-Unique: B374J-GJOI25s_h4nED0oA-1
Received: by mail-wr1-f72.google.com with SMTP id ffacd0b85a97d-33d10bd57d7so1532507f8f.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 27 Feb 2024 01:49:35 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709027375; x=1709632175;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt:from
         :references:to:content-language:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=K9Wy9hH8J7IASYziq/iVvUDp2uf5+n8c1Y4zRrtlQTM=;
        b=VThacBOhdb0/RxEulhZkyBYBYOmeRBNtfBqCv8zl3WHUqazMPzZKwAabYo+QOpCN4e
         H1Q1J63U+CujI9FZJArB7JhMQrbLqetiqaEnZ02nFH0lENSV3Dd3oc4GiOgK60K5CGuU
         PAsRQxoVUdytLZ35nplYw2ld09yQatdhtRJaCOzK2Yr3ip/BXE81fg8aIYux65E8ys59
         3cMG3woCZK7y0m2GQ/zlAXxnfl0Zx3nD6lHzc+TINdfIPo1Ufjr0mmPSUm/fkRmMxEWl
         pUhgWrMQMSK8aETWBS6l35JKtlfDv0BCNVQNW7GcJJG1oZcenAPBeytXpv387g8SZmr9
         4Hmg==
X-Forwarded-Encrypted: i=1; AJvYcCWyFLNbAmWltcf89sHRqxtKMQ0XSC5o0C4XsN/l0UofR6t9aHNff8XtTpvqs30HaJAC+gyTcnMF2rKA754hUvLUTZ8z7hs2XBqdEXKK1A==
X-Gm-Message-State: AOJu0Yx/70Jad/xRxSUSlTQtw9YrMspc8KHGcmES86jyc5NU7MLN3QMU
	3JdND9O3hpdiSxkV9z5jsrePamZrJhflxvl/h5vyVCxFlMjKgq38tW/q49oa5MDmY0CZitTbbPB
	wWfU3p1lGA6I/XinO0Mx4EQG0ghcrgCX+es9nGcHNuRzQ/GIPIGXWp6F4Ab8C8dQ=
X-Received: by 2002:adf:f98a:0:b0:33d:adce:568a with SMTP id f10-20020adff98a000000b0033dadce568amr6015930wrr.33.1709027374989;
        Tue, 27 Feb 2024 01:49:34 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFrZ3o90tbfsSAm8szNCeQ4oLshVp32LO99oJt22pj9/1XoHnWNB8pQBLT0AS3AbTSWgBlSag==
X-Received: by 2002:adf:f98a:0:b0:33d:adce:568a with SMTP id f10-20020adff98a000000b0033dadce568amr6015910wrr.33.1709027374560;
        Tue, 27 Feb 2024 01:49:34 -0800 (PST)
Received: from ?IPV6:2003:cb:c707:7600:5c18:5a7d:c5b7:e7a9? (p200300cbc70776005c185a7dc5b7e7a9.dip0.t-ipconnect.de. [2003:cb:c707:7600:5c18:5a7d:c5b7:e7a9])
        by smtp.gmail.com with ESMTPSA id ck12-20020a5d5e8c000000b0033d9f0dcb35sm11103216wrb.87.2024.02.27.01.49.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 27 Feb 2024 01:49:34 -0800 (PST)
Message-ID: <49d14780-56f4-478d-9f5f-0857e788c667@redhat.com>
Date: Tue, 27 Feb 2024 10:49:32 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v17 19/35] arch/mm: Export direct {un,}map functions
Content-Language: en-US
To: Christoph Hellwig <hch@infradead.org>, Will Deacon <will@kernel.org>,
 Quentin Perret <qperret@google.com>,
 Chris Goldsworthy <quic_cgoldswo@quicinc.com>,
 Android KVM <android-kvm@google.com>, Patrick Daly <quic_pdaly@quicinc.com>,
 Alex Elder <elder@linaro.org>,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Murali Nalajal <quic_mnalajal@quicinc.com>,
 Trilok Soni <quic_tsoni@quicinc.com>,
 Srivatsa Vaddagiri <quic_svaddagi@quicinc.com>,
 Carl van Schaik <quic_cvanscha@quicinc.com>,
 Philip Derrin <quic_pderrin@quicinc.com>,
 Prakruthi Deepak Heragu <quic_pheragu@quicinc.com>,
 Jonathan Corbet <corbet@lwn.net>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Catalin Marinas
 <catalin.marinas@arm.com>, Konrad Dybcio <konrad.dybcio@linaro.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Fuad Tabba
 <tabba@google.com>, Sean Christopherson <seanjc@google.com>,
 Andrew Morton <akpm@linux-foundation.org>, linux-arm-msm@vger.kernel.org,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mm@kvack.org
References: <20240222-gunyah-v17-0-1e9da6763d38@quicinc.com>
 <20240222-gunyah-v17-19-1e9da6763d38@quicinc.com>
 <ZdhEtH7xzbzdhS2j@infradead.org>
 <20240223071006483-0800.eberman@hu-eberman-lv.qualcomm.com>
 <Zdxwo0abvklfam-Z@infradead.org>
 <2f4c44ad-b309-4baa-ac21-2ae19efd31fb@redhat.com>
 <20240226092020370-0800.eberman@hu-eberman-lv.qualcomm.com>
From: David Hildenbrand <david@redhat.com>
Autocrypt: addr=david@redhat.com; keydata=
 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
 WNyWQQ==
Organization: Red Hat
In-Reply-To: <20240226092020370-0800.eberman@hu-eberman-lv.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 26.02.24 18:27, Elliot Berman wrote:
> On Mon, Feb 26, 2024 at 12:53:48PM +0100, David Hildenbrand wrote:
>> On 26.02.24 12:06, Christoph Hellwig wrote:
>>> The point is that we can't we just allow modules to unmap data from
>>> the kernel mapping, no matter how noble your intentions are.
>>
>> I absolutely agree.
>>
> 
> Hi David and Chirstoph,
> 
> Are your preferences that we should make Gunyah builtin only or should add
> fixing up S2 PTW errors (or something else)?

Having that built into the kernel certainly does sound better than 
exposing that functionality to arbitrary OOT modules. But still, this 
feels like it is using a "too-low-level" interface.

> 
> Also, do you extend that preference to modifying S2 mappings? This would
> require any hypervisor driver that supports confidential compute
> usecases to only ever be builtin.
> 
> Is your concern about unmapping data from kernel mapping, then module
> being unloaded, and then having no way to recover the mapping? Would a
> permanent module be better? The primary reason we were wanting to have
> it as module was to avoid having driver in memory if you're not a Gunyah
> guest.

What I didn't grasp from this patch description: is the area where a 
driver would unmap/remap that memory somehow known ahead of time and 
limited?

How would the driver obtain that memory it would try to unmap/remap the 
direct map of? Simply allocate some pages and then unmap the direct map?

For example, we do have mm/secretmem.c, where we unmap the directmap on 
allocation and remap when freeing a page. A nice abstraction on 
alloc/free, so one cannot really do a lot of harm.

Further, we enlightened the remainder of the system about secretmem, 
such that we can detect that the directmap is no longer there. As one 
example, see the secretmem_active() check in kernel/power/hibernate.c.

A similar abstraction would make sense (I remember a discussion about 
having secretmem functionality in guest_memfd, would that help?), but 
the question is "which" memory you want to unmap the direct map of, and 
how the driver became "owner" of that memory such that it would really 
be allowed to mess with the directmap.

-- 
Cheers,

David / dhildenb


