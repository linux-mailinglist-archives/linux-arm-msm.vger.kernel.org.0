Return-Path: <linux-arm-msm+bounces-20574-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DCDD8CFC8B
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 May 2024 11:14:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6BF511C20E27
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 May 2024 09:14:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1D9EA69D31;
	Mon, 27 May 2024 09:14:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="KGJ/1+qU"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 602FC43AB5
	for <linux-arm-msm@vger.kernel.org>; Mon, 27 May 2024 09:13:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716801240; cv=none; b=En3446+3Sm/vbF7OfZR7SQda5I1oCO15Gyabg3JkPRkeEyTzhY6qj4nyr6lsfqoAhHPLg01v/87RAQf/cCmb2/z0HFMkjUpMnfWWEAAOFcu/8dVAqLIjd5kCnsanP4sca8db/4n6RQpSW7q3sc4WApyw8bzE+xMdFFoP6Zk0Inw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716801240; c=relaxed/simple;
	bh=JsRHev1Ql+06KUhRx46fWyhIYNRL9SDHIC1akpSgRY4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TVyW3rBS20xO+sV5hxeXekIEisJdOEr6yGpsmwipm1iReQ4b8pO3H4TC5jRj1piT0RLI4xPqHYBWh9kdZDwOh1q+H9Rhcksj25gPJJ5GC55Z+KCjqxRyVNvUiB6YLl8dxbgvNlgRTAQQyCXhyCbMoMdfT0kMcdmEJoj1oiz0iXg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=KGJ/1+qU; arc=none smtp.client-ip=209.85.167.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-5295e488248so3286072e87.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 27 May 2024 02:13:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1716801236; x=1717406036; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=fU7wt3RoJ/ZRhVzR1OvMGpUkhRA7vQQ7+ZvSLIkQePg=;
        b=KGJ/1+qUKQdBNzF9JckUusqTx1HeNcYOaHewHYClltozMuVmv1UT72zlzwOjOFIkxu
         vxghFXG9U3FNuzfTpCo6LrnmunwUy9arI8SUgiFu0Zo1NbCvf7UKrT3h1Erui/H8cz6C
         DR1wXro6IN9J9hdU+iSxKrqbQijqGyQu6E8p1r6Gz/OeeRb2W+H7z4Cp2VO6NQxa3k3i
         NzEIfI+VL6LPBA7NaxxsTCDhFxJt8I2DM6sNiZhn/dB3aRe/BZCKHXFD0P409G1jujdj
         hjF/4y3ZsJeJG46aMZ78niI4eShy30uZAWcSB1b4+Rs32CPcV8C+4SpkyqnngCGX/IgF
         2rOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716801236; x=1717406036;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fU7wt3RoJ/ZRhVzR1OvMGpUkhRA7vQQ7+ZvSLIkQePg=;
        b=WkXbwibxeVT6pgngKCMXy2iHBH7E9mFDb89D48ZThGOiwgTEzQ68/qrr79SoS9XpEv
         Ne9knqL6UaPv+ICSZTXnusL6emmHFM+NrkESIq8+FQaD/OsusglS3dLdnMWN5E1zUBNA
         2kIdlgjLa6XUJM3m+SxjO+l0Azv96fyonpb7ySA4JDIcHCkuOGlaGzDV9KV4XUsURcXv
         52ZUOaiuzZGhneELkcpttWu7TMupo48lcln6Z/MyVppweFcd/sm+bOAczXdof5fSkqCB
         Z+GNXR+2clVRZG5Y3yOHY/tr8rx1l3KmicJRssEvIM6PXM20q2c1vGKI+dhLou+0Tl0w
         cNtg==
X-Forwarded-Encrypted: i=1; AJvYcCX1FzsxQ/9Z5CN+0eGCtKfTYxeVqDewCObN2eNh2nY/k7XZf4C3ClGEqWaflLGOWJ8O09xySrKhN8it5dxOUYzyeUDdVaBmJM4ihQXTLg==
X-Gm-Message-State: AOJu0YxdEwvE8OO1bvRap8hkanA5866HI20nuCo2WAwyyinOcKLt0Oas
	+y3+Fco8Ad8e8pkizMk3uX6wk7lUmqYsESEY8LLv0yQtop/0NXl9iWCFeH7NLj0=
X-Google-Smtp-Source: AGHT+IFVa65amKWg0sDvxcneN95XLq2oAjYgTo5y33Nlr/ZBV8Jie8NEAzCjb5dV3ztVi9w84Tah4A==
X-Received: by 2002:a19:7502:0:b0:524:68f8:9566 with SMTP id 2adb3069b0e04-52964bb2c9dmr4994304e87.30.1716801236570;
        Mon, 27 May 2024 02:13:56 -0700 (PDT)
Received: from eriador.lumag.spb.ru (dzdbxzyyyyyyyyyyyykxt-3.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::227])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5296ee4ad1asm500411e87.95.2024.05.27.02.13.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 May 2024 02:13:56 -0700 (PDT)
Date: Mon, 27 May 2024 12:13:54 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Abel Vesa <abel.vesa@linaro.org>
Cc: Vinod Koul <vkoul@kernel.org>, 
	Kishon Vijay Abraham I <kishon@kernel.org>, linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Kuogee Hsieh <quic_khsieh@quicinc.com>
Subject: Re: [PATCH 3/3] phy: qcom: qmp-combo: Switch from V6 to V6 N4
 register offsets
Message-ID: <zbveo2mdozzumc3gekvochcemfhy3e4eo4dc3sgyfivlxpjbzx@if6svye4wvhz>
References: <20240527-x1e80100-phy-qualcomm-combo-fix-dp-v1-0-be8a0b882117@linaro.org>
 <20240527-x1e80100-phy-qualcomm-combo-fix-dp-v1-3-be8a0b882117@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240527-x1e80100-phy-qualcomm-combo-fix-dp-v1-3-be8a0b882117@linaro.org>

On Mon, May 27, 2024 at 10:20:37AM +0300, Abel Vesa wrote:
> Currently, none of the X1E80100 supported boards upstream have enabled
> DP. As for USB, the reason it is not broken when it's obvious that the
> offsets are wrong is because the only difference with respect to USB is
> the difference in register name. The V6 uses QPHY_V6_PCS_CDR_RESET_TIME
> while V6 N4 uses QPHY_V6_N4_PCS_RX_CONFIG. Now, in order for the DP to
> work, the DP serdes tables need to be added as they have different
> values for V6 N4 when compared to V6 ones, even though they use the same
> V6 offsets. While at it, switch swing and pre-emphasis tables to V6 as
> well.
> 
> Fixes: d7b3579f84f7 ("phy: qcom-qmp-combo: Add x1e80100 USB/DP combo phys")
> Co-developed-by: Kuogee Hsieh <quic_khsieh@quicinc.com>
> Signed-off-by: Kuogee Hsieh <quic_khsieh@quicinc.com>
> Signed-off-by: Abel Vesa <abel.vesa@linaro.org>
> ---
>  drivers/phy/qualcomm/phy-qcom-qmp-combo.c | 189 +++++++++++++++++++++++++-----
>  drivers/phy/qualcomm/phy-qcom-qmp.h       |   2 +
>  2 files changed, 162 insertions(+), 29 deletions(-)

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry

