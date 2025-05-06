Return-Path: <linux-arm-msm+bounces-56907-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 80135AABB4D
	for <lists+linux-arm-msm@lfdr.de>; Tue,  6 May 2025 09:38:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id CDC631BA594B
	for <lists+linux-arm-msm@lfdr.de>; Tue,  6 May 2025 07:33:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AD30B221FB7;
	Tue,  6 May 2025 07:24:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="CqcIWhZG"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B60DA215062
	for <linux-arm-msm@vger.kernel.org>; Tue,  6 May 2025 07:24:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746516295; cv=none; b=ezMM7gS0AZVvz+37cnCcMQIXWYk0eERcjFZdxDTBwh8c5Ve0Mk2TtyfUsWAQoKYaSYSaQ3iKNMKMkxu04MSX35bGkFUS6DQtfLlcoL34sWoAhfkVAltcYmJ0apeURfsBTpUCu4sC2oraDOSlRm5LnOoT13XirWqnQ++wpEGYurk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746516295; c=relaxed/simple;
	bh=3cUhB1F+n4VKTB36vmd3FJ61u8+HpFZ6ImTCvjnr/F4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XMgaSmFP2sz8hJ561M7IJQ8F1dFgvLOfxi5yJigSW3fprKalp9NaSdsryzi++RzvGkv8J5MYTHxvprZbt/g1MEB2UHxoFU9ZGqWqKlUIt4OmeePDB/l9dSEFsrO+/qmQTOUtmDcg2Tb6rVIc6F8fZZOAtxzrcxnMGTFz5egO+Fk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=CqcIWhZG; arc=none smtp.client-ip=209.85.218.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-ac2bdea5a38so736759066b.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 06 May 2025 00:24:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1746516291; x=1747121091; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=XbL28/Q5fCjpT3qjIse0voCquluax0ysjbv1wgZ9OdE=;
        b=CqcIWhZGki8pArT5ZKDiAL7vrsk4j8yrd8yYle8MgvJvSTutokaP/Sp93/duR0raIu
         MiplNBzH7fBdP7KGrYCrYx7s8b5gMO6yaN18shbzjh65NNsLsYaUyNX82QYZwrUE1q5j
         B7LQZKnL+SOaPyinQJ9yx6KVUccCSzCz2GWnWJovbNj+RV6ongderoW5f+Ft/DW6Qs4J
         mXFyXHZb7ZVp5z5s+dvkgUPiOgyDamHkSHexgE5u3wBJ58cRzvMtItCL3IHK8wPehECP
         BhhRh6fcWr9HPV+AFQ19GlryzYVoLA41YFTOMmFcDKWsrtsCS+PkmH8IzZnC8yRTCR6T
         VcTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746516291; x=1747121091;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XbL28/Q5fCjpT3qjIse0voCquluax0ysjbv1wgZ9OdE=;
        b=tkarjnfFhBAbDObV6RFeMwjgtWBnb5Quk9ehgC9oQdrnfgcxRRTWj2NvJkulE9Xgy7
         IhWaRSw0lYvw1VuOlj9z1SAyrcE094XtEa1iJC3Q5q+F8RjFFajk5weueHzQ8AYlWT2N
         J+09cFhEfBdsqXlqBjrp6a98KtKI9lkH22bJkYgqNWPVHke6EEAePefIXatsOJS81F4b
         sjetYsQoAFOxENpizNUSY+ZVuZKs+JoftnzXcSrlKBxb5uc1l6qH1QlDuc8Gu/fHisGD
         lCbzrhS6ONeEraUH6EgXKm4aSHg6dyAa3VCmfwaXqHSKMw7FYEcfh6lCtDFT+SP97/WU
         vlMw==
X-Forwarded-Encrypted: i=1; AJvYcCUALqLXgvcHvzq/dXc3wKsmgVHAJPe4ojQyxdZKQBVbNetg1wkftK+XL5UFHdMqHiDZ+DwIn//Fz7sQ4xtA@vger.kernel.org
X-Gm-Message-State: AOJu0YwDF9HteFbhzdfyaEwt0GSQYxP8W1q0+Ox6vbWjKOu6vy5D1TWB
	c4Y0RdAywSSjc6w8K/oSDj4Lra5Q5mzRdSG16mXvtuvoCCgtyvjqns19kYM+5ho=
X-Gm-Gg: ASbGncsR/XejWwc/CzLkg5vkcLfiEhX3Zx0H1RwcibXnZcT+/V+FhrzsFAtTawGtlz5
	83LjeNK2aGb3u9L9KbjQleDzB/kyDXXRsJyBqvIX6akJNVlBfveMCGWbIF9nOSh6zP+rgbKN3RO
	WEOHml2PxyNMm7w0G0ZoS0Zig81Qezvx3uZImRukEQSVrWMADZuYjdHDTHl3T8SCSmNTFP+u+8T
	IEIb7ajrhgiEabD0SOp0VPViMWHPTHjpnGJBZm+rK+Y+luAdOA72lA/FW3g36fSDxMNEV30mOOQ
	fgDHyD4ofcfxrprDDOm+cGYb2pSh/aj5jdk8wT4PXeTvqy5Nrug=
X-Google-Smtp-Source: AGHT+IHCFEnbJ0GDLTWa83tTmfCGMhh5WwORYTYmcU3ggC2S+IScDWzxdZRGqMZ8tE3BuqiylW508g==
X-Received: by 2002:a17:907:2cc4:b0:ac1:ea29:4e63 with SMTP id a640c23a62f3a-ad1a495ad79mr1006272766b.26.1746516290877;
        Tue, 06 May 2025 00:24:50 -0700 (PDT)
Received: from localhost.localdomain ([176.114.240.130])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ad1894c01e5sm644433166b.87.2025.05.06.00.24.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 May 2025 00:24:50 -0700 (PDT)
Date: Tue, 6 May 2025 09:24:48 +0200
From: Petr Mladek <pmladek@suse.com>
To: Eugen Hristev <eugen.hristev@linaro.org>
Cc: linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
	andersson@kernel.org, linux-doc@vger.kernel.org, corbet@lwn.net,
	tglx@linutronix.de, mingo@redhat.com, rostedt@goodmis.org,
	john.ogness@linutronix.de, senozhatsky@chromium.org,
	peterz@infradead.org, mojha@qti.qualcomm.com,
	linux-arm-kernel@lists.infradead.org, vincent.guittot@linaro.org,
	konradybcio@kernel.org, dietmar.eggemann@arm.com,
	juri.lelli@redhat.com
Subject: Re: [RFC][PATCH 07/14] printk: add kmsg_kmemdump_register
Message-ID: <aBm5QH2p6p9Wxe_M@localhost.localdomain>
References: <20250422113156.575971-1-eugen.hristev@linaro.org>
 <20250422113156.575971-8-eugen.hristev@linaro.org>
 <aBjYbXJL-GJe4Mh8@localhost.localdomain>
 <6ce50077-2c64-40b2-82b3-c63c16fa1898@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <6ce50077-2c64-40b2-82b3-c63c16fa1898@linaro.org>

On Mon 2025-05-05 18:51:19, Eugen Hristev wrote:
> Hello Petr,
> 
> Thank you for your review.
> 
> On 5/5/25 18:25, Petr Mladek wrote:
> > On Tue 2025-04-22 14:31:49, Eugen Hristev wrote:
> >> Add kmsg_kmemdump_register, which registers prb, log_buf and infos/descs
> >> to kmemdump.
> >> This will allow kmemdump to be able to dump specific log buffer areas on
> >> demand.
> >>
> >> --- a/kernel/printk/printk.c
> >> +++ b/kernel/printk/printk.c
> >> @@ -4650,6 +4651,18 @@ int kmsg_dump_register(struct kmsg_dumper *dumper)
> >>  }
> >>  EXPORT_SYMBOL_GPL(kmsg_dump_register);
> >>  
> >> +void kmsg_kmemdump_register(void)
> >> +{
> >> +	kmemdump_register("log_buf", (void *)log_buf_addr_get(), log_buf_len_get());
> >> +	kmemdump_register("prb", (void *)&prb, sizeof(prb));
> >> +	kmemdump_register("prb", (void *)prb, sizeof(*prb));
> > 
> > This looks strange. "prb" is a pointer to "struct printk_ringbuffer".
> > It should be enough to register the memory with the structure.
>
> Yes, from my perspective this should be also enough. However, when
> loading the generated core dump into crash tool , the tool first looks
> for the prb pointer itself, and then stops if the pointer is not readable.
> After the prb pointer is being found, the crash tool dereferences it ,
> and looks at the indicated address for the actual memory.
> That is why the pointer is also saved as a kmemdump region in my proof
> of concept.

I see. It makes perfect sense to store the pointer as well after all.

> >> +	kmemdump_register("prb_descs", (void *)_printk_rb_static_descs,
> >> +			  sizeof(_printk_rb_static_descs));
> >> +	kmemdump_register("prb_infos", (void *)_printk_rb_static_infos,
> >> +			  sizeof(_printk_rb_static_infos));
> > 
> > Also this looks wrong. These are static buffers which are used during
> > early boot. They might later be replaced by dynamically allocated
> > buffers when a bigger buffer is requested by "log_buf_len" command
> > line parameter.
> > 
> 
> I will double check whether the crash tool looks for these symbols or
> only the memory, and come back with an answer
> 
> > I think that we need to register the memory of the structure
> > and 3 more buffers. See how the bigger buffer is allocated in
> > setup_log_buf().
> > 
> > I would expect something like:
> > 
> > 	unsigned int descs_count;
> > 	unsigned long data_size;
> > 
> > 	descs_count = 2 << prb->desc_ring.count_bits;
> > 	data_size = 2 << prb->data_ring.size_bits;
> > 
> > 	kmemdump_register("prb", (void *)prb, sizeof(*prb));
> > 	kmemdump_register("prb_descs", (void *)prb->desc_ring->descs,
> > 			  descs_count * sizeof(struct prb_desc));
> > 	kmemdump_register("prb_infos", (void *)prb->desc_ring->infos,
> > 			  descs_count * sizeof(struct printk_info));
> > 	kmemdump_register("prb_data", (void *)prb->data_ring->data, data_size);
> > 
> > 
> Thank you. It may be that in my test case, the buffer was not
> extended/reallocated with a bigger one.

I guess so. A bigger buffer is allocated either when explicitly
requested by "log_buf_len=" command line option. Or when the kernel
is running on a huge system with many CPUs and log_buf_add_cpu()
decides that the default buffer is not big enough for backtraces from
all CPUs.

> > But I wonder if this is enough. The current crash dump code also needs
> > to export the format of the used structures, see
> > log_buf_vmcoreinfo_setup().
> 
> It appears that crash tool looks for the structures into vmlinux
> symbols. It can be that this information is not available to some tools,
> or vmlinux not available, in which case all the used structures format
> and sizes need to be exported. But right now, the crash tool does not
> work without vmlinux.
> > 
> > Is the CONFIG_VMCORE_INFO code shared with the kmemdump, please?
> 
> I believe CONFIG_KMEMDUMP_COREIMAGE should select CONFIG_VMCORE_INFO
> indeed, which is not done in my patches. Or I have not fully understood
> your question ?

I do not see CONFIG_VMCORE_INFO selected in drivers/debug/Kconfig.
But maybe the dependency is defined another way.

Honestly, I did not study all these details. I focused primary on
the printk-related interface and commented what came to my mind.

Also I was not sure how the dumped memory can be analyzed. I expected
that it should be readable by the "crash" tool. But I did not see it explained
in Documentation/debug/kmemdump.rst.

Best Regards,
Petr

