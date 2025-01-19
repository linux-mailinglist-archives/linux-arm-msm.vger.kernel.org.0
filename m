Return-Path: <linux-arm-msm+bounces-45524-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BF21A1630C
	for <lists+linux-arm-msm@lfdr.de>; Sun, 19 Jan 2025 17:58:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E12E21883027
	for <lists+linux-arm-msm@lfdr.de>; Sun, 19 Jan 2025 16:59:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A5AC5184;
	Sun, 19 Jan 2025 16:58:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="tMZbzl1W"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7D0F1DF963
	for <linux-arm-msm@vger.kernel.org>; Sun, 19 Jan 2025 16:58:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737305936; cv=none; b=uk2f5Q8ycF/vhqOLxoW9GA7iZdbSm4QLYxYb6y9BdoRqdCAzu+oV6tMgg2i8MZtEJse6ytxlg4vqGTKuKzMH5S5BxmGmIJu+JPJWPZkmqe47Sgz/FMk3MsmQqbbN892Ttt7lHKJAE8sBUv64SOL1ZaHXuztTkzxvjRvw8R9HXe8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737305936; c=relaxed/simple;
	bh=rTPVX7g6+5V7kg4sL9D2UEKaBuRnihS5beTdkHNdRWQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=N+DHb7UyiLy0ewn0KEoE0S25SRpM/vXxILbxg3BVmio2ZookDlzDJicKHi7QUsiaghvke34Ak6J8JSCVw/t9ihiKgTRTui+xgaauD6GUvchxNgUsN7oS/B1FGdhfT5gsXEr5BWxLtm+fVIfwZfqU89AN0Xkn6nSFliU8od5uE2Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=tMZbzl1W; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-43625c4a50dso25063035e9.0
        for <linux-arm-msm@vger.kernel.org>; Sun, 19 Jan 2025 08:58:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1737305933; x=1737910733; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=0bUiH3DTtIjUv2h0clSgTW/RbI7LvXj6i+Ro4eU+Pvw=;
        b=tMZbzl1WN3OtCAP73N51oq8G/peVe4ZYqjo8Mf/+JYNB7sMGU7gzuxYXYldkOjbESW
         XAnNq8f9a+nhqRfOvcsRQZ+xhAjfiAJqOhF4FvQE5JNE9PTNY7tAxIAb5O5YRm6nxcv7
         Kp66qAQKqf8Bqk/T6OgJu+W10ywTPdI//DIaRoYbfRF4t/Q/T3TYtdNikgypTWnBCyvh
         2P7UgZvd7Jlu8I66scvJ3wlOMUpkMRnXGSlkV0n01K5zYjUHQuMRQ6TDrICyYrsn4t0Q
         2iOLYD3GjorpJWwrOLGiUtg2BzMqgRk5nubRr+4lrTNWWDZq9sO3ofUEOUoTrZuh2xca
         cH7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737305933; x=1737910733;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0bUiH3DTtIjUv2h0clSgTW/RbI7LvXj6i+Ro4eU+Pvw=;
        b=EFaaOBGiULqa3qjtB+EsI7K4qLl0AQb/9wF7t8gyXTV4z/pIS+VjcHBwqd5sQPbmf7
         XbMBktga+N92qMbGwJ6mHHpghOogvp09bGdutI77hsmU9BUUocImuIxArswdq/1GVLpa
         rHwinmSnJw2T8yG6c7kTviIZVZQvjXgldqCErVHvvSUzcHBKt29RchfnczWzx7sQ3he0
         OQrMaRFE66C2tUpgW+CtCp/i0s4NrMsUzl0rO1wiNQmRmwlPstwr3JjhDdTzoF6aYnWg
         zcY0o9t9cf4jUB+L23kDIuxK+hMZbC2sUuXVXu+Qhp5fyhuxijKGOOIW9fk5JZjHV2Fi
         SiYg==
X-Forwarded-Encrypted: i=1; AJvYcCUO43V33uN3QXaW6LL73kCwWt8pSbihdYHs81VQRQg1NunRLl/Y9d1sg8pFqt8OE9+yyK8OeAu1sFSALUjN@vger.kernel.org
X-Gm-Message-State: AOJu0YwH5FnvJWpofoXI4uf509UQdRohs8uWzjSq40IX34x2RFY6skYZ
	cnd9/4wNhgK0lnLzNqCkqKqQZ+mse9gVfdYRDuLPxTrX8W1r9jcgs/mtmUer4p4=
X-Gm-Gg: ASbGncsZWxO+dr07zDgcU/RXEgCA+VL7YcN5uFwQz2dNpvVlQBuM4QIKJEyVbE9H1YZ
	MQ8ywFHCVsvoLz6NYC9E8n6SecpKwcdDYSp4l0KY0Yrcj91Q1W0bb/CA2CG1i4PHCzkIT/DOD68
	0cNk2BXcON1HVfqF7rskvEDv4ycszUyOeA/5W+tGhGVP8UW5APW9EpD8FvNdMDNPD7jIJAYhi+7
	XHNyMFJXiAsrCNzpSSRCXumpseBjpHZS8DD1v7OGdnG5dfZoUZJdej519cnmsGAo+xA
X-Google-Smtp-Source: AGHT+IHeHsXNV4t2dh8Irsrn+bIZjKOPMF25wKOhqLDhufsQpqXA53IvvKG/Hdtl5ztuWuISFWGXDA==
X-Received: by 2002:a05:600c:1c93:b0:431:5863:4240 with SMTP id 5b1f17b1804b1-43891429c77mr83819445e9.24.1737305932992;
        Sun, 19 Jan 2025 08:58:52 -0800 (PST)
Received: from linaro.org ([86.123.96.125])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-437c7527fd1sm169592465e9.31.2025.01.19.08.58.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 19 Jan 2025 08:58:52 -0800 (PST)
Date: Sun, 19 Jan 2025 18:58:50 +0200
From: Abel Vesa <abel.vesa@linaro.org>
To: Tudor Ambarus <tudor.ambarus@linaro.org>
Cc: Krzysztof Kozlowski <krzk@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Adrian Hunter <adrian.hunter@intel.com>,
	Ulf Hansson <ulf.hansson@linaro.org>,
	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
	"James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>,
	"Martin K. Petersen" <martin.petersen@oracle.com>,
	Eric Biggers <ebiggers@google.com>, linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-mmc@vger.kernel.org,
	linux-scsi@vger.kernel.org, andre.draszik@linaro.org,
	peter.griffin@linaro.org, willmcvicker@google.com,
	kernel-team@android.com,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: Re: [PATCH v2 4/4] soc: qcom: ice: make of_qcom_ice_get() static
Message-ID: <Z40vSsE5BB0OIfrJ@linaro.org>
References: <20250117-qcom-ice-fix-dev-leak-v2-0-1ffa5b6884cb@linaro.org>
 <20250117-qcom-ice-fix-dev-leak-v2-4-1ffa5b6884cb@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250117-qcom-ice-fix-dev-leak-v2-4-1ffa5b6884cb@linaro.org>

On 25-01-17 14:18:53, Tudor Ambarus wrote:
> There's no consumer calling it left, make the method static.
> 
> Signed-off-by: Tudor Ambarus <tudor.ambarus@linaro.org>
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Reviewed-by: Abel Vesa <abel.vesa@linaro.org>

> ---
>  drivers/soc/qcom/ice.c | 3 +--
>  include/soc/qcom/ice.h | 1 -
>  2 files changed, 1 insertion(+), 3 deletions(-)
> 
> diff --git a/drivers/soc/qcom/ice.c b/drivers/soc/qcom/ice.c
> index 79e04bff3e33..2310afa77b76 100644
> --- a/drivers/soc/qcom/ice.c
> +++ b/drivers/soc/qcom/ice.c
> @@ -262,7 +262,7 @@ static struct qcom_ice *qcom_ice_create(struct device *dev,
>   * Return: ICE pointer on success, NULL if there is no ICE data provided by the
>   * consumer or ERR_PTR() on error.
>   */
> -struct qcom_ice *of_qcom_ice_get(struct device *dev)
> +static struct qcom_ice *of_qcom_ice_get(struct device *dev)
>  {
>  	struct platform_device *pdev = to_platform_device(dev);
>  	struct qcom_ice *ice;
> @@ -323,7 +323,6 @@ struct qcom_ice *of_qcom_ice_get(struct device *dev)
>  
>  	return ice;
>  }
> -EXPORT_SYMBOL_GPL(of_qcom_ice_get);
>  
>  static void qcom_ice_put(const struct qcom_ice *ice)
>  {
> diff --git a/include/soc/qcom/ice.h b/include/soc/qcom/ice.h
> index d5f6a228df65..fdf1b5c21eb9 100644
> --- a/include/soc/qcom/ice.h
> +++ b/include/soc/qcom/ice.h
> @@ -33,7 +33,6 @@ int qcom_ice_program_key(struct qcom_ice *ice,
>  			 const u8 crypto_key[], u8 data_unit_size,
>  			 int slot);
>  int qcom_ice_evict_key(struct qcom_ice *ice, int slot);
> -struct qcom_ice *of_qcom_ice_get(struct device *dev);
>  struct qcom_ice *devm_of_qcom_ice_get(struct device *dev);
>  
>  #endif /* __QCOM_ICE_H__ */
> 
> -- 
> 2.48.0.rc2.279.g1de40edade-goog
> 

