Return-Path: <linux-arm-msm+bounces-43875-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id CE860A0092B
	for <lists+linux-arm-msm@lfdr.de>; Fri,  3 Jan 2025 13:22:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id ADD6D3A40D0
	for <lists+linux-arm-msm@lfdr.de>; Fri,  3 Jan 2025 12:22:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9BE181F9ED8;
	Fri,  3 Jan 2025 12:22:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ELhvf9kv"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com [209.85.167.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 967E51F9AA1
	for <linux-arm-msm@vger.kernel.org>; Fri,  3 Jan 2025 12:22:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735906925; cv=none; b=kZlDho6OqkoyQlV9fi1KCwvIjiGnxE40gysrTyrPtJrOhql25osPXAxJ3AcKf2MJ5K0vhsT+TbkeYKaEa0VI4vWqt6vWaFEl2TL+K8IB8iXPQ+smluyBWFm0LrgCjcFJtWrtkdSDkQbc87ZkEpoviREoHeg0yFWfbipf3pDFNWg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735906925; c=relaxed/simple;
	bh=O8EXrmDhtANaIfvlDnTl772IIDoJbmLJdAgbz8+k41Q=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QO/jpzyb8l4hhmcHxV5qLx/oXMIYJi8arusvomwSIPzVyvhBzDWXcT7HAPtrNiGNgOCo8a2gDZYjtqoKAekU4DMRc2lWQxZFlMf5zhKif8Rs2O4/REeG09b3V/YsPk0iGUojQHO17UinwXkmLo9glbTdSzPbUZqPYPZA2QekLew=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ELhvf9kv; arc=none smtp.client-ip=209.85.167.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-53e389d8dc7so13167297e87.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 03 Jan 2025 04:22:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1735906922; x=1736511722; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=cYsxb7BeQ7ZfzNcH7+s2mWWWWWRZcp/zu7awCW8Opwg=;
        b=ELhvf9kvrAKN3pnNGnRybRnmhVqI6roqJUxVmogsAol9y5Mp2ScsIpMOnAnKaMjzxw
         z3otfQwY5aiAF7j6hNKq4VoIB7wgmbArzgzrCnB5cR4YrcOZT35/5UXMhbrfhumTbQPk
         evq0PqGynKXSS59/aVPPeB8D/aE51/FvbrZqnSRclA0OaIkCuVBF2PqEuR+LGDZ0gyAc
         raPyBdSB6Jci+s3BkSOjaaKB63fOz0l7fekQ3Kv0/gcAgtseO8/HG0laj1m2IQzpcE9/
         uldTLAcUpi0CsvFl1OuBv5DU4xM8wy8vPAf2ii/Mmsdcbas4Yv0C7z6nSjk5Csi2yCSG
         COGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735906922; x=1736511722;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cYsxb7BeQ7ZfzNcH7+s2mWWWWWRZcp/zu7awCW8Opwg=;
        b=BbwdUuewiQzOasRqoQC4/vztFoNS4jxH64UsV7FAHy2vSrvxGrtQxy9K/qI52UL0KM
         MUPm7e+dnEXg6eWOpF9rS33LlTOFl5x7rwOsUwBC2CLYcZJ74OO/lMpx72BTsrU7f8QS
         q3+551a9j5ctN9rJ4b43gRPFuBcZtA4sOowROyQwPeu3zZCqy4pNUo1MtanAQ+HM5xiN
         LJ16XLCG924qWMhZxLEjU+8aeO+XfDgPoyzwx3VDoN5IRQLlDE5xIjaKqFnCOy3sGYEr
         bAIi2cI8O5DNucqVgVB5koupeK687xJq5QEfZaz3YO2/V6//ZlbTSXhWji/MjWTb55nx
         ZuZA==
X-Forwarded-Encrypted: i=1; AJvYcCX16wk386NhT+oDF3Qoj8OMHbxzZehfsyposrf5vzEzhlOBhfKoNVha+oSd8QX6nv/ww9RoINvSGAoh0bhg@vger.kernel.org
X-Gm-Message-State: AOJu0YyAnbbuMJoy2MXaSuEq62WaD12X0dZ+hTO4x9mp8gCNFe7kFT1S
	0tEVEFhb52uMA9jG0U9E1AerrjpQ1fo7LRF2FqrGjUkipXu/QEUz+g+ZWL2w21eZQXvSxpL9nyx
	z
X-Gm-Gg: ASbGncvb1+PSe/L6iXw6cvUuvjQdTBgysFsOcRAvm9SAsurwXSm0z1/N8WTxB7a0CdF
	Ze7LVFzl5ZNKv1a/1k5TbPftj5RYflv4y4rEV1nEAp9gewF2tVYOstyNvnHWEGWP+tcDuAodWcg
	N4RUk4aGeHX7TWBkFyiObGNrlHIzrm0mp6EWMrA5Vx2LLjGg7Rz1eX2GJnL+2zGe2NiWE6RmQhx
	HkI7s5rne3tiYXNQR7Bp3fpdlSg9qp+GvOIdq9T+sXk1ppvXNVTD99GYSyykn7+QMcKfd5Xwz9d
	DQnKOr58oHVHNoaMeSxbzMlPtNnoGCZuyt3L
X-Google-Smtp-Source: AGHT+IEkhlCStgRTYUkM2Z53ttoD7NcBvl2lyibDklVtolD0F7cE8yDUolsmvkDCrs4FxF9c6Igm9g==
X-Received: by 2002:a05:6512:3f20:b0:53d:dd02:7cc5 with SMTP id 2adb3069b0e04-54229524640mr15589362e87.7.1735906921736;
        Fri, 03 Jan 2025 04:22:01 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54223830207sm4216554e87.251.2025.01.03.04.21.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Jan 2025 04:22:00 -0800 (PST)
Date: Fri, 3 Jan 2025 14:21:58 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Zhang Heng <zhangheng@kylinos.cn>
Cc: robdclark@gmail.com, joro@8bytes.org, will@kernel.org, 
	robin.murphy@arm.com, iommu@lists.linux.dev, linux-arm-msm@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] iommu/msm: Use helper function devm_clk_get_prepared()
Message-ID: <4okyywneygbskczj3ooay3ir7p2sfwfjvyde7jaixbrht7xu36@yiqlcvrwhypl>
References: <20250103113059.463033-1-zhangheng@kylinos.cn>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250103113059.463033-1-zhangheng@kylinos.cn>

On Fri, Jan 03, 2025 at 07:30:59PM +0800, Zhang Heng wrote:
> Since commit 7ef9651e9792 ("clk: Provide new devm_clk helpers for prepared
> and enabled clocks"), devm_clk_get() and clk_prepare() can now be replaced
> by devm_clk_get_prepared() when driver prepares the clocks for the whole
> lifetime of the device. Moreover, it is no longer necessary to unprepare
> the clocks explicitly.
> 
> Signed-off-by: Zhang Heng <zhangheng@kylinos.cn>
> ---
>  drivers/iommu/msm_iommu.c | 51 +++++++++------------------------------
>  1 file changed, 11 insertions(+), 40 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry

