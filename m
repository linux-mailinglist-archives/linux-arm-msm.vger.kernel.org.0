Return-Path: <linux-arm-msm+bounces-21490-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id C8D468D84E7
	for <lists+linux-arm-msm@lfdr.de>; Mon,  3 Jun 2024 16:26:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id CDCD11C2160A
	for <lists+linux-arm-msm@lfdr.de>; Mon,  3 Jun 2024 14:26:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CB8E912EBF2;
	Mon,  3 Jun 2024 14:26:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="uF7mpjO1"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A13812EBC2;
	Mon,  3 Jun 2024 14:26:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717424803; cv=none; b=qTIg/uKQBmmPMxl9pVw4BxZVx9hKzSZ9yxZray9uSz64CmvIFURd84n8NSxWrixFFWg5UWsK6V4DszQnjhAcALfv5G4R5yAAh5z89qpwLj+YJaexKIspimPDzSSTt8y4XreYE+5eWpx+qQP0GaBduW1NPeAr0St1jOS59d9U6Xo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717424803; c=relaxed/simple;
	bh=mzZQjszM9qLA+McsUnJwdEB659wLnZJXh3P3zEeI1wk=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=i87XDpV8IxvZdO08b4nCD7sGHX89bjqChGe/vCcJszzOdbXzN7YTywfdHOJNUS6CmZBqaPvJ+u0UEviDEBrF3acILFkUTpJrdFPPCZLpgMo0Iu1YPu2qk5V6pc1616svGB28AY0+qzJ8ncTYJDnkhx+tP8htld1Zgxlh5gmUhfE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=uF7mpjO1; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 38219C2BD10;
	Mon,  3 Jun 2024 14:26:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1717424803;
	bh=mzZQjszM9qLA+McsUnJwdEB659wLnZJXh3P3zEeI1wk=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=uF7mpjO1nlKl+IjvGnzdDBsKCoRmz5xQjnUM5K9gAbLsnd16EeV4AKyNq1wAbZtHu
	 0XagtJ54UHRwUOuNbqv/dINNcJQ47Wq+wEKMeIpCl6PmGnef4s6Zk1k1Osl5GurXRg
	 qUXWXWI5CqA1+eV34JP677LJXsBtU7EKNQUTUVs/5ZLxRjDf+EoiCyl5JKc2rWTly7
	 rFqZIF+A69SfRAOG9x8BEdsYDal5b6AQFwNZF2lubP4yNewwxaIjegtayNpK5A8QJA
	 wGxKohOjkQBxGa1meoxC9t8N8BlHtHLiJrL42ePFaYDdMhR0xqliDUjaEF99IQpErd
	 IC6UXRUN/IQ3w==
From: Vinod Koul <vkoul@kernel.org>
To: Kishon Vijay Abraham I <kishon@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Wesley Cheng <quic_wcheng@quicinc.com>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>, 
 Bjorn Andersson <andersson@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-clk@vger.kernel.org, linux-usb@vger.kernel.org, 
 Bjorn Andersson <quic_bjorande@quicinc.com>
In-Reply-To: <20240525-sc8180x-usb-mp-v1-0-60a904392438@quicinc.com>
References: <20240525-sc8180x-usb-mp-v1-0-60a904392438@quicinc.com>
Subject: Re: (subset) [PATCH 00/10] arm64: dts: qcom: sc8180x: Enable the
 USB multiport controller
Message-Id: <171742479784.106728.422190017656643757.b4-ty@kernel.org>
Date: Mon, 03 Jun 2024 19:56:37 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13.0


On Sat, 25 May 2024 11:03:53 -0700, Bjorn Andersson wrote:
> The USB multiport controller found in SC8180X is used to driver the
> camera in the Lenovo Flex 5G, and a couple of additional USB ports on
> the Primus AUX board.
> 
> 

Applied, thanks!

[01/10] dt-bindings: phy: qcom,sc8280xp-qmp-usb3-uni: Add sc8180x USB3 compatible
        commit: 4dc7e51a9e40f07dc0da7eea05577633984ea9f2
[02/10] phy: qcom-qmp-usb: Add sc8180x USB UNIPHY
        commit: b279a835192834565db5025205394e3ef943fbd2

Best regards,
-- 
Vinod Koul <vkoul@kernel.org>


