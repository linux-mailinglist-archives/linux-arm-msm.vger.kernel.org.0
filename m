Return-Path: <linux-arm-msm+bounces-52504-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E903A71212
	for <lists+linux-arm-msm@lfdr.de>; Wed, 26 Mar 2025 09:08:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 2BCC1188C848
	for <lists+linux-arm-msm@lfdr.de>; Wed, 26 Mar 2025 08:08:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 29ED61A0B08;
	Wed, 26 Mar 2025 08:08:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="LhnkrNVW"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC1E119DF48;
	Wed, 26 Mar 2025 08:08:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742976514; cv=none; b=WGPCmfBmA+cBK3eLp8rv2VHEXln2XkoUQtL33uOEhW/ZYGG2ubL1Zwpv01xcHUBHeOXNDDQkqENv2j9wXJSAL1uc36M8hh8nGFaE2SJ+zKwvax4TjYk2DMfe69fo0aKdUp/8lcakC/54gkfUBEU5Mi6tTwmMsQBuAAiJ25O/p1o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742976514; c=relaxed/simple;
	bh=CDFf2aeXu4QXIiFbZUwZnAMW6FSK+tUT/RdaVv9VNrU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=uuq7lxdqz1eYx0N2LFLogdyBVF5MoX841r9P09wCXoHoXYtcHiU2BcRLCcAu9v4yT8ZkvuMWKdmyHwkvJBuCIth195xk1KCTXxkW5HHnX5xk37rGLNcvEDWKnb8zDWN2BdmgipKq1Q7gz6gzu5Xh7AkVJzZCQn8x2h/RcqM6IQA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=LhnkrNVW; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9D9BAC4CEE2;
	Wed, 26 Mar 2025 08:08:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1742976513;
	bh=CDFf2aeXu4QXIiFbZUwZnAMW6FSK+tUT/RdaVv9VNrU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=LhnkrNVWq0d5hbhno4LYFKTjshBak3FDQRA4QGpROYbmj8vw1FesRdCLkOUi2pyU6
	 X2cClnnG9c6d4ciAS1sb+5Kok8y/vukWa3WiG8YULWwr6fSWl6+2bMsjApcCAv6Yyw
	 wj5dFLiIEMsnLPoOPsk6BFeuK3WN6Gl9EywRwdShmk22sWV0szq9slCYUJa0mWtVea
	 O4fyd6TOmDVs2ES6ukMrY5PfvvXda5I8u8bbm0jLFHFEIvWe+wNyE8TsA7TvT2x5oY
	 2efh++eDThJB4eS9g4bxdEu5yfw95lnVrFDfDPWThuqkzqbMgHzEoAHx/qU1NxOxMa
	 hkBWm1877pcZw==
Date: Wed, 26 Mar 2025 09:08:29 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Christopher Obbard <christopher.obbard@linaro.org>
Cc: Douglas Anderson <dianders@chromium.org>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Jessica Zhang <quic_jesszhan@quicinc.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
	Simona Vetter <simona@ffwll.ch>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org, Johan Hovold <johan@kernel.org>, 
	Rui Miguel Silva <rui.silva@linaro.org>, Abel Vesa <abel.vesa@linaro.org>, devicetree@vger.kernel.org
Subject: Re: [PATCH v2 1/4] dt-bindings: display: panel: samsung,atna40yk20:
 document ATNA40YK20
Message-ID: <20250326-foxhound-of-nonstop-temperance-6f5a67@krzk-bin>
References: <20250325-wip-obbardc-qcom-t14s-oled-panel-v2-0-e9bc7c9d30cc@linaro.org>
 <20250325-wip-obbardc-qcom-t14s-oled-panel-v2-1-e9bc7c9d30cc@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250325-wip-obbardc-qcom-t14s-oled-panel-v2-1-e9bc7c9d30cc@linaro.org>

On Tue, Mar 25, 2025 at 07:21:26PM +0000, Christopher Obbard wrote:
> The Samsung ATNA40YK20 panel is a 14" AMOLED eDP panel. It is
> similar to the ATNA33XC20 except that it is larger and has a
> different resolution.
> 
> Signed-off-by: Christopher Obbard <christopher.obbard@linaro.org>
> ---
>  Documentation/devicetree/bindings/display/panel/samsung,atna33xc20.yaml | 2 ++
>  1 file changed, 2 insertions(+)

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof


