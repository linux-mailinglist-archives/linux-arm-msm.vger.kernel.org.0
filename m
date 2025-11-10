Return-Path: <linux-arm-msm+bounces-80979-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 6AEB4C46091
	for <lists+linux-arm-msm@lfdr.de>; Mon, 10 Nov 2025 11:47:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 52B6C4E2B6D
	for <lists+linux-arm-msm@lfdr.de>; Mon, 10 Nov 2025 10:47:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AF98E305E27;
	Mon, 10 Nov 2025 10:47:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="agia5V3S"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com [209.85.210.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF1E43002B6
	for <linux-arm-msm@vger.kernel.org>; Mon, 10 Nov 2025 10:47:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762771630; cv=none; b=lmkpoQ8PFVaENPZiPIDsnPlaGtFC7DRYkNcqZbwthNLXGZbT1Q716ahHROfJUcIQClg/R/VlNFTWRkZgFpwivRW1pggb8utYH7XjwrCWg+bAkCaTFIqaPpufx8OaD+UbcnZQ8BuZyPaOtYNHnOx8GSH65kfoVxA44K+hTcjaPpM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762771630; c=relaxed/simple;
	bh=KWD0dSUvwuItAstvLunIOIEZaKlPBNCzkWHJb6tbpAw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Hko9Zk6ynwBTeQiVjKix5NoR61wEHNOnHZTJ2Q+qJpcDGHea2rCHRY8MBgm8RYpA7NpisMIZaeoCQRHQ84gII4fGrz2lohUjLEJNIVrsSlJcPjpd0vdNs3OW19ar3PcUwx9yd7By73oklqV3xkcCgP2d+j/RIHZdBC1+Ro8QjA0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=agia5V3S; arc=none smtp.client-ip=209.85.210.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-pf1-f175.google.com with SMTP id d2e1a72fcca58-781997d195aso1788847b3a.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 10 Nov 2025 02:47:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1762771628; x=1763376428; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=XQGzwKFQ+Rtg1mWaUwQhxw/U0dzqmCy2pKOiipYqOes=;
        b=agia5V3S5b6p8rNCtswM2bwpKA2BcIZN3zwGq/H4x9Reiy+69Mrag/JDp8TKRYhX2k
         JXgFq4h90CGcbWwlHOvicKRM4IQwVxLlpF6UIaL5RLSQf0RoH8KPvApcPoQ3gHW1HU6S
         RKUoOJrCH2/iQUIm8yNqen2ZfcHKhVOnj1fWhgUp/sXw4YFPUQ93IUT3WLK5zqNxiAvM
         JWc6kChJfnR82ToN812xj+HuHKuoOl0A8nJEltYzU1hLP+XIJ4x04DyMmNWCEWCUoDWN
         KNh0f8YDC5xz5+xiBclkanJA5vzHjvDCbKG5Yi9CB7kpxI+bhRkFl8UTugirGfReI41l
         WXBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762771628; x=1763376428;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XQGzwKFQ+Rtg1mWaUwQhxw/U0dzqmCy2pKOiipYqOes=;
        b=Fo04FnWEKnTIyddoWjAGbQJX5HiTG/YWEyfTHE9zkMHDoG3i4gMm936bUQxB7noyXt
         ntWvY7KO2BaAH3DojnCUp/KR5Tbi38/1zLkAajm5/dhcqYJnskB+iWG6ZYP9aa5C1jwb
         oudVwm+BbCutbUheq2mFyy7bzmhDTFlEHhB4QmFja6UQX4Ii264KDTbyIOWKHA6bBUWU
         sBRgLrkhfR7mE2xp6oqBSWX4zGBCKp//MklpseshmE2Jo/x1+zaSaUV4TJset5aCcWuZ
         xiF/sGG0I1Q3ZDW7zZPEg/4c0KTDMWSErrXXFe4nB7xZGuwVGoNQY9K72f/l6x5OE9SV
         iVfQ==
X-Forwarded-Encrypted: i=1; AJvYcCWaQfU1kooirR6nbaJUGvGJjWupexxa+23LdYdU9742kV9QpOpyFnl/UADb+gikiCCIMQi53w9qrw0xcHFv@vger.kernel.org
X-Gm-Message-State: AOJu0YyIUpz8mMHosnBo/REITbr93OwGjp+H/IL64+xLiA3r5Ne6XKaU
	Q0MfQ9pENqeLyTqwiejLffeRVe4X9AcMGTzW/sAgUlEezAUE1UpJTKv3G73QHwYNKClxzWlJHlN
	wWjO6
X-Gm-Gg: ASbGnctkMG/iBTrRM7ngXQECmvYcbgGss9hY3IvAkkquV0Z18ivDUSU62pRZHjW87WR
	T6G8ERMCQD8Eh0gog3g7I+V0lbqgd0XrjLnvyNf6sVQbS7iNnQ5hyIdRS0WFF0kUTEFJJVzBvPK
	yFHTC3V9gAd3nUQMY2xnMCzJtvA4SJKJJfRDAj4xWqeBpoMU166AUTctuAgUQ3icah30+oQaw+U
	VUBgLqtV9+2jOgGdGh7Lq08gaN8mILmkJIXm3X20e+iwUfO5HTVfQr6G+NaOGZpCmyYVvFrxRHz
	b2B2aGYzAghuzJ5nIEy6PkmgqFdENACbPiGCL0m/jZLqN6Nl+xl09psUv7TGHOO5NWA9JX8+x2x
	WVqLzkPe3rxzxm5jEnndHVdgH+c9UDl9+xvrEQ3lMOftN98XwVTK+z53DrPc5PIg2xTHIe4YuMR
	MuOqwApD0ejXY=
X-Google-Smtp-Source: AGHT+IHg+DThhk+gJUORdYe/ePATJKcs+WA9A2y1rPJPIsw5mDbwrRCWQvQPcr7jYbijEjp+p5km1w==
X-Received: by 2002:a17:902:e888:b0:295:1aa7:edf7 with SMTP id d9443c01a7336-297e56be1c6mr87877225ad.30.1762771627875;
        Mon, 10 Nov 2025 02:47:07 -0800 (PST)
Received: from localhost ([122.172.86.94])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7b0cc179f77sm11235385b3a.34.2025.11.10.02.47.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Nov 2025 02:47:07 -0800 (PST)
Date: Mon, 10 Nov 2025 16:17:04 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Christian Marangi <ansuelsmth@gmail.com>
Cc: Ilia Lin <ilia.lin@kernel.org>, 
	"Rafael J. Wysocki" <rafael@kernel.org>, linux-arm-msm@vger.kernel.org, linux-pm@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, 
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH v4 1/1] cpufreq: qcom-nvmem: add compatible fallback for
 ipq806x for no SMEM
Message-ID: <y4ys4cp42vp3air2lnlbcglfbh42siguh5zpo3hxugqswwzrdy@qz7mrdzzmhnt>
References: <20251105112136.371376-1-ansuelsmth@gmail.com>
 <20251105112136.371376-2-ansuelsmth@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251105112136.371376-2-ansuelsmth@gmail.com>

On 05-11-25, 12:21, Christian Marangi wrote:
> On some IPQ806x SoC SMEM might be not initialized by SBL. This is the
> case for some Google devices (the OnHub family) that can't make use of
> SMEM to detect the SoC ID (and socinfo can't be used either as it does
> depends on SMEM presence).
> 
> To handle these specific case, check if the SMEM is not initialized (by
> checking if the qcom_smem_get_soc_id returns -ENODEV) and fallback to
> OF machine compatible checking to identify the SoC variant.
> 
> Suggested-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
> ---
>  drivers/cpufreq/qcom-cpufreq-nvmem.c | 35 ++++++++++++++++++++++++++--
>  1 file changed, 33 insertions(+), 2 deletions(-)

Applied. Thanks.

-- 
viresh

