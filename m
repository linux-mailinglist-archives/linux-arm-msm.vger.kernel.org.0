Return-Path: <linux-arm-msm+bounces-26637-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 0747B93786C
	for <lists+linux-arm-msm@lfdr.de>; Fri, 19 Jul 2024 15:25:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 88320B20CB7
	for <lists+linux-arm-msm@lfdr.de>; Fri, 19 Jul 2024 13:25:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 632C3142642;
	Fri, 19 Jul 2024 13:25:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="AH6QvPC/"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 307A113CA9C;
	Fri, 19 Jul 2024 13:25:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721395539; cv=none; b=l16/XcbLaRCuX73RAh/Rqrh9RCI+Qk7XaMH21MgdBGwV8sOxIm5X021LZgDvPkFbjHGFx+rNDigZImOle9AvTxOVDEaT7mcnpE/ObIRLH0uLpH5QUyF6VFNxtzDfGe1tAum8JnaS/MjRcqEF9QvT+QV0F0HwW5Tv6GUyfeLPTSQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721395539; c=relaxed/simple;
	bh=1HdVAteyd4axGn1VdTXZmiikOo+Azic0I71ylzksmgs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=VCFMPRiiQOt/Usd450y8C2WDZB8D3Tb2KH9W1Iv0Pg79DqB4dx+IYRoxcpZltSTWdM/hrgOatpT3vXr/3EJSpMIjxPqmkugwJbCvIH+ImMC3mEGrGYquo+PLwWTbnGPcT9w8D5Es+88HEDiabglz/DNMR4jFg4+iyz7V5Ru9OSQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=AH6QvPC/; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CDEE6C4AF1A;
	Fri, 19 Jul 2024 13:25:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1721395538;
	bh=1HdVAteyd4axGn1VdTXZmiikOo+Azic0I71ylzksmgs=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=AH6QvPC/HJHNgP2KtWGRUX9pFmLVJgcwPn26Qp2dNifk5ALklsab/I9l/yT5mRRLF
	 jh+/HidRlXlzhwYvE/IFGe5gtXj6jlrwAp1v4dm+SN3mhoA24mgfXqMXitxClWVKMm
	 H8cTVHmo2MBBu7FJ6XV54nD9uwEBMtyR0PNYmYdvyT4Y3AJJJ8ycJdz0nhnuH6etpE
	 sGV4IOoCPC72YhepP6GYv53K1fOR9n6lLv3ZIUI3XxlgvWegixleM+RMP58Akig6bT
	 B5Ob3Kn/Q6BQrJ8Wey0ofJinfFkbSjrHDJCFLxE3DXTREcLpNnIzIvSHZ3NoNTF5zG
	 RWyyQCaBvaY6w==
Received: from johan by xi.lan with local (Exim 4.97.1)
	(envelope-from <johan+linaro@kernel.org>)
	id 1sUncI-000000002P1-3rSZ;
	Fri, 19 Jul 2024 15:25:46 +0200
From: Johan Hovold <johan+linaro@kernel.org>
To: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Johan Hovold <johan+linaro@kernel.org>
Subject: [PATCH 2/4] arm64: dts: qcom: sc8280xp-crd: clean up PCIe2a pinctrl node
Date: Fri, 19 Jul 2024 15:25:20 +0200
Message-ID: <20240719132522.9176-3-johan+linaro@kernel.org>
X-Mailer: git-send-email 2.44.2
In-Reply-To: <20240719132522.9176-1-johan+linaro@kernel.org>
References: <20240719132522.9176-1-johan+linaro@kernel.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Clean up the PCIe2a pinctrl node indentation which should use tabs only.

Signed-off-by: Johan Hovold <johan+linaro@kernel.org>
---
 arch/arm64/boot/dts/qcom/sc8280xp-crd.dts | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sc8280xp-crd.dts b/arch/arm64/boot/dts/qcom/sc8280xp-crd.dts
index 4c8ae13d25b9..97bc717279a2 100644
--- a/arch/arm64/boot/dts/qcom/sc8280xp-crd.dts
+++ b/arch/arm64/boot/dts/qcom/sc8280xp-crd.dts
@@ -889,11 +889,11 @@ perst-n-pins {
 		};
 
 		wake-n-pins {
-		       pins = "gpio145";
-		       function = "gpio";
-		       drive-strength = <2>;
-		       bias-pull-up;
-	       };
+			pins = "gpio145";
+			function = "gpio";
+			drive-strength = <2>;
+			bias-pull-up;
+		};
 	};
 
 	pcie3a_default: pcie3a-default-state {
-- 
2.44.2


