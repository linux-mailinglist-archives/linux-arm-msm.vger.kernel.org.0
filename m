Return-Path: <linux-arm-msm+bounces-25560-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C44EB92B0DC
	for <lists+linux-arm-msm@lfdr.de>; Tue,  9 Jul 2024 09:09:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 2FE1AB21016
	for <lists+linux-arm-msm@lfdr.de>; Tue,  9 Jul 2024 07:09:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D40BA1420A8;
	Tue,  9 Jul 2024 07:09:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="G3iN3ZOH"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com [209.85.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E11E813A27D
	for <linux-arm-msm@vger.kernel.org>; Tue,  9 Jul 2024 07:09:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720508966; cv=none; b=XJyA/rgz1T7iwuQwOlYOUxVzAA3rUPVIO2wfIO3VKGrj1SiCifGmzfpEpXb8qZRxNgUIphJ0b9ZxG+tPfC46NEWbbg4myQLNcK3qnJpH/HJ4PF6RR3RO6AvyH2QFMlZDxnSActwqy0oGyVbTuNn130kK19ttEVFfJ23AtOAbcY8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720508966; c=relaxed/simple;
	bh=0EbaZGBCGAlDdaBpz5q6jU7//pUs+PQe1Irem1Hb25U=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gEe5KKUbH44o2HZJv4dgRMvNT1TJ/eKlh/qmB2OTqCjM1G5LTRfgU0Ib8rCrPY5yXyOPq8+GYB3T3AvuZ38z/Thh9vyYuU63s+T8xsUW4Our/Wq8o90p8oSBK/qk8wWSdSinB0Af48QgTbLEFjsJN3H6/+oRsQxehwYu6XJ3BBU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=G3iN3ZOH; arc=none smtp.client-ip=209.85.210.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-pf1-f177.google.com with SMTP id d2e1a72fcca58-70aec66c936so3225243b3a.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 09 Jul 2024 00:09:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1720508963; x=1721113763; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=ktSm4q1vxdmtkavfLnfXdh6fXORXctBwSCyUPkuRKh8=;
        b=G3iN3ZOHopm3mtgq9x4VbtBLd7+87pueMbEYcQnnSp50fQkEH9BunryS3idlc32bpT
         lICEHU3GZHkY6Fwt7b9n/M5TKQFOVUQZvoD74yUU+EpI3lFFb8632YEi03ZfU+Qi5bnJ
         4idXjAj9chCnjQ10t+syErNh4P75UXzPKEs+Tz59s2qZo2Ovi/589E5YmZu8JIV+LHKy
         jzKgFEDncvzG8JmfsCPJJ8u97LtgXRSHL1jyNzPe7YOmQZSklLEXEV/3FUMbBhu+vgi5
         2aS5lOpQPue0NMExEIelXgPamT6oLqKd1j2UffxQpiGZKmHarRAwnIy17hJ8C0wWXYgb
         mLoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720508963; x=1721113763;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ktSm4q1vxdmtkavfLnfXdh6fXORXctBwSCyUPkuRKh8=;
        b=i7BtQbz66g2OgP64dAi1KkVOfJ6S2YE0GlxA9IixOZkKenoE25SQIxW8PDTuzfhbs/
         sohemkapmHrVOd+gamRtIuQH4oVk0kDUh0MWZCcxORAjE2U2bZb2LUvxEJei/yZCjHIs
         rI+wykXxmscrMlEt5NeUzfnFPfE2y9m0coLojkLyRaDBojIapQ7ajQMey5CYSwpsZMo3
         /INnZXVIVL7qgV+7JjZjf97SLji2N3oFzMhsFVoX5BdNgULfGxBx3Wu9HxwmB+2rnaVW
         HwtdpyJSbrk0HTMa4HpGGg3my3EAnFh5vUnPROhmqVKi+RrlhrmhmQMqSWWkLH2oYhbA
         Ys4g==
X-Forwarded-Encrypted: i=1; AJvYcCXqkSigdyYJZd3L6WEtLTZGrnT4e7KOkBuzbwXEQNDVg/nhcs7EYiQ0HuWYL1QeMMQ0HWyHg3ZlLlPPDKWQIhB5/+F0u7Zs0kXBP1N2ww==
X-Gm-Message-State: AOJu0Yy3z+wApOT+UmhoTEt0XP0IOGpOLGuZDfb30iOdRepK599muJuT
	x1X8j0wJ5LMLCUE7pTjD+C1GdikxmGAb7GeLH4TPfYZhf1b0vinVxwFTPbhYNg==
X-Google-Smtp-Source: AGHT+IFqpYgrrt5uc3kzJJ3RWffhZnZTxn37z39ek238VkDPJg7zYx6wk2uXBCCVizNNoOnNVTUF1w==
X-Received: by 2002:a05:6a00:2352:b0:70b:1525:9adf with SMTP id d2e1a72fcca58-70b4364fe15mr2135383b3a.22.1720508963273;
        Tue, 09 Jul 2024 00:09:23 -0700 (PDT)
Received: from thinkpad ([120.60.141.33])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-70b438c27b0sm1064532b3a.64.2024.07.09.00.09.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Jul 2024 00:09:22 -0700 (PDT)
Date: Tue, 9 Jul 2024 12:39:15 +0530
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: Varadarajan Narayanan <quic_varada@quicinc.com>
Cc: lpieralisi@kernel.org, kw@linux.com, robh@kernel.org,
	bhelgaas@google.com, quic_krichai@quicinc.com,
	linux-pci@vger.kernel.org, linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1] pci: qcom: Fix 'opp' variable usage
Message-ID: <20240709070915.GA7865@thinkpad>
References: <20240709063620.4125951-1-quic_varada@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240709063620.4125951-1-quic_varada@quicinc.com>

On Tue, Jul 09, 2024 at 12:06:20PM +0530, Varadarajan Narayanan wrote:
> qcom_pcie_icc_opp_update() calls 'dev_pm_opp_put(opp)' regardless
> of the success of dev_pm_opp_find_freq_exact().
> 
> If dev_pm_opp_find_freq_exact() had failed and 'opp' had some
> error value, the subsequent dev_pm_opp_put(opp) results in a
> crash. Hence call dev_pm_opp_put(opp) only if 'opp' has a valid
> value.
> 
> Fixes: 78b5f6f8855e ("PCI: qcom: Add OPP support to scale performance")
> Signed-off-by: Varadarajan Narayanan <quic_varada@quicinc.com>

Fix was already submitted: https://lore.kernel.org/linux-pci/20240708180539.1447307-3-dan.carpenter@linaro.org/

- Mani

> ---
>  drivers/pci/controller/dwc/pcie-qcom.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/pci/controller/dwc/pcie-qcom.c b/drivers/pci/controller/dwc/pcie-qcom.c
> index 26405fcfa499..2a80d4499c25 100644
> --- a/drivers/pci/controller/dwc/pcie-qcom.c
> +++ b/drivers/pci/controller/dwc/pcie-qcom.c
> @@ -1443,8 +1443,8 @@ static void qcom_pcie_icc_opp_update(struct qcom_pcie *pcie)
>  			if (ret)
>  				dev_err(pci->dev, "Failed to set OPP for freq (%lu): %d\n",
>  					freq_kbps * width, ret);
> +			dev_pm_opp_put(opp);
>  		}
> -		dev_pm_opp_put(opp);
>  	}
>  }
>  
> -- 
> 2.34.1
> 

-- 
மணிவண்ணன் சதாசிவம்

