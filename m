Return-Path: <linux-arm-msm+bounces-31803-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id BAEBC979CB0
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Sep 2024 10:24:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8497C286C3D
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Sep 2024 08:24:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5CEFD13D50C;
	Mon, 16 Sep 2024 08:24:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="qse42nON"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2CB8C171BB;
	Mon, 16 Sep 2024 08:24:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726475072; cv=none; b=mPHtsM46hw+NCqJZIBqptn2+QwfeOeQrj9XD60//E0c/kStNOGe2am4GwjDTz3ZcNcq4vDJ28VJiQuy1mmaKrda2WZoRokyfLvrrjwvW4hQBOefUw5LznkNt9sYNLpOxeWFmxCKX1RyfUONAq5s7r4CsmJpbhHnlpukor29CKLQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726475072; c=relaxed/simple;
	bh=qNC9nohuFQyf8/jZzl+dtiD1n7yHdvsfgeZDKj6e9gM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=qUJv+zpt9pBwnbM0Y1jzfurDn3qJw9tzfcn134b6D7zLKvRUc0zKo3C9Adm0dmthGO0GpoEBTLYzq/Co1vU59mOZPTlTRyH6GChoQrUYmAXSaTW1Gmv1gk9CPVuWEjPNX3Lnhj/IoNyN5aqO47AXsGwvEaJCGYMgcPcvzRFZ5IA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=qse42nON; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B81ABC4CECD;
	Mon, 16 Sep 2024 08:24:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1726475071;
	bh=qNC9nohuFQyf8/jZzl+dtiD1n7yHdvsfgeZDKj6e9gM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=qse42nONZfRJKQPEiY3O+iQjcHQeFQL/4tZt8OhrHf7N7BuraOkon2mSXwWf5U/1W
	 BIxtV7X+3fMj1ZfmWxNKzeHdQayvv/sPWSE/UGKfzSk0bfr8LCS5DG0H3aYNqK/F7b
	 c2XmnPBVjFnS6HF6fkupoDb378vsmm5vtiV4W9rsz6qfglq+bYyGRYnq2Hz2sbILfM
	 bgBq1UEjLAEFCFel0Tgs46pnUQ1JdW+N51wLa1hxGfjZ125RDQC6UTiCoCCwN51Jzw
	 FSHozKhKpr7O/Yh7ofoXmdNkDnr8uVEwaBYiTKn5q9+uOEoA3rWSyLqTiIYnuP46z6
	 hq66d93Ze6XlA==
Received: from johan by xi.lan with local (Exim 4.97.1)
	(envelope-from <johan+linaro@kernel.org>)
	id 1sq72P-000000007hK-30Eh;
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
Subject: [PATCH 3/3] arm64: dts: qcom: x1e80100: fix PCIe5 PHY clocks
Date: Mon, 16 Sep 2024 10:23:07 +0200
Message-ID: <20240916082307.29393-4-johan+linaro@kernel.org>
X-Mailer: git-send-email 2.44.2
In-Reply-To: <20240916082307.29393-1-johan+linaro@kernel.org>
References: <20240916082307.29393-1-johan+linaro@kernel.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add the missing clkref enable and pipediv2 clocks to the PCIe5 PHY.

Fixes: 62ab23e15508 ("arm64: dts: qcom: x1e80100: add PCIe5 nodes")
Signed-off-by: Johan Hovold <johan+linaro@kernel.org>
---
 arch/arm64/boot/dts/qcom/x1e80100.dtsi | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/x1e80100.dtsi b/arch/arm64/boot/dts/qcom/x1e80100.dtsi
index 53e7d1e603cb..d1bb14a375c3 100644
--- a/arch/arm64/boot/dts/qcom/x1e80100.dtsi
+++ b/arch/arm64/boot/dts/qcom/x1e80100.dtsi
@@ -3104,14 +3104,16 @@ pcie5_phy: phy@1c06000 {
 
 			clocks = <&gcc GCC_PCIE_5_AUX_CLK>,
 				 <&gcc GCC_PCIE_5_CFG_AHB_CLK>,
-				 <&rpmhcc RPMH_CXO_CLK>,
+				 <&tcsr TCSR_PCIE_2L_5_CLKREF_EN>,
 				 <&gcc GCC_PCIE_5_PHY_RCHNG_CLK>,
-				 <&gcc GCC_PCIE_5_PIPE_CLK>;
+				 <&gcc GCC_PCIE_5_PIPE_CLK>,
+				 <&gcc GCC_PCIE_5_PIPEDIV2_CLK>;
 			clock-names = "aux",
 				      "cfg_ahb",
 				      "ref",
 				      "rchng",
-				      "pipe";
+				      "pipe",
+				      "pipediv2";
 
 			resets = <&gcc GCC_PCIE_5_PHY_BCR>;
 			reset-names = "phy";
-- 
2.44.2


