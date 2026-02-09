Return-Path: <linux-arm-msm+bounces-92292-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qL4EHH7aiWlFCgAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-92292-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 09 Feb 2026 14:00:46 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 46C4410F4D8
	for <lists+linux-arm-msm@lfdr.de>; Mon, 09 Feb 2026 14:00:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 6D524302417E
	for <lists+linux-arm-msm@lfdr.de>; Mon,  9 Feb 2026 13:00:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 14B7A3783C9;
	Mon,  9 Feb 2026 13:00:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="zyN77k3W"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD37D37106C
	for <linux-arm-msm@vger.kernel.org>; Mon,  9 Feb 2026 13:00:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770642003; cv=none; b=j2QRAGrqJTLOKLIrTB/X+1lk3nOlvTn+9M7HpaFphXrNE8t+wr5e9KZrHD8sXLCBo3S1sKNY2OcG6Epw4mmCkGFTqrdKmM9PejMUZG/77KhvNdJMiq3uNBmSPJa+FKUZgialG6Bv1DCMr+mBAofSp/VTiRuGIy3vnBTdU5+Cizo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770642003; c=relaxed/simple;
	bh=qfKnEcsoVX06QZzEM7/4cC6HPLmj8y0sO6sxJasyjlw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ptM/Q52mOg2JHelb1fkGBT+oDMxwaqmHxFcadNlVnYtxTR/TERHQoXlpVc7a/MvtPBwHeO26v/Wz537CdIOr2B66tfpuf2dci0Uc+q8BOyxwIdfbj2UCniy4loRi/lPqRR4QhrQuPqggGQtNdwjnJMTmeQNiGPg+eOpfjnXlz4Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=zyN77k3W; arc=none smtp.client-ip=209.85.218.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-b8845cb580bso473098766b.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 09 Feb 2026 05:00:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1770642001; x=1771246801; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=sQRQHvtqeyxSd6xSuySaBNbpnzY0H4KkdhX34aIrxhU=;
        b=zyN77k3WQFGV+mUZ2kx1KRb8WdAhycj2/mbOntnjs0ZSOoRIv+Jg2ID7zhe1NizG6q
         ig4+3FimO0VGoaBqJjwmL0qDA4PdSEQWjcfvAjzlHC5Idqq2ajmB5qBmL61n/rvmbUEi
         irxnsbzHOlx73wSL0CPlLPf2eZVXN2EmMhLqjyJN5KtGgl5Bvzuwkuq8D0yER1+2xUYU
         hErAwlSFBlJHcbgZI2wqMqP7Ly5Yjthvky9lExfRVyBFF06zF1bMEvzCi92uQ4cHzdJj
         1dQ2tOnld99sBlwwyWsFrnTjl5RbWCiVXLEASAlfhMbEPbHCepFhf1HUEs4z/2gLA937
         Z1Iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770642001; x=1771246801;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=sQRQHvtqeyxSd6xSuySaBNbpnzY0H4KkdhX34aIrxhU=;
        b=Lwk79V72YZTFRO3ynCwIlaOs/8dr/5yRATda1VhmITfO2YaMGHe+zhOhVLTK3GLWJD
         p/ZoKnjDPwJ4ec10zjHI//GlytEDgR0wyVXJPJ6hhN2GYa06868U5mWmEtdOOuc1D6cD
         pMIWwW/XCN0hE/mNqBDY93A70q+oTD3RHnGk+G+UbmXu2pp19d95ApEgCkVESxB8Ba4r
         6S3puqYoPmdWV0KXMUg863Qreoy/wNqBrEiUUQbFcajpD2riBkzQ1QsA5JVc0f8Z+Wvh
         0xZrGIL41FygM9cgbYekfMVA/Om3FVRd+qBgS8O4ueCW4VXz3qpbA16DIS6HlF93mw/H
         GvfA==
X-Forwarded-Encrypted: i=1; AJvYcCX3i5BeIxWemNZSvnt3oiAtj8be6bnnxpd5515+qbRb/5udexlqarZRgSnw+TZDcOTKi2QIVN3laC4sApjt@vger.kernel.org
X-Gm-Message-State: AOJu0YyeY/ExjDThzYsf5oud1SDuesltEldSSFuvIk62eMK6kcfXTfWO
	Q0IegfpmghKCid93oB/lFxQ1KI4xqWnOqpbvCdpMZKlAvk0MupTXuXhg2SDhLGXtgVoqYDPOf/N
	MGqn6
X-Gm-Gg: AZuq6aJOvxe75ta8vS5szcPzgqf0ev+YGKnD34FPAoi7IG+MVaISQpNB4qbA08KYUpk
	X/89V+OG4qgxWoxawe4mlhm0R2zVupafEqzHlgL4XmOfmwgV6BgXrSD/G0nUQ46LGVEoI+j6IP4
	WVFiYamzzdOg40MGKgKzvITx/Y704QgzlnPH22iqvLoeEeAepZfGL2xW5ueOkYClQTkY7ibwO68
	lGxZJKTAqvOTKZNKcbV3rp/gnke93A8jrRO0qhRAKFyspdp0kcykCo+APY+UdgW/IGAQeoctwVc
	Y0lIeJd2OWZUBvl/otjUUTdCNE+lgGSuJpm/PNkaXw3Tx0JS3i/4BLWNgWRW6uhk4StT1YUCIuf
	u40OxcoON48wRhybhHPaMO/xkpnpG1cdefZJKcvSEVsiYqwfPfR4ArJgz7Q3Lc0GxFTYY5fJVv7
	dHdFgUt820kZzM73BsW0BhGAKp6O1A0ss8b7DTh+q+f5YE5xUwsJWLVkzSSXJs2xI4jUgpxQ==
X-Received: by 2002:a17:906:7315:b0:b87:3beb:194a with SMTP id a640c23a62f3a-b8edf3821c7mr636202266b.44.1770642000978;
        Mon, 09 Feb 2026 05:00:00 -0800 (PST)
Received: from [172.16.220.227] (144-178-202-139.static.ef-service.nl. [144.178.202.139])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-65983ec70fdsm2803040a12.15.2026.02.09.05.00.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Feb 2026 05:00:00 -0800 (PST)
From: Griffin Kroah-Hartman <griffin.kroah@fairphone.com>
Date: Mon, 09 Feb 2026 13:59:47 +0100
Subject: [PATCH v3 3/3] arm64: dts: qcom: milos-fairphone-fp6: Add vibrator
 support
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260209-aw86938-driver-v3-3-5c79cff30492@fairphone.com>
References: <20260209-aw86938-driver-v3-0-5c79cff30492@fairphone.com>
In-Reply-To: <20260209-aw86938-driver-v3-0-5c79cff30492@fairphone.com>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, 
 Luca Weiss <luca.weiss@fairphone.com>
Cc: linux-input@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 Griffin Kroah-Hartman <griffin.kroah@fairphone.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1770641998; l=1662;
 i=griffin.kroah@fairphone.com; s=20250804; h=from:subject:message-id;
 bh=qfKnEcsoVX06QZzEM7/4cC6HPLmj8y0sO6sxJasyjlw=;
 b=QxXr159gJrFONiROJ9wYKHa19mSuqT81JhngYRfyHeul0AaTK8uqBUGLCtxIbx1MbGVe6HoKH
 NHsxWObDQzSC8ATsAN9/06hVBTP01Yi4H4W24FkvKbqtft2SEpfbczc
X-Developer-Key: i=griffin.kroah@fairphone.com; a=ed25519;
 pk=drSBvqKFiR+xucmLWONHSq/wGrW+YvcVtBXFYnYzn8U=
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[fairphone.com,quarantine];
	R_DKIM_ALLOW(-0.20)[fairphone.com:s=fair];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-92292-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com,kernel.org,fairphone.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[14];
	DKIM_TRACE(0.00)[fairphone.com:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[griffin.kroah@fairphone.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[fairphone.com:mid,fairphone.com:dkim,fairphone.com:email,5a:email,qualcomm.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 46C4410F4D8
X-Rspamd-Action: no action

Add the required node for haptic playback (Awinic AW86938)

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Griffin Kroah-Hartman <griffin.kroah@fairphone.com>
---
 arch/arm64/boot/dts/qcom/milos-fairphone-fp6.dts | 26 +++++++++++++++++++++++-
 1 file changed, 25 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/milos-fairphone-fp6.dts b/arch/arm64/boot/dts/qcom/milos-fairphone-fp6.dts
index 52895dd9e4fa117aef6822df230ebf644e5f02ba..324d18d9900881a840806ada84e33fe9664296a0 100644
--- a/arch/arm64/boot/dts/qcom/milos-fairphone-fp6.dts
+++ b/arch/arm64/boot/dts/qcom/milos-fairphone-fp6.dts
@@ -625,7 +625,17 @@ vreg_l7p: ldo7 {
 	};
 
 	/* VL53L3 ToF @ 0x29 */
-	/* AW86938FCR vibrator @ 0x5a */
+
+	vibrator@5a {
+		compatible = "awinic,aw86938", "awinic,aw86927";
+		reg = <0x5a>;
+
+		interrupts-extended = <&tlmm 80 IRQ_TYPE_EDGE_FALLING>;
+		reset-gpios = <&tlmm 78 GPIO_ACTIVE_LOW>;
+
+		pinctrl-0 = <&aw86938_int_default>, <&aw86938_reset_default>;
+		pinctrl-names = "default";
+	};
 };
 
 &pm8550vs_c {
@@ -755,6 +765,20 @@ sdc2_card_det_n: sdc2-card-det-state {
 		bias-pull-up;
 	};
 
+	aw86938_reset_default: aw86938-reset-default-state {
+		pins = "gpio78";
+		function = "gpio";
+		drive-strength = <2>;
+		bias-pull-down;
+	};
+
+	aw86938_int_default: aw86938-int-default-state {
+		pins = "gpio80";
+		function = "gpio";
+		drive-strength = <2>;
+		bias-pull-up;
+	};
+
 	pm8008_int_default: pm8008-int-default-state {
 		pins = "gpio125";
 		function = "gpio";

-- 
2.43.0


