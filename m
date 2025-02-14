Return-Path: <linux-arm-msm+bounces-48048-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id CD523A3617B
	for <lists+linux-arm-msm@lfdr.de>; Fri, 14 Feb 2025 16:22:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 156147A5650
	for <lists+linux-arm-msm@lfdr.de>; Fri, 14 Feb 2025 15:19:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7287F267713;
	Fri, 14 Feb 2025 15:19:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="UGi5HpTG"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f178.google.com (mail-lj1-f178.google.com [209.85.208.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD4352676DE
	for <linux-arm-msm@vger.kernel.org>; Fri, 14 Feb 2025 15:19:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739546353; cv=none; b=E02U3DoRDsTFap53Wmcl8NO0fBqrdvtJk54dHNWEtVstdGTYyACMAepQHWe7d9ezxe39MRkO/NdrKmcLJE5F6sHNI01/b6gf/WLIXtNxfO+QVdDF3pqYdWB6Ee0poxT4dT2PT7xC7wbWKP3NzKIKwRRwAqNnP6B4F2k8OgJjiXQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739546353; c=relaxed/simple;
	bh=QI34gneP6eeV8Oq7CHom0A3/L+8ood8Y1cC/vLDPlGg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Qm3xBluwYY3ehedewZVvPfqM7bkE3FJQw2zTQx02+loVEBAZzpTRALGmUuvThM69m3K40uvGcnqD19jgiWHQ5WQXAYZFLnlI6XW7jZdUNoDyPuTUpiwwOLxAfBHNFP6gsr5LNiteF/B2R0aA6fdhcaiGpdCew5mHvSxQsisgsAw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=UGi5HpTG; arc=none smtp.client-ip=209.85.208.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f178.google.com with SMTP id 38308e7fff4ca-30227c56b11so22361131fa.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 14 Feb 2025 07:19:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1739546350; x=1740151150; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=iazVnHSVmXcB7TiTuN2+wvNduJRAxfMyPBRb2NxJE08=;
        b=UGi5HpTG0GdWrgt5mG7o8PXKS43djCblRZJD8oIXwtIW05nbQsqtjjIwEjUva5XIWm
         ACr+NjsWETH7yqkACiaMS/HocT5a/GrcjXVJ/SlFfVgrkky9RAT6WycBXjy9yAAt0yem
         Uw42tCYW13JlNTnycdOZWOtQmLW898v3t/ffu1+mDbcfKoNSKQevCBZIjXMdEBAWDKQO
         fPI/Q+HAtvfF2hHVLtxJ+RL5/cmRBoJTD987Fi91pKUZRNjOd+k2LzvX+r10GV8qM4Vg
         1JJ87kIv9CuhKAKaJHRMb/PXi2bHtRgOG9t49hr1MjaJOJxujcXIrIa8LCf0w3B6a1iG
         7pcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739546350; x=1740151150;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iazVnHSVmXcB7TiTuN2+wvNduJRAxfMyPBRb2NxJE08=;
        b=bfInfrKodEEcqifUNMj+j/gpNlO3fUZkztcD0hOHWltoZ5HMsJUwhlzdYBX9zznFZf
         +kWm++i6NVu5xVy0LnUKpAzmcQaqovuIWHd1EmY/Xhcn0foawJvN9fVPA5qveUwyw0ac
         0119bdSQ6ju90wSIe0Sdb5HwBUvGEMCoFEHbTjzIRt0MHYiaA26cs4NNika4+aV7mbQw
         Bm/gXj1IzXOSq7DP7JFhCmg9Qjepq68a4Wy7F6irjqbGmVQYURkEjpsWawxo9bhEWVtA
         iQp1wFWsOx0zmWMl7UDjI5iz3AaXpaC3MBormMphBWpKD9DG912vGUATFiU2tfLJCHtr
         04pQ==
X-Forwarded-Encrypted: i=1; AJvYcCW1qypdbN9Qty0EFlZMZy1Zr9vTbKBFeKteJYzD7HHQpmzBLAAQmaHX4jkOcFrLMwWrvQAmMnULcdMewviy@vger.kernel.org
X-Gm-Message-State: AOJu0YwKrRp7nh5McTNrjs9Q3eFM5LPEBxZU8oFvSdG16XU1NIpN5e7q
	x5HSwc3IFOoovK0lUF+hlcm92KIfN/yM1+KRN3DIC/G4nf8Bb1ITRQICZTzUcw8=
X-Gm-Gg: ASbGncsSZcQBDBtkWVMDbUTsP76KBaoCJ8VPDkC0kD4DxcJf3kQGR0fHdaY9M5K6/PC
	nDeB7trWjdOuVSINtQWuEe3wfZinE3ejimwhZ/PleNHbkbimLg0+xcPD18HD7DopCXyEfw5xLWi
	l/MYFHXqRGVhE5LeSoI/ZAR6HjDX/9DBawdoYBTGrLzc989avgd5Hekx4VtC5RXhJTt73dIAuOy
	u/WGvzTW0AvqlzkQH40Yz+NV6UL9xYPJWC4W+pg+r7uBIYUNgqLxhbxDcpC/8vfkTUTy4xL/Dyv
	HdYuCf5PmgTJugwGfOcuoy3nxuUiHWCho2moS/Bak2p0VF0G16uCvraszotL9Fw5Rmqs8CY=
X-Google-Smtp-Source: AGHT+IH4shqyBncbJWQ5+kQEmxXsyHynCpre9rBcdgpBSO7ycHWzcV+vcZr39orzd4H2/RKGIH2RfA==
X-Received: by 2002:a05:651c:1546:b0:308:eb34:1012 with SMTP id 38308e7fff4ca-309050915ebmr41358031fa.30.1739546349771;
        Fri, 14 Feb 2025 07:19:09 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-309100c52f8sm6085611fa.8.2025.02.14.07.19.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Feb 2025 07:19:08 -0800 (PST)
Date: Fri, 14 Feb 2025 17:19:07 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Rob Clark <robdclark@gmail.com>, 
	Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
	Marijn Suijten <marijn.suijten@somainline.org>, David Airlie <airlied@gmail.com>, 
	Simona Vetter <simona@ffwll.ch>, Jonathan Marek <jonathan@marek.ca>, 
	linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
	linux-kernel@vger.kernel.org, Rob Clark <robdclark@chromium.org>
Subject: Re: [PATCH v3 3/4] drm/msm/dsi/phy: Do not overwite PHY_CMN_CLK_CFG1
 when choosing bitclk source
Message-ID: <5mdw46egzwzyozejgofuw2cgntznovjpzkkkkxd76s5y4ol44x@zfa5ydz6ta5s>
References: <20250214-drm-msm-phy-pll-cfg-reg-v3-0-0943b850722c@linaro.org>
 <20250214-drm-msm-phy-pll-cfg-reg-v3-3-0943b850722c@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250214-drm-msm-phy-pll-cfg-reg-v3-3-0943b850722c@linaro.org>

On Fri, Feb 14, 2025 at 04:08:43PM +0100, Krzysztof Kozlowski wrote:
> PHY_CMN_CLK_CFG1 register has four fields being used in the driver: DSI
> clock divider, source of bitclk and two for enabling the DSI PHY PLL
> clocks.
> 
> dsi_7nm_set_usecase() sets only the source of bitclk, so should leave
> all other bits untouched.  Use newly introduced
> dsi_pll_cmn_clk_cfg1_update() to update respective bits without
> overwriting the rest.
> 
> While shuffling the code, define and use PHY_CMN_CLK_CFG1 bitfields to
> make the code more readable and obvious.
> 
> Fixes: 1ef7c99d145c ("drm/msm/dsi: add support for 7nm DSI PHY/PLL")
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> 
> ---
> 
> Changes in v3:
> 1. Define bitfields (move here parts from patch #4)
> ---
>  drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c             | 4 ++--
>  drivers/gpu/drm/msm/registers/display/dsi_phy_7nm.xml | 1 +
>  2 files changed, 3 insertions(+), 2 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry

