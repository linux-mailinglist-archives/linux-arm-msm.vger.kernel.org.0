Return-Path: <linux-arm-msm+bounces-61297-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FE1FAD9F3A
	for <lists+linux-arm-msm@lfdr.de>; Sat, 14 Jun 2025 21:05:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D47573B7A82
	for <lists+linux-arm-msm@lfdr.de>; Sat, 14 Jun 2025 19:05:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C06301E520D;
	Sat, 14 Jun 2025 19:05:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="OHcOLGwX"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91F5D54670;
	Sat, 14 Jun 2025 19:05:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749927938; cv=none; b=UJ9V05JI62ZX81XI7avfopjIqY5D/PKq74NvPKOQyBQzh4QQ4bZagi6fZxIJTktk3I2vJwRT9P15xGdB7e0OugsFF1VBdUqmNX7JaX4ZdVOX18QIaUM6oX2X32ssUxZwbTq/AhwJ6sbQ+A9L8SSihsqNlx/O/rSJu/GKkXSxcMY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749927938; c=relaxed/simple;
	bh=rNMQsOpEFP/cEshEeBKrjhcD7eOyHh3ocUoD9Lzrj7k=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=UDy4V41016y3gFe3V9cSpBIvNRQ57pJ0fPpWRiTsubaFPJah4aZkZCWFoVkXghef+/hRg66wn1cgu+p6g6O2rD/B/daN+QIlsmqUPv7exvczf1LldkiQSIHqVCErrePbuqrgvqyYbycf8Az0zhB7vqj3U0OMxOcda7Pdir4GBcc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=OHcOLGwX; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 58586C4CEEB;
	Sat, 14 Jun 2025 19:05:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749927937;
	bh=rNMQsOpEFP/cEshEeBKrjhcD7eOyHh3ocUoD9Lzrj7k=;
	h=From:Subject:Date:To:Cc:From;
	b=OHcOLGwXf4rW482mf2Pfyvj6kK9/xF7P1pWhMGZpC6lT6rrRGj9vbVrPX293Ch11h
	 PHalHt+EKDjc4By5QfqlXqBfPxmfkd/aRQ3k2o6dR4EFOVWZyagGXMbGK4cSRVGRqP
	 0Ka4VOKNPK04SBiLCu2u9lK7C4s5Sol5Oi28nIGNaxyTaeFK2WKrcZfFAzQSWCHxbS
	 0UQsbPCSgetDlsi4S0MxEpw6YLQegpa9ABKCzl6XzHIyBfdWgayrUJc8XgquC5U22W
	 NbGsCA/C9Xg1AeSkzRIQ8Lmane5AAYZolV9aXBKXhCQy7qi+Owuf/p6gtt8QafzEpI
	 OI08+qWB8fDfQ==
From: Konrad Dybcio <konradybcio@kernel.org>
Subject: [PATCH 0/4] arm64/qcom: Drop bogus venus-en/decoder nodes
Date: Sat, 14 Jun 2025 21:05:18 +0200
Message-Id: <20250614-topic-encdec-v1-0-f974c3e9cb43@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAO7HTWgC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDI1MDM0MT3ZL8gsxk3dS85JTUZF1jQ1Pz1CQLY4tkI0sloJaCotS0zAqwcdG
 xtbUADb7UbF4AAAA=
X-Change-ID: 20250614-topic-encdec-3157eb838c29
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, cros-qcom-dts-watchers@chromium.org
Cc: Marijn Suijten <marijn.suijten@somainline.org>, 
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1749927933; l=877;
 i=konrad.dybcio@oss.qualcomm.com; s=20230215; h=from:subject:message-id;
 bh=rNMQsOpEFP/cEshEeBKrjhcD7eOyHh3ocUoD9Lzrj7k=;
 b=PJM5ZITOxIXrIP5SXm3TvmEx+z1vjZnvpxeHXOihVLs8cljU2iD4OLjCfc54LE+e2aGNORvRg
 AdmNwK89FAXAO3uy//OxSCF6SiDoJq8BUTW1CJxsy49YXgfEJDrE1gP
X-Developer-Key: i=konrad.dybcio@oss.qualcomm.com; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=

I left the ones with clock in tact, as I *really* wasn't sure what
the various layers of spaghetti do with them..

Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
---
Konrad Dybcio (4):
      arm64: dts: qcom: msm8916: Drop venus-enc/decoder node
      arm64: dts: qcom: sc7180: Drop venus-enc/decoder node
      arm64: dts: qcom: sdm845: Drop venus-enc/decoder node
      arm64: dts: qcom: sm8250: Drop venus-enc/decoder node

 arch/arm64/boot/dts/qcom/msm8916.dtsi | 8 --------
 arch/arm64/boot/dts/qcom/sc7180.dtsi  | 8 --------
 arch/arm64/boot/dts/qcom/sdm845.dtsi  | 8 --------
 arch/arm64/boot/dts/qcom/sm8250.dtsi  | 8 --------
 4 files changed, 32 deletions(-)
---
base-commit: 19a60293b9925080d97f22f122aca3fc46dadaf9
change-id: 20250614-topic-encdec-3157eb838c29

Best regards,
-- 
Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>


