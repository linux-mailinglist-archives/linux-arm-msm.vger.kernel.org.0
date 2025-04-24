Return-Path: <linux-arm-msm+bounces-55276-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id EEBAFA9A2D0
	for <lists+linux-arm-msm@lfdr.de>; Thu, 24 Apr 2025 09:04:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 03B457A2E5E
	for <lists+linux-arm-msm@lfdr.de>; Thu, 24 Apr 2025 07:03:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4C21B3FF1;
	Thu, 24 Apr 2025 07:04:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="XgJUaZ3P"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4BE951C5499
	for <linux-arm-msm@vger.kernel.org>; Thu, 24 Apr 2025 07:04:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745478259; cv=none; b=OhhIg1JfvbE6QMx8FfpHjSKsBSd2IfODWXyURj9G632DtXLPKmoFDMgRlHidYR11E0QAZKWCrXYoCwQJYMNOD+Lgy/jGupJ2S4HjbPCvRCA1WKD4UKLpNysRzukziGPTxKCjPv8pxXpyr/vah/FDgxfs6kfrRTOOi3QDuaR4i8g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745478259; c=relaxed/simple;
	bh=SvckNjKAAS7pT0RVb3J0/SrYkdOGfTe2ytVtg9wz3bw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ciGfl1lHnCvPOMpsrKUNxpy7zxHwkLAMwStagyihQx5xfFJBMS1nQ4Glz4RQeu5UIh9/lTal2y2R/nPIBA4CgGxGb6f2TT16Z5T8LiAluWGdNlrI+YzFWUlX3MtRDCZ0/G8ZJYjXVRxVuc7RLXher9Zwc2ovR7YOfgc0Cv5AXTM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=XgJUaZ3P; arc=none smtp.client-ip=209.85.218.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-ac28e66c0e1so92475966b.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 24 Apr 2025 00:04:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1745478254; x=1746083054; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=D1iRaF8DEz7JFVtNCWSp0T0HzrBBP76McD5zA/V6IhY=;
        b=XgJUaZ3P2rJEUz2ZRkeP4ecUt6k3Vmz6VJNC8emBdPOfEwVU3CQEf5w40241IiY1dH
         biz6pY7EMA32SRpmFqI9JILY55qFBeJRMYoZxx1h3Qjx71hbOQEaaBNZyEdcLNoa95TB
         csBgH4lsGaZmi2udRjn1dbu0UlxFT0Z/Zzg1d+WN0pwgVtQA+PIIEZDWlO7vc1vo6tln
         3Qbm3uvlKRQm61Bjw1YF5qfCH/TKJ0kfjvgvNrqFSEULlwrcMG9YcYSuVAG7QscjPXnl
         SgyvqvlWGejsBlz/YwKYEv4y9eZurRAyv8GkfCbtTIs0CsI7uulJirZiiRfYRKQlwbVI
         mzNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745478254; x=1746083054;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=D1iRaF8DEz7JFVtNCWSp0T0HzrBBP76McD5zA/V6IhY=;
        b=ma91tGAGrNIawtMoY693kq8n6pmDxT1m3+vIe/Ffd9gLZ6o02hceTTCfEJ3GTBR8/F
         IV2RbOTBLl3e9KfjBO0Bf8yLOjHf2kAQDXNrJHnMwnvCtCHVYJDdYBAOdtpiglOBxprN
         J/ML6JJjn3j/b0haZONmG40Ggope5qL/GVOTGHMwVSiAA105VFM3GuNB4mJwZXa3qOJD
         ECRm/o7MAs8qbPhu0uK90Q9jtm3TztGQWhQJ+hFLR8Nl6kTSt7pGd81Csu+n8DLb8CwS
         MYG81uRcGB944DNk11e2GdFh+Cd0hRZaELcmkdKcY7p74RDTuBl9vMtJwxWbidibf+V+
         knDg==
X-Forwarded-Encrypted: i=1; AJvYcCXwYccml2xIjCOgMTTZI6osnWTd6Fb2TjcXgtwflPkvRNew6Im+V3biltxO2YbU7afxMMPUxKTPvxiCdKwt@vger.kernel.org
X-Gm-Message-State: AOJu0YxDZHmI3jQ1m7+r+9EQKQSmRGSWngfZlIcBH666SyGxYWK/lqF6
	vo8qDsVRBf4h5BNhUFcng5U052kk/No277q7mI5pbSNL0oomvtnTLJkG2lATpYE=
X-Gm-Gg: ASbGncvwUbVdS/HCqIn/2BCdgfi9b6xGoSnVlRGcnNLlTc29ZO6e3ai9hQofAcixijn
	pAPLOJRLA1vtDYiaZeSF44WsbGrL7/S1fz8D3kaxNWgF0zI1pCLyncI6hEjwXT68FLrEOLZxXlR
	aufiZaPXcJiyoRh590dNlBm0Bvy8rWH1ArS6TWYBjjhIK6F8kL5U1bx4NMFKk/IZgUHC7MZ0I2H
	ikl+NRBkQb61xTYmVwI2zqYIM9MfN0gueE+rFBFzC6+pBUIBESAS4ANYROXTqOpBlUYoHgBm2Hb
	YZIN3ZT1+Z/QFwt6UsBe8+K0xyfzYPDA5M7/wQ==
X-Google-Smtp-Source: AGHT+IE/3mNCR4/4NZlHXiIHHU6zr3VRymMPMYgsCSGHm3hUjKJCoLnIAqlX7BK+6k+UO9+ZElCHuA==
X-Received: by 2002:a17:907:728d:b0:ac7:d0fe:e9e4 with SMTP id a640c23a62f3a-ace5725cefemr166986266b.19.1745478254508;
        Thu, 24 Apr 2025 00:04:14 -0700 (PDT)
Received: from linaro.org ([62.231.96.41])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ace5982cc9dsm59444366b.18.2025.04.24.00.04.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Apr 2025 00:04:13 -0700 (PDT)
Date: Thu, 24 Apr 2025 10:04:12 +0300
From: Abel Vesa <abel.vesa@linaro.org>
To: Arnd Bergmann <arnd@kernel.org>
Cc: Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>,
	Arnd Bergmann <arnd@arndb.de>,
	Johan Hovold <johan+linaro@kernel.org>,
	Krishna Kurapati <quic_kriskura@quicinc.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@baylibre.com>,
	"Rob Herring (Arm)" <robh@kernel.org>,
	linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] usb: dwc3: qcom: use modern PM macros
Message-ID: <aAnibPAln1kS+KHO@linaro.org>
References: <20250423162613.2082417-1-arnd@kernel.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250423162613.2082417-1-arnd@kernel.org>

On 25-04-23 18:26:09, Arnd Bergmann wrote:
> From: Arnd Bergmann <arnd@arndb.de>
> 
> The use of the old SET_SYSTEM_SLEEP_PM_OPS/SET_RUNTIME_PM_OPS macros
> without __maybe_unused annotations causes warnings when build testing
> without CONFIG_PM:
> 
> drivers/usb/dwc3/dwc3-qcom.c:421:12: error: unused function 'dwc3_qcom_suspend' [-Werror,-Wunused-function]
>   421 | static int dwc3_qcom_suspend(struct dwc3_qcom *qcom, bool wakeup)
>       |            ^~~~~~~~~~~~~~~~~
> drivers/usb/dwc3/dwc3-qcom.c:457:12: error: unused function 'dwc3_qcom_resume' [-Werror,-Wunused-function]
>   457 | static int dwc3_qcom_resume(struct dwc3_qcom *qcom, bool wakeup)
> 
> Change these to the modern SYSTEM_SLEEP_PM_OPS/RUNTIME_PM_OPS/pm_ptr
> macros, which avoids the warnings and improves readability at the same
> time.
> 
> Fixes: 1881a32fe14d ("usb: dwc3: qcom: Transition to flattened model")
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>

Reviewed-by: Abel Vesa <abel.vesa@linaro.org>

