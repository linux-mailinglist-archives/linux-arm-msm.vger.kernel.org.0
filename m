Return-Path: <linux-arm-msm+bounces-101155-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WIyKE8IlzGnHPgYAu9opvQ
	(envelope-from <linux-arm-msm+bounces-101155-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 31 Mar 2026 21:51:30 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id A60B8370D93
	for <lists+linux-arm-msm@lfdr.de>; Tue, 31 Mar 2026 21:51:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 6536D303AF15
	for <lists+linux-arm-msm@lfdr.de>; Tue, 31 Mar 2026 19:44:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0DD0B3F9F42;
	Tue, 31 Mar 2026 19:44:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MaSqrzFv"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-qt1-f181.google.com (mail-qt1-f181.google.com [209.85.160.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F66A3E92BF
	for <linux-arm-msm@vger.kernel.org>; Tue, 31 Mar 2026 19:44:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774986243; cv=none; b=C4TEkeC3Rr/ypSYOb2TkDtWd7uSHLh9CatoOj70LPrn58W0clLxEXyJ3KePIxgZMx6IVAjue64zlnfdEq3xcmA7RyxEpyQxY29+b5BGowSs2iqBkAe2qh8lMHYam/ChbalHd6YBwyraLAc4MWWqG/4w/XvNDCGyAg3lNqie46xg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774986243; c=relaxed/simple;
	bh=qu8bAAJfjLJVtPJ0M7mvCqS6W5WISRGIXt9zkmXzxvo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=bznCwrGTB6rx+Ulo/QvDza9W4IX8sqBzz1DQ/5QqFYE5EpsFw96UZMlWflBMNG2qcIj/puQOVdZHSY+rq7DSDMoMLmyuYfM7nPx2oVvIxJkkgxnIMwqm+ESbbS3sbo/hdBg/4TZxanzzzsAmK506zZ/Plztv2mpfaVv1pgxjjdU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MaSqrzFv; arc=none smtp.client-ip=209.85.160.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qt1-f181.google.com with SMTP id d75a77b69052e-506aa685d62so33684791cf.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 31 Mar 2026 12:44:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774986241; x=1775591041; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qJ6iuzD3e1xlHjcAVLCKvAnVJFh4LA+GcQW5nRxzCOg=;
        b=MaSqrzFvu7/R012pxX4YHaxaJfZnyJusNRa2WCGr4L5mZ0u5S5dBN9RzZ8QV1E/hRF
         gdNP8fkCOB2zKBkhmzUjtfBqv/2MWLYlDAx0mvLW1924Gn7drdoVjNCnqVBJ5PK1ooSL
         dbdyUQUeIdJscj6b2Uw6QN21EsUT59fThvdG+TYJ5ClZbh8hgs0M+CbjiaS03cPWe6NI
         YShPa8GfPrZ37zeNeLF/QxTZG6fhtT86y0Qq1JBm/i8I54qQqqF5IRfuTdynUQklc8Rp
         eR/f+KTW0bxUMXJhz4jEZ2JS4jgea3WsqVLaEm8AnLP2dNL+ryQsXbr1igSP+UmmOrKL
         V4iQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774986241; x=1775591041;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=qJ6iuzD3e1xlHjcAVLCKvAnVJFh4LA+GcQW5nRxzCOg=;
        b=g+EIzjc1N/4Rg3BlgHp5gv76okwUNpXtc92eVXBK3hgSJ8UDwY8fOAbT16c0m8NuKr
         8E4AXSvXqlloRLJIlYq1Cb1TF7U12XA9nTXrUmu92Y+N38CsqP1/pZWXGwEWo6Lew3tm
         TSSu2QDDhlOnT1AMrjerCANJaZcfIQprVbNZSY82qqMQzUBZu0S1/jrDNxM5YvMAo0pV
         pBjoQ7xGm3Oe/NAd8a1cmIj7plmitRfvF33OEtd2ia3zCNy6GgJb09/1lw2P2tpXfyYN
         VN89fYErx+aLVrOBPIW+4DBuQjpurEbkb9wseOkzmYOG6K/pbe6k6+Qu+wXP06t8tOd7
         ELcg==
X-Forwarded-Encrypted: i=1; AJvYcCWDnCEp/euCts8PHNNFSYszk+C6UhrkyGeqz/HmVW4tgFEuFNU6EJCNs1JSJlUPRskWw5k21R0Jat02fYSA@vger.kernel.org
X-Gm-Message-State: AOJu0YyVN4uE4pAJolGNEVpKwNg/hCLACjOc4sq1jiEx45C65ijdzTvr
	IpAfe39zTUD6kbrYklFkGzXkoOXm64guMOhRyAceT7AmxltSM9hbeLMX
X-Gm-Gg: ATEYQzx5PG75dz4BpbIVPdoGIu40lKbPv1bXCXv+6ioijYUArmcPD9u+EbSS6f6dTHk
	qlt7YsqqbTIHKopkoJWHrBdJEHyk82NI3pcL1DNquYPUfg+Y5wegxg8siIViCW5LCo2vCA9K+Gd
	RDBv3gfVuROlq+fTm1mTL5WYcNZXqWh4qgPA/5lRqnx68dbX1b7J5OOGMLtCJc98y9ElCtiPSZ8
	nBgNnDRUAksIZP2u+Gs+MfeI2A8Du8iTvkojfp1J/PYrcaEDrCzmtWFilFRMLVTgJQJKXyjeNq6
	IhQN9ismi2raBTeXpKBqWuJLl5tCURzWouHEfr7/njGkHDLJQyEKGWXz6O9pHEOtTr581G+lNJP
	NCMfIJ1KtjNJjhlpfNBonf2IrthBqqxqeGyl/JgE61e2L7pOlzvmRtfMoQc7inr/QZEVqmy5trS
	r9cR47gKble76s3xeUuUJ3BHl9fDd7wnCHdGM=
X-Received: by 2002:a05:622a:428d:b0:506:217e:b0e5 with SMTP id d75a77b69052e-50d3ba37cdbmr13816891cf.0.1774986241560;
        Tue, 31 Mar 2026 12:44:01 -0700 (PDT)
Received: from localhost ([199.7.157.124])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-50bb2c9c93asm114230041cf.7.2026.03.31.12.44.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 31 Mar 2026 12:44:01 -0700 (PDT)
From: Richard Acayan <mailingradian@gmail.com>
To: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	"Bryan O'Donoghue" <bod@kernel.org>,
	Robert Foss <rfoss@kernel.org>,
	Todor Tomov <todor.too@gmail.com>,
	Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
	Tianshu Qiu <tian.shu.qiu@intel.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	linux-media@vger.kernel.org,
	Robert Mader <robert.mader@collabora.com>,
	David Heidelberg <david@ixit.cz>,
	phone-devel@vger.kernel.org,
	Richard Acayan <mailingradian@gmail.com>
Subject: [PATCH v12 2/3] arm64: dts: qcom: sdm670: add camera mclk pins
Date: Tue, 31 Mar 2026 15:44:36 -0400
Message-ID: <20260331194437.41041-3-mailingradian@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260331194437.41041-1-mailingradian@gmail.com>
References: <20260331194437.41041-1-mailingradian@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[kernel.org,gmail.com,linaro.org,intel.com,linux.intel.com,vger.kernel.org,collabora.com,ixit.cz];
	FREEMAIL_FROM(0.00)[gmail.com];
	TAGGED_FROM(0.00)[bounces-101155-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[19];
	MIME_TRACE(0.00)[0:+];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mailingradian@gmail.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,linaro.org:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,0.51.225.64:email]
X-Rspamd-Queue-Id: A60B8370D93
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


