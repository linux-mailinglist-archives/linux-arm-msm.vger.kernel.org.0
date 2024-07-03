Return-Path: <linux-arm-msm+bounces-24971-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 16AF6924FE8
	for <lists+linux-arm-msm@lfdr.de>; Wed,  3 Jul 2024 05:45:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 6D1BCB2BF8D
	for <lists+linux-arm-msm@lfdr.de>; Wed,  3 Jul 2024 03:41:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7A540136E3B;
	Wed,  3 Jul 2024 03:37:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="M6Q2i/F7"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5130E137928;
	Wed,  3 Jul 2024 03:37:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719977875; cv=none; b=er86l+QY8DSLKsfLvw6hPbwPxlQdkFabuFjO6f7IObH6LiNaaUPtpMHNYwaERG7GaOww3Emd+NJF1UmdRcgbZ0B/coVgbBwcElQCQxCa+eDdbmF/wkrIM7IRdX3BpmEDNQh3kKqI1DW16vkZDxhoOYt5LcsCPU0ObbnWenD+adM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719977875; c=relaxed/simple;
	bh=t1hRlBbtJAeaMHvJdk2ORiRuFIQ6KKkTNibFsGt+pg0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Y67edqYScdyOmMvXL5YIZZCHE8RsCrj02kZn4UUZA1ndW9Y/o73CeP/GgeaDJ+YavNQWxWFkSiOZV/CnUZvw7cWUF3E+49HvUISYD55/ZyzOop8nIqcd/9JBqzKoMebkkoItFNLBJteG+/nceT2nqbc3+XX8s/rB91aDASDvtMk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=M6Q2i/F7; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1BA66C32781;
	Wed,  3 Jul 2024 03:37:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1719977875;
	bh=t1hRlBbtJAeaMHvJdk2ORiRuFIQ6KKkTNibFsGt+pg0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=M6Q2i/F7FUFljTNI3mgaBOGns8bMTQWUC8FVzvNuicELkAzhxVWPpn7RQLejEIQaQ
	 Sv9zupsc6b1Waszpbh3SmqwJT1PlYulnvjSjNzcA2R8teJ8Zqx8E9QeWwGx1/gSQvn
	 aloFYYQS6q+UrZkMpFd1iNjusuRoeXgMziPcmR0REOF1bAueGdJc0nGiICOv7KeI/G
	 rSHr0kH+9itA6EzNihtIVBhnQBXMRLp+4BWu/OzwL0SMmQJ1bNoDaDR51cpnK5G+Y3
	 eZOj/MdrUDDo/U+wymt9njX6sx6Z6wAKpS25JlCtNhHRybfO+sb1uem6W/aHw9fvv7
	 ji6wzy4yHXUgw==
From: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konrad.dybcio@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Xilin Wu <wuxilin123@gmail.com>
Cc: linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Abel Vesa <abel.vesa@linaro.org>,
	Johan Hovold <johan+linaro@kernel.org>,
	Elliot Berman <quic_eberman@quicinc.com>
Subject: Re: [PATCH v4 0/2] Introduce ASUS Vivobook S 15
Date: Tue,  2 Jul 2024 22:37:36 -0500
Message-ID: <171997785370.348959.16528842224519695074.b4-ty@kernel.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240701-asus-vivobook-s15-v4-0-ce7933b4d4e5@gmail.com>
References: <20240701-asus-vivobook-s15-v4-0-ce7933b4d4e5@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Mon, 01 Jul 2024 11:05:16 +0800, Xilin Wu wrote:
> ASUS Vivobook S 15 is a laptop based on the Qualcomm Snapdragon X Elite
> SoC (X1E78100). This series adds initial support for the device.
> 
> Currently working features:
> 
> - CPU frequency scaling up to 3.4GHz
> - NVMe storage on PCIe 6a (capable of Gen4x4, currently limited to Gen4x2)
> - Keyboard and touchpad
> - WCN7850 Wi-Fi
> - Two Type-C ports on the left side
> - internal eDP display
> - ADSP and CDSP remoteprocs
> 
> [...]

Applied, thanks!

[1/2] dt-bindings: arm: qcom: Add ASUS Vivobook S 15
      commit: ef7025079a9de1ed06a049a0c69afe822d0b7fb0
[2/2] arm64: dts: qcom: Add device tree for ASUS Vivobook S 15
      commit: d0e2f8f62dff11ce399937fa51d09c24b46049be

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

