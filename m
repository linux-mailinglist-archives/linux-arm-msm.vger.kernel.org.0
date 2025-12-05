Return-Path: <linux-arm-msm+bounces-84494-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id D575ECA7DD5
	for <lists+linux-arm-msm@lfdr.de>; Fri, 05 Dec 2025 14:59:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 1D02F301C6FA
	for <lists+linux-arm-msm@lfdr.de>; Fri,  5 Dec 2025 13:59:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C7175335556;
	Fri,  5 Dec 2025 13:59:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="OJ1F3P9t"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9102B29AB15;
	Fri,  5 Dec 2025 13:59:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764943152; cv=none; b=HQhiZJa1izuqe5SaaC7s0BxmUcHy437Dr+w42fRPVKlX4HW8GM6cXAYb+CUpBjqQlz3j04tqh97iXA9jTxK5fqiDPxU7AR+vYU9D23oS9R50FKiCPl9isxErgDTKJtT6xvWyn6V38O3e9lgceDsYprac/F+ZofcO06EjCb9RKzs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764943152; c=relaxed/simple;
	bh=KQnBzHPTZX34VKmeFusEgVwCSs1xMPQQjgIziM5yRWU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=bJXCx1r/8j15SGSlRsyOR+/3QWzOh3erUQsPzqugF9J7riAN1LWuMU6XF7726t/NNpTkM0NOQGacZbpg5U0uOHocH8WeQhF2iIqvTM9plPsoYF+oe5USsMtD7OhvB1hHeuhHY57PgLPZrIdcUO8CKFetgtEux3+XmFlIA4XEBOo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=OJ1F3P9t; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id A9EA0C116D0;
	Fri,  5 Dec 2025 13:59:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1764943150;
	bh=KQnBzHPTZX34VKmeFusEgVwCSs1xMPQQjgIziM5yRWU=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=OJ1F3P9tJAkAyoaZJCl8ptdGlv/DbQRXPpvDHpzP6pRiZICK9qkpPSwevhJzzPi8h
	 sEv/QrZzwOg+s8POvX4mJUzXEFYdkR/BWxRCGZ0O41V10J3eEvLN7MczwlaluTkEMi
	 s23BoJZ+RDDnAio1mrIGEp/kTIIah5jcSvMwD07vAESrFuyzERqt81+RkiNszVo2Jt
	 WcLRsYR1eucdMx/7krsk72tRuOJ3JeAXtTZWQ+MQ5FoxF1mehtXmpwfeddgtrOUFz6
	 lrFZKx+jhCQhcNGnGkHrjTjedWwK/RR1vIjzdarHYYXA7YQW9T+cCysB5kWH6AAdkB
	 64GpJqy1CVWBw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 91378D2F7F5;
	Fri,  5 Dec 2025 13:59:10 +0000 (UTC)
From: Robert Eckelmann via B4 Relay <devnull+longnoserob.gmail.com@kernel.org>
Date: Fri, 05 Dec 2025 22:58:59 +0900
Subject: [PATCH v3 1/3] arm64: dts: qcom: sdm845-xiaomi-beryllium: Enable
 SLPI
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251205-slpi-v3-1-a1320a074345@gmail.com>
References: <20251205-slpi-v3-0-a1320a074345@gmail.com>
In-Reply-To: <20251205-slpi-v3-0-a1320a074345@gmail.com>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 phone-devel@vger.kernel.org, linux-kernel@vger.kernel.org, david@ixit.cz, 
 Robert Eckelmann <longnoserob@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=922;
 i=longnoserob@gmail.com; h=from:subject:message-id;
 bh=X2jyhLpnhQw17+D9jmrIWEkCOS7CfZrrsf0u+JBIKOM=;
 b=owGbwMvMwCVmcOAq9/vk/SGMp9WSGDKNnurKxPFd3n/4vyCj4HmpyoKCDQ4HrQUOB/bNerp+s
 mpDfp1oRykLgxgXg6yYIssOt2M6ma5LIzbu3l8GM4eVCWQIAxenAEzk8nmG/zFPhLdJfNO/vXK2
 rfqdlNAo9vKNd2NcORQyetpbCkN9oxj+2V+/t9Sw75oOl+q5ebO1vkauK1+1YVuQzXEDo2Keotn
 cPAA=
X-Developer-Key: i=longnoserob@gmail.com; a=openpgp;
 fpr=B846C62C6945A558B1BBBF7630C0D50BEF63BF54
X-Endpoint-Received: by B4 Relay for longnoserob@gmail.com/default with
 auth_id=569
X-Original-From: Robert Eckelmann <longnoserob@gmail.com>
Reply-To: longnoserob@gmail.com

From: Robert Eckelmann <longnoserob@gmail.com>

Enable the SLPI dsp on the Xiaomi Pocophone F1 with Qualcom SDM845 SoC.

Signed-off-by: Robert Eckelmann <longnoserob@gmail.com>
Signed-off-by: David Heidelberg <david@ixit.cz>
---
 arch/arm64/boot/dts/qcom/sdm845-xiaomi-beryllium-common.dtsi | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sdm845-xiaomi-beryllium-common.dtsi b/arch/arm64/boot/dts/qcom/sdm845-xiaomi-beryllium-common.dtsi
index 785006a15e97..57af560e35ce 100644
--- a/arch/arm64/boot/dts/qcom/sdm845-xiaomi-beryllium-common.dtsi
+++ b/arch/arm64/boot/dts/qcom/sdm845-xiaomi-beryllium-common.dtsi
@@ -425,6 +425,12 @@ &sdhc_2 {
 	cd-gpios = <&tlmm 126 GPIO_ACTIVE_HIGH>;
 };
 
+&slpi_pas {
+	firmware-name = "qcom/sdm845/Xiaomi/beryllium/slpi.mbn";
+
+	status = "okay";
+};
+
 &sound {
 	compatible = "qcom,db845c-sndcard", "qcom,sdm845-sndcard";
 	pinctrl-0 = <&quat_mi2s_active

-- 
2.52.0



