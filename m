Return-Path: <linux-arm-msm+bounces-33263-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F5349920D0
	for <lists+linux-arm-msm@lfdr.de>; Sun,  6 Oct 2024 21:42:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6CF7F1C20C9E
	for <lists+linux-arm-msm@lfdr.de>; Sun,  6 Oct 2024 19:42:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 98EA718A952;
	Sun,  6 Oct 2024 19:41:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="FrxE+a/K"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com [209.85.167.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6DB4F189BBA
	for <linux-arm-msm@vger.kernel.org>; Sun,  6 Oct 2024 19:41:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728243717; cv=none; b=HosJ8xn/cowUSCIbDyX6L1BXBSE3KimXdUkkrbgg1xtMx+zfhRu8db5DX6vsPx0gYJH842CvpIc01OZnYZ1ncIS+584sd6yhxIqwokcQ71mu730I5LE5E9ak+lRpTZE+dzEeMGPleJ8ZAYdUaHjDKKWMzuz9+5bGOpQHFCKPtI4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728243717; c=relaxed/simple;
	bh=InDb0dkgQ3vKDGQcUS+MOjNktszFzkV7Qxp2mWF6+oM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LeNUOmsasol+OYFHZpGxxfLTUIRxSwOCJV+t0hvQaRb2SBAlw9ZEi8CClVzXKR8MqTg3msAx7NvyVvTzKxpb5W8StvCc6jjkZWZ96wINS54Xr2QG7qwHJayVeEMDnM9UkhEdPAvE71zuwZxRfqkRD5KMnIzKNJHh7KcGm+kNWyk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=FrxE+a/K; arc=none smtp.client-ip=209.85.167.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-53991d05416so4176517e87.2
        for <linux-arm-msm@vger.kernel.org>; Sun, 06 Oct 2024 12:41:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1728243712; x=1728848512; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=wFoqn5U3IFgkxMo0rRByuuyMGm0bprWMsEyD4suNSNs=;
        b=FrxE+a/KekqOw92dVZpXHbiXpyWyzx+etbH81mtCgxQntyu3xc45jxtlOAeayZ8EfT
         wsBsuWiy60GYdbtW1npulihPtgrfaLIh41sqKGklQAUKzNbb8tor5rO3+rf5tS3sGxzM
         A0K9WuwbA19Av5SxX33YE/uM1oitUShKkPIEXpt2NMROsFwRuTFcu2WHp7M+kr7ZhdOZ
         2J4zty6J2hg1qCCuqBTtJnJCToKJ36vn9SA4BpqNDNAnQCcYodBPomyqeTHd89DHJno7
         okKVfc7c7GMVU1mSivIUGoj4YgD4Yr5i0yUssfeYh2TeNcbydVdnGHzxH8Ne4Qq8GUh3
         Ju9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728243712; x=1728848512;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wFoqn5U3IFgkxMo0rRByuuyMGm0bprWMsEyD4suNSNs=;
        b=udUIZPn9yOsBjSoZuJmVCUyiOKQzmLCGhed8N6wDbciTfMcy/EybTY+jGwjyweb4Oj
         1mUKTFkSvqsSlzIRUchf1yb07lbd+FeL34BrWMl3BtA05SJv6iZ0+FJMvAgHaLOpr3vz
         eZbWlZM8m9essI5SnkxtTc4tMrlSOY9C9kFN3Tzsppi0lb5dad44wYLs6QDg03ioVxfE
         4XPlewGmB9ZkXHVEzsjbf1017rkhhVMf/HLjUxnCT0PL83EFPJ7qjs8sqebsgsmItfxB
         +XFLgiW9VmM+7IVHZCennZ7ABlSqvXZhUa2hYCbIWora+F0GrpVVUX4CerMmBCPVEWu7
         5ANQ==
X-Forwarded-Encrypted: i=1; AJvYcCX5DFXOqa5knJum5Vlt6IdD0swZSMTJtaldEXqSmU67eRAIIvylTCZm+206d4xOYKJnPeF7mx4EY54eJ+rP@vger.kernel.org
X-Gm-Message-State: AOJu0Yybgf32KXh7UFXuRcUQtpFdox7yQDBWsIF4b1c3Z5+uSdl0l4dm
	hARSH9eWyvYPS+uJbXa/qa5PPwc7WEfZIgIOlMIQanhKCAvG61Nsuu9fVaMfaGE=
X-Google-Smtp-Source: AGHT+IGsFX5d2DcSS4LcFqeh11ecsOdYzYu01fp9p+KGuVf/+pKR366N1XRvSfc1JagbihHfqGil/w==
X-Received: by 2002:a05:6512:b07:b0:536:a7a4:c3d4 with SMTP id 2adb3069b0e04-539ab9cf1a9mr5906652e87.39.1728243712591;
        Sun, 06 Oct 2024 12:41:52 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00-89ea-67f6-92cd-b49.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:89ea:67f6:92cd:b49])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-539aff1d408sm594975e87.145.2024.10.06.12.41.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 06 Oct 2024 12:41:52 -0700 (PDT)
Date: Sun, 6 Oct 2024 22:41:50 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: qcom: qcs6490-rb3gen2: Specify i2c1 clock
 frequency
Message-ID: <ykovxr6sf2uywgikeqm7inlfctgdwh5ctiag5vp5i3ctfx3mko@nanyz2yp2umo>
References: <20241004-i2c1-frequency-v1-1-77a359015d54@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241004-i2c1-frequency-v1-1-77a359015d54@oss.qualcomm.com>

On Fri, Oct 04, 2024 at 09:09:05PM GMT, Bjorn Andersson wrote:
> Per the binding, omitting the clock frequency from a Geni I2C controller
> node defaults the bus to 100Khz. But at least in Linux, a friendly info
> print highlights the lack of explicitly defined frequency in the
> DeviceTree.
> 
> Specify the frequency, to give it an explicit value, and to silence the
> log print in Linux.
> 
> Signed-off-by: Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts | 1 +
>  1 file changed, 1 insertion(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry

