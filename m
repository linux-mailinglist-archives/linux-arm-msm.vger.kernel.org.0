Return-Path: <linux-arm-msm+bounces-21903-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 31CDB8FE4F9
	for <lists+linux-arm-msm@lfdr.de>; Thu,  6 Jun 2024 13:14:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B7F932878A0
	for <lists+linux-arm-msm@lfdr.de>; Thu,  6 Jun 2024 11:14:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C7A6C1953B3;
	Thu,  6 Jun 2024 11:14:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="EzZIQ5FE"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E6DD19068D
	for <linux-arm-msm@vger.kernel.org>; Thu,  6 Jun 2024 11:14:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717672472; cv=none; b=Utvcyjo9IEIw187a8/71JFLmln0hUbY0ph9/Y44d9Vts64obLdet/n/X9g6ljXoL8YcvKNYwSZr3sk2VJO+5HiqbqaKfPrkFLZqya6I6Up73rE4PHEyGFCXqPU4gIPVGxdvsiliZ8pvtXfkoHp1cbPABAgWviOmre7SHfFivXZ0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717672472; c=relaxed/simple;
	bh=m4HvQNfKfMnGQd5lte0NWm9syqvGy/phmV2IZKjWCkU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=B7nHsFh+ypz9k8zTuiYqx3civ8ZoQmj0XC0TF93ppr0HaY98wZdGvjoVDesE1xsG7tIc6mAIW2myfOv9wRe2sw+SKdrlQAULZWrFQ6BZNAIrteDVLpN8uTKhHfX7LIZyERyWV2UgvBGUVnM1+hXCwtNYrWD8IjnPHqenpYk75/8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=EzZIQ5FE; arc=none smtp.client-ip=209.85.167.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-52b976b5d22so1195184e87.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 06 Jun 2024 04:14:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1717672468; x=1718277268; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Ui4PfReL9mMUWTRJ9WvcJ92QeQmc2UxwHHGckj5cD7Q=;
        b=EzZIQ5FEsfDcTfMS+iCNbwuGzeGkxB0R/QscwO41MlcfebTsZsVe8EHIgYEOcmYe7L
         CflmJjAfYYxFCsTKboBEPVN5oklAdm523jxAZLFpXzWxscRRjlVgO8cNwvOIROALoScd
         e9uJnJKQUMtvSdv5Jbc/sTifDoYO+j+qZPaWoEAVzccXe5rvQieVwZXBOAR3H7MqJLKd
         DEBiTKtel8pivskNhqiuyK880ikz9BoXaGtF61POB1iQP5ZldgPKpX8mAbPqqJ9v5FMl
         yLnJ9cH5PeeIaDPj0jC4n6wRSF9a/cu3D0PkxAcr4q48X3K7ORL5AgdVsugv6FP1bYsJ
         gALQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717672468; x=1718277268;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ui4PfReL9mMUWTRJ9WvcJ92QeQmc2UxwHHGckj5cD7Q=;
        b=QOXJUDsZd455MWoapsr0pMTnPYahvunHSz+QDvSsTCygql25HM9K+miUdFJkRwulb9
         VOLzQRVgc08YgRohEYFHumpceRt0x/pGSaSgtHcFPS4r8rLdD3BislGmHWa8k9+EhllQ
         I4SEWSrZV/aHgOrPSn/bmJWcwD1G/KHqh6qeaGF6xcNH1h2jlfDISJqkC2Vfn9AcybGC
         EFHjjImDNcaa+c+cbrFBbmoQXWpmehAHfSO2SkiPBf1wjUg5HYNG6+S4yTjqNFx99Ki2
         gc5stmI/9A3BERI1hM5nj2Pg3gIG9lCTDnGx6p0EbNa/d0fPyKpsJqFx1lf+NRHoFETT
         KrNQ==
X-Forwarded-Encrypted: i=1; AJvYcCVUp8UD83srNcdokTy3LoczR05akCZnTKSX7qsxc2qPoM4c+RBmtd/9vY55ZXz2N+UzzrgyrJ41m1QtB3+gB3/2lcCOrqsX7HoEzV6vjQ==
X-Gm-Message-State: AOJu0Yzw80T+57XDCcFab4bhdpWfz4oToM5XgP9jl5jqFABIo+UpJtEk
	ClLgQY3Yefn6HRVY/TIN2BBsbLAAuTXV/L22RvszDKFvNQSwqnDoegXhU6CKIo0=
X-Google-Smtp-Source: AGHT+IEzI5txOcVEujaRIOG+YZa6D9ihaqrUtvAFaXO31vun5FvGNaQdGTeak7yW868hKtefFmFJaw==
X-Received: by 2002:a19:2d4a:0:b0:523:90df:a9c6 with SMTP id 2adb3069b0e04-52bab4fa5b2mr3071376e87.50.1717672468464;
        Thu, 06 Jun 2024 04:14:28 -0700 (PDT)
Received: from eriador.lumag.spb.ru (dzdbxzyyyyyyyyyyyykxt-3.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::227])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-52bb433e22bsm165525e87.287.2024.06.06.04.14.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Jun 2024 04:14:28 -0700 (PDT)
Date: Thu, 6 Jun 2024 14:14:26 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Abel Vesa <abel.vesa@linaro.org>
Cc: Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konrad.dybcio@linaro.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/3] arm64: dts: qcom: x1e80100-crd: Add pmic-glink
 node with all 3 connectors
Message-ID: <rjcpewe33tnwamoml5wrdhwzuy7kiqyx6sf4tzn26zhshmdnni@lf7itoregb66>
References: <20240606-x1e80100-dts-pmic-glink-v2-0-972c902e3e6b@linaro.org>
 <20240606-x1e80100-dts-pmic-glink-v2-2-972c902e3e6b@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240606-x1e80100-dts-pmic-glink-v2-2-972c902e3e6b@linaro.org>

On Thu, Jun 06, 2024 at 01:41:53PM +0300, Abel Vesa wrote:
> Add the pmic-glink node and describe all 3 USB Type-C connectors. Do this
> for USB only, for now. The DP ports will come at a later stage since
> they use retimers.
> 
> Signed-off-by: Abel Vesa <abel.vesa@linaro.org>
> ---
>  arch/arm64/boot/dts/qcom/x1e80100-crd.dts | 122 ++++++++++++++++++++++++++++++
>  1 file changed, 122 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>


-- 
With best wishes
Dmitry

