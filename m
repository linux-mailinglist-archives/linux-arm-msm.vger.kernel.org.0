Return-Path: <linux-arm-msm+bounces-71440-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 39625B3EEA1
	for <lists+linux-arm-msm@lfdr.de>; Mon,  1 Sep 2025 21:47:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 589C24854F4
	for <lists+linux-arm-msm@lfdr.de>; Mon,  1 Sep 2025 19:47:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4E2643376A1;
	Mon,  1 Sep 2025 19:46:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="inF4XbGW"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21B1133436D;
	Mon,  1 Sep 2025 19:46:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756755976; cv=none; b=ZANKJFCKlIBSrDnPiPjeSrHDmxRrDLk2cqYwkjUwTc03fu5+G/URXr7dL1LW7XyWY5gVQSKwf7GSW8X2wRjs7S65zGD2f2a/68d38esVbBUaWh7kieQMfwjhA31+3C/cibrTiKZA7WFYoH0LBI1IKPOJJJp7Fp2GaUxbl8uhdZk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756755976; c=relaxed/simple;
	bh=aQrXio5Jf/NDWTWdeYPH5rpy20fy2si9Jfrk1vT737o=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=cS9rE+O1n8RPkid3hCeq7Op/fRcuERvVIH+cVhnNtZMyYyIp2UQH3UbdtgKGupJe9SW815dVrjpSRwIdIolkeZcSRbl+5tC4xnxxd6B5uif2uAKP4P4f1xGCApLy1t6UrXXKACcWq+kLBUZ3sWQmDckR3zkP13IAvCDhwTs1CTI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=inF4XbGW; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EF4B7C4CEF0;
	Mon,  1 Sep 2025 19:46:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1756755975;
	bh=aQrXio5Jf/NDWTWdeYPH5rpy20fy2si9Jfrk1vT737o=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=inF4XbGWN3kxua2x98XVhDsJy0i+urO9Px1bdHkQ1WmA1ENTYUf3W5mUDsmdVPMgj
	 8wRxDXF4uj3AZhIRFuJXhcxcoxjumWH1vunCvj/a56zjQ1tuNkES2e+xOjzidHh/Zf
	 lXuoNhMcoGMRUDknQEPUdLDSewM9OJZ17S6nxcAYr3d5qXTL6EzsenRJmWfx0gefoT
	 qN9JmeSVjf65hJgsXgWNfDVkZA2dPwu80iZhVS1wugR836WHIzDJDBsXQI9cApRsUd
	 OCvl2Tj3ITZWzOWcVwBhY+wofwqKfQ0fwqrpaSQF1wCEqSyf1hx3Fmk/slRwXIzN2k
	 taxbupUviga/Q==
From: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Kaehlcke <mka@chromium.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jens Glathe <jens.glathe@oldschoolsolutions.biz>
Cc: Aleksandrs Vinarskis <alex.vinarskis@gmail.com>,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-usb@vger.kernel.org,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Subject: Re: (subset) [PATCH v12 0/3] arm64: dts: qcom: Add Lenovo ThinkBook 16 device tree
Date: Mon,  1 Sep 2025 14:45:57 -0500
Message-ID: <175675595923.1796591.4838334156014810124.b4-ty@kernel.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250822-tb16-dt-v12-0-bab6c2986351@oldschoolsolutions.biz>
References: <20250822-tb16-dt-v12-0-bab6c2986351@oldschoolsolutions.biz>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Fri, 22 Aug 2025 08:44:09 +0200, Jens Glathe wrote:
> Device tree for the Lenovo Thinkbook 16 G7 QOY
> 
> The Laptop is a Snapdragon X1 / X1 Plus (Purwa) based device [1].
> 
> Supported features:
> 
> - USB type-c and type-a ports
> - Keyboard
> - Touchpad (all that are described in the dsdt)
> - Touchscreen (described in the dsdt, no known SKUss)
> - Display including PWM backlight control
> - PCIe devices
> - nvme
> - SDHC card reader
> - ath12k WCN7850 Wifi and Bluetooth
> - ADSP and CDSP
> - GPIO keys (Lid switch)
> - Sound via internal speakers / DMIC / USB / headphone jack
> - DP Altmode with 2 lanes (as all of these still do)
> - Integrated fingerprint reader (FPC)
> - Integrated UVC camera
> - X1-45 GPU
> 
> [...]

Applied, thanks!

[1/3] dt-bindings: arm: qcom: Add Lenovo TB16 support
      commit: 63727c59a917b6ffdb13d51c251727a3e21d38d9
[3/3] arm64: dts: qcom: Add Lenovo ThinkBook 16 G7 QOY device tree
      commit: d3f600dc452df45f0f404eba65a88f4aecc48b43

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

