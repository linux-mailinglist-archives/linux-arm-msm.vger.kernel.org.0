Return-Path: <linux-arm-msm+bounces-32625-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 8AA5F987BC9
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Sep 2024 01:27:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 446FD280CA5
	for <lists+linux-arm-msm@lfdr.de>; Thu, 26 Sep 2024 23:27:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 06AE91B0125;
	Thu, 26 Sep 2024 23:27:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="B8SyBWdJ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f174.google.com (mail-lj1-f174.google.com [209.85.208.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59076157A41
	for <linux-arm-msm@vger.kernel.org>; Thu, 26 Sep 2024 23:27:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727393239; cv=none; b=tCbbow4ZaHoWwqXab8zJEvZ5dia4fQmzvQ4U1NY77vBi+/UByCtr1BCj4l8o446UAQszW8A2LeUQXsPE7jpTYvO18JtYTEu6aqKtPF4oEVhYqcbaocMLeIpF11BoB9I4QYqnE4bVd6ibqfUIaVZi2xneIF6OvCbLh5iWu2nWBMw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727393239; c=relaxed/simple;
	bh=fx7K/mz4fikq62YLJ6+zsahiQDQ0OXGdABBlahkyUno=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rC72PKd71waihaBpu5VOR1I7/mCnD5VwKmhA8yqxAtTesDfZOnoGrU0FFbtYp7TZlEcUi/+z3vno0OPrMclZXM0+8XLk5eNKlcb1FdTHxo+hnaRcVOgVf47nb5T3abpkC41+Ne+w3qzhVYQfBoLqunvmOoqoNhgisy1TgbIph3A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=B8SyBWdJ; arc=none smtp.client-ip=209.85.208.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f174.google.com with SMTP id 38308e7fff4ca-2f759688444so15163721fa.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 26 Sep 2024 16:27:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1727393236; x=1727998036; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=IoNC6BVZ2fLi+HRsxToPea1sroQQFnP/kfPiFNU6dO0=;
        b=B8SyBWdJXtkqJXQZHz/rKBLhOvp6drMvcSF5/BlgrKRs43jEQO8AzraJZGFj2s/8C3
         uPH4rqpHMSg0cJZFr/KZ8//Yzy1Tmy0ns0cj/yBh9w5CcrcktKSLcrasbVXfBihXPCZF
         s5usJGJZ/+zAItL563ZOP79iaPRckPs0xSgwvPZcrHhjd4rs9DzoKNrPCC28T6cYMvb/
         4nUp1zqBmbWSnF/V4WoKVGQmjaKzEb0NBk9Z7JYqLo1bY388U2Hz11Gq8o2RjpWe7hg1
         raIpiS9TtNz9YsyBuv0lxb9Nd1KHMauquI185h+RrgcEib79Z8Xyr33tQErEQW3POldA
         mdhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727393236; x=1727998036;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IoNC6BVZ2fLi+HRsxToPea1sroQQFnP/kfPiFNU6dO0=;
        b=eyEZzcliqrNIGySIj9qVZEmSspihtxTaDJCyRxVXXM372P5YuWhRETcZhxkADANllm
         VWAr+nL+EbLE20y/Hlabp/SSPMYJJaJTfYgA9FcXyxhI9YQ425MN9hUx5o6bkNmS7nsS
         2ShaOuxEuPsBrEosEBUMcDCjo4730RxchnEB/V/9yJTzNsBOC/YrZMKFysofAMhZXCXK
         dJ7zNhA/p/jVq8romVQqQSKL6dSgEhCxYNnOn0T1rojSWOXFvGrAOxkojYJSNkD2IoiO
         qPQ1b0kJyEr+k5XBoDduZa1gUaUo3e28NwibtNQJA/JZFckQqYi3TR6s2+gY+NQKADws
         ap5A==
X-Forwarded-Encrypted: i=1; AJvYcCX+05+4zdq7uFEEjpHcwXpD9MiamiyBgh2xqrCsBESrmvNHSF0tU2VWcZIsCrAP/Ew5oADrMSoeUWKvfqgc@vger.kernel.org
X-Gm-Message-State: AOJu0YwSGlikjN3NZHM6LEMps/klGDjC95VoRlbKf9mnk7ZXlnUKVWFj
	N9hFaiX6MENXbY+qJv9YXZli7LVTAUBdczx2+8sxiGMBvvzTNMEGgoUyKCo7GbDO7vF6pNBuHrM
	5BqL5iA==
X-Google-Smtp-Source: AGHT+IEcGx8oLV0iBIEWwnPzrMO/IAKlzV3D62xAJBneYKfVCJ6Ui9C9iNqsavwlpr9+gA7xcn6JbQ==
X-Received: by 2002:a2e:a54f:0:b0:2f7:6e3a:7c1d with SMTP id 38308e7fff4ca-2f9d3e497ecmr7502781fa.15.1727393236491;
        Thu, 26 Sep 2024 16:27:16 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-2f9d45e1b4esm1121041fa.64.2024.09.26.16.27.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Sep 2024 16:27:15 -0700 (PDT)
Date: Fri, 27 Sep 2024 02:27:12 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Min-Hua Chen <minhuadotchen@gmail.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] regulator: qcom-smd: make smd_vreg_rpm static
Message-ID: <2j64vxito7j6zoq37cdliekkotrjzr65ohck4e7fkehy3y3ji7@t2f7g2niaohr>
References: <20240926231038.31916-1-minhuadotchen@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240926231038.31916-1-minhuadotchen@gmail.com>

On Fri, Sep 27, 2024 at 07:10:36AM GMT, Min-Hua Chen wrote:
> Since smd_vreg_rpm is used only in
> drivers/regulator/qcom_smd-regulator.c, make it static and fix the
> following sparse warning:
> 
> drivers/regulator/qcom_smd-regulator.c:14:21: sparse: warning:
> symbol 'smd_vreg_rpm' was not declared. Should it be static?
> 
> No functional changes intended.
> 
> Fixes: 5df3b41bd6b5 ("regulator: qcom_smd: Keep one rpm handle for all vregs")
> Signed-off-by: Min-Hua Chen <minhuadotchen@gmail.com>
> ---
>  drivers/regulator/qcom_smd-regulator.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry

