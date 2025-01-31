Return-Path: <linux-arm-msm+bounces-46605-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 97224A2403E
	for <lists+linux-arm-msm@lfdr.de>; Fri, 31 Jan 2025 17:24:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A75BF1681B0
	for <lists+linux-arm-msm@lfdr.de>; Fri, 31 Jan 2025 16:24:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BEEAE1E3784;
	Fri, 31 Jan 2025 16:24:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="MiMBmQ36"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f180.google.com (mail-lj1-f180.google.com [209.85.208.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2EAA1E9B02
	for <linux-arm-msm@vger.kernel.org>; Fri, 31 Jan 2025 16:24:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738340671; cv=none; b=cDEK1Fy6rP11aES8tyXxjHwSb23vEWVgKO1f3XMOv3uRGdiTw9dcJvkClD9VsxAGCqSHmgstkPqbs6mT2qAt6GXh8bewMNJ1VoAm9iPdHdjz5+1iNeqWfqFhyUmOFu85vCyBe6y4wFaf6/g0o70h3CaTTqbCeZRBnjoFLjgIq1s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738340671; c=relaxed/simple;
	bh=EZ4ZH45qNXzKCS3lBhUz6baQ7yOTm+vianG7o2TOPnU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=T7BXd143K6lCMC4sYoj/1PKZ2vTWbFG+oWjvwcQvSSi4O70LGTwjQWOY1GCcSr3Fkpld15YQWeGEQ1XciDOYyyjt9V6t8xrrKw/i4L2slrx7Cf7rAG27jgpaXUFf+VtdwvrZsFRXRpz+jKA2Wa+HJxQzIQF0/2Sk0JQ2g+AnjK0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=MiMBmQ36; arc=none smtp.client-ip=209.85.208.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f180.google.com with SMTP id 38308e7fff4ca-303548a9361so16677271fa.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 31 Jan 2025 08:24:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1738340668; x=1738945468; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=l1OPRB6njxlUcUlHqiK6tXyv78044AchgI/F8gIyGgQ=;
        b=MiMBmQ361YU7CblNVu3W7F2ehHnkfp93RCB3dSjqgvZu9i+rQwsJPZ/XyY4F+B6OT2
         veDLrkRn7gjlum7lkI1oMDX9YuCyU+D/lANyu6ioWPiGvSBXAMZ+ruruAJ80Y2k3F58I
         nmqY7WshsESg6Hk1k74t8a22E2e4afaKRjAbs/Ms9VsAQ01ps6ZUZd/0J5R63uLXdpPP
         kOIw7Lvuec7L9d3om42D021XZh+tMOe04wF0UDttVvNjnTLO4bRtT0AYhYfUMBXpBWPK
         2055lp0OgMGSohWdXJKkJ5vn4rEWuvYuc9iz6O2xH/X2YloL+Pjf5wqCZ18XWeajvmK+
         CwIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738340668; x=1738945468;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=l1OPRB6njxlUcUlHqiK6tXyv78044AchgI/F8gIyGgQ=;
        b=InVpYF7PrqLxG24O1EmF1YtuV3WnUKPAKK2e5r0blskvB733yF/s0Zq8cTsKlI1EBq
         4vqCsgPw8ftygSaYscNDzDiZGSkwMj+H5ImZfeMKTQYC3u38V2jiQlZJM48/tKG4HnJI
         utxGYQ7DwtOW/M4BD3rmZThlTAp+Zc38tFro7xLgNgP8n8cTvtYO7dUzAFePurIcVg2U
         iKR1iuAak1k2MAuptjN/lLQilxLK26o49g2hX3WyTz/OAffl5Xs9Y9UKvVg06q6eqSYH
         OR70cXmZQdW2d0Jo+oBxZ1hohl4RuwfGS9PWGe4WPCD9rISXpKWg8OS1Ioa0l6kp1IuA
         cyYw==
X-Forwarded-Encrypted: i=1; AJvYcCWKtV+0QRbzbQU6yFRw1hUnAAJbP9gVeEUDEUe/Gm4hwwV+LArrEOiyGlbkxCpfdNZsNnaY/D6zIh5DKLsc@vger.kernel.org
X-Gm-Message-State: AOJu0YwVNiABq1YBP4Thxa2Mv5d5fchq8VhDCy2XzKl/2Bx83n9K5hev
	dRmc6u9C2epcZ9ud6PfAY+OlSIM4Pofsat/6QFfnG46ZpXb3BpOqudhM+YW7plk=
X-Gm-Gg: ASbGncuVYERK9/8HEaDoGGVBq742KB0X+pahw3PkAvJ0MuGd/5hQgmaohrXPg6SY8sq
	fQciO8bhjabuDABQ5+6XrCKI6vbYzXFHURFgTDpmqJBCzKt1HLZ/I/JUAPgBsLLp/6QWFkaQinA
	MBIMc1tOKZ5DPDjPi6VmnhyzejRY+B6FCTjFORLbnX4GflYoNwubDJHy8ePzh+UJX4hPc2N3YQt
	3PJ3bv12zhmhcff77htU3Y+fwsZKaCVMUndkiRjX8tEOGEkelnBKgrAaXksJbolmlC2vkutVOdq
	5cbWVl+tnTinFgWEciey5jhlavii/Y/nmz+JZZkuhHK6u2Ffmvi3M1XC6+5V+0UbFq7tKpE=
X-Google-Smtp-Source: AGHT+IET6Ip7seInrKN40IUQ5plgR5Wbm/yFknTx/GqkNshb2c2sHr/YKBS3/IVjV6dDw1EBZWuIdA==
X-Received: by 2002:a05:651c:2214:b0:302:25ef:813e with SMTP id 38308e7fff4ca-307968fa2acmr43084751fa.32.1738340667875;
        Fri, 31 Jan 2025 08:24:27 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-307a34282a5sm6090751fa.102.2025.01.31.08.24.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 31 Jan 2025 08:24:26 -0800 (PST)
Date: Fri, 31 Jan 2025 18:24:25 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Rob Clark <robdclark@gmail.com>, 
	Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
	Marijn Suijten <marijn.suijten@somainline.org>, David Airlie <airlied@gmail.com>, 
	Simona Vetter <simona@ffwll.ch>, linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/3] drm/msm/dsi/phy: Improvements around concurrent
 PHY_CMN_CLK_CFG[01]
Message-ID: <gyslnttjsuav5dsbmglroujpwrqazokfnj65uhbegja3w27yxc@iamitbbg2e7e>
References: <20250131-drm-msm-phy-pll-cfg-reg-v1-0-3b99efeb2e8d@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250131-drm-msm-phy-pll-cfg-reg-v1-0-3b99efeb2e8d@linaro.org>

On Fri, Jan 31, 2025 at 04:02:49PM +0100, Krzysztof Kozlowski wrote:
> Calling these improvements, not fixes, because I don't think we ever hit
> actual concurrency issue.  Although if we ever hit it, it would be very
> tricky to debug and find the cause.

All of the patches miss Fixes: tags.  Could you please provide those.

> 
> Best regards,
> Krzysztof
> 
> ---
> Krzysztof Kozlowski (3):
>       drm/msm/dsi/phy: Protect PHY_CMN_CLK_CFG0 updated from driver side
>       drm/msm/dsi/phy: Protect PHY_CMN_CLK_CFG1 against clock driver
>       drm/msm/dsi/phy: Do not overwite PHY_CMN_CLK_CFG1 when choosing bitclk source
> 
>  drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c | 50 ++++++++++++++++++++-----------
>  1 file changed, 33 insertions(+), 17 deletions(-)
> ---
> base-commit: 375ef7b3d85d8b0fa72092642582ca5b95a64e67
> change-id: 20250131-drm-msm-phy-pll-cfg-reg-7e5bf5aa9df6
> 
> Best regards,
> -- 
> Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> 

-- 
With best wishes
Dmitry

