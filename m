Return-Path: <linux-arm-msm+bounces-49899-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 9373EA4A60C
	for <lists+linux-arm-msm@lfdr.de>; Fri, 28 Feb 2025 23:38:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A310E1776BB
	for <lists+linux-arm-msm@lfdr.de>; Fri, 28 Feb 2025 22:38:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 87E8A1DED44;
	Fri, 28 Feb 2025 22:38:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="XO/Y1l1p"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com [209.85.167.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85D591DE3AC
	for <linux-arm-msm@vger.kernel.org>; Fri, 28 Feb 2025 22:38:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740782335; cv=none; b=OroaD2IILyHzd4da1uct0M+Fn2ZXKtid/8PZBX8hPCllPmUgJ770uJNxrc1oryjY7YdUnaLA78yFYAhuXO235cFdVi/Tf2uHoYebw/o+z7YFwGmdI92aaclXULaH6sfbJX/yq/c7rac49haktMEVy05oxnG7vSKy6+qXFK3F/4Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740782335; c=relaxed/simple;
	bh=qxmpwgVoph1AElRgemrOMCNkM0UQR+WMiPiIC7BqPOc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=O1mYgMQb8n+V/ig1+Rb1z3auWEJFcIx6pE/fwkDSGNe9lKzjjCzRppZ/R7j2dWG2Lftv4kEMpTDsGeztec8Zm3NzQdqhCAW9AxzL9Cx1dO+JrGkGBvm3VNkwwd8sakxz5t0k3BogCdhu4fDhPWWo38qeDLsSi1W+TyQq2voRLCg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=XO/Y1l1p; arc=none smtp.client-ip=209.85.167.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-54959d1a856so104886e87.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 28 Feb 2025 14:38:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1740782331; x=1741387131; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=jVLtEZWmEyfafXYzQagUTDqOcJoOxE4zFmdp+hx7MFI=;
        b=XO/Y1l1px9lPYSETYZ0dht9OL8qhdlVxau0kP6KT0GhMKh83TytQeVT5xvM8R5Jb6u
         SWjfhD9XmY+W0rFy2kZgd3KJbHJe/1gcRshO1fae8ajFJrAImeN9rt5KyMR/Fw5UmSMm
         Unu5u6aJdDV9qBB9s/MeVFAkEmRNbF7VcJZc3Bb10NNAkZpET1xgl5isg9uB9gz0QiXf
         lUv57wxZ1+j53BSaRN7W37/1/7mUUcL9HoSoQB3KvyxRDGY6Odk5aEdRhHOSftCRNkXd
         6IXf1qtw9wpqZMOKNjx7i9aVo/QCWPxvPJHsg9TPlZZDGd4WpvGc14+joUEy0ySM0+rz
         5PKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740782331; x=1741387131;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jVLtEZWmEyfafXYzQagUTDqOcJoOxE4zFmdp+hx7MFI=;
        b=brV2cD9j1Eh8TMTj3H+or55wh75L4hB3M05I7Vp2tFKQoxpq6CEhuNttBxHLSZaQ0o
         ONgfXHPp4eLNPWW0eNYFdSKdG8e4eXilxGI3F9XtUGUF63jgGvu7eSdZXghecpko4vLj
         NbLaKMqCHdio4gAFLPFE3kX2QOU4Xyf1pxhefsxLHFn0iIc6g13KH6urxBLt9p34q47a
         7SNTnfX5dR95fEUiakt03pK6prgrBF3pDBDn2m02Lh71s20ztFV3Di9682cxYTrCDeq7
         8NfcJqvq3Xmv5fwTynaMWffEJCfQ2CxVDUbD9jn71q9BDrpruzQ5JoPnM67z39JYcvZV
         ED0Q==
X-Forwarded-Encrypted: i=1; AJvYcCVdgDwFiZYZXPyB/RNcD7Ypwa6dNc9zplPOAm8e3q8guwIId5lSSF7Df1lRsZODximHnIHrGa7kRgqe57YY@vger.kernel.org
X-Gm-Message-State: AOJu0YxoAjXv3dvjBclrZNDU3UYCAbAUzMr5BpoVHniUzK9MOQQBkkLR
	TZ6r7TERRkT6Ea0mC9M4WGxOHLtTXGXiWp7s1hMXymKQpYmOEstDN7EApHEQVGc=
X-Gm-Gg: ASbGnctDJzC/UQP3KZKwsMX4npSBVP0+hhPT845E7CA/X577gEz9Zm0LIQgRC8PLG2H
	Wvh1TAFsFpgLe/6AgdT8Ha6EalQ4aso2UtuZOrEAIMZEvL33xsccqc3kC8zqQAE+urnZje3drzX
	3xFeuTS19sjOSoBmYwFZNhjYHpecsspk3wpl3Qbw0es9Kb+MZm2H4JHnxyv5e9RaGu9XTz/Kurg
	kNnLzjIDnZY0itmQFPAl5FaQ8eDn+OLlgfaoqkIeIbuVb1/gf18nH/3dfAKhI3i3K/mej/LKU0k
	+cAtDSAOw9ioTFbINMhyJZQyBEz50TOgyUzG7iRwbdap0WfV7kGSPx5fS0VBtyPxSwjXn59yznn
	Su10fdw==
X-Google-Smtp-Source: AGHT+IG9mAgP7zVwIktUs/UBARKaqjA/kl0Vs6vq5xs6d+5Gc5O4KLLVSbymtcmIIJXCsZL/fle75A==
X-Received: by 2002:a05:6512:128e:b0:545:2474:2c9b with SMTP id 2adb3069b0e04-5494c35e0camr2328617e87.22.1740782331571;
        Fri, 28 Feb 2025 14:38:51 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-549443b1286sm630135e87.158.2025.02.28.14.38.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Feb 2025 14:38:50 -0800 (PST)
Date: Sat, 1 Mar 2025 00:38:47 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Bjorn Andersson <andersson@kernel.org>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, linux-arm-msm@vger.kernel.org, 
	linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/4] clk: qcom: Constify 'struct qcom_cc_desc'
Message-ID: <jzqxj6b5brslayz6crvgenjiynlkagszdve3w5ablm5yyimmtv@pf3slvisucbv>
References: <20250228-clk-qcom-const-v1-0-611ab80d45e4@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250228-clk-qcom-const-v1-0-611ab80d45e4@linaro.org>

On Fri, Feb 28, 2025 at 03:59:37PM +0100, Krzysztof Kozlowski wrote:
> Make static 'struct qcom_cc_desc' const.

For the series:


Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

> 
> Best regards,
> Krzysztof
> 
> ---
> Krzysztof Kozlowski (4):
>       clk: qcom: camcc: Constify 'struct qcom_cc_desc'
>       clk: qcom: dispcc: Constify 'struct qcom_cc_desc'
>       clk: qcom: gpucc: Constify 'struct qcom_cc_desc'
>       clk: qcom: videocc: Constify 'struct qcom_cc_desc'
> 
>  drivers/clk/qcom/camcc-sa8775p.c   | 2 +-
>  drivers/clk/qcom/camcc-sc8280xp.c  | 2 +-
>  drivers/clk/qcom/camcc-sm4450.c    | 2 +-
>  drivers/clk/qcom/camcc-sm8150.c    | 2 +-
>  drivers/clk/qcom/camcc-sm8550.c    | 2 +-
>  drivers/clk/qcom/camcc-sm8650.c    | 2 +-
>  drivers/clk/qcom/dispcc-sc8280xp.c | 4 ++--
>  drivers/clk/qcom/dispcc-sm4450.c   | 2 +-
>  drivers/clk/qcom/dispcc-sm8450.c   | 2 +-
>  drivers/clk/qcom/dispcc-sm8550.c   | 2 +-
>  drivers/clk/qcom/dispcc-sm8750.c   | 2 +-
>  drivers/clk/qcom/dispcc0-sa8775p.c | 2 +-
>  drivers/clk/qcom/dispcc1-sa8775p.c | 2 +-
>  drivers/clk/qcom/gpucc-sc8280xp.c  | 2 +-
>  drivers/clk/qcom/gpucc-x1p42100.c  | 2 +-
>  drivers/clk/qcom/videocc-sa8775p.c | 2 +-
>  drivers/clk/qcom/videocc-sm8350.c  | 2 +-
>  drivers/clk/qcom/videocc-sm8450.c  | 2 +-
>  drivers/clk/qcom/videocc-sm8550.c  | 2 +-
>  19 files changed, 20 insertions(+), 20 deletions(-)
> ---
> base-commit: 8936cec5cb6e27649b86fabf383d7ce4113bba49
> change-id: 20250228-clk-qcom-const-4218c42710a9
> 
> Best regards,
> -- 
> Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> 

-- 
With best wishes
Dmitry

