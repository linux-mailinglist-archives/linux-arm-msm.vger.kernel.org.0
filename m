Return-Path: <linux-arm-msm+bounces-40400-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id D46149E47E6
	for <lists+linux-arm-msm@lfdr.de>; Wed,  4 Dec 2024 23:33:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 6BD991880473
	for <lists+linux-arm-msm@lfdr.de>; Wed,  4 Dec 2024 22:33:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 079A71F03F6;
	Wed,  4 Dec 2024 22:33:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="yHpxWdxC"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com [209.85.167.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E50E192D8B
	for <linux-arm-msm@vger.kernel.org>; Wed,  4 Dec 2024 22:33:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733351618; cv=none; b=kzMsKSYjDCsVf55I1kzCToeXvTtVzxfdcZDswd3m1q6XJyhiLc0612CZQBXKXinrFYO7tLJC4TQAVLNhYPU29+UKt9SK87S9N8IIuFERk2H5XD6G3NRXie43jYKM4M529TpeBfcUVIXri5dhRaH2W27vz9RWX/fIiJsKz9zMeUs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733351618; c=relaxed/simple;
	bh=db+eBbeeOwSwRMrB+GHo1wPKEqzB3v2TTN3uqBqJHZc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=joYLVpAnNtnJzT/WVibwYq43cgsyKqjbDclXSUVPJD7k3aZtbTNWWNnvo1Tn9B5gSw2NZnzTv+Bu2TDyI5H5fu/jw4LV02NUB3nW2OPoZcSsGlKGkcp1lrU3jCzoV1QwrjGrRm4jcxfNO8rfTuJcwBN49SS3PU8BJi06SEXvMk4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=yHpxWdxC; arc=none smtp.client-ip=209.85.167.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-53df6322ea7so372625e87.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 04 Dec 2024 14:33:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1733351615; x=1733956415; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=/ZA+/Ynbct9XmJ/pDgZLrlz4vByV1+ncrGt31MmPRsc=;
        b=yHpxWdxCKhFt8UvkEe6gcBgdkR5GuDHe2MXgs64CQoTIDiqEINp1+IS+75jyB8JVeA
         afCCTt0k6+RKH17QUILDfBw/eEAejkeXZxIegNkX4yJc9uNoqPkehmvutVj+j1DhiZIt
         9eWH2TwzDUX7MwtZWix0atNcx52WA5tdG4C777T9IHEr1r1yG1ZatiQ+aQnR9dWMH4EN
         Qmsl4qRaDyINAWJb32EcMDgQA8W5CznsVaOVCbijX8v6x2mTD0XjfTpowHYWTR/c38S+
         mMm5744XsH5V5fL+oosf+jw5hIkyRAQIOHrNWU9KFrQAKZX2JhRQOi7mJGjiZq28xPD+
         BNdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733351615; x=1733956415;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/ZA+/Ynbct9XmJ/pDgZLrlz4vByV1+ncrGt31MmPRsc=;
        b=p5Cyx2gu06t83nVwbvdERHTnshL6Ef3cXVDebiVdGuWKwcmEcqDm2/Jb9zRiPBwow8
         TYWUWdRAhzzadc8a6tk+jSVK5AVJXn8ZjXdrht0MpUgwcWjzH3JdqOcWF8eIVBNsmDIq
         3h0XhAmRjfopU1e0ZYlmt9NWOsRnHSJqqC+aecoWp63WGpARwK++vA8/ZPvnp6mx9DXG
         ShPCMA2tSW62VskAvJRZG+bM1n7sh0GuTSssjslqtkJ6AZ0brdSTTsFBFHVoDmzXC7/b
         TY1/DxlYQ6LKGZxa67WPqyOxfzmLEINE+z4wdzfpZPFN3+Cg8FVyY1H4mTV9CS1LAlkk
         ICLg==
X-Forwarded-Encrypted: i=1; AJvYcCXUBRYeTVVNwcfGTCT3oVoJrrgObazvjlqTKFQGsowvZnXd2+sW9RKLtrfAdXNTmyYsb/i/qtOOhIoqNBq1@vger.kernel.org
X-Gm-Message-State: AOJu0YzlGHVeoIlQChKO15uVsD1yZKHGQRGVUJWb+OXodd/bFyO6VxAR
	M0xQ3SScW3uBqzkf1dHf/MaqfF/WwkW76cQ+72obPxTgxVWax98Hf7705HcDb48=
X-Gm-Gg: ASbGnctBLfuK6YilP2Jddw/YfdsrL+XWmVSAhHAmsE/ZTU8kLMGbO28fqQduv5wnVo8
	E4JmCcxXj1+SviQf3k0jihUWevlI9Cvuy6F+JjB7TosYjLVSScQkvzKLe7AR7hvoNrgxIeWxiX7
	hlkItS/Li8xZqNbyI0ZZ0OTFy5SGrcMzFlPr0ZICytrJ84rU5gYZelQB5zrGaPkg92YH3WSdnmc
	/2I6SBbcPi4nkkyCT1NZ1DXHUoYr3W2lUSnFpX29l13+6Kvh56/CmLHqZiOYfIdtG0OqlSpnFL3
	rVRyEQONCrvM5SDHq1Xbq2tV+mllvw==
X-Google-Smtp-Source: AGHT+IGQS+X6xxLW7rENTxfs/AsPLqM9/viSn6e/WXTrVzgckr92jwEcQHj1cg2TaCS9ztS2W2MXkQ==
X-Received: by 2002:a05:6512:12c5:b0:53d:85dc:7c58 with SMTP id 2adb3069b0e04-53e12a3932amr6597198e87.50.1733351615312;
        Wed, 04 Dec 2024 14:33:35 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-53e229bada0sm21317e87.168.2024.12.04.14.33.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Dec 2024 14:33:34 -0800 (PST)
Date: Thu, 5 Dec 2024 00:33:31 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Melody Olvera <quic_molvera@quicinc.com>
Cc: Bjorn Andersson <andersson@kernel.org>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Taniya Das <quic_tdas@quicinc.com>, linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 6/8] clk: qcom: Add support for GCC on SM8750
Message-ID: <s7kuwinorqu7i6sdhwqjftcawa65szzze2bhczgpmuqp4dkids@jsa6dthf3omj>
References: <20241204-sm8750_master_clks-v3-0-1a8f31a53a86@quicinc.com>
 <20241204-sm8750_master_clks-v3-6-1a8f31a53a86@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241204-sm8750_master_clks-v3-6-1a8f31a53a86@quicinc.com>

On Wed, Dec 04, 2024 at 11:37:18AM -0800, Melody Olvera wrote:
> From: Taniya Das <quic_tdas@quicinc.com>
> 
> Add support for GCC for SM8750 platform.
> 
> Signed-off-by: Melody Olvera <quic_molvera@quicinc.com>
> Signed-off-by: Taniya Das <quic_tdas@quicinc.com>
> ---
>  drivers/clk/qcom/Kconfig      |    9 +
>  drivers/clk/qcom/Makefile     |    1 +
>  drivers/clk/qcom/gcc-sm8750.c | 3274 +++++++++++++++++++++++++++++++++++++++++
>  3 files changed, 3284 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry

