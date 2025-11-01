Return-Path: <linux-arm-msm+bounces-79995-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id B42FAC27E95
	for <lists+linux-arm-msm@lfdr.de>; Sat, 01 Nov 2025 13:55:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 5E4CE4E4562
	for <lists+linux-arm-msm@lfdr.de>; Sat,  1 Nov 2025 12:55:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8C1EE2F83C2;
	Sat,  1 Nov 2025 12:54:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="eeFyNTAN"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42B472F656A;
	Sat,  1 Nov 2025 12:54:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762001683; cv=none; b=F+VChg8E3+D8Zyp0+y8hKE+0Yq0zjhavp65DXsBo5Oy0kyan3rukUGDI7OhCFw0TsJrUkqCZQ+jvcZJkkFoXxYjw8/SkltTyUUJcgB9Q8P3SwzPJnU48SHCOOtNmodKAgV/yDAXXx3ZIWksVyq8o4jEZ5XScoT/pFZ4hlcpcq5o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762001683; c=relaxed/simple;
	bh=oB6cyoyTr76E1goBC1o90RfhAuwSL0lm4MT5aaQp5h4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=AsPzYZSWLfCCiQ/Va/psNCGiG8fUkHuQlheTKBTzNvNsHflBqWy0Cxpa0N8/1Gz+Fza1jHQJ5tT0hJuHHhoF3+HXSpIXjkbKPZFZ8Db3f+FAu3HLa9t2ueI0jREmj4DxDa39lswUa79YUfj8gbW4QS7JPm/RtUJBJTWoZv/qeyY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=eeFyNTAN; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id A3CC8C4AF0F;
	Sat,  1 Nov 2025 12:54:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1762001682;
	bh=oB6cyoyTr76E1goBC1o90RfhAuwSL0lm4MT5aaQp5h4=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=eeFyNTANMY5ckzXfCkUd1J3Gt/o2DwH56KiYSzxgYA9bhWb0Rj/a6faMFyMBUzq9v
	 BhLwAPk74FRbG/s3V8xbYmuC95s3vW07GefUeRIOLtHnIaRHptYBsxfIlSsxyKiiWJ
	 3ja18wE3a/W0G0RBn08E+k+/eQ/UEyufCM//eTjQUXWQVFUWvaNhS93W8cujhN03X1
	 f+Pkh+1eFvJnAplv4o7e1AlvFtBohLLECAIUpI80Mzz+Pk4GGuMDoOWfRe1jdtBljz
	 7x0rd4UatLhdsZ+xkC/SenEhKfijsM3VVCd2imz8qU4W3I47fa8v7cokqH4B0k8qBL
	 uEZma1nkgiTZw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 99525CCFA00;
	Sat,  1 Nov 2025 12:54:42 +0000 (UTC)
From: Maud Spierings via B4 Relay <devnull+maud_spierings.hotmail.com@kernel.org>
Date: Sat, 01 Nov 2025 13:54:16 +0100
Subject: [PATCH 5/6] arm64: dts: qcom: x1e80100-vivobook-s15: add charge
 limit nvmem
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251101-asus_usbc_dp-v1-5-9fd4eb9935e8@hotmail.com>
References: <20251101-asus_usbc_dp-v1-0-9fd4eb9935e8@hotmail.com>
In-Reply-To: <20251101-asus_usbc_dp-v1-0-9fd4eb9935e8@hotmail.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1762001681; l=986;
 i=maud_spierings@hotmail.com; s=20241110; h=from:subject:message-id;
 bh=aBmU+MBpzJDOfvhbJRvLf5MrSRONaR0yduU16nAFvRY=;
 b=fNTrArf6yUIrnwZEDY1VbngDIfndS5BkP8O+OFYSIg4GuDntgl3xwROZuWW00awAUwOEY8HAu
 e0qY+2A/MF6DoKaD6aIslS6bhjQme8d/DkFxgXlD7opk0UOL9Ks+bys
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
index ad648fcd414a..7dd0d7999fe5 100644
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
2.51.1



