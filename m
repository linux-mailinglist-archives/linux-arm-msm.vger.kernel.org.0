Return-Path: <linux-arm-msm+bounces-92399-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cXSzD0isimneMwAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-92399-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Feb 2026 04:55:52 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B834116CF9
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Feb 2026 04:55:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 524D6301E7CD
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Feb 2026 03:55:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2AA0B29B795;
	Tue, 10 Feb 2026 03:55:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BtlraZea"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-dl1-f50.google.com (mail-dl1-f50.google.com [74.125.82.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EDAD5296BC1
	for <linux-arm-msm@vger.kernel.org>; Tue, 10 Feb 2026 03:55:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770695749; cv=none; b=i7c02h3Z0qOEttJLd5RhX1ERF/hTPXWwIGNcl3Qg0ApWmmZq3FzT8E8ibxgPA2L0wUZLzJk50KUIrGGm2xBJqTNo+pJsMFtI1Jbio4kXvGnJhhd9YSFVaa2alxkCTtD2m7nOWE4IMWUbFG9BML8iTOwm7X6guDzRceXtix9l/CQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770695749; c=relaxed/simple;
	bh=BGFbjAQGLZNXddJ7Zbnf+eR42ONlD2v8hRdM+CSNiEE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=HfuPQaLKoQK3iRkoZmOej198q91cRasFpeGyqGS4roi3GYoMKY9YmUDkWQDzsn982IKs65oBjFhLxt9M5h1SvXRIIlib6auyCn+7Icu5jFVblVBGVKNZlvg25SvFgN+SaD1XCmUfFAz6Ix+bZSC3i/LZSxt+aA+v5cIGIERrAtI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BtlraZea; arc=none smtp.client-ip=74.125.82.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-dl1-f50.google.com with SMTP id a92af1059eb24-1233b953bebso723813c88.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 09 Feb 2026 19:55:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770695747; x=1771300547; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Q42/v/aKtXIsSN3fGfEiA94YbSmv523XY3uYLKo5rl0=;
        b=BtlraZeavkpoZHG4sgeFcJeZoun3J286TRZk9+lqFcQHqdOIGRCoZtPJEGlC9V99bs
         3El8G9raPdx8lmiGZdeBYWJA3AqT8COFAbCku8CQGR8A4eErO1yWyX6zxV3QaNFt8d5i
         qknWYW8DuAM256Ue02BBh5txppN/UQjEknwTl19jzODbjEVupUyblp5Aw1F/k1B+CFBY
         VFv+Bx3vC0sst/JCcHm+qf2M9KckKAO8XfltFbAb+gpNxqyG6OeHIPBAGA4JMYiKPP2f
         qSB/McNp1jdc+STleF6U6j2us2y7xN1QVZJ00wNT3+mmpH5P3MJpeJKXjkpQEK/ijwE7
         BZGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770695747; x=1771300547;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Q42/v/aKtXIsSN3fGfEiA94YbSmv523XY3uYLKo5rl0=;
        b=uYM7EahjA908Don1KmYJEy8PiTLtXV3MlZsud+RMVsSKiYNjrsDR93YHS3nEnTtRoD
         Bnv4JjsiPb/aYSlfafOx/zuLx7NZAWBCOZjuEPntn67deQX+qP8JXoseRj5t5GMRC4lr
         9FbjIAseaVsrIij6jTHYL9s6iEI8iTNNCpNtEISSOr7LRb9GTR8DRgQ+nV4HcKQH1/No
         i/yyXYG1Rp/f2eB/nm+p13isBXGWKsjotcCaCuEnyX3465e/S8TMrEMml3Q32ys90JYC
         E2KrxcDxRwZtUSgEAG5FFw7fqfnw0O7uDfkTW7AOi/Mpb+++KrBOm7UpfZSGy7vYkIqM
         2mPA==
X-Forwarded-Encrypted: i=1; AJvYcCVjdyr/kMgGSsM9rkcCY9JDBkthSr/ecdlRcEm2Rlbvx7N3JevHGPFMWcibFFvPmUEaEnANoAxXSuUuvQZ7@vger.kernel.org
X-Gm-Message-State: AOJu0Yw+q0bB3WqowmFXb9rZs6pAFq1KWQKlYYuCf1ErCfSiGzOxFCng
	HBXDQVa/eAVBBwKAKRD7Mx9Uj0LhjOOXEl6CQFIUVFbMBB7nnIl+yRXcVdiajQ==
X-Gm-Gg: AZuq6aJI8vDEA+IQTidWyXH4mCKXK+9+3TsIdgLDpNRSVyS3ROyuIkalDox94qK75F5
	v2d2zqMoPFJXYRa/iT41WsU/6GH/O4v9WK8yr2sqIdSFKCPrWgHR/nGz5RwPqImrrfxaLLob766
	GObVka1Nfb5DB8FyDpr3RKHIUdrT0T8hHJ2BRZb01Y1Wd2JnPVCVOhxf83anmjVa5831f61OZfe
	qKKmF3GoyTz2AkbHK2Ok4eOJxQEtt343zPj9EFmX05oaPcpIQlF0r3rrMQpk6vxZRCkBi5svycF
	yZdXmb3IhLCGGZeSko4D14Ilh9ZNxzdDVkNOrYo/zh8/GXq0P5KG5MuXMEx+OXQe6T57PEaphe7
	y4b85oGcxXKuT5jpAD4AlWoqCCC/82EPKOvyU5Jtv/PAP0s+j7EtcJWB3U0kSGyAyEWV1xHWh2p
	kXuMYLj1eOcot+GGGlVnReOCsNb8ZYHQTq2/zzl6dKnSSaQ/hE25GFvyh4/NJ8BCvv9SAa/9htm
	6MSQJOnK6DirqE=
X-Received: by 2002:a05:622a:143:b0:506:1f11:f5ef with SMTP id d75a77b69052e-50639a19051mr189985021cf.73.1770688903651;
        Mon, 09 Feb 2026 18:01:43 -0800 (PST)
Received: from localhost (bras-base-toroon21-grc-75-184-144-58-243.dsl.bell.ca. [184.144.58.243])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8953c03fca0sm89313956d6.28.2026.02.09.18.01.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Feb 2026 18:01:43 -0800 (PST)
From: Richard Acayan <mailingradian@gmail.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Robert Foss <rfoss@kernel.org>,
	Todor Tomov <todor.too@gmail.com>,
	"Bryan O'Donoghue" <bryan.odonoghue@linaro.org>,
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
Subject: [PATCH v8 6/7] arm64: dts: qcom: sdm670: add camera mclk pins
Date: Mon,  9 Feb 2026 21:02:05 -0500
Message-ID: <20260210020207.10246-7-mailingradian@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260210020207.10246-1-mailingradian@gmail.com>
References: <20260210020207.10246-1-mailingradian@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FREEMAIL_TO(0.00)[kernel.org,gmail.com,linaro.org,intel.com,linux.intel.com,vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[19];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_FROM(0.00)[gmail.com];
	TAGGED_FROM(0.00)[bounces-92399-lists,linux-arm-msm=lfdr.de];
	FREEMAIL_CC(0.00)[collabora.com,ixit.cz,vger.kernel.org,gmail.com];
	PRECEDENCE_BULK(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	FROM_NEQ_ENVFROM(0.00)[mailingradian@gmail.com,linux-arm-msm@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	DKIM_TRACE(0.00)[gmail.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_HAS_DN(0.00)[]
X-Rspamd-Queue-Id: 9B834116CF9
X-Rspamd-Action: no action

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
index 3eb4eaf7b8d7..f21e60a6a2ef 100644
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


