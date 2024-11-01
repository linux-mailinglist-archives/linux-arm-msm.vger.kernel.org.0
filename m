Return-Path: <linux-arm-msm+bounces-36688-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 179FD9B8C59
	for <lists+linux-arm-msm@lfdr.de>; Fri,  1 Nov 2024 08:50:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 829C81F2228A
	for <lists+linux-arm-msm@lfdr.de>; Fri,  1 Nov 2024 07:50:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DCA1214AD20;
	Fri,  1 Nov 2024 07:50:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="TQ68W6cf"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f172.google.com (mail-lj1-f172.google.com [209.85.208.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7CD361FF2
	for <linux-arm-msm@vger.kernel.org>; Fri,  1 Nov 2024 07:50:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730447448; cv=none; b=F/YMJ0aGtjZ1iZlTjpyuE+HFZ7rIM4VfJrpAUAfaqDTORpZ8tEbeui0LZ1Ot4ePUXa4abGYzJRGLOHJzEVEqhVxrVWqVHZ3ezc4i2XIFMVUNRj4T4MoGL3XN6ol5/HGuAtaOznQNLLtD5FbRoNvgffblsX/hKSxXFmYlsuuKZY4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730447448; c=relaxed/simple;
	bh=IHPKXViuasdAnef90Ej3ekJWbONRaP9LTRdF74lt3ho=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rWe0W1mT+voV2VbDBNnX2EvKUt8dut6uMW7iJDAW+nliCT74cYvfYbrBzYKpFY/Rzek4nvsmYJo5mnv4fjywrBFD/phV6SS/WFRkR1NTVNhdIMQN9RtPUvfUtGDkh7dQ1UytcEApSg3dqT8KZtRkEnnUm4DZZP/MlWy4jf+lqfo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=TQ68W6cf; arc=none smtp.client-ip=209.85.208.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f172.google.com with SMTP id 38308e7fff4ca-2fb4af0b6beso27712811fa.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 01 Nov 2024 00:50:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1730447445; x=1731052245; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=hSsxsI/CZSnK3/q+aruvtqwxBEMmbI5p0pQaY2AQp0k=;
        b=TQ68W6cfuBeejEpWqv/nzx287zBaBURMdehFl0PJyZ57zeuNiYcGTYSOa40PWHTrcS
         7BbzRpqiA/kbWDopDwVftshdj/jVClAgY+ZYDSvd+Z0rZWUH2fIXQOK2Fuk0OeSs9Yfy
         0nBdbd/LN7fnXMX6/RrCO2giOOBfNOh1tb0JmhOQnFwOoch6Fmv/Ev3Vmrgpn2hsBVa7
         YEhIzvVoJPPSJUxUuR+p8JDqgNwH/KyfiRurAXhfQtRAipVEJJ5wpFeqyIMiSlr7H3oq
         GxJ3Ab4TCfjzI1cjQrikBzXx/E9Z4g1g7SQJryT3GmHM0VfHzgSVF7Y1s3Wf5aAtCG6O
         xEgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730447445; x=1731052245;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hSsxsI/CZSnK3/q+aruvtqwxBEMmbI5p0pQaY2AQp0k=;
        b=L5yKV5mY2xlXmAXJybhSh0hpBEaVR0ynJe03MWqq5FsUokkKf/Dz76aJvoZcrbWkQT
         FqbRxZgYHHv5hJU4VXShcmKcKly4Jv3zjtpYxs518sW8D+70e6nL7gUP6jTIY3eQbhZ0
         h1+3/xtpHJPmrXG5bPLRdDaEriXzcff+K57Q5byOJutL7BJNLd1DF2lJl+6OupMRXNs9
         GqpKb9wajnYXOLYUtp69NniKvd93EwtleVBCWY+GL1BIEny4u27hLMugH0MSXVrJJRHM
         9MgNrLvZzcniGJkk6lQVVB2cklU+embdSiPLz/hy3WlNR7hBURCPvkq0fhdUnjVJ8tKb
         rEgw==
X-Forwarded-Encrypted: i=1; AJvYcCVJLRhaOcx+CdCWeKTU3OCVB57GIueASUhgEgUSpZtT+F+K1txEPtH5U/mhG9M05hIpbe/AO5qStZLy6ita@vger.kernel.org
X-Gm-Message-State: AOJu0YzaBfToszMA2kZyf7MUOOpFIu8j9QxOibJhGzvaByzNOAx2xeL0
	1/xgihDRKOpbrMNg96QuMYkVWpAdRdokTGyREN/07R/DyOj9amC2nhOgVi9KYY0=
X-Google-Smtp-Source: AGHT+IHAS25AvG/LpQk5ee1X6rpAdLY/HsFI+VOFJOIWGgnPbv+z9xuMoaPICWlErV+bSQ2bJdx9ew==
X-Received: by 2002:a05:651c:1148:b0:2fb:61c0:137 with SMTP id 38308e7fff4ca-2fedb82fc8fmr26609311fa.40.1730447444989;
        Fri, 01 Nov 2024 00:50:44 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-2fdef8c3e76sm4872071fa.119.2024.11.01.00.50.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 01 Nov 2024 00:50:43 -0700 (PDT)
Date: Fri, 1 Nov 2024 09:50:41 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Alexey Klimov <alexey.klimov@linaro.org>
Cc: linux-sound@vger.kernel.org, srinivas.kandagatla@linaro.org, 
	broonie@kernel.org, lgirdwood@gmail.com, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, andersson@kernel.org, konradybcio@kernel.org, perex@perex.cz, 
	tiwai@suse.com, linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
	krzysztof.kozlowski@linaro.org, caleb.connolly@linaro.org, linux-kernel@vger.kernel.org, 
	a39.skl@gmail.com
Subject: Re: [PATCH v4 3/5] arm64: dts: qcom: sm6115: add LPASS LPI pin
 controller
Message-ID: <ke6n7ljt4wzmugoxbuvoajfsdr2z7bwyl3f6l3cyoifgxk52r7@ls3pb6qwkejv>
References: <20241101005925.186696-1-alexey.klimov@linaro.org>
 <20241101005925.186696-4-alexey.klimov@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241101005925.186696-4-alexey.klimov@linaro.org>

On Fri, Nov 01, 2024 at 12:59:23AM +0000, Alexey Klimov wrote:
> Add the Low Power Audio SubSystem Low Power Island (LPASS LPI) pin
> controller device node required for audio subsystem on Qualcomm
> QRB4210 RB2.
> 
> Cc: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
> Signed-off-by: Alexey Klimov <alexey.klimov@linaro.org>
> ---
>  arch/arm64/boot/dts/qcom/sm6115.dtsi | 15 +++++++++++++++
>  1 file changed, 15 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry

