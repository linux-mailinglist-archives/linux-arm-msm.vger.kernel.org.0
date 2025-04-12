Return-Path: <linux-arm-msm+bounces-54107-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E2DEA86DA8
	for <lists+linux-arm-msm@lfdr.de>; Sat, 12 Apr 2025 16:23:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 9E7B817F8F8
	for <lists+linux-arm-msm@lfdr.de>; Sat, 12 Apr 2025 14:23:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AE0561AAA29;
	Sat, 12 Apr 2025 14:23:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=armlinux.org.uk header.i=@armlinux.org.uk header.b="C4CxLhel"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E2E719CD1E;
	Sat, 12 Apr 2025 14:23:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=78.32.30.218
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744467802; cv=none; b=nPNUzM+/DVMt7dvWytPCeO0S0jmf4869Jb+NhSqa4Ojej8geI33qsu2+OcXoZsMwhPfSB5AkYAHLbyKGs3a8lmcGRBws2tzCa0PuZtAILrD6gQEZcO3JpWOQxo8UiXfueRPXGIfcjju/dzdc/nB6E+bzm1G++WSPe8prmJt8ioE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744467802; c=relaxed/simple;
	bh=aEBBU2GEMWoiPu+DI9azMwB5uXVdcwmysCqfUy9EnU4=;
	h=From:To:Cc:Subject:MIME-Version:Content-Disposition:Content-Type:
	 Message-Id:Date; b=hX61b1tF3Wt3HmfutH4ocDmMlPs7eID50IZS3MFcQAxixp3TBzaAj6fVwSaTqU0vahfvUFmn9CJExLtP2IuzrcPVUGl/Gk7scachpNgDJF4zsM3hfjvKwfHi3bAsI/oq1fhvZdrwQbwLvxF9gTNasnLXGJljNPiPHpFF3uNLT6U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=armlinux.org.uk; spf=none smtp.mailfrom=armlinux.org.uk; dkim=pass (2048-bit key) header.d=armlinux.org.uk header.i=@armlinux.org.uk header.b=C4CxLhel; arc=none smtp.client-ip=78.32.30.218
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=armlinux.org.uk
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=armlinux.org.uk
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:Reply-To:Content-ID
	:Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:
	Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=Qq48PaNhiydZ4XhZssZQP/FuF1+9caRFDHcLr7t/Kb0=; b=C4CxLhelr/9KI8lmFTOAL/EJLQ
	TBYVMBGsvZMCN1LIUYFCJ52zySRQV9chGAJufrtHH6D0HsDz5v6dKSnXp0/JFyERZMl7Em700MZiK
	D6Wy8l7KJkNsLRkk9V99q+qwGL4MuECgv9EFWfQVHU+zFMq0hsP7g5EQIHwr9J0XtXdRcDC/c0ZED
	Lap3pMsgZja3PYJfiOfBYQTl8J/g2hRMhzW+clKoR6r4EeqfjnPWiaZIbqm0LSa9590TfcPjyF1eB
	UtsKQxqYC0M/atGqmP2pu3xuNQ2/FbPZ4fVWFuGgii+9Ge/bHq+5E8B2uZberUb56NthoXo3eZZUj
	Q6vAGCNg==;
Received: from e0022681537dd.dyn.armlinux.org.uk ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:48302 helo=rmk-PC.armlinux.org.uk)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <rmk@armlinux.org.uk>)
	id 1u3blO-0004do-00;
	Sat, 12 Apr 2025 15:23:18 +0100
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.94.2)
	(envelope-from <rmk@rmk-PC.armlinux.org.uk>)
	id 1u3bkm-000Epw-QU; Sat, 12 Apr 2025 15:22:40 +0100
From: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
To: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>
Cc: Andrew Lunn <andrew@lunn.ch>,
	Conor Dooley <conor+dt@kernel.org>,
	devicetree@vger.kernel.org,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-arm-msm@vger.kernel.org,
	netdev@vger.kernel.org,
	Rob Herring <robh@kernel.org>
Subject: [PATCH] arm64: dts: qcom: remove max-speed = 1G for RGMII
 for ethernet
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="utf-8"
Message-Id: <E1u3bkm-000Epw-QU@rmk-PC.armlinux.org.uk>
Sender: Russell King <rmk@armlinux.org.uk>
Date: Sat, 12 Apr 2025 15:22:40 +0100

The RGMII interface is designed for speeds up to 1G. Phylink already
imposes the design limits for MII interfaces, and additional
specification is unnecessary. Therefore, we can remove this property
without any effect.

Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
---
 arch/arm64/boot/dts/qcom/sa8155p-adp.dts  | 1 -
 arch/arm64/boot/dts/qcom/sa8540p-ride.dts | 2 --
 2 files changed, 3 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sa8155p-adp.dts b/arch/arm64/boot/dts/qcom/sa8155p-adp.dts
index 9e9c7f81096b..9d077930b135 100644
--- a/arch/arm64/boot/dts/qcom/sa8155p-adp.dts
+++ b/arch/arm64/boot/dts/qcom/sa8155p-adp.dts
@@ -326,7 +326,6 @@ &ethernet {
 
 	phy-handle = <&rgmii_phy>;
 	phy-mode = "rgmii";
-	max-speed = <1000>;
 
 	mdio {
 		compatible = "snps,dwmac-mdio";
diff --git a/arch/arm64/boot/dts/qcom/sa8540p-ride.dts b/arch/arm64/boot/dts/qcom/sa8540p-ride.dts
index 177b9dad6ff7..bc9ae093fc50 100644
--- a/arch/arm64/boot/dts/qcom/sa8540p-ride.dts
+++ b/arch/arm64/boot/dts/qcom/sa8540p-ride.dts
@@ -155,7 +155,6 @@ &ethernet0 {
 	snps,mtl-rx-config = <&ethernet0_mtl_rx_setup>;
 	snps,mtl-tx-config = <&ethernet0_mtl_tx_setup>;
 
-	max-speed = <1000>;
 	phy-handle = <&rgmii_phy>;
 	phy-mode = "rgmii-txid";
 
@@ -257,7 +256,6 @@ &ethernet1 {
 	snps,mtl-rx-config = <&ethernet1_mtl_rx_setup>;
 	snps,mtl-tx-config = <&ethernet1_mtl_tx_setup>;
 
-	max-speed = <1000>;
 	phy-mode = "rgmii-txid";
 
 	pinctrl-names = "default";
-- 
2.30.2


