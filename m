Return-Path: <linux-arm-msm+bounces-100578-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kJqgETWvyGlPowUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-100578-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sun, 29 Mar 2026 06:48:53 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 044B9350AF5
	for <lists+linux-arm-msm@lfdr.de>; Sun, 29 Mar 2026 06:48:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id A1D0E301B169
	for <lists+linux-arm-msm@lfdr.de>; Sun, 29 Mar 2026 04:48:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 77ADD22F77B;
	Sun, 29 Mar 2026 04:48:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SiSFP0Nh"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pg1-f181.google.com (mail-pg1-f181.google.com [209.85.215.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E263A218821
	for <linux-arm-msm@vger.kernel.org>; Sun, 29 Mar 2026 04:48:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774759711; cv=none; b=uFZwrf0CrRjmlwXSNqjZYANlYMLdhSoJOCZM45gON/8ytqxTlbv4Fi2x++jhLrvmK3SkcCxpQ3c1ntbgktmxEE6He2+PHpBo3TDblzXRqddbvQcAJjxSMy9cch4R05ESc6uo64TtIV8NFiPe8FF+h0YdmCUqS1aQv/xfotj5SoI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774759711; c=relaxed/simple;
	bh=mrDnR0G7mbNJho3HlF5gQvzhoEN14/C2UquKRdZ6H1k=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=JhgvBa6hSoBq+sCbAe4S/vsjf+d/sGMK2TdztXn2OfOBQttytZanUqMBPAq8Z9T1UlDnQTmvcLALxSU2+mKuub45AYKHjlobIgxTR6UmrtPdksr7bzljlIXU4Nn4eV7Bwzct5iOpYJlOpYHZD8xso+EqlZo5xPxgFP6fm2gIK6o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SiSFP0Nh; arc=none smtp.client-ip=209.85.215.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pg1-f181.google.com with SMTP id 41be03b00d2f7-c7358a7a8d1so2398016a12.3
        for <linux-arm-msm@vger.kernel.org>; Sat, 28 Mar 2026 21:48:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774759709; x=1775364509; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=X72F+IYkq8vmJ6nRPI8ppD04puTmgdxZkpkri1mXXzg=;
        b=SiSFP0NhBAJmtHnRK2BBtz3Go07NRQ13nWKVqMWzf16AJC/Z0DSvJAbFA0DXqed1LQ
         o0OjDbJFjinHM6gFTxGD5d7FxHXM2q3dsk0Ze21Ba2RoNG1xuyHfyS27f71iBfgAeFDa
         +gNwIbtZ1ONfXllgQRStXkxJvDU86ABwXNK+iENAUl7ybpVAW45yiscaJaJwu3VIK0zp
         cPaZJOYKXzm+omic4bL3rxD/7TxFrNHqtll9zsubjqn70t6BcQYMPJ0gPo0MP0KFafSM
         3C+q4GtoTYJOBAqLA481D3PoaBsOOI1JWarW10RSdvjgzLtdhCicR19mxKW1JpzZKfHW
         v9HQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774759709; x=1775364509;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=X72F+IYkq8vmJ6nRPI8ppD04puTmgdxZkpkri1mXXzg=;
        b=AZbAXXt6copy7fmvTChIOX1mZE+5qoEa5uuNPtV7bWuAucqv4Mj/k3ET8omlcnXQ/P
         yPAydiLJ1n+xWW2cm8Yj0g/D8ktGg/uBzjKF/4+F+uawJMVcC56eB0+AW17n7sM3G+LC
         HXfmp5I0XHxUh4vOmmHs034Ve+3U4kI3VOJFo5f7DtwxzcvsxI2X7PPt3lljDYXMik1E
         TrEbnpscivH4fSz6NOlzH/0F+L3Fs/Fmf3Ic2Jh/Qn3oBMjl8S0ePd8/6a9riTzr3aPV
         2bMy31T0Wq+/9/XpdEpVoY7KH2ESWVHLbVeJJdLHbbDZtjvJj3+8Kiq5UpnOe69TpmX7
         wpaw==
X-Gm-Message-State: AOJu0Yy6hUMooS6WmCA1A5Ha53mQ5wKf/EhkhDqrYcqn0L56PcMJota8
	sINFJ/yU14sfuhhphXzutpP4gPYssXj2K9WcTlX2oQxZjbYVUmNQSm3G
X-Gm-Gg: ATEYQzzrJmK4CSfyT0c+CDJL5ibVATEOdjNKQRJyhIkzGgIOQq7HyQdRkhjFN5W1hpU
	vX6C+ElCyzwKpq+O2lVRyxgxX/Eex9wqzugkf1m5NGqFS/HvJpMS/otl+64HWf+t/4Em2arIpUC
	bqCuz6GoTlz8bHaNZOdRzqnTw9XSBTEGZxU3neRlFdRzzygX+gY7H7Pe1qkwwN2N+PvVDjuZb/o
	Svb3K8PxSyYRYqwbkEdeXwXhXDTQpzVvNqO9XlQiFgxPIDqY3ph5te5uRf8O9eVhcaFfrJHUZCH
	clCBahAPdw/McuSFFcDlBf7F7enuRUrbv9o5ZG7+7/RBVQX6r0z0r+HxAypnsSVp0gerP3+tWTq
	nlRXgfMT0EKQZcOOSze3DdSGqdBK3PmEAmKIImtZ18rwil2q2/umT1DyeNDuFKqtFcSuavn8bBa
	BN57d40Xw86QTkfrJ445MERTTCNrBn
X-Received: by 2002:a05:6a20:9188:b0:394:6344:e5c4 with SMTP id adf61e73a8af0-39c877ea332mr8300548637.3.1774759709300;
        Sat, 28 Mar 2026 21:48:29 -0700 (PDT)
Received: from [192.168.0.101] ([43.226.29.240])
        by smtp.googlemail.com with ESMTPSA id 41be03b00d2f7-c769179e31asm2899739a12.17.2026.03.28.21.48.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 28 Mar 2026 21:48:29 -0700 (PDT)
From: Biswapriyo Nath <nathbappai@gmail.com>
Date: Sun, 29 Mar 2026 04:47:58 +0000
Subject: [PATCH v2 3/7] arm64: dts: qcom: sm6125-xiaomi-ginkgo: Enable
 vibrator
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260329-ginkgo-add-usb-ir-vib-v2-3-870e0745e55e@gmail.com>
References: <20260329-ginkgo-add-usb-ir-vib-v2-0-870e0745e55e@gmail.com>
In-Reply-To: <20260329-ginkgo-add-usb-ir-vib-v2-0-870e0745e55e@gmail.com>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Lee Jones <lee@kernel.org>, 
 Pavel Machek <pavel@kernel.org>, Sean Young <sean@mess.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Martin Botka <martin.botka@somainline.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-leds@vger.kernel.org, 
 linux-clk@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht, 
 phone-devel@vger.kernel.org, stable@vger.kernel.org, 
 Biswapriyo Nath <nathbappai@gmail.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1774759680; l=1039;
 i=nathbappai@gmail.com; s=20260118; h=from:subject:message-id;
 bh=mrDnR0G7mbNJho3HlF5gQvzhoEN14/C2UquKRdZ6H1k=;
 b=ph9fTagfBVXtK331HF7XaRKTIzItjVo85alsUFGqPrhIYNQAXctTJbC9AbxZpAXzv901QbdE4
 v03zR55ULznCzUwTjppN1GV1PAgNPMg6p+EkNIgfHXbZXAuTkgnD9xj
X-Developer-Key: i=nathbappai@gmail.com; a=ed25519;
 pk=slmb/9yXbet+KTiT3EYLCp0p0MEOYa3EdjUXP+HXfjg=
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-100578-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[vger.kernel.org,lists.sr.ht,gmail.com,oss.qualcomm.com];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCPT_COUNT_TWELVE(0.00)[22];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[nathbappai@gmail.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 044B9350AF5
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Enable the vibrator on the PMI632 which is used on this phone.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Biswapriyo Nath <nathbappai@gmail.com>
---
 arch/arm64/boot/dts/qcom/sm6125-xiaomi-ginkgo-common.dtsi | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm6125-xiaomi-ginkgo-common.dtsi b/arch/arm64/boot/dts/qcom/sm6125-xiaomi-ginkgo-common.dtsi
index 7eecd9dc3028..88691f1fa3a1 100644
--- a/arch/arm64/boot/dts/qcom/sm6125-xiaomi-ginkgo-common.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm6125-xiaomi-ginkgo-common.dtsi
@@ -12,6 +12,7 @@
 #include <dt-bindings/pinctrl/qcom,pmic-gpio.h>
 #include "sm6125.dtsi"
 #include "pm6125.dtsi"
+#include "pmi632.dtsi"
 
 /delete-node/ &adsp_pil_mem;
 /delete-node/ &cont_splash_mem;
@@ -115,6 +116,10 @@ &hsusb_phy1 {
 	status = "okay";
 };
 
+&pmi632_vib {
+	status = "okay";
+};
+
 &pon_pwrkey {
 	status = "okay";
 };

-- 
2.53.0


