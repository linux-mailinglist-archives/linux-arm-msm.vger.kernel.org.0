Return-Path: <linux-arm-msm+bounces-84464-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 28158CA79D5
	for <lists+linux-arm-msm@lfdr.de>; Fri, 05 Dec 2025 13:48:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 71C5F302DE0F
	for <lists+linux-arm-msm@lfdr.de>; Fri,  5 Dec 2025 12:48:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5B61F3314CD;
	Fri,  5 Dec 2025 12:48:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="EaJeuGZa"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18CFD313294;
	Fri,  5 Dec 2025 12:47:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764938880; cv=none; b=WR0YuM1tf4x7wJ2QLQ40oV4Gztq+3ZshzsAEMU65i/frr7qTHBFRsmc78TeqOAtompYpUEZ53A5eT6TtHf25eVwlFo0EYlFixaq/lNFDWR7/XoY6KX+lyjvBRzwuRtKeKyUAIPJ7Uk2I1zee1zldo8WQFZyvN7Je+5UQfcgJcd4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764938880; c=relaxed/simple;
	bh=g5nsJt8V3Rhk8lC7cU0UF7gcIKnw0CCckqxLprED9NM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=pYmHYeBICwpiZy/3iTcGZ2FBPWQCW9b4PLdbm1mQHJ7T0tyOq75PK1shZiFa/fm3TDs97oMxWK34q5igz8mG9rW9UnI2u4G08zcGm89QZSOL4qRou3Msf5OTEYpXi4QcCt/m4XoUdrpWx9AmBbQu1LkZVdM6eT9MPch2ZN0JrRY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=EaJeuGZa; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ECEC1C113D0;
	Fri,  5 Dec 2025 12:47:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1764938877;
	bh=g5nsJt8V3Rhk8lC7cU0UF7gcIKnw0CCckqxLprED9NM=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=EaJeuGZaIUEejETX7dTcrX9MLxI87XvYYegQFdudwlSnMBbC+ONYK0l0L6BgytUmH
	 CzMUTxyJdGZcsnIqa9C/ng8n2TEonzJ7FxHNSzVKDGPaG6rrPKIF+eouyppMmEt5iI
	 sJCWl51m3/u4ebFfs1k49GAGEpZqgYoZMNLD5z3/sDKDopfTSIP2w5L4JaXAw1/1Di
	 7pVFkbHY2QSJ/ngCh/DiKaAkl9ngYmCwuXEAGWZ0KI/JKK1gGkuQnvqyNs9q9MlV0m
	 8KokFbrqCzT9xP48nmCeYaxLnnhppj60DVicI2JtDc9NnI09FoECps0XmkDCDuVviv
	 19zY7T+YIvS3w==
From: Konrad Dybcio <konradybcio@kernel.org>
Date: Fri, 05 Dec 2025 13:47:24 +0100
Subject: [PATCH 05/10] arm64: dts: qcom: sc8280xp-x13s: Fix BT RFA supply
 name
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251205-topic-wcn6855_pmu_dtbdings-v1-5-165611f687c8@oss.qualcomm.com>
References: <20251205-topic-wcn6855_pmu_dtbdings-v1-0-165611f687c8@oss.qualcomm.com>
In-Reply-To: <20251205-topic-wcn6855_pmu_dtbdings-v1-0-165611f687c8@oss.qualcomm.com>
To: Jeff Johnson <jeff.johnson@oss.qualcomm.com>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, Marcel Holtmann <marcel@holtmann.org>, 
 Luiz Augusto von Dentz <luiz.dentz@gmail.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Balakrishna Godavarthi <quic_bgodavar@quicinc.com>, 
 Rocky Liao <quic_rjliao@quicinc.com>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>
Cc: Luiz Augusto von Dentz <luiz.von.dentz@intel.com>, 
 linux-arm-msm@vger.kernel.org, linux-bluetooth@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1764938851; l=850;
 i=konrad.dybcio@oss.qualcomm.com; s=20230215; h=from:subject:message-id;
 bh=GlPR5/O3251wq0EgqGmaDqHI1jFthnyndmjFGVnrR2M=;
 b=P7FqYRh8BDfP4YNuDmowDLYQFipIXPvEF4S11KHxGjz+pjpSM7oRZa0o6EvXIEGUzsX1DOaze
 7l1w11HgNkUBj/j6D12KRRsfr7We67qCajzmMXt45YuzACaJV/e1ZnQ
X-Developer-Key: i=konrad.dybcio@oss.qualcomm.com; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=

From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Fix up the supply name to align with bindings.

Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/sc8280xp-lenovo-thinkpad-x13s.dts | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/sc8280xp-lenovo-thinkpad-x13s.dts b/arch/arm64/boot/dts/qcom/sc8280xp-lenovo-thinkpad-x13s.dts
index d84ca010ab9d..abd9c5a67b9f 100644
--- a/arch/arm64/boot/dts/qcom/sc8280xp-lenovo-thinkpad-x13s.dts
+++ b/arch/arm64/boot/dts/qcom/sc8280xp-lenovo-thinkpad-x13s.dts
@@ -1331,7 +1331,7 @@ bluetooth {
 		vddbtcmx-supply = <&vreg_pmu_btcmx_0p8>;
 		vddrfa0p8-supply = <&vreg_pmu_rfa_0p8>;
 		vddrfa1p2-supply = <&vreg_pmu_rfa_1p2>;
-		vddrfa1p8-supply = <&vreg_pmu_rfa_1p7>;
+		vddrfa1p7-supply = <&vreg_pmu_rfa_1p7>;
 
 		max-speed = <3200000>;
 	};

-- 
2.52.0


