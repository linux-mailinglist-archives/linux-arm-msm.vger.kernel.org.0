Return-Path: <linux-arm-msm+bounces-84466-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id D2A96CA79FD
	for <lists+linux-arm-msm@lfdr.de>; Fri, 05 Dec 2025 13:49:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 7043830305C0
	for <lists+linux-arm-msm@lfdr.de>; Fri,  5 Dec 2025 12:49:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 04870280A5A;
	Fri,  5 Dec 2025 12:48:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="oxQGjLfk"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0CE333290B;
	Fri,  5 Dec 2025 12:48:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764938887; cv=none; b=aySvJQw0BUH7Iws3ZxBwaAhdh9pg89mtTbiq8BnViK74gkSaiXhD8kEGeA/dD6LaGkGaKkSv5CMNycHpHAGW0Squ27DLVEcPSZgw1mk9/6ytNtnjKIYqXUudvteWau0T7IAZxk25sbXljXuNJuL6GJAhqFCJeeiRugq5iSCH2hQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764938887; c=relaxed/simple;
	bh=k8i82crIjcGt1VTyJbdbIip9UIImq1rqifcf8IdBSws=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=CZkO/TSgfZcfqDJd2Mr2d9l0RK4doZbJd0rbIzAowjWex6GYnDgfkjITR6QLWZux88FfZi2/fPnEEgRP81LlMlldOisBhIOlvS0oWcif7qj5F7lNXMMiFk4yLoN15LQjk6uMkWO0T178//fCj6n9FC7tOJwo8YvBj3Uu3Rdrrv4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=oxQGjLfk; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BD1F1C113D0;
	Fri,  5 Dec 2025 12:48:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1764938886;
	bh=k8i82crIjcGt1VTyJbdbIip9UIImq1rqifcf8IdBSws=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=oxQGjLfk05IKJD3tGny8E4rEJGQpWbNuIpQwMyAXe6uNrjfAEBayih0xo0iOvgIlY
	 SWxqEDWjow5lShBM9uAlxof5PS+atVYAQxho9JXaHSgudTAhrTDHFbDSM2tTErsWgX
	 HyRswQQT5Wd5YL6Kr310gdHrvka7yk7LjjAl2Utqfj3lSyX550SH3Q1Pr3k6hFWYBr
	 iGkd3AuZAxrbMKhZI9XTZ+2N02gn57G1+vnJK/jTFKfeyXADDM2RI3CouQdbEnERxZ
	 HdSGeOhTe+TKV3dpFHmYYDyC+Y8s+yX32Eyo3lguAzXXPkZKAkLRmkDKlhBW5fDq58
	 UxTGyQNRE8zqg==
From: Konrad Dybcio <konradybcio@kernel.org>
Date: Fri, 05 Dec 2025 13:47:26 +0100
Subject: [PATCH 07/10] arm64: dts: qcom: sm8450-hdk: Fix BT RFA supply name
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251205-topic-wcn6855_pmu_dtbdings-v1-7-165611f687c8@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1764938851; l=733;
 i=konrad.dybcio@oss.qualcomm.com; s=20230215; h=from:subject:message-id;
 bh=rf9IZ17Xd6aBYUEKabpqSs9fZGRI3/3qXOXcrBIDgGs=;
 b=6vOWY3e/FhlZnsPzdeLC0MSlq8P+mc4I7TjaR27v6XY60gPkYyiD9ErnwpIAUF80rwkd07oq/
 bE9wEbn/Ok6Cw3lDBXDYW6MM7iOjsPwph3NaKzCujt4HZGqCFdmTzb6
X-Developer-Key: i=konrad.dybcio@oss.qualcomm.com; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=

From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Fix up the supply name to align with bindings.

Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/sm8450-hdk.dts | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/sm8450-hdk.dts b/arch/arm64/boot/dts/qcom/sm8450-hdk.dts
index 268ae0cd642a..b37998cd9a2c 100644
--- a/arch/arm64/boot/dts/qcom/sm8450-hdk.dts
+++ b/arch/arm64/boot/dts/qcom/sm8450-hdk.dts
@@ -1172,7 +1172,7 @@ bluetooth {
 		vddbtcmx-supply = <&vreg_pmu_btcmx_0p8>;
 		vddrfa0p8-supply = <&vreg_pmu_rfa_0p8>;
 		vddrfa1p2-supply = <&vreg_pmu_rfa_1p2>;
-		vddrfa1p8-supply = <&vreg_pmu_rfa_1p7>;
+		vddrfa1p7-supply = <&vreg_pmu_rfa_1p7>;
 	};
 };
 

-- 
2.52.0


