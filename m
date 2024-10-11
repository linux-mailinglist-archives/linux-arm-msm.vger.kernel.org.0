Return-Path: <linux-arm-msm+bounces-34099-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id BEFF599A523
	for <lists+linux-arm-msm@lfdr.de>; Fri, 11 Oct 2024 15:35:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 328D1B22F36
	for <lists+linux-arm-msm@lfdr.de>; Fri, 11 Oct 2024 13:35:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8B4CF21859C;
	Fri, 11 Oct 2024 13:35:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="DB2JkzZd"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com [209.85.167.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1D6D1D52B
	for <linux-arm-msm@vger.kernel.org>; Fri, 11 Oct 2024 13:35:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728653722; cv=none; b=ObVK011EarS2Dvp+4s/n3BNSDm9Gg2VBI2uOi5DAazFFL3Cse+zdriOnmMZ6wlUJBVnfoDqS518gg27KD4ZFf1cYtVS06j63jOSO2oNbE00zAKNp3+CO38Z74BRemqP6zLcVsSpwCcJFptgC2/jB7+fheHEEauBgKYJ2nIEGjtY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728653722; c=relaxed/simple;
	bh=EkTcLG59Q4Wh5ZIKc7+7wJm7NcDhqPA7VwUd8kbAgfo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GdwHCjOMS4YD62x7UGqLIi0dMGEundt/t5e9kaHWmzy8aEiVyxcOPYRNFLYjIRPhNJcfR42CiJdCZGFkNKTDVV8Ecy74OVBdwt7ZWc3Buf+oQCfRdfKdimeZ5G7zSdpKqscJO5fsEYaL45y6Jx4rUCULNOtcgVZgeT8C0jVVL+A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=DB2JkzZd; arc=none smtp.client-ip=209.85.167.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-5398e33155fso2510253e87.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 11 Oct 2024 06:35:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1728653719; x=1729258519; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=rG8zqMbqmQKD8FKQihMwNmSsjclOXl8It6tFFfw1Ars=;
        b=DB2JkzZdoJwYGNR7bhYjbfgwl5Jzg9gVz7M9558B3VVCeita6va1Pv8cJtmS9UnELC
         B35RbJzg1s7mnZBdhoBqBgnD378t5AcWj9hOB265yW2Z8pt6kRwh43BZo2/c4eGOYfHF
         XVUa5WvsK39TQTylgq+rtatOymnL1fb5cXTUjvlbyxS0x/pPf3oaR0L477gGMVHbr0+o
         4kQ3vA2q84WhnusFV81hgaeEQdgZoImI1UKYLNY64xtidoo1iY+RKvd+FfNGqPudEvZ6
         LBYRgoWBfjG+89giTjcT5BZCFwRuSXe6oh5v7Ila9ToUw4CeqQd7Si/U1CSdpRf/Wf5W
         xuNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728653719; x=1729258519;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rG8zqMbqmQKD8FKQihMwNmSsjclOXl8It6tFFfw1Ars=;
        b=iiuzw5EI+P0i3C8kngnt5CeDmqvfTmac4G4fJ8bxZGve+ftI4iYkxKw3nlXcCvIVP+
         HKdlCY+821ijY/3msGUDiPu5Sg09U7L1zt2LkisW+0xyOCGk54iwXg/haz/hjgddmQ3u
         +i8Ch+4OnvSzyX83O34VcTw1p9aGOWkEqZiCk3MijW0cxQvckWvQwD15LUoA5Ai3MsmQ
         0j1e9q7UokgPnuyd7AyJ6/j0v7lVyLBegxcAQYGi+iOPajSDQmCCFYlwOqk+nP/fsUal
         xvTlsy7DNWF8OkGtJWJefa1B/5Xh8TOEBo7AsnQRA6bM63Mvlp0+U9AO5vwqVO7bst92
         gbSA==
X-Forwarded-Encrypted: i=1; AJvYcCX9piWIGoEWjiB6rnRPKqyuSGe5JfQw+N7eaxMlmvMBNCmEbwSfGVLWWoK/KAYAjCS0npPE2JG4ebMjcS1j@vger.kernel.org
X-Gm-Message-State: AOJu0YzjBT76wLayLOdylMsgac300WIByK95VJgiXQllKyTNy2Tm41CT
	9c8jhmYkPqRkO4UOq4Lr+GOcIYqYygwADvaIFNBAq49p/gXNpI8YtzSTZsv7RbA=
X-Google-Smtp-Source: AGHT+IHQpz/6GvIvHaMf1u3ffEGjPUPDO5ESVhqpSrZKzBqsenT6o2iZkgVDJ/mHkWrrUbIg88qi+Q==
X-Received: by 2002:a05:6512:3e2a:b0:52f:1ef:bafe with SMTP id 2adb3069b0e04-539da3d0e40mr1403776e87.22.1728653718909;
        Fri, 11 Oct 2024 06:35:18 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-539e3190932sm69337e87.174.2024.10.11.06.35.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Oct 2024 06:35:17 -0700 (PDT)
Date: Fri, 11 Oct 2024 16:35:15 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Bjorn Andersson <andersson@kernel.org>, 
	Mathieu Poirier <mathieu.poirier@linaro.org>, linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH 06/10] remoteproc: qcom_q6v5_mss: Simplify with
 dev_err_probe()
Message-ID: <ihown6evv2vnlyaiffjuetpw5p3mzcgsg3cuy2npnk3s3atjm4@3lsk2s5kz2yd>
References: <20241011-remote-proc-dev-err-probe-v1-0-5abb4fc61eca@linaro.org>
 <20241011-remote-proc-dev-err-probe-v1-6-5abb4fc61eca@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241011-remote-proc-dev-err-probe-v1-6-5abb4fc61eca@linaro.org>

On Fri, Oct 11, 2024 at 03:09:14PM +0200, Krzysztof Kozlowski wrote:
> Use dev_err_probe() to make error and defer code handling simpler.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
>  drivers/remoteproc/qcom_q6v5_mss.c | 24 ++++++++----------------
>  1 file changed, 8 insertions(+), 16 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry

