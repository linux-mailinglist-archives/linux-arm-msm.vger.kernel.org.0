Return-Path: <linux-arm-msm+bounces-40403-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A65209E47FF
	for <lists+linux-arm-msm@lfdr.de>; Wed,  4 Dec 2024 23:38:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6245C2813A4
	for <lists+linux-arm-msm@lfdr.de>; Wed,  4 Dec 2024 22:38:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EF4BF1F03F8;
	Wed,  4 Dec 2024 22:38:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ylRCSmsI"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com [209.85.167.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C39118DF6D
	for <linux-arm-msm@vger.kernel.org>; Wed,  4 Dec 2024 22:38:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733351886; cv=none; b=nURuS+uFU0vg5tbe8EFcGFrbAkDZpsj2u9K2B/3NZbywsghDw+RSnzdOrwPuenjG6DdxcxhKm2gSR49qqSTw5u1r1u9o4XdkXYd0bxiIdX4T6llZBUgq0yHYPVRl0zTrJur3gbIfxFubrCDIvPa4cYOmbGwL5w/ZekGEJ4k92kw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733351886; c=relaxed/simple;
	bh=xkg4TmuAgcOBlNXpCz+wAftbtt3ceUi42NCmtOro4zk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=b92iGMJB9F30iMpNc6+x0iYvrheZeGJ6ei1nfUgFLErq40MhWkaUv4gtEBbLlgiG0Zfz1S3Gx8Rp96AZPUIrHuiPhOW3wHaI6PNtHr9vIf7bfJgbKepruh74J6Qlf0Uw8uA4Vffo3iPrkX+vQwxcF/Gr6Do2ZeSaZYD1bpG4wdQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ylRCSmsI; arc=none smtp.client-ip=209.85.167.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-53de6b7da14so308469e87.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 04 Dec 2024 14:38:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1733351883; x=1733956683; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=hl9jh+TWg3sLdFu2Nz9fBaQFVbFiJS8tYrgpEHAnTls=;
        b=ylRCSmsIq1iFD6WgDIgutJU7jDSQ0rt9tB7j7hWcADsNAO/vpOBlXOqa7CLMrhZJ1C
         98sl4ivGQmOWfMfix2CeKn9BN4tPH1vO6Z6Ysd+flZZfpwJmYSzL9JsDK9TPIIeMvfFY
         gWuaFWjIJsjquuhf3dMoyMEn7P0bp1HruCSo1YWBWPcP01XStMXT77/zTNM6Y/SKiPH/
         bhfsE4Q8GBGMklqh1QEw2btnVoYDNc9lCY2HuelZcxGg17OmxQo1/sNn7Ve9jK7U7BCf
         UNOCn+2+zi4j31k9sBT2BCAYV/A4jqzsewaze9kCwnziTE+IZppF+IadBfE2bHJy6iRV
         +T8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733351883; x=1733956683;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hl9jh+TWg3sLdFu2Nz9fBaQFVbFiJS8tYrgpEHAnTls=;
        b=XrtRjFxx/fHgKfsAyB1nR7I+6tF43XfpZr+itUoQ65GwhBLln9E+s1e5luFPf6YFQW
         X5MJK3pQY7mGZ0rfAfYQpoPF8Nzp8QSE12codkW2Bb2RXGjvZDBhsgL7MjBTh3j9O+Ri
         jNSlQX3TOLhNQYIwh4mTkTUz1KzGq4t1TyuC3/icWPHb+kqO05x02dFguX8q8Br4Xfy/
         3x8XHIF8Gv/mOF1c1ftrXUEE+9g9vFtcv3xzZrwcrsMRHlIrLs3ZcQquwUN/wuZ0xvLq
         kyaHLF86J8bpO1KQb0wS+rZV0u+FB25mHxO9cemgBtV/vjI6m30eIQZHycskI9rbvFUG
         mMSQ==
X-Forwarded-Encrypted: i=1; AJvYcCUEUlFUPaFKGPqCDcNvkrFgkL7NMOr4j5nK7RkjFMR2bkCiWXaLH/yo+6jLwHTI2t4b2Xj9YSbxtSEf2Xhd@vger.kernel.org
X-Gm-Message-State: AOJu0YyLAbFe1YuC67QtQBpjdYOkpL3A9djeVzfXY1RBvMDLqATH8/1V
	kVCjxNxtxgnTODTJyGUgAHdzAOuUSMCIhwdDT/9cISAaMjPQvXZg1n+tB2cso+s=
X-Gm-Gg: ASbGncumzQRYodFmTPTnvqbO2cV6oHgse1Ds4XTNDjMBDb3NgJh11Vh7vlfxPsoIrEJ
	MOGKG92DLOfJW1m/Rr27/AzN/gMmUfxb3Ne+TJD+EInPHHto+XPGy5+2q9xsdxGMdnVmYZWTRhx
	eKYuDGmWy4BS4/ajuUcje9o6TIuPK8dcSEfZ/HTBM4NWDeLhlnQylPuYiciETsjC/1WT0WrZBPl
	3iMDBLn+MJJOTrCdd8/tHrW7bO7ucBIr3GCzV3wQ0rySwyQdmQGaF36B8VwDm2+mNnq17jiWB6+
	mns1R3Ttz/EnKf2JxlnDl4ZGDfj3JQ==
X-Google-Smtp-Source: AGHT+IHRALAbQfybBTi3vgYPJn6lmJUNAP0mUN/xuWtAx3rCNJI5389sVGMg/Z3sKLeIyXa/zOSW+A==
X-Received: by 2002:a05:6512:3a82:b0:53e:1b79:adaa with SMTP id 2adb3069b0e04-53e1b87856bmr2395601e87.9.1733351883289;
        Wed, 04 Dec 2024 14:38:03 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-53e229c1fc5sm22370e87.199.2024.12.04.14.38.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Dec 2024 14:38:02 -0800 (PST)
Date: Thu, 5 Dec 2024 00:37:59 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Manikanta Mylavarapu <quic_mmanikan@quicinc.com>
Cc: lee@kernel.org, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, andersson@kernel.org, konradybcio@kernel.org, 
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	quic_srichara@quicinc.com, quic_varada@quicinc.com
Subject: Re: [PATCH 2/2] arm64: dts: qcom: ipq5424: enable the download mode
 support
Message-ID: <o2o73f4arkmqyuvzyisxtafqo4wbzkfkdnvd4a336wuwh6idra@x2fqbpgnf35a>
References: <20241204141416.1352545-1-quic_mmanikan@quicinc.com>
 <20241204141416.1352545-3-quic_mmanikan@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241204141416.1352545-3-quic_mmanikan@quicinc.com>

On Wed, Dec 04, 2024 at 07:44:16PM +0530, Manikanta Mylavarapu wrote:
> Enable support for download mode to collect RAM dumps in case
> of system crash, facilitating post mortem analysis.
> 
> Signed-off-by: Manikanta Mylavarapu <quic_mmanikan@quicinc.com>
> ---
>  arch/arm64/boot/dts/qcom/ipq5424.dtsi | 6 ++++++
>  1 file changed, 6 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry

