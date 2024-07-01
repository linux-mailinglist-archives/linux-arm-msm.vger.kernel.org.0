Return-Path: <linux-arm-msm+bounces-24844-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 580F691EA0B
	for <lists+linux-arm-msm@lfdr.de>; Mon,  1 Jul 2024 23:13:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 0E6461F20D22
	for <lists+linux-arm-msm@lfdr.de>; Mon,  1 Jul 2024 21:13:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F127A171651;
	Mon,  1 Jul 2024 21:13:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="y02spQQa"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com [209.85.167.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31F0B170855
	for <linux-arm-msm@vger.kernel.org>; Mon,  1 Jul 2024 21:13:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719868431; cv=none; b=OokIWpGLpTgoojqXNU1rU6H3yZ4abINal9xbB6z/SMRC5oS4StonKIVGWOaJ+pM7YHDi81v3mhjpoSaYsigw5zA5zo0eDnmwm+hDVzlBDeE3de3gQ5kCn/HYOhF6Yt8xNrdv5cogKJ3nvlaDUEfPsXWPZbTv9Hoa8yxX5yHhE7M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719868431; c=relaxed/simple;
	bh=N9uOqUVYxAGpmBSqVCGR2aqU3MIpbs8kOF1uwgEsfQA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WoNvQfhYFKkztVv/CS7/sy/D89ATUaO8FvaKOKM0+XcrDnq18CeqNWqXEf6S/yKrHIKQDuXGqaw0gfrfVUnOQIT7NC/SiWTFOtZc5+OVA3g9kPCrkWOJOu9vbm+SHRy0MdAEXHeCNTNghLyHqFisbS5KKrRE0x1jrBsKU1AmZpk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=y02spQQa; arc=none smtp.client-ip=209.85.167.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-52cd87277d8so3563881e87.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 01 Jul 2024 14:13:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1719868428; x=1720473228; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=ptVgN4YYQpEV6K7/5QCI7DKm+XnNleCgayxUZPXecLo=;
        b=y02spQQaNA0dbUWo+YMIEmzeEgyqqYyUkUGkvRCBfCRPx7/E7ZJiK2l6nit7SpeGuR
         Y7iPJOVaC0AHh8r48zLN66BOmN8gsE3288zBt6V8r7VBoO5cS9tD1Bv8wuGIdcWniglR
         BG6EstFIq36ZKl7DFAdzuTOsdTnao/DkOd4vZkJw4YC83OOrN6nKm2xqrEpbcKxb2O+9
         GCz6IzRFAd6VioER7NhcKiGidsm8Usdx84DeY4xLa1yewOqZvtI+jMm1tsaBKPmWx7ts
         4NSrSIG/J3mLUpmV6rGwC1XWQ6Y1T71/k5Ny6H5j+uDyE1JrDSSYH7Y50Kgjnu8vcOWS
         tuBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719868428; x=1720473228;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ptVgN4YYQpEV6K7/5QCI7DKm+XnNleCgayxUZPXecLo=;
        b=iWVJGCTQsVRJpdjiJW+pqm4qofivr/KCmXH+127dG6HzBEnPnEJkKC1rQb7WJhkNaY
         ksPgWjbhhGRSTJzrHsIDfqfLa7d94EWlx2dCEXGQk6L6Awcuvn4XJxjgqqxNA95dlh46
         ScLTlrxUzB5IxrYnBuPu8HgBzSvSnppjb/SFOyzLDrgiHuvY8YtgmxWUXUUgSHPjm0fu
         sktRfxiwpMUZ7w8dvOq3E5kai4m+l/YIRRrNNLNtWcDDnyYHcpVW9HZ/mUWBrtfja6qL
         mqdSueKBMrqzHsfMSlTcyo3GeYhAT61vvO75nSElsz7FOxJ/Oznuf6Jrj02DDEfppkG1
         2RXw==
X-Forwarded-Encrypted: i=1; AJvYcCURTxhiP3nXGyZOG19MURmWu9TvkNjI1FUfdm6SiDIX0u8dd105fQ56yZ5bzKG3w+BUGEoY93FO0nbncUDjHR6zizkxZZYjz9I4UQsGqQ==
X-Gm-Message-State: AOJu0YwE5uy8vBDuChoXXwZtNbe6m8HFKFdmI+079DT3iXGkWxvNcPGs
	pMBKBVhwPSUMmlq2uPEdS5H3gAmyf/oiMrwBCjNNGBYuPgcut/uM3exTgDQEgts=
X-Google-Smtp-Source: AGHT+IE+7PRGx08DXH7bHPZX83Ev55PRXCk/fMJ5OekuRsZQMTczkCluMwsrIcyAiP+bY+Xpuud/rQ==
X-Received: by 2002:a19:e010:0:b0:52c:d84b:eee6 with SMTP id 2adb3069b0e04-52e826932e5mr3754518e87.38.1719868428177;
        Mon, 01 Jul 2024 14:13:48 -0700 (PDT)
Received: from eriador.lumag.spb.ru (dzdbxzyyyyyyyyyyybrhy-3.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-52e7ab278c6sm1557144e87.157.2024.07.01.14.13.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Jul 2024 14:13:47 -0700 (PDT)
Date: Tue, 2 Jul 2024 00:13:46 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konrad.dybcio@linaro.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	kernel test robot <lkp@intel.com>
Subject: Re: [PATCH] ARM: dts: qcom: apq8064: drop incorrect ranges from
 QFPROM
Message-ID: <65yya36amcxdvdob7impc3nlwkklzxbnsi2vpx3scbbjqxloty@y5tj256dtxvq>
References: <20240701062253.18149-1-krzysztof.kozlowski@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240701062253.18149-1-krzysztof.kozlowski@linaro.org>

On Mon, Jul 01, 2024 at 08:22:53AM GMT, Krzysztof Kozlowski wrote:
> There is no direct mapping between QFPROM children and parent/SoC MMIO
> bus, so 'ranges' property is not correct.  Pointed by dtbs_check:
> 
>   qcom-apq8064-cm-qs600.dtb: efuse@700000: Unevaluated properties are not allowed ('ranges' was unexpected)
> 
> Reported-by: kernel test robot <lkp@intel.com>
> Closes: https://lore.kernel.org/oe-kbuild-all/202406292139.yqPYyUfi-lkp@intel.com/
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
>  arch/arm/boot/dts/qcom/qcom-apq8064.dtsi | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry

