Return-Path: <linux-arm-msm+bounces-37111-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DA9A9BDF7A
	for <lists+linux-arm-msm@lfdr.de>; Wed,  6 Nov 2024 08:37:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 542E61F23696
	for <lists+linux-arm-msm@lfdr.de>; Wed,  6 Nov 2024 07:37:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 610611BE226;
	Wed,  6 Nov 2024 07:37:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="mXpxlDey"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com [209.85.167.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B08D81BBBF1
	for <linux-arm-msm@vger.kernel.org>; Wed,  6 Nov 2024 07:37:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730878630; cv=none; b=qsizrHVeHDv61wjlQffFfRkerjOvkt8RNsgsBKd6En3TTiQkHdw0KpRVZiWh7M0J0YdeHNOvVZrzSghX2Mv9nxOZpqA3r6wWU59wPdeG3H/sjXdOCZazif+RaUyoSvXLFQ1Fig55cUG28P6XnYm4abk6PpKWsf5M7IqUtY+WVV0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730878630; c=relaxed/simple;
	bh=T+IDxfnEDhIbzwhDwnYLVo8b5mJZHz3JOJrvtUZgZUQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lGDV6A35xshuP8HQTWG/Q2kYPqAU5p3jKUOweqxyhrQBvuKHlHhXLoMsnZO7JWCgLIIjHNh8x15yUUHIWoe8vIhMAdHwLulaSnMCW01JOSzQwF+wpj2jJDvdiV9FOZfUrtkRe8OLHvP8FNhtavjJ+MS1yixS2zl8LRqu5sqlElE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=mXpxlDey; arc=none smtp.client-ip=209.85.167.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-539f4d8ef66so7848062e87.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 05 Nov 2024 23:37:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1730878619; x=1731483419; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=1xBr3nMrr1f+V04w4SZ0IWUu6Cb5RyUO9D91ndFpL84=;
        b=mXpxlDeyB7/qoPH5Nmmk3gGt7jc/h/qhyodAN9BdeRkI719HVImXmCbYHm35JItEjR
         hxS1wnDq+LXFC6EdgvM4VkJE71u7HxRgDpm7bi9G3YKnWcl2KArfAL+vHe6XZgoAQaJn
         srUEwBK0zv5Wsii3oGLrVwZ/sBAcJe08+T/xXH1nuusUr5TSWSAjdPW4KN+ul7OkfuDL
         pIC3W+2dHU/hjAtE1AqudlZF2lCIwMk6zkPAErgUh4BKerd9Ke1Qc8uZTn7lFDsE6ZDp
         CXaIjUvmzHXEb/1N5tHmkqNvvpVHwsd6oiD9i47Oa5s+hxwzdZWYDcJRPhb1doqO3Bq3
         LpdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730878619; x=1731483419;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1xBr3nMrr1f+V04w4SZ0IWUu6Cb5RyUO9D91ndFpL84=;
        b=MtnWianm+UCMWbfgOq/nQelhmkzUPGB9/wyVzHbSRCLITZudGCuPZkdSn8qxEr773Y
         nScLBCKPniMhUAC3LMnIx698oXLIlwhObtEtE5QgzcD51Wkf8K+iC4khQbQogQm3IAgf
         Jy1Zc+R80mwyQAF/1KZpfizbDVyUwuGMZsK0XRFrIumtUMWt6IFtoXfJmsXTE4+uL6Jf
         irgqlgTQBiGBM1x2J9oXPVJSstOBn4FqK1Go5lHbu7gebTn5wnYgKsUpAJaIeCFpUkq7
         lXzEqdoUppAAwYBec3ENVnhYRC+PC76/J0zv2xnILu5Kmwp0XT5OSSX76jS9bcQ5y+0l
         8gVA==
X-Forwarded-Encrypted: i=1; AJvYcCVX2qu2BPVgQsa4qzvEpgLtBN6xJJ1UtgiXa5JtoUV+lRsasD7P2HOZ97lsC1huq66lv+try/D1sthdntq/@vger.kernel.org
X-Gm-Message-State: AOJu0YxEEnusiPa07AONDgUpGMDl3O8sVPIHlmEDpFtakR6ZKBNinsZH
	aGYdoWjHL0dktt3nlnt9rN/gbDCLY5UX3Vc3ygFrr5QbjmktiLFIqfZARxmpJ3M=
X-Google-Smtp-Source: AGHT+IFYDqIISjoUL85nMRIGPu671NngEQq2CYpjOQlQooiQOP6StYmNoX9XGKAhYB1b9IQWouSWdQ==
X-Received: by 2002:a05:6512:4020:b0:52f:c13f:23d2 with SMTP id 2adb3069b0e04-53b3490ed8fmr18329343e87.25.1730878618811;
        Tue, 05 Nov 2024 23:36:58 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-53c7bc961dbsm2398693e87.43.2024.11.05.23.36.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Nov 2024 23:36:57 -0800 (PST)
Date: Wed, 6 Nov 2024 09:36:56 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Yuanjie Yang <quic_yuanjiey@quicinc.com>
Cc: ulf.hansson@linaro.org, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, bhupesh.sharma@linaro.org, andersson@kernel.org, 
	konradybcio@kernel.org, linux-mmc@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, quic_tingweiz@quicinc.com
Subject: Re: [PATCH v2 1/2] arm64: dts: qcom: qcs615: add SDHC1 and SDHC2
Message-ID: <347uhs7apex3usmfpzrpwakrzchxactwtc7gs45indkzez2vfj@n75dc3ovl3g2>
References: <20241106072343.2070933-1-quic_yuanjiey@quicinc.com>
 <20241106072343.2070933-2-quic_yuanjiey@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241106072343.2070933-2-quic_yuanjiey@quicinc.com>

On Wed, Nov 06, 2024 at 03:23:42PM +0800, Yuanjie Yang wrote:
> Add SDHC1 and SDHC2 support to the QCS615 Ride platform. The SDHC1
> and SDHC2 of QCS615 are derived from SM6115. Include the relevant
> binding documents accordingly.

Which binding documents?

> Additionally, configure SDHC1-related
> and SDHC2-related opp, power, and interconnect settings in the device
> tree.
> 
> Signed-off-by: Yuanjie Yang <quic_yuanjiey@quicinc.com>
> ---
>  arch/arm64/boot/dts/qcom/qcs615.dtsi | 198 +++++++++++++++++++++++++++
>  1 file changed, 198 insertions(+)
> 

-- 
With best wishes
Dmitry

