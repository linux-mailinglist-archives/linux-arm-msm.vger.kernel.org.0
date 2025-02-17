Return-Path: <linux-arm-msm+bounces-48214-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D2BDA3847C
	for <lists+linux-arm-msm@lfdr.de>; Mon, 17 Feb 2025 14:23:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 755AE1882271
	for <lists+linux-arm-msm@lfdr.de>; Mon, 17 Feb 2025 13:21:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B47FD21B1BC;
	Mon, 17 Feb 2025 13:21:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Pr49oHJh"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com [209.85.167.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4A2F21C9E1
	for <linux-arm-msm@vger.kernel.org>; Mon, 17 Feb 2025 13:21:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739798465; cv=none; b=o1KFsGLqjCduXLEm/tcwqQrnPsshoWUqZf3MtE2eZH4WgAmbJTMYFCCxjPaX0/vw1N6mUhRNc+f2ddkfjAC/ecrYg0FUf5rCTxxId/mKoKiGUFPSE3e4Hceuh0o20dpmwFk3swQ7vaEZHTVIuCf+2X3F25FCxda8wvijTFF44fI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739798465; c=relaxed/simple;
	bh=lX2D25p/qadiLQYCLxNmMMnvLlDEWgqjiL8t/9gSr5Q=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=g+pMkYDN0SzYkTeoU8fLUW4Xt8W9n5l4dWh09Y/HFm8u/pbHuirQP5kqiKUM+/0th+T1LqD8RL60SQpGq8Xox8GVjThBwwssuTa85RTFbUb1LvpWGN4tQvrdnfFy3frGcM0Q9gqD6V5lcAmUHnQH3Uv90waL2GNYG4gyHYkg4cs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Pr49oHJh; arc=none smtp.client-ip=209.85.167.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-5461dab4bfdso1502055e87.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 17 Feb 2025 05:21:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1739798462; x=1740403262; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Vx8FToriyMjD7Qjvpw2v+D/tshU3jtBFSZkXmof7+lg=;
        b=Pr49oHJhPCAVf79+VA+5t0Kqm04jLNvNmyTGjlRKbPBj0HenGxXqHdbOHyBtptFbiq
         jLPPVmh8H8gE2E5T6jYMtI9G/nmgLDyOcXQtHwn3l4imZsslmBNNl/Xxj1XLxzf7ENiZ
         JIT2/qtAwFkYbxQZ6NxgxDcg8KSz3wn4Swv82Eo/9X09eHJeKK6Cd7Z4xHNuzUtJzA3E
         +QltuE2O33iBTPB+Ml8m/+bp+w/Z7Zy1zRJz6SkisPuXGzNzXrh0WgKmjl3qIxZWRL6w
         c9grE9DMMp9VZldlGGkt417FmqL72tb0F6njMrFtBXkwKSeAzG8CapPgtmEt8zz1J989
         YRXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739798462; x=1740403262;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Vx8FToriyMjD7Qjvpw2v+D/tshU3jtBFSZkXmof7+lg=;
        b=MHwtPUgJiuFxlYFZ0m1gT9hoaN/bP8vzpvWRPvvHlPEd11wrGBf4OXyWddmx2pfD2b
         PjbDCEll6MeG3Dx8Yh97SwxLWNkbpi6jfG/pLOPsFeMYk3n+gVk207pRt07iX7YQLeC0
         u+v7d/a2NgMrvGXZQCkxDcSZRK9RHxHjQZVsI692UdHZM9OTDxWn3VaDcLfo/nREov7j
         hGvpHc+CFY6241IW77iIAxYVMWAILKOylCHwx4VAOdP1HCVDbt0B8zeabxsVmgItdEUC
         3JP/VGhJwAqNCzQVpbM3MPo9dt48qW+aJgNEsq3qCDecCYu9ptmk4nbUlfb1+4Y10sjm
         24vg==
X-Gm-Message-State: AOJu0YyovNPByjTh8eaqrqsDusQdWn8jZTT9aEmaLc73uyvucBCjN/GT
	NHZ9ox1spR2I6VSexGrj1Xadr7YB3Y3c8Q70HeaKQ8vI4kwuYWbFST/J2OwGVzU=
X-Gm-Gg: ASbGncu7KkttL7mJi01V2Vtgc/Pyhya1XHPPcjhYSYKvhn2V/hUTEogwElIcZ7TZnMq
	hvvc+6tYlu3tjSLPoLMGJJrnHedioY0BjlgwLs5+eoR91kLvV0o5lJIjhOPfPOOfI99uj4n/RhT
	tNmSaKceZSLFFPvrm0yAA95d1z13Jf3wAhxUYWjbfOO6+U9dAyr1YQmlz5sRYFoE1Nlz2ZFQCh+
	mhI+dL4qnicaqf4pWuhc7ESkDKGu8XzdFdW7yL1e719w0zNjNx0JJkQGbt0tCjTV/X6JOju1yMs
	VYpUuu2HFkjgXaWNNlz7libZUE+ZH9oCv7FtQt+4bI3x3chj+UATpuNbHFHwjvhBgc3Yz1g=
X-Google-Smtp-Source: AGHT+IHijNGDuWrFGZUtoQYEh1iXjohk/XYG4cGp/X04v1KAisSqf624sPgPoYgDSOrqNNHP+3NS4Q==
X-Received: by 2002:a05:6512:ba6:b0:545:bf4:4bc7 with SMTP id 2adb3069b0e04-5452fe4e600mr3318392e87.19.1739798461943;
        Mon, 17 Feb 2025 05:21:01 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-545287f96f2sm1265033e87.28.2025.02.17.05.20.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Feb 2025 05:21:00 -0800 (PST)
Date: Mon, 17 Feb 2025 15:20:58 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Alexey Minnekhanov <alexeymin@postmarketos.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	~postmarketos/upstreaming@lists.sr.ht
Subject: Re: [PATCH] soc: qcom: pd-mapper: Add support for SDM630/636
Message-ID: <j2trf7xfgark7x5lbizsbzsbqtcjrujhznrcsadexkhkxt5lii@ms677i7h4tzm>
References: <20250217050251.298163-1-alexeymin@postmarketos.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250217050251.298163-1-alexeymin@postmarketos.org>

On Mon, Feb 17, 2025 at 08:02:50AM +0300, Alexey Minnekhanov wrote:
> Add missing compatibles and pdm_domain_data for SDM630 and SDM636.
> 
> Unlike their older brother (SDM660) these two cut down SoCs lack CDSP.
> Other protection domains are the same as the ones for SDM660.
> 
> Signed-off-by: Alexey Minnekhanov <alexeymin@postmarketos.org>
> ---
>  drivers/soc/qcom/qcom_pd_mapper.c | 12 ++++++++++++
>  1 file changed, 12 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry

