Return-Path: <linux-arm-msm+bounces-50604-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id E216FA5605C
	for <lists+linux-arm-msm@lfdr.de>; Fri,  7 Mar 2025 06:50:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 2439C18887B0
	for <lists+linux-arm-msm@lfdr.de>; Fri,  7 Mar 2025 05:50:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 58A10194A66;
	Fri,  7 Mar 2025 05:50:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="TG8tGnGw"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com [209.85.167.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B52CD1C27
	for <linux-arm-msm@vger.kernel.org>; Fri,  7 Mar 2025 05:50:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741326643; cv=none; b=nc4jFSPrLYPfYmvNEM92eVtpyBuRuctYk/GiiIXlUzgl4LQhVVmMzK4vYvcZDAj6KjMzw/1UZF1srjs4lYhLeL6V1UyZhmKXmn2metR67jRplIDP3P7JcMqpqmlw2nFIJqdShaUICHdp5MXFYydvWtTZhxbj70EYxgRcLldpgJw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741326643; c=relaxed/simple;
	bh=PCXKIFLp/Z1c+K3aM1Oes6w/mNnO53eiL5mUb6LZxNs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=glIF7GMQM/QuXR7o2pdC5LudS5JSyExkpNpxKW6NIJBJKZoUPRNfANG8B5hSROooHTRLr3jwuhl1RUTKoM+ZUKo4FPjRWwbWuV3yjcxgrjG/+See4haQz2aywT96ltCtK445Lgl0VyIynYP1ReRHYRMfSq0cZuxuNw0TfjsDfGk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=TG8tGnGw; arc=none smtp.client-ip=209.85.167.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-54298ec925bso2249572e87.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 06 Mar 2025 21:50:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1741326640; x=1741931440; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Cklowoo6XciocBvug5xE2tihHXT/6nAX/LWrS1DCIo4=;
        b=TG8tGnGwZ7X3c5DxTlz89SGzz/m57mWDY6Yr1to0E267ZPG4V7I6rTKaeET/0Mselm
         4vJLjohmFSAJMpYi6ti6gjBrhNd+Cu/aXVHMEwHHKpvfFN6S0rPNdJ1DZXz5t+RJXYd3
         pF10ettzz0Qcd+kmQEYGO11oiY5sQrTXWbiSgj4RRETuiqe4VBRAYLLvHlFCiwpKN0pA
         w1zovlno4OoXc6V2hG0OtF2pAVUVvutzK49vjnDLjmgZEWeQboywpbG6gzFhO9bhQ7yQ
         il/ueuW8rr45+kSpOA+ANYpJhvyCQINb6gNwn9X3y/GNJCi9GXNJDCngoktrHAoBAazr
         s8gQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741326640; x=1741931440;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Cklowoo6XciocBvug5xE2tihHXT/6nAX/LWrS1DCIo4=;
        b=XS8eo6tA7Q8E6fLLlJyvUJP0t5vr9wEWX3GODxEoOO3wZO/c1xjnwgqwhnY/H66wU2
         Is5rXbUQV248a46wV8AqJlwsQ8uj411zFu3kOqpuWvHqAND4t4dlTzW07fSbTj9QxzM1
         plvNBMTyjfqPmELoBeE9LWLbsEnULIw2Gc3z/aW0dLWkWl2wu+27/uwTznd4DH3BRmYd
         FAh/7j/tElPFTfhzveAeyXQ5iaTGeRuekjPn+K3C+mODt8iuiNN/zG4oIyOkymSGcfsh
         /jQnYJ42mJKOPNETHc6Jk/UI/wSqoABLGux0inx6GKbAQP5fVvzlA7q4dARWX/ajDIiy
         knkw==
X-Forwarded-Encrypted: i=1; AJvYcCXPeWFtFD48RLDnhvt6Y/qzVxVh+NFCQS411/vkObLV4rLKIjvUUnGAtiTIt2pNqey409pFE6gd16JI9bpY@vger.kernel.org
X-Gm-Message-State: AOJu0YzzgmwKu3Lfe97KLO1BNreXyqr4xg+RO73LXsCR91CfYGrpziLC
	VBEqaVBqiAmFbpI88a4H7UndTipDWR1Mws8C/Jqyv1/igwK33Zun7lbZeuLD5ug=
X-Gm-Gg: ASbGnctCm4R2fEWFKP+pFWdAJunBqM2nDv0MXw8OwiWxNvOAqZJjFe+tVlpcHgPnUSq
	3BtKVBXOhBCX0tEpI/EhesSEQcONHBgnwgC7dEYKIgS6wVTBBJsA5OwRKiErM/3GwtjqKaZEQt1
	L6vwKjNJ9NYwgNn67kevCqHbHgQ7kNv/jlqgX26B/79eClpbHBN5k9gHe3oKyZ60wGNFTDsA9/d
	+3wjSL1qVslaHAHnrxrK8LAFM4Zwe33MRr4ee+cHvVvUqaRyFJKveRRLgF+F8Bh6512d2J1SFpl
	tk7erTHUBNB8yVuPjmSCkF7pI209SuyivIM2JBlapCzYfW2VOKp/AGj+2GuJHOYgN54ROQDvmzK
	ZPWZKZ+3LE+SkvuIhXP4TQnhd
X-Google-Smtp-Source: AGHT+IFxMJzgkc6aT8SLqY3HFH44f3uS0Pbx7E1LtfSoww8PpYJPAwYDmAvb6be7iccEdwfO0MQmLQ==
X-Received: by 2002:a05:6512:12c3:b0:549:8cc9:67b3 with SMTP id 2adb3069b0e04-549910b5d9fmr492625e87.42.1741326639884;
        Thu, 06 Mar 2025 21:50:39 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5498b1bc56asm382830e87.183.2025.03.06.21.50.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Mar 2025 21:50:39 -0800 (PST)
Date: Fri, 7 Mar 2025 07:50:37 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Konrad Dybcio <konradybcio@kernel.org>
Cc: Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>, 
	Robin Murphy <robin.murphy@arm.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>, 
	Sean Paul <sean@poorly.run>, David Airlie <airlied@gmail.com>, 
	Simona Vetter <simona@ffwll.ch>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
	Robert Foss <rfoss@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Wesley Cheng <quic_wcheng@quicinc.com>, Christian Marangi <ansuelsmth@gmail.com>, 
	Bjorn Andersson <andersson@kernel.org>, Rohit Agarwal <quic_rohiagar@quicinc.com>, 
	Kyle Deng <quic_chunkaid@quicinc.com>, Vinod Koul <vkoul@kernel.org>, 
	Marijn Suijten <marijn.suijten@somainline.org>, linux-arm-msm@vger.kernel.org, iommu@lists.linux.dev, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	freedreno@lists.freedesktop.org, Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
	linux-usb@vger.kernel.org, Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH 11/11] arm64: dts: qcom: x1e001de-devkit: Drop
 clock-names from PS8830
Message-ID: <ec272btbpxlewp2qiz42c7c77gpg476wdzx23dpv7fqoe2v5fj@53vu6jgpa7xc>
References: <20250306-topic-dt_bindings_fixups-v1-0-0c84aceb0ef9@oss.qualcomm.com>
 <20250306-topic-dt_bindings_fixups-v1-11-0c84aceb0ef9@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250306-topic-dt_bindings_fixups-v1-11-0c84aceb0ef9@oss.qualcomm.com>

On Thu, Mar 06, 2025 at 07:11:23PM +0100, Konrad Dybcio wrote:
> From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> 
> The preemptively-merged node contains a property absent from the final
> bindings. Remove it.
> 
> Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/x1e001de-devkit.dts | 3 ---
>  1 file changed, 3 deletions(-)
> 

Fixes: 019e1ee32fec ("arm64: dts: qcom: x1e001de-devkit: Enable external DP support")

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry

