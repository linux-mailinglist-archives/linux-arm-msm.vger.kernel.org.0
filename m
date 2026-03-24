Return-Path: <linux-arm-msm+bounces-99498-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iL1ZJETxwWkgYAQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-99498-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Mar 2026 03:04:52 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 32399300E90
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Mar 2026 03:04:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 3FEE93037765
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Mar 2026 02:02:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CF11E37C90C;
	Tue, 24 Mar 2026 02:02:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IASRu3g1"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-qt1-f181.google.com (mail-qt1-f181.google.com [209.85.160.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8736F37C105
	for <linux-arm-msm@vger.kernel.org>; Tue, 24 Mar 2026 02:02:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774317723; cv=none; b=PfaotQdcqUZyeXE5UWNWDB4BH9gacVVxYOFBVRF38gH7wmGRjhJ87gpijj3C7obHNWo8X7/DTwScwKY03A5OcnPXQd0GHERTYgTh1+Lh3xB/RRG7Hj3BMyTYiYc0+jkvUmC1qI5xoCNg4xqhk46/P4bChrZjWxadsAeaHxJyumU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774317723; c=relaxed/simple;
	bh=qu8bAAJfjLJVtPJ0M7mvCqS6W5WISRGIXt9zkmXzxvo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=B0o1m8yPSTEPSqwhEspF0mlXjtingX3WMpNHOGS26w90jchnn+tfASrDHDkJTTEr5SGjFRyqZ1sB+lwfvJS/Z+jeth0DqJb5FsY001ikuG8CCYiHhkSu64c7Sm+pR5h8WtFisziqUsMWkvwZrZArXClYV4N/POKrhogxT6Td1do=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IASRu3g1; arc=none smtp.client-ip=209.85.160.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qt1-f181.google.com with SMTP id d75a77b69052e-50b351eaf81so31277191cf.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 23 Mar 2026 19:02:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774317721; x=1774922521; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qJ6iuzD3e1xlHjcAVLCKvAnVJFh4LA+GcQW5nRxzCOg=;
        b=IASRu3g1z9MjeM9r2pzebIzPqz7ulMp+r8KhkmIMbMji3jmqer7+F5jcuo1VLubN+r
         zeNyPJxWyEc+GZHQrn5ITV9pm5sRNsJzr/UoJAdU1jSyYndEFAzLAI+sJTFJvscBxMJa
         ebyX3daaZsXhLRRALIH9cGEThaF3N/m0CTPbngsFVpwZpPpdXAWURdU4aINa3CNQ5qJf
         FDsEcTnwK1mdPKZWAML/dJfV7gejEQcicZ9s8w5x/k33vuxxAefRkDkr8308bjBNqK6L
         wwuKPJjRk6cos7z9/yNhjfXOZY1X583YHJejP6oGaZaSAWK5DH2dLJagmMOBp3gdI9+l
         p2Mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774317721; x=1774922521;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=qJ6iuzD3e1xlHjcAVLCKvAnVJFh4LA+GcQW5nRxzCOg=;
        b=MFRxgVf7MXa2XFX3rrhU8/nyj/Mh/JvDHsOPX0Lgq/Zz/B5ECvjqCFIGlcvneNYycw
         GcsYvMDjXT0Y04FP5IS8zcEyjDMV8SkA5q3jK4TuL2+UyY037rwnfgICevpmNf9XLmHm
         0uipXubLzR+K87RnfqXn0y6pFbqvosyR6fWtP1BbE3iMX5mpZ111u9gZsANaHgdkhZpg
         GUX61Uyc68kHRuOn8oo+zZclfesoZG7fFmdzD8JvZhzq7cJhlwaIQuUlDEHeZVAHGF/c
         Lt3GEqEdNfBPdOEwp5GDtXcFjBRxp2FHlYq6j53d/baNfbh01mKL9jiTJ27FrUR8Dkf4
         phoQ==
X-Forwarded-Encrypted: i=1; AJvYcCUX+8/bcQGnZ6SH2RKSoiVf6BIWh2y4zhYHXe77iJpC8TbtArIVFBdO0y27G1vabXIEBD4zdWOv/s0MO2J6@vger.kernel.org
X-Gm-Message-State: AOJu0YwUXiouEdquxIl7op7Lp2fl57P27/qfwZU6YympoTDcNg+pPpB4
	wykV/qamaMjYZz56UXJOxqQFaXVvO5VtPG38BI9rHoOHw29SbHjJRdtc
X-Gm-Gg: ATEYQzxED5S0p2Rm88TJUy2xj8bQVj3VqwYSDMVjqD9rtpSixh5vlQ6EMxmNV+G/z1k
	N/g8ryB8sY1BeAhOtG+5bR0rRPenEnzjRFE5gqSJl/ogUFsVnuiHJHkcegW+mzCob4rmJflrT+D
	xllMDAai5BF7PGGuw8JFgGi7LbMNZ2/JKEXpIb7Lt7LJ0bI+QmaNoHJ88eNUp8WpgBO530KCO3p
	52JNYnazUjpozAPyMatFp20a6IciShi4syY+lkehELxsLo9Ogp+D7f7G0/1y47kuUbbBIHwQwMU
	NTj7QBDsZrWYS0JZkdKqaQqPfT3Es039yQBjuo/DLoGJEdF308iSzg1H+yPjzmjEhtJ4BaJd4hV
	Umo/BW3Hi4KNyqe2ncJQapXNZXkHzIs2I4PUUhFxC7nwhGFk5tntkcf2i7/g2sB2pbnrEKsQ1z3
	r/PsLdshxOtUorGojGCZGVuN8Y32YjgSzcEDc/xSBbCwSzmOf5mOnRRIJywrfpIXoo1YEAsVYYw
	8zFcsJGuQP6vEI=
X-Received: by 2002:a05:622a:1baa:b0:50b:460b:650e with SMTP id d75a77b69052e-50b460b6d72mr180422571cf.49.1774317721246;
        Mon, 23 Mar 2026 19:02:01 -0700 (PDT)
Received: from localhost (bras-base-toroon21-grc-75-184-144-58-243.dsl.bell.ca. [184.144.58.243])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-50b36e5b98bsm97538511cf.20.2026.03.23.19.01.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Mar 2026 19:01:59 -0700 (PDT)
From: Richard Acayan <mailingradian@gmail.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	"Bryan O'Donoghue" <bod@kernel.org>,
	Robert Foss <rfoss@kernel.org>,
	Todor Tomov <todor.too@gmail.com>,
	Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Tianshu Qiu <tian.shu.qiu@intel.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	linux-media@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-msm@vger.kernel.org
Cc: Robert Mader <robert.mader@collabora.com>,
	David Heidelberg <david@ixit.cz>,
	phone-devel@vger.kernel.org,
	Richard Acayan <mailingradian@gmail.com>
Subject: [PATCH v11 6/7] arm64: dts: qcom: sdm670: add camera mclk pins
Date: Mon, 23 Mar 2026 22:01:31 -0400
Message-ID: <20260324020132.8683-7-mailingradian@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260324020132.8683-1-mailingradian@gmail.com>
References: <20260324020132.8683-1-mailingradian@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-99498-lists,linux-arm-msm=lfdr.de];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	FREEMAIL_TO(0.00)[kernel.org,gmail.com,linaro.org,intel.com,linux.intel.com,vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[19];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[collabora.com,ixit.cz,vger.kernel.org,gmail.com];
	DKIM_TRACE(0.00)[gmail.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mailingradian@gmail.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linaro.org:email,0.51.225.64:email,ixit.cz:email,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,qualcomm.com:email]
X-Rspamd-Queue-Id: 32399300E90
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

The camera subsystem is added for the SoC common devicetree, but the
mclk pins should also be common across the SoC. Add the mclk pins for
the cameras.

Suggested-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Link: https://lore.kernel.org/r/5135823c-f2e4-4873-9e3a-9d190cac0113@oss.qualcomm.com
Reviewed-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
Reviewed-by: Bryan O'Donoghue <bod@kernel.org>
Reviewed-by: David Heidelberg <david@ixit.cz>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Richard Acayan <mailingradian@gmail.com>
---
 arch/arm64/boot/dts/qcom/sdm670.dtsi | 28 ++++++++++++++++++++++++++++
 1 file changed, 28 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sdm670.dtsi b/arch/arm64/boot/dts/qcom/sdm670.dtsi
index fbd16b1f3455..f115bc6e64f3 100644
--- a/arch/arm64/boot/dts/qcom/sdm670.dtsi
+++ b/arch/arm64/boot/dts/qcom/sdm670.dtsi
@@ -1196,6 +1196,34 @@ tlmm: pinctrl@3400000 {
 			gpio-ranges = <&tlmm 0 0 151>;
 			wakeup-parent = <&pdc>;
 
+			cam_mclk0_default: cam-mclk0-default-state {
+				pins = "gpio13";
+				function = "cam_mclk";
+				drive-strength = <2>;
+				bias-disable;
+			};
+
+			cam_mclk1_default: cam-mclk1-default-state {
+				pins = "gpio14";
+				function = "cam_mclk";
+				drive-strength = <2>;
+				bias-disable;
+			};
+
+			cam_mclk2_default: cam-mclk2-default-state {
+				pins = "gpio15";
+				function = "cam_mclk";
+				drive-strength = <2>;
+				bias-disable;
+			};
+
+			cam_mclk3_default: cam-mclk3-default-state {
+				pins = "gpio16";
+				function = "cam_mclk";
+				drive-strength = <2>;
+				bias-disable;
+			};
+
 			cci0_default: cci0-default-state {
 				pins = "gpio17", "gpio18";
 				function = "cci_i2c";
-- 
2.53.0


