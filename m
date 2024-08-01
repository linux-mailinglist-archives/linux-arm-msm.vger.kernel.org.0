Return-Path: <linux-arm-msm+bounces-27669-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 88B279444FE
	for <lists+linux-arm-msm@lfdr.de>; Thu,  1 Aug 2024 08:57:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 0A4AE1F278E6
	for <lists+linux-arm-msm@lfdr.de>; Thu,  1 Aug 2024 06:57:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E4C7716D9BE;
	Thu,  1 Aug 2024 06:56:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="S4b3HIUE"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A26916C876
	for <linux-arm-msm@vger.kernel.org>; Thu,  1 Aug 2024 06:56:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722495410; cv=none; b=TdFRfrvTZ/RFBxR/HqF3fLz6VPqzmUNHRm3Wf2gNSQk6KoplUTAh39NIPiBI4yAjvtWrdl2q6VHZ6TdeCFPeDxcfs+40EDWbbZ08o9G0g9OS67FDoBwQXySTIuoNaFljPtCdvxU92FgxCcyjpx47QH+Ox2MhZrbN/xyulXolntc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722495410; c=relaxed/simple;
	bh=aZm2JEIkgSPMtx16vLmYRas0hfKXrrIb7pUP2j9FL08=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=fXglLz1kMTY8NMk+cz0NVemz+WD7t3xzcNzi2FGK+DiWH2m1JqOWD15+Nk+ua/fTm7gSmf3zP6LipENNy+54GH+sJK1R5HJTLDrI7LTZZtsXBWy7JLI9OAHl1gQCvkxHBP9GVdVku9cprQrvrMWwi3wh0DGxd6r03UOgrq8/HeE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=S4b3HIUE; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1722495408;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=NDKURP4D6k3OP20MVdLEnxDSKbaFPAqtZKWF8WwbgVg=;
	b=S4b3HIUEbNrRq95ZvpaqmdxeMEJHcukRSKvQ8v5BxHJLylFZ+8KQsy5aSFrCdF30rxW37d
	QHIjAJIpSjBtl+gvpHOFtXoy51n1ide188k9dIEDXU+gXvFQU4tIm3ItU6lMFLI+XdMP5L
	Lkm36LxhLnQp06IVleHr2ZJtZFDcarU=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-440-xcwSljcVMgmiX-4JIpIBXA-1; Thu, 01 Aug 2024 02:56:47 -0400
X-MC-Unique: xcwSljcVMgmiX-4JIpIBXA-1
Received: by mail-wm1-f71.google.com with SMTP id 5b1f17b1804b1-4280d8e685eso42158705e9.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 31 Jul 2024 23:56:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722495406; x=1723100206;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:from:references:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NDKURP4D6k3OP20MVdLEnxDSKbaFPAqtZKWF8WwbgVg=;
        b=nNjXyhJpRpISMh0Yy0HQHUHzbP6mDtt1zpL1lJLrui2GPeIqI1yqWIag/OmDAqYsNJ
         JBLDfzryV46yd+MKhoSnmY1m+Zz3ZXeWs2XgOoohmzysvMPtqAu/QASwgOKqVnpJvGoy
         K0Sf25X4e7Izt6rM5xaIfs0oy6AdBxLKl62PCVcoK4FvcVhw3FByfeCt3TzYTgxFu84d
         ZdFoGoO1d24JIS6qPfhRjyf3ty6NQXmGjUr8KIGlUi36D1IO430EoRv8bAXeHJaAXCfn
         ngNmhth2Dwb2X51CG3XdotFTcGJ0pJZBZNOKXQQ7p5ZLF+k6wJnH6A51wQb1jshKgXt8
         Un/g==
X-Forwarded-Encrypted: i=1; AJvYcCVbBfwGQN4TJjFDQFkTFJ4zLdjWDBqztAWl6qHGfTaWv9Yj3kuZptCmJbjkEFJlxMQQ11gLbtsLZk8fsnRhNuDNK0ggM1U9CJLiuxgEdw==
X-Gm-Message-State: AOJu0YzIWQM+Z5FUZJ+sjo62rU5MfD9W8tDCGTv3rp3blJPCQOH1hJvY
	R+OR4bwi3nylqZteTA4FCbDjkeOXqGosgEmMbe8bpkdkynQpk8OwgQyrDPnNeb2ku7vFbE5w3V+
	AVy4QIA0Pe0HhphnJsptFLNOl3XWnafScBG/gWXNg0qCLHY6tseRZJ7uQ/zwFY6M=
X-Received: by 2002:a05:600c:33a3:b0:421:7bed:5274 with SMTP id 5b1f17b1804b1-428a9bdb966mr10593465e9.10.1722495405834;
        Wed, 31 Jul 2024 23:56:45 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEX+dzYPET6hn9XjbT9gpd7/3rQfOOJt19l2ka5zQDLp3Fpg0xkBb2xlk8bJLSGZmk7HnETOg==
X-Received: by 2002:a05:600c:33a3:b0:421:7bed:5274 with SMTP id 5b1f17b1804b1-428a9bdb966mr10593225e9.10.1722495405356;
        Wed, 31 Jul 2024 23:56:45 -0700 (PDT)
Received: from ?IPV6:2003:cb:c707:5c00:e650:bcd7:e2a0:54fe? (p200300cbc7075c00e650bcd7e2a054fe.dip0.t-ipconnect.de. [2003:cb:c707:5c00:e650:bcd7:e2a0:54fe])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4282bb64952sm46172355e9.37.2024.07.31.23.56.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 31 Jul 2024 23:56:44 -0700 (PDT)
Message-ID: <f4f68f53-f318-4bfe-8121-9b718b697fbe@redhat.com>
Date: Thu, 1 Aug 2024 08:56:42 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v17 19/35] arch/mm: Export direct {un,}map functions
To: Elliot Berman <quic_eberman@quicinc.com>,
 Christoph Hellwig <hch@infradead.org>, Will Deacon <will@kernel.org>,
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
 <49d14780-56f4-478d-9f5f-0857e788c667@redhat.com>
 <20240229170329275-0800.eberman@hu-eberman-lv.qualcomm.com>
 <20240731140323693-0700.eberman@hu-eberman-lv.qualcomm.com>
From: David Hildenbrand <david@redhat.com>
Content-Language: en-US
Autocrypt: addr=david@redhat.com; keydata=
 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
 WNyWQQ==
Organization: Red Hat
In-Reply-To: <20240731140323693-0700.eberman@hu-eberman-lv.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 01.08.24 00:21, Elliot Berman wrote:
> I wanted to revive this thread based on the mm alignment discussion for
> guest_memfd.
> 
> Gunyah's guest_memfd allocates memory via filemap_alloc_folio, identical
> to KVM's guest_memfd. There's a possiblity of a stage-2 fault when
> memory is donated to guest VM and Linux incidentally tries to access the
> donated memory with an unaligned access. This access will cause kernel
> to panic as it expects to be able to access all memory which has been
> mapped in stage 1. We don't want to disallow unaligned access simply
> because Gunyah drivers are enabled.
> 
> There are two options I see to prevent the stage-2 fault from crashing
> the kernel: we can fix up the stage-2 fault or ensure that Linux has a
> S1 table consistent with S2.
> 
> To do the latter, the obvious solution seemed to be using the
> set_direct_map functions, but you and Christoph have valid concerns
> about exporting this to modules since it's a low-level API. One way to
> avoid exporting the symbols is to make Gunyah a built-in, but I'd like
> to find a better solution.
> 
> One way I can think of is to create a "guest_memfd library" that both
> KVM and Gunyah can use. It abstracts the common bits between the 2 into
> a built-in module and can be the one to call the set_direct_map
> functions. I also think the abstraction will also help keep KVM
> guest_memfd cleaner once we start supporting huge folios (and splitting
> them). Do KVM and mm folks also see value to using a library-fied
> guest_memfd?

Without knowing about any details, this sounds like the right approach 
to me!

-- 
Cheers,

David / dhildenb


