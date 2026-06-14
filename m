Return-Path: <linux-arm-msm+bounces-113044-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id uf7uEtOnLmp91gQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-113044-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sun, 14 Jun 2026 15:08:35 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id D35E0681152
	for <lists+linux-arm-msm@lfdr.de>; Sun, 14 Jun 2026 15:08:34 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=quora.org header.s=google header.b=YkbY6FoP;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-113044-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-113044-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=none;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id CC6413024141
	for <lists+linux-arm-msm@lfdr.de>; Sun, 14 Jun 2026 13:07:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2E31B3A3835;
	Sun, 14 Jun 2026 13:07:02 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com [209.85.216.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69A023264DA
	for <linux-arm-msm@vger.kernel.org>; Sun, 14 Jun 2026 13:07:00 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781442422; cv=none; b=dEKR8wwSMbqLYVtZu/kuObUx7Hen4JIEWImxgFKAXySXrE1Qnx7cQdzPWOpUqdSJH3rA8uGbCWtFhoZXSP/drXtSUqPOONhZqHCWZj9Ad8LfvvDNCDqcyB4+tB5cbzDutjsjq80fkujB9cfrKZK4B5Gu8xuCtL0lL9fGSh2b2ZE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781442422; c=relaxed/simple;
	bh=QsoPhsS9WzNC0uacJrOCe3ywqXN5XqTFFBgMo6hKexk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=g04KbdbnHxHsKukbyViqPtMcSn7lpNwwxig/UwJnhRpxLI8juPGPPVXopQ+naHkKoUCAdLtDn1yvXJ6W0JuOUcSM/i660clwP3MK1lMqtN87yMhb99qH7KA7dLVwdXUgnbIZNf1mQgew+cReVoy8OZxQ+c129xFYrduR1KwGfJs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=quora.org; spf=pass smtp.mailfrom=quora.org; dkim=pass (1024-bit key) header.d=quora.org header.i=@quora.org header.b=YkbY6FoP; arc=none smtp.client-ip=209.85.216.41
Received: by mail-pj1-f41.google.com with SMTP id 98e67ed59e1d1-36bdb11bf8bso1332391a91.0
        for <linux-arm-msm@vger.kernel.org>; Sun, 14 Jun 2026 06:07:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=quora.org; s=google; t=1781442420; x=1782047220; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6tmAlJB2ngMbanaT32XezSYB4jpA6Xw7VV1hV0X6tFw=;
        b=YkbY6FoP/k1UF9KEKevfctniAA3sJT+CORZnRJUGXBLjqCEEi1CLk9K5cOdpZ/d3Kg
         7GZcflQlUst4E0NWQeMbEHCJ8/S2YyBQBZxP1wg/KBC7/yQ/pRKgpMfGdxENb+utm7T0
         b1MR/WOAwx3sFCk1SohQzUPunlBjzmKMj8Dmo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781442420; x=1782047220;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=6tmAlJB2ngMbanaT32XezSYB4jpA6Xw7VV1hV0X6tFw=;
        b=X0z9mJY8BDcsAZjYmym2WokOFHCdz4SoMU20LZmVnnw9JjKXMwJTccEfDyGein7r+V
         Uzs88uaSdVlFoI7GIOE35414ssUl+ebfaOze1noOxFswQbdjW0ONpuvYs+9vlKx2RxJ8
         sjdqoMgErnv4gvFGo5UbwbBIj8Qe/yfz+pe6TKtSX40tb5hwmaaT/jTmHqxc/RVsI7Tz
         4/TzAUNujT4901/EIvDmLvQ85E2F3nRRah/pgh+dBe95AWw+cxKPgWerOW3ZoAi3h9zE
         Hpsse3kXf0MI9V3Ive5Q8YEw0qLYlt11vj+TrqgmxkrZj0KVLEWMK50od7d5uK+GN74a
         2j2w==
X-Gm-Message-State: AOJu0Yy3Mijt600AR5P76M/7nOEmxq7/yR9qh93KRVF1shAx4GAvtFHN
	TWYo/xjQRiMVy6+FPLxdJhp99nKew4s6G4rr02uZotAiMT8kKS6xgca2qTvPSHZ7EEk=
X-Gm-Gg: Acq92OH49JLhhgMVUBwRuRpaj1+feUmuqgmY/GtMbtCpjFP72IB/KFwJSJxgiUHKWR3
	AIaaP6derZIZew+hJqNaDGD+nnfZe4MfK/r5jppmAGleY83cPFnQzSO4A9VHug3elpYbYRuM4W/
	/caZRbDdxVt+XyP8NeXQFfy6AiECwR2B6/Kf/X1nIthQr2gooMK2ggVv8h++cdDKp+xlop0Ye7I
	Ext4BUKV+bzVWtWMLKBcmOWMfQjVo0RBHCBI4BOk0IaO/jtxYWI1apfDukVcqsIdeBFzizjohMo
	/Xkfu1oNjlnICBkO6wd85pbVXxAXN30Bngxb5gbLgcVpnQrOIxYZGxX4PdqgWCaYRGI0k44+ySv
	QuAKVXYXZsscnqiDIYKDxhXP3z4oqbqEBPfAJuxQHHrmR3IOSQ5em4Tu+vrk6d8608xAtZvL8Tg
	nk1VmYj4DhYC+MsP8xFeckNrBnp3yjeonPFPEe1kVBtU750R0QuinsVLif0Bmx8N+zz26H5IjA+
	Dkswp/PyTl7lsPcqtp4ahIGOHDpfGqPIdSfgppsUoyYaOt5pHu0G4vbsQgAQGtd1vCPcE/6YM3h
	jqxhrwaBukWH9LfO6Z00bXeT0rpfC9C5CCS2LWUzRwGbyjR9ulgeEuwkOLbfDqLtoDpzkiIX
X-Received: by 2002:a17:90b:3a05:b0:36b:944b:fd81 with SMTP id 98e67ed59e1d1-37a01845ec7mr10301235a91.4.1781442419833;
        Sun, 14 Jun 2026 06:06:59 -0700 (PDT)
Received: from aegis ([2001:fd8:4d03:c800:f499:6f6c:fbd4:8f])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-37a1c4abe46sm7758344a91.0.2026.06.14.06.06.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 14 Jun 2026 06:06:59 -0700 (PDT)
From: Daniel J Blueman <daniel@quora.org>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
	"Bjorn Andersson" <andersson@kernel.org>
Cc: linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	"Sibi Sankar" <sibi.sankar@oss.qualcomm.com>,
	"Rob Herring" <robh@kernel.org>,
	"Krzysztof Kozlowski" <krzk+dt@kernel.org>,
	"Conor Dooley" <conor+dt@kernel.org>,
	"Hans de Goede" <hansg@kernel.org>,
	"Randy Dunlap" <rdunlap@infradead.org>,
	"Bryan O'Donoghue" <bryan.odonoghue@linaro.org>,
	linux-kernel@vger.kernel.org,
	Anvesh Jain P <anvesh.p@oss.qualcomm.com>,
	Maya Matuszczyk <maccraft123mc@gmail.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
	Akhil P Oommen <akhilpo@oss.qualcomm.com>,
	Abel Vesa <abel.vesa@oss.qualcomm.com>,
	Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>,
	Daniel J Blueman <daniel@quora.org>
Subject: [PATCH v4 2/2] arm64: dts: qcom: x1e80100-lenovo-yoga-slim7x: Add Embedded Controller node
Date: Sun, 14 Jun 2026 21:06:18 +0800
Message-ID: <20260614130621.68811-2-daniel@quora.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260614130621.68811-1-daniel@quora.org>
References: <20260614130621.68811-1-daniel@quora.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [1.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[quora.org:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[20];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-113044-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER(0.00)[daniel@quora.org,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS(0.00)[m:konrad.dybcio@oss.qualcomm.com,m:andersson@kernel.org,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:sibi.sankar@oss.qualcomm.com,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:hansg@kernel.org,m:rdunlap@infradead.org,m:bryan.odonoghue@linaro.org,m:linux-kernel@vger.kernel.org,m:anvesh.p@oss.qualcomm.com,m:maccraft123mc@gmail.com,m:krzysztof.kozlowski@oss.qualcomm.com,m:dmitry.baryshkov@oss.qualcomm.com,m:akhilpo@oss.qualcomm.com,m:abel.vesa@oss.qualcomm.com,m:gaurav.kohli@oss.qualcomm.com,m:daniel@quora.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	DMARC_NA(0.00)[quora.org];
	FREEMAIL_CC(0.00)[vger.kernel.org,oss.qualcomm.com,kernel.org,infradead.org,linaro.org,gmail.com,quora.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[daniel@quora.org,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[quora.org:+];
	RCVD_COUNT_FIVE(0.00)[5];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	ALIAS_RESOLVED(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,linaro.org:email,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: D35E0681152

The Lenovo Slim7x uses the same Embedded Controller as the Qualcomm Hamoa
X1 Customer Reference Device. Use the lenovo,yoga-slim7x-ec compatible
introduced by patch 1 for fan control, thermal sensor and suspend
behaviour.

Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Reviewed-by: Sibi Sankar <sibi.sankar@oss.qualcomm.com>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Daniel J Blueman <daniel@quora.org>
---
v4:
- add reviews
v3:
- use lenovo,yoga-slim7x-ec compatible (introduced by patch 1)
v2:
- corrected DT compatible node

 .../dts/qcom/x1e80100-lenovo-yoga-slim7x.dts  | 22 +++++++++++++++++++
 1 file changed, 22 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/x1e80100-lenovo-yoga-slim7x.dts b/arch/arm64/boot/dts/qcom/x1e80100-lenovo-yoga-slim7x.dts
index beb1475d7fa0..1ee2a2296129 100644
--- a/arch/arm64/boot/dts/qcom/x1e80100-lenovo-yoga-slim7x.dts
+++ b/arch/arm64/boot/dts/qcom/x1e80100-lenovo-yoga-slim7x.dts
@@ -951,6 +951,22 @@ retimer_ss0_con_sbu_out: endpoint {
 	};
 };
 
+&i2c5 {
+	clock-frequency = <400000>;
+
+	status = "okay";
+
+	embedded-controller@76 {
+		compatible = "lenovo,yoga-slim7x-ec", "qcom,hamoa-crd-ec";
+		reg = <0x76>;
+
+		interrupts-extended = <&tlmm 66 IRQ_TYPE_EDGE_FALLING>;
+
+		pinctrl-0 = <&ec_int_n_default>;
+		pinctrl-names = "default";
+	};
+};
+
 &i2c7 {
 	clock-frequency = <400000>;
 
@@ -1352,6 +1368,12 @@ &tlmm {
 			       <44 4>, /* SPI (TPM) */
 			       <238 1>; /* UFS Reset */
 
+	ec_int_n_default: ec-int-n-state {
+		pins = "gpio66";
+		function = "gpio";
+		bias-disable;
+	};
+
 	edp_reg_en: edp-reg-en-state {
 		pins = "gpio70";
 		function = "gpio";
-- 
2.53.0


