Return-Path: <linux-arm-msm+bounces-22047-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C04CE9001A7
	for <lists+linux-arm-msm@lfdr.de>; Fri,  7 Jun 2024 13:10:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 5AB49B231B5
	for <lists+linux-arm-msm@lfdr.de>; Fri,  7 Jun 2024 11:10:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9286018629A;
	Fri,  7 Jun 2024 11:09:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="dRmqhjnM"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com [209.85.167.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9FE7200A3
	for <linux-arm-msm@vger.kernel.org>; Fri,  7 Jun 2024 11:09:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717758598; cv=none; b=HKCS96q8wy83VRrrlTd4fOKvksPOVCciGN772PkbQsROX4ODXdYs4YQjqba3ZOywT93fiLpW7FEMhBXhR6pwA39Bsjpv9lV8I230eZX0V61TLRd06f/cWw40jSNfMkrCe8cim4jXIV38oAMOjs9xUVnmwT/VOeTvcqPyyb9VUjw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717758598; c=relaxed/simple;
	bh=2s+vNe+NC540niTbCBQoyezTvds9Adxb5/AvJsmRrRE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RkECY4jcXyGqlBJRVSavtwl/FjICxI97gH7ifgPqG9uR4iE8rsK+Jh1Sp43TVn8RCbe2iwKdXx83SO287Q9Vdp2L/l1sD56w++GUBicZqA4U3VG2vkcV4bNreXmpTqevlYHK7bV9IWQyubLLBlRp+hGqAF3W11vNFCzmx7ChZPU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=dRmqhjnM; arc=none smtp.client-ip=209.85.167.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-52b87e8ba1eso2716663e87.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 07 Jun 2024 04:09:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1717758595; x=1718363395; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=rHk9aGALaz9Q3JxQm1gAo8N0FIFK48iZOZz5oLhoQ/8=;
        b=dRmqhjnMjso55n2K0b3YtfuD7tfFmjP4Ptf3XTbGHZWgyZEo7ZJeeGQmlKkY16yoeP
         2ohAZyoNNSW20mK8mQ9zj9KQBnWLCbw+/fxNclbJ69IXyu3H/WWtAzzGvDbyNrkLUQQc
         yRt1rzgdEtIbegEO2i8AoTl1HOB4ti+pFhQl+0hzyPcwsHvZb351Om4PWXRCfuksowSQ
         q0hcjGLNGqwvOfdAa1ZSJAnUu5aIr/QHIxo03cXZtw5UAjoCBFE3XGfNdgOWbroRz+7p
         5ZZ5DOneDBrq/azZpbLZPRMGVETQxixEPDTG+/hV2A8cQppFjDomou8YIv9u2n7a+4u5
         Dmig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717758595; x=1718363395;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rHk9aGALaz9Q3JxQm1gAo8N0FIFK48iZOZz5oLhoQ/8=;
        b=qJ5UluY0BEXTq+NSXf2Y3G+sdQwey61jpqkFRUEB9lF0DGZfUtLzN/pjZV/emtuKjY
         Qh4KA705ZAGp1T9wZbruvIocEGYmDiJbQLNjieskmFDCnJ1qFI8fmEV8CQF8QUXdfyAh
         UfKwPKO0j7KG6KtwLhvg/dikvOcd8vpdEfx4rSWbHEaiuYMxjpSzLGov0dhSa7xuqg3n
         pTCiamWs/eHTUWLIa8UXhAq+UMYcpj641v05DPgFNOaxcLMH28cCenIJ9e5x+Ju/nXoe
         iU+lYpgAlyxcvZtvwJ3Dgh8FiTmie19+vehJ75lzMNdjqby34dMkQZHW/IGFX/JBGyqq
         tNIg==
X-Forwarded-Encrypted: i=1; AJvYcCXklb2hQ3MswT5ZPNdkp3hSegapFlqwALMMBWcve60MVwX6i53LOX/PeNEVQMZT+eb0B/zMSSiuI2g13bQvJwzU9kV+poJ/nPH000FVuA==
X-Gm-Message-State: AOJu0YwWz3u99SHQW1Cn/448woOQFV0jKBuQp3IGtddJpuqTfzj0Y7Um
	7O0TJ/8c3ggS6cYszqLs4b8aVUMsLLTdmEnOpVcGTuHXUw4q6fQykz9Qo+sDFXU=
X-Google-Smtp-Source: AGHT+IEV2XL4wfG2eJt3B8DwvhvpZOVo91wEFagblMI9qHFgbABj7r9Ludjl+CykmiLhNq9OWyd1vQ==
X-Received: by 2002:a05:6512:201a:b0:52b:851d:4db6 with SMTP id 2adb3069b0e04-52bb9f7ad1cmr1531577e87.26.1717758595074;
        Fri, 07 Jun 2024 04:09:55 -0700 (PDT)
Received: from eriador.lumag.spb.ru (dzdbxzyyyyyyyyyyyykxt-3.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::227])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-52bb41e1a23sm497630e87.56.2024.06.07.04.09.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Jun 2024 04:09:54 -0700 (PDT)
Date: Fri, 7 Jun 2024 14:09:53 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Ekansh Gupta <quic_ekangupt@quicinc.com>
Cc: srinivas.kandagatla@linaro.org, linux-arm-msm@vger.kernel.org, 
	gregkh@linuxfoundation.org, quic_bkumar@quicinc.com, linux-kernel@vger.kernel.org, 
	quic_chennak@quicinc.com, stable <stable@kernel.org>
Subject: Re: [PATCH v4 03/11] misc: fastrpc: Copy the complete capability
 structure to user
Message-ID: <trd6fbmxdxsrbxs5t4d4zwiwf2jgws23yb23dlmq2lke3ewxw6@myclylveg2gq>
References: <20240606165939.12950-1-quic_ekangupt@quicinc.com>
 <20240606165939.12950-4-quic_ekangupt@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240606165939.12950-4-quic_ekangupt@quicinc.com>

On Thu, Jun 06, 2024 at 10:29:23PM +0530, Ekansh Gupta wrote:
> User is passing capability ioctl structure(argp) to get DSP
> capabilities. This argp is copied to a local structure to get domain
> and attribute_id information. After getting the capability, only
> capability value is getting copied to user argp which will not be
> useful if the use is trying to get the capability by checking the
> capability member of fastrpc_ioctl_capability structure. Add changes
> to copy the complete capability structure so that user can get the
> capability value from the expected member of the structure.

Nit: s/Add changes to copy/Copy/


Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>


> 
> Fixes: 6c16fd8bdd40 ("misc: fastrpc: Add support to get DSP capabilities")
> Cc: stable <stable@kernel.org>
> Signed-off-by: Ekansh Gupta <quic_ekangupt@quicinc.com>
> ---
>  drivers/misc/fastrpc.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 


-- 
With best wishes
Dmitry

