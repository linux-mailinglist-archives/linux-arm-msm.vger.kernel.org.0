Return-Path: <linux-arm-msm+bounces-31804-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 81BFE979CB4
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Sep 2024 10:24:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 1CCF0B22A01
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Sep 2024 08:24:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6012113D891;
	Mon, 16 Sep 2024 08:24:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mxz+o6WS"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2CBC445957;
	Mon, 16 Sep 2024 08:24:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726475072; cv=none; b=P7tNsCGT6TGQ8Uc2dfbowddZ2pPoT+Jd4RjNHrlPbgDmRYO8ijiUv+EIOMAF3aTd5FioQdXwqMZFmxbLbjQFd859CTXf+3Wpi489pqk+jsYIghXPItY51EwuiVo8c+LBIdJ29Ey1DEPs5hLuPuNz0t4iH0+M2laTFfUPNXyuvwA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726475072; c=relaxed/simple;
	bh=cxhgpWNOyuKwrIpr58atn4L2gpkUAY2dJI/Y4679Rl4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=rEmWJYmZAd1m5Z8X+TGvrSzySq2onlUKfiMCS5J8UnKi3beL2HDKD1RhVVPJP62QZZBF7mJUazt/V4CbUnjushv+2ci1FzGluXQq8x2zJ5W3xYXoXB+pzsYV5Cst3msXxEDzSWu5qB/LCq/SM6ld2w4x2APMZElnt1UU8XSzy20=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mxz+o6WS; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BC39AC4AF09;
	Mon, 16 Sep 2024 08:24:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1726475071;
	bh=cxhgpWNOyuKwrIpr58atn4L2gpkUAY2dJI/Y4679Rl4=;
	h=From:To:Cc:Subject:Date:From;
	b=mxz+o6WSu7U60dV1Gjo+46yCYWJY6SyNPsM0Yr7DiddJAJnsFC3iGECs689au61R+
	 VycBqrQmNEHMPFKLIiGxRZk3MjY+VHlUCPzW/uyiskBeVv8mOwkP2Z1VwOhciQ0eEH
	 5wVmj3F+SH0zS5mfWJwPaj6k+I5zsTC9YbVOjH5eec/bB8otMwA9mpoKzXeJLGHFtv
	 5KnFj1YzS+nVYbDwfZ8mUCJIk4Ffp+inDlc+hBaAJlXEzDqAI8pEYrG2rR1LtdnFy4
	 6G+K9UBrTfgWCoNVHDXLLLwkDZ0O11J6mjBTWA092zAXOQw3GksomUh/XcAR0ivyeE
	 Mh+oJwQDgayWg==
Received: from johan by xi.lan with local (Exim 4.97.1)
	(envelope-from <johan+linaro@kernel.org>)
	id 1sq72O-000000007hE-37eK;
	Mon, 16 Sep 2024 10:24:49 +0200
From: Johan Hovold <johan+linaro@kernel.org>
To: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Vinod Koul <vkoul@kernel.org>
Cc: Kishon Vijay Abraham I <kishon@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Abel Vesa <abel.vesa@linaro.org>,
	Rajendra Nayak <quic_rjendra@quicinc.com>,
	Sibi Sankar <quic_sibis@quicinc.com>,
	linux-arm-msm@vger.kernel.org,
	linux-phy@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Johan Hovold <johan+linaro@kernel.org>
Subject: [PATCH 0/3] arm64: dts: qcom: x1e80100: fix missing PCIe PHY clocks
Date: Mon, 16 Sep 2024 10:23:04 +0200
Message-ID: <20240916082307.29393-1-johan+linaro@kernel.org>
X-Mailer: git-send-email 2.44.2
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add the missing clkref enable and pipediv2 clocks to the x1e80100 PCIe
PHYs as needed for functional PCIe (e.g. without relying on boot
firmware to have left these on).

Johan


Johan Hovold (3):
  dt-bindings: phy: qcom,sc8280xp-qmp-pcie-phy: add missing x1e80100
    pipediv2 clocks
  arm64: dts: qcom: x1e80100: fix PCIe4 and PCIe6a PHY clocks
  arm64: dts: qcom: x1e80100: fix PCIe5 PHY clocks

 .../phy/qcom,sc8280xp-qmp-pcie-phy.yaml       |  4 ++--
 arch/arm64/boot/dts/qcom/x1e80100.dtsi        | 24 ++++++++++++-------
 2 files changed, 17 insertions(+), 11 deletions(-)

-- 
2.44.2


