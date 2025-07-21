Return-Path: <linux-arm-msm+bounces-65843-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id C7535B0BC84
	for <lists+linux-arm-msm@lfdr.de>; Mon, 21 Jul 2025 08:30:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 0CA151738E3
	for <lists+linux-arm-msm@lfdr.de>; Mon, 21 Jul 2025 06:31:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 58DC227604E;
	Mon, 21 Jul 2025 06:30:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZQTVzw7W"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B1CF2777E0;
	Mon, 21 Jul 2025 06:30:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753079458; cv=none; b=vGp998XgjcexEHgW9JN/cokcweX2nQ7i+N4vFZDJEIFQx1CyQyD6LIC2XLHwwxh7s8O9BejoxqAOvWqrouH9YXjM3r88niLHBOYR1kVPP21z0noFj8t3My4pmE5G8VxjHTNZt3tIH2tm+Qn2FdW3bS8yU+vM4vYy5UVoAl0r9dA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753079458; c=relaxed/simple;
	bh=kO7/+brEXzYw1d+SOh8B88y9q2OEmgyNDx7tjiAzico=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=Ep9rnIzFya5eup313+q8BvRD0yqiNi6UXSPJuX1i1PS5tTfXtePy3nHeISkcLt6dLGGRv1bbtnYqEcrBUbMVw2aOQ4FugGTfInbNcS+AEL4vSmU7vd5G+S8d2tqkOJWGI9GwKASkcnTUovV7vOcsjwosfVohiobVjJx8hjMuTZI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ZQTVzw7W; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id A4E8AC4CEED;
	Mon, 21 Jul 2025 06:30:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1753079457;
	bh=kO7/+brEXzYw1d+SOh8B88y9q2OEmgyNDx7tjiAzico=;
	h=From:Date:Subject:To:Cc:Reply-To:From;
	b=ZQTVzw7W9/m3sON0v1vUs0SBSGZQBZRdfgflcSPd9pbAaTjkbrI4gtElZ8vNpSOYK
	 77onwI99WodzI+1vwtPu5oOn/jLtDFRtY5+RgvnQTSQ54OptcCLUHcRSEX0popzBdh
	 LtzPwZAQAjWz8uZ6wEVQzzZfx++zpG4XS7gp3zGJNyp3BixGDghSl+l+fIHH3mSrmC
	 t+zTCKzuHlT2SUG+d5rh2TurSHgZixcSA6w83GOnqYdgRjAmX8K4YSLnhk7KhbbSb0
	 sw8TWQLpJ6bJ0cdyh06BNLBn7Q88GGklKw+U57qjcl9qczIFLqtuMjXWYdwXC0U82i
	 fOC5icNfb5ZiA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9309CC87FC5;
	Mon, 21 Jul 2025 06:30:57 +0000 (UTC)
From: George Moussalem via B4 Relay <devnull+george.moussalem.outlook.com@kernel.org>
Date: Mon, 21 Jul 2025 10:30:46 +0400
Subject: [PATCH] arm64: dts: qcom: ipq5018: add PRNG node
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250721-ipq5018-prng-v1-1-474310e0575d@outlook.com>
X-B4-Tracking: v=1; b=H4sIAJbefWgC/x3MTQqAIBBA4avIrBP8wbCuEi0sJ5uNmUIE4t2Tl
 t/ivQoFM2GBmVXI+FChK3bIgcF+uhiQk+8GJZQRRmlO6TZCWp5yDFwa3DSOzk/CQk9SxoPef7e
 srX1lllBpXgAAAA==
X-Change-ID: 20250523-ipq5018-prng-15eb3e6ad908
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 George Moussalem <george.moussalem@outlook.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1753079455; l=1074;
 i=george.moussalem@outlook.com; s=20250321; h=from:subject:message-id;
 bh=uB/HCEZYInOL5Lcj4Z1RVwpnu7EOA4IaF8qdmjn0/5w=;
 b=yuX4ZHzn+VlOybcdKhAIbS9y3D/tRAQcQ1GI5MBSUTUQOkScNyTSTFviXhtugb9ZZN6pEhiKd
 CXw1aB+h3Y7AYtJg9dLlHmGRkVpnHGYwSPrtMmsImIFeTpArRGb9g6f
X-Developer-Key: i=george.moussalem@outlook.com; a=ed25519;
 pk=/PuRTSI9iYiHwcc6Nrde8qF4ZDhJBlUgpHdhsIjnqIk=
X-Endpoint-Received: by B4 Relay for george.moussalem@outlook.com/20250321
 with auth_id=364
X-Original-From: George Moussalem <george.moussalem@outlook.com>
Reply-To: george.moussalem@outlook.com

From: George Moussalem <george.moussalem@outlook.com>

PRNG inside of IPQ5018 is already supported, so let's add the node for it.

Signed-off-by: George Moussalem <george.moussalem@outlook.com>
---
 arch/arm64/boot/dts/qcom/ipq5018.dtsi | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/ipq5018.dtsi b/arch/arm64/boot/dts/qcom/ipq5018.dtsi
index 9ce73682e4ae7cde90f151dfcd41a5201ced2aa6..9efa831e7d4e64326dc9bbdbab3541c486ad3b9c 100644
--- a/arch/arm64/boot/dts/qcom/ipq5018.dtsi
+++ b/arch/arm64/boot/dts/qcom/ipq5018.dtsi
@@ -301,6 +301,14 @@ tsens_s4_p2: s4-p2@254 {
 			};
 		};
 
+		prng: rng@e3000 {
+			compatible = "qcom,prng-ee";
+			reg = <0x000e3000 0x1000>;
+			clocks = <&gcc GCC_PRNG_AHB_CLK>;
+			clock-names = "core";
+			status = "disabled";
+		};
+
 		tsens: thermal-sensor@4a9000 {
 			compatible = "qcom,ipq5018-tsens", "qcom,tsens-v1";
 			reg = <0x004a9000 0x1000>,

---
base-commit: 1b0324d3b8375fcfaf80789092347a52529059eb
change-id: 20250523-ipq5018-prng-15eb3e6ad908

Best regards,
-- 
George Moussalem <george.moussalem@outlook.com>



