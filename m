Return-Path: <linux-arm-msm+bounces-26761-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E7132938CC8
	for <lists+linux-arm-msm@lfdr.de>; Mon, 22 Jul 2024 11:59:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 224DF1C23D09
	for <lists+linux-arm-msm@lfdr.de>; Mon, 22 Jul 2024 09:59:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 57C7E16F26C;
	Mon, 22 Jul 2024 09:55:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="QLHk5xnT"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D883616EBEA;
	Mon, 22 Jul 2024 09:55:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721642120; cv=none; b=MqVpv3lBEE94H/NOcpx6TEgIUMXhH1fmmX0qxyXA0dI5b8dQCmtAZReKLt4nuZnsH9hFgmuDPDyLLT86DIZB6BuxYSIFECHDxFptUZ6Rm3/RCKT0B+b936GXQOc+7jR+/rInB55ouUu48VNg2DAVlZvhCB51VDdIwmXQ9rlgw+I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721642120; c=relaxed/simple;
	bh=LHD2wmUiMEnvEGP802hKWAFX2vkyza4ijkwiT7L5ajU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=EQakQCB7ppe8Gt5JXWX13oiOgqmTnqHHH+g36HhQrNdabdudTysTdx5/lqM17Bk5tN0xf/P48wf54WLi+ZTYbL6NIuAk2zGbXgRV6dym0ehL8lz0h7yGoLNxSy1lBLwXvw1dRpyhZtMq9lUXwo8F+PYfHGmxYi7b1BdKYT7mmIw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=QLHk5xnT; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 40337C4AF0D;
	Mon, 22 Jul 2024 09:55:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1721642120;
	bh=LHD2wmUiMEnvEGP802hKWAFX2vkyza4ijkwiT7L5ajU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=QLHk5xnT2AYjEHR5IzT7QXE0LxzHiM725TKCarge6CppxMxX4cDI4mdsCDsMwmHWf
	 Hq6VQbOtEZjB9sNefmvp4pSJ3BU2wD/SQa56GkqtUZOXLY7/NraVFg7O5SshG/WcKU
	 lbWw+ZfSl7qZWqR8Ycx1hXemthT9giNEy0Nb9FlfwmR7ujiKXjX1fa723cHgHLZ3SJ
	 Zrt8niL9mzC61H11kWwWJfNQnPUQDG0DzurftIG1C/Ex+g1DvixPwH4mfn3MnoDk4X
	 R28irgSrplB9Pl898VvetVFF2xlLL3KAEbugm4KMjkxNV6jjG3CM+mY6dvrU1EzoXj
	 oaT3iYLoCNosQ==
Received: from johan by xi.lan with local (Exim 4.97.1)
	(envelope-from <johan+linaro@kernel.org>)
	id 1sVplH-0000000079O-157e;
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
Subject: [PATCH 03/12] arm64: dts: qcom: x1e80100-qcp: disable PCIe6a perst pull down
Date: Mon, 22 Jul 2024 11:54:50 +0200
Message-ID: <20240722095459.27437-4-johan+linaro@kernel.org>
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
 arch/arm64/boot/dts/qcom/x1e80100-qcp.dts | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/x1e80100-qcp.dts b/arch/arm64/boot/dts/qcom/x1e80100-qcp.dts
index 86735f07fbb5..998e5ea2f52e 100644
--- a/arch/arm64/boot/dts/qcom/x1e80100-qcp.dts
+++ b/arch/arm64/boot/dts/qcom/x1e80100-qcp.dts
@@ -677,7 +677,7 @@ perst-n-pins {
 			pins = "gpio152";
 			function = "gpio";
 			drive-strength = <2>;
-			bias-pull-down;
+			bias-disable;
 		};
 
 		wake-n-pins {
-- 
2.44.2


