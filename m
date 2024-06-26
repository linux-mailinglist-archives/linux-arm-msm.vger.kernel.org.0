Return-Path: <linux-arm-msm+bounces-24354-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F725919832
	for <lists+linux-arm-msm@lfdr.de>; Wed, 26 Jun 2024 21:19:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 406001C2094C
	for <lists+linux-arm-msm@lfdr.de>; Wed, 26 Jun 2024 19:19:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 371781922F9;
	Wed, 26 Jun 2024 19:18:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=protonmail.com header.i=@protonmail.com header.b="CygTQ/zW"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-4319.protonmail.ch (mail-4319.protonmail.ch [185.70.43.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8F0E1922E8;
	Wed, 26 Jun 2024 19:18:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.70.43.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719429539; cv=none; b=d/seIkDabbs37vXGQdzitbyVn4DL/F2OhvTN6GR7Z/vsoVBDQgkaIRqeShJEzumLWs83HdD/h0zbu3ewN3Ru6Xjhbthe65t/ss7zRSFS9LnoVqa0i7da251ZBG0Y/eMh9SzMIg7Lv411L9bjp3INdaQBmmNrItDuHPM+ZnHtShs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719429539; c=relaxed/simple;
	bh=1xxyZU6eJrCwoYEwWDrRxrbz0IOIDiq2T9DPMMtrOmE=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=g/H4+KCJftGWjPO9XOSbBUuRes53AEH6rG1OnG58F8E38AgaF8l2Zt8aOtJHyi7u6owPuk86RVSRze2fG18ERgcYLdEugt5LWqB2UUogCYgD7G6OJ8WGBT2/0OCgEsnPXPyglGzkbc68BRYlrVtSxwh40D7SmMzKpMbamhKf2rk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=protonmail.com; spf=pass smtp.mailfrom=protonmail.com; dkim=pass (2048-bit key) header.d=protonmail.com header.i=@protonmail.com header.b=CygTQ/zW; arc=none smtp.client-ip=185.70.43.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=protonmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=protonmail.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
	s=protonmail3; t=1719429530; x=1719688730;
	bh=rCt8pPmaLa8YLpG+Q3XxVlgszYydoMsPMXCIQuR6rkY=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=CygTQ/zWi5YOHZlZJqksoseoHuOBgLq1slU3EsPr1oZ7v8hiz010N52fb/EfDTEUD
	 YoVEvQTRH5TolpZ+6W2Sm/XsrhWkYo3TYzMl0ydpWd0geFyc/BM01qG4aBiqBt2/z1
	 EEeTVSwb15EJ9oCnit/GAfUCUYMrqCQi7ytY25UGTYgH68M+wVbOHNayf1Q4vYUAyg
	 sG6xrd92qwBwTSfb/k/1hsFE0Mzh7XAmMN5m/gwsx6eDyu0R44XNcXFfxWvb8M6PBb
	 F7VOOKPqmCcwq//U6bvx2ZDXBmXkrY4Ln2HyBG7Oo0CpVF9zkilwGLRxaY0udkAv0V
	 dgmr+ab52DN/A==
Date: Wed, 26 Jun 2024 19:18:46 +0000
To: linux-kernel@vger.kernel.org
From: Raymond Hackley <raymondhackley@protonmail.com>
Cc: Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konrad.dybcio@linaro.org>, Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht
Subject: [PATCH 1/2] dt-bindings: arm: qcom: Document samsung,ms013g
Message-ID: <20240626191829.280611-2-raymondhackley@protonmail.com>
In-Reply-To: <20240626191829.280611-1-raymondhackley@protonmail.com>
References: <20240626191829.280611-1-raymondhackley@protonmail.com>
Feedback-ID: 49437091:user:proton
X-Pm-Message-ID: d501b7b48bd83eedaf8db580b37fb9d571e5e9bb
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Document samsung,ms013g for Galaxy Grand 2.

Signed-off-by: Raymond Hackley <raymondhackley@protonmail.com>
---
 Documentation/devicetree/bindings/arm/qcom.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/arm/qcom.yaml b/Documentatio=
n/devicetree/bindings/arm/qcom.yaml
index dfd5c5559e6d..aaade18d79d6 100644
--- a/Documentation/devicetree/bindings/arm/qcom.yaml
+++ b/Documentation/devicetree/bindings/arm/qcom.yaml
@@ -137,6 +137,7 @@ properties:
               - microsoft,dempsey
               - microsoft,makepeace
               - microsoft,moneypenny
+              - samsung,ms013g
               - samsung,s3ve3g
           - const: qcom,msm8226
=20
--=20
2.39.2



