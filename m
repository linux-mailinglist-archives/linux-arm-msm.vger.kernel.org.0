Return-Path: <linux-arm-msm+bounces-11997-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9576A85D0DA
	for <lists+linux-arm-msm@lfdr.de>; Wed, 21 Feb 2024 08:07:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4B858285E8D
	for <lists+linux-arm-msm@lfdr.de>; Wed, 21 Feb 2024 07:07:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4078F3A1C7;
	Wed, 21 Feb 2024 07:07:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="clOwIJtb"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E52D3399B
	for <linux-arm-msm@vger.kernel.org>; Wed, 21 Feb 2024 07:07:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708499271; cv=none; b=NeynLi+n2+uDLfxFkU/i6c9Oa8P6ADMbnctt1Sc/0mt58WRo8T9nRrML0/1YY0n108leFYPcaxK+mzbkeWhNu0TRE4iF5gl2qru8Y/UG7Ae07jsbKrzeOUuRlbq7jACKzAX3cOwJ4S5mJhCYUSP0e5m77Z2bsAICs9WHI7bn0i0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708499271; c=relaxed/simple;
	bh=iBt7GgaipAQNgxegnjfd9wvWH/HcjSlObaEGobdnf/Q=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gpt3WBYFNs3zlANLweXr+rfiiy9p/rwU0ZDyro7wE4l5V/wt847nUC4aF1eyvkdHWIFfYDPYdhWj+dj5GgZN1l29YkVqFvuji/Q/5Ggf8hnCsPcCBfsv+81azS5uBW1/ARu3+Hp4BsOeJ+IX/hKs0X2wsbu/CUAp7cOiCepe7hY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=clOwIJtb; arc=none smtp.client-ip=209.85.214.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-1dc09556599so1986235ad.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 20 Feb 2024 23:07:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1708499269; x=1709104069; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=HN6S5OkRpzjfW/oUatP0Qz5x0+v3A5sIvi8QPWu6N9A=;
        b=clOwIJtbzZdNNmTB3DcNP1rxBXqiJx19IH8sOj2z+HHyUKt76QaosgVvbBJ8sjClvZ
         OgWde3aU7zpLEY/shOrHDRDoEykCcWkIDHJtBWLMgNmtCwuwCOZnxSqwrXocY80HdxvC
         /KHBkvGF9LRZqSfenBJpQDDRlArPkiYAKb3dg3kRA/4/HbHqo8M5xk/aAuGT+TLioT5a
         gVFWbLnrlTaZVmCJE36uFIIMUMsK98+RlQtXxzbSk2yWJ4cpnqo7lOyuyd8jJcfOhAYo
         5eZgp6Mq+HeRDZqyzceFr7bbhpE0bWn7Jy/Vz2ymbq3oQnmXVw8ipJ9mlaa5/yOXV5Jf
         ro+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708499269; x=1709104069;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=HN6S5OkRpzjfW/oUatP0Qz5x0+v3A5sIvi8QPWu6N9A=;
        b=D/CJPAV25nvJnziHqccY75KuwjBX001mx4UXQfUmFoUoFyHKivkrGAG716XDLqW7M7
         GYr6NSJib3UcMr/ohMpY5LRwwfyRMLKlOdUWHzZy5e6q21i14QZ8PlF0MWWQN+9TR2Ja
         VotOIyfs4pE48Y65a1rutmvUHSwqEVSWYZjc83M9atyBJwjYW+qrAPuQqkF8xmeRAYt3
         5e1OWB6OvnpXdFwCGTw0lBfL6fbmScPcaVyxKWINwHP9DTGcg8VOpSZEczCM2swL2Yng
         GJMBjq4zX//m559tp6cHyh208lVvWqchmRhGNGcNlTMdV213uBl+vfn1RhLLJQ0jvlh2
         bxFQ==
X-Forwarded-Encrypted: i=1; AJvYcCWNqu04u9Ru8PJTIjoHLIDZy2f/GMsnMeu4jXIgG6RdFSFU2p4oWuqblUTtJeAivUsfLHpBY6iZOdV66Ns7+c3H+SKStv0rMjIUMSMsMg==
X-Gm-Message-State: AOJu0Yyk0pUD0VR+R6pgGJHDDnOio+OWOuPWVMNg4yBoAG+9ORSD0vFI
	7WnHWYCxO9ScQYJkJgzIgWjEsWVdc7aX+I3mzJEvCnXpmmu1jbg2GCULVyhy1A==
X-Google-Smtp-Source: AGHT+IGw2tun5cH6q5fUCAvKCYRBsgdMhG+kJkVxK0Ihl/pZe6XSEZfaTek3RQXFn856xz5XBxgK8A==
X-Received: by 2002:a17:903:1106:b0:1d9:e18b:d916 with SMTP id n6-20020a170903110600b001d9e18bd916mr24917776plh.28.1708499268670;
        Tue, 20 Feb 2024 23:07:48 -0800 (PST)
Received: from thinkpad ([117.207.28.224])
        by smtp.gmail.com with ESMTPSA id jd20-20020a170903261400b001d94a3f3987sm7335617plb.184.2024.02.20.23.07.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Feb 2024 23:07:48 -0800 (PST)
Date: Wed, 21 Feb 2024 12:37:42 +0530
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: Alex Elder <elder@linaro.org>, Jeffrey Hugo <quic_jhugo@quicinc.com>,
	Erick Archer <erick.archer@gmx.com>, mhi@lists.linux.dev,
	linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org
Subject: Re: [PATCH] bus: mhi: ep: check the correct variable in
 mhi_ep_register_controller()
Message-ID: <20240221070742.GG11693@thinkpad>
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

Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>

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

