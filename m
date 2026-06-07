Return-Path: <linux-arm-msm+bounces-111577-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id zrQqHwOXJWqLJQIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-111577-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sun, 07 Jun 2026 18:06:27 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id E6038650ECC
	for <lists+linux-arm-msm@lfdr.de>; Sun, 07 Jun 2026 18:06:26 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=sAfrdMg+;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-111577-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-111577-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 49AAA3010245
	for <lists+linux-arm-msm@lfdr.de>; Sun,  7 Jun 2026 16:06:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B1F8C2EEE80;
	Sun,  7 Jun 2026 16:06:09 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com [209.85.216.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D3AD2E9729
	for <linux-arm-msm@vger.kernel.org>; Sun,  7 Jun 2026 16:06:08 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780848369; cv=none; b=T4zzqPQ7zvs8kK/lY6lDEFoh7CrX+1oVw2G+mSn5/RfC7DSkRf1TF2X2WHGkhOhHs7URDEDewWEy10Rgwn0gO30BqZjMM1mkFtE+WlMhKk5+6eXsBKXslBlPyCt9dgChRwDyNOKOa8hkwUwtLqmIWdKmRG3XFOfDnAU0ZbA1iNY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780848369; c=relaxed/simple;
	bh=bzd8f03sMUrmwvIvxHcfIzMT13ih+srzayOhdI8kYqg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=tN+QGFPi3cIjkMjqN2/mM3nayLyJzdwb3fCHFsPyw/G3Oxdtknw4VbeF0DLONhGJeDSRkl3Db151H+tmq7xlsZ0pKtoAGUJqIMDx8oWsGj3cuAfqJ/UmDB3gHFpUtCX7aNpqGVuocmSig7XTg2v9f0sSL9BPQf1yWrZnOE5+9sY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=sAfrdMg+; arc=none smtp.client-ip=209.85.216.41
Received: by mail-pj1-f41.google.com with SMTP id 98e67ed59e1d1-36babe2c4bdso2046893a91.1
        for <linux-arm-msm@vger.kernel.org>; Sun, 07 Jun 2026 09:06:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780848368; x=1781453168; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=OYxrYsMuwkeIgQXR6u87qfS7qgAmP67AlIc3XbzwrBM=;
        b=sAfrdMg+/d+bfaPlKO1IPgeWdHyl+9gcAcelHFOLB/otILVP+FWsXau8b2+lN6YX1m
         5ABeq6cN966Ga1Cp+vsgIXt53+MY00b1jjopa5blr9dFFbAmfN+icCW6/jTT6F4bBpB3
         YrDg2dlV0eJvUGRDc4rW0eIgbs83R1Js7JNfteF+BPr9MSRqEvEQd94z1PH5WF4QPF9h
         ZDDwk2+1WC3bLfv23g1K8wTfUCUg5ukl0DJx4xf2/5BBw58kDrwAEujawdpu+cO1QZiI
         m8c17iAxpAQ8hCFpuwAUFF0SI5W5bAyM/Faz+6ex9h8CMXZOsgJG2HwdbIO2MoqEtM/2
         sxsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780848368; x=1781453168;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OYxrYsMuwkeIgQXR6u87qfS7qgAmP67AlIc3XbzwrBM=;
        b=a3jvdG5Niehi3/HJqihMr2hXRQSY1rcG0eJs+JPbqx/IzVIYTKlpmXivAiJ5KG2ExU
         pvq2IH5tsyEz9q/OkEN15IsEnrwlqFiYpRsj9Wa3qO81PlszRjdsDMDPgnCoUSHwlI3e
         mIXf90d4Tn5dm0bEZgEWrRkUnacDPt/C1TbQWOV3NSrUJ9wIqBR6TPUJjZ2ZRPUUhOpV
         5H9gLLxw+WGC1LRV4A0vB5EbubYQPaldu9zrpQF8Y1LmNJC7wIqPQLiWksgxf1sVP2tw
         lXCBSDSvSbMOC+78tSWhhUHQ9IkQkuFjZRn4pPCSXtj/4WWU0dY/AZs9u3vsmpD+ZqIG
         TvMg==
X-Forwarded-Encrypted: i=1; AFNElJ9sV3hk1954GE30yhb6IfNZdqG79V3g/aRKGCrDEfu49fWwvgwBOL1BSCKcBH5p3JBBW6IDB/urln0emqAj@vger.kernel.org
X-Gm-Message-State: AOJu0YySMOCnnHTWjL92xWJ1gq+PXNH52H2VOAbwyL45GjF3DIO3SGcB
	psBdUGtV2CNqOXyK1w2cAxpDrhAOgl0hEF3/RUlkc4cDY1/VZDVce6wd
X-Gm-Gg: Acq92OEwlztF8v+kSUbE42iZKpA25sY0DPzM+kKH43Ka5v+qlT5hlFvaJHGQrV5kGIt
	RlDQciHwuxVI7OURqhoSERma46OCb/v0jRAy1O0lkjCLD0v4oDrJxWy+kifFm18yyt9KLLCrvhD
	VTGA9ts5BbjUCFhwQGgEpQX0QRifxQnWmPpfdT/vmPDMxbsNJvTnAzzB4ivQRNx/pgMNmXYvr0K
	07DuX7fkhhJg9+xgj7gnfkZLyriH+yp1yBm/8RRjzYD5V2xqdqjdDspoWUDWc/owlnSsCKg8b/U
	sHIRrNqJA0fRQYoBiwikEzXzCohEoDZ5oH0AyUD6MqlswjRJppt1VyON3PcmUF79rjYjyz9G6U/
	9Z8LsUPHqEPd/cyUYeUSbjuSAgN68qQ1GMXpcfJ7fCLaCDltluMwk+WMR20XolEFTi9jULlKuhk
	v6jdOz57DiLcYQLpotRd+VPXSqP/L1dO8=
X-Received: by 2002:a17:90b:390e:b0:368:1064:62f7 with SMTP id 98e67ed59e1d1-370ee33cfabmr12988882a91.6.1780848367737;
        Sun, 07 Jun 2026 09:06:07 -0700 (PDT)
Received: from nuvole ([2408:8448:9020:52d:18d5:d85a:8989:26c7])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c85df03498csm14857134a12.1.2026.06.07.09.06.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 07 Jun 2026 09:06:07 -0700 (PDT)
From: Pengyu Luo <mitltlatltl@gmail.com>
To: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Pengyu Luo <mitltlatltl@gmail.com>,
	Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 1/2] arm64: dts: qcom: sc8280xp: Add camera MCLK pinctrl
Date: Mon,  8 Jun 2026 00:04:33 +0800
Message-ID: <20260607160435.36546-1-mitltlatltl@gmail.com>
X-Mailer: git-send-email 2.54.0
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
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	FREEMAIL_CC(0.00)[gmail.com,linaro.org,vger.kernel.org];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-111577-lists,linux-arm-msm=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:mitltlatltl@gmail.com,m:vladimir.zapolskiy@linaro.org,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[mitltlatltl@gmail.com,linux-arm-msm@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mitltlatltl@gmail.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,linaro.org:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: E6038650ECC

Define pinctrl definitions to enable camera master clocks on sc8280xp.

Suggested-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
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


