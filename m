Return-Path: <linux-arm-msm+bounces-89436-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CEB8D335CA
	for <lists+linux-arm-msm@lfdr.de>; Fri, 16 Jan 2026 17:00:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 4AE0430A2785
	for <lists+linux-arm-msm@lfdr.de>; Fri, 16 Jan 2026 15:56:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D02A333D6E6;
	Fri, 16 Jan 2026 15:55:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mainlining.org header.i=@mainlining.org header.b="G3bBhd0Y";
	dkim=permerror (0-bit key) header.d=mainlining.org header.i=@mainlining.org header.b="/HxagTRA"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail.mainlining.org (mail.mainlining.org [5.75.144.95])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E80133C18E;
	Fri, 16 Jan 2026 15:55:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=5.75.144.95
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768578958; cv=none; b=C2gV/ViuSvssWUhxYNMlEtKl6PvUHVVXteckGDotQmo01RlCiOch43vYEXnNZEv5IQEFNsFOatqD9lhIIbE4TqYoqrxDsqdPnLrhHI5Vg9Kburp/Io0jurPAX6UtOddk8yIdaxud09tAc7sNy2sIRpzZE7xcj/tfJoAtjxcEhek=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768578958; c=relaxed/simple;
	bh=BGD37iXtuXVqveIhoKLUva+wDLcwjb4aEPD1NwPfpoQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=kAjUE6G/TvyxfOK/B47zgGFBcf/fjTg4ThOJKr+b7zRi/erX9j7H5T7GN7Z6vrPLJZhp1rKOjTNS4P/9VCRIjqL4g51q9ZusT+ANa04mORkHropTjHUt+2qzDtteTmK7p37tZgJGbw1DpigteF68d7PQX7Oug4Xsg/a7HSLOoXk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mainlining.org; spf=pass smtp.mailfrom=mainlining.org; dkim=pass (2048-bit key) header.d=mainlining.org header.i=@mainlining.org header.b=G3bBhd0Y; dkim=permerror (0-bit key) header.d=mainlining.org header.i=@mainlining.org header.b=/HxagTRA; arc=none smtp.client-ip=5.75.144.95
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mainlining.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mainlining.org
DKIM-Signature: v=1; a=rsa-sha256; s=202507r; d=mainlining.org; c=relaxed/relaxed;
	h=To:Message-Id:Subject:Date:From; t=1768578906; bh=tXubEZSnhpcufNXftqhqFFl
	cq77hv7GIVJJ3YGo5pfk=; b=G3bBhd0Yd1k9t72RdZx6Nusbd5uIbJGpF7uwYUHlqTcW2Qho9p
	1DiVL51L65knmp4MBzz+JkTedk119SVKQh7QJenVnudVD7/gibOS/CBw0x4yzPJbGcZmzmRPi6U
	zhPsH8Dk7l58vTABvkNg2Yh+31Xl1HGJvkC6kxe6zUYnL4rSy1ZJRxFLNlZsg/Eg9xouvNVmQr/
	wvLYCPnBIHXWqJlIZswuSIwWf3HpXFESye02Jw7deXN23tB07o4FiRbkxyfPZm2kGHxedJbwp0e
	k6gI7PDSNP/lBlufT1BhNpUJzk0KC1NP+BoHJgNrGIks9bdeyfu5M/uckBgSTcZzHww==;
DKIM-Signature: v=1; a=ed25519-sha256; s=202507e; d=mainlining.org; c=relaxed/relaxed;
	h=To:Message-Id:Subject:Date:From; t=1768578906; bh=tXubEZSnhpcufNXftqhqFFl
	cq77hv7GIVJJ3YGo5pfk=; b=/HxagTRAsNbrqFXrFBR+ReFgjZSCEkamIaRWCJUn0IzSXUC2yo
	zVRAY3dzI0zOAu/ALNrE+wXVzCvEsH1sXQBw==;
From: =?utf-8?q?Barnab=C3=A1s_Cz=C3=A9m=C3=A1n?= <barnabas.czeman@mainlining.org>
Date: Fri, 16 Jan 2026 16:54:48 +0100
Subject: [PATCH v2 6/7] dt-bindings: arm: qcom: Add Xiaomi Redmi Note 8T
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260116-xiaomi-willow-v2-6-4694feb70cdb@mainlining.org>
References: <20260116-xiaomi-willow-v2-0-4694feb70cdb@mainlining.org>
In-Reply-To: <20260116-xiaomi-willow-v2-0-4694feb70cdb@mainlining.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Gabriel Gonzales <semfault@disroot.org>, 
 Kees Cook <kees@kernel.org>, Tony Luck <tony.luck@intel.com>, 
 "Guilherme G. Piccoli" <gpiccoli@igalia.com>, 
 Biswapriyo Nath <nathbappai@gmail.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-hardening@vger.kernel.org, 
 phone-devel@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht, 
 linux@mainlining.org, 
 =?utf-8?q?Barnab=C3=A1s_Cz=C3=A9m=C3=A1n?= <barnabas.czeman@mainlining.org>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1768578900; l=754;
 i=barnabas.czeman@mainlining.org; s=20240730; h=from:subject:message-id;
 bh=BGD37iXtuXVqveIhoKLUva+wDLcwjb4aEPD1NwPfpoQ=;
 b=LOGuQhxyMSS8KYb/8MiFP7RBF42eUpCKcEU0pzzvtQhdsCDWgcSFxjNgKhEq3FgmFHJUxyTQD
 o5kkGja/ffCD+WIwSh7oT5iikH/XP9FMssMQbWjs0ARgeYOiNF/q9Hk
X-Developer-Key: i=barnabas.czeman@mainlining.org; a=ed25519;
 pk=TWUSIGgwW/Sn4xnX25nw+lszj1AT/A3bzkahn7EhOFc=

Document the Xiaomi Redmi Note 8 (willow).

Acked-by: Rob Herring (Arm) <robh@kernel.org>
Signed-off-by: Barnabás Czémán <barnabas.czeman@mainlining.org>
---
 Documentation/devicetree/bindings/arm/qcom.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/arm/qcom.yaml b/Documentation/devicetree/bindings/arm/qcom.yaml
index d48c625d3fc4..f76cc92d5530 100644
--- a/Documentation/devicetree/bindings/arm/qcom.yaml
+++ b/Documentation/devicetree/bindings/arm/qcom.yaml
@@ -966,6 +966,7 @@ properties:
               - sony,pdx201
               - xiaomi,ginkgo
               - xiaomi,laurel-sprout
+              - xiaomi,willow
           - const: qcom,sm6125
 
       - items:

-- 
2.52.0


