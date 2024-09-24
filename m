Return-Path: <linux-arm-msm+bounces-32302-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id EA905984797
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Sep 2024 16:22:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 93E151F213B1
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Sep 2024 14:22:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 87E141A727B;
	Tue, 24 Sep 2024 14:22:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="WK/EJH4Y"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF2B11A76AA
	for <linux-arm-msm@vger.kernel.org>; Tue, 24 Sep 2024 14:22:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727187773; cv=none; b=jSeQaN1sH5xgRFwmh+QFJURoLzMb8rP9k06hoCBI8d3r3iyhJY0t5UfJtTWVvsZiq3GC8HzDrZsug6k8qRlRH5A1b82FljaAiBPcGm78FE7S6lMQV8+f3sVl6o7BJUPE+briV986ElvShl+icISgHaZMQ+xdW2Ga8lIDRbfp7FQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727187773; c=relaxed/simple;
	bh=Hs8CScpBEfYE4rCg0iZxpO4Br8KFrmFfugQINQ+4bY8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Lo57x3G1LmmX2uJvVyOYW6QMPWgfUYFYhiMRVNoweDNW7N5/+cXmgTxK/0+QNpoKfQFX72oBcUxTnv7h/jxkMSwwn+BMiKFkcPTtkX8h+mLDW9IOG3X+W6cjO+C4FMoQy7kxEvDRYZQblLsRQnykEt1JWsUqki8f8inBDqKniGs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=WK/EJH4Y; arc=none smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-374bfc395a5so3624696f8f.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 24 Sep 2024 07:22:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1727187770; x=1727792570; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=v7kppg7Q0WopvTHm3mYvO0b0XAFSW9Be8XsW5zt9bbw=;
        b=WK/EJH4YKuY25S80Y3pBEHKX9QZZg56tDdD/kVrF2eOU6lM5rXtzE2jEChu5JNmgg1
         G5D38RHxkSHW5Kf6MK7pQ7pVXmfJfqSRiQLuy6vwgaD0bs9e8aYDgqtmrHLWULU0FYU7
         hEI14lNEUQ/hWj3nXcfhNWSkIcT1hrB4Jrojm1/sURFBjh+UINQY063y04PkXxeY3kwC
         JhZAg7k1ChKz6wrffd8LGbFMyuGjuW43IMv4d4Axg6bXxMIwZnVoHGp944JEPvDD1acx
         DhUWsnfcDUV4c1EYCai28m9Bqe47Ac3qQxl8mf8n6DLlJZLAZP5p9z2fQNNQ0LMdelDh
         KtNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727187770; x=1727792570;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=v7kppg7Q0WopvTHm3mYvO0b0XAFSW9Be8XsW5zt9bbw=;
        b=HiWKQYqcV87R7NVTfYCyYqGT3uJAQXckHNnD3b/WEGmmRMfa+NCyiOpTnRX9uYHhew
         LHIqEvlaMMIjcMe3wYUDGyKc1Gw1sNOwwe6CZiYZ77kvLTVnnxPMXovTFG3Td5N0DzQF
         s09FE2r09D/YBTNsLiSxsVeol4g4qbqp3lz2uOujk8ajU/UaTNfz72/ez9X4pQDTElq6
         OZ/KsdfOzmxydboxXBD0frLxnQSpTDlvgx4hMAD+MBvLfwp5PqNdxPHfxKbBKUeQnbvQ
         EGrtbqtXglGbFjpu6Us9oD5EKdWfKDGNeBMGrvRmFhzHeo3OoAw6RLFqYMQjEiD/te/I
         vIiA==
X-Forwarded-Encrypted: i=1; AJvYcCXKmYunGzTXlcMl0GgWt/eAO0aJvFtg4QorUHsEiWWnWMoUw83ahmANbRICXuRFmkJRbKe75pTuENA+7nBJ@vger.kernel.org
X-Gm-Message-State: AOJu0YwmH3zlRJ1pRHuWmM49EExAXKUA0sDeyxBLFj/9R6mUEtfvfFwx
	khbZIIQ6X6XbQv/pAhWNwmo5/Uyyf0OOYdMwYKS7Im0FCjAsaFafTxH6YpJ6AQ==
X-Google-Smtp-Source: AGHT+IFRuDPewf36+EfX0flbkUrVtgaUGcAMED8IIOZ6mewqhDzvTH0iRhAd5jrDA6W6XVQQSwqvNA==
X-Received: by 2002:a5d:484f:0:b0:374:c57e:1ea9 with SMTP id ffacd0b85a97d-37c84e3ec85mr2074333f8f.18.1727187770262;
        Tue, 24 Sep 2024 07:22:50 -0700 (PDT)
Received: from thinkpad ([80.66.138.17])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-42e754a619dsm162094525e9.30.2024.09.24.07.22.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Sep 2024 07:22:49 -0700 (PDT)
Date: Tue, 24 Sep 2024 16:22:48 +0200
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: quic_jingyw@quicinc.com
Cc: Alim Akhtar <alim.akhtar@samsung.com>,
	Avri Altman <avri.altman@wdc.com>,
	Bart Van Assche <bvanassche@acm.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Andy Gross <agross@kernel.org>, quic_tengfan@quicinc.com,
	linux-arm-msm@vger.kernel.org, linux-scsi@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	Xin Liu <quic_liuxin@quicinc.com>
Subject: Re: [PATCH v2] dt-bindings: ufs: qcom: Document the QCS8300 UFS
 Controller
Message-ID: <20240924142248.a5bjev6wqmkwrbar@thinkpad>
References: <20240911-qcs8300_ufs_binding-v2-1-68bb66d48730@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240911-qcs8300_ufs_binding-v2-1-68bb66d48730@quicinc.com>

On Wed, Sep 11, 2024 at 03:06:36PM +0800, Jingyi Wang via B4 Relay wrote:
> From: Xin Liu <quic_liuxin@quicinc.com>
> 
> Document the Universal Flash Storage(UFS) Controller on the Qualcomm
> QCS8300 Platform.
> 
> Signed-off-by: Xin Liu <quic_liuxin@quicinc.com>
> Signed-off-by: Jingyi Wang <quic_jingyw@quicinc.com>

Acked-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>

- Mani

> ---
> Changes in v2:
> - decoupled from the original series.
> - Link to v1: https://lore.kernel.org/r/20240904-qcs8300_initial_dtsi-v1-0-d0ea9afdc007@quicinc.com
> ---
>  Documentation/devicetree/bindings/ufs/qcom,ufs.yaml | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/ufs/qcom,ufs.yaml b/Documentation/devicetree/bindings/ufs/qcom,ufs.yaml
> index 25a5edeea164..cde334e3206b 100644
> --- a/Documentation/devicetree/bindings/ufs/qcom,ufs.yaml
> +++ b/Documentation/devicetree/bindings/ufs/qcom,ufs.yaml
> @@ -26,6 +26,7 @@ properties:
>            - qcom,msm8994-ufshc
>            - qcom,msm8996-ufshc
>            - qcom,msm8998-ufshc
> +          - qcom,qcs8300-ufshc
>            - qcom,sa8775p-ufshc
>            - qcom,sc7180-ufshc
>            - qcom,sc7280-ufshc
> @@ -146,6 +147,7 @@ allOf:
>            contains:
>              enum:
>                - qcom,msm8998-ufshc
> +              - qcom,qcs8300-ufshc
>                - qcom,sa8775p-ufshc
>                - qcom,sc7280-ufshc
>                - qcom,sc8180x-ufshc
> 
> ---
> base-commit: 100cc857359b5d731407d1038f7e76cd0e871d94
> change-id: 20240911-qcs8300_ufs_binding-b73f64e16954
> 
> Best regards,
> -- 
> Jingyi Wang <quic_jingyw@quicinc.com>
> 
> 

-- 
மணிவண்ணன் சதாசிவம்

