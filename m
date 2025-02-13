Return-Path: <linux-arm-msm+bounces-47931-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id C7776A34B33
	for <lists+linux-arm-msm@lfdr.de>; Thu, 13 Feb 2025 18:05:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 1AC661882EBD
	for <lists+linux-arm-msm@lfdr.de>; Thu, 13 Feb 2025 16:57:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2A1F828A2AF;
	Thu, 13 Feb 2025 16:57:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="KtZ4c/5m"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f176.google.com (mail-lj1-f176.google.com [209.85.208.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6849228A2B2
	for <linux-arm-msm@vger.kernel.org>; Thu, 13 Feb 2025 16:57:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739465862; cv=none; b=iQTshIK1u4Ir71RsS59xjJ7rnZzyAmf3RsDWOSDFZ++LRPNEIRRJid2ZyRdrM2Ollqzm7GqP5Bmm7tjwrLfwva2lxdRSa8wR8cKZ4dFbBAJ5UnwhkO6Or/5Se/f2XDNLDgyiepedrVA9CyOz4msfFUuKSeeTxlvWji4Z3/quYc8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739465862; c=relaxed/simple;
	bh=NbnxWrMS7KgynfdJrNOB8JKZBra1lv3mAs7164xHJsU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=iBmVGtgF6YfDJ29ynp456hruuOP4S93M8SmIxfwsIuxHARD7LcrELuFnKnZwnQG1KOD9jF3Cs8eH3gpLvtESTBFKu6kHyPBBR+favu5v1DEfjbDcZ1BsrS3xit4l+iLnvftWuF7xV4R2849+R76BbtQAV8BBDgX4hTkFSnd8MTQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=KtZ4c/5m; arc=none smtp.client-ip=209.85.208.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f176.google.com with SMTP id 38308e7fff4ca-30918c29da2so3491661fa.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 13 Feb 2025 08:57:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1739465858; x=1740070658; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=6DncLcX9aKkMb7TYzbSn7LrwA/nLBwK9XSdK3BMFQDQ=;
        b=KtZ4c/5mB5TzWqAfANcHl3GFT0I3m/civvODy2724FMnqN5QpNiAfZnqRWe6xga7DB
         hY099syvBJkq6bsfEXStGBp5nAfNX+U3stQWa4EgHh6dFDrQm3orJYRGW47OBs+4Yt/X
         vHu2zMwRWUNQ8uphK/v/xOI8YHe1JE+mSQZLkgFN+XbKZWVyMWO2fHhUcCSVmBmi+2WW
         i4XTBq934R+adNxZKG2TQF/CoJmr2BgHC3t9AzCu89mFSH+DxODJHP73Tlc1WwgpaVek
         4lAPFZXfqYdqFPnX+3d7UlqFrBeych40n68X2VVYkMkR5n5gh77kAdU18p+iTF4I4VHV
         0wJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739465858; x=1740070658;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6DncLcX9aKkMb7TYzbSn7LrwA/nLBwK9XSdK3BMFQDQ=;
        b=knOq3L1xSqeuVjmkkay5JbC6ABlPnxLvRtAYXO5vZkpFGwmXbEpXU/t86SX6HqUgfS
         P0ZbAGNPf65xrbcdH+xxU0QiUKEGYiLbgG/GDOLbqwrQd6KYFYjx+3XLCMKUBeuqB+sD
         1nV7SkYndF7kjtU6JxkYOJJ4ia+PMP949wT9XH1vBMHzOKPVONGxUnXVFeDWZAUicKxT
         gg68EjaeRpsv/U4M1xOQBnfJixPkS+MlBrIZSEKX5wfiUPoJ5ah1lTOSQmqekrVk5+Ak
         Jf902g1ER9FfJft+TzjBqurC3oBUsKeZ8PDiLwvozA+5lA0hNiq3JpcMTyAbjx/4JtPr
         zLIA==
X-Forwarded-Encrypted: i=1; AJvYcCVyxoVsQPSuWK1Ihvva/MPcUWByQ+9Av8jg/caPzx/S2Wfu+j1ZUhI44vlXxvJKn0s+8Kfvk/YIlYJvUbim@vger.kernel.org
X-Gm-Message-State: AOJu0YyZnqNeTIwXS+Q2nvRJbKjnZTn+UjnYiVeDpaV14wqkQenXOl1o
	OA0FXD0y+YMuFbG/hMFz32uAmm58Xlxha0mBPk909JmNqLFcRH8vkWTyo3yldt4=
X-Gm-Gg: ASbGncu+e/mj0cfqHPXhsuLNLXufdxHmf/exXaV3OTzjVoLpxWDvJfgZ+zxL3bi9pef
	Y/39WsdnyX7FOorG4i/Yso7zAgdoX51lgtAfFpOcdLxAis06jD0kR4IQJAmUc9n7hxRXGwVGepd
	MWFIKmi+Y+EV4R813bTW2flOSFxRnsN4jUm8PlX7IplvGnv0kLxkZAtr4jvoaKVAiqtTGwrdRNA
	ZNT7oTfJrDO6Bpf4R2HfGWwYyOUHmhEl4CpdfZesFDi7cIvE20Vq/1wPZ4QUNWVKoYGyAGabEqP
	tVZRuhQOFx7voF3XUhVmCluP4gDEa5DxyY/e7a0ts/pQzWVO7tI1JzvvrGq1SQfx/qMfUQk=
X-Google-Smtp-Source: AGHT+IGmG7vAzEnhXHlQo3207L4CmELRiyNhJ3wUUEyMyFbBXvRHz97NRmkBrfrhecbVrZ+I7yOf1Q==
X-Received: by 2002:a05:651c:4108:b0:309:bc3:3a56 with SMTP id 38308e7fff4ca-309148017bdmr6741931fa.0.1739465858543;
        Thu, 13 Feb 2025 08:57:38 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-30910276efasm2467321fa.85.2025.02.13.08.57.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Feb 2025 08:57:37 -0800 (PST)
Date: Thu, 13 Feb 2025 18:57:34 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Akhil P Oommen <quic_akhilpo@quicinc.com>
Cc: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>, 
	Konrad Dybcio <konradybcio@kernel.org>, Abhinav Kumar <quic_abhinavk@quicinc.com>, 
	Marijn Suijten <marijn.suijten@somainline.org>, David Airlie <airlied@gmail.com>, 
	Simona Vetter <simona@ffwll.ch>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
	linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, Jie Zhang <quic_jiezh@quicinc.com>
Subject: Re: [PATCH 5/5] arm64: dts: qcom: qcs8300-ride: Enable Adreno 623 GPU
Message-ID: <gberjl2wv5tafnemlagidyrulhiqtfwri254swv7zoc22dnzns@2obwq2rzcnap>
References: <20250213-a623-gpu-support-v1-0-993c65c39fd2@quicinc.com>
 <20250213-a623-gpu-support-v1-5-993c65c39fd2@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250213-a623-gpu-support-v1-5-993c65c39fd2@quicinc.com>

On Thu, Feb 13, 2025 at 09:40:10PM +0530, Akhil P Oommen wrote:
> From: Jie Zhang <quic_jiezh@quicinc.com>
> 
> Enable GPU for qcs8300-ride platform and provide path for zap
> shader.
> 
> Signed-off-by: Jie Zhang <quic_jiezh@quicinc.com>
> Signed-off-by: Akhil P Oommen <quic_akhilpo@quicinc.com>
> ---
>  arch/arm64/boot/dts/qcom/qcs8300-ride.dts | 8 ++++++++
>  1 file changed, 8 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry

