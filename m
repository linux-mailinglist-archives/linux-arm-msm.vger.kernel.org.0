Return-Path: <linux-arm-msm+bounces-50693-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 663E9A579C1
	for <lists+linux-arm-msm@lfdr.de>; Sat,  8 Mar 2025 11:28:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5ABEA3B3A56
	for <lists+linux-arm-msm@lfdr.de>; Sat,  8 Mar 2025 10:27:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 114F21B043F;
	Sat,  8 Mar 2025 10:27:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="SlU0SfWP"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D425AC133;
	Sat,  8 Mar 2025 10:27:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741429676; cv=none; b=QN99m35liEbV3fm/roSiAosQlwBWLJysSZbA1ekVXJUn0rg51l0x8R1GydQHN4+RGdEodO6XH+UeKNlSjVCh+xHswVqhWpmYCRmhp37rrD4gbN9X/bHDVkE4LPpTAdSWcIs8La+3Ys47JmX956RXHfgd5OAOkMS2/7agOpPSIoM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741429676; c=relaxed/simple;
	bh=PITZtdJg2uIAhqm1Sgq0C/a7piJ6sd/4BSSAg4EQ/HQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=oLVqkNQ5MX4Gxl3XkPKXO/fU4UyDO4s/U/04j2exNKXX2mHlTiLVEQDNrDcYL9DNR39SXrDMRFa9yU5+bpvPmfk9QMKIsS4BUGBkSrju5heMtIUNkoaIrvvgsHfuTYN0zB46BpPxS0stp3H0HJ+Ik06GcHzUI+S79ieaHX3kwcI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=SlU0SfWP; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 37B44C4CEE0;
	Sat,  8 Mar 2025 10:27:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741429675;
	bh=PITZtdJg2uIAhqm1Sgq0C/a7piJ6sd/4BSSAg4EQ/HQ=;
	h=From:Date:Subject:To:Cc:Reply-To:From;
	b=SlU0SfWPjSx1xK/lUhKeYXlODnhynQsbLzzBZ7W+7g9W6VsQ9ccdLMwgro86p8sil
	 4bpsdQ0KpeZg0TvxjDDXEzj/JTgL/0tStGgTyrBmo+M6qmwSy7BYlZNYSicQEikMzg
	 Mp/P7lN6HqrFyEYh71q/GCkctLoy+MBkk+ujHysXoyqC6cZFNd+OCIXZnUvk0rn0Xg
	 57mOsw2SxW4IaCxAbTVzz7nOhfdk8Hvuh6i3OjlQkrFOnYk5osijwb1mjjFS6EbGm+
	 LWKmq+KBlukTt7lZabJqeDihNJXZRGXxYP0k5H2gd9gGE0JtmQG7Ut4zI5CmJe/Whe
	 J0kFkU4ecULVA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1973EC282EC;
	Sat,  8 Mar 2025 10:27:55 +0000 (UTC)
From: Xilin Wu via B4 Relay <devnull+wuxilin123.gmail.com@kernel.org>
Date: Sat, 08 Mar 2025 18:27:51 +0800
Subject: [PATCH] arm64: dts: qcom: sm8250: Fix CPU7 opp table
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250308-fix-sm8250-cpufreq-v1-1-8a0226721399@gmail.com>
X-B4-Tracking: v=1; b=H4sIAKYbzGcC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDI1MDYwML3bTMCt3iXAsgTze5oDStKLVQN8XS1NLEJMksxTDRWAmosaAoFag
 KbGh0bG0tAADDTpNkAAAA
X-Change-ID: 20250308-fix-sm8250-cpufreq-d95944b6d1a3
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
 Thara Gopinath <thara.gopinath@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Xilin Wu <wuxilin123@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1741429673; l=1086;
 i=wuxilin123@gmail.com; s=20240424; h=from:subject:message-id;
 bh=D9z9X3e5J8ftwp1wdYD55jK/Ci2H15jjh248DelqCdQ=;
 b=n/PHBwcxilz316ny13BQE1y4sYxBxB+E1XcDU8ZpXttkORZqR1x5/1iFqaQrQGz9NKE1uu/6t
 JxzlZ3NhRU/CLeR1T8p+Sb2zWFU4raSRtCwL0CSPOmL+K9DksCzJMA/
X-Developer-Key: i=wuxilin123@gmail.com; a=ed25519;
 pk=vPnxeJnlD/PfEbyQPZzaay5ezxI/lMrke7qXy31lSM8=
X-Endpoint-Received: by B4 Relay for wuxilin123@gmail.com/20240424 with
 auth_id=157
X-Original-From: Xilin Wu <wuxilin123@gmail.com>
Reply-To: wuxilin123@gmail.com

From: Xilin Wu <wuxilin123@gmail.com>

There is a typo in cpu7_opp9. Fix it to get rid of the following
errors.

[    0.198043] cpu cpu7: Voltage update failed freq=1747200
[    0.198052] cpu cpu7: failed to update OPP for freq=1747200

Fixes: 8e0e8016cb79 ("arm64: dts: qcom: sm8250: Add CPU opp tables")
Signed-off-by: Xilin Wu <wuxilin123@gmail.com>
---
 arch/arm64/boot/dts/qcom/sm8250.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/sm8250.dtsi b/arch/arm64/boot/dts/qcom/sm8250.dtsi
index c2937b4d9f180296733b6d7a7a16a088f1f96b76..68613ea7146c8882150f1b81dbc0f3384d3380ba 100644
--- a/arch/arm64/boot/dts/qcom/sm8250.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8250.dtsi
@@ -606,7 +606,7 @@ cpu7_opp8: opp-1632000000 {
 		};
 
 		cpu7_opp9: opp-1747200000 {
-			opp-hz = /bits/ 64 <1708800000>;
+			opp-hz = /bits/ 64 <1747200000>;
 			opp-peak-kBps = <5412000 42393600>;
 		};
 

---
base-commit: 0a2f889128969dab41861b6e40111aa03dc57014
change-id: 20250308-fix-sm8250-cpufreq-d95944b6d1a3

Best regards,
-- 
Xilin Wu <wuxilin123@gmail.com>



