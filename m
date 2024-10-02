Return-Path: <linux-arm-msm+bounces-32940-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 1784598D4DD
	for <lists+linux-arm-msm@lfdr.de>; Wed,  2 Oct 2024 15:25:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B2F881F22622
	for <lists+linux-arm-msm@lfdr.de>; Wed,  2 Oct 2024 13:25:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1A8861D07AC;
	Wed,  2 Oct 2024 13:24:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=getgoogleoff.me header.i=@getgoogleoff.me header.b="nO9gZYEN"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from layka.disroot.org (layka.disroot.org [178.21.23.139])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CAB051D014A;
	Wed,  2 Oct 2024 13:24:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.21.23.139
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727875477; cv=none; b=Yr82q0wdyXtQIyEsCjm/NEEK+9cqHFIhstoE59+VUI7HCd7c0ZjZuRx/1qb9DzyCfRqYlIfGL8dZzjjeFFvDGQipJ1BK6tbpPFWxgnNwOTP0F7VEAI/83etGGsP4GdEY2ENvgNPNimeYglxK8TJoxcEm8CEfgeRV3INQpa8Ekhw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727875477; c=relaxed/simple;
	bh=oV6B5e+qoTEsfbec+8stNvUBaHqTyHc4zEUqxUFmuBI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=sm8s7tPb/XumxIJ/7usb93zu5oBdACfU6Ur/Y2R2P5wErTxLozEFMaparZ2pRMujrawH+3TWhdHtjoMJIvX0ssGG5phqS5vaI4iSBFH2K2gikZOFzBf7ZevJvWsZcDl/E4FB6Abq2Xj+jqYxlvKxqxZQMDTnBI1TITy4CQoJc7I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=getgoogleoff.me; spf=pass smtp.mailfrom=getgoogleoff.me; dkim=pass (2048-bit key) header.d=getgoogleoff.me header.i=@getgoogleoff.me header.b=nO9gZYEN; arc=none smtp.client-ip=178.21.23.139
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=getgoogleoff.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=getgoogleoff.me
Received: from mail01.disroot.lan (localhost [127.0.0.1])
	by disroot.org (Postfix) with ESMTP id E76FF23D13;
	Wed,  2 Oct 2024 15:24:32 +0200 (CEST)
X-Virus-Scanned: SPAM Filter at disroot.org
Received: from layka.disroot.org ([127.0.0.1])
 by localhost (disroot.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Eq5aSg7WkvLK; Wed,  2 Oct 2024 15:24:32 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=getgoogleoff.me;
	s=mail; t=1727875472;
	bh=oV6B5e+qoTEsfbec+8stNvUBaHqTyHc4zEUqxUFmuBI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=nO9gZYENqJHfJoo7ijNILH8m3Tl6Eunv3P55arUNlg/kKErBNZnst/Vg9BrQbAHzf
	 Mmw57VH2kELJliqhThxD5+CEkrTLGzwNiogpM14px9qs0eqGYlV2dfTEHDYy21frYs
	 Sjz0zjtYYWeDCyxPAB6Crw7rjGM3lPObouSkQBom8iL0OP/5i3HMrLpnl6c7kbxlui
	 kpLq3PRrYbL/r6J3bVOJDg7AdYB6eSrHBjSc9IEB0UawB8xNwvPx0hVs2kIpxizpx5
	 RtnGEEx/HvntQ5lLOOqs9vbjStydanXnrt4IFjQ7cLJr+9FtF6zcfwwRZVDbNRe9jr
	 Ql+Vw1OAO6EEg==
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
Subject: [PATCH v2 1/3] dt-bindings: arm: qcom: add Linksys EA9350 V3
Date: Wed,  2 Oct 2024 21:23:00 +0800
Message-ID: <20241002132302.31608-2-exxxxkc@getgoogleoff.me>
In-Reply-To: <20241002132302.31608-1-exxxxkc@getgoogleoff.me>
References: <20241002132302.31608-1-exxxxkc@getgoogleoff.me>
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
index 5cb54d69af0b..98dc4819a5a2 100644
--- a/Documentation/devicetree/bindings/arm/qcom.yaml
+++ b/Documentation/devicetree/bindings/arm/qcom.yaml
@@ -338,6 +338,7 @@ properties:
 
       - items:
           - enum:
+              - linksys,jamaica
               - qcom,ipq5018-rdp432-c2
               - tplink,archer-ax55-v1
           - const: qcom,ipq5018
-- 
2.46.1


