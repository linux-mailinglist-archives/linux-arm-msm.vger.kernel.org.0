Return-Path: <linux-arm-msm+bounces-57611-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 064E8AB3ACB
	for <lists+linux-arm-msm@lfdr.de>; Mon, 12 May 2025 16:37:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 080AF19E2BE8
	for <lists+linux-arm-msm@lfdr.de>; Mon, 12 May 2025 14:37:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3C0AD22A1CD;
	Mon, 12 May 2025 14:37:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="svwjgVzr"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0CEF7229B28;
	Mon, 12 May 2025 14:37:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747060627; cv=none; b=U+hUoWqLSwD/OaLEXMTDOwZCUKXDOr6N57HBPXg/HrQwagyREmnmFUNqdzz8xnhKMybmrRm5k6cAXQN7FLUkNJtzVOApCZUsMqaS2ATT33QviZv+ofEjODzm5fsQbt/KYAfEBKET6xX5UQTxHzJ9s9e7tkD7ssXxHIxt7S8XWic=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747060627; c=relaxed/simple;
	bh=9c73iXDXvgnARot8nAst3Y4sWhj8Zc0sgUgQkOUXnus=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=lR7PPEN4W148I4/iiWGMObn1oJqAozKKFuH2oVB9dJJqPEsrL1ywE1IYjfW2DIEplrA/kBi1o1hQWG0Y38SekYujvEsQbSsJJ4ZCSaWZ8e3f4qLhOoV7IeLY3IT2aDjuZxG4ToRdrS5SJR/bq5zl1lWB5Q1X80hg+NF0hD8D60A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=svwjgVzr; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 884C3C4CEED;
	Mon, 12 May 2025 14:37:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747060626;
	bh=9c73iXDXvgnARot8nAst3Y4sWhj8Zc0sgUgQkOUXnus=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=svwjgVzrcRFlGzuwSkn7LXEcGAgdarmp8Z2M0KR3z/5NrxHDg7M2Dp9+tVEXUaGkd
	 R4XyhfdO5KjpHwMpso/HoL5emPQ/lEW65i+GGnkxpLH9XQzBEiWEePDy1JhCht92fc
	 DQDFKNHWSa6DLgqn2oHk7bRg/aqtuwIa+uaqTwYYL0ix4ysT7ygjFi0v7D4QSjCrWW
	 jtvMcnZuT1d2yZuO7wm2aj3OCF+ukT9G2oXRK4y60ZBTpRXR39L33FIwCmafL5KOV4
	 LItTt2KhfuOe9F3hAxP7XjLTpacPRDZRhO6GZ8ogIcSRFRxigfm2v2f2/Q4x4qkYoz
	 l8curXkP1W5Aw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 74076C3ABD4;
	Mon, 12 May 2025 14:37:06 +0000 (UTC)
From: George Moussalem via B4 Relay <devnull+george.moussalem.outlook.com@kernel.org>
Date: Mon, 12 May 2025 18:36:46 +0400
Subject: [PATCH 1/2] dt-bindings: mfd: qcom,tcsr: Add compatible for
 ipq5018
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250512-ipq5018-syscon-v1-1-eb1ad2414c3c@outlook.com>
References: <20250512-ipq5018-syscon-v1-0-eb1ad2414c3c@outlook.com>
In-Reply-To: <20250512-ipq5018-syscon-v1-0-eb1ad2414c3c@outlook.com>
To: Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 George Moussalem <george.moussalem@outlook.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1747060624; l=819;
 i=george.moussalem@outlook.com; s=20250321; h=from:subject:message-id;
 bh=rWOkA/E/Z9CidEDzLfL6fySdOSwBg0HFYVj2bD8wwdw=;
 b=LSN1rRYrwfvEn4O7StFZU1xBujSdtqhZxWawpLyOp9hgyF3qqVNvORk4/ukQx7HAnRPJe5GZT
 ezqM3qrCST2COMQfNk/JlEt+NO+seQruVnmAuXvci/CqL+rcGnVo3hO
X-Developer-Key: i=george.moussalem@outlook.com; a=ed25519;
 pk=/PuRTSI9iYiHwcc6Nrde8qF4ZDhJBlUgpHdhsIjnqIk=
X-Endpoint-Received: by B4 Relay for george.moussalem@outlook.com/20250321
 with auth_id=364
X-Original-From: George Moussalem <george.moussalem@outlook.com>
Reply-To: george.moussalem@outlook.com

From: George Moussalem <george.moussalem@outlook.com>

Document the qcom,tcsr-ipq5018 compatible.

Signed-off-by: George Moussalem <george.moussalem@outlook.com>
---
 Documentation/devicetree/bindings/mfd/qcom,tcsr.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/mfd/qcom,tcsr.yaml b/Documentation/devicetree/bindings/mfd/qcom,tcsr.yaml
index 7e7225aadae3285f59ec303294cf1515772a629b..14ae3f00ef7e00e607bba93f49f03bb244253b0e 100644
--- a/Documentation/devicetree/bindings/mfd/qcom,tcsr.yaml
+++ b/Documentation/devicetree/bindings/mfd/qcom,tcsr.yaml
@@ -41,6 +41,7 @@ properties:
           - qcom,sm8450-tcsr
           - qcom,tcsr-apq8064
           - qcom,tcsr-apq8084
+          - qcom,tcsr-ipq5018
           - qcom,tcsr-ipq5332
           - qcom,tcsr-ipq5424
           - qcom,tcsr-ipq6018

-- 
2.49.0



