Return-Path: <linux-arm-msm+bounces-31449-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id AB1AE974AF3
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Sep 2024 09:06:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 058DDB217AD
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Sep 2024 07:06:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 317F81304B0;
	Wed, 11 Sep 2024 07:06:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="tmBsYPvF"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1BEF26AF3;
	Wed, 11 Sep 2024 07:06:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726038404; cv=none; b=sL7weaAEvQAwlH88M52P1siOfsIkkdAEoDbosJUKKg85qmwXGwzHz5HinffGhhJWlETrdXrxtQbbCPRIy6rdygCc3BQMLCjv9QzqC6AuHTGV6ZoQk6xqaCRid2XL+HIRYuMlTq+yWt0PsEBLMcWq+Dh5J/BGS1GU6ZTFH3XVXB8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726038404; c=relaxed/simple;
	bh=my/oIh9R4rR+qWCXChouSd5jA+dynaf89UjKaHVenE4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=jVDJN/ntdn/qtXAiUbNTIH/zOi9FAq+cTuPbGY564iFJPJyLxSUGtfnq8kl9Bfcmj6pTh0Eno/0b61UxK6tkVe6WvicvMLoDWey0/QvcEeJoPNPKuHbJKkha/Q1h/22INLBBm66cPcyr7xj2TvaoO6s0zm4T76LKSAx4p+pg1D0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=tmBsYPvF; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 55664C4CECD;
	Wed, 11 Sep 2024 07:06:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1726038403;
	bh=my/oIh9R4rR+qWCXChouSd5jA+dynaf89UjKaHVenE4=;
	h=From:Date:Subject:To:Cc:Reply-To:From;
	b=tmBsYPvFA+PPJ75GStUAGTnGUEOCtxUNNcR7gZcrzZZuBuOHAu8rwREssrVwVgdXT
	 gEI4tO5+WyHyuS68pYD73Gb3yeEM2k5aFdpMgEo4oUHNUVx+BczCxLXj4PUf80ccRZ
	 Pee57tr864o868ttXYzgmGJC2s0MacaZBJ0bGd5VLxfmzOjwdiKs9HY/xq6qUXo1Fd
	 yc6hkl7u95ioNf0OVwc56RpTh7q1aOrT4lgdMsCgGjv0uKlN+2guU1XC+wkvSfgiUt
	 q3MvegfPapXz90D/dU4LGuZfj2G4ZVQH5LqcZtUHoDRuBWZuUtBl5k3kjKhr6Z0dlS
	 xUQ3pOuaH++dg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4B28CEDE998;
	Wed, 11 Sep 2024 07:06:43 +0000 (UTC)
From: Jingyi Wang via B4 Relay <devnull+quic_jingyw.quicinc.com@kernel.org>
Date: Wed, 11 Sep 2024 15:06:36 +0800
Subject: [PATCH v2] dt-bindings: ufs: qcom: Document the QCS8300 UFS
 Controller
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240911-qcs8300_ufs_binding-v2-1-68bb66d48730@quicinc.com>
X-B4-Tracking: v=1; b=H4sIAHxB4WYC/z2NWw6CMBQFt0LutzW3UEH8ch+GkNIH3ERbaYFoC
 Hu3EuPnTHLmrBBNIBPhkq0QzEKRvEuQHzJQg3S9YaQTQ465wJpzNqp4LhDb2ca2I6fJ9ayrCls
 Kw8v6JCAtn8FYeu3VW5N4oDj58N5PFv61vx6Kf48cTSTvrZ4isYUzZBqNrKXVCrG6jjMpcuqo/
 AOabds+JBLRLrkAAAA=
To: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>, Avri Altman <avri.altman@wdc.com>, 
 Bart Van Assche <bvanassche@acm.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
 Andy Gross <agross@kernel.org>
Cc: quic_tengfan@quicinc.com, linux-arm-msm@vger.kernel.org, 
 linux-scsi@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Xin Liu <quic_liuxin@quicinc.com>, 
 Jingyi Wang <quic_jingyw@quicinc.com>
X-Mailer: b4 0.15-dev-99b12
X-Developer-Signature: v=1; a=ed25519-sha256; t=1726038401; l=1428;
 i=quic_jingyw@quicinc.com; s=20240910; h=from:subject:message-id;
 bh=yZxiS3+OUN2g+UOsDxSlDTpZu7grXBO6hd13xebV2Vc=;
 b=tEpNIxFM4Fihx7NycxEykZz+/y/nbEG4sG+ePY1hbyHCUvvgUSjkOcaoLv8qb7gFudEn9aotG
 f6uP3PUBvpYDRwtjWNJvw2nO0FbmbYFrQoYyvwUMKH7MaBuOJnXN4hi
X-Developer-Key: i=quic_jingyw@quicinc.com; a=ed25519;
 pk=ZRP1KgWMhlXXWlSYLoO7TSfwKgt6ke8hw5xWcSY+wLQ=
X-Endpoint-Received: by B4 Relay for quic_jingyw@quicinc.com/20240910 with
 auth_id=207
X-Original-From: Jingyi Wang <quic_jingyw@quicinc.com>
Reply-To: quic_jingyw@quicinc.com

From: Xin Liu <quic_liuxin@quicinc.com>

Document the Universal Flash Storage(UFS) Controller on the Qualcomm
QCS8300 Platform.

Signed-off-by: Xin Liu <quic_liuxin@quicinc.com>
Signed-off-by: Jingyi Wang <quic_jingyw@quicinc.com>
---
Changes in v2:
- decoupled from the original series.
- Link to v1: https://lore.kernel.org/r/20240904-qcs8300_initial_dtsi-v1-0-d0ea9afdc007@quicinc.com
---
 Documentation/devicetree/bindings/ufs/qcom,ufs.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/ufs/qcom,ufs.yaml b/Documentation/devicetree/bindings/ufs/qcom,ufs.yaml
index 25a5edeea164..cde334e3206b 100644
--- a/Documentation/devicetree/bindings/ufs/qcom,ufs.yaml
+++ b/Documentation/devicetree/bindings/ufs/qcom,ufs.yaml
@@ -26,6 +26,7 @@ properties:
           - qcom,msm8994-ufshc
           - qcom,msm8996-ufshc
           - qcom,msm8998-ufshc
+          - qcom,qcs8300-ufshc
           - qcom,sa8775p-ufshc
           - qcom,sc7180-ufshc
           - qcom,sc7280-ufshc
@@ -146,6 +147,7 @@ allOf:
           contains:
             enum:
               - qcom,msm8998-ufshc
+              - qcom,qcs8300-ufshc
               - qcom,sa8775p-ufshc
               - qcom,sc7280-ufshc
               - qcom,sc8180x-ufshc

---
base-commit: 100cc857359b5d731407d1038f7e76cd0e871d94
change-id: 20240911-qcs8300_ufs_binding-b73f64e16954

Best regards,
-- 
Jingyi Wang <quic_jingyw@quicinc.com>



