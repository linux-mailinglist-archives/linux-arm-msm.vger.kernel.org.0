Return-Path: <linux-arm-msm+bounces-56680-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F148AA863E
	for <lists+linux-arm-msm@lfdr.de>; Sun,  4 May 2025 13:51:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 0FA651893FC6
	for <lists+linux-arm-msm@lfdr.de>; Sun,  4 May 2025 11:52:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BB3A52F22;
	Sun,  4 May 2025 11:51:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=postmarketos.org header.i=@postmarketos.org header.b="eUa9UHmI"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from out-177.mta0.migadu.com (out-177.mta0.migadu.com [91.218.175.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 285A4BE46
	for <linux-arm-msm@vger.kernel.org>; Sun,  4 May 2025 11:51:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746359509; cv=none; b=MB6dB6NviEP31B54HL5wCFRPIBybdr8ZlZRshnberS6981jixfr+Hd6E2yqJ02GYbULTaTyRAiQTNDGqD5ezKLtmghFOBY4Q+sn5sH1A1xDzoSKZIiEEmYdy2kRiCzSde+yyeiZZcbdtPjI8rnEO2kWGQc+1vDuLpyLjE+2JG0M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746359509; c=relaxed/simple;
	bh=u0804QVAGmcXwjwp3po7cxMRu0aamQ6heTTl2p+MiD0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=NtXvs50vwIM2bmyFMh5aUdmj6aNWqV4VCtKG9jYbRL0MIxiO+uhGRalPC2JsAvRCpC/eLmy+x3WnRNkUBSc9fWMlJRLzfygiOwhJxAUMIhamgYzSx4j7hAU/yQr6nhl8BT7D3VM2UYlImQjDtDolPiEdSDgkyKv1so12iUNuk1Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=postmarketos.org; spf=pass smtp.mailfrom=postmarketos.org; dkim=pass (2048-bit key) header.d=postmarketos.org header.i=@postmarketos.org header.b=eUa9UHmI; arc=none smtp.client-ip=91.218.175.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=postmarketos.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=postmarketos.org
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=postmarketos.org;
	s=key1; t=1746359504;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=dsCLlaxW5Ry4SD7QVSXb//q8OL/Z72WZhoaVT84ZE4k=;
	b=eUa9UHmIq83v7LNGquwIZmYWyWTBNotgrbliZPrYVrW0Fm3t+b6RCl8cGZEMoMEkTFIy/w
	s7VoldfLoHK4Fq9UkhyygMeF3wgbO6FDPFhEcrIkwSbyyftKw/Qp8cwJlktI0Ae3r8F1pJ
	PVBQMmQkOag9PM8ygVCBWbYICQFLqrTC/WGWoYQHHqA5tUOT5WEVzfXkxQ27cOq3WQVEcl
	c7uo80hOd1bo/LaKKsz/VsB0x0wtzyaA6wpADLyymNTD7RifpY0l+IKzjcQdk0F5aXYaPM
	fQsjmqH+EvnNqgqcMOvEUzRx/j7mtnohmJMpcP4z6q/7jJiC/amWzoOmZ++/Kw==
From: Alexey Minnekhanov <alexeymin@postmarketos.org>
To: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Dmitry Baryshkov <lumag@kernel.org>
Cc: Dang Huynh <danct12@riseup.net>,
	Alexey Minnekhanov <alexey.min@gmail.com>,
	Marijn Suijten <marijn.suijten@somainline.org>,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	~postmarketos/upstreaming@lists.sr.ht,
	Alexey Minnekhanov <alexeymin@postmarketos.org>
Subject: [PATCH 0/3] Elminate all DTBs check warnings for SDM630/660 boards
Date: Sun,  4 May 2025 14:51:17 +0300
Message-ID: <20250504115120.1432282-1-alexeymin@postmarketos.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT

Run the following:

 make -j1  CHECK_DTBS=y 'qcom/sdm630-*.dtb' \
         'qcom/sdm636-*.dtb' 'qcom/sdm660-*.dtb' \
         'qcom/sda660-*.dtb'

Before:

 Observe multiple warning about memory-region is too short,
 one about 'vdda-pll-supply' is a required property, two
 about 'clocks' is a dependency of 'clock-names'. Fix them all!

After:

 SCHEMA  Documentation/devicetree/bindings/processed-schema.json
 DTC [C] arch/arm64/boot/dts/qcom/sdm630-sony-xperia-ganges-kirin.dtb
 DTC [C] arch/arm64/boot/dts/qcom/sdm630-sony-xperia-nile-discovery.dtb
 DTC [C] arch/arm64/boot/dts/qcom/sdm630-sony-xperia-nile-pioneer.dtb
 DTC [C] arch/arm64/boot/dts/qcom/sdm630-sony-xperia-nile-voyager.dtb
 DTC [C] arch/arm64/boot/dts/qcom/sdm636-sony-xperia-ganges-mermaid.dtb
 DTC [C] arch/arm64/boot/dts/qcom/sdm660-xiaomi-lavender.dtb
 DTC [C] arch/arm64/boot/dts/qcom/sda660-inforce-ifc6560.dtb

No errors, no warnings.

Alexey Minnekhanov (3):
  arm64: dts: qcom: sdm630: Add modem metadata mem
  arm64: dts: qcom: sdm660-lavender: Add missing USB phy supply
  arm64: dts: qcom: sda660-ifc6560: Fix dt-validate warning

 arch/arm64/boot/dts/qcom/sda660-inforce-ifc6560.dts | 2 ++
 arch/arm64/boot/dts/qcom/sdm630.dtsi                | 8 +++++++-
 arch/arm64/boot/dts/qcom/sdm660-xiaomi-lavender.dts | 1 +
 3 files changed, 10 insertions(+), 1 deletion(-)

-- 
2.49.0


