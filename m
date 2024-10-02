Return-Path: <linux-arm-msm+bounces-32933-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 3606198D2CC
	for <lists+linux-arm-msm@lfdr.de>; Wed,  2 Oct 2024 14:10:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D1C441F22EA6
	for <lists+linux-arm-msm@lfdr.de>; Wed,  2 Oct 2024 12:10:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A10921D014E;
	Wed,  2 Oct 2024 12:09:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=getgoogleoff.me header.i=@getgoogleoff.me header.b="k3WZMjwL"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from layka.disroot.org (layka.disroot.org [178.21.23.139])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00C671CFEDE;
	Wed,  2 Oct 2024 12:09:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.21.23.139
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727870993; cv=none; b=cUBctOsrX3mHLW8wb8ek9tpb9OGDmmKO5tBgg5iXxX7luTEHqD/mhgy3hFbW8P+WtQwc1cxLREF54ygkqylkXqwgjnPBclVZBfPamdoWM9xSUNIWftulRlHQjbcq5gB1SRIxUQ0Gg0m2GE3rty61K39Or+twQn/QMPbA9WnRfqQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727870993; c=relaxed/simple;
	bh=MUNKoDO2H+/uLLlgajsKQFryWIR42AUxDslh7oxAnFs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=V0G1adJSW3nnX3qHoyyK6gWP1yjTkTj9tgHuND5sxW5A8Bw6tFcniwAg4KovZKeUwNaXu5NrMAkcbulWsnsD2bmC5Z1+QAnPbRRV41NVWmERIDKstnGCTKSJfNlbiUMH9WP8WH0CpVDvNKakk5EG288J7Bd2wFI2kjEUCTG4Fyk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=getgoogleoff.me; spf=pass smtp.mailfrom=getgoogleoff.me; dkim=pass (2048-bit key) header.d=getgoogleoff.me header.i=@getgoogleoff.me header.b=k3WZMjwL; arc=none smtp.client-ip=178.21.23.139
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=getgoogleoff.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=getgoogleoff.me
Received: from mail01.disroot.lan (localhost [127.0.0.1])
	by disroot.org (Postfix) with ESMTP id 6389923CD9;
	Wed,  2 Oct 2024 14:09:50 +0200 (CEST)
X-Virus-Scanned: SPAM Filter at disroot.org
Received: from layka.disroot.org ([127.0.0.1])
 by localhost (disroot.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id PP8VSZ4qCWlx; Wed,  2 Oct 2024 14:09:49 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=getgoogleoff.me;
	s=mail; t=1727870989;
	bh=MUNKoDO2H+/uLLlgajsKQFryWIR42AUxDslh7oxAnFs=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=k3WZMjwLJKTUjPr3lzS/+lxjzsR+nhSx7JTeMG8VKz8/gEhxPBWDRHqkts9fAkey+
	 DAkKY/HYmJcRdpLTojky0iUmn33yMiGmAOBbsBCJiVrM0MyYkWx84OZMc6QzOkCRQA
	 BDBWRBswWIDHBww1qFPnxHO5/ZTvAUOcqxJhQm+V0qc1DBWiPbjrK9yodRbw3dN5aT
	 5/XhMfLOJ8Voi7ifEMOodLTZPmzPwBhf7dnYL8GpGzNwvVg8U8YUbbyKpuUI8ugE4F
	 4y+wj7PcL6e6DUfx/DVP23V3wEgOrSgv5Z3GxFP7x1CRXRl1JCcAvvD6vRkbkchwZm
	 v1NjRRABJMQQg==
From: Karl Chan <exxxxkc@getgoogleoff.me>
To: linux-arm-msm@vger.kernel.org
Cc: andersson@kernel.org,
	konradybcio@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Karl Chan <exxxxkc@getgoogleoff.me>
Subject: [PATCH 2/3] dt-bindings: arm: qcom: add Linksys EA9350 V3
Date: Wed,  2 Oct 2024 20:08:03 +0800
Message-ID: <20241002120804.25068-3-exxxxkc@getgoogleoff.me>
In-Reply-To: <20241002120804.25068-1-exxxxkc@getgoogleoff.me>
References: <20241002120804.25068-1-exxxxkc@getgoogleoff.me>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Document linksys,jamaica for Linksys EA9350 V3.

Signed-off-by: Karl Chan <exxxxkc@getgoogleoff.me>
---
 Documentation/devicetree/bindings/arm/qcom.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/arm/qcom.yaml b/Documentation/devicetree/bindings/arm/qcom.yaml
index 5cb54d69af0b..fa22f653a55f 100644
--- a/Documentation/devicetree/bindings/arm/qcom.yaml
+++ b/Documentation/devicetree/bindings/arm/qcom.yaml
@@ -340,6 +340,7 @@ properties:
           - enum:
               - qcom,ipq5018-rdp432-c2
               - tplink,archer-ax55-v1
+              - linksys,jamaica
           - const: qcom,ipq5018
 
       - items:
-- 
2.46.1


