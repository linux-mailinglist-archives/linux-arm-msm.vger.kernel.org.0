Return-Path: <linux-arm-msm+bounces-34600-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FB1C9A0D4D
	for <lists+linux-arm-msm@lfdr.de>; Wed, 16 Oct 2024 16:52:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9A57F286AA9
	for <lists+linux-arm-msm@lfdr.de>; Wed, 16 Oct 2024 14:52:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ABB9220E004;
	Wed, 16 Oct 2024 14:52:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mZNvknDS"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82CC320B1EA;
	Wed, 16 Oct 2024 14:52:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729090362; cv=none; b=af/NHLtwh1eTgbMX0NcI2xwHA9zhgRy+4MaWDlg5sx86xUhzmUs22Y7z6mXqRdBhCGKnO1CfoRoc5fM66g8i3Z3Wnq9vtAAapfGTY3QiZHkzvywtexMA4WbX4IE6c2JvXmeoWpSXNGwh5nVDhfsiACY+EfaxxlZ4h0p6zPqbcNI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729090362; c=relaxed/simple;
	bh=d5k1+VtAycHsa3rqpCtoes7Ts2e+x6URHCvrZkzKK18=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=n7w2Tv9jwsb7o/qjr8/IhlEb7muPTQRofrPuN7Kyu3H9KP+65wvywODPr6AAohpT7UXYLkEfk7g9pMqFMG6S3HnUxaNW2/o4tc+U86Q+aYTB+0oCQrLgG+NWkSiS3rymd3otHg26clNQ+FKhm2MxnP/AC2NdBzD4nn/41+1q1bo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mZNvknDS; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 16D89C4AF0C;
	Wed, 16 Oct 2024 14:52:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1729090362;
	bh=d5k1+VtAycHsa3rqpCtoes7Ts2e+x6URHCvrZkzKK18=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=mZNvknDSROFw2hUAYCwfqJBE68vIU0YZMvT343JS6EEwlBUHqtuanGH+QpS6plbfm
	 RSCLZctzEi6M5bV/KxikgQKthodcO7a5+keRxPj2EBz60LnwqA7SYxQTZ/ROJV2+3H
	 wuqcCBKOUzMQ0J05YcuEUm1opBx+PVQl0HtwNeByeEkFdw+V40vIWJ+XfcB3qNpAB4
	 7rFzfNzjl+wKzIVg6ZZJmuBgHmWOym+z05IVvIgDsATHbfYa/rKpu/ITRm6YwEE4tL
	 WIYLExTlYgsqXTvg/3Vji9VYmghNggB1dF3mxGREz/iOOq6276Ud7i8wAuAF4N62Qf
	 IZrppozsdiP9Q==
Received: from johan by xi.lan with local (Exim 4.97.1)
	(envelope-from <johan+linaro@kernel.org>)
	id 1t15OL-000000006UH-2wk6;
	Wed, 16 Oct 2024 16:52:49 +0200
From: Johan Hovold <johan+linaro@kernel.org>
To: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Abel Vesa <abel.vesa@linaro.org>,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Johan Hovold <johan+linaro@kernel.org>
Subject: [PATCH 1/6] arm64: dts: qcom: x1e78100-t14s: fix nvme regulator boot glitch
Date: Wed, 16 Oct 2024 16:51:07 +0200
Message-ID: <20241016145112.24785-2-johan+linaro@kernel.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20241016145112.24785-1-johan+linaro@kernel.org>
References: <20241016145112.24785-1-johan+linaro@kernel.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The NVMe regulator has been left enabled by the boot firmware. Mark it
as such to avoid disabling the regulator temporarily during boot.

Fixes: 7d1cbe2f4985 ("arm64: dts: qcom: Add X1E78100 ThinkPad T14s Gen 6")
Cc: Konrad Dybcio <konradybcio@kernel.org>
Signed-off-by: Johan Hovold <johan+linaro@kernel.org>
---
 arch/arm64/boot/dts/qcom/x1e78100-lenovo-thinkpad-t14s.dts | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/x1e78100-lenovo-thinkpad-t14s.dts b/arch/arm64/boot/dts/qcom/x1e78100-lenovo-thinkpad-t14s.dts
index 941dfddd6713..fdde988ae01e 100644
--- a/arch/arm64/boot/dts/qcom/x1e78100-lenovo-thinkpad-t14s.dts
+++ b/arch/arm64/boot/dts/qcom/x1e78100-lenovo-thinkpad-t14s.dts
@@ -139,6 +139,8 @@ vreg_nvme: regulator-nvme {
 
 		pinctrl-0 = <&nvme_reg_en>;
 		pinctrl-names = "default";
+
+		regulator-boot-on;
 	};
 
 	vph_pwr: regulator-vph-pwr {
-- 
2.45.2


