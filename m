Return-Path: <linux-arm-msm+bounces-25545-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id BCF8692AF5C
	for <lists+linux-arm-msm@lfdr.de>; Tue,  9 Jul 2024 07:15:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A024428234E
	for <lists+linux-arm-msm@lfdr.de>; Tue,  9 Jul 2024 05:15:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4F6D74D8BB;
	Tue,  9 Jul 2024 05:15:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="q0nh4MA2"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pg1-f182.google.com (mail-pg1-f182.google.com [209.85.215.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D22F3139F
	for <linux-arm-msm@vger.kernel.org>; Tue,  9 Jul 2024 05:15:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720502151; cv=none; b=qVUg1dNTiQT1WhQcB+QtsFcvWfVPFwu4CF29Yl8eqR8TbC2hfQ/0vfBe9va37RJQxkGzi7DbKMoBBueTIuQciQZ1wlg2Y1pMSNVnOAPGs4dKqNoNPMhN3U4gQUcNDqJD9mLYIY7cvy1akGLLfRYSOR3v2YoGeDahXbEidRQSU3U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720502151; c=relaxed/simple;
	bh=P7OeQP7c9HqgK2yLsYhiPWT6hYg1DVYUTG3lGVemS90=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=F7L6LG5M7Z9Ierp3rI+WnP5NVy8a+OMuhZUmPQTPUlTOLdBLX4KRPvhOCvUFixcXOY4rrWpzmGM9X7ewVTsizxkKd7P5ybw2foJYd+rXlG781WGg2R5hw6tlrCdhCTZOGeary+RUGBU6nAyYS+e+Mwtqz5KtOd22gwsmETe/uvI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=q0nh4MA2; arc=none smtp.client-ip=209.85.215.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-pg1-f182.google.com with SMTP id 41be03b00d2f7-75ee39f1ffbso3432930a12.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 08 Jul 2024 22:15:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1720502149; x=1721106949; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=xDLPivrmkjKyg2q4jQZy8nP4kzWQRBZ8m1RjyeeDtNE=;
        b=q0nh4MA2YgLcxfv61xgbOZDaE9opkE+uRymic/YLbcqNt8vFp+ACYurmNiTGYPTTLD
         NJqM+RnmlQj5qOTAk3t5Pk/jci+tmfqARcB7+HmNGJRrJ7YkqkQf8G++nPWuwRJUugdg
         Yri79TuHTZB4G/KFnk2tkryZ/+f02thWxS3vpLnXaIZo0S1tlOwLOIuAynPIUCjT9l0c
         YQxch9CJEweRYXIqA1Wq2OutHuX09xxDzMkNZ+mVSCc5FA7qRjF1VB/A2EpVHWjnjcKq
         2McuhHopgXH3BJlkZCrsfFrqtaX3WBCG2dZZDkOWYvPtshetT5TYVJtFBjaxvtc2YHc3
         2low==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720502149; x=1721106949;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=xDLPivrmkjKyg2q4jQZy8nP4kzWQRBZ8m1RjyeeDtNE=;
        b=oJzVJ1SlufHs5NHc/ICK+sfSB4sh/iPKnELXtnoNlznZ7tvMTmCYq80QU+iofLQmb8
         +KTPIAJeV4hDvXwSn6tdAMfAi2Vxqb8R+utDNzDz//xKoX3ml4iCESg1jn5WEIa2qq2b
         KRENfesKhkQFlTDkQ1FzDdt4xriAAMhP2lG69y9VZbjvbWVItOtjI+xDOG1057ik0krX
         EYX1k55tW0ZgdwiZBnUNlM8Zmlvzdak7yf/GOoxrT8UsuhRQMLGPKLLl0KJ/RC5Tzc+4
         ciFJWq5gQ9zxifTylySNgCxvCBiyfIUF61JYB/qcGcFTPhZd0agL04ssNCF5nJBBehu0
         OIpg==
X-Forwarded-Encrypted: i=1; AJvYcCWdeaCLRVhIb+7CfuJTrJsqUbAnEf0dU+B0hhUachaqP1yisjpFVuuQYX+D/HK/hzOC4Qnu53L/fQ9xi7whiQXoQZ4iLkyLXY+Ad/sPtw==
X-Gm-Message-State: AOJu0Yz67eCvgeoHtSDdhszyoB6Ot6gcxZhj+ex/zhpmck195zevgsui
	qNr3DBfQIVqszbyH/BSMUacH9OSU2RALbpI8UNq/TtHLxLEMI7N3XnYtLZKT+A==
X-Google-Smtp-Source: AGHT+IGdB/mSqtlNzgyqtDYVfh5FespmcM82pecp53Uky3WSQDR7yhPKobzUwLPTl1k6IYZxsBLaWg==
X-Received: by 2002:a05:6a21:6b0c:b0:1c2:3843:c7a with SMTP id adf61e73a8af0-1c29820c0dbmr1605818637.8.1720502149071;
        Mon, 08 Jul 2024 22:15:49 -0700 (PDT)
Received: from thinkpad ([117.193.209.237])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1fbb6a1085dsm7259775ad.29.2024.07.08.22.15.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Jul 2024 22:15:48 -0700 (PDT)
Date: Tue, 9 Jul 2024 10:45:40 +0530
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: Krishna chaitanya chundru <quic_krichai@quicinc.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>,
	Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
	linux-pci@vger.kernel.org, linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/3] PCI: qcom: Potential uninitialized variable in
 qcom_pcie_suspend_noirq()
Message-ID: <20240709051540.GI3820@thinkpad>
References: <20240708180539.1447307-1-dan.carpenter@linaro.org>
 <20240708180539.1447307-4-dan.carpenter@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240708180539.1447307-4-dan.carpenter@linaro.org>

On Mon, Jul 08, 2024 at 01:05:38PM -0500, Dan Carpenter wrote:
> Smatch complains that "ret" could be uninitialized if "pcie->icc_mem"
> is NULL and "pm_suspend_target_state == PM_SUSPEND_MEM".  Silence this
> warning by initializing ret to zero.
> 
> Fixes: 78b5f6f8855e ("PCI: qcom: Add OPP support to scale performance")
> Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>

Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>

- Mani

> ---
>  drivers/pci/controller/dwc/pcie-qcom.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/pci/controller/dwc/pcie-qcom.c b/drivers/pci/controller/dwc/pcie-qcom.c
> index e06c4ad3a72a..74e2acf4ae11 100644
> --- a/drivers/pci/controller/dwc/pcie-qcom.c
> +++ b/drivers/pci/controller/dwc/pcie-qcom.c
> @@ -1633,7 +1633,7 @@ static int qcom_pcie_probe(struct platform_device *pdev)
>  static int qcom_pcie_suspend_noirq(struct device *dev)
>  {
>  	struct qcom_pcie *pcie = dev_get_drvdata(dev);
> -	int ret;
> +	int ret = 0;
>  
>  	/*
>  	 * Set minimum bandwidth required to keep data path functional during
> -- 
> 2.43.0
> 

-- 
மணிவண்ணன் சதாசிவம்

