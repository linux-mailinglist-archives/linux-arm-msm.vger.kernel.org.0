Return-Path: <linux-arm-msm+bounces-89698-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 234D1D3AE92
	for <lists+linux-arm-msm@lfdr.de>; Mon, 19 Jan 2026 16:13:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id ACC8F30123DA
	for <lists+linux-arm-msm@lfdr.de>; Mon, 19 Jan 2026 15:13:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 95D2A389DF4;
	Mon, 19 Jan 2026 15:13:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="p/FDDUU4"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6076A387592;
	Mon, 19 Jan 2026 15:13:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768835585; cv=none; b=L4pEgX1PFvciIGMKRcMyUYT/p9Q2Vg7LEEhZQKsxVzBy0vDfH4cxfkyky9+4//UCgzyyFUzgRrwxSikda8/fqHUlcShtaX4AicfQlcNC2YN0zLjkm8YJItLNJahAo+Nv2rQJCaRKhHvsNpz2rZBNS9yWNu9/F/trvG6s1UDN5uk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768835585; c=relaxed/simple;
	bh=VRRMqCV/AQFHy8HFcNFqwCK8A3YlGWEFKlrpGI43Wr8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Dm/T2N/rKbcVAcKup4noyQoIo1hJIbIYnebVZGEiFogKOmc8cWY9fNkNd/FeN6zYEXDbRsAdKpEjqVyBAhH2gAkbjO+JyBot9Ke+o/L/zHoVOorcRwatzJoGTF5sBUyIqrJC9sbcBFHim3WsPPMI7tSJMzL7wDe7Nld0BpP0zU8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=p/FDDUU4; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 11F5FC19424;
	Mon, 19 Jan 2026 15:13:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768835585;
	bh=VRRMqCV/AQFHy8HFcNFqwCK8A3YlGWEFKlrpGI43Wr8=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=p/FDDUU4tsrqVYKfdxfFyUA1yKWqJc7NYdR7YmLOUeH07N+jjAg5HxKsqy2q/N5/k
	 O0YkCTXnZYBu32nLzEl5i1n/bff6oWEe8RtpMjl1JOtg2CBNOw46StcWZtqJ2A5lPv
	 eJ8dyGuRrFb72HbrAn0Dtvh7VlIQqToStJOvWW+Sd9xhkDntHBwCLwo7wZ5KRaR/v2
	 xdiRu5OVuEPyKySSGFut8Wn3ykOZjfhAP/jE/k+mk0EyQXBm8NiMVyh3zfKLulgaVd
	 AKlanH2BEx4u58XkSpxpzzvPQi+ar6NEZ87l3L0PXTbp0g5LbTbM5yxAm9rX6tyWQO
	 BLyFd7YaM2cQw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0AB2ED29C36;
	Mon, 19 Jan 2026 15:13:05 +0000 (UTC)
From: Biswapriyo Nath via B4 Relay <devnull+nathbappai.gmail.com@kernel.org>
Date: Mon, 19 Jan 2026 15:13:03 +0000
Subject: [PATCH 1/5] arm64: dts: qcom: sm6125-xiaomi-ginkgo: Fix volume up
 button
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260119-xiaomi-ginkgo-features-v1-1-3c8fae984bda@gmail.com>
References: <20260119-xiaomi-ginkgo-features-v1-0-3c8fae984bda@gmail.com>
In-Reply-To: <20260119-xiaomi-ginkgo-features-v1-0-3c8fae984bda@gmail.com>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Biswapriyo Nath <nathbappai@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1768835583; l=1209;
 i=nathbappai@gmail.com; s=20260118; h=from:subject:message-id;
 bh=jiiaTZ15Im6IHRFc766Pp3tb05C/ONJ1MBj9QOjD0yQ=;
 b=a8AaxCiAMz5dGHdlem4D4eh1crcCVCVY9UZCvErpOPZLuNC5xt6fzQHQbmyy7RaLvV9OPw+Bc
 /bkvG/vpY+uBLyLF6WkZYkPn3YXM0uxo9BP7otEcGZB8kgQYMGj+wP9
X-Developer-Key: i=nathbappai@gmail.com; a=ed25519;
 pk=slmb/9yXbet+KTiT3EYLCp0p0MEOYa3EdjUXP+HXfjg=
X-Endpoint-Received: by B4 Relay for nathbappai@gmail.com/20260118 with
 auth_id=607
X-Original-From: Biswapriyo Nath <nathbappai@gmail.com>
Reply-To: nathbappai@gmail.com

From: Biswapriyo Nath <nathbappai@gmail.com>

gpio6 in pm6125 is used for EMMC and UFS thermal monitoring. It is
changed to the correct gpio for volume up button.

Fixes: 9b1a6c925c88 ("arm64: dts: qcom: sm6125: Initial support for xiaomi-ginkgo")

Signed-off-by: Biswapriyo Nath <nathbappai@gmail.com>
---
 arch/arm64/boot/dts/qcom/sm6125-xiaomi-ginkgo-common.dtsi | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sm6125-xiaomi-ginkgo-common.dtsi b/arch/arm64/boot/dts/qcom/sm6125-xiaomi-ginkgo-common.dtsi
index 2605d0c94..6e0333378 100644
--- a/arch/arm64/boot/dts/qcom/sm6125-xiaomi-ginkgo-common.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm6125-xiaomi-ginkgo-common.dtsi
@@ -85,7 +85,7 @@ gpio-keys {
 
 		key-volume-up {
 			label = "Volume Up";
-			gpios = <&pm6125_gpios 6 GPIO_ACTIVE_LOW>;
+			gpios = <&pm6125_gpios 5 GPIO_ACTIVE_LOW>;
 			linux,code = <KEY_VOLUMEUP>;
 			debounce-interval = <15>;
 			linux,can-disable;
@@ -96,9 +96,9 @@ key-volume-up {
 
 &pm6125_gpios {
 	vol_up_n: vol-up-n-state {
-		pins = "gpio6";
+		pins = "gpio5";
 		function = "normal";
-		power-source = <1>;
+		power-source = <0>;
 		bias-pull-up;
 		input-enable;
 	};

-- 
2.52.0



