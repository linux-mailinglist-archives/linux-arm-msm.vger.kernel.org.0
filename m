Return-Path: <linux-arm-msm+bounces-46135-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 272C9A1C49B
	for <lists+linux-arm-msm@lfdr.de>; Sat, 25 Jan 2025 18:30:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A6A323A8D13
	for <lists+linux-arm-msm@lfdr.de>; Sat, 25 Jan 2025 17:30:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 248F725A62A;
	Sat, 25 Jan 2025 17:30:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="VuXKvog3"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f181.google.com (mail-lj1-f181.google.com [209.85.208.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42134C148
	for <linux-arm-msm@vger.kernel.org>; Sat, 25 Jan 2025 17:30:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737826230; cv=none; b=p9RpzoWI9Pj51oBwGxCvib6nDtQ9HfvrvwqX/9aPGsdU2Bqv+Jzfap2j3nQdhbU5a6PRp/3RVk6aZ29c9DT9DEOvCGJpsmEDXRcLE2hcVAjWXELXlvZkVBtBVAcagm6RyLqeTmoV0gk2cVWU595qv7a5yEVlXbkAP9JqoNuz2Vo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737826230; c=relaxed/simple;
	bh=s7ieX5CKFHuwQrcOmb8RVPW9HCuCK4jl6dIVeQLv2Pc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=eqMarzTgkC7spTJD4CSjY7E8KM3vDZJg0uJMqJQHclR49soaBQXxVjCjK+ZM2u7DzeRyJOZpKAodnAEvU19d3LCB8P4nKPaTgi1qdJwhAWEI4vsv7Z81YMwY0acxFw1N6fhQrLAd306g6yEgF431+k9AL4U4sE5PghxF7eIdmsE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=VuXKvog3; arc=none smtp.client-ip=209.85.208.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f181.google.com with SMTP id 38308e7fff4ca-30613802a59so34173761fa.0
        for <linux-arm-msm@vger.kernel.org>; Sat, 25 Jan 2025 09:30:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1737826226; x=1738431026; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=US0EnBiHsIYKJlqPkzCqVbNBc2Ls+ZuNd0+qd6Uqb/Y=;
        b=VuXKvog3DgVwxznx9B8ObJAM1jFUii/suSe7R/rhkbqcsC0QshYpVe91tC+jNavJxY
         3ehpcIgs6GUk7QQg32uCYXITbq5RbnAeE7SqAh0JVctgFQQQz2ie4ESJvVRbQB6lIPca
         CJMXc5HDExzo3NzuWdK5oSVHlrID0gj2Db74tu4hFpLtZB8OG4tEMUqt9nnCFIV7j76n
         8es1IsAuNdeWwLq37feT1uT6widku+XlGX/m5UUGQrFsat+z4sIJj32zdk0UIUgqWNXe
         e04ofljHYn0XMjvUUUdvgApobytLeqozZwoyld5Ge9d7FJz05xmVbvsaSQPu03mGNqxW
         tQKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737826226; x=1738431026;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=US0EnBiHsIYKJlqPkzCqVbNBc2Ls+ZuNd0+qd6Uqb/Y=;
        b=mJ9qF3gCIGBFrUwuT5sekWJMElAY9IPFt2z9ZjE1y4gKKnLqTz7FQpHjZtdcX58sWY
         2Xv9OKeZKTubeNgZ/m+sKfnfmsP3ONVRXH3QnVLC67Ih8P0UKdxMCW0DrHzAGfI1iZfj
         vR2xPlwdMM5bg6lgUvo0NNNpXFl6xetm0f20KJOOalz0KHKbqaGNhEJxcr3rb2fnW4s5
         +bqVxpZKgrsLGDo4IS+Pu5kb2+aHyp49GfbLAJENNw1V43Ypf9WriIIU8r2qG5nJkIRY
         ICBYXEOUWwVDKNDvgV8fg1pAoEfhSQdrLyrJBpj/dnTNJUZGmO3ailbbOIoLioENs8KU
         HbTg==
X-Forwarded-Encrypted: i=1; AJvYcCWWGT0fmyZEcGO5KyaFhpboJ/KVH4yLkWTEqbPm6eNo+RjCLFFbMNeQ1CF2VLlmnD95FJ9LW+TSAFP1uXjc@vger.kernel.org
X-Gm-Message-State: AOJu0YxYh58+ua+to2FSwjYganyyEbf0uxwp8xs1Js3IrInjVGYRce9i
	ipLZUJChMtwD7+efWJYqTog8WpLySgDVOHu4lwUiK71D7FccgTDj35wRnCOT2zM=
X-Gm-Gg: ASbGncspxRIklHZUOhmB8e2lZHmlfT/QV2yTJnR2+LF1z5QMavbpZEhz2ChDOE3hNWs
	aMUsZCkWqIkylIpketBNhUhfUbqGmheZY1nrKJ28tzMaY0VRO9/z3bFuzCppfEiIxWh68qK6Cn6
	8GVHh7IaATE/o006s0fUFixSjpFup+dFF4VHTKBTz1vaxt2LEUx3DbEYrXLPHs8FEbRhdg2XmA8
	hficV80UADVZs5Y+1hpOzlAQ5jjiGJrJdXDgMz00MQunCdClZo6/HBPgiEVLMezuFFZ2L+/SsMd
	/xqIfAJ1Q3y970WozjZiXnlGtLjoTvJngCiAjWNp4BNbRaLRrGyXQBUGPD2F
X-Google-Smtp-Source: AGHT+IEJdOGBDBJSDCvFhU2PUzzZMFjItFiSFpgzHyoEnKNXwK9asBOtQ13f6ME37s/+fooYaxI9aA==
X-Received: by 2002:a2e:be04:0:b0:302:3ff6:c8c6 with SMTP id 38308e7fff4ca-3072cb3cd60mr129216181fa.33.1737826226314;
        Sat, 25 Jan 2025 09:30:26 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3076bacb2bfsm7581241fa.29.2025.01.25.09.30.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 25 Jan 2025 09:30:25 -0800 (PST)
Date: Sat, 25 Jan 2025 19:30:23 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Konrad Dybcio <konradybcio@kernel.org>
Cc: Vinod Koul <vkoul@kernel.org>, 
	Kishon Vijay Abraham I <kishon@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Bjorn Andersson <andersson@kernel.org>, Marijn Suijten <marijn.suijten@somainline.org>, 
	linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH 3/6] phy: qcom: qmp-pcie: Add X1P42100 Gen4x4 PHY
Message-ID: <h6zfhxkc4dj2ueaxipha6prbvmv7pnqglghtjs7vkhlc2s7ndi@vhbj4uojlzwd>
References: <20250125-topic-x1p4_dts-v1-0-02659a08b044@oss.qualcomm.com>
 <20250125-topic-x1p4_dts-v1-3-02659a08b044@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250125-topic-x1p4_dts-v1-3-02659a08b044@oss.qualcomm.com>

On Sat, Jan 25, 2025 at 04:31:19AM +0100, Konrad Dybcio wrote:
> From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> 
> Add a new, common configuration for Gen4x4 V6 PHYs without an init
> sequence.
> 
> The bootloader configures the hardware once and the OS retains that
> configuration by using the NOCSR reset line (which doesn't drop
> register state on assert) in place of the "full reset" one.

I know your opinion, but my 2c would still be for not depending on the
bootloader. I think that was the rule for ages for many possible
reasons.

> 
> Use this new configuration for X1P42100's Gen4x4 PHY.
> 
> Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> ---
>  drivers/phy/qualcomm/phy-qcom-qmp-pcie.c | 18 ++++++++++++++++++
>  1 file changed, 18 insertions(+)

-- 
With best wishes
Dmitry

