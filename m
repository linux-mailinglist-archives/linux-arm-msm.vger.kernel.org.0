Return-Path: <linux-arm-msm+bounces-11222-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 082DF856BF2
	for <lists+linux-arm-msm@lfdr.de>; Thu, 15 Feb 2024 19:03:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 3B50B1C216D9
	for <lists+linux-arm-msm@lfdr.de>; Thu, 15 Feb 2024 18:03:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 412CE1386CA;
	Thu, 15 Feb 2024 18:03:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=postmarketos.org header.i=@postmarketos.org header.b="jNna6iLf"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from out-174.mta0.migadu.com (out-174.mta0.migadu.com [91.218.175.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE387138493
	for <linux-arm-msm@vger.kernel.org>; Thu, 15 Feb 2024 18:03:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708020215; cv=none; b=LkbMQptBdaSlb519WAgyZMfy6b1ejaezE4UkTCEN5qM9yB2a40Kdgj/QRmAC3MzYMR+EgMYpdwnTTHhP/4EJC+qokXhO6DwSNI8ctA2/6U/B+LlwSGxKD3rwESyxfVumat/44bem/r97pu6u9KLe/Q3YpcFg8mCTdFtrsauJBjc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708020215; c=relaxed/simple;
	bh=HKanBpsGd5WhYiDimwy9XwtjAltU0LiKFEN2I4Q1tw4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=QhU2uo5iGkfmDMbY68Lk0Z7D6Ywd6kXZNHxpFAjkDa9NBGITEBJmAhaHbpklEXKq0+5G9xMc1PdGTXtvPpyKAPq5TtDs3lLKvq1CiyVAEg+x7m6+Jt4stPummR5ifW5+wA6uCxU6wRmg8hMbi774Cf8I79PJBT0BJKQiSLf0KzE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=postmarketos.org; spf=pass smtp.mailfrom=postmarketos.org; dkim=pass (2048-bit key) header.d=postmarketos.org header.i=@postmarketos.org header.b=jNna6iLf; arc=none smtp.client-ip=91.218.175.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=postmarketos.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=postmarketos.org
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=postmarketos.org;
	s=key1; t=1708020209;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=1VE/5xVbfZhsE1tQbNSqD+Z1w2MonyJu5sdqEf5rHvY=;
	b=jNna6iLfnijI1WQyWubeQ9gKdsprAsc/klgETqPUBgq0WFVUsXzTT9iw9BfSQdHEiU2obC
	AIHZvRsLv7nPZqa6mq/5S1OnHu2ixv9MKzcSFRrqmtBo5xDEKdGOm4RWv4EL0LitbqoHgB
	gcn8pRvfiQ1fp4gM1uQYFG5lQZnJxQ2e8Q9GXyXJn8raw9YubkmyBdlADK5mYChpiasITG
	xaNKCZCK7h/Fx/ehVPnLkCU9ujtkmA3k3yT/fQBHuIAcovOdNyZkpk7MUJIUb+h4EvFcuV
	IrveVxtoaMGbtSXtUU+UzXYymtm2b+h4FPimEnhhfQQxyhzAAUOnX2BwJtd61Q==
From: Stefan Hansson <newbyte@postmarketos.org>
To: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: ~postmarketos/upstreaming@lists.sr.ht,
	phone-devel@vger.kernel.org,
	Stefan Hansson <newbyte@postmarketos.org>
Subject: [PATCH v6 0/4] Add samsung-matisselte and common matisse dtsi
Date: Thu, 15 Feb 2024 19:01:58 +0100
Message-ID: <20240215180322.99089-1-newbyte@postmarketos.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT

This series adds a common samsung-matisse dtsi and reworks
samsung-matisse-wifi to use it, and introduces samsung-matisselte. I
choose matisselte over matisse-lte as this is how most other devices
(klte, s3ve3g) do it and it is the codename that Samsung gave the
device. See individual commits for more information.

---
Changes since v1:

 - Rebased on latest linux-next
 - Added qcom,msm8226 compatible to matisselte inspired by recent Lumia
   830 patch. This is done as in v1, the patch was rejected because I
   included the msm8226 dtsi despite not marking matisselte as
   compatible with msm8226, and I was not sure how to resolve that. As
   such, I'm copying what was done in the Lumia 830 (microsoft-tesla)
   patch given that it was accepted.

Changes since v2:

 - Updated commit message for UART patch to explain why it was added.
 - Gave more flags to git to provide a hopefully more readable patch.

Changes since v3:

 - Collect tags.
 - Remove spurious copyright notice.
 - Miscellaneous fixes following review feedback.

Changes since v4:

 - Collect tags.
 - Enable SD card support on matisselte.

Changes since v5:

 - Rebased on latest linux-next.

Stefan Hansson (4):
  ARM: dts: qcom: samsung-matisse-common: Add initial common device tree
  dt-bindings: arm: qcom: Add Samsung Galaxy Tab 4 10.1 LTE
  ARM: dts: qcom: Add support for Samsung Galaxy Tab 4 10.1 LTE
    (SM-T535)
  ARM: dts: qcom: samsung-matisse-common: Add UART

 .../devicetree/bindings/arm/qcom.yaml         |   1 +
 arch/arm/boot/dts/qcom/Makefile               |   1 +
 .../qcom-apq8026-samsung-matisse-wifi.dts     | 617 +++---------------
 ... qcom-msm8226-samsung-matisse-common.dtsi} |  75 +--
 .../qcom/qcom-msm8926-samsung-matisselte.dts  |  37 ++
 5 files changed, 133 insertions(+), 598 deletions(-)
 rewrite arch/arm/boot/dts/qcom/qcom-apq8026-samsung-matisse-wifi.dts (84%)
 copy arch/arm/boot/dts/qcom/{qcom-apq8026-samsung-matisse-wifi.dts => qcom-msm8226-samsung-matisse-common.dtsi} (85%)
 create mode 100644 arch/arm/boot/dts/qcom/qcom-msm8926-samsung-matisselte.dts

-- 
2.43.0


