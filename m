Return-Path: <linux-arm-msm+bounces-56472-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C663AA6F33
	for <lists+linux-arm-msm@lfdr.de>; Fri,  2 May 2025 12:15:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id C79DA7AD97D
	for <lists+linux-arm-msm@lfdr.de>; Fri,  2 May 2025 10:14:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A609523A563;
	Fri,  2 May 2025 10:15:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="s8lkdEeE"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76A8822D4F9;
	Fri,  2 May 2025 10:15:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746180949; cv=none; b=krCrfFApReanUoz4ESVH+Oy2r5TNxJmc4kiAIaif0UP16lNj8cPwDG6ZztnuPOfKSZi+aHSrW63LJTCv25ySuKDz/QxN/UZhVb1hLpMHYOuf9s0pM1rwdK4Dmf7wa9LvfUqJTdSWJmsTSL1luzouPbxSu7rEihXGNjhlv/tuJmE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746180949; c=relaxed/simple;
	bh=9c73iXDXvgnARot8nAst3Y4sWhj8Zc0sgUgQkOUXnus=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ZRh9oUWFJwikTAL7yeEgT7evaopXo3wLAF/J61Wu0ce21KInM0IYtY5oOPs5bWs4Z5GcuDbl8yp6cITNLv09nwWGdqI8ilLt4NWW4tYJNyVi3bZJIMhdJT0zLkmQNoIqPx9Foyl0J7f2CLeAGpyRvh3KWt9gmUlTld3tXB5Lk1Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=s8lkdEeE; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 1C6C4C4CEF7;
	Fri,  2 May 2025 10:15:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746180949;
	bh=9c73iXDXvgnARot8nAst3Y4sWhj8Zc0sgUgQkOUXnus=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=s8lkdEeEu/5hTjphAH51GVQNYiK8MaA6cmSt5/fj9vxPUCnS6uA6NCoDV12O/9XmT
	 CqQwIw+Xp6p0zWqYm2FnYh9uUmXEa+N6m1uu5TQrHFsiRwPKBRtxL6aQJiMO8Bl1Nv
	 gRuCAhHpqrJu2mtr615M038YQ9oYqwEx5XD5qISpsVvVmOmt0qvqka8XWdjHMITbOx
	 8nHnb6Gn4BTIlwKX4kCqWAhEdh8Ak2uztqmWx0YFmUurIb4hgvpnfbOOYPAI2nhpV0
	 g5st+PDB9mRgq+uJLye+UuVaxZ/0+78YC8lQVmBtlNmHC0YGJ8ojfudN2U3tIAHw8Q
	 +vxFP3TReEx0Q==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0F8F3C3ABB6;
	Fri,  2 May 2025 10:15:49 +0000 (UTC)
From: George Moussalem via B4 Relay <devnull+george.moussalem.outlook.com@kernel.org>
Date: Fri, 02 May 2025 14:15:46 +0400
Subject: [PATCH 4/6] dt-bindings: mfd: qcom,tcsr: Add compatible for
 IPQ5018
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250502-ipq5018-cmn-pll-v1-4-27902c1c4071@outlook.com>
References: <20250502-ipq5018-cmn-pll-v1-0-27902c1c4071@outlook.com>
In-Reply-To: <20250502-ipq5018-cmn-pll-v1-0-27902c1c4071@outlook.com>
To: Bjorn Andersson <andersson@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Luo Jie <quic_luoj@quicinc.com>, 
 Lee Jones <lee@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 George Moussalem <george.moussalem@outlook.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1746180945; l=819;
 i=george.moussalem@outlook.com; s=20250321; h=from:subject:message-id;
 bh=rWOkA/E/Z9CidEDzLfL6fySdOSwBg0HFYVj2bD8wwdw=;
 b=lgtEHtO41HG6bV8PodAOUvv4/8xckPbBymX1w3Wj6XQeY35/cFoP15GLYqTsSna6obsLzbh9X
 3fygYMoK3lWC99OHGLNYSUI2JedeVmSHU3BJzbdJ7L7JO4JMNLe3lAI
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



