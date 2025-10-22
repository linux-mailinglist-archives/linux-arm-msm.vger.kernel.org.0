Return-Path: <linux-arm-msm+bounces-78302-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 062D9BFB135
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 Oct 2025 11:08:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C34471A03A7C
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 Oct 2025 09:09:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7B2643112C0;
	Wed, 22 Oct 2025 09:08:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="nfxh77TH"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9459309F1D
	for <linux-arm-msm@vger.kernel.org>; Wed, 22 Oct 2025 09:08:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761124125; cv=none; b=RirHuLN+4/A9zB4g4p0xhgWvDKEHPdByGZO7VMPLZz+vgat64WOuHZzdailAZYfBn27VyMIvWKDo2KGY+rqHlpTtRYcbneEm2qvwWixHYJ5zqayR9KlFta6K4XbSxGJnvytJVWO3QEta6yxJ7CyPwkrcBmm5Evzk7MlkHbIhNR4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761124125; c=relaxed/simple;
	bh=XwI9/Pg63nWAOQs+Pbg1hKzGVpozCmZVIXWuKjVsO8g=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bo/jJENAjmUYlyAPA6JbqTMzCrYA5cdrSLKg2wdSLh/nl52nOV6O8PYevikP0PxkseHNEv2BGFfafgr58xMUp9nwRoABIOJfe4nUi/pvUubMJpyKv828rXSXKrArKIP0+uw9sWTwnhDFdfDMVYuSaoRBzpvtNuoxRoYFhDvCzTI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=nfxh77TH; arc=none smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-426f1574a14so4428247f8f.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 22 Oct 2025 02:08:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1761124121; x=1761728921; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=IR6lsN0D+gAwku4dXN7wcI1QUBm99dnHT8qukWlDAjc=;
        b=nfxh77TH912Iy0/iwkOvfi7hks1JLS3L4Nngiy2zLqQ2uIL+gUqvJii9d0WlE5udQj
         kTPdsMRlUw8B8//+JrSmGKOfxvtby8KrqdIszPfT1WkSLOhoR3i7KxeNwnr4o/E1ri7y
         SMrYLKNj6MuaZSGlfdVbCBl5fRt30LfS6CcNoliYKj5FLXlzIzQrjshRy9p1ef3YCLRB
         ZQ2FtGc7Ovrb4QdSkOcXA+YaX6NwVFbVFGQXFy+d4iDDRPhpT0kMz19LI/lgCvd2t0lQ
         tfUgNDS/IZnF9fDM1aJhFuq/xTqX70MGSy5Cczc4niZtbWWBvTPuFULYBsWskZeUvXsK
         mShw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761124121; x=1761728921;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IR6lsN0D+gAwku4dXN7wcI1QUBm99dnHT8qukWlDAjc=;
        b=MLwuIHeeK7NnrtXz8wsmS3yCzz//jNdBc1Kci7oeXYDiUZG1T59sj91EBTQJ+LM6NB
         Zd/PMQWu131COcRizkx0GeXuw0iA5r0OpyR/4/ZF7/Tts2alO17LjHhx08MSwxE7ILGu
         mM3v9VwT6gbxrdCtUnJ+DZHinNQIrsJELWwniULvn1ZO1uo2feYM4tZ1+AY7cba4Q1F2
         F2ioOeRvbZESwt89xIqK4RBC3h2Qglm1Tr1ApiZSVXfA9MdCFPLI1Fv33uIhK3Jpe095
         aTAn/8C9pbq1x0ZWDPXkgoVtPYLmpf+VNNFwsSoyOIY92ZsWTBaqJUgLD6KN2Det2lvm
         P7Kg==
X-Forwarded-Encrypted: i=1; AJvYcCUo8Nqp6pSPPOWIf5iRxo+3LvzgT0E0Sk23b6G9AiZa20oVpCzJIhDvloEhZZew+u3nd6JxIPbetnmXYSps@vger.kernel.org
X-Gm-Message-State: AOJu0YwLDqcTJD5HDM9nppmWPuLw5fvYmvTDMsRtmk8Q5+9OW+eg+2db
	phvzI25YLn0GYxW61zVig450537PE+uN+zAoupslPO2lwx85BEAmH9QAfa5plchotfccscXJpRn
	D3lAj
X-Gm-Gg: ASbGncsPclANiFQM0T76VJoMBjH1NjUbHRwjYs9h6NX43FR0Ln3moiboqM8B3eUmatt
	EAhFHvLdmVa0Bb3JDF6PwFUn6mL5PHPdoUAGt3j4Ae05RELHGowA1EWsz02Q3OhPLjscdDasx9X
	Wl+OXIANQVQG2PYl6IkPP8lXBR15SnBgD9OaykkHyiEBTI/VVpB8qvrJv94OutEhHIOgJTi65lg
	Td4jOs/Fp+TUX7sy52dt3q1XIEpwLolfgtp1n4AUsr4dNHZ2uD9znZUGP3wfIKzWwHbMIfgBJdS
	LKPTWEi3B0J/uJpsyoOyMNVTyrRIHiJJcqOS1eChax3wi0M2uqhojavyWUIodc0xHxFxgNlSaem
	OhqeSzUKyOZRbw3JVELTKr9nCOniBF8aHR6ichGAn4nMpVov5QHKroakcf13l/ZQrTSrr40Zyk/
	KQmnLV3qQ=
X-Google-Smtp-Source: AGHT+IHvJFt8VlT5VCY364CrT9cw9v3O1vNM7YyvBOJIGj4xhlggMfEoG6gw4R5G2QRkCeX2sxlT0w==
X-Received: by 2002:a05:6000:1a86:b0:427:8c85:a4b0 with SMTP id ffacd0b85a97d-4278c85aad2mr11780759f8f.56.1761124121045;
        Wed, 22 Oct 2025 02:08:41 -0700 (PDT)
Received: from linaro.org ([86.121.7.169])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-427f009a7dasm26488612f8f.25.2025.10.22.02.08.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Oct 2025 02:08:40 -0700 (PDT)
Date: Wed, 22 Oct 2025 12:08:38 +0300
From: Abel Vesa <abel.vesa@linaro.org>
To: Luca Weiss <luca.weiss@fairphone.com>
Cc: Bjorn Andersson <andersson@kernel.org>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Danila Tikhonov <danila@jiaxyga.com>, 
	Taniya Das <taniya.das@oss.qualcomm.com>, ~postmarketos/upstreaming@lists.sr.ht, 
	phone-devel@vger.kernel.org, linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] clk: qcom: camcc-sm7150: Fix PLL config of PLL2
Message-ID: <rkp7dol23li6zdqaz2jzbkjntmc57lxmvxve2kc4ljh7gbu4k6@73v5d3mjsu6r>
References: <20251021-agera-pll-fixups-v1-0-8c1d8aff4afc@fairphone.com>
 <20251021-agera-pll-fixups-v1-2-8c1d8aff4afc@fairphone.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251021-agera-pll-fixups-v1-2-8c1d8aff4afc@fairphone.com>

On 25-10-21 20:08:55, Luca Weiss wrote:
> The 'Agera' PLLs (with clk_agera_pll_configure) do not take some of the
> parameters that are provided in the vendor driver. Instead the upstream
> configuration should provide the final user_ctl value that is written to
> the USER_CTL register.
> 
> Fix the config so that the PLL is configured correctly.
> 
> Fixes: 9f0532da4226 ("clk: qcom: Add Camera Clock Controller driver for SM7150")
> Suggested-by: Taniya Das <taniya.das@oss.qualcomm.com>
> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>

Reviewed-by: Abel Vesa <abel.vesa@linaro.org>

