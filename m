Return-Path: <linux-arm-msm+bounces-61910-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 636C2AE2300
	for <lists+linux-arm-msm@lfdr.de>; Fri, 20 Jun 2025 21:51:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 062B04A5118
	for <lists+linux-arm-msm@lfdr.de>; Fri, 20 Jun 2025 19:51:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6ADDC22CBC6;
	Fri, 20 Jun 2025 19:51:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="MPx58UIZ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39908221FBF;
	Fri, 20 Jun 2025 19:51:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750449091; cv=none; b=NUcldZd4bvBYv91T1R2xa04nGj021lbnSe5rkQK3bBubNR1ifTsBOAaBZeOyx47Pcrc25TF83PKyfLame5HMy6KF2awqTX5u9mEsNRo/jSZcl8VwVqf1S1r7Zi1kfsOgRfTWUGRKrBKDIqoke3gwEvFO0V9f0wU/Lthse7x5d1Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750449091; c=relaxed/simple;
	bh=LUlA/DiEIN/Tu/zhjXQCHb0b8RxKqKzkaIf2xrKvops=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=CP6Lcnp8NBXe9VTBq0YOGoX+jMeJfewEmCLJG9QDzWcy9f8JB1zgUqpwBNLrGb+PpTaIZvS+5q2W5wqvikxTdxSeNaTZGpS7UIpNYRMYulvMPzVUz0wTqMv81ONbCMGYtnbhVsvJTvmWFGNGRt26Tduw3ODFJ2S1nzQU1yNXFLk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=MPx58UIZ; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id CE082C4CEED;
	Fri, 20 Jun 2025 19:51:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750449090;
	bh=LUlA/DiEIN/Tu/zhjXQCHb0b8RxKqKzkaIf2xrKvops=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=MPx58UIZ9znJJcrjkqXB6j2l78exE80TSzSr4M/xH+p394bPAkHC6Fa9EkJ6KprLJ
	 5Udogq8yhTq8Z+Z5k4REJjrNA6PtJ+BR1QbXpIax1x17XJaFiimh+KvzPpdQX7ww6m
	 8hiR70jXUwDItzXQbIcCuS39rbt8KSU/xCKPe+8yO36rAv7L85IGaymWZXoL1tttBg
	 Ui1/2XXF36Z+Jf49tO7Ph87iVzpcYKTTfsuGqwpoZtkotEv8SCacePTh1w3CweNQIT
	 fSSbZLecmkxg4EID07p+rPoYTikCb6bxqBgWCh4IxYF08IGJVC/1bLtFS+bXFzeEK1
	 Mpc0/G1vGVv2A==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BB535C77B7F;
	Fri, 20 Jun 2025 19:51:30 +0000 (UTC)
From: Cristian Cozzolino via B4 Relay <devnull+cristian_ci.protonmail.com@kernel.org>
Date: Fri, 20 Jun 2025 23:51:40 +0200
Subject: [PATCH 2/3] dt-bindings: arm: qcom: Add Billion Capture+
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250620-rimob-initial-devicetree-v1-2-8e667ea21f82@protonmail.com>
References: <20250620-rimob-initial-devicetree-v1-0-8e667ea21f82@protonmail.com>
In-Reply-To: <20250620-rimob-initial-devicetree-v1-0-8e667ea21f82@protonmail.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht, 
 phone-devel@vger.kernel.org, 
 Cristian Cozzolino <cristian_ci@protonmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1750456316; l=793;
 i=cristian_ci@protonmail.com; s=20250620; h=from:subject:message-id;
 bh=rX9AadKtpX+eNxD3sjDhJeQkUeOFBglGYJMKRi4cNf8=;
 b=XFAjdp9v7GyZ+41fGswEsFw+i2VXWk79MGsMD2v6Ai2zMveid1QmeNTzCtVaFdMVVmqYQ8Cyz
 iDiGOe4ESy8AuP4+0GxOLOUtPUgBwrdarwIsAgLLtRif4zi3lirX2qs
X-Developer-Key: i=cristian_ci@protonmail.com; a=ed25519;
 pk=xH5IvIPUNHV1Q8R0/pq2CfuVFR/wTiAyuyi6IwedjZY=
X-Endpoint-Received: by B4 Relay for cristian_ci@protonmail.com/20250620
 with auth_id=438
X-Original-From: Cristian Cozzolino <cristian_ci@protonmail.com>
Reply-To: cristian_ci@protonmail.com

From: Cristian Cozzolino <cristian_ci@protonmail.com>

Billion Capture+ (flipkart,rimob) is a smartphone based on Qualcomm
Snapdragon 625 (MSM8953).

Signed-off-by: Cristian Cozzolino <cristian_ci@protonmail.com>
---
 Documentation/devicetree/bindings/arm/qcom.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/arm/qcom.yaml b/Documentation/devicetree/bindings/arm/qcom.yaml
index 618a87693ac1dc32b40a2201bc219a4f12e9f3e8..dbe605557af82c2382702011276e920ea18d3bb8 100644
--- a/Documentation/devicetree/bindings/arm/qcom.yaml
+++ b/Documentation/devicetree/bindings/arm/qcom.yaml
@@ -274,6 +274,7 @@ properties:
 
       - items:
           - enum:
+              - flipkart,rimob
               - motorola,potter
               - xiaomi,daisy
               - xiaomi,mido

-- 
2.49.0



