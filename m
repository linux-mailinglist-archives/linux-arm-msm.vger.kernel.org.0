Return-Path: <linux-arm-msm+bounces-27535-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9EFA8942FB5
	for <lists+linux-arm-msm@lfdr.de>; Wed, 31 Jul 2024 15:07:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 313D1B23849
	for <lists+linux-arm-msm@lfdr.de>; Wed, 31 Jul 2024 13:07:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D94621AD9F6;
	Wed, 31 Jul 2024 13:07:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="RQFsD9Zt"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f172.google.com (mail-lj1-f172.google.com [209.85.208.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 482C91AD3E8
	for <linux-arm-msm@vger.kernel.org>; Wed, 31 Jul 2024 13:07:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722431253; cv=none; b=DtXJWMssL/m0IVbnsW9Las6Vj0LZp578ckXDq7/vD+tkYwvwomntedYrhK28T1sc3e/w2foxJerGjcJrJGCsnD27a5KcEmlFHqK1DinUcOmzmxhT8Fjdv6Zzpppvn3jrqAPtZYouE307wbu1a+anzDvPNpgLReVg2Ad928YdYwk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722431253; c=relaxed/simple;
	bh=IDvKEAauQ3f3+B7eefwbOL3BPtdB6ke35T+ErE2pzzk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Z80c0yac4oS92FE6wpVl19UlYPwEYeZ5lbhgESJdJEnFAeN9Kia86x7gEQ8ZtrDIROTkA6Ko4PAsnt6sCmqwSz5T5Ixi63oe6kQFgOeB5btesxlFsvBY1KJYXyHtrFA5c4BXsUQDUDCLew/3YB+54Rmc5A0pb2Ij0jppJlIX/k0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=RQFsD9Zt; arc=none smtp.client-ip=209.85.208.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f172.google.com with SMTP id 38308e7fff4ca-2ef2c56da6cso67154291fa.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 31 Jul 2024 06:07:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1722431250; x=1723036050; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=/FoiQbEYmhBENH3LXyd3ATBiDIVMApuyh6s4DrTOE6Q=;
        b=RQFsD9Zt1YvBrlmC14yzZ/QbltZbO0diqdOVPreqk6el0P+rrY2L9bctyFnpp2+Bf+
         U43AA5u+7jNIOFrXNy+aodjWR4nUV8U8zE29N/IweUOYg4xNcDhho2lhXljJdEgBWP67
         14wHITVrBCM91Vs0M4a7M7ov43iBg+XtG8GMkyT90Iz9j8f7ew+J85qkmMU4b1dAUNm6
         RtksoVie4tfXMdpLJzJrS/mwKqAgDgkYhWecFpc8MIhBOjnwskb1KBHHJ4iHGlWxBGuG
         8YjgzoX63qROVEDm5wB49fWO58D1M2lvQN+rw1HIFBbKJWju32y1qlX+t/2ocXGLXgDC
         MtSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722431250; x=1723036050;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/FoiQbEYmhBENH3LXyd3ATBiDIVMApuyh6s4DrTOE6Q=;
        b=iaEF7NL9hYSuKgU6sRGvjm7vcIayu4vRNVkVFn9Jay2uSjEwh9SoGJ4rhEsnWAc7Yp
         9pEiVGIBdTBZw22u8TAa5FGDZmEaBa9Pc6I4cemorW+wlnWVdZUr1bi2MiCXkH2dV2Fd
         i0jMi1CEmmqSJ+0B/EeYK39keM8qy9P/31aVk5qO+H622StNnkF8iKp5bOac1eS1zNSb
         ZhJBsj2k+twFCnBigL1vUar8z8ijoz9s/N+w5aiyNoJmX5uklnxEjODXsAOZggpNHBmD
         UtaUKvFAI0Foz9dQu9EJ74Ob+aqDcxrW/YopmD5IlDvbMCrZHR3Vjnvfj9efUEnii9Pz
         P8hQ==
X-Forwarded-Encrypted: i=1; AJvYcCX/EGuD7/PcJL3ZIyqTjlVaFhsVIm6QM14hf4MMOmqj12xRSV5EooxM5X/cwLA10rE18A0LoHtWb88X1FnqrOFa/IWbJIU9OGcI5vL4Mg==
X-Gm-Message-State: AOJu0YyPn1RdYTvJFNeNyXobkYfeh6nL5Crrsjkg1whZSkF2zxn1QTE2
	Fo28zk/Z0Vu5788yAETLL5vZmO6ArjPMgD5+kSYoSdBjg3txpl7HIJDnizx8JeA=
X-Google-Smtp-Source: AGHT+IHFGuIslHNtb6tITJa8SbCZaWaHCKmfmiJMpdSGO3yjlULlpXbI2CAqFvwKxhAIv4SP8SdgkA==
X-Received: by 2002:a05:6512:2032:b0:52d:b150:b9b3 with SMTP id 2adb3069b0e04-5309b2809c5mr8147947e87.32.1722431250588;
        Wed, 31 Jul 2024 06:07:30 -0700 (PDT)
Received: from eriador.lumag.spb.ru (dzdbxzyyyyyyyyyyybrhy-3.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-530aa08dab1sm649447e87.13.2024.07.31.06.07.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 31 Jul 2024 06:07:30 -0700 (PDT)
Date: Wed, 31 Jul 2024 16:07:28 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>
Cc: Michael Turquette <mturquette@baylibre.com>, 
	Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Konrad Dybcio <konrad.dybcio@linaro.org>, linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Bjorn Andersson <quic_bjorande@quicinc.com>
Subject: Re: [PATCH v2 2/7] clk: qcom: gcc-sc8180x: Add missing USB MP resets
Message-ID: <z4lbpgfjmkslylflolm6nxqye5gsgbzn5yn2lqvqlngyc6y5bt@s6uovsadcxe5>
References: <20240730-sc8180x-usb-mp-v2-0-a7dc4265b553@quicinc.com>
 <20240730-sc8180x-usb-mp-v2-2-a7dc4265b553@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240730-sc8180x-usb-mp-v2-2-a7dc4265b553@quicinc.com>

On Tue, Jul 30, 2024 at 08:24:39PM GMT, Bjorn Andersson wrote:
> From: Bjorn Andersson <quic_bjorande@quicinc.com>
> 
> The USB multiport controller needs a few additional resets, add these to
> the driver.
> 
> Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>
> Signed-off-by: Bjorn Andersson <quic_bjorande@quicinc.com>
> ---
>  drivers/clk/qcom/gcc-sc8180x.c | 4 ++++
>  1 file changed, 4 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry

