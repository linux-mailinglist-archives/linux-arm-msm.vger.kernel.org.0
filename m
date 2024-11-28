Return-Path: <linux-arm-msm+bounces-39454-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A5A19DB8AF
	for <lists+linux-arm-msm@lfdr.de>; Thu, 28 Nov 2024 14:30:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 404B7280291
	for <lists+linux-arm-msm@lfdr.de>; Thu, 28 Nov 2024 13:30:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 317C21A00FE;
	Thu, 28 Nov 2024 13:30:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="feihFoWl"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com [209.85.167.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6344A1A29A
	for <linux-arm-msm@vger.kernel.org>; Thu, 28 Nov 2024 13:30:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732800618; cv=none; b=a9a6abJ4lKun92Sp4ForcGekWy2f5fmLbjAi78uc/FI0RLdRIypT+sTMCY4tVI4vY+hU9RK+5e5w0x6X/yeg8tyWtRHzXsRXJbPNEf80PkPY2fk4LSROBOsC5HeLqF4AVY3ynW7gC4gMe7R0JFh5W0z6iaBSALAbe4sJs2x7JX0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732800618; c=relaxed/simple;
	bh=UkRWDGIYcosnptVfDrpixA3gL5nnTPr9/n7pCEn4IMk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=S+f1u++93vIVC6Y/4IdWZh3P1+RfnCEhtrmMlVGgUU2Mn7aa17mQFPhMc59R7UNy/cgXYzjF8VEYo1J6iDgQuxfmrfbTTQXxaJTqWtDEeTFLqX6JvY9LScfiBtm307Kcc6BwFuN4M/tEsV/auQMa8CN9ItYky2oXLZQXLn6uV4U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=feihFoWl; arc=none smtp.client-ip=209.85.167.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-53de880c77eso966040e87.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 28 Nov 2024 05:30:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1732800614; x=1733405414; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=yCjaLIoqKd3bBOokmeosaZwBTg8Xdv4t4ZzkEjKsEdE=;
        b=feihFoWlkZbvHRGyaB4V5GHjqP5rN4T7mfQ6Fo6CKLHbCNqmVomK7fNKtiCJNlTMb8
         ajuEE9E+j2dvsLgLtlu/8ErSOk+tx96/qe+j2NmCDN1dCH/P9KZJFEfW9IjMegnUouX+
         oA0gFb0SxtMIBSsV6Xjkvf3/GYRvhDhjCPWp+1oxH3PQExAQ1c/A8EdtePVeopsfKRTz
         LBEktSyLFsqbbuedL2mqGbCTbJnKRZNeAEfUNkzZllLK6cxvLMfPq21DnUdMBtM7bRjr
         lJ7lNLsPZE+jmvg7UpZYIQLJalD4WU/eBA8eoquIVJksL5cQaSg7BzlSuG/WuWR5rEcA
         PywQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732800614; x=1733405414;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yCjaLIoqKd3bBOokmeosaZwBTg8Xdv4t4ZzkEjKsEdE=;
        b=AeT/G4dQKgcsII8xpceftwhAG4Ix3qaHucZR7ZcLgp5113c7NuDQk0RNCiiA16iWx+
         O+x/lzRUS3EQMQiNSbXGNDm6MJP8rsMShx5UViYegZuwd/jGEKnNyynr/i/5uLU+SX42
         NJ3/E6dWJP5g2tXoMkYLMBXhtraHT+QicwqpPeBB3YwdeEyhNsc1DSvRvvj4wyGGHIv7
         hQZVwSkk7JdI9HzogkhkaYZT0n8iZqnzmPgQUzomf9dOoXClkIDwoKR2YP+gGxRtHgt6
         hsEz3n7B9uth2D1IvM5fSdVnGy8uUb4mzjg53hKxcrMk1SMuDD3q6VhjLHeUx+M0o27B
         sUKg==
X-Forwarded-Encrypted: i=1; AJvYcCVijVYeM/jVEGvGjBU1VHtjbi8EpOmu/Mt5Appx7fs2L2PI4nwpP/Xtp5kbSFe1p1o7s7B733DWkQ/6Zg2T@vger.kernel.org
X-Gm-Message-State: AOJu0Yz1CK4h7yqzMrjw3AMubpilySOkNnHXopbHnRbCt/Kp9F4biDn8
	ViwFqFRfmOuw3d9u86z0KVp+VSEtvaQFrpdOCbkCxYehTVqrf0YyQTurYY2c4gM=
X-Gm-Gg: ASbGncslVXHct7WTOckktpEuAjMCqnuI5YINz36lFBUDQJlZ3VEpb+G283hUKI17Ktl
	Ub6rluPAQDFxQVS/g/a2p9y/h8deQEZ5ipPcs+WHMje2KK8w5ZPX2oUmzASPmVvH0LvA+jbMTE6
	rAEngvxQT5HKCsG6cZGVIoP+c6PRDHMBWvVV5UbGoLYlLx0tqo82R/JDOm4ZKmTyNOhxd/JPZc+
	mwDauaJ2nTbsbrknJmEoYraeMQIhdP3xlKkzrB1tMmseDh9fCs8m/SY2xU4AE14w7gTOZy1SV/w
	eKYGtfkQ2Og0li9N2NPN0ebZZUUm7w==
X-Google-Smtp-Source: AGHT+IExPmce5P4ZT632z2IC0da+T/+lWJvFnMY6sShZcO7cz0kH9x97oQAlFQTrdXw86Rylra8OBQ==
X-Received: by 2002:a05:6512:238a:b0:53d:cb7e:2251 with SMTP id 2adb3069b0e04-53df010471fmr3419369e87.36.1732800614564;
        Thu, 28 Nov 2024 05:30:14 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-53df64310d2sm178615e87.48.2024.11.28.05.30.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 Nov 2024 05:30:13 -0800 (PST)
Date: Thu, 28 Nov 2024 15:30:10 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Neil Armstrong <neil.armstrong@linaro.org>
Cc: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>, 
	Konrad Dybcio <konradybcio@kernel.org>, Abhinav Kumar <quic_abhinavk@quicinc.com>, 
	Marijn Suijten <marijn.suijten@somainline.org>, David Airlie <airlied@gmail.com>, 
	Simona Vetter <simona@ffwll.ch>, Bjorn Andersson <andersson@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Akhil P Oommen <quic_akhilpo@quicinc.com>, 
	linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH v3 5/7] drm/msm: adreno: enable GMU bandwidth for A740
 and A750
Message-ID: <lseuso7qmbgtt36jrpzipip2e5m6r4wbi4ixxss5mi6ssi3thx@dzt5tlsjbyu7>
References: <20241128-topic-sm8x50-gpu-bw-vote-v3-0-81d60c10fb73@linaro.org>
 <20241128-topic-sm8x50-gpu-bw-vote-v3-5-81d60c10fb73@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241128-topic-sm8x50-gpu-bw-vote-v3-5-81d60c10fb73@linaro.org>

On Thu, Nov 28, 2024 at 11:25:45AM +0100, Neil Armstrong wrote:
> Now all the DDR bandwidth voting via the GPU Management Unit (GMU)
> is in place, declare the Bus Control Modules (BCMs) and the
> corresponding parameters in the GPU info struct and add the
> GMU_BW_VOTE feature bit to enable it.
> 
> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
> ---
>  drivers/gpu/drm/msm/adreno/a6xx_catalog.c | 22 ++++++++++++++++++++++
>  1 file changed, 22 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry

