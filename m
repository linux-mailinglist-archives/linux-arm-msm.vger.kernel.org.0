Return-Path: <linux-arm-msm+bounces-81966-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id AC5AFC612FB
	for <lists+linux-arm-msm@lfdr.de>; Sun, 16 Nov 2025 11:55:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7DA443B9964
	for <lists+linux-arm-msm@lfdr.de>; Sun, 16 Nov 2025 10:52:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 550892BE058;
	Sun, 16 Nov 2025 10:52:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="uDTn4cUT"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0017C29E0F8;
	Sun, 16 Nov 2025 10:52:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763290346; cv=none; b=aHqT9lTfrAwO9IjRIkaOPMOrg6at481m/eih2DuX9hqm9PX9Elz4L8QA0nHzzb23MXrRAxx9oRzXedkMmOW0xhmFFCUKlQmAO7sjuVmfFeQdflCa4dsAgL3qB5RTJMyp7piwPHDNo6DPynYpGu29PIc37qxskjPJm8MD8V0Lrqs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763290346; c=relaxed/simple;
	bh=Co2g8a5emo5xzV/FhXcXnRySq+5Br3h6715hsx+oi+4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=EgcQYRdnsoUNyBtSqL3KmTerq9xuC5K/A72eVR4kcrUV+tBsim2BYHe2bTGk6Wxml/F6LNjXQ7Uizp2kgKtqsnN+GApVvq+EpeiKBfP8cRlWT6ReFADKoEmOXD1FI+T87lwZ23B7EeMrt9EsdZ5OUJ5jrqR1cwBYsZqs2F9kvAo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=uDTn4cUT; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 81C8FC2BCB1;
	Sun, 16 Nov 2025 10:52:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763290345;
	bh=Co2g8a5emo5xzV/FhXcXnRySq+5Br3h6715hsx+oi+4=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=uDTn4cUTj2lPvMDEfxgCflszMg1XAwSAkNUlzJ75Hkbo6NFwflXmVgK89pp+1cktB
	 sSbS/7Yv/zf1CEjkiWI/Y3oCKRUn8bNV8FqrrBtEBUAFkDo3cJ1S4Y1lmd9SuuAjbk
	 Bapvr6neI0dEfbJylXcQqAfgRmTE6okThmw5TnowOb/k8WOsTzichddvmIayt87cbU
	 aGcmFaqBu2zM59jNILzmRiJYrb1YszEWPsCHPmuMx+y5aLtrMK2ay8uZAvprYNKMd+
	 fFbV5e1RVet9crOzMBI9qQLWXuSxCvXCSzqfF7dskAaesFRQQpW0bhpdDYO2+sZqSy
	 GD2VsBBGcQYow==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 760D5CEBF61;
	Sun, 16 Nov 2025 10:52:25 +0000 (UTC)
From: Maud Spierings via B4 Relay <devnull+maud_spierings.hotmail.com@kernel.org>
Date: Sun, 16 Nov 2025 11:52:10 +0100
Subject: [PATCH v2 5/6] arm64: dts: qcom: x1e80100-vivobook-s15: add charge
 limit nvmem
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251116-asus_usbc_dp-v2-5-cc8f51136c9f@hotmail.com>
References: <20251116-asus_usbc_dp-v2-0-cc8f51136c9f@hotmail.com>
In-Reply-To: <20251116-asus_usbc_dp-v2-0-cc8f51136c9f@hotmail.com>
To: Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 Maud Spierings <maud_spierings@hotmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1763290343; l=986;
 i=maud_spierings@hotmail.com; s=20241110; h=from:subject:message-id;
 bh=S7khc0pz3NH8DFhJ1OMQqmNbVvrWJikvJHbCdcMIQZ8=;
 b=dTuSFxz6eEnIE5MbF6iT81RSic2DY/7Auqp0xEB5/VUzoiMpk6GY3NzA88AY0VJNsYcrAr9Gk
 jLRLHS73S5ADI/hwHAuU9PP9S/iwqsxqkVHeb6q4itk60oLFCCrnZKc
X-Developer-Key: i=maud_spierings@hotmail.com; a=ed25519;
 pk=CeFKVnZvRfX2QjB1DpdiAe2N+MEjwLEB9Yhx/OAcxRc=
X-Endpoint-Received: by B4 Relay for maud_spierings@hotmail.com/20241110
 with auth_id=273
X-Original-From: Maud Spierings <maud_spierings@hotmail.com>
Reply-To: maud_spierings@hotmail.com

From: Maud Spierings <maud_spierings@hotmail.com>

Add nvmem cells for getting charge control thresholds if they have
been set previously.

Signed-off-by: Maud Spierings <maud_spierings@hotmail.com>
---
 arch/arm64/boot/dts/qcom/x1e80100-asus-vivobook-s15.dts | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/x1e80100-asus-vivobook-s15.dts b/arch/arm64/boot/dts/qcom/x1e80100-asus-vivobook-s15.dts
index d5794189b98b..2d9b812d299e 100644
--- a/arch/arm64/boot/dts/qcom/x1e80100-asus-vivobook-s15.dts
+++ b/arch/arm64/boot/dts/qcom/x1e80100-asus-vivobook-s15.dts
@@ -82,6 +82,12 @@ pmic-glink {
 			     "qcom,pmic-glink";
 		orientation-gpios = <&tlmm 121 GPIO_ACTIVE_HIGH>,
 				    <&tlmm 123 GPIO_ACTIVE_HIGH>;
+		nvmem-cells = <&charge_limit_en>,
+			      <&charge_limit_end>,
+			      <&charge_limit_delta>;
+		nvmem-cell-names = "charge_limit_en",
+				   "charge_limit_end",
+				   "charge_limit_delta";
 		#address-cells = <1>;
 		#size-cells = <0>;
 

-- 
2.51.2



