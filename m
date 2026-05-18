Return-Path: <linux-arm-msm+bounces-108289-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8BfxHzx2C2oZIAUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-108289-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 18 May 2026 22:27:40 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id CCFF4573616
	for <lists+linux-arm-msm@lfdr.de>; Mon, 18 May 2026 22:27:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id DF65030907E9
	for <lists+linux-arm-msm@lfdr.de>; Mon, 18 May 2026 20:23:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B7BB03932C2;
	Mon, 18 May 2026 20:23:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SlmOn0XF"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f179.google.com (mail-lj1-f179.google.com [209.85.208.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0926E391828
	for <linux-arm-msm@vger.kernel.org>; Mon, 18 May 2026 20:23:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779135799; cv=none; b=PX2cjyO90kEDzDNu0QEyLe4WcO28oFEAV2TH3t1AFVcC64g9DUSGT1CJLxHA6cwNqJm4NxtqV1m9y70T8+Tmvfk2WgldIRefM/KTe/DRBJqRFSz7828QrhRwclGXeHycDKlKxV4QXjWVJCAE1Lq6UnPiGzC76s8rXqyuzoGzvEk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779135799; c=relaxed/simple;
	bh=CJeSSYYnZeStLm7YVc5JWFlVV48PQFOvjmfLZx4cw/U=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=TydgRVn86PYuNeAVlUmY1PY/XK8cjrSoKzSVAuZ/3XbaK7VTeUq0IhGMDSZP/AAgLfPWRoDF8HjxJXZv1QXT63r5YwUhUef0X3+eFQS221SK5qD18xYLG3/n21f0PIXPMBGSypG9Nv+VIMJsgXWDI/6gCoYGBcelKOg/gkbBgHM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SlmOn0XF; arc=none smtp.client-ip=209.85.208.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lj1-f179.google.com with SMTP id 38308e7fff4ca-393a44854d2so26522421fa.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 18 May 2026 13:23:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779135790; x=1779740590; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tLtvCiHLhOODkbTb6ldPXwhZ1lgl9LVuxx7kGug/QYY=;
        b=SlmOn0XFAv6VxT8niudZz3kzeKSzKL0MZZrEh2uMcyPYPhOk3IiOEq+m1keWp6lJGl
         6CWdHexjCw4Ilm3Yb9uOS7fPXM3cBgT300bb1qjOV2TgV4xYbUuxo4V7YKwycu9cfoxn
         +owxja5rcHk8aEeR7vzEeGVjOxnq0NLEhvyIGFSUirioGAc1FHGOYYqNZGdKieuVzbVn
         s3OT2KVf+IkcRRG0o4EF/MHYgNQghvvrEajsC7FM51LDx1bIeNMff4FWCIaSjpB1Ded6
         /cdtRBjETTxg1Tz1Gmdfg2zHIZxoawWxsIv+oNikpqrGhhSUvQRDUTiCZNZpyE5viUCq
         iFMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779135790; x=1779740590;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=tLtvCiHLhOODkbTb6ldPXwhZ1lgl9LVuxx7kGug/QYY=;
        b=TTTkGFOTNaQZpi7zXnSsv2vkVdYLp+F2aF8b3QxQWS/9Xp1OJaSKC3NkiItEG48eZ3
         a3l3t3VNxm1vtiGK+XZjC0g5foBo5HEiBNvUei3yHB7nUB4PpC1z3YiIwf4qZlqgv9SZ
         oop6YdP5mYS/B118ZrLjpSHnC1S8dqfbGnVsv8n53jtPOXAD0L0odKKrUQE9pKiY1kQl
         /qpd9M916hShe0jJG5i8rgiB+GEFJJR3TQm8OxHTSyWoFddr3kCoV76/BRRMFyQyANDV
         mCPoSFsuWt7Kb5vjI8NEgqBTzjpK2/CE0TTbgcTHQBrbSmyUO0UB8jWJOCdLI24rUhK5
         iT9g==
X-Gm-Message-State: AOJu0YwoR0sfnXbbm7yrRKjtQi4Gl0o8b0Nkk8pMrXsPTs+pVBThe+sm
	7jN8LF7F2McEfWNH7NbcpJYkpaSsJjrWXOF1NDN8pt43k6/4YZSIqwWy9896Kq4rZC4fhg==
X-Gm-Gg: Acq92OFKdX8kz8bBfuWsSsE6DzdFn9ohUCc5UiNGhmQVj0NRix8SYRL/5TMFth+GpYs
	RkBDUQkeLegYxZF/my321IC3QJaF7dq7bvQaiQkw41yqxU4GDZ+VD5bcY9cQAO3NHRRsSYb6PbD
	ewEbF0KAoEtTIQRTgEa1nV5QUuSB3dxSPF2d9g7E3cQmZucgDQMRuLG5J72+rd1gaY8Pwg9nquq
	OFxmTZdSrlQKq4O39/zkfT67jb/WJM4E5xzkwxpt/sJvwk5/P35akeec++9afa862XmoeiRAYdI
	aLfafQOBKKru93vMSLeE+8WQXOuK64XoLRXXgnNjoNnTwuuKO78IMb/AN6gQ+qDXkhxIrrF242q
	yHdBYloH+XvvtChzWV9BgmYaLaEGvclpC5gYDDI1f+aPSQvP3K9P0wexLXVaZxP2qpqR2ua2n2K
	ecYpZv/p0kz9Cv9NOInFTnLTHnk1pnjoOKc32uSH0HEVJfaw1ENWw=
X-Received: by 2002:a2e:a995:0:b0:393:a4f5:3e0f with SMTP id 38308e7fff4ca-39561ae1a22mr51690241fa.2.1779135789949;
        Mon, 18 May 2026 13:23:09 -0700 (PDT)
Received: from localhost.localdomain ([90.157.113.57])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-395887b42f8sm15225061fa.36.2026.05.18.13.23.07
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 18 May 2026 13:23:08 -0700 (PDT)
From: taygoth <taygoth@gmail.com>
To: linux-arm-msm@vger.kernel.org,
	linux-usb@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Mark Brown <broonie@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Wesley Cheng <quic_wcheng@quicinc.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Heikki Krogerus <heikki.krogerus@linux.intel.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
	Casey Connolly <casey.connolly@linaro.org>
Subject: [PATCH 4/6] arm64: dts: qcom: pmi8998: add USB Type-C and VBUS regulator nodes
Date: Tue, 19 May 2026 01:22:49 +0500
Message-ID: <10efd57e82ebceedb75dbe3e038af81de4f1557c.1779127507.git.taygoth@gmail.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <cover.1779127507.git.taygoth@gmail.com>
References: <cover.1779127507.git.taygoth@gmail.com>
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,gmail.com,quicinc.com,linuxfoundation.org,linux.intel.com,linaro.org];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCPT_COUNT_TWELVE(0.00)[16];
	TAGGED_FROM(0.00)[bounces-108289-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[taygoth@gmail.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	RCVD_COUNT_FIVE(0.00)[5];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[0.0.5.20:email,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,c000:email,0.0.4.76:email,0.0.3.232:email]
X-Rspamd-Queue-Id: CCFF4573616
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

The PMI8998 PMIC includes a USB Type-C detection block at SPMI offset
0x1300 and a USB OTG VBUS boost converter at offset 0x1100. Both are
left disabled here so that only boards which wire up the connector and
USB role-switch enable them.

The VBUS regulator falls back to the qcom,pm8150b-vbus-reg compatible
because the OTG register layout (CMD_OTG, OTG_CFG, OTG_CURRENT_LIMIT)
is identical to the PM8150B SMB5 block.

Signed-off-by: taygoth <taygoth@gmail.com>
---
 arch/arm64/boot/dts/qcom/pmi8998.dtsi | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/pmi8998.dtsi b/arch/arm64/boot/dts/qcom/pmi8998.dtsi
index cd3f0790fd42..08a5f58c9b85 100644
--- a/arch/arm64/boot/dts/qcom/pmi8998.dtsi
+++ b/arch/arm64/boot/dts/qcom/pmi8998.dtsi
@@ -29,6 +29,25 @@ pmi8998_charger: charger@1000 {
 			status = "disabled";
 		};
 
+		pmi8998_vbus: vbus-reg@1100 {
+			compatible = "qcom,pmi8998-vbus-reg",
+				     "qcom,pm8150b-vbus-reg";
+			reg = <0x1100>;
+			status = "disabled";
+		};
+
+		pmi8998_typec: typec@1300 {
+			compatible = "qcom,pmi8998-typec";
+			reg = <0x1300>;
+
+			interrupts = <0x2 0x13 0x7 IRQ_TYPE_EDGE_BOTH>;
+			interrupt-names = "type-c-change";
+
+			vdd-vbus-supply = <&pmi8998_vbus>;
+
+			status = "disabled";
+		};
+
 		pmi8998_gpios: gpio@c000 {
 			compatible = "qcom,pmi8998-gpio", "qcom,spmi-gpio";
 			reg = <0xc000>;
-- 
2.47.3


