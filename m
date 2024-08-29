Return-Path: <linux-arm-msm+bounces-29935-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 49AC4963F5C
	for <lists+linux-arm-msm@lfdr.de>; Thu, 29 Aug 2024 11:02:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 794391C21182
	for <lists+linux-arm-msm@lfdr.de>; Thu, 29 Aug 2024 09:02:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6B4D618C935;
	Thu, 29 Aug 2024 09:02:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="IO9zLGNq"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com [209.85.167.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1A5015666A
	for <linux-arm-msm@vger.kernel.org>; Thu, 29 Aug 2024 09:02:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724922147; cv=none; b=P6DemXOy3I7JjPJBkPPaQuvGZAroWJkIm4Y5PGUDk5Wyol01MU8SzuZQ3E4cFtyjZPaFQiTt9YerPRpQx7coxJb4GCGNU4ux+ncS0kTB0G+T4pjra4lTvUesidasnsVlbA3+RC4O0VvA39U71p7BeKdp4MJt4hVVfDOMHy2VM/A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724922147; c=relaxed/simple;
	bh=SJWHpbSUdECm28dnl4r/RzgBRh4JcSct6K0jvQuIYy4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=j4+07D457IGwnmPIXcCZrxIqBVD0R/7KWuQx1bmb6OwbNOVAKsf3GSlgyHrHRqTf2wAMfbcO5oIhZmwBsZkej/FV5tus1kPy6MAZglITx82xs9CrLbXfb+CwltPRDW3SchLRyLac9fqncHdRcZZX+x96BSiQBkIxFYMTN0USq9c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=IO9zLGNq; arc=none smtp.client-ip=209.85.167.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-5334c4cc17fso631128e87.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 29 Aug 2024 02:02:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1724922143; x=1725526943; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=5P5Ex+N4LZb6zHIhcHrVj3uRGPH7YOgGJO2m8XKmhGg=;
        b=IO9zLGNq6CFij6ASdq9vmHo7Pzx/CeeytKVj3y0V0WP2NTsGRv2SmNX5aSKlzz8ram
         R2f5fmP25DBJWnXcGjaUHQwDMlrhGkd//w3QsRchozam2XmJ3mQEiJYWBy2vS1AVLG23
         w3TQlBycqDY1T5dJsAsbLXLHKhBENRCiTf+idN7wZa54LajF3zOTG59oubS3CbyoH+Vj
         EtOezoPhJra/4lZ6G5ml/6BQGodX8+xgmpk+4kBxXqHhaGxex9fc8OqFBF0x4zF2fxiZ
         fhL+6NBciYNZvjjUGjS08bNz+MrHHAYrlj47DW0+UoCobssVQjuyHwP3a0yjkOdsJD2q
         mOpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724922143; x=1725526943;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5P5Ex+N4LZb6zHIhcHrVj3uRGPH7YOgGJO2m8XKmhGg=;
        b=QclpxsobATyI5Qsc+JXI9UzBG7gAj3417GxpJb+tZhNZYnLk8c4/p6HsdqVfzKLb1f
         j2fthUDxrzqtAR6NIq212JmoXUqIwFioUgoRYTT/TUhFsltsGhFG+TWaSyjhBsC1QV95
         90qV35/MVR5F4+z+Y/Z5xP36AztQ/sVZ5D3kwXztBjnX85O1SVzRx3/HnVt0UQOJPzCw
         wVmSPV6dEBNw5l19B57yH50HL2g5TYPdyptb4DDS+Byvf5TWzMLOgvYbKGMeuB8OpIcC
         tIa+CvSKGVRkHXDFg5yBnCftNveoTm6jZcIRWRZDowL1s6w0grc77ajXis79jjxPDTqq
         lL4A==
X-Forwarded-Encrypted: i=1; AJvYcCXwZwpGOCkS5OdZWg07w//zsKuGWt1Rh2ec7jJJAvqEEemK7ibE5Y3Lb9uPpiZ4eucyannT3OQ4qPe9C4yv@vger.kernel.org
X-Gm-Message-State: AOJu0Yz0uQ/54BObWundhF5LdIUfJ02/Qe9H6L/0jgkIPNjZ/JVCFzCH
	4lA129tfr8A6g2O8VzE8pfrd+SDT1JnmTEreDsRivJdECNfI6C8D9Tv3c3i68BU=
X-Google-Smtp-Source: AGHT+IGcMcm2044/0WGDWFbJHRAvj/BsTuOR4L9ig5/T+UOYFsPZ/6eOLoDYbc614YSbGs4frHyR7g==
X-Received: by 2002:a05:6512:10ce:b0:533:4aa1:a517 with SMTP id 2adb3069b0e04-5353e5742admr1706621e87.36.1724922142243;
        Thu, 29 Aug 2024 02:02:22 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-535408278ffsm99157e87.121.2024.08.29.02.02.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Aug 2024 02:02:21 -0700 (PDT)
Date: Thu, 29 Aug 2024 12:02:20 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Yan Zhen <yanzhen@vivo.com>
Cc: mturquette@baylibre.com, sboyd@kernel.org, andersson@kernel.org, 
	linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, 
	opensoure.kernel@vivo.com
Subject: Re: [PATCH v2] clk: qcom: Fix error checking for
 devm_clk_hw_get_clk()
Message-ID: <cpcdztpwosze4l3uhf467vorfu7jqfciglmzr4r6xcre5eci6m@pqwaadsviapv>
References: <20240826061717.2016126-1-yanzhen@vivo.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240826061717.2016126-1-yanzhen@vivo.com>

On Mon, Aug 26, 2024 at 02:17:17PM GMT, Yan Zhen wrote:
> The devm_clk_hw_get_clk() function returns error pointers.
> It never returns NULL.  Update the check accordingly.
> 
> 
> Signed-off-by: Yan Zhen <yanzhen@vivo.com>
> ---
> 
> Changes in v2:
> - Return PTR_ERR(icd[i].clk) instead of -ENOENT.
> 


Fixes: 8737ec830ee3 ("clk: qcom: common: Add interconnect clocks support")
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>


-- 
With best wishes
Dmitry

