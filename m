Return-Path: <linux-arm-msm+bounces-56815-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id A1588AA9775
	for <lists+linux-arm-msm@lfdr.de>; Mon,  5 May 2025 17:25:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 0D514166B8E
	for <lists+linux-arm-msm@lfdr.de>; Mon,  5 May 2025 15:25:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 05DD625D8FB;
	Mon,  5 May 2025 15:25:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="H9JG1gT6"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A73861D5166
	for <linux-arm-msm@vger.kernel.org>; Mon,  5 May 2025 15:25:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746458740; cv=none; b=fHWtkSAeUHx5Adjl1HwJTZoMurPJkUULGxp6NroGrpJqwsbRNCPvFQ+PbFXjp/uxh2RIh7uDzOG7AeHK/EJf0NWguJh0ulOw6Dr4afmNd89ZpMc5tj4ky+l0A2ldF2SES7I0eTb+GV98nvZ1qrUh/kbSZlJeQDxFjISX0WYLDvs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746458740; c=relaxed/simple;
	bh=dI4E2Kbf751wzsz59sPzsKmHk4663cGlXUspDFJTyek=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=eppUuHBgTFjNFXPNnbhEQtIz1PLNefDi4lAfoh3PnIbqAkXu5/I1ITdKijquxIeWuJxaXxRGswE2aAwWWXz/+FITiDMKwvqgmWQwezptime0yOfHI0wEkGxcx+oAl8hzYb7rMBSDS4YRhbn/xOSUViMAfGc4XITqD/WTvC0dMAQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=H9JG1gT6; arc=none smtp.client-ip=209.85.218.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-ac29fd22163so769520566b.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 05 May 2025 08:25:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1746458736; x=1747063536; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=2ajJLa5miM3AL5goGOKRZtkQ1TmX4V3MyI+Ci8KWiok=;
        b=H9JG1gT63FNaZObb2fHVq8bmoilOaBq99fb4kqh1fnet2xJZLXkvY9YmfLxEebyOw+
         sz/FI8pDBJQmWwJM4HrzKc2z3pXB03HFs3FplAqRiutvx0v6QE0BDKXavMWrSKLNg24k
         j2Mf6Mpmqb0Uqa2jJWjYtMBVwvWR5blal7NzuZVaie98jPBiPCa5pRd5xrEluSzsCZPa
         iBYmC3imZO40SLOPK8p280Z2CU5REsyO2EuGvUPcxrtFe8DcKllwUctVrn5nkfq35K29
         W6Xcoe8aSfdIJHAqhdEoTO+Z15atwJiPO/UBDAwqqnAd62MkspJVgdx0n3hrJVHcBpTI
         7JPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746458736; x=1747063536;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2ajJLa5miM3AL5goGOKRZtkQ1TmX4V3MyI+Ci8KWiok=;
        b=KIJtMGsVLMdsmE1Ko24WL1PozeX5bhpBw9RZdwQpQMUXRGK/BOqrpHCtRv6oKGn3Tm
         2liv4NohEQsvkM675Uz3jQ6FMMZwwGmnqsh9gTQqVfAb88CqvOSai/XiuYBmUHbG0aFF
         nRGGWW29DJJsrH6e+rtDaMgrjeoUOozh6W5tTg2ej/iEZ2hCQ1FOlhGp/cy700kS1M9t
         ylJyNnMrOtGEFKZQTYsCfw5bi3nhC/qiaaLPcL/8TQgz3TTcCqA6B2wF/VP/QS6InsFx
         ttOxB/InUl+Vpob8HKKUM/sIbOfW+CvtK4bWg6fzlJBnKN7WfJ7wsT8v2TDHzB8EViXX
         +Ddw==
X-Forwarded-Encrypted: i=1; AJvYcCXuQKaNd7tAvxUm97AmNUXTZzLoFUspXVqxP7WnLC9QDxm9dw30PslGjmIVQUn1SEESB60WWVQC4ud15eSI@vger.kernel.org
X-Gm-Message-State: AOJu0YzWY9YsA2TQ36D97R4/12YJ+E8xG5SoPDipvbxZnB21xLI9Gowa
	P2GEFPKx1mEo6w+pa5MCvfEmSsLesjsGL5zdPhVC8jzpfdtmPLXb1VYBLMJ6BSrEEkc+UK+BK5j
	d
X-Gm-Gg: ASbGncu1XSOC9X2B864XHnbAa6tPQvbn5S90c/fvHDLUjfFyPN3S11PYKcFActkqEvw
	DaRotxROpUz/njH801/JFgEkMmEntTu6Zk8icWos7BBPiPRCDKwsHaIcf+y1lpmXQ7JYJvSzfgn
	STJmcK6k3CBgfwnuYEjIDWyIylkbXmP4JgeWMyUqrQ8Gy8wpPrjfvbDA5fJRosRVh+U2uY2C8zi
	BE4jJeGTLvIN11OAIeMX5KFyHLJ5DZSm5l9dtSTeTxQxyXFS5GExv16M9Qm57DRy24M4vqO41En
	/mxbdOTfxEP88klnxKq64D2FdMpDzU+jCRCiyKfxauTa7xJz7Ec=
X-Google-Smtp-Source: AGHT+IGYG7m0T03TgljojHgEjhUKNwr/b12nUjKBhKn/d8sk3hJq1ietBujLlydEzb85jA5VfGNXkw==
X-Received: by 2002:a17:907:9406:b0:ac6:f6e2:7703 with SMTP id a640c23a62f3a-ad1a48bc5d9mr610686166b.8.1746458735844;
        Mon, 05 May 2025 08:25:35 -0700 (PDT)
Received: from localhost.localdomain ([176.114.240.130])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ad18914733esm506520166b.33.2025.05.05.08.25.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 May 2025 08:25:35 -0700 (PDT)
Date: Mon, 5 May 2025 17:25:33 +0200
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
Message-ID: <aBjYbXJL-GJe4Mh8@localhost.localdomain>
References: <20250422113156.575971-1-eugen.hristev@linaro.org>
 <20250422113156.575971-8-eugen.hristev@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250422113156.575971-8-eugen.hristev@linaro.org>

On Tue 2025-04-22 14:31:49, Eugen Hristev wrote:
> Add kmsg_kmemdump_register, which registers prb, log_buf and infos/descs
> to kmemdump.
> This will allow kmemdump to be able to dump specific log buffer areas on
> demand.
> 
> --- a/kernel/printk/printk.c
> +++ b/kernel/printk/printk.c
> @@ -4650,6 +4651,18 @@ int kmsg_dump_register(struct kmsg_dumper *dumper)
>  }
>  EXPORT_SYMBOL_GPL(kmsg_dump_register);
>  
> +void kmsg_kmemdump_register(void)
> +{
> +	kmemdump_register("log_buf", (void *)log_buf_addr_get(), log_buf_len_get());
> +	kmemdump_register("prb", (void *)&prb, sizeof(prb));
> +	kmemdump_register("prb", (void *)prb, sizeof(*prb));

This looks strange. "prb" is a pointer to "struct printk_ringbuffer".
It should be enough to register the memory with the structure.

> +	kmemdump_register("prb_descs", (void *)_printk_rb_static_descs,
> +			  sizeof(_printk_rb_static_descs));
> +	kmemdump_register("prb_infos", (void *)_printk_rb_static_infos,
> +			  sizeof(_printk_rb_static_infos));

Also this looks wrong. These are static buffers which are used during
early boot. They might later be replaced by dynamically allocated
buffers when a bigger buffer is requested by "log_buf_len" command
line parameter.

I think that we need to register the memory of the structure
and 3 more buffers. See how the bigger buffer is allocated in
setup_log_buf().

I would expect something like:

	unsigned int descs_count;
	unsigned long data_size;

	descs_count = 2 << prb->desc_ring.count_bits;
	data_size = 2 << prb->data_ring.size_bits;

	kmemdump_register("prb", (void *)prb, sizeof(*prb));
	kmemdump_register("prb_descs", (void *)prb->desc_ring->descs,
			  descs_count * sizeof(struct prb_desc));
	kmemdump_register("prb_infos", (void *)prb->desc_ring->infos,
			  descs_count * sizeof(struct printk_info));
	kmemdump_register("prb_data", (void *)prb->data_ring->data, data_size);


But I wonder if this is enough. The current crash dump code also needs
to export the format of the used structures, see
log_buf_vmcoreinfo_setup().

Is the CONFIG_VMCORE_INFO code shared with the kmemdump, please?

> +}
> +EXPORT_SYMBOL_GPL(kmsg_kmemdump_register);
> +

Best Regards,
Petr

