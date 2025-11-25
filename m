Return-Path: <linux-arm-msm+bounces-83220-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id 6AB43C84563
	for <lists+linux-arm-msm@lfdr.de>; Tue, 25 Nov 2025 10:59:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id D8341342CFA
	for <lists+linux-arm-msm@lfdr.de>; Tue, 25 Nov 2025 09:59:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AF7FE2EC561;
	Tue, 25 Nov 2025 09:59:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="frEiSv5F"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8407C2DCC1B;
	Tue, 25 Nov 2025 09:59:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764064750; cv=none; b=JHqcFzIuCyUszvdnqqXAea1XlVlx1O/wRRVT3yz4+Q4ovt0HgkTCRV3FqCJwm/OEcn0dosv6vTi5UkQGjLenM7t/R0VIv7hppLPdVCqsV8YbNHEYJROjEC9bOv04dLQwQ7ZA/3Pa07P7+RvypWef4ktHtj8USxfmEBWjBuvHBCQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764064750; c=relaxed/simple;
	bh=ozJ7861GQ6438EySlqEP/tdDJrMAS0tcnOH32xZ6yaA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=uQr6Bh1wyDFOeeq6b8gjPP1zGK3qdE1V+GfGX1imPqT6qhlV5vp4k8a1wj3elxvgIBVlW0oHf0NBRnBBdUGrbhFVKoOJHPy9ArxtMkk1De2biyZWpKNhhVqqpBgJBO0J0OO1btTwgLewZp/YqTbepygSSWL8d3/ArGIu7LkAfFA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=frEiSv5F; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 84FA1C4CEF1;
	Tue, 25 Nov 2025 09:59:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1764064749;
	bh=ozJ7861GQ6438EySlqEP/tdDJrMAS0tcnOH32xZ6yaA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=frEiSv5F27sxmu3HJaoLapJTZYDpn3ED0NgHCMj3jO/8dNSUSGD2er6aH54tr8YD5
	 qUMxiYOELsgQebR4YiGOu8w7m85s+XA9WLbaNNPzKOBTeEGlL+EdY1OibEUfsVyDmr
	 lypVc5VB2GCPYOh9lbGSUgRtLAHaMBEEtIm4/ZQW2wy2lvuGHqkGRvs0bp4+q03jWJ
	 qMf5WjdZS76cdG2szHAUPKXRp1B4JwHQxwnRjoX8t2CMInanoEBMkEjlcVREtlTY6S
	 sDKXJ8hoX+HLtO+sofjNXN5xQ29/wOHLgUNNW85TOsmzvdrj70ZXsA7sS4iSxYWdm2
	 Dn/lMtTtFia7g==
Date: Tue, 25 Nov 2025 10:59:06 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>
Cc: Vinod Koul <vkoul@kernel.org>, 
	Kishon Vijay Abraham I <kishon@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>, Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Wasim Nazir <wasim.nazir@oss.qualcomm.com>, 
	Mohd Ayaan Anwar <quic_mohdayaa@quicinc.com>, Yijie Yang <quic_yijiyang@quicinc.com>, 
	linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH 1/6] dt-bindings: phy: describe additional regulator for
 Qualcomm SGMII PHY
Message-ID: <20251125-happy-silver-monkey-569cfd@kuoka>
References: <20251124-sgmiieth_serdes_regulator-v1-0-73ae8f9cbe2a@oss.qualcomm.com>
 <20251124-sgmiieth_serdes_regulator-v1-1-73ae8f9cbe2a@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20251124-sgmiieth_serdes_regulator-v1-1-73ae8f9cbe2a@oss.qualcomm.com>

On Mon, Nov 24, 2025 at 02:55:17PM +0530, Mohd Ayaan Anwar wrote:
> Describe the additional vdda-0p9-supply for the Qualcomm SGMII PHY.

Why... device was completely described or not? What else is missing?
Please read writing bindings doc - the bindings are supposed to be
complete, so you bringing up properties afterwards feels odd.

> 
> Signed-off-by: Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>
> ---
>  .../devicetree/bindings/phy/qcom,sa8775p-dwmac-sgmii-phy.yaml         | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/phy/qcom,sa8775p-dwmac-sgmii-phy.yaml b/Documentation/devicetree/bindings/phy/qcom,sa8775p-dwmac-sgmii-phy.yaml
> index 90fc8c039219c739eae05cc17108a9a2fc6193df..0a1330b9118d63cf5400325c58bca05ebc641055 100644
> --- a/Documentation/devicetree/bindings/phy/qcom,sa8775p-dwmac-sgmii-phy.yaml
> +++ b/Documentation/devicetree/bindings/phy/qcom,sa8775p-dwmac-sgmii-phy.yaml
> @@ -36,6 +36,10 @@ properties:
>      description:
>        Phandle to a regulator that provides power to the PHY.
>  
> +  vdda-0p9-supply:

Why not vdda? What other supplies are you missing?

> +    description:
> +      Phandle to a 0.9V regulator supply to the PHY.

You just duplicated phy-supply, no? Both supply to the phy or how
exactly does it work?

Best regards,
Krzysztof


