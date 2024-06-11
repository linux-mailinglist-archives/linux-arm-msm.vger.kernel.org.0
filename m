Return-Path: <linux-arm-msm+bounces-22303-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id D1747903B4C
	for <lists+linux-arm-msm@lfdr.de>; Tue, 11 Jun 2024 14:01:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 9AB29B29694
	for <lists+linux-arm-msm@lfdr.de>; Tue, 11 Jun 2024 12:01:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7FDB117B513;
	Tue, 11 Jun 2024 11:59:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="K2Kg2GHp"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f179.google.com (mail-lj1-f179.google.com [209.85.208.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9DAB017B43A
	for <linux-arm-msm@vger.kernel.org>; Tue, 11 Jun 2024 11:59:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718107192; cv=none; b=Weps1lqX4glBveFtgQQNI8irLMCbR7u1D+VEUzcW5kcQwJq/cDrBi7ZYxucpvcV1sT+xenAcS8gydfz9AeQRsBzfAE9UO0LE1xS4Z3Zj/uvdJlOwWnzzrhQQZXDOWvEczAdp6eKzOB+UwBAs1t1optTBRfwQpaUcXemlt0LvKU4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718107192; c=relaxed/simple;
	bh=4iGuE74BDxwLQsO249KSKAU+HX6bPKIAwO4Q+EsyiZ8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MlJATmDAiDgCT8FmAXvQZLNfXN7YG8wUjJJc7EoAU7Mmx+LCWgOmswydwVt4TOu1KCFTCPI80VZzK632hkxvO0h1mum4qMD1QI7jZNLaDajH0m7T6lwbcwJQcqHdR+qg8HKf8zbZJpvWcqaO5SiZuTf0MtMd9oP5TmpQOeZkjLo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=K2Kg2GHp; arc=none smtp.client-ip=209.85.208.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f179.google.com with SMTP id 38308e7fff4ca-2eaafda3b5cso71282961fa.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 11 Jun 2024 04:59:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1718107189; x=1718711989; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=CQzSwJnKjLuXJbZmjfDwPRrFFzgmeR6RnIyFdcSdy0E=;
        b=K2Kg2GHpeYuymdgXBf9/uJaDx8sip9eOLWbD0qz0e3YWtikORR6f9eBVIADnFuM3TZ
         5Cyib8l8MGEleG6Mk5bRNBUBtEEBxEZ8yVgcVpDmacNDrbWRnqlBAV/tCWpocD0691Dh
         0xMYdfPJYPl+4mq7SXQycxcZXuPDh5Tz4wwrfLNZeScJ3em1QdLw6rPWcqTQxaSfAE2D
         LOSbHcA9/pSIQ5gGt/6fCO1KWfjhQtJUQployMKNgyR9KyNu+5g+tdCWD4VzuZhUW5T5
         kjkX4e8S/ehecwgKbnIxUEYQL8Vnt/Z99KBrXQy93sa/LGD+smoqUXIOYHoXHA1kLm3X
         JFEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718107189; x=1718711989;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CQzSwJnKjLuXJbZmjfDwPRrFFzgmeR6RnIyFdcSdy0E=;
        b=lo4ZCPgnNLVPz8ZM8oS4zTTjKjLJn3OHdqpo6yj0CupYltw/Su8vCMQu8EppN4DaEn
         N702/u/uLaRw3WIAwrNWnlj+CHV8xrZant+M2CshyFWi0MD4Jvbc7zWlxIeGiSDCe5v8
         BofDuNb5Xy2hjTSuzDcBH0xj3s04suyi9J5G8UJYNlx3hC1KoEaxuvax5iNcg0GcY/2U
         Naz5yDv+TFYAROS6BnnDnQOsFMSOLD4ce3DRnGDu8u5teuDwjO1QOkLn4P1LS9+4QgfL
         amiE1k4ZU2zbjljTIfvEljtSpwMf/X4FY6dKRWVdxR7P/IMTBQ0T4YzDWUmNMTilUjZ4
         P4ig==
X-Forwarded-Encrypted: i=1; AJvYcCWsNvzIuBYmdI5MedbCnmv1PVl9YLRRY1LVUrIehfB0dxFQNQkYcKINBN92dOehWoSjYfWk6s4mCwMtehiY+dj+IJrPhu9HAbpZrZXzWQ==
X-Gm-Message-State: AOJu0YwehDBL0ECI5pH+dE1OYbfU5u+J3dUlwOVnIqNKWPsBfEWvQRYu
	YySHhsJW032ic0LM74txR+TCQIRzrc0Sdg+nXRV6p+1LhtiseUm5CBoelmy1qPU=
X-Google-Smtp-Source: AGHT+IEiG6bWGoC6W+LaRwRWxsSHZi70nYVqL1c15B6JskQ3SX5MbNBNkF6Y9FVXqPDvhRbcmv3nnA==
X-Received: by 2002:a2e:7207:0:b0:2ea:e5ae:8ffb with SMTP id 38308e7fff4ca-2eae5ae90d3mr57066381fa.47.1718107188773;
        Tue, 11 Jun 2024 04:59:48 -0700 (PDT)
Received: from eriador.lumag.spb.ru (dzdbxzyyyyyyyyyyyykxt-3.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::227])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-2ead41b05a8sm21198371fa.86.2024.06.11.04.59.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Jun 2024 04:59:48 -0700 (PDT)
Date: Tue, 11 Jun 2024 14:59:46 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Ekansh Gupta <quic_ekangupt@quicinc.com>
Cc: srinivas.kandagatla@linaro.org, linux-arm-msm@vger.kernel.org, 
	gregkh@linuxfoundation.org, quic_bkumar@quicinc.com, linux-kernel@vger.kernel.org, 
	quic_chennak@quicinc.com, stable <stable@kernel.org>
Subject: Re: [PATCH v5 6/7] misc: fastrpc: Fix ownership reassignment of
 remote heap
Message-ID: <xc2ys75plbtrenastitqafadfrtolpd3bjdqcrl3wnozpc6kdo@e6e73ousyea7>
References: <20240611103442.27198-1-quic_ekangupt@quicinc.com>
 <20240611103442.27198-7-quic_ekangupt@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240611103442.27198-7-quic_ekangupt@quicinc.com>

On Tue, Jun 11, 2024 at 04:04:39PM +0530, Ekansh Gupta wrote:
> Audio PD daemon will allocate memory for audio PD dynamic loading

What is Audio PD daemon? Is it something running on the CPU or on the
DSP? Is it adsprpcd or some other daemon?

> usage when it is attaching for the first time to audio PD. As
> part of this, the memory ownership is moved to the VM where

Which VM?

> audio PD can use it. In case daemon process is killed without any
> impact to DSP audio PD, the daemon process will retry to attach to
> audio PD and in this case memory won't be reallocated. If the invoke
> fails due to any reason, as part of err_invoke, the memory ownership
> is getting reassigned to HLOS even when the memory was not allocated.
> At this time the audio PD might still be using the memory and an
> attemp of ownership reassignment would result in memory issue.

What kind of 'memory issues'? Is it even possible to reclaim the memory
back?

> 
> Fixes: 0871561055e6 ("misc: fastrpc: Add support for audiopd")
> Cc: stable <stable@kernel.org>
> Signed-off-by: Ekansh Gupta <quic_ekangupt@quicinc.com>
> ---
>  drivers/misc/fastrpc.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/misc/fastrpc.c b/drivers/misc/fastrpc.c
> index 1ba85c70e3ff..24dc1cba40e9 100644
> --- a/drivers/misc/fastrpc.c
> +++ b/drivers/misc/fastrpc.c
> @@ -1238,6 +1238,7 @@ static int fastrpc_init_create_static_process(struct fastrpc_user *fl,
>  	struct fastrpc_phy_page pages[1];
>  	char *name;
>  	int err;
> +	bool scm_done = false;
>  	struct {
>  		int pgid;
>  		u32 namelen;
> @@ -1289,6 +1290,7 @@ static int fastrpc_init_create_static_process(struct fastrpc_user *fl,
>  					fl->cctx->remote_heap->phys, fl->cctx->remote_heap->size, err);
>  				goto err_map;
>  			}
> +			scm_done = true;
>  		}
>  	}
>  
> @@ -1324,7 +1326,7 @@ static int fastrpc_init_create_static_process(struct fastrpc_user *fl,
>  
>  	return 0;
>  err_invoke:
> -	if (fl->cctx->vmcount) {
> +	if (fl->cctx->vmcount && scm_done) {
>  		u64 src_perms = 0;
>  		struct qcom_scm_vmperm dst_perms;
>  		u32 i;
> -- 
> 2.43.0
> 

-- 
With best wishes
Dmitry

