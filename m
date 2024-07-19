Return-Path: <linux-arm-msm+bounces-26638-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id F083F93786E
	for <lists+linux-arm-msm@lfdr.de>; Fri, 19 Jul 2024 15:25:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 7D5B1B209CD
	for <lists+linux-arm-msm@lfdr.de>; Fri, 19 Jul 2024 13:25:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 67D88142915;
	Fri, 19 Jul 2024 13:25:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bXvA9NIl"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 307E013DDC0;
	Fri, 19 Jul 2024 13:25:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721395539; cv=none; b=FzJKJWnyguAO45mCgKlqiaZaJzfF+9cmVzUejby4a/cIDjQTKwfiEPCqTwihC7z15jzp+p2Fnj9MBpkK3z1cKc9c8WHzWXJVPjZO0qcL0l8UxPi96XYlmR+nR/KXFeNvortur9djomUz8Ir+xY/5JZK6ZCY5X3aBdiPX3/XMAxI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721395539; c=relaxed/simple;
	bh=DIE5NkW7qO81i3m/Ghl/+SL61kt8Bqn/USbyce9dJws=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=dGs6YrgCrQoCUnznubtQCci06sHC/aiB8o7OKw3pS2Xf7Dg2tpsSerbjGyGRqRitfVCfReYKjtE5R9NMR3RucVshqf6hM+nLTTIUz1dMvyWpinPwgcsfE0omyL2KSpMJUmoyOHypTQ/B6AFiHQAJzcjrpO+c+abdVmyMnQDIqgM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bXvA9NIl; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C9689C4AF18;
	Fri, 19 Jul 2024 13:25:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1721395538;
	bh=DIE5NkW7qO81i3m/Ghl/+SL61kt8Bqn/USbyce9dJws=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=bXvA9NIlX59KUP7pRyz1mZM4h1kPNKDrtNep8/q7mFazW2C9E3j1iwFeTy2RYi0CC
	 clYjy64j0mLnljLfGlwvxyjmma00+3G1IhhryZSLBA7XgOcq4rxS1fgEEF0zG+XBh+
	 nDOlcf72Wt9mxqwTEZe6JwpSH/g/97GKQG9NWPDZgdTGdXaD7K3yq4/ddYLM9GODpx
	 1pqToYjzC5qDA52Nabh90ggbpl2h+dR0TG5jgyzi63qYulxNl5C/yDupMtcsfNZgEx
	 BXYtPLDS4Ie5fO6jVGzAgbrMLLEor0JGSnCwlbyMpN8Yb9+Nvp0o1r/MR5aM4mmx0g
	 S11nY/AX4QGTA==
Received: from johan by xi.lan with local (Exim 4.97.1)
	(envelope-from <johan+linaro@kernel.org>)
	id 1sUncJ-000000002P4-02gi;
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
Subject: [PATCH 3/4] arm64: dts: qcom: sc8280xp-x13s: disable PCIe perst pull downs
Date: Fri, 19 Jul 2024 15:25:21 +0200
Message-ID: <20240719132522.9176-4-johan+linaro@kernel.org>
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

Disable the PCIe perst pull-down resistors to save some power.

Signed-off-by: Johan Hovold <johan+linaro@kernel.org>
---
 arch/arm64/boot/dts/qcom/sc8280xp-lenovo-thinkpad-x13s.dts | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sc8280xp-lenovo-thinkpad-x13s.dts b/arch/arm64/boot/dts/qcom/sc8280xp-lenovo-thinkpad-x13s.dts
index a1baf30b023c..5e5fdb085b88 100644
--- a/arch/arm64/boot/dts/qcom/sc8280xp-lenovo-thinkpad-x13s.dts
+++ b/arch/arm64/boot/dts/qcom/sc8280xp-lenovo-thinkpad-x13s.dts
@@ -1617,7 +1617,7 @@ perst-n-pins {
 			pins = "gpio143";
 			function = "gpio";
 			drive-strength = <2>;
-			bias-pull-down;
+			bias-disable;
 		};
 
 		wake-n-pins {
@@ -1640,7 +1640,7 @@ perst-n-pins {
 			pins = "gpio151";
 			function = "gpio";
 			drive-strength = <2>;
-			bias-pull-down;
+			bias-disable;
 		};
 
 		wake-n-pins {
@@ -1663,7 +1663,7 @@ perst-n-pins {
 			pins = "gpio141";
 			function = "gpio";
 			drive-strength = <2>;
-			bias-pull-down;
+			bias-disable;
 		};
 
 		wake-n-pins {
-- 
2.44.2


