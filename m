Return-Path: <linux-arm-msm+bounces-68787-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 8062EB2297E
	for <lists+linux-arm-msm@lfdr.de>; Tue, 12 Aug 2025 16:01:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 64C2F564599
	for <lists+linux-arm-msm@lfdr.de>; Tue, 12 Aug 2025 13:47:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6200C284B20;
	Tue, 12 Aug 2025 13:47:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bSixSqmb"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32F1228467D;
	Tue, 12 Aug 2025 13:47:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755006450; cv=none; b=CJ5IBxbuS6RakmftT7RTGJyU6O36QVzWsG6eq2CB+J9okHWloAr5JSl52A546XtrfxNMMkFiO1cA0TjNxu9ID5dmy3OSawMgWiZG6fVM2Zl/H44DKqxn1VsPjz/4Ty5lSAdtv65B7J2us3gUCKVzrssbccWpiCdN00p3hBP3MLE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755006450; c=relaxed/simple;
	bh=ygSBFak7HTq/95jo9PWSCAhd/zWvgp4pHUCRLWIzguQ=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=LdkILp8TnXSGnQHAGn/2h4dRzGOWl9uxKB+3QTMcSoC4DC7xMv9aCeikAniCAMWqA7NpEfPJXugTSxC8TwREPWc0+pAgV7sHQkvjJ8WjUooy8f5VcGHnDD4pGBBavXBaeZcv6VPXkUyeW8ksc9bJ0MXO933bvdDAdhsIw7mAWwg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bSixSqmb; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 05353C4CEF0;
	Tue, 12 Aug 2025 13:47:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1755006449;
	bh=ygSBFak7HTq/95jo9PWSCAhd/zWvgp4pHUCRLWIzguQ=;
	h=From:Subject:Date:To:Cc:From;
	b=bSixSqmbxg7Xpp+dYHTvmhBsJoJ171OsmBJWJeGdc2+v58jpQdR1cGQ3/GRaBVyjz
	 12/HT8nHLc3W7km9HBIDUIdq7e+SbfD6qoOKjaSpjIk9hMbiVoWtXiePkVbctKWMQz
	 mkldtJbt5KlR/Q+h0JLVOT8MWfH6CGdtwJRIarXZ23eqM29w3A2UissjnTeyFARYYx
	 fImY5OWPK1zJZKgP9wpI92z6QTLhS4WgJgHPEmPuHNR/7xjZWHy+GvmQEYTD+0rms3
	 6Z3rNH5h7DECf1GZjxyA9Cs9ILPnJGfGto2niuNb79cVNuaVaGHqG09EH29NV/KqH6
	 Gb0yyEe7WWR/A==
From: Konrad Dybcio <konradybcio@kernel.org>
Subject: [PATCH 0/2] Surface Laptop PCIe3 supplies + Wi-Fi
Date: Tue, 12 Aug 2025 15:47:22 +0200
Message-Id: <20250812-topic-romulus_wifi_pci-v1-0-2adbed1b1f1d@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAOpFm2gC/x3M2wqEIBRG4VeJfZ2gQjX1KhERuq0fphTtMBC9+
 0iX38VaNyWO4ERdcVPkEwl+y1BlQWaZtpkFbDZpqSv5UVrsPsCI6Nfje6TxgsMYDERdS56ctU3
 VKspxiOzwe8f98Dx/Pb8MPmgAAAA=
X-Change-ID: 20250812-topic-romulus_wifi_pci-660eafdd7591
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: Marijn Suijten <marijn.suijten@somainline.org>, 
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1755006446; l=646;
 i=konrad.dybcio@oss.qualcomm.com; s=20230215; h=from:subject:message-id;
 bh=ygSBFak7HTq/95jo9PWSCAhd/zWvgp4pHUCRLWIzguQ=;
 b=mjCtTj/uW51Ll7+P0OWNaIXaMeffTbCS1WyW5kNb1yiAjdV8P4TUXKwRDO4tXIdO5jFsF7NDX
 UyH3ozAlgDVBzbN0/+ralFp5U/yRPfrtksWR76Edif0IjT7Y3jI+ZZ/
X-Developer-Key: i=konrad.dybcio@oss.qualcomm.com; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=

Trivial changes (similar to other X1 boards), I've been running them
for a couple months without much problems.

Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
---
Konrad Dybcio (2):
      arm64: dts: qcom: x1e80100-romulus: Describe PCIe power supplies
      arm64: dts: qcom: x1e80100-romulus: Add WCN7850 Wi-Fi/BT

 .../boot/dts/qcom/x1e80100-microsoft-romulus.dtsi  | 214 +++++++++++++++++++++
 1 file changed, 214 insertions(+)
---
base-commit: 2674d1eadaa2fd3a918dfcdb6d0bb49efe8a8bb9
change-id: 20250812-topic-romulus_wifi_pci-660eafdd7591

Best regards,
-- 
Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>


