Return-Path: <linux-arm-msm+bounces-89633-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B70FD3A751
	for <lists+linux-arm-msm@lfdr.de>; Mon, 19 Jan 2026 12:47:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 9A936309C5D2
	for <lists+linux-arm-msm@lfdr.de>; Mon, 19 Jan 2026 11:43:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5BCF2314B7F;
	Mon, 19 Jan 2026 11:43:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="VuxnBtef"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33B3A314A6D;
	Mon, 19 Jan 2026 11:43:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768822995; cv=none; b=BZ9A0Dw/76PDvgZx7UhA405rl1WVo9PR9M/DBoC0hDKofSsP2Y+r0kqHhevl17pODuykqXbBXNzHYo8bzeZhNWyridKlnd3fyX//xkWNNeBzW7utDdUC7r4F/LwHbxYt9TKmcJkCxG1EbV4RqQk8cj3AZnD43HVoNdqm1iPs9u4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768822995; c=relaxed/simple;
	bh=kQnMEwaG5DUNa6ELSKdaUXrdBgT1+bgfIgmn+W/pJbA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=VsiE1xurOKUadJLbjtLRyj9ffvIimuztpeoYMLiE4h6XQ3+fRhLGbWs7cWX3oGlJQXF9rN5+JvVkMB2jNSZ8lcSat1FHFcTCRu+nsFVg7zhnAtFhD8sEwI6brG2F/5NCsfsaEg4/jGmExyOE9L9qSMP0mpUccuOdL8LK5MiyjGI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=VuxnBtef; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 77CB0C116C6;
	Mon, 19 Jan 2026 11:43:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768822994;
	bh=kQnMEwaG5DUNa6ELSKdaUXrdBgT1+bgfIgmn+W/pJbA=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=VuxnBtefMrUCW8wV2B+Icr2GU/oMrXDwIcy6hXXltuwcHJEuFft+3ukjFkvEN/u2w
	 UXdN/mp44j9YWucDQF+h2NKuMWS+Iq9vHjDAS6eiMsmsd0uf5qFp4i78tBZP2WCHtV
	 L8GGGRjJ6kMpxASvm4WC01xCyF31RIPiF8ro0KbA+dLyRVwgFJGVKRMphIq5nIU0XB
	 qjz7xf+TnpPScoDBzLvfiN1ZY97fPVL5oB+uJ5rlGc0oiYuK+frMwnq0ePofocDKSn
	 8vC6A0+CC7QNwjAMqJgf2wd3T1kUh6BUV+VW1m2wp+0XZYHwoP4B3y12KRC1hkVj5d
	 cyUQV3R4x11RQ==
From: Konrad Dybcio <konradybcio@kernel.org>
Date: Mon, 19 Jan 2026 12:42:30 +0100
Subject: [PATCH v2 08/10] arm64: dts: qcom: x1-omnibook-x14: Fix BT RFA
 supply name
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260119-topic-wcn6855_pmu_dtbdings-v2-8-6d1c75608bbb@oss.qualcomm.com>
References: <20260119-topic-wcn6855_pmu_dtbdings-v2-0-6d1c75608bbb@oss.qualcomm.com>
In-Reply-To: <20260119-topic-wcn6855_pmu_dtbdings-v2-0-6d1c75608bbb@oss.qualcomm.com>
To: Jeff Johnson <jeff.johnson@oss.qualcomm.com>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, Marcel Holtmann <marcel@holtmann.org>, 
 Luiz Augusto von Dentz <luiz.dentz@gmail.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Balakrishna Godavarthi <quic_bgodavar@quicinc.com>, 
 Rocky Liao <quic_rjliao@quicinc.com>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, 
 Bartosz Golaszewski <brgl@kernel.org>
Cc: Luiz Augusto von Dentz <luiz.von.dentz@intel.com>, 
 linux-arm-msm@vger.kernel.org, linux-bluetooth@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, 
 Abel Vesa <abel.vesa@oss.qualcomm.com>, 
 Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1768822946; l=904;
 i=konrad.dybcio@oss.qualcomm.com; s=20230215; h=from:subject:message-id;
 bh=5N5rNoYe4y7JRpJd4RAKLjE4Bj/v2wKotR8f0o6Q/7Q=;
 b=pngtZ9aDrnPOHhsPcrRs0MzNIwCbGIbfNp/KZ9gMQsX7CQIPHhjRfuhC9oUjWIyAwKlWccuOo
 sfoxvAlCWujCZ9jlcVDDIqHhSLe3MC+E4MkeDylBaTlN28wgPwU7tfs
X-Developer-Key: i=konrad.dybcio@oss.qualcomm.com; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=

From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Fix up the supply name to align with bindings.

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/x1-hp-omnibook-x14.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/x1-hp-omnibook-x14.dtsi b/arch/arm64/boot/dts/qcom/x1-hp-omnibook-x14.dtsi
index a4075434162a..30f18c8cbcbc 100644
--- a/arch/arm64/boot/dts/qcom/x1-hp-omnibook-x14.dtsi
+++ b/arch/arm64/boot/dts/qcom/x1-hp-omnibook-x14.dtsi
@@ -1450,7 +1450,7 @@ bluetooth {
 		vddbtcmx-supply = <&vreg_pmu_btcmx_0p8>;
 		vddrfa0p8-supply = <&vreg_pmu_rfa_0p8>;
 		vddrfa1p2-supply = <&vreg_pmu_rfa_1p2>;
-		vddrfa1p8-supply = <&vreg_pmu_rfa_1p7>;
+		vddrfa1p7-supply = <&vreg_pmu_rfa_1p7>;
 	};
 };
 

-- 
2.52.0


