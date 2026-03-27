Return-Path: <linux-arm-msm+bounces-100330-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qHJfCIaHxmlALQUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-100330-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Mar 2026 14:35:02 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id D181D3454BE
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Mar 2026 14:35:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 5982E305B320
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Mar 2026 13:30:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2302D3B9DA6;
	Fri, 27 Mar 2026 13:30:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="GG/oiSyf"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E46E231E85D;
	Fri, 27 Mar 2026 13:30:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774618219; cv=none; b=bu+nUmUfnRgK0A3sdjor8sDBMpY4FcWS7tohneGVdDb8olVNo7ByR64qm6PEcZhEiaZy1KTP/WjOS4REK+EcPPQUaveE3xNHsLzLOFy7IpyV6wTwaeF2PAV+7zP6pWnLQs5gD36MZCEZU8ak6/tCIjpMel9RBH0n8hF5yS2F0CY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774618219; c=relaxed/simple;
	bh=cFhg3Ww0XnHslmz2AhCLxQROMM+a0LeNeC7b893YDc8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=t7036sUbf0jPilm+QJe17ij/+a3vglVIeK2/5ysUGWwH8xcVQN+NdiZY5pE64WbUoQbB9BcFJSzXWU/EmSaWw9ZapjsuTYl7rmfwOYznKLsRtIQt4gndQaQGhWwhzZMs+JIZC/vqARXtbYgOVLXgA0HMRbZNSwkSSmVR0Zbm4Ek=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=GG/oiSyf; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id B6F89C2BCB0;
	Fri, 27 Mar 2026 13:30:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774618218;
	bh=cFhg3Ww0XnHslmz2AhCLxQROMM+a0LeNeC7b893YDc8=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=GG/oiSyfZ//4KFoeAHqVZLNGB0JpbPrVcVraV5IwxnJLAyY1XO1tvcyHdK44L62x3
	 JwZXRRdb1j+mWtbr+rElQMmX5vyQCvRoWCGgeQQtvmko1popMxtNEgHGyl74Pvigix
	 ONzRx+KE6q5ZiWBHwp2WPpnfuUR1azsUAM894sa2Bjndg+c7ZIkRTr2r9//g3uYdn8
	 ge4tMPm709PIytIMW2WNNfw1DaC2srzIYd50BfNKns60klUA/XXQx9wxvaUqnzQzCs
	 jOQbGoITGiA4bt2RXtWo/so11VL/wbgX145i3o885pwWmFnJ6FwJN5/ZrKulplL00b
	 +2YBfjjKSXAKg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AA09510ED67B;
	Fri, 27 Mar 2026 13:30:18 +0000 (UTC)
From: Cristian Cozzolino via B4 Relay <devnull+cristian_ci.protonmail.com@kernel.org>
Date: Fri, 27 Mar 2026 15:30:50 +0100
Subject: [PATCH v4 4/6] arm64: dts: qcom: msm8953-flipkart-rimob: Enable
 WiFi/Bluetooth
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260327-rimob-new-features-v4-4-06edff9c4509@protonmail.com>
References: <20260327-rimob-new-features-v4-0-06edff9c4509@protonmail.com>
In-Reply-To: <20260327-rimob-new-features-v4-0-06edff9c4509@protonmail.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1774621871; l=1054;
 i=cristian_ci@protonmail.com; s=20250620; h=from:subject:message-id;
 bh=WtEqVo4VByTiCmu2C8wOESppBF9z6HkoPkXa5Z66lkk=;
 b=ixbQYrS9KsX1BwaaM8t5Z2BoBDi9bZYVTI42Aw1++rSe/c7Yj0BV/58cfvoVSi1qwimwh4W/7
 cYx/VKB9SfnDzawzEEywpoWDm9ZfIrbVhldRRBIPIkWN5Xizf6yJwql
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-100330-lists,linux-arm-msm=lfdr.de,cristian_ci.protonmail.com];
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
	NEURAL_HAM(-0.00)[-0.999];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[devnull@kernel.org,linux-arm-msm@vger.kernel.org];
	FREEMAIL_CC(0.00)[lists.freedesktop.org,vger.kernel.org,lists.sr.ht,protonmail.com,oss.qualcomm.com];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	DKIM_TRACE(0.00)[kernel.org:+];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,protonmail.com:email,protonmail.com:replyto,protonmail.com:mid]
X-Rspamd-Queue-Id: D181D3454BE
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
index 8b72b71f4d4b..8620143e04a0 100644
--- a/arch/arm64/boot/dts/qcom/msm8953-flipkart-rimob.dts
+++ b/arch/arm64/boot/dts/qcom/msm8953-flipkart-rimob.dts
@@ -326,3 +326,18 @@ &usb3 {
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



