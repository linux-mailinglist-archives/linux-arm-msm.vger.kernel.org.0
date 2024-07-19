Return-Path: <linux-arm-msm+bounces-26639-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id CBDFC937870
	for <lists+linux-arm-msm@lfdr.de>; Fri, 19 Jul 2024 15:26:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8B4352828D8
	for <lists+linux-arm-msm@lfdr.de>; Fri, 19 Jul 2024 13:26:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AEFDA144307;
	Fri, 19 Jul 2024 13:25:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="pS0ffJaP"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83E14143751;
	Fri, 19 Jul 2024 13:25:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721395539; cv=none; b=KJ1mkPRC9fsjZT55svNbldsdbOI/7fnFV8aZTTlOgz7i6YkDSL1BCvoMr+GiltILFzQc2lzXSq2S2nC/Fj62sfu3H11OqNah25NouMLNKPf9Jza5TY+1+tSNTaKt7Iy6KDHH/bBWUQODjmM79HurwdJcGPYy1dMPSbECeT9QlaU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721395539; c=relaxed/simple;
	bh=4cAkDIcI+gdctKi3KRbi2FbnJnqrEPOi9gLMxHSHIM8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=KRSd+T+BVT6CYabHJDPXBIegGhebQ9AM2GUO/AST4niUvsUZDMqjXYvqfYBaNBHfSz/0T/7lnxciO/ypDRdl7Oya7/m90NhVtAW2CPJIAav+UGuF8IWRUHSSTEEtPwr0dOyqIUZQeQtCTxC9DsK8e1QrxYCTGB/O8BEQr+rk66Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=pS0ffJaP; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1ED6FC4AF0F;
	Fri, 19 Jul 2024 13:25:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1721395539;
	bh=4cAkDIcI+gdctKi3KRbi2FbnJnqrEPOi9gLMxHSHIM8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=pS0ffJaPrZLIUCXyh5fulmgMy9ZX7wGlHzAy74C/h73ZCmD6c0MCUeeqKZUyd68iY
	 N+Ectyw+FOffGUXMaMzUBHDd1tlLZdiy+mnaglI+oCLkOzpWgSojwainQpXsbWyf/+
	 xb+0WuBvS8e4w8fzFJVORPfDX0JkXq0e3NVazUYb6e9dENDh8JYRN0gJqJ0sLx+8EJ
	 zgnHROcQp13P/MCrNwqcwVz/I6fmR3X/WJK5pjp+EgzmC9x65zy41etwvAGW366cvw
	 J54U0wWdcz/AaP9mARaNYhwbyUaCSS0Bj70om85CtRMK8Wd3IfwAira/EG6tlHsc+l
	 2pGZM9PAEpt6w==
Received: from johan by xi.lan with local (Exim 4.97.1)
	(envelope-from <johan+linaro@kernel.org>)
	id 1sUncJ-000000002P7-0SiN;
	Fri, 19 Jul 2024 15:25:47 +0200
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
Subject: [PATCH 4/4] arm64: dts: qcom: sc8280xp-x13s: clean up PCIe2a pinctrl node
Date: Fri, 19 Jul 2024 15:25:22 +0200
Message-ID: <20240719132522.9176-5-johan+linaro@kernel.org>
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
 .../boot/dts/qcom/sc8280xp-lenovo-thinkpad-x13s.dts    | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sc8280xp-lenovo-thinkpad-x13s.dts b/arch/arm64/boot/dts/qcom/sc8280xp-lenovo-thinkpad-x13s.dts
index 5e5fdb085b88..888f42ca230f 100644
--- a/arch/arm64/boot/dts/qcom/sc8280xp-lenovo-thinkpad-x13s.dts
+++ b/arch/arm64/boot/dts/qcom/sc8280xp-lenovo-thinkpad-x13s.dts
@@ -1621,11 +1621,11 @@ perst-n-pins {
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


