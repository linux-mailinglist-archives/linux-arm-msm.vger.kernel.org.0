Return-Path: <linux-arm-msm+bounces-45020-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D0FDBA109BC
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Jan 2025 15:47:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2043F3A8941
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Jan 2025 14:46:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0E4BC15380A;
	Tue, 14 Jan 2025 14:46:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gYjH7ph7"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2FA8148310;
	Tue, 14 Jan 2025 14:46:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736866014; cv=none; b=onK3q+NNfl9KgKwxCE+eJc451X7rY+D+eZX2pPbFGm8zrjYAsP1jEEYas1qLFjEfnhhYEVF3mE2DmatSBfIAKiwxfsR8biJynNk5Hoy86fR2L4nNLfPo5cgSx/+ilt0hFU1ST66Lbn/NDaPMwwnsZloGMcyjVp61P/ggEBPUgVw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736866014; c=relaxed/simple;
	bh=zqK5+u9pQxDXrUlhQIqO4rd9BiRJrfpADnoSryH88Xw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=gXgwGFSbLoRauzWQWRkR38Jr5+SznkBZ+zi8nh/xJ5+SpKqVrLhHFfPm8mqhl1tkOkzsmOAvUs0PJ7bZzy5U10oBS+nleYRCQFEYjLmPXAS8GAeR7DVRAfG7npFN1QN63hRkkVvT+hE4kHrYueRu2YcCmRR/neg6MhWmFmsGDX4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gYjH7ph7; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 86123C4AF0C;
	Tue, 14 Jan 2025 14:46:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736866014;
	bh=zqK5+u9pQxDXrUlhQIqO4rd9BiRJrfpADnoSryH88Xw=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=gYjH7ph7YJEBpB6hA6ROq/1QhDDQn5URZMll4TfOefEAAJWkq7Vyd75VnwOkTLEDh
	 /379DNhAMTJKyjjr+vM0hzdcdUVmuuLBVWTRtCAPYG2v3AnIAm65g3URxveXvycClt
	 kI2uFISvVcQzFi4X5pm2zs9fV6mZiugOjqi9XxSyPAjDRRaJbvzH4TmAGPsoV1PFOF
	 88SSbTg0Y9WY4dkW6I38E7et8pKSNWODrmyIWoQcVL4t+LoYiB3QIUJ5ln9P2SHSkf
	 M1uk0OmxrS0EvEI5Va4DVA7Iq0e/bbHjWQayHbBL5nXT0PjozgYIN9G4Ud9xacd/Za
	 TX6YfeW/GqUqg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7787FC02187;
	Tue, 14 Jan 2025 14:46:54 +0000 (UTC)
From: Ricky Cheung via B4 Relay <devnull+rcheung844.gmail.com@kernel.org>
Date: Tue, 14 Jan 2025 22:46:49 +0800
Subject: [PATCH RESEND v2 2/3] dt-bindings: arm: qcom: Add XiaoXun JZ0145
 v33
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250114-xiaoxun-jz0145-v33-v2-2-495e986579ce@gmail.com>
References: <20250114-xiaoxun-jz0145-v33-v2-0-495e986579ce@gmail.com>
In-Reply-To: <20250114-xiaoxun-jz0145-v33-v2-0-495e986579ce@gmail.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, Ricky Cheung <rcheung844@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1736866013; l=777;
 i=rcheung844@gmail.com; s=20250114; h=from:subject:message-id;
 bh=rcWv0GEI8Tk+7bGBT8IFODLra+FIFnAENM9Ul2xHUTY=;
 b=ITFWCEWvKBi34RZ71YSdewYcfs9cqxSN5UKBTLpI/6UhNurtlD7Z9s92tiBgB1xU0MKrnoRcf
 ZRlM6HN2CGLAsqFUg+/+111m4nc9NkrKKZknsakgqGjnlMqnET7Qo/s
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



