Return-Path: <linux-arm-msm+bounces-48538-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CCFFA3C5C4
	for <lists+linux-arm-msm@lfdr.de>; Wed, 19 Feb 2025 18:12:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 61886188CA39
	for <lists+linux-arm-msm@lfdr.de>; Wed, 19 Feb 2025 17:11:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 766892144D8;
	Wed, 19 Feb 2025 17:11:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="MAkZpj/U"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com [209.85.167.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91E372144C9
	for <linux-arm-msm@vger.kernel.org>; Wed, 19 Feb 2025 17:11:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739985079; cv=none; b=cz4O5gbJcSekON17Mr5ZU7Mu2dIWm/QWkqmjWfspIc7IPjY8UnHK2sOXhlabnkTryi54vYJ2kryWaZn8sqpZrAxhoaNvMOBtlj2AFjJtqq3W2J4UTRnWUR9zXshbl9u+lkLTtI2AcpJFNEQ4cr0RX6buY97zNSAxK+LfTdWjlpA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739985079; c=relaxed/simple;
	bh=qFOAoe/oJXNfqjoR0wzSc/QQQsNl/9s1vfShbsSca04=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lCwMrrBmD9X0DfyClHcPK66jMnU30mgWf6dgTUJxpsPxwvoIsiPuQWaGGc4CeQ/uMLCzTXhddzd37sdMT0XufrHFPrCFVTRMVpiQaHF/TqHOkxlh8Vaa2M7QEi4WrM+10wXf3q1Hgbyf3pck2gX+83ufufakU7iyLOj6aFc+Rsc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=MAkZpj/U; arc=none smtp.client-ip=209.85.167.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-5452ca02bdbso55877e87.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 19 Feb 2025 09:11:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1739985075; x=1740589875; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=LVBCLwBb20SftVpr6Cb6gqWVa+/TpS0PacR3slD6cr4=;
        b=MAkZpj/UgQ4a3tyLtP8ht4mAMT2edz2dcQA/T9lWGcpU0gSS2Nuj0USmNHhDdVPJ69
         Mu08vip51LTcW+zSxyLeV7amDBWR2L2cDpmeeLmS4t91qIvXOgmXTXtSq/+r4vLKYgnw
         xpey6ns34xNmmUJ4Vu00CBoN7Du/8iU8Cd8qCDhIDpMe4AUtPdahHhMZLPVmA5CNMvln
         vZ0xScgsGvp+A7w6+EWNT32xG121qrlFNKGG0oyAfB8udj8OZs9jOke3qpcdOSPoKj6o
         j+whlb0tJLAdwcUCx4MQ+WqfnxyrAKSPu97jZhH5a9bYbWpJKE4c+xS9MuxKOl2zaxa6
         bqMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739985075; x=1740589875;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LVBCLwBb20SftVpr6Cb6gqWVa+/TpS0PacR3slD6cr4=;
        b=pCBSFfjYUJfwXZtuNDc2JsbYndDF3LE88oMFNfmDNSL0qx+10Cte7BkFwhzAK+KTup
         dIJ4LPXUrpEi4y+vs7eOqxMzv6/kgyUvxeVIj5oS4opvFgNJZa/DUsAWbClPAIsoK1ts
         zS9dUPLtjtL0dI+myxGX1f9yDzLEBB+8fu76U5aPkK0nHKGhKO6v+b2pHT/hz3xp/KiW
         gKOtNZ9Q5MTYLAbidKjLBanI3OVF+uiuh9FaeZFScrDpCEUceSIwQikIrKS9RHrz1lAR
         p1uoVg5jsaniHxzMEVhH0AEVXZKy+kFn6AklIGp0kydl0sOOvXaIO8DmpTIHBhUwaqv1
         J2Rw==
X-Forwarded-Encrypted: i=1; AJvYcCWTvK1DqY6HdVsEkJHoXrtI4d4dggkftiRvqVN6w3C6qKRgjAcbUMeTd2KS2N/t0xfCm3fPwkLvTgvegG++@vger.kernel.org
X-Gm-Message-State: AOJu0YzEXeT8JGAdPiOCmC0tT9xfi7pFLLBU80HYlPjo9pDjiOwrKxOA
	oB/Sfs7Z1YmfwGNYVBB7QOCx0Q+G7NwljuMMp9jHGpfZ3pXBH9CJ1QMURibTKgU=
X-Gm-Gg: ASbGncvc5T6jfpgp0bPsyAXxcVMarGNxLiHG+3/pGvniruAbLJJBIPVNWC+Eq00qcxx
	M0PhdaL3KAc11ufrBE9xf69XcvyiAXbOPq2GLPuWngduAnK5WKzQqlh7LbQcV0EhyFTn8ExmbU3
	lu8Q0IEpNnr999K0TPtvg2xm4GZnP37+wAQPiOzrpmjSWS1O9sNJyoc7Wf5HzLjNQkhq8qYEaqH
	DRK4lFUQq0oNjzSbMVSU7jVV+PZVK0KnAmqIOCGFYkCv3eVkQT35A6mnR7P1BZw1p/KcJ8+f1Km
	b7PQuZ1QXhSWZKT5xhyq1U0X6Vfo4PDcSbSbvfoimv4VaaPMEkD4Uy2pil6Antsx+IGsLmw=
X-Google-Smtp-Source: AGHT+IH7FL01qZOB3XAPbsmFC6KyEv2EmZ1yIsxjB78l1rwLXp5knouU37jT15QdaWHDAkHvPlzRzg==
X-Received: by 2002:a05:6512:b12:b0:545:e7f:cf3d with SMTP id 2adb3069b0e04-5452fe2e4aemr7300090e87.5.1739985075494;
        Wed, 19 Feb 2025 09:11:15 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5452f3d38basm1661990e87.222.2025.02.19.09.11.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Feb 2025 09:11:14 -0800 (PST)
Date: Wed, 19 Feb 2025 19:11:12 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Rob Clark <robdclark@gmail.com>, 
	Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
	Marijn Suijten <marijn.suijten@somainline.org>, David Airlie <airlied@gmail.com>, 
	Simona Vetter <simona@ffwll.ch>, Jonathan Marek <jonathan@marek.ca>, 
	linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
	linux-kernel@vger.kernel.org, Rob Clark <robdclark@chromium.org>
Subject: Re: [PATCH v5 2/2] drm/msm/dsi/phy: Define PHY_CMN_CLK_CFG[01]
 bitfields and simplify saving
Message-ID: <snvornde63yoviyjn6yitmz2vkw424jkyv4434jre7ts65cqe6@tbqgalok5e5n>
References: <20250219-drm-msm-phy-pll-cfg-reg-v5-0-d28973fa513a@linaro.org>
 <20250219-drm-msm-phy-pll-cfg-reg-v5-2-d28973fa513a@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250219-drm-msm-phy-pll-cfg-reg-v5-2-d28973fa513a@linaro.org>

On Wed, Feb 19, 2025 at 05:23:33PM +0100, Krzysztof Kozlowski wrote:
> Add bitfields for PHY_CMN_CLK_CFG0 and PHY_CMN_CLK_CFG1 registers to
> avoid hard-coding bit masks and shifts and make the code a bit more
> readable.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> 
> ---
> 
> Changes in v5:
> 1. Split part touching pll_7nm_register() to new patch.
> 2. Update commit msg.
> 
> Changes in v4:
> 1. Add mising bitfield.h include
> 2. One more FIELD_GET and DSI_7nm_PHY_CMN_CLK_CFG1_DSICLK_SEL (Dmitry)
> 
> Changes in v3:
> 1. Use FIELD_GET
> 2. Keep separate bit_clk_div and pix_clk_div
> 3. Rebase (some things moved to previous patches)
> 
> Changes in v2:
> 1. New patch
> ---
>  drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c | 10 ++++++----
>  1 file changed, 6 insertions(+), 4 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry

