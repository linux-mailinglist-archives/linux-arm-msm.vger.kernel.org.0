Return-Path: <linux-arm-msm+bounces-27794-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A4DA945F28
	for <lists+linux-arm-msm@lfdr.de>; Fri,  2 Aug 2024 16:10:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2490D284339
	for <lists+linux-arm-msm@lfdr.de>; Fri,  2 Aug 2024 14:10:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7C3A91E3CB8;
	Fri,  2 Aug 2024 14:10:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="broSif41"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 541A614A0A0;
	Fri,  2 Aug 2024 14:10:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722607833; cv=none; b=ThI1hpaQL5+ggz1LhLYrlDCSwvHFxH/jVSp6WEBZDt+k8T14YS22x5dxYH4KwqIDaKF6FqxH17yelK1xYhis6/SIO+Ys8wPfHuJf/y/pxUBp74dDUh+HRCOcpsVtpsRSzfClL+S4aSie9YneAaM19Uy/O0Q7L1zPg5ODndaWW30=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722607833; c=relaxed/simple;
	bh=t5TXMfkAFtrA0zYUGHYsxBjB6x511pWd/0k0tqIstK4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=AlIKxF55jeNVqDnXSQgqUC1+7z1nlSnN0i7Ki8UIU6paAWpuzSiUpGKkyhzlP+tCdwq8KkqkM7LVgssQe4/WcctpmAUgWBiFPvfaWWIzfxR7fOPkk4fbjRyZaSJBwMPJmimEQl0HXO8cLXkJOSTm+FdIYFH5iDg0i8LP6bXPfh4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=broSif41; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8CA39C32782;
	Fri,  2 Aug 2024 14:10:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1722607833;
	bh=t5TXMfkAFtrA0zYUGHYsxBjB6x511pWd/0k0tqIstK4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=broSif41v8x6AAdGNq6ymOWqaVU5xZqQoqe70jksXTqk+gsFYAOjFCI4z0oFRjZqK
	 3FKDJHH9cTiMNafacD0R6DxaDUjY+h9M7X6sSK3CWB0VdOzaOz3BwuzRedSwG/FQRu
	 wiUB7yx1zwTDhRw6oFWpdR2uWZLRN+mj/NiRKd6gzpcLpY5PrvNCpeokVXnWxxl38k
	 LhVU1ZLtc9tGxx/eqbBR+Itba7gwsN2O5syfBoxqzWBAsjJYSODAT7FugBqvf38lsu
	 gSIJdVFdZaob0EYDsfh6K3Ah0RPqZSZLnNMUEdGDPwdy9HfYY1D3qHTbIW77inB3bZ
	 XIc+Zxd7Wd2AQ==
Date: Fri, 2 Aug 2024 19:40:27 +0530
From: Vinod Koul <vkoul@kernel.org>
To: Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc: freedreno@lists.freedesktop.org,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	dri-devel@lists.freedesktop.org, quic_jesszhan@quicinc.com,
	dmitry.baryshkov@linaro.org, linux-arm-msm@vger.kernel.org,
	linux-phy@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] phy: qcom: com-qmp-combo: fix swing and pre-emphasis
 table for sm8350
Message-ID: <Zqzo08Siy5liaPAd@matsya>
References: <20240725220608.131426-1-quic_abhinavk@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240725220608.131426-1-quic_abhinavk@quicinc.com>

On 25-07-24, 15:06, Abhinav Kumar wrote:
> Fix the voltage swing and pre-emphasis tables for sm8350 as the current
> one do not match the hardware docs.
> 
> Fixes: ef14aff107bd ("phy: qcom: com-qmp-combo: add SM8350 & SM8450 support")
> Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
> ---
>  drivers/phy/qualcomm/phy-qcom-qmp-combo.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-combo.c b/drivers/phy/qualcomm/phy-qcom-qmp-combo.c
> index 31e43638a649..c15b01aa5a48 100644
> --- a/drivers/phy/qualcomm/phy-qcom-qmp-combo.c
> +++ b/drivers/phy/qualcomm/phy-qcom-qmp-combo.c
> @@ -1946,8 +1946,8 @@ static const struct qmp_phy_cfg sm8350_usb3dpphy_cfg = {
>  
>  	.swing_hbr_rbr		= &qmp_dp_v4_voltage_swing_hbr_rbr,
>  	.pre_emphasis_hbr_rbr	= &qmp_dp_v4_pre_emphasis_hbr_rbr,
> -	.swing_hbr3_hbr2	= &qmp_dp_v3_voltage_swing_hbr3_hbr2,
> -	.pre_emphasis_hbr3_hbr2 = &qmp_dp_v4_pre_emphasis_hbr3_hbr2,
> +	.swing_hbr3_hbr2	= &qmp_dp_v5_voltage_swing_hbr3_hbr2,
> +	.pre_emphasis_hbr3_hbr2 = &qmp_dp_v5_pre_emphasis_hbr3_hbr2,

This is fine but you need to drop the unused qmp_dp_v4_pre_emphasis_hbr3_hbr2 table...

It adds a warning, defined but unused!

-- 
~Vinod

