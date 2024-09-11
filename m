Return-Path: <linux-arm-msm+bounces-31488-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 5657B97500F
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Sep 2024 12:49:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 8919E1C21341
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Sep 2024 10:49:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 05F5D17C7C4;
	Wed, 11 Sep 2024 10:49:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="sLj84R4L"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com [209.85.167.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 248DF153820
	for <linux-arm-msm@vger.kernel.org>; Wed, 11 Sep 2024 10:49:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726051793; cv=none; b=O7cG5/NT58c+IhthOe5bCuLtWNTk59ZBX5SqrhNuGkNrntwtue3AMWt+6MT+l6WmFhApolhPD7vVAo8FpLp+hJdfBaLe7ILIMeCrSP7UJ5HPEdwx6cEELUT6pqBRjEIa9mD04IbXXcoyewGryYZ1wKRc/Xc+LzZhTVvBFNvhfFg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726051793; c=relaxed/simple;
	bh=6jk1T8pPWMOU+46Ik3tfaMzJ8N9cAydR0aEM6Ac55HQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Z+G7yzSR9tWI899WJ9Wvf71lT5mRfpuLDQskKhQvlWkJJ/Q+Twyfmmxd1/5KTEvO1U/T5ntFwxBbkO39tUPJLsVDirKS13mGs1KKd3Yq1aGAq5WYV61BYRaRwJ+oCvquA8eMNzgYAE2T1xOnh+HySEOXXgVAwBgPP/xvsIyxHZ4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=sLj84R4L; arc=none smtp.client-ip=209.85.167.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-536584f6c84so6879221e87.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 11 Sep 2024 03:49:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1726051790; x=1726656590; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=fcAhImD9Bcs+LwlPVoU6CG8toj/rCqCTWdL8dKrlpTk=;
        b=sLj84R4LetuYtbRPlzhqiT1oHUCtJjMY3LkcK9YwKv2NbYGjrQ6Q5/RPDw/NycFeN5
         FyF5ATeZIsR2/gUvG2zgUt3Esk4MrPTkFWSge2XcYs0yF+nhQZgHZGDgInhpbob4qYpW
         Aj4+OvkOOHnPFDO/dXwrjHtSH3vD3MrK523f7E7daQuUyu+FxvT30SO0s9SSfrhRJGdw
         4k9xutiQnFFXVmpRzYJpGJryLTun91dKmOYw9NZZZalL5j1iRZ6ORFbDzRlg6hH5HqPq
         11zSNLemYVOL6S0WFoiauVz7wooeKA6hxZB+T14fSpG1ZBuj50LJXnXwXb/D3FgsSXmW
         +luQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726051790; x=1726656590;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fcAhImD9Bcs+LwlPVoU6CG8toj/rCqCTWdL8dKrlpTk=;
        b=aDRYOuvrbT/URY9zQy59gFZsuG+hIJkt9H7CGquvw/3xggzqQIo9U3/YhLCuS6wwld
         6b+B3zVChFwsNJel2MQ3ktPSFyK/Ol4E6ZzzOeaqwglB9YaU6zE2KrLn0SWc8Kjhlium
         Qmdv/kQFgTZgK8YEG6d+EtkUtao1ND+fnDgm9sjRcUZlUKuPLLdDKh5jM0/Q44nGW0ZI
         vps10auzPVlnxgXGmg/vbNcY9OMFHk2YE03oEDKXqxRP0i0DDJF4vNWo4V7LEckzdeyj
         PD2uebLPDdnTT5YXKsE3rDCGOZpZcjdJNXyx603C+xBPngnr4k4AMIAmyO1j1DCdDzWi
         yqvw==
X-Forwarded-Encrypted: i=1; AJvYcCVRer9r0LdBYHrEZ0eC9xzr+GI/M2n10I2qYwv9GQWRWK/l/zv4hR8vGZHH6+yYsEWbVD5rSaFBHFXUg7Ju@vger.kernel.org
X-Gm-Message-State: AOJu0YyseAsO0tC9oG5Grj/MgwwIJVTbQKUbmEsppwYj0CfhJ3hswJc/
	SL47hEIgQEG17D207zzjS/HeRVc7Uuk9CHkLNoNphLpp2CpMfUnz8yGyzkKuqkZySyzv+retqGH
	+
X-Google-Smtp-Source: AGHT+IH2LTX3JBcTJKTOzy1HqfGc93h8XxwP33R28x2NFSYb3nCH7X4NA7Rjb2b+14DJebCtmVJNiA==
X-Received: by 2002:ac2:4c4a:0:b0:52e:fefe:49c9 with SMTP id 2adb3069b0e04-536587c5fe5mr11756251e87.36.1726051789849;
        Wed, 11 Sep 2024 03:49:49 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5365f868d64sm1502240e87.55.2024.09.11.03.49.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Sep 2024 03:49:49 -0700 (PDT)
Date: Wed, 11 Sep 2024 13:49:48 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Andrew Halaney <ahalaney@redhat.com>, 
	Elliot Berman <quic_eberman@quicinc.com>, Rudraksha Gupta <guptarud@gmail.com>, 
	"Linux regression tracking (Thorsten Leemhuis)" <regressions@leemhuis.info>, linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: Re: [PATCH v2 1/2] firmware: qcom: scm: fix a NULL-pointer
 dereference
Message-ID: <kdyt5iwqygr535hhv23pfj5mwntcqteck3bi5573lfauuc3prl@7z4cxll4knsq>
References: <20240911-tzmem-null-ptr-v2-0-7c61b1a1b463@linaro.org>
 <20240911-tzmem-null-ptr-v2-1-7c61b1a1b463@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240911-tzmem-null-ptr-v2-1-7c61b1a1b463@linaro.org>

On Wed, Sep 11, 2024 at 11:07:03AM GMT, Bartosz Golaszewski wrote:
> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> 
> Some SCM calls can be invoked with __scm being NULL (the driver may not
> have been and will not be probed as there's no SCM entry in device-tree).
> Make sure we don't dereference a NULL pointer.
> 
> Fixes: 449d0d84bcd8 ("firmware: qcom: scm: smc: switch to using the SCM allocator")
> Reported-by: Rudraksha Gupta <guptarud@gmail.com>
> Closes: https://lore.kernel.org/lkml/692cfe9a-8c05-4ce4-813e-82b3f310019a@gmail.com/
> Reviewed-by: Konrad Dybcio <konradybcio@kernel.org>
> Tested-by: Rudraksha Gupta <guptarud@gmail.com>
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> ---
>  drivers/firmware/qcom/qcom_scm.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry

