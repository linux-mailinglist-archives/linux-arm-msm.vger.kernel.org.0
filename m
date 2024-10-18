Return-Path: <linux-arm-msm+bounces-35043-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id C073A9A47EE
	for <lists+linux-arm-msm@lfdr.de>; Fri, 18 Oct 2024 22:28:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7BA5828061A
	for <lists+linux-arm-msm@lfdr.de>; Fri, 18 Oct 2024 20:28:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4DEEC202F91;
	Fri, 18 Oct 2024 20:28:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="HFnb/xc/"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com [209.85.167.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3AC18204083
	for <linux-arm-msm@vger.kernel.org>; Fri, 18 Oct 2024 20:28:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729283310; cv=none; b=NcREITs9bKMQCF727HNOqbwpVXpBMZhm5UJTHmaDT6axUSYKhnKYLBEY1GqMmv33Q2WmPXx4IIoyWF7pu/oIXW4LKdwdQrth3efAcf14w8xk9mLii1UIrvdG0EyuA9SSY5pNWEXlw+3mMjXbl4Rgx4za9PaU2hKfFsUWLe8l8IM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729283310; c=relaxed/simple;
	bh=pSYu2V9vE1v40JDClAYzaO8gHTegAGCsdToFUQ8aORw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=a7R2i6oGTTnC/ocPB20O5OhYc34WGqW8tesbv+6KwOS8k0Mm9+R3pPhM1gcaL+o/+DBYX0CPzM04+Ffp1j0Kjr/P5LkCme0yojXEYmv8w7L1vyBcnRLsn4rdyuO5MHx5GM3hckd/gkMrjeBHLESw315nZMi6EBmcsqcGiwsDKlA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=HFnb/xc/; arc=none smtp.client-ip=209.85.167.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-539e1543ab8so4514453e87.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 18 Oct 2024 13:28:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1729283306; x=1729888106; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=LY5/vQ48pBwfRlm9zQiPTqoKwm7/lyhKv/uaIUZfZmE=;
        b=HFnb/xc/JqzvvsNyLoOjSvgo8CjeVhJRUCToW62GXcKMyKFBjWM58ebalrK/WP6Z1x
         cSfetzYQEricsEoFByEYW+WA4UzlZ9cgT+es453gZvqmII48P8hlbtLTyPk09gCwt4Eu
         r/6V15H5VkHptSScGhTUU9QBLZY0RRMxiq7OqHkvWb816G/QYLMXq+n2s++TCbr420kz
         1FalBSWgMjOOQn9jWFJiJzbcJcbu7zRkW750VUKF9pBVEvLGz0J2XnC4H4FX2r+jvW7C
         sSn3KRs1r76pEI16zYUZIBlY65Sxrzr34prSHtsYGzKpNJQlutYTxJYTeVtWMsJViYu1
         P7sg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729283306; x=1729888106;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LY5/vQ48pBwfRlm9zQiPTqoKwm7/lyhKv/uaIUZfZmE=;
        b=oc6K/EUmAqAh9846zCGBXWnl//RCmNhiqaPHVWxSIAbR5MSTX9JtIdYoTBn4zcuGqG
         MMiI0thbz9qK+rA7N+zyDQG+7+oWhsV7/WDzffEYeg6LjjfCZeROu3nQdVRs+QURBcrl
         In8oi2oGe3O/s1sK2yb4ie8ZgOq0oU6vBXMBlfyxsb5EEuPf3+bg9J1XzKNUEef4vS7i
         QTWMYq5wvcQLHyKHEfz1YOUnq4Wz7Zp2HkRlpSWCO8keBFZVMHWXKHj4oIu/nFpGXYGk
         1PR1H2UDgOtUfAK2CdDPxMNeTk3fMOe7Z8rxAiyF7G3Pvk3LUouhvFxW1Ouawftiq4c8
         IrKQ==
X-Forwarded-Encrypted: i=1; AJvYcCWKoYa+suG87D5Baq5E67VfydT613xc2CdKtpdeQZTVDMrmPfDXhdr0dWrd1KHvpLy1xj3Syne9XUveyP3u@vger.kernel.org
X-Gm-Message-State: AOJu0YxVl+RkDIqVHof8/YQUr1eJmn8orzVh2WHdmm/ARSCdD6KYF5Wa
	xPb3+UAJ2TPGU8IsdsE9Ldu5Zm0ff6o8VioR57R2Vn7swrgtYN8pCdjWQLLrKYQ=
X-Google-Smtp-Source: AGHT+IH+qsY9mBs2ZcmLMm8XT80WfJ9RLA+9rQXt0fzC+YdixxfVTgvbIo9i3IbVyuwdmP1jz0Yxpw==
X-Received: by 2002:a05:6512:6d2:b0:539:9510:2b8a with SMTP id 2adb3069b0e04-53a154d9606mr3301778e87.53.1729283306107;
        Fri, 18 Oct 2024 13:28:26 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-53a151b00aesm314818e87.38.2024.10.18.13.28.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Oct 2024 13:28:25 -0700 (PDT)
Date: Fri, 18 Oct 2024 23:28:24 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Taniya Das <quic_tdas@quicinc.com>
Cc: Bjorn Andersson <andersson@kernel.org>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Abhishek Sahu <absahu@codeaurora.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Ajit Pandey <quic_ajipan@quicinc.com>, Imran Shaik <quic_imrashai@quicinc.com>, 
	Jagadeesh Kona <quic_jkona@quicinc.com>, Stephen Boyd <sboyd@codeaurora.org>, 
	linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 08/11] clk: qcom: gpucc-qcs615: Add QCS615 graphics clock
 controller driver
Message-ID: <omn34rwurlxrjckb5d6xb2brg6zwcizonmqyfckvngk5msrfav@b3i2bdjk5vw7>
References: <20241019-qcs615-mm-clockcontroller-v1-0-4cfb96d779ae@quicinc.com>
 <20241019-qcs615-mm-clockcontroller-v1-8-4cfb96d779ae@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241019-qcs615-mm-clockcontroller-v1-8-4cfb96d779ae@quicinc.com>

On Sat, Oct 19, 2024 at 12:45:44AM +0530, Taniya Das wrote:
> Add support for the graphics clock controller for graphics clients to
> be able to request for the clocks on QCS615 platform.
> 
> Signed-off-by: Taniya Das <quic_tdas@quicinc.com>
> ---
>  drivers/clk/qcom/Kconfig        |   8 +
>  drivers/clk/qcom/Makefile       |   1 +
>  drivers/clk/qcom/gpucc-qcs615.c | 525 ++++++++++++++++++++++++++++++++++++++++
>  3 files changed, 534 insertions(+)
> 
> +
> +static struct gdsc cx_gdsc = {
> +	.gdscr = 0x106c,
> +	.gds_hw_ctrl = 0x1540,
> +	.en_rest_wait_val = 0x2,
> +	.en_few_wait_val = 0x2,
> +	.clk_dis_wait_val = 0x8,
> +	.pd = {
> +		.name = "cx_gdsc",
> +	},
> +	.pwrsts = PWRSTS_OFF_ON,
> +	.flags = POLL_CFG_GDSCR,
> +};
> +
> +static struct gdsc gx_gdsc = {
> +	.gdscr = 0x100c,
> +	.en_rest_wait_val = 0x2,
> +	.en_few_wait_val = 0x2,
> +	.clk_dis_wait_val = 0x2,
> +	.pd = {
> +		.name = "gx_gdsc",

.power_on = gdsc_gx_do_nothing_enable ? Or is it controlled directly on
this platform?

> +	},
> +	.pwrsts = PWRSTS_OFF_ON,
> +	.flags = POLL_CFG_GDSCR,
> +};
> +

-- 
With best wishes
Dmitry

