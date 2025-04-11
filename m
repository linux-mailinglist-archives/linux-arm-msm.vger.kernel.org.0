Return-Path: <linux-arm-msm+bounces-54004-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B108A85C40
	for <lists+linux-arm-msm@lfdr.de>; Fri, 11 Apr 2025 13:51:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8E9EF3BDAE0
	for <lists+linux-arm-msm@lfdr.de>; Fri, 11 Apr 2025 11:49:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A5AC029AAE4;
	Fri, 11 Apr 2025 11:49:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="igkt2VE8"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79A8B26AD9;
	Fri, 11 Apr 2025 11:49:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744372187; cv=none; b=INWxdNKHlYhuuA/hADqCNxR7vM4Oq7S6+e3AK5cPEGkOyF6R7pszgZV1MBOiw1NNcyFpY2CgjqXsCb06Wux66FSwS4ZsJT5SBgk9ITte0SGzbbSt19D3U/p83vPDUwxpBWH0mtZ9n4re9eSZ9LDQNqESCkv/P9O8MjHMQSdyYOY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744372187; c=relaxed/simple;
	bh=Y1jBqB8SPrhS4Y4w/rmv4NVxsWmmjHCT1zX7FJlSn8U=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=D5eXOEtgE1ArzHc2coAbM/BqLTpkaELyqMHiQ1LK6DNj7xpgaa3QzooC9cWp1fanz/fti3IIXZJe7wmHG5nWAA8NOarArXyzAow/dB7cm7UDU8wyZ2R02npgC9Lt6Aw7vgiyM+vGuF+d+2g95dwN4mrxFu6SPWEgsH3Pz0IZ36k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=igkt2VE8; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D7E00C4CEE2;
	Fri, 11 Apr 2025 11:49:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744372186;
	bh=Y1jBqB8SPrhS4Y4w/rmv4NVxsWmmjHCT1zX7FJlSn8U=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=igkt2VE8p0udba4TvCkKsv0xiU0tUm3e5M/XGbSLrV7UD28g8nyd/6e7DKEwO3uVf
	 1W9Z/VWJtH7C0QwvrphmcMBlMMUBzzsI8McD/PqLgPl0bytGjyx42SbTr6UaIJFVQt
	 GZba/dgqwKgfGTKYKPBPgVmcs7TylcG9zE8Z07tDC061yVazw8szAHVGUaEnD82hMl
	 WTJ/jmNJ/TsuHp1lvKcryh6e2YVBaQXjLrRxmL0aCG7A282RDNYQCc22L66GOI+7i3
	 hn/dLsMYdhbolbmFC/lJpD+f6mzn1+LbXHIKehBxRXjrByQ0JQzRhfk7Hcr13ZMJ7K
	 zh7nKFoWiPZ6g==
Received: from johan by xi.lan with local (Exim 4.97.1)
	(envelope-from <johan@kernel.org>)
	id 1u3CtK-000000000on-156V;
	Fri, 11 Apr 2025 13:49:51 +0200
Date: Fri, 11 Apr 2025 13:49:50 +0200
From: Johan Hovold <johan@kernel.org>
To: Christopher Obbard <christopher.obbard@linaro.org>
Cc: Douglas Anderson <dianders@chromium.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Jessica Zhang <quic_jesszhan@quicinc.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	Rui Miguel Silva <rui.silva@linaro.org>,
	Abel Vesa <abel.vesa@linaro.org>, devicetree@vger.kernel.org
Subject: Re: [PATCH v5 1/3] arm64: dts: qcom: x1e80100: add epd hpd pinctrl
Message-ID: <Z_kB3jOH04-zFnym@hovoldconsulting.com>
References: <20250402-wip-obbardc-qcom-t14s-oled-panel-v5-0-ff33f4d0020f@linaro.org>
 <20250402-wip-obbardc-qcom-t14s-oled-panel-v5-1-ff33f4d0020f@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250402-wip-obbardc-qcom-t14s-oled-panel-v5-1-ff33f4d0020f@linaro.org>

On Wed, Apr 02, 2025 at 03:36:32PM +0100, Christopher Obbard wrote:
> Add edp_hpd_active pinctrl to the X1E80100 device tree.

Please squash this one with the patch adding the user.
 
> Signed-off-by: Christopher Obbard <christopher.obbard@linaro.org>
> ---
>  arch/arm64/boot/dts/qcom/x1e80100.dtsi | 5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/x1e80100.dtsi b/arch/arm64/boot/dts/qcom/x1e80100.dtsi
> index 46b79fce92c90d969e3de48bc88e27915d1592bb..5b1b80c445404fd02e9f6e5dab207610b03ff9c5 100644
> --- a/arch/arm64/boot/dts/qcom/x1e80100.dtsi
> +++ b/arch/arm64/boot/dts/qcom/x1e80100.dtsi
> @@ -6389,6 +6389,11 @@ data-pins {
>  					bias-pull-up;
>  				};
>  			};
> +
> +			edp_hpd_active: edp-hpd-active-state {

Please keep the nodes sorted by name.

> +				pins = "gpio119";
> +				function = "edp_hot";

There is no "edp_hot" function on x1e so I wonder how this has been
tested.

As I mentioned in a comment to an earlier revision this pin has been
configured by the firmware as "edp0_hot".

Since there is also an "edp1_hot" pin, this needs to be reflected in the
node name and label.

Pin configurations really do belong in board files, but unfortunately
this was not followed for x1e. You should still include the bias
configuration (somewhere).

> +			};
>  		};
>  
>  		stm@10002000 {

Johan

