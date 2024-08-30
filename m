Return-Path: <linux-arm-msm+bounces-30160-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4261D9658EA
	for <lists+linux-arm-msm@lfdr.de>; Fri, 30 Aug 2024 09:44:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id A88DBB26DD6
	for <lists+linux-arm-msm@lfdr.de>; Fri, 30 Aug 2024 07:44:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E41FB166F0D;
	Fri, 30 Aug 2024 07:42:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="yIaNXdj1"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f173.google.com (mail-lj1-f173.google.com [209.85.208.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F96B16A947
	for <linux-arm-msm@vger.kernel.org>; Fri, 30 Aug 2024 07:42:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725003750; cv=none; b=tQ7ZTP2gbPdgLpd1hEct4A3psC3cLEu4KqXj4x0/OzxFIXGlLFsZrFIjXKJxEbSftWQ0LHvnnfDAnfvVqJvwUM+GtEvGfV/ZqDBQTUSXTMOelPHS1lFWUzC7PNRHjxDqu3rh5jBjDAWi9tCg4ovNnw3czczJfj8ih0NHA8Ccksk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725003750; c=relaxed/simple;
	bh=cAvE5yFRIWBiOv7ycyzdrJ4hxw730Ffg6FwXu8x8lP0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=uxTmIq28Udl9+rIhn9drXK9GcVcwtG58V/nbkRcMz5WPDhzqR5iWuI7GoW+y6G6jqQPLdeksaPrwqSjThprL+jKoZw2jVNLyEfaeRlhzQDPpWeeuWOLuwOBBy6MmwlTItc9Z5p9iFI4VSH+fcBLsn3jWTGim7+W/vdmDab8ndPY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=yIaNXdj1; arc=none smtp.client-ip=209.85.208.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f173.google.com with SMTP id 38308e7fff4ca-2f3f163e379so24068781fa.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 30 Aug 2024 00:42:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1725003747; x=1725608547; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=1Gj6cEC3ZMBXWaI7qMCGVoLP3OYeBsgUhcL+MAyzmM4=;
        b=yIaNXdj1YZUbRqPDD8lXbXSqvU3mqqsA9dfKnqCux7afSrU7q94E8nL7tImxTk5/SR
         vwYhOkZfzCXb2aWc/MlpioR9sHZSKBF85ZgLC4ZsE5ab6dyjMZ306KNa3n53s8TlqRer
         UEQe52XfSal4P5IDkn9bZ99QVoNVX5Y+VlLZtxGJGslrYoyxQROouw1kElbrrJ98Bf80
         xEAj8NV5Lbm11en7sxg7sRPuEL5g9ztWDeLgAUF4UAsENu8+4ZbojcEqBPoky9O3kikG
         d8GyXtaPGikoPj1xfh6YC9Q8AoSeZ0jZqrWCm0dDDieKk5AkKmiFd+CZDePZmVgROq5W
         zcDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725003747; x=1725608547;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1Gj6cEC3ZMBXWaI7qMCGVoLP3OYeBsgUhcL+MAyzmM4=;
        b=GXTiOtDAlTlHKhaweP4xDHvE9KXg8zAmL4qEaUaQEiUUdc8+lzxC5UogAyqmPJIOxo
         WdjF5XaOMRIFgvGii6a59Aq0RVVNxIRboxF5xU+i0oWzA4f8oMmuVplhx4vzjMQ9/7u0
         H81xRfxbuvluS0WARlyhZK+5pib7lBG+cK3M+hq19zttxyV6wN6onY1Gr1oNwJNAMSmO
         SEd5FUMVtnJeI8FKmumhoAU5FlDNJSh1KxiueSn9fc9ym28cSe/ygIF98ZNIlrBasYfQ
         ZJwS9I1Ua+wFljVoL0kNqi+XsHD9irzoaejcXOdW+S7gcZEX8e/qwCO2cVLnrM9IOq4E
         9XDg==
X-Forwarded-Encrypted: i=1; AJvYcCVIWQVwXR37xSXZ7MoSS8X3QthNL6oIyCVepkEkQfCNhQYc16A4GK6Qmx/TGTI9YzRkLegKbon3ih67p19E@vger.kernel.org
X-Gm-Message-State: AOJu0YwTux7FRb7Y07UEgANOmv7kBou5XYHhh17Y+MAqjNks2ZPfrM9B
	lg/xRCcjcdDCCh+3feQVsLy7WCx+XAy1RC58AtsU89oF3ONv6CGQaHlybHK54P4=
X-Google-Smtp-Source: AGHT+IEzw81bh2xRm223q+buyjOAOITiTdwAwoJZDyd2Aep0W6LeSNiYRUypwNF+qHr8zX8FOHbh4w==
X-Received: by 2002:a05:651c:b0f:b0:2f3:e9fb:6d5a with SMTP id 38308e7fff4ca-2f6105d755amr51329681fa.13.1725003746710;
        Fri, 30 Aug 2024 00:42:26 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-2f614ed15f1sm5150601fa.4.2024.08.30.00.42.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Aug 2024 00:42:26 -0700 (PDT)
Date: Fri, 30 Aug 2024 10:42:24 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: Maximilian Luz <luzmaximilian@gmail.com>, 
	Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	Johan Hovold <johan+linaro@kernel.org>, Ard Biesheuvel <ardb@kernel.org>, linux-arm-msm@vger.kernel.org, 
	linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: Re: [PATCH] firmware: qcom: uefisecapp: Fix deadlock in
 qcuefi_acquire()
Message-ID: <zxs47gq4v3tbm3jircy4wudrm3guvfbwgrlsckrnwzemyinws5@osk5jfie3gc5>
References: <19829bc4-1b6f-47f7-847a-e90c25749e40@stanley.mountain>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <19829bc4-1b6f-47f7-847a-e90c25749e40@stanley.mountain>

On Thu, Aug 29, 2024 at 10:23:04PM GMT, Dan Carpenter wrote:
> If the __qcuefi pointer is not set, then in the original code, we would
> hold onto the lock.  That means that if we tried to set it later, then
> it would cause a deadlock.  Drop the lock on the error path.  That's
> what all the callers are expecting.
> 
> Fixes: 759e7a2b62eb ("firmware: Add support for Qualcomm UEFI Secure Application")
> Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
> ---
>  drivers/firmware/qcom/qcom_qseecom_uefisecapp.c | 4 ++++
>  1 file changed, 4 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>


-- 
With best wishes
Dmitry

