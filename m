Return-Path: <linux-arm-msm+bounces-46288-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 74D1BA1DCAE
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Jan 2025 20:23:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C5DC43A2206
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Jan 2025 19:23:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3C2EC1925B6;
	Mon, 27 Jan 2025 19:23:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Laj+zRIW"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A78B19007F;
	Mon, 27 Jan 2025 19:23:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738005830; cv=none; b=clqO/xlbYGhqOA4O0XQU1PUGYBxQQs0htEYHi09x7n2qbOb+E7BCX5OGvTRH5Kos3/t1dcpTYBTufR+tu86YY2zsfZM3MfJEVd99YBtRrqzCwnbCkyrSGgeTspQYpFB5mWoRjp+fgr6xUsKCWpc0JA7VlevDJxvg0qfu/KJSydE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738005830; c=relaxed/simple;
	bh=oVY4OMYnqxNWcC9NDJMzAhbQ+KOgjfd5fmFrwAUy9LE=;
	h=Date:Content-Type:MIME-Version:From:Cc:To:In-Reply-To:References:
	 Message-Id:Subject; b=uZIFdOez2l6+8WxWdD9FIh3FIg7vLHpQeNNlple74ZTFrqHqjGWh5SJM2a9Y+PPnbdnm9yrA2FbKT2ASnXnHKLFaYZr2wsYsQFZx2fUj2dTF01a0e0E9BaR/r/T+5TdD/plEQZcfw5kjD6uFWiQg3hwSyvpmcqwYxqgT8c4MwP8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Laj+zRIW; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 42A25C4CED2;
	Mon, 27 Jan 2025 19:23:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738005829;
	bh=oVY4OMYnqxNWcC9NDJMzAhbQ+KOgjfd5fmFrwAUy9LE=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=Laj+zRIWho4fJH0ZojEyEbw6CcIXdvoTfEupTHPIa+SOWmcFeSuFxBpu82dgiD++m
	 g+goRh8Caa+5aI5TRS7ND0qhP2tlxKyClXlRz7m0kiQjJQA4NkjkHPq+J3exiCvJCr
	 eNNLlCL/KtS5TJLghjfl2ZVosRR39QOVAdkdcdOd+8SnjSVDzag9KCTKl7DriRNrBF
	 ASJIvOne6+aOetKUJN1v+HNRTNT97N6tCF9ajyTRwGGUpsTOSugq/6ObIcrkSXaeee
	 APpFwwWZIKi/gqu1vpPWWbrZXBcR1R1/EwEIUHr1Y3zH4QRhGjNw3kQ5U/1Rqkg/T6
	 fDyFv9CEHv9rA==
Date: Mon, 27 Jan 2025 13:23:48 -0600
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-bluetooth@vger.kernel.org, 
 quic_hbandi@quicinc.com, linux-arm-msm@vger.kernel.org, 
 quic_anubhavg@quicinc.com, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 devicetree@vger.kernel.org, Marcel Holtmann <marcel@holtmann.org>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Luiz Augusto von Dentz <luiz.dentz@gmail.com>, quic_mohamull@quicinc.com, 
 Konrad Dybcio <konradybcio@kernel.org>, Conor Dooley <conor+dt@kernel.org>
To: Janaki Ramaiah Thota <quic_janathot@quicinc.com>
In-Reply-To: <20250127064940.1360404-1-quic_janathot@quicinc.com>
References: <20250127064940.1360404-1-quic_janathot@quicinc.com>
Message-Id: <173800559527.709182.14695463693444897040.robh@kernel.org>
Subject: Re: [PATCH v8 0/2] Enable Bluetooth on qcs6490-rb3gen2 board


On Mon, 27 Jan 2025 12:19:38 +0530, Janaki Ramaiah Thota wrote:
> Resending the below  reviewed  patches after fixing the regulator warnings in v7 P1.
> - Patch 1/2 Add and enable BT node for qcs6490-rb3gen board.
> - Patch 2/2 Use the power sequencer for wcn6750.
> 
> ----
> Changes from v7:
> * updated P1 & P2 with tag: Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> * Link to v7: https://lore.kernel.org/lkml/20250107134157.211702-1-quic_janathot@quicinc.com/#t
> 
> Changes from v6:
> * Elaborated the commit message with more information.
> * Link to v6: https://lore.kernel.org/lkml/20241223135700.22660-1-quic_janathot@quicinc.com/
> 
> Changes from v5:
> * Update the wcn6750 required properties in bindings.
> * Link to v5: https://lore.kernel.org/linux-arm-msm/20241209103455.9675-1-quic_janathot@quicinc.com/
> 
> Changes from v4:
> * Added reviewed tag by Krzysztof in p1
> * Updated the p2 commit message with sw_ctrl and wifi-enable are
>   handled in wifi FW.
> * Added blank line between the nodes in p2
> * Placed the structures in proper order in p4
> * Link to v4: https://lore.kernel.org/all/20241204131706.20791-1-quic_janathot@quicinc.com/
> 
> Changes from v3:
> * Defined the PMU node and used the its output to power up BT
> * Used power sequencer for wcn wcn6750 module
> * Split the patch to multiple as per subtree
> * Add description of the PMU of the WCN6750 module
> * Include separate UART state node for sleep pin configuarion
> * Link to v3: https://lore.kernel.org/linux-arm-msm/20241022104600.3228-1-quic_janathot@quicinc.com/
> 
> Changes from v2:
> * Sorted nodes alphabetically
> * Link to v2: https://lore.kernel.org/linux-arm-msm/20241010105107.30118-1-quic_janathot@quicinc.com/
> 
> Changes from v1:
> * Corrected the board name in subject
> * Link to v1: https://lore.kernel.org/linux-arm-msm/20241009111436.23473-1-quic_janathot@quicinc.com/
> Janaki Ramaiah Thota (2):
>   arm64: dts: qcom: qcs6490-rb3gen: add and enable BT node
>   Bluetooth: hci_qca: use the power sequencer for wcn6750
> 
>  arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts | 168 ++++++++++++++++++-
>  drivers/bluetooth/hci_qca.c                  |   2 +-
>  2 files changed, 168 insertions(+), 2 deletions(-)
> 
> --
> 
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


New warnings running 'make CHECK_DTBS=y for arch/arm64/boot/dts/qcom/' for 20250127064940.1360404-1-quic_janathot@quicinc.com:

arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dtb: pmic@2: pwm:nvmem: [[352, 353]] is too short
	from schema $id: http://devicetree.org/schemas/mfd/qcom,spmi-pmic.yaml#
arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dtb: pwm: nvmem: [[352, 353]] is too short
	from schema $id: http://devicetree.org/schemas/leds/leds-qcom-lpg.yaml#
arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dtb: pinctrl@f100000: Unevaluated properties are not allowed ('qup_uart7_sleep' was unexpected)
	from schema $id: http://devicetree.org/schemas/pinctrl/qcom,sc7280-pinctrl.yaml#






