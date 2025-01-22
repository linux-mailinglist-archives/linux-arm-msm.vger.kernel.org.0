Return-Path: <linux-arm-msm+bounces-45877-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FC8BA19B2F
	for <lists+linux-arm-msm@lfdr.de>; Thu, 23 Jan 2025 00:00:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 70B6B188D521
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 Jan 2025 23:00:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E6A121CCEED;
	Wed, 22 Jan 2025 22:59:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="R7BdtyTl"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com [209.85.167.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05CB21CBE94
	for <linux-arm-msm@vger.kernel.org>; Wed, 22 Jan 2025 22:59:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737586795; cv=none; b=pNZIzrC9qVBS1s9QYPLWQUwvLNUzDNRWH0bEI9RB4ohQrUM7od5/TTNqF9mTeSpunyQF4WUAcoQdduLtXkNBBzDASwBvsi+TZYjhBeRbmQSuTZwhheok1DgVSdsF58dEfqMYqUd49ys9NVJT6h7LBTgOBrpn64bWL+9A6KISFBE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737586795; c=relaxed/simple;
	bh=Gw6aO18MI81yiBJ4Yam0mKSRn4pYcWrOAMDieD3514E=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Det+KYmzPousIxaDIxMunGPU7CiDiCjo9oHZ2g2cULbbcPNP+FsSCyYZ6oDyyUHFz4yH+aeToSaAxhLFz+gQfqJO1L4SW0OH6GthI/obMqe552llSK0sHfjPxGtP2wwHuZRi0OOmqL6hnQ2neovRXAP5KmCfHfXFN4qnJhzVsK8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=R7BdtyTl; arc=none smtp.client-ip=209.85.167.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-53df80eeeedso333923e87.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 22 Jan 2025 14:59:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1737586792; x=1738191592; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=nPtAqf7h4WbDjoQxKkUsSup+gLFR5DpH6tAiQ8agGsA=;
        b=R7BdtyTlQWtz25PdRouIDkpJu34anogINNd7e05+6tky5xGAj6/wYg8GBzvl1Ijz/k
         T6dWC7iLAOZgWlF2V0L3icbaLeNwtrTDRrO9rYHg9IsSHf2ic7Y6PSL/uORfTjJdIyy8
         5ftmHSPlPeVIeRoyUSoXCnN/sjeFmfzOOZJpJbNSn5s73vCkrKRCjqfwbTqPwezAg4Mw
         +dhhPQmkm60FgwuqhAyR8UCvHTTFJDl4O0wwjNdLILsy/EtMbH7b6/jFWfM7HVbm1Uy8
         2/RjEEJ2/PpdG2j7J1SRY/07HpqKJ1v/UugNP62ujz+ImDkwEmi6J1cTZGkbB3wk6gmF
         IOzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737586792; x=1738191592;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nPtAqf7h4WbDjoQxKkUsSup+gLFR5DpH6tAiQ8agGsA=;
        b=N/D6oAqe8UzutXzDqRQ6oy0ve2yaJJoF2F2UNCnllZN5mVBnDCm47tdryp02L5ltGT
         R1p2PUxOmVPsIAe4XlXNizLJusEAtXXUuoL97RIqH2737tRssHoBjUL7oK7rxIDN8ug9
         q8eEi27PyR6zDiazFneE8x0KFgTeJ9DWwXdIeQH+AzE/R3kTrNA0MdPm4SZEiLk4utcE
         E/iy7FvJz0zFBiEe95MJKiULOnXjf7jbx64I8tDLASc9IlB1uB9FzuXFkoAisazhmyXJ
         i4bzgPlZdppIymbtK0zCn344OhqjaVPqpnTwwe8WCZC36U5o3zkEwFbrwPoEV1Rs99u0
         UY/A==
X-Gm-Message-State: AOJu0YyaudTHBDIpCb+Y7t8CoIEHTN4N9BO9IBPkRkOn4+lqwJWiTusj
	+1ZbBsYnrM05CovRYbNA1JHr3kz75Ki/H7L5WiSYAxzTvOqCUvQEAwlIgop0hcM=
X-Gm-Gg: ASbGncvZq05uQMuIiTPXTEadj3/TOi/RNEe9ifF9TM07b8ZYDIt5YSQ2Wyhy1Q+zQeP
	ML1tzCZRiJqPrFOjO5koTpAoVi0te8srcexASobla/kNkY9Vq5BKiPBOQQPhI19Xb3CeXZbhKtH
	i0JntvRCU2Ict0bWIsH+xQub9ZqZ/tl/QVu9vHAh7MmY34clIhBZWIj3fKcNo7j1bFUn0WGQDDy
	HEuZv75jIv7Jz9shw/Np/lZHNfOqgBGOSCX/Gw0nqbjVfH+Zlq8UE/JCDYz1emmCvMr/0MNm6y7
	V5vDD9sc6e/NbpN7qkqCw678qHfSKP8eqVBSvqAM0ATpPctPjA==
X-Google-Smtp-Source: AGHT+IFnKUjYvAFf5DAYAn9dE3QKH4so4aqvmh/myx238vmXYZ/YV9GFfYVpxi9d0GEQJnHVZM7HIw==
X-Received: by 2002:ac2:5a59:0:b0:53f:8c46:42bc with SMTP id 2adb3069b0e04-5439c21f314mr6198692e87.2.1737586792081;
        Wed, 22 Jan 2025 14:59:52 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5439af732d2sm2375845e87.176.2025.01.22.14.59.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Jan 2025 14:59:50 -0800 (PST)
Date: Thu, 23 Jan 2025 00:59:48 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Jordan Crouse <jorcrous@amazon.com>
Cc: linux-arm-msm@vger.kernel.org, Bjorn Andersson <andersson@kernel.org>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, linux-clk@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] clk: qcom: camcc-sm8250: Use clk_rcg2_shared_ops for
 some RCGs
Message-ID: <hafo5mhkxcfmfq33it4dyp3ufzep4aqyf23vj373raivrrnmwp@xrotohpyjvt6>
References: <20250122222612.32351-1-jorcrous@amazon.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250122222612.32351-1-jorcrous@amazon.com>

On Wed, Jan 22, 2025 at 10:26:12PM +0000, Jordan Crouse wrote:
> Update some RCGs on the sm8250 camera clock controller to use
> clk_rcg2_shared_ops. The shared_ops ensure the RCGs get parked
> to the XO during clock disable to prevent the clocks from locking up
> when the GDSC is enabled. These mirror similar fixes for other controllers
> such as commit e5c359f70e4b ("clk: qcom: camcc: Update the clock ops for
> the SC7180").
> 
> Signed-off-by: Jordan Crouse <jorcrous@amazon.com>
> ---
> 
> (no changes since v1)

Well, it should be "updated commit message to refer relevant commit".
Anyway,

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>


> 
>  drivers/clk/qcom/camcc-sm8250.c | 56 ++++++++++++++++-----------------
>  1 file changed, 28 insertions(+), 28 deletions(-)
> 
-- 
With best wishes
Dmitry

