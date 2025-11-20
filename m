Return-Path: <linux-arm-msm+bounces-82724-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id D3907C75BB7
	for <lists+linux-arm-msm@lfdr.de>; Thu, 20 Nov 2025 18:38:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by tor.lore.kernel.org (Postfix) with ESMTPS id 9E5802D5A5
	for <lists+linux-arm-msm@lfdr.de>; Thu, 20 Nov 2025 17:36:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C79A13242C3;
	Thu, 20 Nov 2025 17:33:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="oGelNrRl"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 905053242BD;
	Thu, 20 Nov 2025 17:33:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763660036; cv=none; b=V0yqGsi8TzfmUNgNO++VWyr/PUimGJZH7cNClfidfv2WSKDx8VaJgZwhD/KC6ILR3ZrKNI+I3BkYNeY2vNogke3+v0IY/JtoKIxL0kutZ/LZHhy7qrwAq3jltgv1zs7Tyx4eygXiYGTLDCS2MCrsGN9xhaCWnRbNFXkQLcOtF88=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763660036; c=relaxed/simple;
	bh=Cy9R2KdeIkc44MlLZCcGPAraui2bceoEIL/ie2wcXco=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=i6RSGfX+dBVdotAvSQoPLfFaawjwSINnEKlImV6sal6YTGAIJ20EDT2tMEONXIlIexRAbZ5fiVbL4E7MrjaqJxNSkGvb+YuJcHf6yB5SydjuSkXvjrTHO4pxG9wP09CmKDf8mRuXi5b3yopWyR504mksg9wXj7ctzQH7+LgkrSs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=oGelNrRl; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3A0A0C4CEF1;
	Thu, 20 Nov 2025 17:33:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763660036;
	bh=Cy9R2KdeIkc44MlLZCcGPAraui2bceoEIL/ie2wcXco=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=oGelNrRl3AMvJ4YNM4dIB59nnRJ006OebyMZNr3K4MW8u/dcP7hTTMFyry+waaECu
	 6ZtxW0Ax25N+DtReX2XfrcFGzlwZlAGw8DQbEh5/kWEWFI196w2XoMKayEiHDrCkRA
	 mC8wvR42FSnkFr/AIfJyEdelBfsMxLhwKl0mhTzgBHIOXLGGhpyv1l/NwEQe9JUpim
	 dRsXNBosgb2uiL+Aytv9DRE+GHGCqlaQEUZ3jKrdyn4DCXhtR6yg3nkuszq4UPCycl
	 8ha9rljQfSb9vfjf6Y8+nv/v8w+7OnYhpHCDSogKbhMosuxUrm2n73Fp8MmlhPEj2g
	 Kdr3ez0UA4O3A==
From: Krzysztof Kozlowski <krzk@kernel.org>
Date: Thu, 20 Nov 2025 18:33:32 +0100
Subject: [PATCH v3 2/3] arm64: dts: qcom: sm8750-mtp: Enable Iris codec
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251120-b4-sm8750-iris-dts-v3-2-8715442c30d9@kernel.org>
References: <20251120-b4-sm8750-iris-dts-v3-0-8715442c30d9@kernel.org>
In-Reply-To: <20251120-b4-sm8750-iris-dts-v3-0-8715442c30d9@kernel.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
 Krzysztof Kozlowski <krzk@kernel.org>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=948; i=krzk@kernel.org;
 h=from:subject:message-id; bh=QYwkqME+jDRa7cizbCx0I5Jv9UsK551isXnixj28+J4=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBpH1D7gk2uiJeqIqgMqQQhLHnsAhyQ3S2Cswy5+
 XGctcS4bAyJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaR9Q+wAKCRDBN2bmhouD
 1w1pD/9YRYWWU24KE7Ztv1q0hpPH4PqPQBzcYKksJ3NTP3J9NEakXndfo4rJQtGVxbhMJJLCymz
 /ms5Z8Q7RL+yp/T/9AzWJQ56Z2KKUF1t+ggeKtIcIv2I1qzVqhAvKdPtz3CFVFrd2Qq5YXIqOq9
 +tDEQwHcmcN3+eri5YbckH2fBxwRHmvK50NorMpV86prqKtBWlwQ3Y6yOuUdeqJhLiWsPhDUGah
 0z4H2DrdJ1yb6F4sbj0ucUY3Iq7NrP+cNlRq3eYFor+bQ9CS6/jCIJKYjbe2OJG1k3pTkxf0a5e
 LOjau7eRNJzVKr+i3FnTiPQdnXjqXapFtY04hdjInFI5+ZkOz90NNuuMJDOrH1F+UD7lzQgS0ZG
 U26C2cK35DG3O/f32fEmCKC4tC1wPHZ28wfE7rD4jmXpNdQ+Ue9HZQ3TY+kidW09IxfwfhGUPdk
 Abnc0MCQR1Zi+RyEsishwlhfwoLZsIaMYIEoXQs5E6XKzGpRveckMk8hC0jtzcgY6iBz5xjokTS
 NUph7EwNY8QC9jPgCThuxNc3M8+zQC7UcdDLWw/01ys4kGVP6ggv3/fCI23VqptayXCwvi41vMz
 P2ZdrbOK4bHHNiVl+pOZytpeGbPNRKfw4iMAHiUhmt4fNtNjeWLCRAH0Wbxc6hqXBbQRaPszooY
 eglC+6e9mwQ/gzg==
X-Developer-Key: i=krzk@kernel.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B

From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Enable on SM8750 MTP the Iris video codec for accelerated video
encoding/decoding.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>

---

For Rob's bot reports:

qcom,sm8750-videocc bindings and clock headers dependency (will fail
build):
https://lore.kernel.org/r/20251118-sm8750-videocc-v2-v4-0-049882a70c9f@oss.qualcomm.com
---
 arch/arm64/boot/dts/qcom/sm8750-mtp.dts | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm8750-mtp.dts b/arch/arm64/boot/dts/qcom/sm8750-mtp.dts
index c8cb521b4c26..d4885a530e68 100644
--- a/arch/arm64/boot/dts/qcom/sm8750-mtp.dts
+++ b/arch/arm64/boot/dts/qcom/sm8750-mtp.dts
@@ -925,6 +925,10 @@ vreg_l7n_3p3: ldo7 {
 	};
 };
 
+&iris {
+	status = "okay";
+};
+
 &lpass_vamacro {
 	pinctrl-0 = <&dmic01_default>, <&dmic23_default>;
 	pinctrl-names = "default";

-- 
2.48.1


