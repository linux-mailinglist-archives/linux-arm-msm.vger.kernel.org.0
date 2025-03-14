Return-Path: <linux-arm-msm+bounces-51338-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9AA56A6084F
	for <lists+linux-arm-msm@lfdr.de>; Fri, 14 Mar 2025 06:29:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E62513B8C4B
	for <lists+linux-arm-msm@lfdr.de>; Fri, 14 Mar 2025 05:29:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B611513C67C;
	Fri, 14 Mar 2025 05:29:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="GJqH4Lhq"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0AF7B133987
	for <linux-arm-msm@vger.kernel.org>; Fri, 14 Mar 2025 05:29:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741930161; cv=none; b=GXi6frUqO2DC8PWSKoQuiUjWZVOuG2eTj0RYUEjy0LNXYFD41XRFiF4Zxc1MdSB7slD3dMahb1+L33X09u7LzgKWZbS5G/eVPBmXZXiARZp+sUpBGFuCjKu4gBNoZ1cBQ2E6ePHLmVNR81yni3zZGwp3cNZaTdWtoIZAcTMs9rE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741930161; c=relaxed/simple;
	bh=lvjF/vf/1FBTD6ODcwiNR8r2K6BYFh4q0H9Wc+Rrg+s=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=N3M7P+gO34z3Rcw/XUn2YAE1GyqYAkthX5A5qFyzPyM8iY3E88NK6JDvJKvM7Jlm4Y+JaxjXej7aUReq5/+w/3B1fFFVTbP9uPFAZ8IxAbc2/DXek8wj2OrLHYdA9EF8a3kPRc28uNEg6gNJwMizrQaQJdra10D/0o9xlp2dxLM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=GJqH4Lhq; arc=none smtp.client-ip=209.85.214.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-22401f4d35aso34855825ad.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 13 Mar 2025 22:29:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1741930159; x=1742534959; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=wudfzgqNI4CJt3CbrvIHvc2N1xk0CBifbAoX/xv8R04=;
        b=GJqH4LhqzeD1b5YeVIHWQv4UiRtdTmD2oyr6UG5iNA4nBeEfVBIkaus6YpNOa0+fxe
         fCEVJZeW2Kca15g2fDYantir9Mj7YmOPmXqCS4pljf5vnVMEfPAL/9gNSfQXO12hg0Xq
         eK9CyyOxAjx3Z9zwAPuBz3Syeoc9RgRKsV+6+E7EVSOOfPdxf+0MfsyleGehsQp8FDHg
         oXXYu9mRiG3fhhbKOk22IKFp/ikkuk/F+82/luJNJXZe1djvUCCpM4qW3wGheike1cFf
         pDk5WHhoXz6c37sSg5jET789XHjy8EcYDaeSbtGBQFPGmKZyJKiSkE5ZUkZ4LFM9AFrL
         oaLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741930159; x=1742534959;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=wudfzgqNI4CJt3CbrvIHvc2N1xk0CBifbAoX/xv8R04=;
        b=GQhJIwS3Mme/yGNoitgAtl/fXq0cYsaS29BzfxG7RI//bepyPo3aShMAXzcLdA6H6S
         ZGkGmJM/FToqctu+9o6mvN6DFBUc5W1+yFNRuqZvOwB++w1sku4UzMW319/Dpzk89Ngy
         nnMg2xWKXl+3xMAYO4SQAa6NrjQ+61AfMrcXKqAIJMEbN+B5qq7Q5rnLjrLyU7bjvICs
         ay11qvaaTnL2K69gvbIbkUhnpEAAcAsZ0qui5erEsd2Kjjdr/oQUxO08WoC51MgXFUQr
         LAslAkWScjqKtEuJkh+XpTHFg7xmc0DU6fHFRr3F238lhYxskvrkjopyHOzSLpAwcVjF
         r8RA==
X-Forwarded-Encrypted: i=1; AJvYcCWF+bJWc1k5G24ic1/o8fCV3vIXIGv7pC5KsEQCkm7HzF+d1J2pwJx2S+hH/8fHqOJPtB8x7zabwcIAwUe2@vger.kernel.org
X-Gm-Message-State: AOJu0Yxfs3JuVXyW2b2IcPkCmHQMDrDlVaQ1NYxLYzZKnsqnafYdTLkV
	HCx2JR6TmQhLeuhVPSW9M7eiQoIzmCE7Xz0C9tn/Hs0CaN/W4GFzdxlpTDlhNw==
X-Gm-Gg: ASbGncvHTRH61A/HMgz/5+OiMB7yz2pw5d6D8goqyjlJApP6UC+qKIx3JL126hts1DP
	RFZI8qo/4HjRv+PAFJ7ALILoORxKzsJkLq/3EnQeQG8fgnDP/SJPsIfVCBsc347iIO/JoLkv020
	9MpdodUutE61ctMqzK3BmF6FGviDFe4qwdL7/aRC6mxac5CZljg8jrAA8P6STmijinWn0Ilt2kP
	zLUewbOyxrCetZqpFTR7JQQnvsnDgY3zKuCOtZsyf2Yt4cqA4G3pzjNCrImNQzMa8ZX6HRu6REf
	wS7U6zyXK0JCVQ/o+4hljciK4EqmntLZQzxb5xQZN1g0TBFXOE1FxKbf
X-Google-Smtp-Source: AGHT+IF2bF7u4qDFET7S0Tsn8pwPaHXxvjGNkAhrRsneRWS2Axy2BzcWWUnNDpSPcUtooKe5diBoig==
X-Received: by 2002:a17:903:22c1:b0:224:2524:3047 with SMTP id d9443c01a7336-225e0a6b2damr19184565ad.26.1741930159071;
        Thu, 13 Mar 2025 22:29:19 -0700 (PDT)
Received: from thinkpad ([120.56.195.144])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-225c6ba70d2sm22561515ad.136.2025.03.13.22.29.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Mar 2025 22:29:18 -0700 (PDT)
Date: Fri, 14 Mar 2025 10:59:14 +0530
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: Jeff Hugo <jeff.hugo@oss.qualcomm.com>
Cc: quic_carlv@quicinc.com, quic_thanson@quicinc.com, mhi@lists.linux.dev,
	linux-arm-msm@vger.kernel.org,
	Jeffrey Hugo <quic_jhugo@quicinc.com>
Subject: Re: [PATCH] bus: mhi: host: Fix race between unprepare and queue_buf
Message-ID: <20250314052914.azbfimrtaes24n2n@thinkpad>
References: <20250306172913.856982-1-jeff.hugo@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250306172913.856982-1-jeff.hugo@oss.qualcomm.com>

On Thu, Mar 06, 2025 at 10:29:13AM -0700, Jeff Hugo wrote:
> From: Jeffrey Hugo <quic_jhugo@quicinc.com>
> 
> A client driver may use mhi_unprepare_from_transfer() to quiesce
> incoming data during the client driver's tear down. The client driver
> might also be processing data at the same time, resulting in a call to
> mhi_queue_buf() which will invoke mhi_gen_tre(). If mhi_gen_tre() runs
> after mhi_unprepare_from_transfer() has torn down the channel, a panic
> will occur due to an invalid dereference leading to a page fault.
> 
> This occurs because mhi_gen_tre() does not verify the channel state
> after locking it. Fix this by having mhi_gen_tre() confirm the channel
> state is valid, or return error to avoid accessing deinitialized data.
> 
> Fixes: b89b6a863dd5 ("bus: mhi: host: Add spinlock to protect WP access when queueing TREs")
> Signed-off-by: Jeffrey Hugo <quic_jhugo@quicinc.com>
> Signed-off-by: Jeff Hugo <jeff.hugo@oss.qualcomm.com>

Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>

- Mani

> ---
>  drivers/bus/mhi/host/main.c | 16 ++++++++++------
>  1 file changed, 10 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/bus/mhi/host/main.c b/drivers/bus/mhi/host/main.c
> index 4de75674f193..aa8a0ef697c7 100644
> --- a/drivers/bus/mhi/host/main.c
> +++ b/drivers/bus/mhi/host/main.c
> @@ -1207,11 +1207,16 @@ int mhi_gen_tre(struct mhi_controller *mhi_cntrl, struct mhi_chan *mhi_chan,
>  	struct mhi_ring_element *mhi_tre;
>  	struct mhi_buf_info *buf_info;
>  	int eot, eob, chain, bei;
> -	int ret;
> +	int ret = 0;
>  
>  	/* Protect accesses for reading and incrementing WP */
>  	write_lock_bh(&mhi_chan->lock);
>  
> +	if (mhi_chan->ch_state != MHI_CH_STATE_ENABLED) {
> +		ret = -ENODEV;
> +		goto out;
> +	}
> +
>  	buf_ring = &mhi_chan->buf_ring;
>  	tre_ring = &mhi_chan->tre_ring;
>  
> @@ -1229,10 +1234,8 @@ int mhi_gen_tre(struct mhi_controller *mhi_cntrl, struct mhi_chan *mhi_chan,
>  
>  	if (!info->pre_mapped) {
>  		ret = mhi_cntrl->map_single(mhi_cntrl, buf_info);
> -		if (ret) {
> -			write_unlock_bh(&mhi_chan->lock);
> -			return ret;
> -		}
> +		if (ret)
> +			goto out;
>  	}
>  
>  	eob = !!(flags & MHI_EOB);
> @@ -1250,9 +1253,10 @@ int mhi_gen_tre(struct mhi_controller *mhi_cntrl, struct mhi_chan *mhi_chan,
>  	mhi_add_ring_element(mhi_cntrl, tre_ring);
>  	mhi_add_ring_element(mhi_cntrl, buf_ring);
>  
> +out:
>  	write_unlock_bh(&mhi_chan->lock);
>  
> -	return 0;
> +	return ret;
>  }
>  
>  int mhi_queue_buf(struct mhi_device *mhi_dev, enum dma_data_direction dir,
> -- 
> 2.34.1
> 

-- 
மணிவண்ணன் சதாசிவம்

