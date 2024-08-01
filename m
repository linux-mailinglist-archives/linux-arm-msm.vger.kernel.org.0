Return-Path: <linux-arm-msm+bounces-27735-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id A7742944F3F
	for <lists+linux-arm-msm@lfdr.de>; Thu,  1 Aug 2024 17:30:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6171928B50D
	for <lists+linux-arm-msm@lfdr.de>; Thu,  1 Aug 2024 15:30:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 446091B3F37;
	Thu,  1 Aug 2024 15:29:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="BiglEIhc"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 167291B32D1;
	Thu,  1 Aug 2024 15:29:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722526182; cv=none; b=MIgZRxxe5d4RO4c8KBN09Q7q/g8dtenDvgTdphDvAWsqUFc7scrKmIZZE2Azh3MprKlj6UsjgohIzxFexkKocawn8cI0nCmFFcRRz/VSahi5a5UJn1LtK8v8pl0vXrf7YMf1ZL/gDuNEc8o9ORSCperU8Vamd/dUcgc9zoKFjFk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722526182; c=relaxed/simple;
	bh=yK3ETDxJNgjRL0wwwFADagxX1pVHcGlfFDL7snZ1ueU=;
	h=Date:Content-Type:MIME-Version:From:To:Cc:In-Reply-To:References:
	 Message-Id:Subject; b=A7Z3WAnmgGOObkd/0AR5CW5CGTXSNq2C/ej+IjoPYu0Xi6Q7UmY0y0ahlWsLl9Er39MhZhQYnn0bptCm32/1Ye3ih77ltL7u3J8mSORSTch/XWz/o5CBJLzC+L58ZfV808ekJMZuq6MzVcem9yIpZ+7su8ngRwSF54YAWOXixPI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=BiglEIhc; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4F31FC32786;
	Thu,  1 Aug 2024 15:29:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1722526181;
	bh=yK3ETDxJNgjRL0wwwFADagxX1pVHcGlfFDL7snZ1ueU=;
	h=Date:From:To:Cc:In-Reply-To:References:Subject:From;
	b=BiglEIhcdt4baaE9RAUrViHjw/lbSPiIXwK6FNXXRJZ2comH8Xt2CkHs711HZ2hrU
	 46/oo1NLoF3dJ7fDfjNcG53tQe+xHL8hsERtuV0no9MERU5igQrQa0ijSGexUr96zA
	 EsSlJuGBhGdYU5ue8yIkALzS1ZaKZ0B3nLwXPmxA87qxVJCYuuebH3sMhksiRn4YUC
	 nBTPtzlAEGFgUBpaNPbFzvY8AVq+mRhX7manGssnGzw6+ZOfRv177nljbqlFSTIGsR
	 zmlDTiHWGRCuN60LP2zGNcgmqcBaknaAuXBSvKhN2KyMlElETRZEL850IN6Q/FW9pJ
	 wYqvMi99O0HJQ==
Date: Thu, 01 Aug 2024 09:29:40 -0600
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, Konrad Dybcio <konrad.dybcio@linaro.org>, 
 Bjorn Andersson <andersson@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
 linux-arm-msm@vger.kernel.org
In-Reply-To: <20240801-b4-linux-next-24-07-31-camss-sc8280xp-lenovo-rgb-v2-v1-1-30622c6a0c48@linaro.org>
References: <20240801-b4-linux-next-24-07-31-camss-sc8280xp-lenovo-rgb-v2-v1-1-30622c6a0c48@linaro.org>
Message-Id: <172252601036.120813.11500148137845089799.robh@kernel.org>
Subject: Re: [PATCH] arm64: dts: qcom: sc8280xp-x13s: Enable RGB sensor


On Thu, 01 Aug 2024 14:07:03 +0100, Bryan O'Donoghue wrote:
> Enable the main RGB sensor on the Lenovo x13s a five megapixel 2 lane DPHY
> MIPI sensor connected to cisphy0.
> 
> With the pm8008 patches recently applied to the x13s dtsi we can now also
> enable the RGB sensor. Once done we have all upstream support necessary for
> the RGB sensor on x13s.
> 
> Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> ---
> The Lenovo x13s has a five megapixel ov5675 sensor as well as a one
> megpixel ov9734 B+W NOIR sensor for low-light face detection login.
> 
> This patch enables the RGB sensor.
> 
> A gpio exists in the upstream dts to indicate camera activity which
> currently we don't tie to CAMSS activity yet.
> 
> Running
> 
> - A Linux distro which ships libcamera > 0.3.0
> - Firefox nightly
> - Setting Firefox about:config:media.webrtc.capture.allow-pipewire = true
> 
> It should then be possible to use the on-board MIPI camera for Zoom,
> Hangouts etc.
> ---
>  .../dts/qcom/sc8280xp-lenovo-thinkpad-x13s.dts     | 73 ++++++++++++++++++++++
>  1 file changed, 73 insertions(+)
> 


My bot found new DTB warnings on the .dts files added or changed in this
series.

Some warnings may be from an existing SoC .dtsi. Or perhaps the warnings
are fixed by another series. Ultimately, it is up to the platform
maintainer whether these warnings are acceptable or not. No need to reply
unless the platform maintainer has comments.

If you already ran DT checks and didn't see these error(s), then
make sure dt-schema is up to date:

  pip3 install dtschema --upgrade


New warnings running 'make CHECK_DTBS=y qcom/sc8280xp-lenovo-thinkpad-x13s.dtb' for 20240801-b4-linux-next-24-07-31-camss-sc8280xp-lenovo-rgb-v2-v1-1-30622c6a0c48@linaro.org:

arch/arm64/boot/dts/qcom/sc8280xp-lenovo-thinkpad-x13s.dtb: camera@10: 'assigned-clocks' is a dependency of 'assigned-clock-rates'
	from schema $id: http://devicetree.org/schemas/clock/clock.yaml#






