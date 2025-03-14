Return-Path: <linux-arm-msm+bounces-51340-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 52172A60878
	for <lists+linux-arm-msm@lfdr.de>; Fri, 14 Mar 2025 06:48:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 87C6B17593D
	for <lists+linux-arm-msm@lfdr.de>; Fri, 14 Mar 2025 05:48:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BF0AC1E86E;
	Fri, 14 Mar 2025 05:47:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="NNVkvuyV"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 285A83BBE5
	for <linux-arm-msm@vger.kernel.org>; Fri, 14 Mar 2025 05:47:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741931278; cv=none; b=AzLwPYcBcdT/d9JAUfhmMFU83JWz6JFO8bef+iGP8erjIKfFHaiKMbFTCCQf83TUoxs1g/fW3Vwqld7v/cVKYTBEccia/5Xu3gjdCnqUaIk6BB0AHevZ9ngpX6/gZlYjPz6N6iCP4dAyjLTwiMdHczinEudDVR7KrLWTd1TtLIM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741931278; c=relaxed/simple;
	bh=u8lYD5H9d5isZnVAaM3Qu3eN2TFbwn4AGXdXIiugNhM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=o07YZeT6T5IRh/NaweISD8f/B/HxnUnJRZHLYRkeXVjxoz8uBf9wSK1eHeY9rjW2UvC8tSau5L8rf1Y7dPuwNP57oJPWR2WpmCjBaKk1B0M83x2NDzOdXxYWRUGtTsicDen9I6Oj48vqSCq+hVB/KuIf+ILqU2pyUWZtDq/UG0E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=NNVkvuyV; arc=none smtp.client-ip=209.85.214.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-225b5448519so32319415ad.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 13 Mar 2025 22:47:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1741931276; x=1742536076; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=+KKkjYdOavJCVAUTBcZd3373rylcFMljAJYfk7ew03Y=;
        b=NNVkvuyVPZrNEvOoL+hXXiFxiPgenXTRgQQdVg9a29YJRPbLsiKgWwmtEBoefctbcr
         M/VzMG0LdwT9n3lt3WXH2H6FHSyktX9tD/afRiOXMzirC2YzuhEXYP5Sf2tMxCD8WlU9
         1QYq2bQw5q9XdSeoGFt5WVAPWkSjlIDlscwPc5AlN6s81JDoagqOMJHQ9qkPtwywBO7z
         pjjtP853zqs+5VoVPrnoZN/RAQf+rAh1HDZNF1J7Bq+PonYLXNI/ddwi/mhqjI+Xen+o
         a2IzraZM/fULsJv0pKKKsGSzOa89VagJm71ru/Y77zOhNyhQ6XfKgRXMpqTsmKpuiD1d
         GhXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741931276; x=1742536076;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=+KKkjYdOavJCVAUTBcZd3373rylcFMljAJYfk7ew03Y=;
        b=S5GGAjacNVOd3mNANVMDP9vqGwEwv+olULflhUWKL5NUy01whKju74wwGgXA1ztdT5
         1FjIZOiC1zEAJtzslTYymNaYpnmpH78wA7NSGpI0rnJq8r6Bw9PaCyuifGX2BCWg9vd7
         XJBfFCjzlA+5CG8BHYfm0mTxGXv0yGYJOXQp0KqpCp9aOR0hKYkcJsWHU53q7f8R0LTG
         43cuYkUF2EMSjh9QpOUrIqaj8B8nM/WRuv5vtPWnO/loxwl3gjR/dC4TtN/Gp4f9F4iv
         9SRdvs781yjEFLldMwKREXQZhlJYm6f/UaN/ITHyRlhzrq2MmFC1W8LSb6gHNt+gP4Z9
         eLHw==
X-Forwarded-Encrypted: i=1; AJvYcCW7taa4C4D3lgcGzXtZytu0Bdro/FHgjjxHoSm0+Lxstj9Ue2vy00FrKIDKj4qry1itV+rXzZ9jfbdVLa+K@vger.kernel.org
X-Gm-Message-State: AOJu0YwmsQB8viyoM01kE8x5ab8X/kJr3FH+Bvb059srAW1mEw6OMv35
	aEg4RtzSrgKa8/xePpkDLeRdHpo18IA0t3EO1eTXPYA3QiiUbJkKdn+hpwxew3Jdvp/kHgF3P3A
	=
X-Gm-Gg: ASbGncu8bAzybQGb/zWWxp8BGx+s7wlV/jWkMhrbw12iA/F+eD7wG3u+Oid/hijn8AD
	Ne9idQP8nsJmqMRC/Q/RYN8Mp1wcUhVQ3wwPZH98BpuV/ryniKPDu4TqbogXnHm2Ee8aG7BdHw+
	4Y5p/GggZ09wf0kU8AVD8Yi07n2XGXkapJc6bs9FopA788p3d+wtuVIX88GgxM0tptMwp4KS/pG
	vBdVuV62KElfl+489cT2ce4teXgHr7FrgST9RiH3va+QTHWfWuS+XoTlXbV3CvcpHSzDZuWOEg4
	e9k+vl9JHcGMQVwPtu2CgHLauA08ecbNDfczdA/p6hDbiLxVSTZ2ESV1
X-Google-Smtp-Source: AGHT+IECCfLOu1My34R7fTuExIaDoalHOxnqqRfKPP6N6jUSZ/988WfVgHpEOHN0Und+te0PXpgdLQ==
X-Received: by 2002:a17:902:da90:b0:21f:2ded:76ea with SMTP id d9443c01a7336-225e0afa014mr15076495ad.36.1741931276314;
        Thu, 13 Mar 2025 22:47:56 -0700 (PDT)
Received: from thinkpad ([120.56.195.144])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-225c68a448fsm22801795ad.72.2025.03.13.22.47.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Mar 2025 22:47:55 -0700 (PDT)
Date: Fri, 14 Mar 2025 11:17:51 +0530
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: Jeff Hugo <jeff.hugo@oss.qualcomm.com>
Cc: quic_carlv@quicinc.com, quic_thanson@quicinc.com, mhi@lists.linux.dev,
	linux-arm-msm@vger.kernel.org,
	Jeffrey Hugo <quic_jhugo@quicinc.com>
Subject: Re: [PATCH] bus: mhi: host: Fix race between unprepare and queue_buf
Message-ID: <20250314054751.mgooeiput4yhsfm5@thinkpad>
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

Applied to mhi-next!

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

