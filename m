Return-Path: <linux-arm-msm+bounces-52066-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id C9B38A6A29F
	for <lists+linux-arm-msm@lfdr.de>; Thu, 20 Mar 2025 10:30:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 9738A18951A9
	for <lists+linux-arm-msm@lfdr.de>; Thu, 20 Mar 2025 09:29:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CC51F2222AB;
	Thu, 20 Mar 2025 09:29:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YaqU+T3N"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E6F521CFEC;
	Thu, 20 Mar 2025 09:29:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742462976; cv=none; b=qYg0/BxK+k2vL0rpW2hToZwxGS/RbHMOea7irffp9ofq8OAIPxd+gOlZ2yBDgtE7W+xx59wLXDsZsDQA4pFcXbL21ydzWX6rqU7SOI6nAQYb9sqVCT2E6RSusD/b4WTDUrMQ8YQo4xen4pXKjDjqNjRFf4huCiIBxHYAibj42kI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742462976; c=relaxed/simple;
	bh=ivUJqvJiPWuttt/YiRnzmn0luJJQP4uNLrNqD31cg1s=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Wgn1mtXMiDtz95rM8gJu/4qK3no9DLX4SHnCUk1+Tz+Ts6warB2SmhlAnLyMmatnMp8i0bO/Kx8nFKaPkp2f8y781zezxMgxi8f91QK2n8IxVYTR221MXLvL8gcA8HoXsPtOP0wJbAdCiB3/r2r+qXQET09c2+WiAs5WRlAfdqU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YaqU+T3N; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9711EC4CEDD;
	Thu, 20 Mar 2025 09:29:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1742462976;
	bh=ivUJqvJiPWuttt/YiRnzmn0luJJQP4uNLrNqD31cg1s=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=YaqU+T3N0frZ/ZaymRWwsSk154Fvuf/Mcmd6vRiMB1G92IMCkN6psUVIY9L9rlIgj
	 HvQwaLzL/nH7qut5bb1KSsCc/SuRZu7OEYxoqAGv7g0yvPHvF8BwFMSgi8SkA1ceiX
	 Pj54WICko6THIGWbp97cX8LH909RCBlwr2tP311HLHUN8WjEGPnBCKFgWn5qSrHd7V
	 Vhqv5aYA40BaWgHbwxKvyQpYZRkxoJ8sweUPxMJ51Xr8PODNHYfL7Y4rufzStIt0l3
	 j9AjMeFY1/AKuxQ7qvkXEFvJ0EOpTk1YB7QXo87JKH/VdfL34TGr8TM2YWHEI0Tcyz
	 huynDh4i9JszA==
Date: Thu, 20 Mar 2025 10:29:32 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: srinivas.kandagatla@linaro.org
Cc: broonie@kernel.org, andersson@kernel.org, lgirdwood@gmail.com, 
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, konradybcio@kernel.org, 
	perex@perex.cz, tiwai@suse.com, dmitry.baryshkov@linaro.org, 
	linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, johan+linaro@kernel.org
Subject: Re: [PATCH 3/3] arm64: dts: qcom: x1e78100-t14s: Enable audio
 headset support
Message-ID: <20250320-busy-trogon-of-philosophy-fad8db@krzk-bin>
References: <20250319091637.4505-1-srinivas.kandagatla@linaro.org>
 <20250319091637.4505-4-srinivas.kandagatla@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250319091637.4505-4-srinivas.kandagatla@linaro.org>

On Wed, Mar 19, 2025 at 09:16:37AM +0000, srinivas.kandagatla@linaro.org wrote:
>  		vdd-buck-supply = <&vreg_l15b_1p8>;
>  		vdd-rxtx-supply = <&vreg_l15b_1p8>;
>  		vdd-io-supply = <&vreg_l15b_1p8>;
>  		vdd-mic-bias-supply = <&vreg_bob1>;
> +		vdd-hp-switch-supply = <&vreg_l16b_2p5>;
>  
>  		#sound-dai-cells = <1>;
>  	};
> @@ -367,6 +369,13 @@ vreg_l15b_1p8: ldo15 {
>  			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
>  		};
>  
> +		vreg_l16b_2p5: ldo16 {
> +			regulator-name = "vreg_l6b_2p5";

Typo: l16b

Best regards,
Krzysztof


