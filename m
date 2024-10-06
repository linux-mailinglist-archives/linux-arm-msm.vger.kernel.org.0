Return-Path: <linux-arm-msm+bounces-33252-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FF80992043
	for <lists+linux-arm-msm@lfdr.de>; Sun,  6 Oct 2024 20:10:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id F07F91F2107B
	for <lists+linux-arm-msm@lfdr.de>; Sun,  6 Oct 2024 18:10:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B20DA189F33;
	Sun,  6 Oct 2024 18:10:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ZsZlwXfW"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com [209.85.216.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23BBD189917
	for <linux-arm-msm@vger.kernel.org>; Sun,  6 Oct 2024 18:10:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728238220; cv=none; b=krmYt7Q/+/7AL1L/Mv2EQryrAdVedWgCcYvBDuUO7PhzuqXfu2MsBsJHLdfQnnOnO2XMIWxaHbINNg3bIBEwqZ8me1uwXJlXNzL3pFgblKdxagvZ40MSoVRD/Id8G7JOMvMIsJ3OtTGeqX3BGkIZw/Nf8dRwGZGQr724d7VrQlA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728238220; c=relaxed/simple;
	bh=tyvbxifwMWiy/Z8kVkxRv1YDq9D+HXqbj1Klfr5PUKs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=uVp7eJdpyndATqrFOLICOV1svforTME1k6fxt/YzSIqblzK7iGPKpYr13r74fS2PNQB0aH0Hzk8pS4mVk/VIEhbVxqEytgVEO94SUY67k8v5p7CA3K5IivGjIZNa6ArfhvAJwuPYUEj8Ez/yK9c/l2o7/BleUKVmE6kTFNJ/Krk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ZsZlwXfW; arc=none smtp.client-ip=209.85.216.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-pj1-f49.google.com with SMTP id 98e67ed59e1d1-2e0c7eaf159so2943892a91.1
        for <linux-arm-msm@vger.kernel.org>; Sun, 06 Oct 2024 11:10:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1728238218; x=1728843018; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=alq0/ty9V5DVTsQSf1CXAvLnpMyiTYdYqWaJUsZhyXU=;
        b=ZsZlwXfW9pA7obs8NGlHkJW4pdmB4z8Xc0aXS79fTuz7wslVVTUBJHY5HBMOukfjh5
         0qkjpuTgeEF4UCpuV1qvx3p0Cc996cI9UJTg6nFG6RinxY9zAGKl/GjKucdWSKqfum5S
         STny1wilaD8NcacxqOqn/zCt2FHDpkpQ+ZAc0ubyTOCiKN5pN9npLhwO25Ad2Mf7tZjU
         ZSibReyGGpjULZH3VYY/K2DbxMODlrFDhg1hIRIZQtp+Nfq9i3kuVOjhUzMnEkEcreG0
         y1Acqw28e3kmWNnAuRSznAZIDx/SOTNyxD6mKqqqamGyvjpP9cCkSz0nVFoS+XSphHNK
         LmLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728238218; x=1728843018;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=alq0/ty9V5DVTsQSf1CXAvLnpMyiTYdYqWaJUsZhyXU=;
        b=QDfS8wo1u3MjEtVXhpZQAWGTshlOW391GHj5MaTW+IGcUmgwCWxpIHw8J7yEaQ65qb
         U5I8IWE1dCMMupLJrCmOWraJSgdSRVYBDgQbKWphSePUTM56LTxdo1ahHoUzNaeuYxCv
         U3R0H1CZqy/F4T8J5GJzz1wqFQHOK3ulJrU9VT6Msjy4vBYvuzKEQXYSIzu+FyGywJz0
         JGZTpwuUUp9XSAYvZCyUNcwwNwvnBMC1W51s6V0EhtOq6kjckDdyNLwJkNc2mNWFZZs2
         4Q0f5tPBttsH3cojd1/zzFj5MeQQllXlLl0tzb5Hkj/u2v0d8KN16dk5VjsZ9ORTB9TT
         UPVQ==
X-Forwarded-Encrypted: i=1; AJvYcCW0MJnbKEiF/XSMKbzp3+1yk/Y/TIsY7qh/zDpOcSBm3o96DM9JDJEB6xrXBBv93bkTtLp/H6Mpqq/RsGtY@vger.kernel.org
X-Gm-Message-State: AOJu0Yxg9bbwCYZkIzemMzmlfrQnf1ZFV5p0AJDVBHSj617G7tOzxMpC
	AvvrqTFJ5sBKvJFDGqnZYAvKpbQl8Pt0mg2WlS2MCX65M0CNcA6jUZX39MwobA==
X-Google-Smtp-Source: AGHT+IGfiCjzJAhy3bQXncwCGgkKpHGA83Ya5LKYMrS0hnZoyIhokJpWAT35sCLFFIws5D/GysAuJA==
X-Received: by 2002:a17:90b:118c:b0:2d8:8d34:5b8 with SMTP id 98e67ed59e1d1-2e1e621da2dmr12182260a91.10.1728238218512;
        Sun, 06 Oct 2024 11:10:18 -0700 (PDT)
Received: from thinkpad ([220.158.156.57])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2e1e86ac41csm5376102a91.55.2024.10.06.11.10.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 06 Oct 2024 11:10:18 -0700 (PDT)
Date: Sun, 6 Oct 2024 23:40:13 +0530
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: Carl Vanderlip <quic_carlv@quicinc.com>
Cc: kernel test robot <lkp@intel.com>,
	Jeffrey Hugo <quic_jhugo@quicinc.com>, mhi@lists.linux.dev,
	linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] bus/mhi: Switch trace_mhi_gen_tre fields to native endian
Message-ID: <20241006181013.2hd2b7clb6nmpeb2@thinkpad>
References: <20241004170321.4047492-1-quic_carlv@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20241004170321.4047492-1-quic_carlv@quicinc.com>

On Fri, Oct 04, 2024 at 10:03:20AM -0700, Carl Vanderlip wrote:
> Each of the __field() macros were triggering sparse warnings similar to:
> trace.h:87:1: sparse: sparse: cast to restricted __le64
> trace.h:87:1: sparse: sparse: restricted __le64 degrades to integer
> trace.h:87:1: sparse: sparse: restricted __le64 degrades to integer
> 
> Change each little endian type to its similarly sized native integer.
> Convert inputs into native endian.
> 
> Reported-by: kernel test robot <lkp@intel.com>
> Closes: https://lore.kernel.org/oe-kbuild-all/202402071859.8qMhgJEQ-lkp@intel.com/
> Signed-off-by: Carl Vanderlip <quic_carlv@quicinc.com>

Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>

- Mani

> Reviewed-by: Jeffrey Hugo <quic_jhugo@quicinc.com>
> ---
>  drivers/bus/mhi/host/trace.h | 25 +++++++++++++------------
>  1 file changed, 13 insertions(+), 12 deletions(-)
> 
> diff --git a/drivers/bus/mhi/host/trace.h b/drivers/bus/mhi/host/trace.h
> index 95613c8ebe06..3e0c41777429 100644
> --- a/drivers/bus/mhi/host/trace.h
> +++ b/drivers/bus/mhi/host/trace.h
> @@ -9,6 +9,7 @@
>  #if !defined(_TRACE_EVENT_MHI_HOST_H) || defined(TRACE_HEADER_MULTI_READ)
>  #define _TRACE_EVENT_MHI_HOST_H
>  
> +#include <linux/byteorder/generic.h>
>  #include <linux/tracepoint.h>
>  #include <linux/trace_seq.h>
>  #include "../common.h"
> @@ -97,18 +98,18 @@ TRACE_EVENT(mhi_gen_tre,
>  		__string(name, mhi_cntrl->mhi_dev->name)
>  		__field(int, ch_num)
>  		__field(void *, wp)
> -		__field(__le64, tre_ptr)
> -		__field(__le32, dword0)
> -		__field(__le32, dword1)
> +		__field(uint64_t, tre_ptr)
> +		__field(uint32_t, dword0)
> +		__field(uint32_t, dword1)
>  	),
>  
>  	TP_fast_assign(
>  		__assign_str(name);
>  		__entry->ch_num = mhi_chan->chan;
>  		__entry->wp = mhi_tre;
> -		__entry->tre_ptr = mhi_tre->ptr;
> -		__entry->dword0 = mhi_tre->dword[0];
> -		__entry->dword1 = mhi_tre->dword[1];
> +		__entry->tre_ptr = le64_to_cpu(mhi_tre->ptr);
> +		__entry->dword0 = le32_to_cpu(mhi_tre->dword[0]);
> +		__entry->dword1 = le32_to_cpu(mhi_tre->dword[1]);
>  	),
>  
>  	TP_printk("%s: Chan: %d TRE: 0x%p TRE buf: 0x%llx DWORD0: 0x%08x DWORD1: 0x%08x\n",
> @@ -176,19 +177,19 @@ DECLARE_EVENT_CLASS(mhi_process_event_ring,
>  
>  	TP_STRUCT__entry(
>  		__string(name, mhi_cntrl->mhi_dev->name)
> -		__field(__le32, dword0)
> -		__field(__le32, dword1)
> +		__field(uint32_t, dword0)
> +		__field(uint32_t, dword1)
>  		__field(int, state)
> -		__field(__le64, ptr)
> +		__field(uint64_t, ptr)
>  		__field(void *, rp)
>  	),
>  
>  	TP_fast_assign(
>  		__assign_str(name);
>  		__entry->rp = rp;
> -		__entry->ptr = rp->ptr;
> -		__entry->dword0 = rp->dword[0];
> -		__entry->dword1 = rp->dword[1];
> +		__entry->ptr = le64_to_cpu(rp->ptr);
> +		__entry->dword0 = le32_to_cpu(rp->dword[0]);
> +		__entry->dword1 = le32_to_cpu(rp->dword[1]);
>  		__entry->state = MHI_TRE_GET_EV_STATE(rp);
>  	),
>  
> -- 
> 2.25.1
> 

-- 
மணிவண்ணன் சதாசிவம்

