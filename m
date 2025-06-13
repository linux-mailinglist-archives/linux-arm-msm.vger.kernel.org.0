Return-Path: <linux-arm-msm+bounces-61260-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id CE175AD9443
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Jun 2025 20:15:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 8395B1E3E98
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Jun 2025 18:15:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7F68D20F09B;
	Fri, 13 Jun 2025 18:15:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=smankusors.com header.i=@smankusors.com header.b="C1yEc/3+"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from buffalo.tulip.relay.mailchannels.net (buffalo.tulip.relay.mailchannels.net [23.83.218.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3CAAF1FAC50;
	Fri, 13 Jun 2025 18:15:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=23.83.218.24
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749838539; cv=pass; b=p37lokPdmrfIU28AQ/oz98XvqARXBOffUr0r+0Hp9R/iZHefV70b2yHLd58ESPA1JcUzNYvskTShEnzUu1cB5reiSfSQbhw80h9UNbjLmedNPcvUiLyARyWE/sJtTFkQmYaJQhomRV/BPntQK51J7BLbns/vsOTiBu7JwkZXq2E=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749838539; c=relaxed/simple;
	bh=LUrCrKkDYX/6NVCPx+kge0VavIImLKCir7xCevaMB20=;
	h=From:Subject:Message-Id:MIME-Version:Content-Type:To:Cc:Date; b=Z+PJlOYlf7j+/Iw2HVjFqdlZ+WPE6yP+qvMISykxYKkA7K66Y4/DUnPFfB05tOwONbatDWim6SexjepXPIw0OWbdFRwKkw/FHA3p1cllJYD4QFf4YBRFRS+dKYv9xtRIZyTIFP4qp1b+aPv4I4P2NgazkCiW1NvCM8MDqLksuxM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=smankusors.com; spf=pass smtp.mailfrom=smankusors.com; dkim=pass (2048-bit key) header.d=smankusors.com header.i=@smankusors.com header.b=C1yEc/3+; arc=pass smtp.client-ip=23.83.218.24
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=smankusors.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=smankusors.com
X-Sender-Id: hostingeremail|x-authuser|linux@smankusors.com
Received: from relay.mailchannels.net (localhost [127.0.0.1])
	by relay.mailchannels.net (Postfix) with ESMTP id 304984E5CDC;
	Fri, 13 Jun 2025 17:50:23 +0000 (UTC)
Received: from fr-int-smtpout9.hostinger.io (100-125-233-42.trex-nlb.outbound.svc.cluster.local [100.125.233.42])
	(Authenticated sender: hostingeremail)
	by relay.mailchannels.net (Postfix) with ESMTPA id 1DA2F4E60A6;
	Fri, 13 Jun 2025 17:50:14 +0000 (UTC)
ARC-Seal: i=1; s=arc-2022; d=mailchannels.net; t=1749837016; a=rsa-sha256;
	cv=none;
	b=qOBQL5PQwb/dni3S81DpgWibxcJcKUHQWVMIQ9VeMjNzW2nLJnwZc2Yw2GxnzEjjEWP4uV
	Dg4bTNPevHCEzyfyNkzNpBOYuRhSxrXaISPuLJAB0wke2xaOWG8ByAm1ofFqNVxNTKJaS0
	FLYgtNfA++97JPO7MWFHU+qD6XJ+nOmCj9vNVa/+3IZsNva/tX4kfnTGB7lYplIeEC5+c5
	s3uSaL3mooz3lieqSfTS6xUwky3DHFeQ5Mmtg7jxfZ03tXrSmLuKp17YwKN0oBfZEb1ZTR
	dbXwzwF+Oqp9j8agfWoLTIUN4ns3Cklqmc10dJFAlcgg6P1GX97PPhW0hzJ+Qg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mailchannels.net;
	s=arc-2022; t=1749837016;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:dkim-signature;
	bh=AWWl9p0qJrCVlYqvg6a7tQNgHptNPJxlUXIbGVPJHi8=;
	b=PlKFC5IgUp5VJBssKPtZgexemZLkyyRU8GeWb6+xuYVuysUNzpGnnvmq5qi8JKp9dUO3VT
	/5TGGCoUa0C6YSknmBuLNXBAUsmqsq8dqoHJkntsRIVZpgNfNyp0IBjEX2vPoiSja36NLV
	Ajw0PbdNb7LmaFdbHu/PbD/7/PE5D/mGNSGA9/17VpGyZ4ulKpq6adYqnYeNO4w6nK9DQE
	whVYoHQl/QJ60tjKoaAwHlWEJx+ORJ4XC/WDOCtE9VCBRlzeRZ4dUW42Dmg34frkwhpPJe
	kNZ78eVf58dMW1fDnw7dw5qL44lkoksSuc4qd5EcVaJDRnuoe1AU/eGsW5XvDg==
ARC-Authentication-Results: i=1;
	rspamd-5859dfb5d9-9fv9s;
	auth=pass smtp.auth=hostingeremail smtp.mailfrom=linux@smankusors.com
X-Sender-Id: hostingeremail|x-authuser|linux@smankusors.com
X-MC-Relay: Neutral
X-MailChannels-SenderId: hostingeremail|x-authuser|linux@smankusors.com
X-MailChannels-Auth-Id: hostingeremail
X-Plucky-Unite: 2064cfd77a905cba_1749837019652_944131949
X-MC-Loop-Signature: 1749837019652:2132242319
X-MC-Ingress-Time: 1749837019651
Received: from fr-int-smtpout9.hostinger.io (fr-int-smtpout9.hostinger.io
 [89.116.146.43])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384)
	by 100.125.233.42 (trex/7.0.3);
	Fri, 13 Jun 2025 17:50:19 +0000
Received: from [172.17.0.2] (unknown [36.79.97.133])
	(Authenticated sender: linux@smankusors.com)
	by smtp.hostinger.com (smtp.hostinger.com) with ESMTPSA id 4bJn3f418HzH9gKb;
	Fri, 13 Jun 2025 17:50:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=smankusors.com;
	s=hostingermail-a; t=1749837010;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=AWWl9p0qJrCVlYqvg6a7tQNgHptNPJxlUXIbGVPJHi8=;
	b=C1yEc/3+OwYyng96pwwZCWyHwWENG+g1gPnoL/TMz6axh173MPDrVxFn5s4YwyMRG9d3Lv
	oTetBR1dWyLZMpFU3eiVqQVynQztj0jX8eimL4n0KUSbqVgDTW7qEFI3pgA4nVHVUfM8Ol
	FRvxmHlfzCNZt0w+09cOQpdWxqMCxH/LRpkgwt9/LtHtHB9LRodeKxpYJN9FzChtv7sFuw
	h3yet5xlr5MSxGb62XjHe/T2n+W4Rh8qeeAusWYZRRv/hrLBjopXFPfc3gDXiLnyx53Rl9
	6T/ZBnFkl1zER2xtyVeP7v3Z0oNkOUycVUuL21dBwcAjTUdM2hcATHOA9yH3wA==
From: Antony Kurniawan Soemardi <linux@smankusors.com>
Subject: [PATCH 0/5] Add support for Sony Xperia SP
Message-Id: <20250614-msm8960-sdcard-v1-0-ccce629428b6@smankusors.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAHlkTGgC/x3MMQqAMAxA0atIZgNpUVGvIg7FRs1QlQREKN7d4
 viG/zMYq7DBWGVQvsXkPApcXcGyh2NjlFgMnnxLHTlMlvqhI7S4BI3I3kVuhhB6bqBEl/Iqzz+
 c5vf9AFKgjRNgAAAA
X-Change-ID: 20250601-msm8960-sdcard-e21de49aa8e4
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Antony Kurniawan Soemardi <linux@smankusors.com>, 
 Max Shevchenko <wctrl@proton.me>, Rudraksha Gupta <guptarud@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1749837006; l=1855;
 i=linux@smankusors.com; s=20250609; h=from:subject:message-id;
 bh=LUrCrKkDYX/6NVCPx+kge0VavIImLKCir7xCevaMB20=;
 b=IVUFmJPqR5Ky4KGfiZfSL2rObsRm49tahel7j2dGjq3aOVye0N7qlBmpTUX5OtJbcV0lYiHQf
 vvlJdmSYDm2BtJL2fSqjeWhj5h3EcwOqLMAliWM1O0IQj9LK2b9Cc2R
X-Developer-Key: i=linux@smankusors.com; a=ed25519;
 pk=65wTy06fJl2/h/EJwjr704YG+yjHFhZObJBWzzK+N00=
Date: Fri, 13 Jun 2025 17:50:06 +0000 (UTC)
X-CM-Analysis: v=2.4 cv=Vv1xAP2n c=1 sm=1 tr=0 ts=684c64d2 a=/sUT9SOQbq9tkq2xjVjq6Q==:117 a=/sUT9SOQbq9tkq2xjVjq6Q==:17 a=IkcTkHD0fZMA:10 a=wxLWbCv9AAAA:8 a=2cXSbqf0HCtMDuU6HZcA:9 a=QEXdDO2ut3YA:10 a=QJY96suAAestDpCc5Gi9:22
X-CM-Envelope: MS4xfIoD/sm9VMovFuu71Wfr7lPiGO9nVd4gBakO7WWSwOU9RstjhuA4lwp8SIYgISJrzh5F2+gmg6i8zaIUvhmGqciHbU00tPVrA8rFQcdHrpWxB0KakOkO Cl8au8NKKZHwHn9bV3YcbHl5P6k3UHTpD+dPwwozYb16ZSfiCBuIngEuZLZ9Kw5soCo91xZrbkDcu+8Px4L2OI1C75jO2TBKn9U3NNk/oNefVe+HpyQ1vFwP oKpuB3Dro/nSUo1NqiZffLShQAxwyoMaoYMVL4nV8KxBgljFNrCIn8JKVfke18KoOwkyEWJ50PwIXdefhNJbhjD2HtdTMIutzigrnyN92xjYHTjsRHUWzaAV vgndqDdHVtH/KAT4stR60MD448e3sQGl2UfgsZWtGLR5Mw2Ac/eVkxiFeAAcJaMmsvjZSVdCCZHhBlihFXhb7NefHDucV2FlkuVZ+aprm654kY0rkiAhkuti S7s9kacH67YU8+h8nY1Vd+9m/arRkCcDzalbqubDPn94jG6cpDk7GJMKxSs=
X-AuthUser: linux@smankusors.com

This patch series adds initial support for the Sony Xperia SP (codename:
sony-huashan), a smartphone based on the Qualcomm MSM8960T SoC. The
MSM8960T is a variant of the MSM8960 featuring an upgraded GPU (Adreno
320 instead of Adreno 225) and a slightly overclocked CPU (1.7GHz
instead of 1.5GHz).

The following changes are included:

1. Adding sdcc3 pinctrl states to ensure micro SD card functionality.
2. Adding gsbi8 node and serial configuration for the MSM8960 SoC.
3. Disabling unused gsbi1 and gsbi5 nodes in the MSM8960 SoC device
   tree.
4. Documentation for the Sony Xperia SP.
5. Initial device tree support for the Sony Xperia SP, including serial
   console, GPIO keys, PM8921 keypad, eMMC, micro SD card, and USB OTG.

This patch series has been tested on the non-LTE variant of the
Xperia SP.

Signed-off-by: Antony Kurniawan Soemardi <linux@smankusors.com>
---
Antony Kurniawan Soemardi (5):
      ARM: dts: qcom: msm8960: add sdcc3 pinctrl states
      ARM: dts: qcom: msm8960: add gsbi8 and its serial configuration
      ARM: dts: qcom: msm8960: disable gsbi1 and gsbi5 nodes in msm8960 dtsi
      dt-bindings: arm: qcom: add Sony Xperia SP
      ARM: dts: qcom: add device tree for Sony Xperia SP

 Documentation/devicetree/bindings/arm/qcom.yaml    |   7 +
 arch/arm/boot/dts/qcom/Makefile                    |   1 +
 arch/arm/boot/dts/qcom/qcom-msm8960-pins.dtsi      |  38 +++
 .../dts/qcom/qcom-msm8960-samsung-expressatt.dts   |   5 +
 .../boot/dts/qcom/qcom-msm8960-sony-huashan.dts    | 361 +++++++++++++++++++++
 arch/arm/boot/dts/qcom/qcom-msm8960.dtsi           |  26 ++
 6 files changed, 438 insertions(+)
---
base-commit: 8630c59e99363c4b655788fd01134aef9bcd9264
change-id: 20250601-msm8960-sdcard-e21de49aa8e4

Best regards,
--
Antony Kurniawan Soemardi <linux@smankusors.com>


