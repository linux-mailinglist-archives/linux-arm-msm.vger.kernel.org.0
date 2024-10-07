Return-Path: <linux-arm-msm+bounces-33442-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id A4B41993673
	for <lists+linux-arm-msm@lfdr.de>; Mon,  7 Oct 2024 20:44:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5E80328461D
	for <lists+linux-arm-msm@lfdr.de>; Mon,  7 Oct 2024 18:44:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6740E1DE2B7;
	Mon,  7 Oct 2024 18:44:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="MdHVma5R"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38CE71DDC16;
	Mon,  7 Oct 2024 18:44:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728326676; cv=none; b=JbLbhl4uAqevrjkQ/ovDtzSNcs0zCsQPSMyLq7QWOecHnK0FWlUvpt9Jzi1U/7ZBHDOf806rHeoLncT4EyJqmUemn0tAoKLFLrSjuHKFPg4aSicSO7jU5oElMVqVS/6DK0cwPdV/M0spBZERj0g6vFzIHjohiZHRvRSYlwm9MRQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728326676; c=relaxed/simple;
	bh=y0fbldh8dn4BxzlMK+nWR4yGZUXakJwb+ZfHmOLatig=;
	h=Date:Content-Type:MIME-Version:From:To:Cc:In-Reply-To:References:
	 Message-Id:Subject; b=F4a/tbu+2GrG37oUDofEjrc812HJ+3YIgFjd/tQdAXfraE5y/Z1ABIaSv0MxB3g8CiKUKvZTcK+g5+kW2ayNKxY8YINKkDDGymAN0GMjI9+tt7j/FiM7TaHRx+d3h/L2lQxrRx3alYDQp66YkKZBsSLrQNKRX2qVGwXq3h/OF7k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=MdHVma5R; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AA89BC4CEC6;
	Mon,  7 Oct 2024 18:44:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1728326675;
	bh=y0fbldh8dn4BxzlMK+nWR4yGZUXakJwb+ZfHmOLatig=;
	h=Date:From:To:Cc:In-Reply-To:References:Subject:From;
	b=MdHVma5RmLilTueHBkSxlU9cbhzvpSTufrfbcl+VBpvwL/siYFgLKk7R7fpRasgnw
	 xzr3DHip3bellFzPDWo6ZDQ7Yr26tGab6Ov4tcs7j8lo+WmRaRSCW2R0854Uce+1Q4
	 +EMyo1mQ/P1ZnSVwFNtHj23ZRHgzBUltOC/lKT6Ih+dnp3KGMNgKnGs5T19RvnXi6x
	 zbMOF1HiWYUCYEBRm5Vz1xAI1sUFoBJdKLFi52MlOPzYceu3qZ7xnL5fR97toMMofT
	 hVPop3LMKL7I3XqCHaCa5lMJc1HLlaG5LeSKJ3oIGWJbiD2FkOp0aIPsOWThD+uyxc
	 3+JgTQywbDN2A==
Date: Mon, 07 Oct 2024 13:44:35 -0500
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Konrad Dybcio <quic_kdybcio@quicinc.com>, linux-arm-msm@vger.kernel.org, 
 Bjorn Andersson <andersson@kernel.org>, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>
In-Reply-To: <20241004-rb3gen2-leds-v1-0-437cdbb4f6c0@oss.qualcomm.com>
References: <20241004-rb3gen2-leds-v1-0-437cdbb4f6c0@oss.qualcomm.com>
Message-Id: <172832632708.2106829.10862107760441077136.robh@kernel.org>
Subject: Re: [PATCH 0/2] arm64: dts: qcom: qcs6490-rb3gen2: Describe LED
 array


On Fri, 04 Oct 2024 20:33:41 -0700, Bjorn Andersson wrote:
> The rb3gen2 has three green LEDs for status indication, describe them.
> 
> Signed-off-by: Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>
> ---
> Konrad Dybcio (2):
>       arm64: dts: qcom: pmk8350: Add more SDAM slices
>       arm64: dts: qcom: qcs6490-rb3gen2: Configure onboard LEDs
> 
>  arch/arm64/boot/dts/qcom/pmk8350.dtsi        | 72 ++++++++++++++++++++++++++++
>  arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts | 41 ++++++++++++++++
>  2 files changed, 113 insertions(+)
> ---
> base-commit: 58ca61c1a866bfdaa5e19fb19a2416764f847d75
> change-id: 20241004-rb3gen2-leds-0a4dda9b83cf
> 
> Best regards,
> --
> Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>
> 
> 
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


New warnings running 'make CHECK_DTBS=y qcom/qcs6490-rb3gen2.dtb' for 20241004-rb3gen2-leds-v1-0-437cdbb4f6c0@oss.qualcomm.com:

arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dtb: pmic@2: pwm:nvmem: [[341, 342]] is too short
	from schema $id: http://devicetree.org/schemas/mfd/qcom,spmi-pmic.yaml#
arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dtb: pwm: nvmem: [[341, 342]] is too short
	from schema $id: http://devicetree.org/schemas/leds/leds-qcom-lpg.yaml#






