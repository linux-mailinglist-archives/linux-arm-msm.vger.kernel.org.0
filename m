Return-Path: <linux-arm-msm+bounces-45012-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D583A108C2
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Jan 2025 15:12:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 06C3F1884B9C
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Jan 2025 14:11:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0BAF213D502;
	Tue, 14 Jan 2025 14:11:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="OiQoxb7D"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC742762F7;
	Tue, 14 Jan 2025 14:11:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736863881; cv=none; b=d3/q8YpoRZL79boQ6ZuqM4U25OK6ShjLKZvDBAOJngwBIJiq8sc8Y6RG0QUaB1atuoZ7UGOf7/IO0n96TKgnlvg12U3wSJ4SrC+nmMfgHB68YHAcrIuWWbpAuqikP9oei2G5aNyeD+OHoebczwLU32EnGaS1VQgKet3o83jc4wU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736863881; c=relaxed/simple;
	bh=zqK5+u9pQxDXrUlhQIqO4rd9BiRJrfpADnoSryH88Xw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=quDGBylndBDASgMRxoBlg9whOR5PLq38rNu9GLZmtkr1C6AT9FX/eNvcUlxzX+WXQ2VepwY8hQPn5zBvxwJdFBKSiBIHW6DupXtw6ldE32Fl1VwJ5m0GPHl5SyIgmrOwQKB/F6qC3Er7gfJP+TgVhxvFnXSyOOOU/alyJ+/WqM4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=OiQoxb7D; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 66F30C4CEE5;
	Tue, 14 Jan 2025 14:11:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736863881;
	bh=zqK5+u9pQxDXrUlhQIqO4rd9BiRJrfpADnoSryH88Xw=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=OiQoxb7DYk4qkn6zwghPDHMW+/QksbY/6ZvycKfH/22xybpFmIBvbJYbHvBPHWa6g
	 VMVVvu1dhVyTfD9UA4PxscoTmI5Vbvbad/kUI3HwfMpmHVuMi/eWQg10x6OlSKtPO5
	 UwU+WT2rwdfkNByXk6H6Tu4ry8HOYyzZJradn33g0Ch8+nV0EV0kHGPgqI+z1Rl1bp
	 6+0tj3dbmpo//0nhJ9NsLIb+DzWVbMYNfd8BbC2nbPgbobpHuWqtiMfVfZbBVYZC45
	 WtIs8+q613ZAm+QccSJIC5DaeRTpSPccdRUne0q2VaKh6LdrZUHSWMoqUHf+uC0+N4
	 QBCfFjy0h3beg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5D738C02187;
	Tue, 14 Jan 2025 14:11:21 +0000 (UTC)
From: Ricky Cheung via B4 Relay <devnull+rcheung844.gmail.com@kernel.org>
Date: Tue, 14 Jan 2025 22:11:19 +0800
Subject: [PATCH 2/3] dt-bindings: arm: qcom: Add XiaoXun JZ0145 v33
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250114-xiaoxun-jz0145-v33-v1-2-dc51f7ce3bd8@gmail.com>
References: <20250114-xiaoxun-jz0145-v33-v1-0-dc51f7ce3bd8@gmail.com>
In-Reply-To: <20250114-xiaoxun-jz0145-v33-v1-0-dc51f7ce3bd8@gmail.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, Ricky Cheung <rcheung844@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1736863880; l=777;
 i=rcheung844@gmail.com; s=20250114; h=from:subject:message-id;
 bh=rcWv0GEI8Tk+7bGBT8IFODLra+FIFnAENM9Ul2xHUTY=;
 b=yrm7tQFFdAhlbC+1iQUgSN+Xdjjb+tl4tL0ahicMd4mW7d9JcKW+/k8+8NorQLUaKdXTHGXTj
 jSYpNoUbcxWDzSL+aXFj215GSWQ8p/2FiocIg1Tpi9RQRUrrPjyUF46
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



