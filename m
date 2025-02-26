Return-Path: <linux-arm-msm+bounces-49534-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F773A46317
	for <lists+linux-arm-msm@lfdr.de>; Wed, 26 Feb 2025 15:38:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A1F5C166EC5
	for <lists+linux-arm-msm@lfdr.de>; Wed, 26 Feb 2025 14:38:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CD131222577;
	Wed, 26 Feb 2025 14:37:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=trvn.ru header.i=@trvn.ru header.b="IgWeA/uH"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from box.trvn.ru (box.trvn.ru [45.141.101.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D64321B9CC;
	Wed, 26 Feb 2025 14:37:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.141.101.25
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740580672; cv=none; b=oKsOvlYCojx7+2XGiwymNzt4s1CB5eCo0vwu3CcT0gIF/gZ8d5CSBvWJHZ7eE5Jyk4E03reWiY0gbb+AGol08hl2HQk6OJgkysmFc7YO0qAUPnmKcyOlWwr6y09RrnEYAADOziSVcP6iaDrFcaKadcnwGuuAEIqzFfI3XaD49f8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740580672; c=relaxed/simple;
	bh=1uBLwcqK1D8Ilr2JTnatyS4/HsSqyloEpvfZyxMxfW4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=O4jCVCTQ8hgsDhQ9yniG4gk4fJFRqAFyLX6vfuXj81w5Wguxj1ZHDQHgdP381S7PR1FNRDZO9KMr5W6juDgNp0LOGXDSQLLC8Pf/juldDQsmLtZ789rRQZC74YG02S03mEvw/nr8SGsCKzJYwsz8BfYpb/tIxp3Fi5//Da+orNk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=trvn.ru; spf=pass smtp.mailfrom=trvn.ru; dkim=pass (2048-bit key) header.d=trvn.ru header.i=@trvn.ru header.b=IgWeA/uH; arc=none smtp.client-ip=45.141.101.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=trvn.ru
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=trvn.ru
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=trvn.ru; s=mail;
	t=1740580230; bh=1uBLwcqK1D8Ilr2JTnatyS4/HsSqyloEpvfZyxMxfW4=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=IgWeA/uHw7Uvj++XG+gKQVNJ7brkNdOYn7QgcLdQqG4UIMaoqXZ2JBbWfkn6Bldx2
	 q2iteow3N3TFk6cuua12pPnObxl3zG+M3yNu76plnVZ2KyTlqFvG6yO4wHSDMkqBgv
	 a//2Fz2sESmn3/wV9Apd2yKyCYAopI9MNjFzT9rGn+tLkZnSjdlpTQpxRFu3LOPTbI
	 o+xzO2fyF3k2qBbRB+bVWLbp8X51xJm3cKZbUKOJ9+dx6yIPxMSs8Vx0PryqBlXXes
	 thlN/4hSs1Z8493SElAEDWFQNU6gFc/g4+kKyzEamNRVT4mfwi1j4JKL5Dmed6uF2l
	 UdUYJ4RVU/OxA==
Received: from authenticated-user (box.trvn.ru [45.141.101.25])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by box.trvn.ru (Postfix) with ESMTPSA id 23B451B2BD;
	Wed, 26 Feb 2025 19:30:29 +0500 (+05)
From: Nikita Travkin <nikita@trvn.ru>
Date: Wed, 26 Feb 2025 19:29:55 +0500
Subject: [PATCH 1/2] arm64: dts: qcom: qrb5165-rb5-vision-mezzanine: Fix
 broken overlay root
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250226-qcom-nonroot-overlays-v1-1-26c6e7605833@trvn.ru>
References: <20250226-qcom-nonroot-overlays-v1-0-26c6e7605833@trvn.ru>
In-Reply-To: <20250226-qcom-nonroot-overlays-v1-0-26c6e7605833@trvn.ru>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Cc: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, 
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Nikita Travkin <nikita@trvn.ru>
X-Developer-Signature: v=1; a=openpgp-sha256; l=1187; i=nikita@trvn.ru;
 h=from:subject:message-id; bh=1uBLwcqK1D8Ilr2JTnatyS4/HsSqyloEpvfZyxMxfW4=;
 b=owEBbQKS/ZANAwAIAUMc7O4oGb91AcsmYgBnvyWDvByyl7D6So/j0B9xg14KBOLPoxlmH5wg3
 NqbhnFKAyOJAjMEAAEIAB0WIQTAhK9UUj+qg34uxUdDHOzuKBm/dQUCZ78lgwAKCRBDHOzuKBm/
 dZskD/wKMTIdaCKXnES4Zzjb1id+p0R5ZgnuUejw58VbrrZLuJ8ZmV7KVjZmyjkElN1V9X2Q3dM
 JNCT/haX3OUURYyUphG2WkW8yBzNTao54nxFPp9X7hFI/T9asRsQhZeD9Vx5Zs+GdCzgLJRKa3h
 AJ1jDRXnjCc03UQqZ/+LN8zzxYfNN2qPYKO32LK9UxOaywMMPhiF8hv6LfYsHAI/L3MODmNaVtn
 tJSymGs0mjON2uwkjWM1yaVUg9BM6ITXqyknVNo1irhP0jXFH97TfiHbOPN53v3p6io+3sq/VKs
 xjZUsWftUPtscRgTre9NOQDjDuE4AUbhRZ2QZNfFdQ1NPLlx4nZPD91qqwmwKNWWv+ABBECvx/N
 08hqxzxqIxZKCjWIf5zFl72rzJGHOZpOuVcyJjHTpAASbatD4bSssrqgUUGT+z9KHGQuhaA6TxV
 Tp1+LCqVSGIAUtS8KijcEGlS1luU0CWIQMWlWpoJD/R8Vd0nVpb2nz9kgxoQ4dk6NY22m1DonlW
 H2HKGCRxHhPcawuCv0pyPpcPB+bdzqMrAgPXwRsvjnf7QIj8Gj+Lak++86gP52d2zTnnrDgRqbA
 v9j4ltGJDxF6MLBqMVEHrTMg3gaUiYu6wvO18QrSOB78Pvr6hmztkXNwmuoS6/RE1BCil4yCRvg
 lblc0onQbeBjw4A==
X-Developer-Key: i=nikita@trvn.ru; a=openpgp;
 fpr=C084AF54523FAA837E2EC547431CECEE2819BF75

When converting to the overlay format, it was missed that "/" in the
overlay corresponds to the overlay's own root node and not the fragment
targeted to update root of the base dts, which should be "&{/}" instead.
This results in the cma node never actually being applied by libfdt.

Fix the overlay to use correct target node.

Fixes: 231c03c6119d ("arm64: dts: qcom: qrb5165-rb5-vision-mezzanine: Convert mezzanine riser to dtbo")
Signed-off-by: Nikita Travkin <nikita@trvn.ru>
---
 arch/arm64/boot/dts/qcom/qrb5165-rb5-vision-mezzanine.dtso | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/qrb5165-rb5-vision-mezzanine.dtso b/arch/arm64/boot/dts/qcom/qrb5165-rb5-vision-mezzanine.dtso
index ae256c713a36078afdadc67193f381a19ea8e5d3..254df3d518d8cbfb1082511f38e132435b7fdf59 100644
--- a/arch/arm64/boot/dts/qcom/qrb5165-rb5-vision-mezzanine.dtso
+++ b/arch/arm64/boot/dts/qcom/qrb5165-rb5-vision-mezzanine.dtso
@@ -9,7 +9,7 @@
 #include <dt-bindings/clock/qcom,camcc-sm8250.h>
 #include <dt-bindings/gpio/gpio.h>
 
-/ {
+&{/} {
 	reserved-memory {
 		linux,cma {
 			compatible = "shared-dma-pool";

-- 
2.48.1


