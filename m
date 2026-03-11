Return-Path: <linux-arm-msm+bounces-96803-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OBzvEVnNsGkKnQIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-96803-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Mar 2026 03:03:05 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FD5E25A94B
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Mar 2026 03:03:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 5624C303052C
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Mar 2026 02:03:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 825532D97A6;
	Wed, 11 Mar 2026 02:03:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jIQz+pqT"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-qk1-f177.google.com (mail-qk1-f177.google.com [209.85.222.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F4602727FC
	for <linux-arm-msm@vger.kernel.org>; Wed, 11 Mar 2026 02:02:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773194580; cv=none; b=Qdsun8gVjWIGcdr0dN8NMxmvu2NQ9LR7gkRq3B7yeUyLIMmM4CEMNqldkwdYAkwAIJy1r2Ghek7t7FPDSPs5S+xHKNQG+xFmixj0evyekx6a6p5fjmOiL7zcXRG13K2sbbN8ywcta9ygdxvuyb+cJys4KO8AJ+QELM5M5Cnkk0c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773194580; c=relaxed/simple;
	bh=7vedanxwL+aX1eYgJ6Asqi7juZBXZ7ygsplulsp3Lys=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=s1XHKkKIIVBZRLSRBabycC3TkgyvsQf3PmhlG/giceFP+ClwJXmIcStDdvPsQ+G9093FNt0IuxDEdaHTsjXH0KaHyW4yaVcbqExlmYE6bWFuZukKow0/mgOaxN1ixfDPwwKcKrvPeyzXEW5NDjcwNQVtJOMScJCaupeWxjXem8Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jIQz+pqT; arc=none smtp.client-ip=209.85.222.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qk1-f177.google.com with SMTP id af79cd13be357-8cd8dbf4f2eso269716885a.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 10 Mar 2026 19:02:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773194577; x=1773799377; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=b7qBBzlJqLxEpsxZsxYErjEj0j0dE/eer6vWOZDdoAc=;
        b=jIQz+pqTEQS1qaYxZ7LQ1DoPrNvMG/GS++cX/UFlgY1FXjztn2CfgX2IB9wlZlGpII
         yIPn2eXOkgcGW0MBo14Y6kvU++M7SaKm6/44jfO6ezLSfDEM706OJe4+QXayEAZ8YhQ4
         CkwrmzUEKj1ss8RQtS0ui34MLZp+qzTOlUN5KHBTuekEyMkn350vEvSYBsCgXrxS4VD0
         Bhdv41fcA+2sbmqYTsDM78aluGrIZ2icQK10gF3vjP6CJ4BtsIQiKI7s40n69TTkSL1B
         O8CjnsWmnOyjIry7fMWFqnxlikyI60+HNphmfbE+BG32smWpCWuitzntH/dns1abzG6H
         Lxqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773194577; x=1773799377;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=b7qBBzlJqLxEpsxZsxYErjEj0j0dE/eer6vWOZDdoAc=;
        b=E3jRPYxxl5KD+9h4dvVJtAg3AZO+H2Ty/585OpcYCq12qp077gtFK/rNGo6EOzm/qh
         hh0G7JAfqsX/G4K4llado4W1R7iBxz9VOuGUuOFtJPXxxzik4ZVywRoi8H77sNhSe9f4
         BsCcJ4pzRuJ2oROkHVbwO5jt8dDCO/ZbuF82/JFE7Y/OtRFkOsY/AYC/OmDTXUjPza2m
         WdTd/MkEASOi8dpmC/fjaE3vIYAFqe+z4m8rvCS2SLh/6mU5x6GaybRylC70KJDsodJf
         qcisgRSj6y4+cuIRjT5G+UAzONZ0IU13Kt4k3WJbAKPj8q/wfq48lR8Y7PHKV7GpgE1S
         wCVQ==
X-Forwarded-Encrypted: i=1; AJvYcCWYLYWQ+tGfZ9cCGaQ+ek5dIXaKaCe4bo4VPgUs2a25CJupwalEVdYGIcynvGNycq/d1i9QLEIAl32P7BN5@vger.kernel.org
X-Gm-Message-State: AOJu0Yys85DrbC9/VOCj8aCgd+z1ogMUpjcWb0hJEAUUHTCRDMlvWT4N
	PBv6+uTty30AqfWuqgG+pzDAdTYAebpEGZL6dhY81O0vF6oX/GjX61lu
X-Gm-Gg: ATEYQzzxOBZrri6QObu5NiIGM+BvSY7z8/H0pzWMHM2tEY/v7qs/Q6dFa1VXtFP1x+f
	7E2B4C9rqnedbO1v5dYp0BJBeHMHpnCjk0HLe0yv7/1fZ0+Lzrc2QBkvwp4ETboD6EOUcrmCVr6
	HUr8tqhIb2DnnVDoERwA2BmzTHp/qCywzsUrVQRvbQgGvtgtOW44ArUlTivktSLLxvrlZC3TqxO
	xKeoO0pCdp26MDgeRc6ncpVfJaEmEsOWN05PKjvHAWauikwo517Z6b6YIpnuNKJwOh1B+zOIMLi
	5pf/qJ0Q/zWML8eNED+e2rH8nwB00z1vCoPXMCMu1Vf8yELgg3iBGRW3lnN/H2zs9L0dSOnuIE5
	4chp0iQF1mgJIzfO5GmhyTL7FH3sSW6uXshiMkJTj3mzKagIwWM72/b43IaKgPvIrujwEeDumh3
	Hi5wQPcq55p5lYSrbQE+b0GegRShO7bxWyAGeK
X-Received: by 2002:a05:620a:2688:b0:8cd:8d79:6c63 with SMTP id af79cd13be357-8cda1ad7ad7mr130659485a.68.1773194577196;
        Tue, 10 Mar 2026 19:02:57 -0700 (PDT)
Received: from localhost ([184.144.58.243])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8cda2135cccsm42854785a.36.2026.03.10.19.02.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Mar 2026 19:02:56 -0700 (PDT)
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
Subject: [PATCH v10] media: i2c: imx355: Restrict data lanes to 4
Date: Tue, 10 Mar 2026 22:03:28 -0400
Message-ID: <20260311020328.57976-1-mailingradian@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 2FD5E25A94B
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-96803-lists,linux-arm-msm=lfdr.de];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,intel.com:email]
X-Rspamd-Action: no action

The IMX355 sensor driver currently supports having 4 data lanes. There
can't be more or less, so check if the firmware specifies 4 lanes.

Suggested-by: Sakari Ailus <sakari.ailus@linux.intel.com>
Link: https://lore.kernel.org/r/aW3uFcT1zmiF4GUP@kekkonen.localdomain
Signed-off-by: Richard Acayan <mailingradian@gmail.com>
---
Changes since v9 (https://lore.kernel.org/r/20260217002738.133534-1-mailingradian@gmail.com):
- reject zero data-lanes
- split patch 4/7 from main series

Changes since v8 (https://lore.kernel.org/r/20260210020207.10246-1-mailingradian@gmail.com):
- allow clock-lanes, but make it optional (1/7)

Changes since v7 (https://lore.kernel.org/r/20260117040657.27043-1-mailingradian@gmail.com):
- restrict data-lanes to 4 (4/7)
- include first patch (1/7)
- add back optional data-lanes in bindings (2/7)
- remove assert low on power on again (Bryan's review retained) (3/7)
- use dev_err_probe in power on (3/7)
- remove second error on probe power on (3/7)
- add review tags (2/7, 3/7, 7/7)

Changes since v6 (https://lore.kernel.org/r/20260107043044.92485-1-mailingradian@gmail.com):
- remove NAK from Krzysztof (3/6)
- assert reset GPIO on probe (3/6)
- change delays in reset sequence (3/6)
- remove __maybe_unused from OF match table (3/6)
- fix alignment for arguments to devm_regulator_bulk_get_const (3/6)
- remove front camera pin configuration (6/6)
- remove clock-lanes from camss endpoint (1/6, 6/6)
- remove data-lanes from camera sensor endpoint (2/6, 6/6)
- remove blank line at top of binding (2/6)
- add review tags (2/6, 3/6, 5/6, 6/6)

Changes since v5 (https://lore.kernel.org/r/20260107042451.92048-1-mailingradian@gmail.com):
- add Bryan to CC who added a Reviewed-by

Changes since v4 (https://lore.kernel.org/r/20251211014846.16602-1-mailingradian@gmail.com):
- add NAK from Krzysztof (2/5)
- label the camss ports (3/5, 5/5)
- define endpoint properties correctly (1/5)
- use devm_regulator_bulk_get_const (2/5)
- remove clock-names (1/5, 5/5)
- set reset GPIO as active low (1/5, 2/5, 5/5)
- explicitly drive reset low at start of sequence (2/5)
- make data-lanes in endpoint optional and start at 1 (1/5, 5/5)
- add mclk3 pin (4/5)
- add Reviewed-by's (4/5)

Changes since v3 (https://lore.kernel.org/r/20250905215516.289998-6-mailingradian@gmail.com):
- separate camera mclk pins and move to different patch (4/5, 5/5)
- remove polarity from rear camera pin (5/5)
- remove output-low from front camera pins (5/5)
- mention effects of dcf6fb89e6f7 ("media: qcom: camss: remove a check for unavailable CAMSS endpoint") (3/5)
- specify single clock-name without items nesting (1/5)
- rebase on 49c6ac166cf7 ("media: i2c: imx355: Replace client->dev
  usage") and eaa7d46d9654 ("media: i2c: imx335: Use V4L2 sensor clock
  helper") (2/5)
- do not use of_match_ptr for OF match table (2/5)
- remove redundant GPIO validity checks (2/5)
- describe endpoint data-lanes (1/5)

Changes since v2 (https://lore.kernel.org/r/20250714210227.714841-6-mailingradian@gmail.com):
- use devm_v4l2_sensor_clk_get (2/4)
- require supplies and clock-names (1/4)
- move unevaluatedProperties down (1/4)
- disable clocks as last power-off action (2/4)
- use 0 in gpio pin power-supply (4/4)

Changes since v1 (https://lore.kernel.org/r/20250630225944.320755-7-mailingradian@gmail.com):
- too much to have a complete list (1-4/4)
- squash camera orientation patch (4/4, previously 5/5)
- squash driver changes (2/4, previously 3/5)
- remove labelled endpoint node in sdm670.dtsi (3/4, 4/4)
- change init sequence to match other similar drivers (2/4)
- retrieve clock frequency from devicetree-defined clock (4/4)
- remove clock-frequency from dt-bindings (1/4)
- remove redundant descriptions of child nodes (1/4)
- switch initial drive of the reset GPIO to low (2/4)
- set mclk frequency to 19.2 MHz (4/4)
- add vdda-pll supply for camss (4/4)
- use common power on and off functions (2/4)
- use devm_clk_get_optional (2/4)
- remove extra layer when describing mclk pin (4/4)
- rename regulators (1/4, 2/4, 4/4)

 drivers/media/i2c/imx355.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/media/i2c/imx355.c b/drivers/media/i2c/imx355.c
index 9ca87488c933..27a5c212a527 100644
--- a/drivers/media/i2c/imx355.c
+++ b/drivers/media/i2c/imx355.c
@@ -66,6 +66,9 @@
 #define IMX355_EXT_CLK			19200000
 #define IMX355_LINK_FREQ_INDEX		0
 
+/* number of data lanes */
+#define IMX355_DATA_LANES		4
+
 struct imx355_reg {
 	u16 address;
 	u8 val;
@@ -1705,6 +1708,9 @@ static struct imx355_hwcfg *imx355_get_hwcfg(struct device *dev)
 	if (!cfg)
 		goto out_err;
 
+	if (bus_cfg.bus.mipi_csi2.num_data_lanes != IMX355_DATA_LANES)
+		goto out_err;
+
 	ret = v4l2_link_freq_to_bitmap(dev, bus_cfg.link_frequencies,
 				       bus_cfg.nr_of_link_frequencies,
 				       link_freq_menu_items,
-- 
2.53.0


