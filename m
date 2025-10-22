Return-Path: <linux-arm-msm+bounces-78301-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 1570CBFB120
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 Oct 2025 11:07:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id EC3674E191F
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 Oct 2025 09:07:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5D8C330F54C;
	Wed, 22 Oct 2025 09:07:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="vWkTnnCx"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72BF83112DD
	for <linux-arm-msm@vger.kernel.org>; Wed, 22 Oct 2025 09:07:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761124073; cv=none; b=u+JW8vr0jiGb14RXv6zn5qkgJO/J6Qf2mvPPW906I/jgxAkZyT7FwTAMQPS/wsntufFha3EHvcMbYN7qinStVtAKCuWlkvxtzQWTxa/ppWPtHCZds9E3BgdbU814D7NAY8PEYpfL0k8SPMA9kIkzD0c9euxiMjUweKrhWJbJ/9I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761124073; c=relaxed/simple;
	bh=CK4ye5gW8ZQIbFQzPoD9lWgtQo2XoUG4XijMpi4CeCs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Xw1uNDXyBX2RtFhghvwbHRgQu3QHVwgDBFTcDuWiuUcfen1aRc5VFX+GDEwU0wAZJnPlPtDYL18qgXccJeMHh28dopiOCRwIEAU9CK295EJAS911Bzaz5g0RwgOoo0o5JM/mzM++Bjxq4ITL+JWwNjdo3JvOZUQS2DWXNHaG9zY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=vWkTnnCx; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-46fcf9f63b6so36836305e9.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 22 Oct 2025 02:07:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1761124070; x=1761728870; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=P1flJABJq76WrUF5m9yiOezJjduWZm513fvxhMdJAqE=;
        b=vWkTnnCxDGCfAS/HR102S0nuMNvpFa6Dy96qaXniOMLn31UI/w2ZA0Ur8BsqJHghXh
         Hbo/lR3O49NQbfQQR9Dcp0txzX6jrXpmSMrmoHZIsjDbbsYC4A/MQtvYJMW8Pv07G8kx
         eMBsSMfGaoyOIXnrqEY1wIzaPFfQIP3aIO4LoLVw2Uqdh4G9x8tRoEXODXP5j0tEh8AK
         tGmEiqM2YFf5fEDW58NX2O+3DnWqr/dNrFI4OoKWGfaM/IYtx/01DcJESJGnfrQTjsuj
         y95avoxVvYDiSolnHWBud9u+fJav3g97IrACeAFWBOB7u7Q/tMy89LauCaRdbijgOA1e
         fVcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761124070; x=1761728870;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=P1flJABJq76WrUF5m9yiOezJjduWZm513fvxhMdJAqE=;
        b=gDX4REgpXv4jN8L8JQMVA9cgtx7tqsM+759ex4rob50nRclD+UvYTSFL2DZMvfl4mP
         OIz19JWuFWGul5pOA1rqsS/N2hUVpASX08a9BznG02By9Nuzm0++spOw55qzS2KXRZ1F
         JyksryVNx+AgBwcRJfI9ZxQJgwBXzWYn3edfm9FvIv8+sz/chChfR+qo4jXvqL67BB9d
         sjZDvVYnaaMI6WB9Gm8ekmHClrs3ax30aV3koHtJNE+sYAJeFUXbyBQDhMBKIAUc8fBU
         X2mLkc9ei9qiLvZZ5XfybwlJmzCib2QOKjN1QxmB/vAnSAIFNRlPNScZhVwDIzKM58L+
         y5Lw==
X-Forwarded-Encrypted: i=1; AJvYcCXyPq35204XECRghpuCA280YWyJoRvz9W9mrRn/w8t8Mzp/0gTFqcXsmmNuCqdbjU9TBujT8QC9Alj16QII@vger.kernel.org
X-Gm-Message-State: AOJu0YwTP6/eULjdvrI02saKYSc7svCtPDbO/GsocyK9bviC/D38KLkp
	S4PFLWbL5MC7xQqNfs4TCITI1mx2hTUdyNFw9WhewjVMGcCvcTQ/saOuD2MXqxbqkHo=
X-Gm-Gg: ASbGnctLBASnymzTBZAXHIPI23kUjGsRB3XYJgzIlVhtLJLTHRAXsgFkjgzvJJHEZWp
	GkhOhvE0KLOxWEJVBgvmxc0qh7LV4Dqc81Sb6Aip65jbFFyAJM6GPLW/bqz3uVbw7RvqYpc/YmR
	ks7Xq5zkJsfJCmMGBUkyoXaKwijMjwFqs51esAThr6pnTTQ61D1WF5DLdFLbvqM4h7J8ojfZBkF
	ybPiTV1/2q4FCcrvbFzzUjePgmYRgdklqWl4/TK30pguccOiiEppVxcn2GqN7HKICAp6mWvmJic
	z5VSeid5LztUBhpffxM3N92//yGjCvZua/4SbupWvgUQk6GQ/2mx+D/vnqDBiURkns5w7Pjtp5D
	OVQR8ATfvSVbOC1EI4ugeFp12omLbo2OLfy92k9MhIPtw1Jokp1tl2LoTGfYwxVpYgmgy/CSi
X-Google-Smtp-Source: AGHT+IGFFlqpwATAAZ2BKrCrVb9D7HfZ5rwLRuh4BV5B0Yi0YMlAwBYfX4e0exoRZ0JufSPaMzAqQw==
X-Received: by 2002:a05:600c:3513:b0:471:1415:b545 with SMTP id 5b1f17b1804b1-4711786d625mr156848555e9.7.1761124069502;
        Wed, 22 Oct 2025 02:07:49 -0700 (PDT)
Received: from linaro.org ([86.121.7.169])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-475c428a16bsm38447755e9.5.2025.10.22.02.07.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Oct 2025 02:07:48 -0700 (PDT)
Date: Wed, 22 Oct 2025 12:07:47 +0300
From: Abel Vesa <abel.vesa@linaro.org>
To: Luca Weiss <luca.weiss@fairphone.com>
Cc: Bjorn Andersson <andersson@kernel.org>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Danila Tikhonov <danila@jiaxyga.com>, 
	Taniya Das <taniya.das@oss.qualcomm.com>, ~postmarketos/upstreaming@lists.sr.ht, 
	phone-devel@vger.kernel.org, linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] clk: qcom: camcc-sm6350: Fix PLL config of PLL2
Message-ID: <5j7dxbp6biaweup6k2gizbx2g5cf5kzf34jx7mhukrcto7mkz6@3azkzkr7bioc>
References: <20251021-agera-pll-fixups-v1-0-8c1d8aff4afc@fairphone.com>
 <20251021-agera-pll-fixups-v1-1-8c1d8aff4afc@fairphone.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251021-agera-pll-fixups-v1-1-8c1d8aff4afc@fairphone.com>

On 25-10-21 20:08:54, Luca Weiss wrote:
> The 'Agera' PLLs (with clk_agera_pll_configure) do not take some of the
> parameters that are provided in the vendor driver. Instead the upstream
> configuration should provide the final user_ctl value that is written to
> the USER_CTL register.
> 
> Fix the config so that the PLL is configured correctly, and fixes
> CAMCC_MCLK* being stuck off.
> 
> Fixes: 80f5451d9a7c ("clk: qcom: Add camera clock controller driver for SM6350")
> Suggested-by: Taniya Das <taniya.das@oss.qualcomm.com>
> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>

Reviewed-by: Abel Vesa <abel.vesa@linaro.org>

