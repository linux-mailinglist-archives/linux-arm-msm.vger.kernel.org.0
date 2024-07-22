Return-Path: <linux-arm-msm+bounces-26767-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 44424938CD2
	for <lists+linux-arm-msm@lfdr.de>; Mon, 22 Jul 2024 11:59:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id F39031C23DBF
	for <lists+linux-arm-msm@lfdr.de>; Mon, 22 Jul 2024 09:59:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 74A2416F289;
	Mon, 22 Jul 2024 09:55:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="MSYreWkq"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D56116F0E1;
	Mon, 22 Jul 2024 09:55:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721642121; cv=none; b=aBvx3sAccRivrn4bCr1p9CoObWCDgymhQNS97wywWV1aFKNuPk8ztQaMWTWAxWcyChFznYmmuT7Cg5/UMr5++3kgBaLkpd6Y2bStl0+87B6bDPI8m9Q6XByPg5i2eCewCsMMOn2yLbkhVF7W5ttzqvkw0zOB2bOXWNk0N75VR28=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721642121; c=relaxed/simple;
	bh=tnTqghub0gpnpeLE6omoEXVHAcZJhvQATaNQQ++Wxyc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=uCXmy61wGvkn+NfqpSHJsd2pR+z9d+0rejQsgTEgtydLtU82GOdnQr8gJ1cK4v/w4WJaYTa3+TZochGw8DQGDlpOBhJRsg99OUqLAter0VSjKJdZjpe0KhDInfI+tTL5p3uOaA/R/XDWc2Jhd14UZ4ny03EEKgM6DerSeqvjNPk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=MSYreWkq; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CA633C4DDF7;
	Mon, 22 Jul 2024 09:55:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1721642120;
	bh=tnTqghub0gpnpeLE6omoEXVHAcZJhvQATaNQQ++Wxyc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=MSYreWkqKqKtdB9TfzwIV5dzQ2Id9S0HrVJzzix1Si3o0x9lcTD6LRKR6p/xaGQrd
	 qlQMdlLp8PPDpcobtK4JYTTBRKXLFoy+ZOGTUNRg1xMNdg7E9K09jRuMFIX/9hju+v
	 nHvZ37DarDfEnDNjYZuEEqsMfL0nA4KkcV6md3ZTe8qNdtzlyYODJpiwkeSYPAK4rs
	 l1yBZ7+8vDJ3jlG68U9HScvLg/HgyTMx38BH6VpD3kKVqSkVz9jI30e0FQSxt7Jslf
	 +iqluh9G2EsaBFJE5IX4SDsTXHn5/rGY2fYS3q0SUx+vLGxvt9HbKa1mYLGZELp64p
	 GUgK8RSqJT+BA==
Received: from johan by xi.lan with local (Exim 4.97.1)
	(envelope-from <johan+linaro@kernel.org>)
	id 1sVplI-0000000079l-07yI;
	Mon, 22 Jul 2024 11:55:20 +0200
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
Subject: [PATCH 11/12] arm64: dts: qcom: x1e80100-yoga-slim7x: disable PCIe6a perst pull down
Date: Mon, 22 Jul 2024 11:54:58 +0200
Message-ID: <20240722095459.27437-12-johan+linaro@kernel.org>
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

Disable the PCIe6a perst pull-down resistor to save some power.

Signed-off-by: Johan Hovold <johan+linaro@kernel.org>
---
 arch/arm64/boot/dts/qcom/x1e80100-lenovo-yoga-slim7x.dts | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/x1e80100-lenovo-yoga-slim7x.dts b/arch/arm64/boot/dts/qcom/x1e80100-lenovo-yoga-slim7x.dts
index dde2957e6dc7..f7534623ff77 100644
--- a/arch/arm64/boot/dts/qcom/x1e80100-lenovo-yoga-slim7x.dts
+++ b/arch/arm64/boot/dts/qcom/x1e80100-lenovo-yoga-slim7x.dts
@@ -794,7 +794,7 @@ perst-n-pins {
 			pins = "gpio152";
 			function = "gpio";
 			drive-strength = <2>;
-			bias-pull-down;
+			bias-disable;
 		};
 
 		wake-n-pins {
-- 
2.44.2


