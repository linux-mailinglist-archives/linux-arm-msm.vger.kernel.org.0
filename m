Return-Path: <linux-arm-msm+bounces-40222-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DFB89E3887
	for <lists+linux-arm-msm@lfdr.de>; Wed,  4 Dec 2024 12:15:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id CA18EB39C15
	for <lists+linux-arm-msm@lfdr.de>; Wed,  4 Dec 2024 11:11:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AF1F81B4128;
	Wed,  4 Dec 2024 11:10:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Eo6o3eCW"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f179.google.com (mail-lj1-f179.google.com [209.85.208.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE5551B395B
	for <linux-arm-msm@vger.kernel.org>; Wed,  4 Dec 2024 11:09:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733310601; cv=none; b=Ht/1WAulh661gdRlGTjuIU4d3raAWXVEFVCIsuwtKYQiftCTbbkR3c06erno2f2pSuDRcV6R2JSPum00vKlk1ZNIwqRT90XaCI2ziKdOmrKJdOXNkhj8Bv8fgwTJHwp9dZzxztja67IeN2b+GxwliTw+KjccZf1PQlEs9w1Oqq0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733310601; c=relaxed/simple;
	bh=5na65Rr2ZBuv2qk9oz23hGN0UByp9n3wkKc0ZvHdZTQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Ficz1YcuJPTncXLrLPUO+218dGhFGNo/EdHHI9gmKn1Q/7bAGUzN71/LAogj9/dA/hoSWTMT2VxzTvfioX7lmTajvV6Qa5ZgQCIeKMr5862r8O7tnWeY9EacSoUCh1rV0Hi9fWXgWoirOTIm9E4cffYByZAWYRSMaoGXIx0ZUuk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Eo6o3eCW; arc=none smtp.client-ip=209.85.208.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f179.google.com with SMTP id 38308e7fff4ca-2ffc81cee68so67457121fa.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 04 Dec 2024 03:09:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1733310598; x=1733915398; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=qmvDv+aJXodq+mhX0D5y6kJ1JtvDvnKdqZyOWQy8lzc=;
        b=Eo6o3eCW4ss9k45ks2jdxeTq/yyrgFLRsUpH0CxfgTn0CYp0NS+XRrdQPRob+5QZBS
         A3WtVWCmIOFxmuaOoF0gKwggYUgJbdulA//PTHcr7Nn1TOZ7yby0uezNgZ4asCaJcqn9
         H8C8htoimzgedp6Tc1MlelJSnxH9UuTFhJ6Nz+k92axq4CPasAWQiDvtZ+M9NfgYV4v1
         IhX7+ehGeVeeMxS0bolxRIFowGjgRxj4sIBpIHgydcgTv6ahkyDCKLNL7Nwlbf9DeIfV
         cLeMHUcB7AugqdAwWvq3nvjj6Xs/BrHmszpD+zfOe/3STyk1GmAKVJp/XYRLHKrcuXqU
         HdfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733310598; x=1733915398;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qmvDv+aJXodq+mhX0D5y6kJ1JtvDvnKdqZyOWQy8lzc=;
        b=JKrwyAq3jUUNUmOTTHEPDP2vPVEPw90CpOjxbc+6dlsgw2/JkPahs0q0bzyTvz4wWG
         JUtg+hjq8jsjMCo2CyX+Ny7NVM+R2cGqUJ1RzwFq+7p0ZYGutmQA3BeFgff4NKAPbZ9n
         15CunGvLstJGF4Dd8NyqTzkOFwXtJoTbHkHauN/xuu7RIM7qclM1dOmrz4j5XrobUo39
         /1uwmnbXi6ZbEKPCh3Q5LGQqpTdIvBAMhlMbI0CaWzqsJJGfxOE308nXw0PyQiZhGF25
         3hruknhMCu2xFlVPuAh6rf+Nuha9mT/tfgoDmFxlorRpq2s7F357ETDafHxQuTQMD7is
         x50w==
X-Forwarded-Encrypted: i=1; AJvYcCWTN87mbtarIsrdejcF/fsYUV+Ez4bAh6QvTG7G4B4EpcxAWPmyDc7ezT5CY2St5xzWqHr/SaIpWlRyDAOS@vger.kernel.org
X-Gm-Message-State: AOJu0YzNbQkrEsaryTrBCYxO+kUwqZZah+cJYaJtph1bTnXEXodWDjE0
	Wfm8Zt2xUwZWIJVki4kC/ZBIASBIN1cmHVvzx3bYPDL/kh55YboaWGp6F8eT+RI=
X-Gm-Gg: ASbGnctNZk8X2YpS0aNE9Z5e6TuaOvqIPBnLIAKeg/2O181X/rX9o55pXMG0H7l29dg
	DZB3/VJbr2weFN2JWqWXl9ZN+qL1miHFpCDhyy5BUvImYQ1+TWMYUqnqPnKM0/OK3ubCU9jjnhU
	8hxwt5pOZKthZPk1aaOfjJeSpaF2mP2dPfKRYoqrlnGxDrwv1Bp94P3np6HnKjNog/2T3K3kK+I
	6pGqvNExSccn8C6wo90u4fW1ohZ8MtJNEngP2aeDKFRyBx8OnbsorcJIPYhWBo4nW0fr5HJkT5D
	Yg1LvwioJvU7yWXsqW89+DnlEITSDg==
X-Google-Smtp-Source: AGHT+IFyqI3egCOEc9OzhfUKK2S/yE8XPBtr9AUCyqUOlyCRKeSwjfIHLpWDvtQ93zwWyBHTRLlv9g==
X-Received: by 2002:a05:651c:b1f:b0:2ff:d81f:2d34 with SMTP id 38308e7fff4ca-30009c0de15mr41820741fa.8.1733310597934;
        Wed, 04 Dec 2024 03:09:57 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-2ffdfca12b8sm19252051fa.99.2024.12.04.03.09.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Dec 2024 03:09:56 -0800 (PST)
Date: Wed, 4 Dec 2024 13:09:54 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Neil Armstrong <neil.armstrong@linaro.org>
Cc: Rob Clark <robdclark@gmail.com>, 
	Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
	Marijn Suijten <marijn.suijten@somainline.org>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Robert Foss <rfoss@kernel.org>, linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	freedreno@lists.freedesktop.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: display: msm: sm8350-mdss: document the
 third interconnect path
Message-ID: <e2ldpjkymkqz7twlhfthba3datrdunacay23znikdregd5p5mb@vwzpwhushgmw>
References: <20241204-topic-misc-sm8350-mdss-bindings-fix-v1-1-aa492a306bdb@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241204-topic-misc-sm8350-mdss-bindings-fix-v1-1-aa492a306bdb@linaro.org>

On Wed, Dec 04, 2024 at 11:36:37AM +0100, Neil Armstrong wrote:
> Document the missing third "cpu-cfg" interconnect path for the MDSS hardware
> found on the Qualcomm SM8350 platform.
> 
> This fixes:
> display-subsystem@ae00000: interconnects: [[121, 7, 0, 77, 1, 0], [121, 8, 0, 77, 1, 0], [78, 2, 3, 79, 16, 3]] is too long
> 	from schema $id: http://devicetree.org/schemas/display/msm/qcom,sm8350-mdss.yaml#
> display-subsystem@ae00000: interconnect-names: ['mdp0-mem', 'mdp1-mem', 'cpu-cfg'] is too long
> 	from schema $id: http://devicetree.org/schemas/display/msm/qcom,sm8350-mdss.yaml#
> 
> Fixes: 430e11f42bff ("dt-bindings: display: msm: Add qcom, sm8350-mdss binding")
> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
> ---
>  Documentation/devicetree/bindings/display/msm/qcom,sm8350-mdss.yaml | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry

