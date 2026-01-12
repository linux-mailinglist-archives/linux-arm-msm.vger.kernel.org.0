Return-Path: <linux-arm-msm+bounces-88621-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C54ED152AF
	for <lists+linux-arm-msm@lfdr.de>; Mon, 12 Jan 2026 21:14:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 4E8D5302F816
	for <lists+linux-arm-msm@lfdr.de>; Mon, 12 Jan 2026 20:14:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5F11E32C94B;
	Mon, 12 Jan 2026 20:14:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mainlining.org header.i=@mainlining.org header.b="ooBwlsJP";
	dkim=permerror (0-bit key) header.d=mainlining.org header.i=@mainlining.org header.b="3VGRp08V"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail.mainlining.org (mail.mainlining.org [5.75.144.95])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D621E315D2C;
	Mon, 12 Jan 2026 20:14:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=5.75.144.95
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768248845; cv=none; b=XEcGjHNmFLCcyEs//U90P/3mJeg5zV15LnzMJlfo4rcasp0ykghrNA5GJrJRY7yBMWdWMcyRW3bSzNKdGWxoCrI9eU0mUvDdd6gpdIdZjN3EX+OaWwaBGVgwT/GwGGQaw2VoOEgn7c44/xaRbtPDoLkI97LtLzGXLslQ8TumGQM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768248845; c=relaxed/simple;
	bh=lnoyn16NcOXYWNAlWg6QNBqY3r1Wpi3a44dvcSfXrh4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=mu7Ddu6/dXqNxhGgAM2AvknvComnTuIuWzcGPsBRSOipNsIkOrGOKX7lB2MKv9QDmUw0n2/TH7Qh+kvxV3ERoywX61KHTQiOTU1exRCelzh8bjm8/vCGETmaWOGZVY9fzlCYt7dZVe/sOhbR9XEhysG8/a2xmMWZwOOB6kzXIhU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mainlining.org; spf=pass smtp.mailfrom=mainlining.org; dkim=pass (2048-bit key) header.d=mainlining.org header.i=@mainlining.org header.b=ooBwlsJP; dkim=permerror (0-bit key) header.d=mainlining.org header.i=@mainlining.org header.b=3VGRp08V; arc=none smtp.client-ip=5.75.144.95
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mainlining.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mainlining.org
DKIM-Signature: v=1; a=rsa-sha256; s=202507r; d=mainlining.org; c=relaxed/relaxed;
	h=To:Message-Id:Subject:Date:From; t=1768248823; bh=nwGEjS2nSsGbkeAvRF6g0A7
	0/YelzFDSh/tj0V2oh4U=; b=ooBwlsJP3hmo3NQNnhD7luk3J7ZexzRpefMkDA6zf7Wx62KbqH
	Jz/6bN4ZbM3BkCgqbGkrU6tZFoV+oEK7lbTykLfwMiFNIPTzmnVaEmziG6d1s403/AhtrMo5EQ1
	I8s5MJID1jXnbW5zhUE3Jdn16pu33vf7xnJKz/s8rOEU+0ZXKi8p5fndDBprVteTgJu0AixMF7i
	l/WSiOf2iDfy2VolUJGsJTw5zetsCxfgPWNXREDdrh0/s6IjQNi+xubv8pv/UxjWwCIqAON+TId
	D0lc/s+E81PXNtzv5TpdqpA4zuU/LveuzpvH0FSV2EB0uTF4aW9Xp8PL3jggWUmQs3g==;
DKIM-Signature: v=1; a=ed25519-sha256; s=202507e; d=mainlining.org; c=relaxed/relaxed;
	h=To:Message-Id:Subject:Date:From; t=1768248823; bh=nwGEjS2nSsGbkeAvRF6g0A7
	0/YelzFDSh/tj0V2oh4U=; b=3VGRp08Vk++XvdP4Q8S4sb+ayJfh75MPi+2wD65FVSdarF41sM
	D+mLveQPKd9YDHiGOoFgyXhn5MB1MzRIPbCg==;
From: =?utf-8?q?Barnab=C3=A1s_Cz=C3=A9m=C3=A1n?= <barnabas.czeman@mainlining.org>
Date: Mon, 12 Jan 2026 21:13:27 +0100
Subject: [PATCH 4/6] arm64: dts: qcom: sm6125-xiaomi-ginkgo: Fix reserved
 gpio ranges
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260112-xiaomi-willow-v1-4-8e4476897638@mainlining.org>
References: <20260112-xiaomi-willow-v1-0-8e4476897638@mainlining.org>
In-Reply-To: <20260112-xiaomi-willow-v1-0-8e4476897638@mainlining.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Gabriel Gonzales <semfault@disroot.org>, 
 Kees Cook <kees@kernel.org>, Tony Luck <tony.luck@intel.com>, 
 "Guilherme G. Piccoli" <gpiccoli@igalia.com>, 
 Biswapriyo Nath <nathbappai@gmail.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-hardening@vger.kernel.org, 
 phone-devel@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht, 
 linux@mainlining.org, 
 =?utf-8?q?Barnab=C3=A1s_Cz=C3=A9m=C3=A1n?= <barnabas.czeman@mainlining.org>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1768248812; l=840;
 i=barnabas.czeman@mainlining.org; s=20240730; h=from:subject:message-id;
 bh=lnoyn16NcOXYWNAlWg6QNBqY3r1Wpi3a44dvcSfXrh4=;
 b=bw7wuTzQ4MangUA2mFAPKmOESBNsWGDiTTzNZg4FOgvIRoBwrWQz2qmU4KN8DUwQh7X/Y7RzD
 NcftCK1cKJCAc3UJEwYKFeUr7ok/5mX1C97KtY5MdtkJjltM0Kt+bBw
X-Developer-Key: i=barnabas.czeman@mainlining.org; a=ed25519;
 pk=TWUSIGgwW/Sn4xnX25nw+lszj1AT/A3bzkahn7EhOFc=

The device was crashing on boot because the reserved gpio ranges
was wrongly defined. Correct the ranges for avoid pinctrl crashing.

Fixes: 9b1a6c925c88 ("arm64: dts: qcom: sm6125: Initial support for xiaomi-ginkgo")
Signed-off-by: Barnabás Czémán <barnabas.czeman@mainlining.org>
---
 arch/arm64/boot/dts/qcom/sm6125-xiaomi-ginkgo.dts | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/sm6125-xiaomi-ginkgo.dts b/arch/arm64/boot/dts/qcom/sm6125-xiaomi-ginkgo.dts
index 666daf4a9fdd..163ecdc7fd6c 100644
--- a/arch/arm64/boot/dts/qcom/sm6125-xiaomi-ginkgo.dts
+++ b/arch/arm64/boot/dts/qcom/sm6125-xiaomi-ginkgo.dts
@@ -296,7 +296,7 @@ &sdhc_2 {
 };
 
 &tlmm {
-	gpio-reserved-ranges = <22 2>, <28 6>;
+	gpio-reserved-ranges = <0 4>, <30 4>;
 };
 
 &usb3 {

-- 
2.52.0


