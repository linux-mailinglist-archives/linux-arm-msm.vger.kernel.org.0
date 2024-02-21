Return-Path: <linux-arm-msm+bounces-12000-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 33FE885D10E
	for <lists+linux-arm-msm@lfdr.de>; Wed, 21 Feb 2024 08:16:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id BB3F61F27389
	for <lists+linux-arm-msm@lfdr.de>; Wed, 21 Feb 2024 07:16:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4B26F3A8C9;
	Wed, 21 Feb 2024 07:16:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="qLjog0TK"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BDBCB3A29C
	for <linux-arm-msm@vger.kernel.org>; Wed, 21 Feb 2024 07:16:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708499773; cv=none; b=phFYfDFBIc6Axv9u8gZgun4MiFHk/jbUrc5Aee0O5OyUjkkhwEJ9P3c9DvLZNHnhwNUsxH6kEPpF0/EG+YSQeQdMJ/TJUk2biW4F1PMgiHbIsCYoOCABd+Vc1d1bpvuhP50WCklp3yqaEQzm94mF+bPNMRCtFcYWq84yZUPZ7dY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708499773; c=relaxed/simple;
	bh=wkLAEBQr8OqY63bSzLHVJZpa0DZYKA/19CYDFKRQsv8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qXDE/Kt47e79+iFbjprAYsA44y9osPSNAAvxLuYAaxJ30gok+bquo8qIzZyc85/chr615TytLsytXzJDAgTUHZKOIoGk3+1sgZrMwT6eQc0VVMgXZ35Jn/exhTaTHWbWQG5FCdkNvViYFii7gtjv1UvBHt2ZJCwxwXlpnwJXK/Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=qLjog0TK; arc=none smtp.client-ip=209.85.214.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-1d746ce7d13so43335525ad.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 20 Feb 2024 23:16:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1708499771; x=1709104571; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=YVkY57PGrXF7HDeyEq0gu14Rt9F9yCgxKA8JQPS+gCQ=;
        b=qLjog0TK4W2ByJEu4T3+C7BAXqLgytEJYZBPP2bs2erkuaehPPIarAEgP+EY5gOSoS
         icIfBf9OvA4G++8RCKnhX3Q/zCj0KRFjni27DrSyRtuJRaXrez7EjZKZy5qJRmrm5jAx
         o91qjLBzrx7/A/jnNbQRoUhlA+1a3YO8bpid7tNRZzU0uEo1PaeNyDNoVlB6H5oKeOyv
         Y+67FOB+yxCrgl0jkTNbxFDFwI00cHPk2894RencpluP0I1xyASJZ7tdxa38zpqHxZ93
         sHZNPvFm60ZC0h1JZRY2iIh1OUxpa2+kOUGtL3XnoVSpTeMxeNhtwYgFMFx3EYNhsFYC
         i16g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708499771; x=1709104571;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=YVkY57PGrXF7HDeyEq0gu14Rt9F9yCgxKA8JQPS+gCQ=;
        b=l1qPDgh3dlkMrnGh3wSamnr7+OSwMCDUWcsoKhWw3Iizg6rC+E54ranWjQpdSrNAIs
         C9Vqc0wem7EMzOjianStbtfsMUrw4WWf8gXByu8FL+fj6pYqCnXC05eT39uV/X/sR3yF
         wX7OHShAqn4sAbCV1bC5pEgD2vW9veg1VitlDQASeypsdy2Pb3m7HfPbX0+/wy8oZafi
         r7qtHpoDIDv3atuPnvpVrk39J2ghhEIRqJysLfkWYapExWE2aCToBptY3FFUoMQfi0x0
         r7WRQuTRdKAbtP5c4OJFQ/viYhB+AWxn9KxmkH1IBPU4KJFKP9QId1LKCO4ZkOGkuBv+
         L8ug==
X-Forwarded-Encrypted: i=1; AJvYcCXBUCevVaLJGkO5QWaJysySKA4aZfYXZFDr6fpNxBZQF6Vn5ZzD0Tv81lGVNLVQp0fr4cCt8wiGdLZMo901EdjZVAVexgffhgJrL3ZzuA==
X-Gm-Message-State: AOJu0YxTME7KxqVm57b6JItZbwzG2KsbfKjUJA9GdL298BIV6nbYSAJi
	ds6sLhnD04Do1a5XNXDb/8mvAW0mjaSuoZJYDTKt1o6+t4X5cncpldT9MV/4oaJZcRPJT13r70c
	=
X-Google-Smtp-Source: AGHT+IFJseXOB8SzQJOx52KJSNABZWO93XSLQ3J8TgYtz3c9BhFtZivo9ic5RjdmOMgrSHlSH6V6vQ==
X-Received: by 2002:a17:902:d4c3:b0:1dc:10a5:8be7 with SMTP id o3-20020a170902d4c300b001dc10a58be7mr6016047plg.50.1708499771002;
        Tue, 20 Feb 2024 23:16:11 -0800 (PST)
Received: from thinkpad ([117.207.28.224])
        by smtp.gmail.com with ESMTPSA id kn14-20020a170903078e00b001d9a91af8a4sm7379488plb.28.2024.02.20.23.16.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Feb 2024 23:16:10 -0800 (PST)
Date: Wed, 21 Feb 2024 12:46:04 +0530
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: Alex Elder <elder@linaro.org>, Jeffrey Hugo <quic_jhugo@quicinc.com>,
	Erick Archer <erick.archer@gmx.com>, mhi@lists.linux.dev,
	linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org
Subject: Re: [PATCH] bus: mhi: ep: check the correct variable in
 mhi_ep_register_controller()
Message-ID: <20240221071604.GH11693@thinkpad>
References: <bebcd822-d465-45da-adae-5435ec93e6d4@moroto.mountain>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <bebcd822-d465-45da-adae-5435ec93e6d4@moroto.mountain>

On Wed, Feb 21, 2024 at 09:20:19AM +0300, Dan Carpenter wrote:
> There is a copy and paste bug here so it checks "ev_ring_el_cache" instead
> of "ring_item_cache".
> 
> Fixes: 62210a26cd4f ("bus: mhi: ep: Use slab allocator where applicable")
> Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>

Applied to mhi-next!

- Mani

> ---
>  drivers/bus/mhi/ep/main.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/bus/mhi/ep/main.c b/drivers/bus/mhi/ep/main.c
> index 8d7a4102bdb7..f8f674adf1d4 100644
> --- a/drivers/bus/mhi/ep/main.c
> +++ b/drivers/bus/mhi/ep/main.c
> @@ -1497,7 +1497,7 @@ int mhi_ep_register_controller(struct mhi_ep_cntrl *mhi_cntrl,
>  	mhi_cntrl->ring_item_cache = kmem_cache_create("mhi_ep_ring_item",
>  							sizeof(struct mhi_ep_ring_item), 0,
>  							0, NULL);
> -	if (!mhi_cntrl->ev_ring_el_cache) {
> +	if (!mhi_cntrl->ring_item_cache) {
>  		ret = -ENOMEM;
>  		goto err_destroy_tre_buf_cache;
>  	}
> -- 
> 2.43.0
> 

-- 
மணிவண்ணன் சதாசிவம்

