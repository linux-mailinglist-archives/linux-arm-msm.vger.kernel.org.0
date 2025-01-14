Return-Path: <linux-arm-msm+bounces-45015-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id ADD4BA10900
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Jan 2025 15:19:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 5AC707A492D
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Jan 2025 14:18:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 87C1E142E6F;
	Tue, 14 Jan 2025 14:18:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="nL2yCLVi"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5CAFC1369AE;
	Tue, 14 Jan 2025 14:18:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736864338; cv=none; b=cU0nKESl6llkVKdKCWuAM6NXl/Wnxt/WkVguCbbX6Y+fdsS2T91htcCoPmCIIy5D0U7l/fif3hjxVjdAY23R7vt8Yi8kTGenHPHh8yST904dG6F6XpO5f+EEwY6aQHBvbdZWAoJxo2poVxE4SdbSQH+ZXn0CyHTHzj4LTLtHy/s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736864338; c=relaxed/simple;
	bh=zqK5+u9pQxDXrUlhQIqO4rd9BiRJrfpADnoSryH88Xw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=TlYKLrGXq+r0L11NmRlfOHR+fiq1cu1qwJS1DGLUYJVKkT14JNn13+hPIzgt2a771HSpqe3i1uKTSIGlxEwu2JrwkbsHABT/Q20mmM5Yv17N7xcAtwXLi6Xfw6A/9TeFI4e0YmwnPU2Fp74sml19CBWeYssHP+IdvML1A5YgcNc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nL2yCLVi; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id F3260C4CEDD;
	Tue, 14 Jan 2025 14:18:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736864338;
	bh=zqK5+u9pQxDXrUlhQIqO4rd9BiRJrfpADnoSryH88Xw=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=nL2yCLViz3h5K4FM/MYwjRflCTjvA0xtubb7vCumVXggdWIq1boz3aMVrcd41Hh6v
	 oJjgdpSJSC7OKDA6Km6haogG+w+GneIRhfG6oacdO6RUPUspev5iwgOMbmxlw3OZqP
	 JLd8WPAkDMWhmu/QhqVI5DmJdlSXt2oYTpBddghxPaGnXpCqr8OKYf3w8DEewW6x++
	 +kn/sBMYAGYBNmE9Pd3NgA+kMQO6klkjGnvIbkm3+SnOXahLRGldFL8dca3EYAuLEW
	 MnbcxWitSCfUSoKNjje0Y3pCi2PBkJbWdJsSSSQBvnfGeBhodnP1Th+hGVTQUaEdxV
	 zpTSRGOU+Rq6g==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E763AC02187;
	Tue, 14 Jan 2025 14:18:57 +0000 (UTC)
From: Ricky Cheung via B4 Relay <devnull+rcheung844.gmail.com@kernel.org>
Date: Tue, 14 Jan 2025 22:18:56 +0800
Subject: [PATCH v2 2/3] dt-bindings: arm: qcom: Add XiaoXun JZ0145 v33
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250114-xiaoxun-jz0145-v33-v2-2-8b42f77badfa@gmail.com>
References: <20250114-xiaoxun-jz0145-v33-v2-0-8b42f77badfa@gmail.com>
In-Reply-To: <20250114-xiaoxun-jz0145-v33-v2-0-8b42f77badfa@gmail.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, Ricky Cheung <rcheung844@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1736864336; l=777;
 i=rcheung844@gmail.com; s=20250114; h=from:subject:message-id;
 bh=rcWv0GEI8Tk+7bGBT8IFODLra+FIFnAENM9Ul2xHUTY=;
 b=jQu0QupxITpPkUIhpJPtvGbluEi+a+gIOe9iMZMZz+IXouXaVRiYS9toJSWii6HpTB6yBcR5g
 fSRi+MrQDuQBNgspPW3ZkCa5OI8g4z92m/v5SsVNXx9h1NwbTaOIi8N
X-Developer-Key: i=rcheung844@gmail.com; a=ed25519;
 pk=JjZsSnuDD1xuR4EXY4XGKELgToA++HxxheDlHU/41yI=
X-Endpoint-Received: by B4 Relay for rcheung844@gmail.com/20250114 with
 auth_id=323
X-Original-From: Ricky Cheung <rcheung844@gmail.com>
Reply-To: rcheung844@gmail.com

From: Ricky Cheung <rcheung844@gmail.com>

Document the MSM8916-based 4G LTE WiFi modem.

Signed-off-by: Ricky Cheung <rcheung844@gmail.com>
---
 Documentation/devicetree/bindings/arm/qcom.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/arm/qcom.yaml b/Documentation/devicetree/bindings/arm/qcom.yaml
index 5cb54d69af0b7206e0f6a66023a203b8d7087696..92dd91cb66b7b1b26b013a7d32c20dfe44690569 100644
--- a/Documentation/devicetree/bindings/arm/qcom.yaml
+++ b/Documentation/devicetree/bindings/arm/qcom.yaml
@@ -245,6 +245,7 @@ properties:
               - wingtech,wt86518
               - wingtech,wt86528
               - wingtech,wt88047
+              - xiaoxun,jz0145-v33
               - yiming,uz801-v3
           - const: qcom,msm8916
 

-- 
2.47.1



