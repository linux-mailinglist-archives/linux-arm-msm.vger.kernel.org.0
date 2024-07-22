Return-Path: <linux-arm-msm+bounces-26762-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id E5ED7938CCC
	for <lists+linux-arm-msm@lfdr.de>; Mon, 22 Jul 2024 11:59:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B5F561C23D84
	for <lists+linux-arm-msm@lfdr.de>; Mon, 22 Jul 2024 09:59:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6DD7416F281;
	Mon, 22 Jul 2024 09:55:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="p0Zi63Z9"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D894016EBEE;
	Mon, 22 Jul 2024 09:55:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721642120; cv=none; b=uKi4+eqYZiS+iYz1YQxXyVkYaQ51TZQiUFwiJTPIwqJN5uJzgLfnIfH+TTQjU9d3jMTg2uXf6rezPK9LSsQFT5uWmM7hp/vJ33GU7fXKCcGX8e1B5Ab6ojGl9ZSsCPwXbDBYRIzlSnMS817kNMjdpdjEfdEwxdtWxgm26vqDRD0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721642120; c=relaxed/simple;
	bh=Gdi2MzUD4rKIILpLzZ1Bj03AKvu5EcXUJhFyHFv90fY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=UoPZdbT6nDrSmBUjfDCRrIK6fv9pUpKJvtvxBuTtHBMWVpswxSQbNWwNJblXmYbbn8af9t4d5Uk3hoS+lSyugVu1iseHoD9bRdiJB5ejunPSSPIbbpEsONr7SKFnfB5E+D0sMjk7Qy40qKiQw2zwHkrt270KsZbVaNFQENj/mKo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=p0Zi63Z9; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 70F79C4AF68;
	Mon, 22 Jul 2024 09:55:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1721642120;
	bh=Gdi2MzUD4rKIILpLzZ1Bj03AKvu5EcXUJhFyHFv90fY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=p0Zi63Z9ZpoXO6trjqEMdhSwdz4IOX6vuMtqeE62eeZ9JOeM8uWrF+uvY9bnERl4r
	 8lylgDp97YLaOtyd/uaSEfAISfxnwd3pG09SxV9NotSDgcUFM08mPvF35cK3N0rrMK
	 7jC1a6S4/tPQBm75QWi0mI6iT1BkJlkrEe1IRKLIzDodrh0tMp+59sSy/RjSKTRmYe
	 f17UEOvzCccWQcJhyjdWK/Q+15YHX+3Q92K10OfUYZZ8gSkEpol6hUayUxVQTw2S9N
	 B/e9mWXMcetbEwAdnRFd95wkEbrPuIwMGhhrVDR3HAX0Dn05Sb8+AOTLr5/RdsDISr
	 fGK4LAwpakoSw==
Received: from johan by xi.lan with local (Exim 4.97.1)
	(envelope-from <johan+linaro@kernel.org>)
	id 1sVplH-0000000079U-2Llc;
	Mon, 22 Jul 2024 11:55:19 +0200
From: Johan Hovold <johan+linaro@kernel.org>
To: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sibi Sankar <quic_sibis@quicinc.com>,
	Abel Vesa <abel.vesa@linaro.org>,
	Rajendra Nayak <quic_rjendra@quicinc.com>,
	Xilin Wu <wuxilin123@gmail.com>,
	Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Johan Hovold <johan+linaro@kernel.org>
Subject: [PATCH 06/12] arm64: dts: qcom: x1e80100-vivobook-s15: fix up PCIe6a pinctrl node
Date: Mon, 22 Jul 2024 11:54:53 +0200
Message-ID: <20240722095459.27437-7-johan+linaro@kernel.org>
X-Mailer: git-send-email 2.44.2
In-Reply-To: <20240722095459.27437-1-johan+linaro@kernel.org>
References: <20240722095459.27437-1-johan+linaro@kernel.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The PCIe6a pinctrl node appears to have been copied from the sc8280xp
CRD dts (via the x1e80100 CRD dts), which has the NVMe on pcie2a.

Fix up the node name to match the x1e80100 use and label.

Signed-off-by: Johan Hovold <johan+linaro@kernel.org>
---
 arch/arm64/boot/dts/qcom/x1e80100-asus-vivobook-s15.dts | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/x1e80100-asus-vivobook-s15.dts b/arch/arm64/boot/dts/qcom/x1e80100-asus-vivobook-s15.dts
index f7337251349b..ff51dd98351c 100644
--- a/arch/arm64/boot/dts/qcom/x1e80100-asus-vivobook-s15.dts
+++ b/arch/arm64/boot/dts/qcom/x1e80100-asus-vivobook-s15.dts
@@ -524,7 +524,7 @@ nvme_reg_en: nvme-reg-en-state {
 		bias-disable;
 	};
 
-	pcie6a_default: pcie2a-default-state {
+	pcie6a_default: pcie6a-default-state {
 		clkreq-n-pins {
 			pins = "gpio153";
 			function = "pcie6a_clk";
-- 
2.44.2


