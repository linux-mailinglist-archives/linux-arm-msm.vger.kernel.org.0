Return-Path: <linux-arm-msm+bounces-17856-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D0ED68A9BAB
	for <lists+linux-arm-msm@lfdr.de>; Thu, 18 Apr 2024 15:53:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 0DA4A1C22EDB
	for <lists+linux-arm-msm@lfdr.de>; Thu, 18 Apr 2024 13:53:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A8E5816086C;
	Thu, 18 Apr 2024 13:52:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="qckfZu1D"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E21621607B4
	for <linux-arm-msm@vger.kernel.org>; Thu, 18 Apr 2024 13:52:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713448373; cv=none; b=gOpx61A9QF1//441aOWertLYflx+ClFmpjUp6/PKJHK6RK5mGcsAWE1Qk/FSomFtDI/4u1Ys1xqR8nA5EdxTfOmL+JjHqUocAPSQhIvXtJahiL5F9NEitxvKgOPDzDFeyFbVRUECk53Drx/xd54wQnhuS9lIspwY0C0+9/SMtcU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713448373; c=relaxed/simple;
	bh=rrJLEic6b430M5d1gdVy4F5Gjj2IiF/kZAlAhOoSm+s=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=G8lIL/tKLhI4PSIyAoHVgZG4vn3d+OD+ow8pc1b3jX0N/fFH1jhUgI0B9hIIKkiRfIv381r6WpCeCqQq1A+RaM9q2iU/fZjACjJczU76eHnEySkW64DqR4Q/SPQUIC/MLrK6AKVeRnV/E7JRqQmMvZY3IpARH7GHsY77eA6XHUw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=qckfZu1D; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-418bbc690e1so7657735e9.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 18 Apr 2024 06:52:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1713448370; x=1714053170; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=RWbG4sKC6MWj6GtrMOZNqb19mu2ielKzyJ3R5+Nz7mI=;
        b=qckfZu1DXtbJ8whmn9PW11MBPw0iD6mpnnjyx2sbpzqS4CgWY+LFbA6x/2HJBIzfEx
         MqJNwRT9t5WM8+DDjD//TNcnPRovgn8ZE39TNyU7KqSTmYAxPIB8k5Az26s0A/+Q5EXH
         /2Z5DGAR3OIMI2mdHfihU16F5HYH6jiIdb9ps9hPP4a8IlxCZwCmTG0jMC/5C4oxxpke
         asIPPVNDx7gJAW29i+qPlmMzGjZjtsEVfU0n5Fzrk/vfDL8+xG6xgs6rom27MH440jzr
         20KHWu8VkjcFOB9IwEoPXRKRoxKFgzxXRXsNsc1tTwykDumjz7WwTWSfjIBgfpbiLJwz
         /C8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713448370; x=1714053170;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RWbG4sKC6MWj6GtrMOZNqb19mu2ielKzyJ3R5+Nz7mI=;
        b=IzpGeOon5oABMmeAS/oPcyt8RrtFN2d+7ConAcjU7ac+cuKO0KAhsF9Bx+80tpX+nm
         oBd3rndUF5My0EdxPx/Lyyb31weBDU96FQnx/M4Yw+TeAhgeYoWmFhldeQHE9VC2ndqe
         qiLXTw623/Z+a17+bIL1LJiIi61rtn7qAR/Ez03rSejEqszEilQtcdEKg4Dpajmx4psQ
         SeYMUHRRrzN7lHSIZkB3+0ejNXHANoFigVhcExQfbKG7NC8gJy6utsKG9dUn2aRPkkIX
         HJmHkgqr+Lvr/yKvnQVmt00GJAEwmJoF9uRigwCnX0XrlemPsYxaOFEQyqGWmnM1ueBJ
         NIrg==
X-Forwarded-Encrypted: i=1; AJvYcCV+9p/d0IVD8/dCv80mYjFh7lM1Xx4GLW+h/mk1JO5Up9vKEQoQbOFtMBT3+gyvgQkQg4XNsJhMOmBzO08g/xS3fwbMsVAmuZvq/NsM4w==
X-Gm-Message-State: AOJu0YyNUgNiZid4lPC/8Bx94WkwECBRc4Y02uziMxeBGmrIh2206vWn
	htVZmPB8KWczhW+ZuiCSCLlUVAcYTbV3ALf+BOlw7DmjqK9z5OlroVKXZYYyz9G1XSaCugiYOvS
	y
X-Google-Smtp-Source: AGHT+IHftEyUpBzc5z2d24qG1D0jDGSYD+HoX1PiiOfhTW9sfi19sqqjij+wzfohFDIByM5q6oSYtA==
X-Received: by 2002:a05:600c:548b:b0:417:d44f:5c50 with SMTP id iv11-20020a05600c548b00b00417d44f5c50mr1996191wmb.41.1713448370076;
        Thu, 18 Apr 2024 06:52:50 -0700 (PDT)
Received: from linaro.org ([62.231.100.236])
        by smtp.gmail.com with ESMTPSA id fj3-20020a05600c0c8300b00416b2cbad06sm6660102wmb.41.2024.04.18.06.52.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Apr 2024 06:52:49 -0700 (PDT)
Date: Thu, 18 Apr 2024 16:52:48 +0300
From: Abel Vesa <abel.vesa@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
	Rajendra Nayak <quic_rjendra@quicinc.com>
Cc: Konrad Dybcio <konrad.dybcio@linaro.org>, linux-arm-msm@vger.kernel.org,
	linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] clk: qcom: dispcc-x1e80100: Drop the reconfiguring of
 PLL0 on probe
Message-ID: <ZiElsMSXImj49Qle@linaro.org>
References: <20240418-x1e80100-dispcc-drop-pll0-reconfigure-v1-1-453e4e70e940@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240418-x1e80100-dispcc-drop-pll0-reconfigure-v1-1-453e4e70e940@linaro.org>

On 24-04-18 13:51:22, Abel Vesa wrote:
> Currently, PLL0 is configured by the bootloader is the parent of the
> mdp_clk_src. Reconfiguring it on probe leaves the PLL0 in "stand-by"
> state (unlocked), which will trigger RCG child clocks to not update
> their config, which then breaks eDP on all x1e80100 boards. So rely
> on the bootloader for now. Drop the config values as well. Also add
> a comment to explain why the PLL0 is not configured alongside PLL1.
> 
> Fixes: ee3f0739035f ("clk: qcom: Add dispcc clock driver for x1e80100")
> Signed-off-by: Abel Vesa <abel.vesa@linaro.org>
> ---

Ignore this one. Sent a separate patch that handles this in another way:
https://lore.kernel.org/all/20240418-clk-qcom-lucid-evo-skip-configuring-enabled-v1-1-caede5f1c7a3@linaro.org/

>  drivers/clk/qcom/dispcc-x1e80100.c | 16 +---------------
>  1 file changed, 1 insertion(+), 15 deletions(-)
> 
> diff --git a/drivers/clk/qcom/dispcc-x1e80100.c b/drivers/clk/qcom/dispcc-x1e80100.c
> index 0b2ee6456762..525f645094a8 100644
> --- a/drivers/clk/qcom/dispcc-x1e80100.c
> +++ b/drivers/clk/qcom/dispcc-x1e80100.c
> @@ -73,20 +73,6 @@ static const struct pll_vco lucid_ole_vco[] = {
>  	{ 249600000, 2300000000, 0 },
>  };
>  
> -static const struct alpha_pll_config disp_cc_pll0_config = {
> -	.l = 0xd,
> -	.alpha = 0x6492,
> -	.config_ctl_val = 0x20485699,
> -	.config_ctl_hi_val = 0x00182261,
> -	.config_ctl_hi1_val = 0x82aa299c,
> -	.test_ctl_val = 0x00000000,
> -	.test_ctl_hi_val = 0x00000003,
> -	.test_ctl_hi1_val = 0x00009000,
> -	.test_ctl_hi2_val = 0x00000034,
> -	.user_ctl_val = 0x00000000,
> -	.user_ctl_hi_val = 0x00000005,
> -};
> -
>  static struct clk_alpha_pll disp_cc_pll0 = {
>  	.offset = 0x0,
>  	.vco_table = lucid_ole_vco,
> @@ -1670,7 +1656,7 @@ static int disp_cc_x1e80100_probe(struct platform_device *pdev)
>  		goto err_put_rpm;
>  	}
>  
> -	clk_lucid_evo_pll_configure(&disp_cc_pll0, regmap, &disp_cc_pll0_config);
> +	/* Configure only PLL1. PLL0 is already configured by bootloader */
>  	clk_lucid_evo_pll_configure(&disp_cc_pll1, regmap, &disp_cc_pll1_config);
>  
>  	/* Enable clock gating for MDP clocks */
> 
> ---
> base-commit: 4eab358930711bbeb85bf5ee267d0d42d3394c2c
> change-id: 20240418-x1e80100-dispcc-drop-pll0-reconfigure-0111b338c838
> 
> Best regards,
> -- 
> Abel Vesa <abel.vesa@linaro.org>
> 

