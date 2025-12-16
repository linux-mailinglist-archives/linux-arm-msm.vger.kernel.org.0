Return-Path: <linux-arm-msm+bounces-85383-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id EDD38CC3DF4
	for <lists+linux-arm-msm@lfdr.de>; Tue, 16 Dec 2025 16:20:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id CB61A302B141
	for <lists+linux-arm-msm@lfdr.de>; Tue, 16 Dec 2025 15:18:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 267F3355813;
	Tue, 16 Dec 2025 15:13:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="ak6pimUM"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A167B3557E6
	for <linux-arm-msm@vger.kernel.org>; Tue, 16 Dec 2025 15:12:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765897981; cv=none; b=Ojoka+tOq4AvJCeGWeOoYEaUg1KNz+l15R/oPIb0n2j/W54qZC6nzsXg9YwT8DKpqQh3KzKQH28p7SBGpFS5HSLyNS+lJkl8tx+MIDOIaCTUzhDgzHwlb5nIeIQYDDmIZeHzE7ZsBbVqi/E5OnFbiP2vdssHuexdT9/xjihToxA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765897981; c=relaxed/simple;
	bh=otRnitXgK3YK8QOOnOlDhlnw9uTpljPxLSfkYiE4/jA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=URhr4pr4oYLIG7QIvCBIPcb5bpju5A2Ur+wBrQHVi5fmLV0ajrMr9/yUsqGWlFFRG/tEsCQT25y9fsg8OBjdsbG/fnRyCTa3RRofVsvWAGm8nHO7c8uwp4MQtFsburJj6ivTxjJ8pGS30MFD7IKNcH36v4GGQnq5HVO4eWyXkqM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=ak6pimUM; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-47aa03d3326so11272545e9.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 16 Dec 2025 07:12:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1765897976; x=1766502776; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=2RaB9SM+pvwUf1QmqN2DN92hZRXQJ2LlXiPVs66C+PM=;
        b=ak6pimUMaCZZ/eH5zmilk5fKWiWmW54oMRx2jPSJVi1CVmJPC98gQhTksBJFW+6nHP
         DLE/wPy/UVd/TBJCpnXSaDfkC28opZO1OGWlzr6THu7BZffJesytfKxKrfaEWWQOvJdB
         Ro9a3MGnc9Th9Aofq0LHrc4iXCjQxD7lXbdtME75auAIp06AwNFJk17U4gcy4sEeP6BZ
         iRvSkXX1cwVC/goq2Jw4EZ9m/Ie8IaH/U2IsFtT/U51CKl+hcFy8uf0/8tp07WkrieUV
         1JAlv/ia8ggNysCdeLTYF/v1MLare0gRW8hYTq3ZcLxz/6Or+4EXMTge1Q2fGGhNLp8K
         cYFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765897976; x=1766502776;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2RaB9SM+pvwUf1QmqN2DN92hZRXQJ2LlXiPVs66C+PM=;
        b=pYT3PWaeXRosYyefJKYyzEfiQr/BGZS5m8bewDBPCtOkPjBbOzz0I6mEy6PKO+cxKw
         ZJnQqYMlzV+uEfOg2hkWi976Gq17eeu9qjR5/si04MGpp7H7xKbvIYGHfJfIphl2y8en
         +vdmZGu16UMk/Ggdi5Ky3CCKlUd5jdOCy1wjTIKNT6JXTEbPCAf6ldWJZ9cXwa2pD8w9
         98UcfHIfDKuo2LmqcdAlQzObNPpWgFdfKPxPrGArqRNiMuDePkWP9HQSacy58KzI5OtJ
         BYYznDAgVaf5RUMVpCw6NQnFvh5aMnI90z9Fs2Y3/kJd7XHU2l4a5JNsKAKmsGvQf7T3
         MV7g==
X-Gm-Message-State: AOJu0YyXu0aJeCyMHuvGv69hMO1LsHgCKbc+G8/oZJBQRPcWIk27KC/k
	TDbinVou1jDT+FVde34crYV/1sZl/VenO6Zc+kODKo2QfG0eSyvoQGl8WgdFi41GdPk=
X-Gm-Gg: AY/fxX7aqIJY23iWf+h3kk8gACnYNgroLbRPQH/MLmEGUAm1B+O2w3sroPIQ4QiBhAX
	t+T6GcYqYCGXk0KMq4eQs9E/+Sb7uzO339S+OQgNFrDCk2RoVGJ9IWOmC5Zp3JMErF2IvLJebww
	F47AAtldwQ48h0CPyFmE+/eEFcm9zLWCVEmR14LGKvO5gbo9B/5uAu1+GVE+/Q/PbXHQg3LNVzx
	lp/USy1E/FycZQ0VQF1/drcSHuMrB8E+pC3SLFi1trpMiXCl45+SUfth8UZWlYoO0c/Ihg96yeN
	yKVQjXE/j7DjtqNZH6XIbNhsIuRNvOeew8DhiR120X6HDlv8jOzMODo/eY1lIVX03HIVDP2D+vV
	Sm0/Ar5G8TjdfJWGy28I7EwGvn/7Np8riFCfPd2/q1wkAvveVbJdFFyUn3lPje99SKdZPpzrxbd
	a44xqxRwawqUw00w==
X-Google-Smtp-Source: AGHT+IFg1h+oSthyGc4tPORkNrPPpnVeUr6FNMPfEJgnXBupogksrkrfKGsIU7DtuK9+emJLDR1CpQ==
X-Received: by 2002:a05:600c:608d:b0:46e:49fb:4776 with SMTP id 5b1f17b1804b1-47a8f8c18d1mr142495795e9.11.1765897975942;
        Tue, 16 Dec 2025 07:12:55 -0800 (PST)
Received: from pathway.suse.cz ([176.114.240.130])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47bd90b81e6sm12034075e9.3.2025.12.16.07.12.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Dec 2025 07:12:55 -0800 (PST)
Date: Tue, 16 Dec 2025 16:12:52 +0100
From: Petr Mladek <pmladek@suse.com>
To: Eugen Hristev <eugen.hristev@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-mm@kvack.org, tglx@linutronix.de, andersson@kernel.org,
	rdunlap@infradead.org, corbet@lwn.net, david@redhat.com,
	mhocko@suse.com, tudor.ambarus@linaro.org,
	mukesh.ojha@oss.qualcomm.com, linux-arm-kernel@lists.infradead.org,
	linux-hardening@vger.kernel.org, jonechou@google.com,
	rostedt@goodmis.org, linux-doc@vger.kernel.org,
	devicetree@vger.kernel.org, linux-remoteproc@vger.kernel.org,
	linux-arch@vger.kernel.org, tony.luck@intel.com, kees@kernel.org
Subject: Re: [PATCH 21/26] printk: Register information into meminspect
Message-ID: <aUF29MLUj3YRh4v_@pathway.suse.cz>
References: <20251119154427.1033475-1-eugen.hristev@linaro.org>
 <20251119154427.1033475-22-eugen.hristev@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251119154427.1033475-22-eugen.hristev@linaro.org>

On Wed 2025-11-19 17:44:22, Eugen Hristev wrote:
> Annotate vital static information into meminspect:
>  - prb_descs
>  - prb_infos
>  - prb
>  - prb_data
>  - printk_rb_static
>  - printk_rb_dynamic
> 
> Information on these variables is stored into inspection table.
> 
> Register dynamic information into meminspect:
>  - new_descs
>  - new_infos
>  - new_log_buf
> This information is being allocated as a memblock, so call
> memblock_mark_inspect to mark the block accordingly.
> 
> Signed-off-by: Eugen Hristev <eugen.hristev@linaro.org>

I haven't tested this. But it looks reasonable from my POV.
I assume that the output from the "log" command was from your
synthetic test so that "crash" was even able to print the messages.

Feel free to use:

Reviewed-by: Petr Mladek <pmladek@suse.com>

Best Regards,
Petr

PS: I haven't attended Plumbers conference this year so
    I do not know what is the current state of this project.
    

