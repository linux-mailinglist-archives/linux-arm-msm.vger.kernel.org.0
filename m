Return-Path: <linux-arm-msm+bounces-49186-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 804A7A42927
	for <lists+linux-arm-msm@lfdr.de>; Mon, 24 Feb 2025 18:16:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1816C3B4E44
	for <lists+linux-arm-msm@lfdr.de>; Mon, 24 Feb 2025 17:07:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4621C2641E9;
	Mon, 24 Feb 2025 17:06:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ac1+xFJY"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com [209.85.167.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3132C2641CC
	for <linux-arm-msm@vger.kernel.org>; Mon, 24 Feb 2025 17:06:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740416786; cv=none; b=O5jtsLsjapZj3DhKqVoGI4QL8p5bPHwQAUaayREnQr0x5do/zuiNsIyDNYJ+9Kt+wQcvbCQbSVlV0diX8+AIYN+31rD+rlSR9cmtnakCwZ4Mpfj3xqjyUUozjS/k0UWFMQkAQSRALu3IMBSYTQsCajhLYQpMnoHKo0bD/GRqBhY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740416786; c=relaxed/simple;
	bh=yvED5J2XN1JbyB5oPdWALpBVxI60w9uI2eoMV6sBGTI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=AkSRwEMxNzrb24wbxCL+weesoRl75vkJvJIZOyyxdlDQNQfMu1FfYl/JJ5RbUmSdQjXDPuxW1ov4MXEiBSVD8tlWfC+nYu2MOtg3wTQdzX8oEWpM4gZe/HhkWxyz+UGkCv6IPXb93649mx+ff0I5oncAZCuniJ53XkEZ6tY0Evc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ac1+xFJY; arc=none smtp.client-ip=209.85.167.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-5452c29bacfso5132578e87.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 24 Feb 2025 09:06:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1740416782; x=1741021582; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=KAI2Dv3BmBIOzPpofW0T5viVb5YozbQk3DlKy+pFvjU=;
        b=ac1+xFJYJqvRiGGwpw8SFzUn8WXs8x46p2JV1qUVNAqP7iATAnoxsJWSI24D2FT45J
         ISurQeo0qRmI6HH+6Y1xnUOuJunASeP79uf8QqSbgvBvZ2EOCi/ZEsWnt96vpxz15iKZ
         +HRibIgukvIaWkBc4TBfhbCAEdzXmlSjAtWrJGAJR2OiLXolTfvunCyYi4Mhwx1UQDus
         z/mfYy9wRSRbF6BaQ3u91YPCKZxmurYmBBx4dV53G5QCu35EGdee7VlIoPsjyTefxPIK
         iZTlDUnSMTDQcuTpG2JQ80WqjXlGyIedaIZku/m2ffX2KsXCOqg0wGRDAvzDah6YWsr/
         tu4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740416782; x=1741021582;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KAI2Dv3BmBIOzPpofW0T5viVb5YozbQk3DlKy+pFvjU=;
        b=bRhCY15rMRggpjvUWQJB81Cl7ZhsE+zA6MtaTMdSZ3U7BcpqTMIc6t/chqD6/oLkT+
         jBBVOMsYGuJ60/WsbW92apYxDXzMSmWh6L44zaoiCdRhM5ytVxegSeoD0RY3SQ2Fl0GN
         yL25I3MPzng6G2PYpbbNcYt6hZ1fOwCBqnLaCOnsow0nUmngC4L8EujL2vJcwqurQjNc
         3J+qNmvoGKQMotkjegtDSnHY9E82uPJ2LF7I4IwLSDUOsOlqPQsdLNLNHMDITUpLJLoV
         i9JMZUUIgiew5tbvWVO87xWCcW83a2VzvlwphrbG7wo2L0zvaDrcrQVIeG3hFlHAbQN+
         RhnQ==
X-Forwarded-Encrypted: i=1; AJvYcCXDUHzzxkcAoxSpbCNvNDvcRW/Wuno6XPssKHQtkpy025/5seU4CVTq4vpZf/vM2Ibuc1nmllGGKr9PrXLD@vger.kernel.org
X-Gm-Message-State: AOJu0YyzRFneQBwLkkBfiVNq6mFoZ9Qg4MNYi3bEvKgk3iL0ls+QXEKW
	UJD4aNj8A/2ueI6gx8vluTFbp09d8n04juPd8rK1vbbrUctXdv0/kmxRnD3UyJA=
X-Gm-Gg: ASbGnctVwd3VnmOi3C+xtdJVdYQEFXox/BHLvECVxMcNB3ftOj/fMvEkxsrFtWMGH3a
	GvGTn1WlZM3j599FDt+fW0eGmlBkMx4COotzCsVwke9a4GdZdAcvVgm01CrHtPiYyCaoAICFo3u
	9mmGhnuh0CBuinQUQ3k/KRvTKyqFQ8hwCILPeQGK1uOKaMS9d6X6HpQXDIUDTmBgT6cK3s+wVn/
	ef6tqqksBd4bQAhLH8EKf5vvtFEFqHjzc0re/kDffJgyqAEpralHwv0FL7GbR67ibUqhRyeqZm4
	/1FmSHamgEnkfEYdIyUf+ia2SufWY3+y4Sf+pwNqrie1dg7BG+rycRrM39v0Hs15E3DkPtl3JGJ
	gtD58zw==
X-Google-Smtp-Source: AGHT+IGLfOFOqzaQJyDCTcv0MpDet3B2RRWuZ7gWh8BalbKLyn2Zcyxy6bVh1dYMVsTGa+JcYy5D2g==
X-Received: by 2002:a05:6512:31cf:b0:545:a5e:b4ef with SMTP id 2adb3069b0e04-5483913ae13mr6288350e87.16.1740416782196;
        Mon, 24 Feb 2025 09:06:22 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5452b496aafsm3110858e87.29.2025.02.24.09.06.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Feb 2025 09:06:21 -0800 (PST)
Date: Mon, 24 Feb 2025 19:06:20 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Ethan Carter Edwards <ethan@ethancedwards.com>
Cc: Markus Elfring <Markus.Elfring@web.de>, 
	Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, Liam Girdwood <lgirdwood@gmail.com>, 
	Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
	linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-hardening@vger.kernel.org
Subject: Re: [PATCH] ASoC: q6dsp: q6apm: replace kzalloc() with kcalloc() in
 q6apm_map_memory_regions()
Message-ID: <taqe76gyodbrbp3qxvzhgmhdaae5jrun66wtlrq5jeklonp2sh@ujmwaxdhjxcc>
References: <20250222-q6apm-kcalloc-v1-1-6f09dae6c31c@ethancedwards.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250222-q6apm-kcalloc-v1-1-6f09dae6c31c@ethancedwards.com>

On Sat, Feb 22, 2025 at 02:55:20PM -0500, Ethan Carter Edwards wrote:
> We are trying to get rid of all multiplications from allocation
> functions to prevent integer overflows[1]. Here the multiplication is
> obviously safe, but using kcalloc() is more appropriate and improves
> readability. This patch has no effect on runtime behavior.
> 
> Link: https://github.com/KSPP/linux/issues/162 [1]
> Link: https://www.kernel.org/doc/html/next/process/deprecated.html#open-coded-arithmetic-in-allocator-arguments
> 
> Signed-off-by: Ethan Carter Edwards <ethan@ethancedwards.com>
> ---
>  sound/soc/qcom/qdsp6/q6apm.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry

