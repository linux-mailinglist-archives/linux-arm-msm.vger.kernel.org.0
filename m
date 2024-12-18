Return-Path: <linux-arm-msm+bounces-42660-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 992709F6487
	for <lists+linux-arm-msm@lfdr.de>; Wed, 18 Dec 2024 12:15:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id A30537A050C
	for <lists+linux-arm-msm@lfdr.de>; Wed, 18 Dec 2024 11:14:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AE6EE19CD01;
	Wed, 18 Dec 2024 11:14:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="bUW23PSp"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f178.google.com (mail-lj1-f178.google.com [209.85.208.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CAC92161310
	for <linux-arm-msm@vger.kernel.org>; Wed, 18 Dec 2024 11:14:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734520495; cv=none; b=C9bAlOXNH2eH1vh1mSijVDEVUuXi8MwpxVVVvWUMjimaQA0BVSa+CvEsmUkiZgN9zapm3a7Ano2VgbvvJpP3pOi8TeblL+rknNvF6k4p7vxeVe0fRriApmyOyG8pfVSnQyFNSxv0MMAK8+ldQg19ZBD7PQjsu3M90R8is6qYlsI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734520495; c=relaxed/simple;
	bh=Z0Y+xmKwMBhiGRxSlSSmYU0vK6v0yPXFCLdMyYi8iAU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rx/SEGrXMcnv0Af5zztI0APvfxheNZsN179rUnzQu6XiIvn+CL1Cr/xpbkSmc8pumxw8YrNrDW4jEZpatF+17NvFiB6b5VlyW86gOayn8jjArntdbAe5jJz8RU9qTuH7obmrYz/RQhPsVARbF9W1JNou8iaQWdsRu7zpIhe2WZw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=bUW23PSp; arc=none smtp.client-ip=209.85.208.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f178.google.com with SMTP id 38308e7fff4ca-30034ad2ca3so53733681fa.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 18 Dec 2024 03:14:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1734520492; x=1735125292; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=CQXGzcBLUuhgC9zgbmH7cd1iWvRUarAb5IMePyYysIc=;
        b=bUW23PSppFtMu4iagUPR6eOk0CUF0S1TVOBHYe3TQJ6jh1ONXDC2ZtCXUM4TqbmcBN
         IIyurnW0+ZgoBjz4lKIwCw+D574SU9E/qgwy5Zov4Nm5nTKB0uZub9k60DA9S2zcwdLC
         tdRSOenJhjPbHMdpFxrJUmfQaksx0vKDTbdWXEs1sVo5Xe5sfqTZD0z+nRu9CKYNNiVu
         gwf3XEq9z0UbyRlyUALG6I2JyzkbeA/VLLW+nIUs/utt6osQChDYmEd6zWGhoNqPTu2w
         hk3hJ0BAchiy1GVGyW23ymjeeJ3AK5NKaMpJKKD4kqPzI2loMRmVvav90QtXO3aSjjjf
         gdGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734520492; x=1735125292;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CQXGzcBLUuhgC9zgbmH7cd1iWvRUarAb5IMePyYysIc=;
        b=blHKk/9EZxQqvETszhtBVGpTOybB6UN+my1BeiTTvtb2rWErUXTmayl797K4PEKOf9
         l+xQ00G/ltG7u/hXI6fz3Ne9C3nWB9vDTJNTKTucsAa+/fDFr23icsc1dYslAzKEAS8P
         WxB7sAmYcN10OrTaiR4dLNcKX/o97g4LQ08OfmrJsokQOOV/ElhzEqc87JlKdhfEtL7F
         PJ9Pk9KeIhH0N6TM2No5Rfy5J674sFpKek6QhWcDzEatDK/A4dxgCyQ6iJFt/W/Q1td0
         NpVRc9xx6Jm36x1LKy6wzvNyyVQt0WrW6K7KvyY9hcWg836M5XiK72YJYz4PnwfL37iF
         vC+w==
X-Forwarded-Encrypted: i=1; AJvYcCXuW878s2QxODRF/xAYXxVJcQpV4XmWwjwZl+sTwNyyMgtWUMw8XzN+f/cVvhk2cnHStBpuYJOa8i70lZvx@vger.kernel.org
X-Gm-Message-State: AOJu0YxmbNO+WGuTXd00jJ9uGFEexcYNpsdB5qXUx6AnjxeFSOqK0auB
	Kk2Y9SpWPoInSEccb2N5IxRKvsTunLBbCh6XNllUNmZefJG2rrfqH4myXapCuG8=
X-Gm-Gg: ASbGncsY8+QM2ufOVG7V7JROajxugh2wL4wQhMTpaHDi/5FJVlOcU0wA5nLZF7BvPqG
	C9sh6xRq/ONO+hwQiyPoWsdp+wWDM6q3dPegdZaIo8V0T8lvqrIHfP9EA7K1j0odjFKcpNeA+5c
	jkq8i+otEM1VqEsfdQyLVPjIWkXv8KCrvCsPS4kbHbQ31WpVAr8yF8D3dYWYb+yrMpShQFhorat
	whtqQQFUAIpRVihak4a4cQftWRvc7+53/K4ChH5Qaifq0RP7UDG4o/txOpADVGSiJ6ycXc9CWT/
	lvKT45qBB76OQSIevFGHxwMZVeVNUqVVp3i7
X-Google-Smtp-Source: AGHT+IF35Qn0v9SRDK1fTSpGFNEC2eNTW/0l9pru1MmKVrUdfP4sXGIPiEDLn5BpGB8GYjkaJSJaaQ==
X-Received: by 2002:a05:6512:3193:b0:540:353a:5b13 with SMTP id 2adb3069b0e04-541e674d6e6mr1018964e87.22.1734520491990;
        Wed, 18 Dec 2024 03:14:51 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54120bffc8csm1414480e87.146.2024.12.18.03.14.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Dec 2024 03:14:51 -0800 (PST)
Date: Wed, 18 Dec 2024 13:14:50 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Ekansh Gupta <quic_ekangupt@quicinc.com>
Cc: srinivas.kandagatla@linaro.org, linux-arm-msm@vger.kernel.org, 
	gregkh@linuxfoundation.org, quic_bkumar@quicinc.com, linux-kernel@vger.kernel.org, 
	quic_chennak@quicinc.com, dri-devel@lists.freedesktop.org, arnd@arndb.de, 
	stable <stable@kernel.org>
Subject: Re: [PATCH v1 2/2] misc: fastrpc: Fix copy buffer page size
Message-ID: <f47spqrlkrwotgt3ibu6rn6bt4lfkrblh37yubrvsbeo6j7svl@44amfzlpor62>
References: <20241218102429.2026460-1-quic_ekangupt@quicinc.com>
 <20241218102429.2026460-3-quic_ekangupt@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241218102429.2026460-3-quic_ekangupt@quicinc.com>

On Wed, Dec 18, 2024 at 03:54:29PM +0530, Ekansh Gupta wrote:
> For non-registered buffer, fastrpc driver copies the buffer and
> pass it to the remote subsystem. There is a problem with current
> implementation of page size calculation which is not considering
> the offset in the calculation. This might lead to passing of
> improper and out-of-bounds page size which could result in
> memory issue. Calculate page start and page end using the offset
> adjusted address instead of absolute address.

Which offset?

> 
> Fixes: 02b45b47fbe8 ("misc: fastrpc: fix remote page size calculation")
> Cc: stable <stable@kernel.org>
> Signed-off-by: Ekansh Gupta <quic_ekangupt@quicinc.com>
> ---
>  drivers/misc/fastrpc.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/misc/fastrpc.c b/drivers/misc/fastrpc.c
> index cfa1546c9e3f..00154c888c45 100644
> --- a/drivers/misc/fastrpc.c
> +++ b/drivers/misc/fastrpc.c
> @@ -1019,8 +1019,8 @@ static int fastrpc_get_args(u32 kernel, struct fastrpc_invoke_ctx *ctx)
>  					(pkt_size - rlen);
>  			pages[i].addr = pages[i].addr &	PAGE_MASK;
>  
> -			pg_start = (args & PAGE_MASK) >> PAGE_SHIFT;
> -			pg_end = ((args + len - 1) & PAGE_MASK) >> PAGE_SHIFT;
> +			pg_start = (rpra[i].buf.pv & PAGE_MASK) >> PAGE_SHIFT;
> +			pg_end = ((rpra[i].buf.pv + len - 1) & PAGE_MASK) >> PAGE_SHIFT;
>  			pages[i].size = (pg_end - pg_start + 1) * PAGE_SIZE;
>  			args = args + mlen;
>  			rlen -= mlen;
> -- 
> 2.34.1
> 

-- 
With best wishes
Dmitry

