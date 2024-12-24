Return-Path: <linux-arm-msm+bounces-43264-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 064919FBFA5
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Dec 2024 16:26:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 9CD9A164FE8
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Dec 2024 15:26:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C31B71DC99F;
	Tue, 24 Dec 2024 15:25:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="MtH05eoo"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95E78142E76;
	Tue, 24 Dec 2024 15:25:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735053935; cv=none; b=U+zkUW1J95SL3wIfSCqImHEBUZYjm+Yl7tfCoyx+megyV0cq1OijhgEPn10C14Wn6ig7ZrCuIHP/Vs6zU3ZoP1Vf4AXLpQ/5m2UWGPQt9F0cF9H7lZJpNMLZzybHBadTKtKc20A77iM0P/7wiMZNaGCm1I4oEj1qZGeEZgv6ATE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735053935; c=relaxed/simple;
	bh=1DxrSRX28T16OYIeVajbXDjYb7/6hcd940kOIRXJq/w=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=rOTQqlntrG0RC9DAfFOJV02v1CXWV6Ixd5TF2la56RzMMJq9ujBDvTweD2Q2QZbsVm8riaaOuGWI9htGS4w9afAqRdOal3Dk2k32jlPN12Qf6GnZiWRAr03iiDM7WN9ZFZY3+E18lCzqbbx+ujRJRHxyXAcdGtUd1ZPN4khf6w0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=MtH05eoo; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AE004C4CED4;
	Tue, 24 Dec 2024 15:25:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1735053935;
	bh=1DxrSRX28T16OYIeVajbXDjYb7/6hcd940kOIRXJq/w=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=MtH05eooLVpp+k/E7XLMIYFYsGSGwQWCi502g6hkHdcd5qzfS09OAksGdzOED/kL/
	 XYaK4L3bOUWIe3bEMNFy1pSMEucpPlC98vgGfk/Sjan/KsL1oXVaTsRITpN7nFy2S7
	 I4cUO5TilVqaOIKIYcjySQvu7WxWHRxB7rtdKXVtVPbdmQ9MAEu+RYnSFqrE89B3Yb
	 o3X2D/7JmcYoWrCieqXsX9hhkhvPGteHFDTXRisvET/QxXEfkiE2kJUSEItk4LDAwt
	 sXfSjyzQMhvnn6EXlW7Fd8fL0I2jlVBCccZk4qCl9WwVv03ET/r5osAxmrG0Tv6mwo
	 URwrH3SaE7WPg==
From: Vinod Koul <vkoul@kernel.org>
To: Kishon Vijay Abraham I <kishon@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20241204-topic-misc-sm8350-pcie-bindings-fix-v1-1-e8eaff1699d7@linaro.org>
References: <20241204-topic-misc-sm8350-pcie-bindings-fix-v1-1-e8eaff1699d7@linaro.org>
Subject: Re: [PATCH] dt-bindings: phy: qcom,qmp-pcie: document the SM8350
 two lanes PCIe PHY
Message-Id: <173505393233.950293.12984091478385927361.b4-ty@kernel.org>
Date: Tue, 24 Dec 2024 20:55:32 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2


On Wed, 04 Dec 2024 11:34:50 +0100, Neil Armstrong wrote:
> Document the two lanes PCIe PHY found on SM8350 SoCs along the
> already documented single lane PCIe PHY.
> 
> This fixes:
> /soc@0/phy@1c0e000: failed to match any schema with compatible: ['qcom,sm8350-qmp-gen3x2-pcie-phy']
> 
> 
> [...]

Applied, thanks!

[1/1] dt-bindings: phy: qcom,qmp-pcie: document the SM8350 two lanes PCIe PHY
      commit: d7e14bb48847a6278a77718ce83633912956651e

Best regards,
-- 
~Vinod



