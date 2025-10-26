Return-Path: <linux-arm-msm+bounces-78821-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id B8C84C0B0D6
	for <lists+linux-arm-msm@lfdr.de>; Sun, 26 Oct 2025 20:12:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 477B4189E383
	for <lists+linux-arm-msm@lfdr.de>; Sun, 26 Oct 2025 19:12:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 280B12FDC5D;
	Sun, 26 Oct 2025 19:11:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="TsV2NkG2"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B932252292
	for <linux-arm-msm@vger.kernel.org>; Sun, 26 Oct 2025 19:11:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761505911; cv=none; b=sGD3JqaDj239QISLeClR0IY14uDsrbcXI0rMAn9+/3nLemYdsMtB6m3SgYEfwp6Rdjp6M6dKJwGIvecLtQ3VFxMJbEjY7wr+pHfcgZ4vZduGLPVDJ+biDka062B4LsO7+TC1bJaGWorGMv9DEZkzNwQ1hekto6N2pwVc2Pyxilw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761505911; c=relaxed/simple;
	bh=+AUJLFop/NP1PqN2N9QlTcoa51Nm9Pq8GtfyWKv+TXE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QLlLho4kgd3sH+SAdDo7zPPXJLqZ5v5pL5jZV20d1/1r0461Ejc0bqH0uYd1dYGLD8vx48h2G+HwLeQ5Aah2BeZNKM+7VgHIvnem3q49SYvgbJKwj3XDq4O7mwmLUktNluxEJpgHkBKK4JuN1IHr5JdBRjPAXVaLLVzQ8EQupbc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=TsV2NkG2; arc=none smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-3ee130237a8so2519424f8f.0
        for <linux-arm-msm@vger.kernel.org>; Sun, 26 Oct 2025 12:11:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1761505907; x=1762110707; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=kxkTyzPeNmi6+toC10bTmxd1f4OEXI+mwvGXkJgCrDw=;
        b=TsV2NkG2JgebcKkWKLiKv8x2sIDNLjeEH7lumT9TjYJ/M8RARTIqMtXjEM4YLaw2rE
         89c6zzWOMCi4AMiNVQRNSuDCPXE22V9yuyXohtAq52jadFxS4Y0NleA/NCfrbLHe7eeX
         7w587XZGVC2HaCPkzgn7KC9gfoQajPnx2A4olJ3VHzqTbHRKo9L550TRULkemDNhVhJr
         yPwEOcIn3MMBeBKTFzN4Ck5dzd/aSVqhHQ9HDNpfPjIWcT5XvQrH4a5XrVOqPopqUINi
         mhemGe6rXdqNEuldbmogKrdv3+yi56aGPCg9jCu2iaLHL1HfZ+wTqXqo1UdVI8H++VWi
         CXfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761505907; x=1762110707;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kxkTyzPeNmi6+toC10bTmxd1f4OEXI+mwvGXkJgCrDw=;
        b=MDdys2raPivNemnu8rp3+B52pnsRpnt6anE/R4zD3yznedD+AamS08Gko1+qMPCIHs
         d18Q3ODecceFPcNzDYUlb4Y7PueLSZXNApk5YC6hDpK2Sztm0lE6arihEIDU/KTX7bV6
         48mvnibXwzrWCJGBn1zjpay7qnYOaj34MEFOhlQIKBpF8qTX1cRy2s+hU4ZK4NZU1OX6
         QHR9vCg3Hf7CJG2+UeP7gM43ZAl4HNJwFh8/oqlShGsjM4riLIk1etB9LSR5J293cH/A
         cYxMfle02zlBi3bASO66UMfCm0LnAJqnnpifI0r2p0WXcAhok2ZoxtYNPWtTYeULEY54
         o4zg==
X-Forwarded-Encrypted: i=1; AJvYcCUr3PO51CgHVjR1nqng6X35uDs8siZb6DSFHv9OjDIWcrluOe3/3of2ekRDYt9jSZKqosEugbWBFDsXHUaN@vger.kernel.org
X-Gm-Message-State: AOJu0YxGbVFmIY/rJ9kQcCn1djw6tE5QpcnFxVGIejjMHtrHdfpdeeHt
	ss00/EZg7QDdc+HVtM5el6eqS7+EacuTVLLM3eX4BM3AOZMirVDHo6jT+VdK7iP9kuk=
X-Gm-Gg: ASbGncsivpvdCNlU5ch/eaa8wh9D/B+IPPd5I0sjNTK7waZeOvUskH2pl6Zdc7Z0gYI
	GPGZXL9kSIc/obViQ2dDC0nmIWgylY/kmudL956HpjMsgXBNT6wKtXt1znU2edDqDq1KB2us2sG
	RXBxcvl4dQ+iJsz2d+flDYwhm+FU7bCrRHxJ7yvR3mxY+zEtFJbsSLBQbscoKZGmR3TqwJHS51v
	/tHGDVRa591r+el2HHKVV4vUZTXWiLFu0+r4fgfrjsZnXQl3LiZwJuN2ae8dZcZDDAOaSL5FMsK
	61gJP30yPIxQ7VLc1FjRpOrmyFSUPNhBr11ajiLcqDE7mpdrYVY7rMqoyXYlxrn0yA2yA6ioOJe
	1B6KcIkou0Cxukmb33oejj75yw0kSV/95NTsmWI2gZ5KmMGEfHWG8A2mec/EgzCvd88rQf74HtO
	R5dsaujak=
X-Google-Smtp-Source: AGHT+IHzexoxvDrDvl24BhwQnRe4QdBdByW9rd0vZNY8yvB8WV7YYfd9RJbflJWTepT5nb//VF+/0Q==
X-Received: by 2002:a5d:5f82:0:b0:3ea:6680:8fb5 with SMTP id ffacd0b85a97d-42990701979mr5977601f8f.2.1761505907325;
        Sun, 26 Oct 2025 12:11:47 -0700 (PDT)
Received: from linaro.org ([86.121.7.169])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-475ddd41a5esm44681245e9.5.2025.10.26.12.11.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 26 Oct 2025 12:11:45 -0700 (PDT)
Date: Sun, 26 Oct 2025 21:11:43 +0200
From: Abel Vesa <abel.vesa@linaro.org>
To: Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>
Cc: Thara Gopinath <thara.gopinath@gmail.com>, 
	Herbert Xu <herbert@gondor.apana.org.au>, "David S. Miller" <davem@davemloft.net>, 
	linux-crypto@vger.kernel.org, linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] crypto: qce: Provide dev_err_probe() status on DMA
 failure
Message-ID: <qolhxtuathf4go2wyiheptmd2u4nsg7gvlpj3jlzprkybv2hds@wp2clrvcurjo>
References: <20251024-qce-dma-err-probe-v1-1-03de2477bb5c@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251024-qce-dma-err-probe-v1-1-03de2477bb5c@oss.qualcomm.com>

On 25-10-24 14:35:07, Bjorn Andersson wrote:
> On multiple occasions the qce device have shown up in devices_deferred,
> without the explanation that this came from the failure to acquire the
> DMA channels from the associated BAM.
> 
> Use dev_err_probe() to associate this context with the failure to faster
> pinpoint the culprit when this happens in the future.
> 
> Signed-off-by: Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>

Reviewed-by: Abel Vesa <abel.vesa@linaro.org>

