Return-Path: <linux-arm-msm+bounces-38474-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 10CC89D3A23
	for <lists+linux-arm-msm@lfdr.de>; Wed, 20 Nov 2024 13:03:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 67B6EB2B3EE
	for <lists+linux-arm-msm@lfdr.de>; Wed, 20 Nov 2024 11:54:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C76BE1AB6CD;
	Wed, 20 Nov 2024 11:51:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="i2zzOUcr"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f174.google.com (mail-lj1-f174.google.com [209.85.208.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EAC9B1AB52E
	for <linux-arm-msm@vger.kernel.org>; Wed, 20 Nov 2024 11:51:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732103504; cv=none; b=WHPE1NSxSkFC1YrJ6qzEpYdCoZGUpX5CrMnkUkStJRV34p/yMWdHg3y51n0RpH/tpLrH+33oj3dJPwDCClCMZetNrEA4cw2LuLDNmFhqNteIo4OJyZH1MlPLjkurFyeFl1ESjY28x0vJQSKaeruun2sXNo6Pmv+phcjCt0Qm2GQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732103504; c=relaxed/simple;
	bh=QYG2XSaisH6JFzHjHjlYdIhU4FY/L8M41+fZI3gAe2I=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=n/sN+M5PWYCGu1fGApxdt/os8NwciztIbM5TuHjIxbGa7wU4i2gR3He4FSTtbDegM61pfSEp3MaZMeUDGX1E7HQP2amC4s/nzhnRuIaL7Mv9Eq3bkEfbmTwPMRrDgx608qrJpjjptUTMDMzUbM1wG/JyKKNcxoo42tFrrQ4A7/c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=i2zzOUcr; arc=none smtp.client-ip=209.85.208.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f174.google.com with SMTP id 38308e7fff4ca-2fb3c3d5513so51082311fa.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 20 Nov 2024 03:51:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1732103501; x=1732708301; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=OABhvDMwf0ZQTXyu1UPyLhOCfmcWutbWE3+BBdXKQrA=;
        b=i2zzOUcrflUXMSdgwG41bk7oNq3lGSdBDjmG04NV28fwDjRKBKT3dvwITjqO+sYc7O
         ps7h4bSD7rtEvsFVeXn+O4r5304HjOnzdmSUpIAhyvx3vPKg0+Mf7YQ9R4mKh33Oj9T2
         aUYZFrGUmDROmjm7H1qDOV0dxTr438xcpUDT+6abNLUMiSRGw2OBaQYRfm1ra0TINtws
         Ga9xX1Oni/BVRT+HK0XG/df69T32eQ+QltfNvDEy2mGMHcuv4KwmSC/YnBGaVEeqnCQo
         8t46BXAnohnx8t6r5xOzQYb80PsnVlopn4dpvM0mDlh1ZCXeTKDYDV+Rij1EX4YyNpxy
         zG2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732103501; x=1732708301;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OABhvDMwf0ZQTXyu1UPyLhOCfmcWutbWE3+BBdXKQrA=;
        b=NSp5RroGChaXRYKfE7WV15Gd52uol6VMKygDgeqFfZkEobJkhrQL2IZeO9nOwVuGFp
         r+jF3RR43am67ShAcz3cg/1dFRVg24DGWXsjuJmC5JqmwrUWhcDN55z/YrPyWi3ms7L2
         K2srYxjiilN1xRhBxiiNkINlA2AqKA/uULq980imiDbDhkt8sXBPqWU7xNTsM9YF3lUO
         XYfh0pNEx0dFPMI+CdGCWOL5GPZvz7Mxt1D1nsZsbsdf9Z6jR44T+1vxHFHXcxPTjcD4
         Q4g7v4Z8Q1z4VX2LABsL+Wiz9weo55pstesq1dYeVTMtUaPXn7mqyCk7d7B8AIpUwzny
         Msrg==
X-Forwarded-Encrypted: i=1; AJvYcCVQ56QaqwDmnJF57ROVp5hS8sUg15P43lrvczCghXX0dgxWp9TDdsx6WufYypct2optA/TMVvkVqiOv9SdG@vger.kernel.org
X-Gm-Message-State: AOJu0YwIF0RZZN1FJpf0awG4emmlzQH2LWKJt1VcF3WFtjciCC0JY74G
	TsBGkWpAnuOxU21zmAKVyv+pDRGhBUkl7rXJRAkxNsznMoy9BU1tYqCTnJQOCJFGAaEhZ9gmTO6
	c
X-Google-Smtp-Source: AGHT+IG/km5lu+2hzYNdy6xQAltlz9pdfHnrzafB+noZTc5/mJ1/B1ryM5MEBm68pXeikm1vQ5yMnA==
X-Received: by 2002:a05:651c:4006:b0:2ff:8e69:77d7 with SMTP id 38308e7fff4ca-2ff8e69797bmr8212711fa.20.1732103501072;
        Wed, 20 Nov 2024 03:51:41 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-2ff69851607sm14943021fa.21.2024.11.20.03.51.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 Nov 2024 03:51:40 -0800 (PST)
Date: Wed, 20 Nov 2024 13:51:39 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Wasim Nazir <quic_wasimn@quicinc.com>
Cc: Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	kernel@quicinc.com
Subject: Re: [PATCH v3 4/5] arm64: dts: qcom: Add support for QCS9075 RB8
Message-ID: <eguja5lyf6eodsgev5c6de6jkg7bnuht7lctsajig3wo4nzjri@afjq2uhhg7gn>
References: <20241119174954.1219002-1-quic_wasimn@quicinc.com>
 <20241119174954.1219002-5-quic_wasimn@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241119174954.1219002-5-quic_wasimn@quicinc.com>

On Tue, Nov 19, 2024 at 11:19:53PM +0530, Wasim Nazir wrote:
> Add initial device tree support for the RB8 board
> based on Qualcomm's QCS9075.
> 
> Basic changes are supported for boot to shell.
> 
> Signed-off-by: Wasim Nazir <quic_wasimn@quicinc.com>
> ---
>  arch/arm64/boot/dts/qcom/Makefile        |   1 +
>  arch/arm64/boot/dts/qcom/qcs9075-rb8.dts | 281 +++++++++++++++++++++++
>  2 files changed, 282 insertions(+)
>  create mode 100644 arch/arm64/boot/dts/qcom/qcs9075-rb8.dts
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry

