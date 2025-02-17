Return-Path: <linux-arm-msm+bounces-48203-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2EDE1A381D5
	for <lists+linux-arm-msm@lfdr.de>; Mon, 17 Feb 2025 12:34:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 020423B54B2
	for <lists+linux-arm-msm@lfdr.de>; Mon, 17 Feb 2025 11:33:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C401F219A79;
	Mon, 17 Feb 2025 11:33:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mainlining.org header.i=@mainlining.org header.b="NOArn+RH"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail.mainlining.org (mail.mainlining.org [5.75.144.95])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B062199E94;
	Mon, 17 Feb 2025 11:33:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=5.75.144.95
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739791996; cv=none; b=VdK+Nb+m8SPm4/i2ZsMVpiFRiXdE4q80M/xrFPNahHir0LiFNBhcQigPn3Jm7wihvggcRkEo7HwrnBY6KMHSdYzz1WQhQBj8ZABfF4G1FfaxPrZdmMqVeNHNmTtrJtDEvXk0dPzjXDoRkNkEbivfx/KHwCCC7ZvCgpEaGU90wjI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739791996; c=relaxed/simple;
	bh=UDT0MbenfufvyYQGcudZnPkdHOYTHrC+tdPUYnJVXt8=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=CkCwVPE9Jo+KqVITB6s5fo/mHGIm29Zq2GawjhgrQDiIIPZIFSrsYgmIzGCEeiWOITJlyoajTBxdDcSvILWa4JKbhrh22OhZitRENmASN8TXJcQuaFJb1oBU8T9T6fSpIvwRNQ+MgeTwfyRVEGj9eSu/ClSovO4Y6RYMKj06qQ4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mainlining.org; spf=pass smtp.mailfrom=mainlining.org; dkim=pass (2048-bit key) header.d=mainlining.org header.i=@mainlining.org header.b=NOArn+RH; arc=none smtp.client-ip=5.75.144.95
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mainlining.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mainlining.org
Received: from [192.168.64.32] (ipbcc3a93c.dynamic.kabel-deutschland.de [188.195.169.60])
	by mail.mainlining.org (Postfix) with ESMTPSA id E93DABB835;
	Mon, 17 Feb 2025 11:33:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mainlining.org;
	s=psm; t=1739791985;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=+uJ7k1VwVXanEeFp3q+wFgfuRJstHzHvr9nezblCw4c=;
	b=NOArn+RHTILkOM4HWj+Vk6G7JooZNTPXO+UuVeFfk5L9MpUhEQzglrvn47jXjy3nlefrcV
	g7PwfZhNgtaBciBRM1m6utZQDhrFEzZwY7tTbnYaNvjZng4Ijak35R3Skoc8OKUkm9MXha
	3azefjex1bckECiw+MHikNstpPGyZNba1+GOQC3uYjO85gRP5YylcSh+oyTL82Bx9uoA0x
	ouoGU4WwiMM/hlg5V7vhea2Lg+YpsjuXvIa6uoPeHUJu8/OLMhIDtftcoYJPuyT0nRWtgo
	dea/wQwtHs3J+uBccgAvwj1+QM+eNALX78IkBNFw0P9DNkl+dvA3/u+9KRBQfQ==
From: David Wronek <david@mainlining.org>
Subject: [PATCH 0/2] Add initial devicetree for Lenovo Xiaoxin Pad Pro 2021
Date: Mon, 17 Feb 2025 12:32:53 +0100
Message-Id: <20250217-lenovo-j716f-v1-0-b749cf4f6cd7@mainlining.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAGUes2cC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDI1MDI0Nz3ZzUvPyyfN0sc0OzNF1zy2QjizQz41TTFDMloJaCotS0zAqwcdG
 xtbUAJ+k0/l4AAAA=
X-Change-ID: 20250217-lenovo-j716f-79c28f63e5d6
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, phone-devel@vger.kernel.org, 
 ~postmarketos/upstreaming@lists.sr.ht, linux@mainlining.org, 
 David Wronek <david@mainlining.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1739791984; l=1049;
 i=david@mainlining.org; s=20250217; h=from:subject:message-id;
 bh=UDT0MbenfufvyYQGcudZnPkdHOYTHrC+tdPUYnJVXt8=;
 b=i8FaGO90Pst/twpaeSaFYfZ26+SBAtva9porE5Xykn+XLRLDw0ppDsM5Y5LexcElv9s1w2i7P
 NhADW0TED19AhSCWhXJBXhd43qtQzlZTITqmdii2k8Jb6fk9DVoRfN9
X-Developer-Key: i=david@mainlining.org; a=ed25519;
 pk=W+lFosPYSaRRoKxJR6X8SrF90iGKs6McC6NWUyNo9Jo=

This series add inital support for the Lenovo Xiaoxin Pad Pro 2021
Android tablet.

The command mode display panel on this tablet is using dual DSI without
DSC. Currently, some extra DPU patches are needed to get the panel
working.

Lenovo has unfortunately not released the downstream sources for this
device. Attempts at contacting Lenovo have been unsuccessful, since this
tablet is primarily being sold in China.

Signed-off-by: David Wronek <david@mainlining.org>
---
David Wronek (2):
      dt-bindings: arm: qcom: Add Lenovo Xiaoxin Pad Pro 2021
      arm64: dts: qcom: sm8250: Add support for Lenovo Xiaoxin Pad Pro 2021

 Documentation/devicetree/bindings/arm/qcom.yaml  |   1 +
 arch/arm64/boot/dts/qcom/Makefile                |   1 +
 arch/arm64/boot/dts/qcom/sm8250-lenovo-j716f.dts | 746 +++++++++++++++++++++++
 3 files changed, 748 insertions(+)
---
base-commit: 253c82b3a2cec22bf9db65645f934fbe095899a3
change-id: 20250217-lenovo-j716f-79c28f63e5d6

Best regards,
-- 
David Wronek <david@mainlining.org>


