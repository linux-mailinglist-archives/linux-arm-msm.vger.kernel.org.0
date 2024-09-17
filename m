Return-Path: <linux-arm-msm+bounces-31896-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4738A97ADD0
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Sep 2024 11:24:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0957F28125A
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Sep 2024 09:24:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E33E315958E;
	Tue, 17 Sep 2024 09:24:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="m1ggbs2D"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B38E3148833;
	Tue, 17 Sep 2024 09:24:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726565072; cv=none; b=MnXQfLRF/mGnQ02gmhF0f7y1X9iXaxjPQKbMoDPzs3uu7GO7QGt8MygsNTsutMhZCITZq9Lv0+GybBcdd87uK+75kGpl26w1eM+ifm2Ss+OHEu7BP7aV3+BkfJaDsGYOPnEXq9wDwVyVcvTBwXJgxP7CD5X10fX0vy04twHg8Sk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726565072; c=relaxed/simple;
	bh=7NYVP76ItUcCnoWbKCu5GU2jp3ayGD7v+JIQAF9P4iI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=DT/1V+6AuLOzDm+1XZGe2bvl6WSrcxXkC/XoSAL2v5rU2zRARpYFBQDiyPEeDbcqICzcVT2CBOOkFEwTx8RJNJKlqJnBqi0XLwIr+dPwPjgf8kKRlot//Lx1MO4/F6cpgaqmaniUK1JGCCsxO/ePL6sKa21eRZIu4P94jX2qNTY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=m1ggbs2D; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 49455C4CEC5;
	Tue, 17 Sep 2024 09:24:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1726565072;
	bh=7NYVP76ItUcCnoWbKCu5GU2jp3ayGD7v+JIQAF9P4iI=;
	h=From:Date:Subject:To:Cc:Reply-To:From;
	b=m1ggbs2DNrHnq83pHj8kgR3iIhccfximOFconTBzQOnarziRBUWmyvG5iJHckT1WC
	 q4ubRWcKx25IAinM6NOnubzC4R1VTNSR+tYs7tXMpPSIyIlx31u9QC3s4mwK5B79Lc
	 GG2iysQCorEKf3VorOUhtpUhJfJKuTwIomvpa65TcIYvwhh6Wo1C3LDtfwMoMuwCf+
	 0FEYPf15NaP2fhz/+HC/Ji9FdaUyk79VmSMgjJy5nZgf7K7rKgGXnmbGmTNWdVqoO2
	 RWXifXY30A3kW3Gs6PLmYyFqH9nRnknz6RAXmBGDohVbPo6UYeMti1Wj9nOn2ANcG+
	 EE6k1WHtrpUFw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3633DC3ABD2;
	Tue, 17 Sep 2024 09:24:32 +0000 (UTC)
From: Vedang Nagar via B4 Relay <devnull+quic_vnagar.quicinc.com@kernel.org>
Date: Tue, 17 Sep 2024 14:54:31 +0530
Subject: [PATCH] arm64: dts: qcom: qcs6460-rb3gen2: enable venus node
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240917-venus_rb3_gen2-v1-1-8fea70733592@quicinc.com>
X-B4-Tracking: v=1; b=H4sIAM5K6WYC/0XMWwqDMBCF4a3IPHdgnHhBt1JETBxtaBs1qVIQ9
 95QC338D5xvhyDeSoA62cHLZoOdXIz0koC5dW4UtH1sYOKMqrTETdwaWq9VO4pjzImlKLknYYJ
 4mr0M9v0Fr83ZXpY1uq9z/LN18kMVLuZZZBWheUzmjmZygx0DEqtqUKQ7rfN6S6E5jg8Ul7zks
 AAAAA==
X-Change-ID: 20240917-venus_rb3_gen2-502e672d0e20
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Vedang Nagar <quic_vnagar@quicinc.com>
X-Mailer: b4 0.15-dev-dedf8
X-Developer-Signature: v=1; a=ed25519-sha256; t=1726565071; l=1015;
 i=quic_vnagar@quicinc.com; s=20240917; h=from:subject:message-id;
 bh=ZOz1XrvGoup5DkTpUjnTAImnT63pIeOYTBQe0DKCiP4=;
 b=4CvhtO+l3KQXE/X5CjMCShcqBxg8W6nsJdtPKY22T4SZhGUtRDkxecxOX88BL8wbEicNPq8/S
 l2ELgUskF39DlugXTrKXvEFEeNn4MP9rvA2UGp2Jn3bDu1lt0FbLuKG
X-Developer-Key: i=quic_vnagar@quicinc.com; a=ed25519;
 pk=GHqLT8NPue4v+CDHbZork8Ps39CBHq345GQKvCZ1glE=
X-Endpoint-Received: by B4 Relay for quic_vnagar@quicinc.com/20240917 with
 auth_id=213
X-Original-From: Vedang Nagar <quic_vnagar@quicinc.com>
Reply-To: quic_vnagar@quicinc.com

From: Vedang Nagar <quic_vnagar@quicinc.com>

Enable the venus node on Qualcomm Rb3gen2 so that the
video decoder will start working.

Signed-off-by: Vedang Nagar <quic_vnagar@quicinc.com>
---
 arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts b/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts
index 0d45662b8028bff475024cff37c33e01d2ee251b..d52a7e0a35bf941c66ccaa00425147781976b359 100644
--- a/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts
+++ b/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts
@@ -790,6 +790,10 @@ &ufs_mem_phy {
 	status = "okay";
 };
 
+&venus {
+	status = "okay";
+};
+
 &wifi {
 	memory-region = <&wlan_fw_mem>;
 };

---
base-commit: 3f52e32445a1f63b788bc8969b7dc2386a80a24d
change-id: 20240917-venus_rb3_gen2-502e672d0e20
prerequisite-change-id: 20240913-qcm6490-clock-configs-0239f30babb5:v1
prerequisite-patch-id: faac726ebdf08240ab0913132beb2c620e52a98a

Best regards,
-- 
Vedang Nagar <quic_vnagar@quicinc.com>



