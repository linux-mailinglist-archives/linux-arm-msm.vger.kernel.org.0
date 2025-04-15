Return-Path: <linux-arm-msm+bounces-54309-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 18E34A894E8
	for <lists+linux-arm-msm@lfdr.de>; Tue, 15 Apr 2025 09:26:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 5736018966E0
	for <lists+linux-arm-msm@lfdr.de>; Tue, 15 Apr 2025 07:27:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C6DBD27A10A;
	Tue, 15 Apr 2025 07:26:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="s+soWiVh"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B2BC275114
	for <linux-arm-msm@vger.kernel.org>; Tue, 15 Apr 2025 07:26:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744702010; cv=none; b=p0VEnxcgwfji0HxVJZ/aBwwDdvK5BK1NEifkeL0HmNGeewvocSvMv7YHGQAON+OlVDvIujv0TvcVUoILE2Le9vM77Z+NhOoYeOQUyhALPZRl+iPZby5G/XiJ8M1zsoxOnnP2QSr6Lrcubjog98YviaMfbgdFo3VTQ9MqzCjDEx4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744702010; c=relaxed/simple;
	bh=ndmBc8dT+YUFbZUh8JSUskzkgEjtafSmthf85hpWieE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=uyW+MBd4zBFuo4myPbveiX+Pb1n2K2LXHZuAFG0D4PVINdi3DDzDI1MX8iNvDIuezVTWAm0BSfBUqRFA8abTxtN89kK+nAXGAIrd2YrOLDG/cKqFOcSYqo05XyOY7gf7IvzTd0+Ps5PPpllD1aL+VUkWLApy+JTn/AeGraAygyw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=s+soWiVh; arc=none smtp.client-ip=209.85.214.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-2279915e06eso55144905ad.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 15 Apr 2025 00:26:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1744702008; x=1745306808; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=fCJNaeHH0qeNbjhZ4y2YJBf4Ih9X6gqwUBqd6D7xbtk=;
        b=s+soWiVhFQrvqTx0PlOvSWQB0LYI6Dkq5xgIaduyCsfnVJa13I13EqbaI4VC6PcBl3
         XjNA8/BCKPVDBzf5YW3dvfaAb/yI31loHO61jR8cOy1YgDB0/EI6wlfQ4cGvlf9kFBET
         rt6szD6Qh4uanOiCoab3ZWaE08xdAyXTcaL0gPZPMEQ38AWbCgEUQ2dl1HB9MXNGVfQ6
         NUcdpdNo3jFORAKu+xvPntisZSk8qhKJhcGLbsIkFvz4kKyYrSNxPmDyhfIlLVki3J8f
         /yJ/LGPRZdTnh8BC+PeXpyfWlIxRetl1g27htSY8jMg8/5b4/UoAkR15iYWbpcmHhA3g
         kfYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744702008; x=1745306808;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=fCJNaeHH0qeNbjhZ4y2YJBf4Ih9X6gqwUBqd6D7xbtk=;
        b=UtOOW8aVY2yKnBb9mXFTj4uTNPYukWrcKhby+W52pNASTpvdTXHzI+MLXw5nTbzQU9
         CCkb0Wx8AG50mvs522BirD5gIbQrWDj9tPrX/az3soavZE3gBOYmYESG7qkqL0LdqEIT
         6wbtBd2W8ba1YwDEqWHHFdkyakF0fi7TXBBur1WPrj+6zOgdq0VnHj89a31f4kLnbVnJ
         eHBlw0HMl+3ivdiQhzWQ7U7QeISH2Vy7MMlV+XaVByZSa2lMT8hvVBvZ++8JcLTIY7Pt
         4l30svOj6rVWm3gQLW7kWCL/wjw6346520vwdxPJZkm1uAQcaKE8RGtEsY4LO1EA/gjN
         OTCQ==
X-Forwarded-Encrypted: i=1; AJvYcCV9UXWEcStO4UIJrEPIJ+ZeJ5AQeQVw8ezaAMP4m0sm3E+FKB6IXNv4L8UKDRRQaldWizUXfFD6ILwiBs+f@vger.kernel.org
X-Gm-Message-State: AOJu0YzDHeEC+N998MgCkFydG5Fd0FJPYYzDGCcwY/LIUm4FV3jw8vDF
	/PLlv6SPeixeIamI6jgG32f5JkMVe9938q0eg1Yhc/Wm1/nrHQRe+AayuIHa3Q==
X-Gm-Gg: ASbGncvev9Bp+pSFtztqsYsgCUvAPIDiSpjwOENcjZVWy6dfldZM4sqsWmpHg3R+0hc
	PkFTKwUjSlp7E+6jol5mQsvAcT204rQTe218cUgNoYwA0vuFNM/aGt/BsAtCLIb9AVtImtqwKtJ
	qJiRsjvhoLDCjZ2YdJAf/9ZKyBpMf1CEugWKIY7dGEDVXeBhP/GBf2gw4zJWbv2uaUjrjeJGS9I
	q4LF/7hZCD6Ka3g9woTO9SyA70EoRl2ib5o8xYXXXd8cIp6+G7ab0H+NUEyX5McYBeBWgYoSMIk
	acB62iCjT/yK8OYlz1WSplMjPlyIOTFKb65+d0FOlI7KWcv/0g==
X-Google-Smtp-Source: AGHT+IHguLmuMIGRBsFlyspehfjQDN2w8AskD61wkAT+OvpAWkCdIa3KMt+LNv9RjQaYs4JZBwB+yQ==
X-Received: by 2002:a17:903:904:b0:227:ac2a:1dcf with SMTP id d9443c01a7336-22bea4bd870mr208246955ad.23.1744702007792;
        Tue, 15 Apr 2025 00:26:47 -0700 (PDT)
Received: from thinkpad ([120.60.71.35])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22ac7c93aa3sm110866935ad.149.2025.04.15.00.26.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Apr 2025 00:26:47 -0700 (PDT)
Date: Tue, 15 Apr 2025 12:56:41 +0530
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: Sumit Kumar <quic_sumk@quicinc.com>
Cc: Alex Elder <elder@kernel.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, mhi@lists.linux.dev, linux-arm-msm@vger.kernel.org, 
	linux-kernel@vger.kernel.org, quic_krichai@quicinc.com, quic_akhvin@quicinc.com, 
	quic_skananth@quicinc.com, quic_vbadigan@quicinc.com, stable@vger.kernel.org, 
	Youssef Samir <quic_yabdulra@quicinc.com>
Subject: Re: [PATCH] bus: mhi: ep: Update read pointer only after buffer is
 written
Message-ID: <gq4s5je4grjjqwhrmrqrurglm4kctnsslwr4kllxdyphy4re4d@kzacgpg7k3xj>
References: <20250409-rp_fix-v1-1-8cf1fa22ed28@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250409-rp_fix-v1-1-8cf1fa22ed28@quicinc.com>

On Wed, Apr 09, 2025 at 04:17:43PM +0530, Sumit Kumar wrote:
> Inside mhi_ep_ring_add_element, the read pointer (rd_offset) is updated
> before the buffer is written, potentially causing race conditions where
> the host sees an updated read pointer before the buffer is actually
> written. Updating rd_offset prematurely can lead to the host accessing
> an uninitialized or incomplete element, resulting in data corruption.
> 
> Invoke the buffer write before updating rd_offset to ensure the element
> is fully written before signaling its availability.
> 
> Fixes: bbdcba57a1a2 ("bus: mhi: ep: Add support for ring management")
> cc: stable@vger.kernel.org
> Co-developed-by: Youssef Samir <quic_yabdulra@quicinc.com>
> Signed-off-by: Youssef Samir <quic_yabdulra@quicinc.com>
> Signed-off-by: Sumit Kumar <quic_sumk@quicinc.com>

Applied to mhi-fixes!

- Mani

> ---
> ---
>  drivers/bus/mhi/ep/ring.c | 16 ++++++++++------
>  1 file changed, 10 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/bus/mhi/ep/ring.c b/drivers/bus/mhi/ep/ring.c
> index aeb53b2c34a8cd859393529d0c8860462bc687ed..26357ee68dee984d70ae5bf39f8f09f2cbcafe30 100644
> --- a/drivers/bus/mhi/ep/ring.c
> +++ b/drivers/bus/mhi/ep/ring.c
> @@ -131,19 +131,23 @@ int mhi_ep_ring_add_element(struct mhi_ep_ring *ring, struct mhi_ring_element *e
>  	}
>  
>  	old_offset = ring->rd_offset;
> -	mhi_ep_ring_inc_index(ring);
>  
>  	dev_dbg(dev, "Adding an element to ring at offset (%zu)\n", ring->rd_offset);
> +	buf_info.host_addr = ring->rbase + (old_offset * sizeof(*el));
> +	buf_info.dev_addr = el;
> +	buf_info.size = sizeof(*el);
> +
> +	ret = mhi_cntrl->write_sync(mhi_cntrl, &buf_info);
> +	if (ret)
> +		return ret;
> +
> +	mhi_ep_ring_inc_index(ring);
>  
>  	/* Update rp in ring context */
>  	rp = cpu_to_le64(ring->rd_offset * sizeof(*el) + ring->rbase);
>  	memcpy_toio((void __iomem *) &ring->ring_ctx->generic.rp, &rp, sizeof(u64));
>  
> -	buf_info.host_addr = ring->rbase + (old_offset * sizeof(*el));
> -	buf_info.dev_addr = el;
> -	buf_info.size = sizeof(*el);
> -
> -	return mhi_cntrl->write_sync(mhi_cntrl, &buf_info);
> +	return ret;
>  }
>  
>  void mhi_ep_ring_init(struct mhi_ep_ring *ring, enum mhi_ep_ring_type type, u32 id)
> 
> ---
> base-commit: 1e26c5e28ca5821a824e90dd359556f5e9e7b89f
> change-id: 20250328-rp_fix-d7ebc18bc3be
> 
> Best regards,
> -- 
> Sumit Kumar <quic_sumk@quicinc.com>
> 

-- 
மணிவண்ணன் சதாசிவம்

