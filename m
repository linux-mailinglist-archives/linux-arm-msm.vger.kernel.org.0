Return-Path: <linux-arm-msm+bounces-32301-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 80596984792
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Sep 2024 16:22:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 12AD9B22497
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Sep 2024 14:22:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 853021AAE1F;
	Tue, 24 Sep 2024 14:22:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="W1DQUh6N"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ADEAF1AAE1B
	for <linux-arm-msm@vger.kernel.org>; Tue, 24 Sep 2024 14:22:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727187738; cv=none; b=hAKoBh8Zxex1WQo6AyWvXo/EYgcaa7w+/Mn7RN6pBETScADTz5zxiLIV2NnJnnnlrcocEiMT3u7lX0hN4wSZkyE9p3Mh32DIPnohfIB6oqECWMabHXd83FkN2Kk0yH3h8AbmvtuD0EpvSTh+dJLK7h1GA+/eje5A27LcFsHpDqY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727187738; c=relaxed/simple;
	bh=uAxN6+VoyYYMhj+61lqo2+k8kccuNE2ZJn0dLiJO43g=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Gf1JRFxBsuP6YzD/Axyc1UkOFsFguW092Hueudmn41V9qgAOkUIRU7tGaZFQmwcuU8VWt6tJ+jiZy6YSyUa7oi+0Lwk2KuTQYUuZq0pU040f/H6O/1TG1ABkjTyLcOmE4BpXV2bCKB8vfnm0bSmVNV7lfHyK1BNB7l/opX5lq8g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=W1DQUh6N; arc=none smtp.client-ip=209.85.221.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-374bfc395a5so3623999f8f.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 24 Sep 2024 07:22:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1727187735; x=1727792535; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=SRWKH7KMz/8+qviApEBtv1znQizOO2YNlrxsaNgC6xY=;
        b=W1DQUh6NC57QC+RaW6TEO+dj0V34qODwJy5csA2uf2rQWYDQIdUOF6rnSAM+kYIL7p
         NGiVuFJzOLX3KoQNQObSMdV3V/zhwc1TtGemZqB5LkUYzKoXiXZUwziaRiCRhaP7V8d9
         IPYsHN1otyq9L/fRCgxz2YJks32/4dfRac+MHX2m8GmGmIxnkII0RKfFDSF1vWrgvN44
         CHbj6mjZ09Y2Xvwr+hedJk/v0GJm4fcaGx7PBcVkSL0JWLNS/OgwV9D9apUkr2r3EmHR
         /dLsFA/qRbHZqfEKRWqSAGOd4LCMVsOIkIdyw0+BYAzkFDt7qSvS6V021nhvNY3k6bvx
         66JA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727187735; x=1727792535;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=SRWKH7KMz/8+qviApEBtv1znQizOO2YNlrxsaNgC6xY=;
        b=o1MjlBOyzeNFWo81MqfdMmGST5N9Ea2b8T2+t7H1ClFoaTwuMWgt/b/6IG8gMGOh43
         J0tP2Cai8bgVTzWYKxRVYJvhBIPcuxQpvgB9/8tbkEoFBB4XLhnMqp5uQ6U+F6uCPxl2
         wVWnIDlJKcgACHbYhCdmOD0DPRKty5f+bua/B2W/j8GY+Ip/SybuiZsoUuOUyxeILG+e
         R89Lr7oXyqdl0wO/vR0FPZ9XDhDe5lrAm/cdGKCoQxOFUFpn/u0NcNdJDY4hJrJ8EQ7N
         AvON32O10iaKTkTTOQ3S0nrx57L/irttOGeJ7Sead+gNfLFCmLPgIJKRk8u7/aMgA85J
         eCvQ==
X-Forwarded-Encrypted: i=1; AJvYcCWpEw7lSjLLjrPrqyarBU9ICjNayjU1hRSVezswDSMg/BWPU7J2OdplcCvZ6DHKu1O+nZzBrYP6Hu00nvTv@vger.kernel.org
X-Gm-Message-State: AOJu0Yx/zXU13esgFhi8AjDuFvHhvZ0xVG1L6OW1++NWA/g6mGr+dmF8
	eAjcMk+Tqr8AuSkXDmsfphJoC40o4F/3Tj46z8e7aYPlyx0pPO5QWm28pevlDQ==
X-Google-Smtp-Source: AGHT+IGiTm5gRFqQY30arxpbkSM6JJMWCg+AHPZ8mPYvJoLCgs0HQGxOHryh1NMShVUy4dhN+3W81Q==
X-Received: by 2002:a05:6000:459d:b0:374:c1ea:2d40 with SMTP id ffacd0b85a97d-37c7eb996e1mr2259340f8f.1.1727187734954;
        Tue, 24 Sep 2024 07:22:14 -0700 (PDT)
Received: from thinkpad ([80.66.138.17])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-42e754ce37bsm158894715e9.48.2024.09.24.07.22.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Sep 2024 07:22:14 -0700 (PDT)
Date: Tue, 24 Sep 2024 16:22:13 +0200
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: Jingyi Wang <quic_jingyw@quicinc.com>
Cc: Jassi Brar <jassisinghbrar@gmail.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, quic_tengfan@quicinc.com,
	linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org, quic_tingweiz@quicinc.com,
	quic_aiquny@quicinc.com
Subject: Re: [PATCH v2] dt-bindings: mailbox: qcom-ipcc: Document QCS8300 IPCC
Message-ID: <20240924142213.7jeuy2jwik4bm43i@thinkpad>
References: <20240911-qcs8300_ipcc_binding-v2-1-ca15326c5d0f@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240911-qcs8300_ipcc_binding-v2-1-ca15326c5d0f@quicinc.com>

On Wed, Sep 11, 2024 at 03:25:15PM +0800, Jingyi Wang wrote:
> Document the Inter-Processor Communication Controller on the Qualcomm
> QCS8300 Platform, which will be used to route interrupts across various
> subsystems found on the SoC.
> 
> Signed-off-by: Jingyi Wang <quic_jingyw@quicinc.com>

Acked-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>

- Mani

> ---
> Changes in v2:
> - decoupled from the original series.
> - Link to v1: https://lore.kernel.org/r/20240904-qcs8300_initial_dtsi-v1-0-d0ea9afdc007@quicinc.com
> ---
>  Documentation/devicetree/bindings/mailbox/qcom-ipcc.yaml | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/Documentation/devicetree/bindings/mailbox/qcom-ipcc.yaml b/Documentation/devicetree/bindings/mailbox/qcom-ipcc.yaml
> index 05e4e1d51713..6323c3519a8a 100644
> --- a/Documentation/devicetree/bindings/mailbox/qcom-ipcc.yaml
> +++ b/Documentation/devicetree/bindings/mailbox/qcom-ipcc.yaml
> @@ -24,6 +24,7 @@ properties:
>    compatible:
>      items:
>        - enum:
> +          - qcom,qcs8300-ipcc
>            - qcom,qdu1000-ipcc
>            - qcom,sa8775p-ipcc
>            - qcom,sc7280-ipcc
> 
> ---
> base-commit: 100cc857359b5d731407d1038f7e76cd0e871d94
> change-id: 20240911-qcs8300_ipcc_binding-2d1c646185c5
> 
> Best regards,
> -- 
> Jingyi Wang <quic_jingyw@quicinc.com>
> 

-- 
மணிவண்ணன் சதாசிவம்

