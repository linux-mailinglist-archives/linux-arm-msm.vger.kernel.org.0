Return-Path: <linux-arm-msm+bounces-114862-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id p5wVHZUcQmqn0QkAu9opvQ
	(envelope-from <linux-arm-msm+bounces-114862-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Jun 2026 09:19:49 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D43A6D6E96
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Jun 2026 09:19:48 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=VND5zesh;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-114862-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c15:e001:75::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-114862-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 340953094107
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Jun 2026 07:01:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E88FA3BBFB3;
	Mon, 29 Jun 2026 07:01:00 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6EB93B895D
	for <linux-arm-msm@vger.kernel.org>; Mon, 29 Jun 2026 07:00:59 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782716460; cv=none; b=KnIEtzncknnLdMmHgNbjL/+0ATFVATHY7HXlsSCELlHRjwlQE2hd3XJviT7xsa2NIUvGAVB4zc9WjhMbMaIiNvOaRSwZCLpi2xp6I4lEy3lVyGCmUGA1Y0Lk7QButThBshOx/l+nL2rH7vZ0BYs/4inylI4/roLkVEH03tqXmWo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782716460; c=relaxed/simple;
	bh=MqRMZyVlH3leiRQ4IzNZyrl1O2s2mftQK+FQx0HoAmo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=d5LctF5qGz7eVatzr4Nvr6u8dZhOfqCWlDFfqV6Hcci1gAJJpBYbnPCSH/jDIzmQ2INq/Gl2gSoYzbUzkc/tzRdguBgNGK8p1taGbkSs0kugPxpkK3Hu4opTbGrBbkBhtZKuV80zPgN3VfrI9iylt7JcUzGQJo3QK2ZHAk2i8tY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VND5zesh; arc=none smtp.client-ip=209.85.216.47
Received: by mail-pj1-f47.google.com with SMTP id 98e67ed59e1d1-37d70036426so1178050a91.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 29 Jun 2026 00:00:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782716459; x=1783321259; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nmmf+pnJxsnUoyC6tMjVno2cHFN4son79GGotpRL1es=;
        b=VND5zeshbrJiFTdN1VE7W/Je38h/dnz1Z/03VfH6+q/lW5HX0K347p6+8KpXAhhfKn
         jsqKio2UqkiiVeRd2zryiMKpvWH//Mnek+kJs9SMlzLrrkOxGCGh+7EuJI6qnZE/NHJW
         fJPYRVF8+E37TdXiHX8b2xohG9/CAu0z7ifdbNqs1DT3/6Ghc+3cLogLz6aHqZ7JobsP
         cqQnyA8k2va/U8exLxH2EILfAnqWWgdWy7j8BDXqnYLFZiLIZGrA9UGccLeneB32wS0N
         TgDnsfaOj8s6iC5yOFVjk8piFtI3QAckQvQyrbZyDQdE5h48OVDhGXorh7fd2gHpsZLg
         N47w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782716459; x=1783321259;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=nmmf+pnJxsnUoyC6tMjVno2cHFN4son79GGotpRL1es=;
        b=mx7rHzGslx73y9hY/CvJPfwih66MevK3j9bmqPKUpoQeHrhHBxflK4CzhPXFn49efT
         QZlPKG1SZKtpUF8wPBoOGtQEZRIgMXAxfiOUAlG6LAHuq0dYMJmc07cNq0P45vZU8dRY
         Ze7AT1rwPZBm1nummnAzLuSGoh5+cDp7IX+aVnBMj2S9QT+aMuWJsMhjClRlqoT/Xv4r
         TpzR9EDQqS3B69raoWJNaAlapDjwJEXthzQZK7DOS0gdDUn4edKvDkZyoLtC2UJafB06
         xZ1BpPGrYFALQ0TnbpnitDLXKBiYDyhNXVVHU+r5NFiGAdOgCyVRboOQFnj4T6F7s7ip
         8W5w==
X-Gm-Message-State: AOJu0Yzm0Grfvdcm37+1ubMk5dngQorR7xQ+tJf4Dim4Bfj04JVGsepp
	q4WrR1Or7L52d5y8aDcxigRV0wsiBNL/GARGsG4TUkD3S4mcmNcbsQQ0
X-Gm-Gg: AfdE7cm8xTfLIhdzEXlknCw65SSvgLjteN2vA2MxxA/s05Sftl9wf+2LzGEyRO2FGYV
	P9K8O9+MJwDlp+knaLYIDIt2s48e9PMOaVCXWpKElS89ReMl03kY0FMJOAxoqdIVnXeRYfyb7C2
	Nn34tT8ev+T9KJRwkt0CT1tPmDftfdMUdxGmUUi5SXDhucpmjB3Xx/RgH5Kc1c+RN4hxlXaj1EU
	SIiudSFMjIoC+teAVvlJiWDJ6DXs+wpus4v3svZjLN+UomKOrV7i0fOD3HlSqDBeuqN+84BDPII
	0FPgU+rAfrG0YuiMimC+jqkInC8MQgCal711iR+S87hyKInYuApq61Oe/qVTJWI+qOWnRSvKQj7
	gcv7cTIRLi4ztpV7RB5+GbSg0gOtY8Bmdrr48ntr000N7y9aVOh41d70AUsDDeASpygG7WXVGDv
	IIrErj18KCFfJz9xztdhEGRw==
X-Received: by 2002:a05:6a20:a113:b0:3bf:7ab7:98a4 with SMTP id adf61e73a8af0-3bf7ab7993dmr6076634637.27.1782716458824;
        Mon, 29 Jun 2026 00:00:58 -0700 (PDT)
Received: from nuvole ([2408:844c:b00:2b2f:398a:8bef:b88c:653a])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c92bcc90af5sm7061725a12.28.2026.06.29.00.00.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Jun 2026 00:00:58 -0700 (PDT)
From: Pengyu Luo <mitltlatltl@gmail.com>
To: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
	Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
Cc: linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Pengyu Luo <mitltlatltl@gmail.com>,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: [PATCH v2 2/3] arm64: dts: qcom: sc8280xp: Add camera MCLK pinctrl
Date: Mon, 29 Jun 2026 14:59:04 +0800
Message-ID: <20260629065905.15651-3-mitltlatltl@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260629065905.15651-1-mitltlatltl@gmail.com>
References: <20260629065905.15651-1-mitltlatltl@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-114862-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER(0.00)[mitltlatltl@gmail.com,linux-arm-msm@vger.kernel.org];
	FREEMAIL_CC(0.00)[vger.kernel.org,gmail.com,oss.qualcomm.com];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCPT_COUNT_TWELVE(0.00)[12];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:bryan.odonoghue@linaro.org,m:vladimir.zapolskiy@linaro.org,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:mitltlatltl@gmail.com,m:konrad.dybcio@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mitltlatltl@gmail.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	RCVD_COUNT_FIVE(0.00)[5];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	ALIAS_RESOLVED(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,linaro.org:email,sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 7D43A6D6E96

Define pinctrl definitions to enable camera master clocks on sc8280xp.

Suggested-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Pengyu Luo <mitltlatltl@gmail.com>
---
 arch/arm64/boot/dts/qcom/sc8280xp.dtsi | 56 ++++++++++++++++++++++++++
 1 file changed, 56 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sc8280xp.dtsi b/arch/arm64/boot/dts/qcom/sc8280xp.dtsi
index a2bd6b10e475..0dbcd3069a3b 100644
--- a/arch/arm64/boot/dts/qcom/sc8280xp.dtsi
+++ b/arch/arm64/boot/dts/qcom/sc8280xp.dtsi
@@ -5484,6 +5484,62 @@ tlmm: pinctrl@f100000 {
 			gpio-ranges = <&tlmm 0 0 230>;
 			wakeup-parent = <&pdc>;
 
+			cam_mclk0_default: cam-mclk0-default-state {
+				pins = "gpio119";
+				function = "cam_mclk";
+				drive-strength = <6>;
+				bias-disable;
+			};
+
+			cam_mclk1_default: cam-mclk1-default-state {
+				pins = "gpio120";
+				function = "cam_mclk";
+				drive-strength = <6>;
+				bias-disable;
+			};
+
+			cam_mclk2_default: cam-mclk2-default-state {
+				pins = "gpio16";
+				function = "cam_mclk";
+				drive-strength = <6>;
+				bias-disable;
+			};
+
+			cam_mclk3_default: cam-mclk3-default-state {
+				pins = "gpio17";
+				function = "cam_mclk";
+				drive-strength = <6>;
+				bias-disable;
+			};
+
+			cam_mclk4_default: cam-mclk4-default-state {
+				pins = "gpio6";
+				function = "cam_mclk";
+				drive-strength = <6>;
+				bias-disable;
+			};
+
+			cam_mclk5_default: cam-mclk5-default-state {
+				pins = "gpio7";
+				function = "cam_mclk";
+				drive-strength = <6>;
+				bias-disable;
+			};
+
+			cam_mclk6_default: cam-mclk6-default-state {
+				pins = "gpio33";
+				function = "cam_mclk";
+				drive-strength = <6>;
+				bias-disable;
+			};
+
+			cam_mclk7_default: cam-mclk7-default-state {
+				pins = "gpio34";
+				function = "cam_mclk";
+				drive-strength = <6>;
+				bias-disable;
+			};
+
 			cci0_default: cci0-default-state {
 				cci0_i2c0_default: cci0-i2c0-default-pins {
 					/* cci_i2c_sda0, cci_i2c_scl0 */
-- 
2.54.0


