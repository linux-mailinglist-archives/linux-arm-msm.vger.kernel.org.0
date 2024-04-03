Return-Path: <linux-arm-msm+bounces-16253-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1EAC7896D05
	for <lists+linux-arm-msm@lfdr.de>; Wed,  3 Apr 2024 12:45:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C88DB28E5A0
	for <lists+linux-arm-msm@lfdr.de>; Wed,  3 Apr 2024 10:45:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8FE79139CF3;
	Wed,  3 Apr 2024 10:44:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=posteo.de header.i=@posteo.de header.b="JA9p8GO3"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mout02.posteo.de (mout02.posteo.de [185.67.36.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28089138494
	for <linux-arm-msm@vger.kernel.org>; Wed,  3 Apr 2024 10:44:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.67.36.66
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712141096; cv=none; b=T4wUes+OMQWiVJKue/geC29zrqlCn6SC4758NJPSs/Bq0TGuphWHjhf00AtkbLCGlbQC45RPq2MSTvYXHSLjnBsmEcgaIaq/bKuGRY/tYGGOs/s2MvJap2d5ACxy5NbuVP0BCtkk1szM+f0FIA/EWE/UqHxaNVw5CcElZ0KHFqY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712141096; c=relaxed/simple;
	bh=0S8b1fvqHo8aPEbPXCG10GqehUDxwKWnBk3bILVaB3M=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=FfM7pOA2vcRDtobx4DsAQ207qw00riK60QVb2Ih8wbV5MEiGbdtNSAqW3jFhajKvlW8bm0FP16vWn67gCU8B2WvjnMWiHxwqREhd74sCe14lj9hvI09GKdT4jrAWsu0QcOyPtoADf+SzEqk0TI6NzirwiGpdixAouH2ILjAiJgQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=posteo.de; spf=pass smtp.mailfrom=posteo.de; dkim=pass (2048-bit key) header.d=posteo.de header.i=@posteo.de header.b=JA9p8GO3; arc=none smtp.client-ip=185.67.36.66
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=posteo.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=posteo.de
Received: from submission (posteo.de [185.67.36.169]) 
	by mout02.posteo.de (Postfix) with ESMTPS id 37619240101
	for <linux-arm-msm@vger.kernel.org>; Wed,  3 Apr 2024 12:44:52 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=posteo.de; s=2017;
	t=1712141092; bh=0S8b1fvqHo8aPEbPXCG10GqehUDxwKWnBk3bILVaB3M=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:
	 Content-Transfer-Encoding:Autocrypt:OpenPGP:From;
	b=JA9p8GO3GBevnnVCnHQNcx4SbpnrIRO24TjL4IT33GPylQITt5+njniat916/+WKM
	 R7p04+91TbzknBIhgGw2jXVgnVnrd5RC4E/avFjHTTXGmyTdcTgGSf1Nd9v53SOYAv
	 j5RsWrgUdA/yc1oAYI98giqKINvByBIYON5PWPdJZVO/sMND/PpF+kxy8+EhJ+HFJk
	 3t3+ASNJUIap3ZO6z6fj/BZ3vBZgbxre3XTv0yhlW0xyoKLoRGi8aG7wUWWCga9nVa
	 tDVhXg+oQM3UJkH08Lk1vG1u6QdbefP5Dd4jpGQScSAcr7bqZreNLEA9EjXQSu5CQf
	 Te83SEmeZ0LZw==
Received: from customer (localhost [127.0.0.1])
	by submission (posteo.de) with ESMTPSA id 4V8hGB720hz9rxL;
	Wed,  3 Apr 2024 12:44:50 +0200 (CEST)
From: Alexander Reimelt <alexander.reimelt@posteo.de>
To: andersson@kernel.org,
	pvorel@suse.cz,
	konrad.dybcio@linaro.org,
	robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	conor+dt@kernel.org
Cc: linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 0/2] arm64: Add basic support for LG H815
Date: Wed,  3 Apr 2024 10:43:28 +0000
Message-ID: <20240403104415.30636-1-alexander.reimelt@posteo.de>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Autocrypt: addr=alexander.reimelt@posteo.de;
  keydata=xjMEZg0fSRYJKwYBBAHaRw8BAQdAIcaNTdj3NWDe5HQPCUs6oYyQygAJWP9LCzhr+C7RwMrNG2Fs
  ZXhhbmRlci5yZWltZWx0QHBvc3Rlby5kZcKZBBMWCgBBFiEEM+Wy6sI/mP5S0zIFHqi3OKk8uRIF
  AmYNH0kCGwMFCQWjo9cFCwkIBwICIgIGFQoJCAsCBBYCAwECHgcCF4AACgkQHqi3OKk8uRJ8ogD9
  EVg4zgfmC2SqXCgms6LETAzVX4CrAS8yMhyd7Md921cA/R8lhm9B96RYgA7MvFPFJb1T6JFY75Jg
  QLXrtIE5llwHzjgEZg0fSRIKKwYBBAGXVQEFAQEHQBGDuxZLOTvppxyM4G18fSR6xzT0xkkPOia7
  Bh6L1vAAAwEIB8J+BBgWCgAmFiEEM+Wy6sI/mP5S0zIFHqi3OKk8uRIFAmYNH0kCGwwFCQWjo9cA
  CgkQHqi3OKk8uRIa1wD8CZDdCAKXstgXY96eeSSP7MecEF5TBdmWOiVgjlEIpoEA/RnGuDaj06B1
  F51wyGAjYXSmn5qFoNHu3yXyLUkFz1ME
OpenPGP: url=https://posteo.de/keys/alexander.reimelt@posteo.de.asc

Hello,

These patches add initial support for the LG H815.
They are enough to boot the device on postmarketOS
and have some basic functionality. Connecting to the
device over USB networking via ssh, buttons, SD-Card,
eMMC and regulators work. The dtb_checker shows some
warnings, but they come from the msm8994.dtsi.

For CPU bring up lk2nd is required. The DMA controller
module fails to load and from time to time the SMD clock
driver fails.

But I hope to prevent duplicate work and make it more accessible.

Best regards
Alex

Alexander Reimelt (2):
  dt-bindings: arm: qcom: Add LG G4 (h815)
  arm64: dts: qcom: Add basic support for LG G4 (H815)

 .../devicetree/bindings/arm/qcom.yaml         |   1 +
 arch/arm64/boot/dts/qcom/Makefile             |   1 +
 arch/arm64/boot/dts/qcom/msm8992-lg-h815.dts  | 422 ++++++++++++++++++
 3 files changed, 424 insertions(+)
 create mode 100644 arch/arm64/boot/dts/qcom/msm8992-lg-h815.dts

-- 
2.44.0


