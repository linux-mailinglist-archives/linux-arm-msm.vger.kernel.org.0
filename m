Return-Path: <linux-arm-msm+bounces-98564-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +Cp2FhsZu2nLfAIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-98564-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 18 Mar 2026 22:28:59 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 0058E2C2FAE
	for <lists+linux-arm-msm@lfdr.de>; Wed, 18 Mar 2026 22:28:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 4E6CE301F693
	for <lists+linux-arm-msm@lfdr.de>; Wed, 18 Mar 2026 21:28:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4DE8437E300;
	Wed, 18 Mar 2026 21:28:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="FTJUlTa4"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2692F37C101;
	Wed, 18 Mar 2026 21:28:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773869335; cv=none; b=g1zxylkrw3F3PfNLW17q2ZV0iX9wx6R4qy3T1pUBsntaV5WA6ugjZWQeDTvpwohFyXQtBSnhWcEidQhjFwHiHqHjZvpVkz729iShl6DsEB/x5FrmOLinyw9V/JSoj1ubij94UU4hJ7/NDGwu4xsCOXgwqf89oUTigSjdh6/HoZg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773869335; c=relaxed/simple;
	bh=Nuq2wHrBLxuZGeUJfMISr8VzFOYB9FUSVrFySOsLydM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=DTVaTOWJBRPX+1j8I4Zchzi6DeeEp0qL+cy0PSJXHiZCPi80IDd98lAOIx6kdZE1JlZXrjZL7ADAJDMyVGCQ9/+XIYUfnGGCkwBQ921R6zIpUGcl/41AiaHbkgLy/6QeOh3+SYM/QuR9W+Z2knQr9lHW+7/6evEEJ9Vr9ufcD18=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FTJUlTa4; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id DDCD6C2BCB2;
	Wed, 18 Mar 2026 21:28:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773869335;
	bh=Nuq2wHrBLxuZGeUJfMISr8VzFOYB9FUSVrFySOsLydM=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=FTJUlTa4tXGhsUDNGGaxMzEgU46r46vdFVX4r0Xt4DIpJY7eU7Xhh75HW9PVI8a2Q
	 66px+pIH7sLL8oI/qp9+GyAxvtGn8Lk6H2i+eUzn7Cg5COV/J36FshAxsDXHWjYHpA
	 AiUmrAGJgC+6bpHtPJ91GpikIXZvWoCf58F/wx/Maf3tEiuTgDWBCdYmuTmWm76qFZ
	 ixVPhN4Vgc4gPus7uXS+TQIEHS0U+vUyW/CRydvf1sljGu+krIWMlJug8tgjArJXIg
	 F7DQ6Ghd9T1w0hLj1Kg7uSNekothNNoEAZ89A8jICJ+tQK7ezkhjSVTRi4qPlaAWaL
	 siBq+jiAAonXw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D1246103E19D;
	Wed, 18 Mar 2026 21:28:54 +0000 (UTC)
From: Cristian Cozzolino via B4 Relay <devnull+cristian_ci.protonmail.com@kernel.org>
Date: Wed, 18 Mar 2026 23:28:12 +0100
Subject: [PATCH v2 4/6] arm64: dts: qcom: msm8953-flipkart-rimob: Enable
 WiFi/Bluetooth
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260318-rimob-new-features-v2-4-c1bf8917449e@protonmail.com>
References: <20260318-rimob-new-features-v2-0-c1bf8917449e@protonmail.com>
In-Reply-To: <20260318-rimob-new-features-v2-0-c1bf8917449e@protonmail.com>
To: Neil Armstrong <neil.armstrong@linaro.org>, 
 Jessica Zhang <jesszhan0024@gmail.com>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 Cristian Cozzolino <cristian_ci@protonmail.com>, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1773872973; l=1054;
 i=cristian_ci@protonmail.com; s=20250620; h=from:subject:message-id;
 bh=6UxEpTqIgt97+bwFQnzTPs55o7CpwXQMc+N7/T2z61k=;
 b=vNrlA/gZO2iPAgTwpJ1VBrVr7t5Hoeaf3zxKm/IvwbzkjokfieSQxjmygQ0DuHoHfPNUnM2qm
 5KSWzzjjGQRDoR+HgUfn9Km6kK4kL6iQCOm1gUk4PbBz0l6q+1bB2iD
X-Developer-Key: i=cristian_ci@protonmail.com; a=ed25519;
 pk=xH5IvIPUNHV1Q8R0/pq2CfuVFR/wTiAyuyi6IwedjZY=
X-Endpoint-Received: by B4 Relay for cristian_ci@protonmail.com/20250620
 with auth_id=438
X-Original-From: Cristian Cozzolino <cristian_ci@protonmail.com>
Reply-To: cristian_ci@protonmail.com
X-Spamd-Result: default: False [1.34 / 15.00];
	FREEMAIL_REPLYTO_NEQ_FROM(2.00)[];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-98564-lists,linux-arm-msm=lfdr.de,cristian_ci.protonmail.com];
	FREEMAIL_TO(0.00)[linaro.org,gmail.com,ffwll.ch,linux.intel.com,kernel.org,suse.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	FREEMAIL_REPLYTO(0.00)[protonmail.com];
	RCPT_COUNT_TWELVE(0.00)[21];
	FROM_HAS_DN(0.00)[];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	HAS_REPLYTO(0.00)[cristian_ci@protonmail.com];
	RCVD_COUNT_FIVE(0.00)[5];
	NEURAL_HAM(-0.00)[-0.987];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[devnull@kernel.org,linux-arm-msm@vger.kernel.org];
	FREEMAIL_CC(0.00)[lists.freedesktop.org,vger.kernel.org,lists.sr.ht,protonmail.com,oss.qualcomm.com];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	DKIM_TRACE(0.00)[kernel.org:+];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,protonmail.com:email,protonmail.com:replyto,protonmail.com:mid]
X-Rspamd-Queue-Id: 0058E2C2FAE
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Cristian Cozzolino <cristian_ci@protonmail.com>

Configure and enable the WCNSS which provides WiFi and Bluetooth on this
device using the WCN3660B chip.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Signed-off-by: Cristian Cozzolino <cristian_ci@protonmail.com>
---
 arch/arm64/boot/dts/qcom/msm8953-flipkart-rimob.dts | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/msm8953-flipkart-rimob.dts b/arch/arm64/boot/dts/qcom/msm8953-flipkart-rimob.dts
index de287c8e9686..63e2c057319d 100644
--- a/arch/arm64/boot/dts/qcom/msm8953-flipkart-rimob.dts
+++ b/arch/arm64/boot/dts/qcom/msm8953-flipkart-rimob.dts
@@ -327,3 +327,18 @@ &usb3 {
 &usb3_dwc3 {
 	dr_mode = "peripheral";
 };
+
+&wcnss {
+	vddpx-supply = <&pm8953_l5>;
+
+	status = "okay";
+};
+
+&wcnss_iris {
+	compatible = "qcom,wcn3660b";
+
+	vddxo-supply = <&pm8953_l7>;
+	vddrfa-supply = <&pm8953_l19>;
+	vddpa-supply = <&pm8953_l9>;
+	vdddig-supply = <&pm8953_l5>;
+};

-- 
2.53.0



