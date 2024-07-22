Return-Path: <linux-arm-msm+bounces-26743-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id EB7B6938C3F
	for <lists+linux-arm-msm@lfdr.de>; Mon, 22 Jul 2024 11:45:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 75184B218CB
	for <lists+linux-arm-msm@lfdr.de>; Mon, 22 Jul 2024 09:45:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 122E016D9A4;
	Mon, 22 Jul 2024 09:43:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="CIkhZVVC"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CAFE816D4F2;
	Mon, 22 Jul 2024 09:43:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721641425; cv=none; b=eMjcJoo1mgheGDWAfpwghgVNvK7Jck2VSgVLgNtwstd4p70fmG+yvbTZWg0yQZpz+ii7B7nkm+0LNdEbqXzxrM5lCVY87UCnIO1+c7dKZcQZdkB0QYnKfFlhnh+i5V/7yQzal6PO8NUlCRf62VKbmIy31R4kb9fTisAUSmNoc1c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721641425; c=relaxed/simple;
	bh=dx9tNBl+UYPCzsKMP/noRajlmX+0BV6jW6rXGXxRDDE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=l6MAeQbs2lmTneRA3/5wp2Khw92ghWz79mr45uXZTzj+3Wb/E1ke5i1rhJZYqTQyN44z3+1MiFyf8ghkqyrQkhP05qlwjlNVE8ZV3+dIUZgA2/FruM3shDeizz/DgTrvXumnlGm4TrO0SPOzM0bVJIoZFLcswLZoObIrnjU5sBU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=CIkhZVVC; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 83D1BC4AF10;
	Mon, 22 Jul 2024 09:43:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1721641425;
	bh=dx9tNBl+UYPCzsKMP/noRajlmX+0BV6jW6rXGXxRDDE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=CIkhZVVCCzchnWlu0Bj98FBvXHVPu5yJQWsRAN4g/8wxY1rzZGxOcSbAPeNIF1l55
	 Ze40jtjmuw1BX5ZUAnyz+y8vre+WgzuJe4sw/F5CPiW7DMkylOP71kyC1RfVJbidAN
	 xSeLIYKC1PJrHeHu2I6mO/T/p70JXaCtBdvWhYY9Lek0FBfmtS4HM/Y+jM3p7Yh/Wn
	 yPhmoCQ4qmz/xYYIoQXMva+iy0LmRCPrBzKnWRzRp65pm2BFd35Ze1HAP6ZMKT5hnl
	 O6P+Pen28vR6VEgOdwUREuof0lwIHmWqqN1xFiuFxz4eCe29fW76k6PUhmtrg+7wmG
	 46mak6XkhtCGQ==
Received: from johan by xi.lan with local (Exim 4.97.1)
	(envelope-from <johan+linaro@kernel.org>)
	id 1sVpa4-000000006uO-2shO;
	Mon, 22 Jul 2024 11:43:44 +0200
From: Johan Hovold <johan+linaro@kernel.org>
To: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sibi Sankar <quic_sibis@quicinc.com>,
	Abel Vesa <abel.vesa@linaro.org>,
	Rajendra Nayak <quic_rjendra@quicinc.com>,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Johan Hovold <johan+linaro@kernel.org>
Subject: [PATCH v2 5/8] arm64: dts: qcom: x1e80100-crd: disable PCIe6a perst pull down
Date: Mon, 22 Jul 2024 11:42:46 +0200
Message-ID: <20240722094249.26471-6-johan+linaro@kernel.org>
X-Mailer: git-send-email 2.44.2
In-Reply-To: <20240722094249.26471-1-johan+linaro@kernel.org>
References: <20240722094249.26471-1-johan+linaro@kernel.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Disable the PCIe6a perst pull-down resistor to save some power.

Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>
Signed-off-by: Johan Hovold <johan+linaro@kernel.org>
---
 arch/arm64/boot/dts/qcom/x1e80100-crd.dts | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/x1e80100-crd.dts b/arch/arm64/boot/dts/qcom/x1e80100-crd.dts
index 41d05ce01cbb..7406f1ad9c55 100644
--- a/arch/arm64/boot/dts/qcom/x1e80100-crd.dts
+++ b/arch/arm64/boot/dts/qcom/x1e80100-crd.dts
@@ -987,7 +987,7 @@ perst-n-pins {
 			pins = "gpio152";
 			function = "gpio";
 			drive-strength = <2>;
-			bias-pull-down;
+			bias-disable;
 		};
 
 		wake-n-pins {
-- 
2.44.2


