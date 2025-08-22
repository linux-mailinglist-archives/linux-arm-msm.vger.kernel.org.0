Return-Path: <linux-arm-msm+bounces-70461-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A8692B32417
	for <lists+linux-arm-msm@lfdr.de>; Fri, 22 Aug 2025 23:22:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4BD7C3AEE57
	for <lists+linux-arm-msm@lfdr.de>; Fri, 22 Aug 2025 21:20:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0D85B31352C;
	Fri, 22 Aug 2025 21:20:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="o4gwtYPv"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D473C27B335;
	Fri, 22 Aug 2025 21:20:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755897645; cv=none; b=VxIjyWoIMlWRGChXiht+vrkWm8f24GF7bswySZyEnbBxzePmq7bI/+dcgD8ErBvcJx1WELTpL7Wx9GP3/eC8/I2m5JLHaEcPI+3sBotL6VEG9b5LIFLrdGqVbkl12Y0uT/i96zvCuN8RPE/K0O9KkPMD1yobPNmhsPYjyFIPlMY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755897645; c=relaxed/simple;
	bh=vtsRBb4sPfT6W/YuCCdEbbOfe14BIwGnGP4Fd7ycMyo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=s8jF8lsFrUg01N1vL+eluEkD02TlR3bSe/sTBlq/1q1IY0fVHvXqDf9bQvCZ4d1gNfhnhTwcB3VuRhHD/hcpxv75kvfnGkv3VSjdalLMyCKa69F04q0CwTVFVj9G1IIaJxYGBKLFg4hDEloKa1XKHLK7gbYHtlujtcJPy9mfdAo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=o4gwtYPv; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2ED3DC4CEED;
	Fri, 22 Aug 2025 21:20:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1755897644;
	bh=vtsRBb4sPfT6W/YuCCdEbbOfe14BIwGnGP4Fd7ycMyo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=o4gwtYPve2kzqW5VoEoRCbZfLcL2oSL+8xpjZXUzaw5f2WKCbpmr6f40mHE00Bqz4
	 618bZC932KkR/cmbVhsqYsCLMlYSlutIfBYmCkHkucmfln+V10ch/D8D3XagzlpQTX
	 JHRa1n9EvkxC3k6zkCV1gCZoviAiLRAo9ywDMGhaMiCfyhhtHZaVljD9MjFwJO0dm5
	 /ElPtJfF1E715k/R/7Wb1fqRARAXlLj6VlsE1R64yrBOe8HNWtwTyQvjATNSnjc7Zt
	 VqjuRqK8ZXk96UkWiK4MH1NQDJh/iDE4RQ1sNHga3E1TtyLLtyWrlywtDIKUWWlzIn
	 cNXZHGODn6Xgw==
Date: Fri, 22 Aug 2025 16:20:43 -0500
From: Rob Herring <robh@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>
Cc: Vinod Koul <vkoul@kernel.org>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Marijn Suijten <marijn.suijten@somainline.org>,
	linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Krzysztof Kozlowski <krzk@kernel.org>
Subject: Re: [PATCH v4 1/6] dt-bindings: phy: qcom,sc8280xp-qmp-usb43dp:
 Reference usb-switch.yaml to allow mode-switch
Message-ID: <20250822212043.GA475528-robh@kernel.org>
References: <20250807-topic-4ln_dp_respin-v4-0-43272d6eca92@oss.qualcomm.com>
 <20250807-topic-4ln_dp_respin-v4-1-43272d6eca92@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250807-topic-4ln_dp_respin-v4-1-43272d6eca92@oss.qualcomm.com>

On Thu, Aug 07, 2025 at 06:33:19PM +0200, Konrad Dybcio wrote:
> From: Neil Armstrong <neil.armstrong@linaro.org>
> 
> The QMP USB3/DP Combo PHY can work in 3 modes:
> - DisplayPort Only
> - USB3 Only
> - USB3 + DisplayPort Combo mode
> 
> In order to switch between those modes, the PHY needs to receive
> Type-C events, allow marking to the phy with the mode-switch
> property in order to allow the PHY to Type-C events.
> 
> Reference usb-switch.yaml as a simpler way to allow the mode-switch
> property instead of duplicating the property definition.
> 
> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
> Reviewed-by: Krzysztof Kozlowski <krzk@kernel.org>
> Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> ---
>  .../devicetree/bindings/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml     | 7 +++----
>  1 file changed, 3 insertions(+), 4 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml b/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml
> index 38ce04c35d945d0d8d319191c241920810ee9005..c8bc512df08b5694c8599f475de78679a4438449 100644
> --- a/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml
> +++ b/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml
> @@ -73,10 +73,8 @@ properties:
>      description:
>        See include/dt-bindings/phy/phy-qcom-qmp.h
>  
> -  orientation-switch:
> -    description:
> -      Flag the PHY as possible handler of USB Type-C orientation switching
> -    type: boolean
> +  mode-switch: true
> +  orientation-switch: true
>  
>    ports:
>      $ref: /schemas/graph.yaml#/properties/ports
> @@ -106,6 +104,7 @@ required:
>    - "#phy-cells"
>  
>  allOf:
> +  - $ref: /schemas/usb/usb-switch.yaml#

As reported already in this thread, this adds a crap load of warnings as 
it makes ports or port required. Sigh. Can QCom folks pay more attention 
to this please. Every cycle the number goes up though that's often 
temporary because there's no coordination of taking .dts files after 
bindings. But generally, progress on QCom warnings has stalled.

Here's the top (bottom?) platforms in arm64. The first number is 
total warnings. The 2nd number is unique warnings (to remove inflated 
numbers due to lots of boards per SoC).

mediatek:785:166
hisilicon:133:112
qcom:362:104
broadcom:286:104
marvell:558:80
apm:78:58
rockchip:128:57
nvidia:199:53
sprd:30:29
xilinx:94:22

Congrats on 3rd place. There's a bunch of pending Mediatek fixes, so I 
expect you all will move up to 2nd soon. 

All this data is updated daily. There's some scripts to get and process 
the logs here[1].

Rob

[1] https://gitlab.com/robherring/ci-jobs.git

