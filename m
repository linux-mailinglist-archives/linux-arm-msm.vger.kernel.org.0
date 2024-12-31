Return-Path: <linux-arm-msm+bounces-43754-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 9798E9FF08D
	for <lists+linux-arm-msm@lfdr.de>; Tue, 31 Dec 2024 17:10:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 99ED93A2F56
	for <lists+linux-arm-msm@lfdr.de>; Tue, 31 Dec 2024 16:10:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 10B2B1A83F4;
	Tue, 31 Dec 2024 16:10:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mainlining.org header.i=@mainlining.org header.b="oCLGkiBK"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail.mainlining.org (mail.mainlining.org [5.75.144.95])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE72F1C683;
	Tue, 31 Dec 2024 16:09:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=5.75.144.95
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735661403; cv=none; b=l4QPzajNVsEsIIa+Dc43XsyLJIV+p1ld5vZ0kPjoNNeVDfYoOdJBNsEMwG0XWvb9AT1u5ZYuTg+dX9fng19kFmfV3rik1Euk2KSlPqCAFaVLB2Dnp9rILfBHYewi8b1kQPSWOQOzQcDfqgUlVO46F23Ac3yY7VgXJPuTjLgClFw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735661403; c=relaxed/simple;
	bh=1cYeVCa1cqFCojAdxxEbOjzcJ+8YkUGu48EGozYP1BA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=RyX5hfSOu8IXskXjxg0h0ZDw9VShMk0UVy0VRhEpt3bS7GYMgPCOgbGk+FTBw8+d+NZLLSQP4XbNy1RAbqjbK9Z/pAJkjjzZHPMSFeOTzxixqcjTEdevsHy7mwMLc+K6eCZk9UbdOkcU+3f8Of0VvYH64aCh2tYy+fgqTRRdJ3k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mainlining.org; spf=pass smtp.mailfrom=mainlining.org; dkim=pass (2048-bit key) header.d=mainlining.org header.i=@mainlining.org header.b=oCLGkiBK; arc=none smtp.client-ip=5.75.144.95
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mainlining.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mainlining.org
Received: from [192.168.30.162] (254C25E0.nat.pool.telekom.hu [37.76.37.224])
	by mail.mainlining.org (Postfix) with ESMTPSA id 10B0AE484E;
	Tue, 31 Dec 2024 16:01:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mainlining.org;
	s=psm; t=1735660877;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=7tqrWvj7MAP+DSXKXlGXAA3BVwdXWO+loi5qVnWU4qk=;
	b=oCLGkiBKojvx4jKTGVZAraL5O+ee5rdruifc/bbbBH73tpwHem6JR5dB55Y3Xd2AKpc2F/
	BrFsRfEcbY0udQCPMD8FcV7fNMQmijJc8jp5jQToxT9lqIW+airesCL9IQqNLudE7Rrhwi
	rVNsFXrQRfeujuWF7JHOj77y4Zy33Sxfs3X7jEjySsoVdhAdu1PUOu/cssOTIApbIGGQVd
	1De2yKCTU7sUUCF6yGLjPvut4UiKjRfWxE+aqxoiP7pnjEK/UsOOvLGmZ8JW8x5X1hX+NB
	G64P0rtPzJata4Ni7wSx37PF71LC2YRBi1AIoo0jQsxZvxDdUNMwodSdsCxczA==
From: =?utf-8?q?Barnab=C3=A1s_Cz=C3=A9m=C3=A1n?= <barnabas.czeman@mainlining.org>
Date: Tue, 31 Dec 2024 17:00:51 +0100
Subject: [PATCH 3/4] dt-bindings: clock: qcom,rpmcc: Add MSM8940 compatible
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20241231-rpmcc-v1-3-1212df9b2042@mainlining.org>
References: <20241231-rpmcc-v1-0-1212df9b2042@mainlining.org>
In-Reply-To: <20241231-rpmcc-v1-0-1212df9b2042@mainlining.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
 linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 =?utf-8?q?Barnab=C3=A1s_Cz=C3=A9m=C3=A1n?= <barnabas.czeman@mainlining.org>, 
 Daniil Titov <daniilt971@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1735660873; l=1188;
 i=barnabas.czeman@mainlining.org; s=20240730; h=from:subject:message-id;
 bh=+B/k8lfRyPYXCbYKwvXEzA2xpb0TMTZSpGbxAyCxLwI=;
 b=/vyF/MuP57CxuPdKwxT/7J/6xWQtnCoc01cH8ydfkML+sqind7G6Nl8wJdKYU4aiUz5cBffxu
 aW7Lab0zMxPAeO6k7uVrYZYrBOr88Agur/oxL2Z3utlMrty9yJvFCr9
X-Developer-Key: i=barnabas.czeman@mainlining.org; a=ed25519;
 pk=TWUSIGgwW/Sn4xnX25nw+lszj1AT/A3bzkahn7EhOFc=

From: Daniil Titov <daniilt971@gmail.com>

Document the qcom,rpmcc-msm8940 compatible.

Signed-off-by: Daniil Titov <daniilt971@gmail.com>
Signed-off-by: Barnabás Czémán <barnabas.czeman@mainlining.org>
---
 Documentation/devicetree/bindings/clock/qcom,rpmcc.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/clock/qcom,rpmcc.yaml b/Documentation/devicetree/bindings/clock/qcom,rpmcc.yaml
index e58f43b1ab602a6fc8484a60dccafbfa52357dbb..be3835e2e04303dad483bf4b9d2e4ef3aab98c07 100644
--- a/Documentation/devicetree/bindings/clock/qcom,rpmcc.yaml
+++ b/Documentation/devicetree/bindings/clock/qcom,rpmcc.yaml
@@ -34,6 +34,7 @@ properties:
           - qcom,rpmcc-msm8917
           - qcom,rpmcc-msm8936
           - qcom,rpmcc-msm8937
+          - qcom,rpmcc-msm8940
           - qcom,rpmcc-msm8953
           - qcom,rpmcc-msm8974
           - qcom,rpmcc-msm8976
@@ -112,6 +113,7 @@ allOf:
               - qcom,rpmcc-msm8917
               - qcom,rpmcc-msm8936
               - qcom,rpmcc-msm8937
+              - qcom,rpmcc-msm8940
               - qcom,rpmcc-msm8953
               - qcom,rpmcc-msm8974
               - qcom,rpmcc-msm8976

-- 
2.47.1


