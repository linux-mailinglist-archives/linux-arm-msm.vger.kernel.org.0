Return-Path: <linux-arm-msm+bounces-92368-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UCm0CYGRimkQMAAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-92368-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Feb 2026 03:01:37 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 9445A1161D2
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Feb 2026 03:01:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 08B7330234C1
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Feb 2026 02:01:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C8E4F26CE05;
	Tue, 10 Feb 2026 02:01:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="E7BTglVj"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-qk1-f174.google.com (mail-qk1-f174.google.com [209.85.222.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30A7828934F
	for <linux-arm-msm@vger.kernel.org>; Tue, 10 Feb 2026 02:01:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770688894; cv=none; b=LkKPZn/Ufja5wIqrsnl6PPvYPr+YWV1Df9+4ZsPXoEtw7POLA814IgN21LsVESf51CbDGv26lBOL2WSNyulA+wd9jvej58lwUb9kj8E2TzM0j457/0vNc4UjIUmBMFvCOFJ2t1jpsXA5v4jFFBOaKZrMuQLNuLrXKmfsNV5r/5g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770688894; c=relaxed/simple;
	bh=PVIV72hlgxr0+61Nklt1jW11+gpAmY7nqGXMLlsRM74=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=P+xbszZdOPF2SJQHbgZ1WAL/A4k2wwmvt1ka2HEv3yQpEsN2hi1rLPyHQhQcrxjvBHLgecmiuB1UX9YGsG/WVWhVldJ9IrfgPpqzWF0pPGZ3ehXJcJlHAJGXsgP09dVs/BSYns0F563IsGkI7LtdbH2sJCVbad4iF/uhRtDfeso=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=E7BTglVj; arc=none smtp.client-ip=209.85.222.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qk1-f174.google.com with SMTP id af79cd13be357-8c6aaf3cd62so37103385a.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 09 Feb 2026 18:01:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770688891; x=1771293691; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=OS18pjA26Qhrwf2sU4iRtM5ZXv3xXaEcNw2IpoycwRM=;
        b=E7BTglVjJYTQmwrroXfKoEoOV5V9UpkVYlIBtWNxFaVpIzWxtS8MI6uJW2wnCiToK5
         /918yfGK6JjZRWhpDXYaNY84pNXl4R/ZrajkS3P3SejMHMWcCcUoHhN28KlkVYXt0uog
         3MZ+I1Q4tdeWv2XXw8PjDVZTyL/vut1GpuvkXYxea/RSj4ElSeQ86cqdKcFheF1H9/F9
         38m3NJO34twRpn5jI1O2FraFa8g+NxM0XFSXYHZoqbpZ10Qr707xB5bAMuuyapUEqBef
         gL2pPC9rVJbE/AJcunSVMj8krA9BOivjAYIfWxijQnxnnJvnlE6CIMQeg4wYNL/rmGcc
         aNvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770688891; x=1771293691;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OS18pjA26Qhrwf2sU4iRtM5ZXv3xXaEcNw2IpoycwRM=;
        b=mD0z+69IcmxDDaastD6PBQmHfcmJaEXo5zHYuZB41HEQVCwHe1CqtvEwcg0x1RgDBA
         Ssx6uC/uxnJVEtjxGoRwP/ypyz36gl45a9Ln0KSLyb67HKxmmiROnlosKMbMMlUW36vB
         APWvXNGpbAzCRfX4dTcFvZlTjDWktB92y29tX6/HR5v2SkVEgjTfT3WfPwwotEin11MR
         DFhjh4IBuesqF/C0Gol5c9himS519dpesNM1h87sUfN6lKH9SFf1Hqa/Pw01KsHDDVFT
         39j2T1aJHYVJojm5eZBVWbTEdMZkn5qlkG8jT5mlUnlksb7O89EolzUHcAb2xkMop4as
         43oQ==
X-Forwarded-Encrypted: i=1; AJvYcCWsdehQf4ApLaljXCVmUHijTUgXKKaTwuCMlDBNwcKbOV6P2T4OeSKuCYdF41eiKWpdSSKINFv6KFW8+GeM@vger.kernel.org
X-Gm-Message-State: AOJu0YyJaJihTOqCr329hjn54lhu6BYChRivYaGplkLn1OhwUkEdGtoA
	A44JZqJf20RgRf8p1QZnRnjJWtEbyGuxLppchEuaEIjuEe//1k6k5hjo
X-Gm-Gg: AZuq6aIixxqPj+lPBNJNju+c12QeyA9t4X2UW5A7eLNBDd36iMHFDKO0rVzs7WCtbh7
	xebUaT6WQhW0aNVbymFRhs7qLiqhEzINtn7PMK+tNEWoNrkK1LsWRhJMDKLX+YgectQd7c197u6
	axMoas9J2Cew+RGyv5R7hRAjkwxL9CAxUcrzCsAMo7mYwWS1gQSY4Q41yri/sjPfFgMPodjtFH1
	/zX2QmMDSlnAvkEVeWLNPU1wA19FRSwPt0xRP2odvDWnROmjnBfqWHhPINKt63QJd+L6v6QqAFp
	rJ3EqrmfU/+sC0wm22CVP1arI/4mW05GIgYT8WwnYgQu+ZjKrUJTlYXMLD8wMsIwTglgQGstmGs
	HBLWI8OE8ZNgw1HtzAG1yaBCjevwUB3W/+3WUtQLNfRiWsnW+Ku91g0VNuJH9pTdd0wCiW+0WJo
	gp0pcESi4U+628CYzGkGa/9WG2HFjspIk1QhhKrSKkrWpt6uuMkPGUVD/We6lXdi0KRQoGjNcgO
	A3ly6h644LxX2Q=
X-Received: by 2002:a05:620a:4144:b0:8c6:e20b:e6c6 with SMTP id af79cd13be357-8caf1acb33amr1912215685a.52.1770688891030;
        Mon, 09 Feb 2026 18:01:31 -0800 (PST)
Received: from localhost (bras-base-toroon21-grc-75-184-144-58-243.dsl.bell.ca. [184.144.58.243])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8caf77f320esm935366085a.5.2026.02.09.18.01.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Feb 2026 18:01:30 -0800 (PST)
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
Subject: [PATCH v8 0/7] media: i2c: IMX355 for the Pixel 3a
Date: Mon,  9 Feb 2026 21:01:59 -0500
Message-ID: <20260210020207.10246-1-mailingradian@gmail.com>
X-Mailer: git-send-email 2.53.0
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
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-92368-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCPT_COUNT_TWELVE(0.00)[19];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[kernel.org,gmail.com,linaro.org,intel.com,linux.intel.com,vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mailingradian@gmail.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[collabora.com,ixit.cz,vger.kernel.org,gmail.com];
	RCVD_COUNT_FIVE(0.00)[5];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 9445A1161D2
X-Rspamd-Action: no action

This adds support for the IMX355 in devicetree and adds support for the
Pixel 3a front camera.

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

Richard Acayan (7):
  dt-bindings: media: qcom,sdm670-camss: Remove clock-lanes property
  dt-bindings: media: i2c: Add Sony IMX355
  media: i2c: imx355: Support devicetree and power management
  media: i2c: imx355: Restrict data lanes to 4
  arm64: dts: qcom: sdm670: label the camss ports instead of endpoints
  arm64: dts: qcom: sdm670: add camera mclk pins
  arm64: dts: qcom: sdm670-google-sargo: add imx355 front camera

 .../bindings/media/i2c/sony,imx355.yaml       | 111 ++++++++++++++++
 .../bindings/media/qcom,sdm670-camss.yaml     |  13 --
 .../boot/dts/qcom/sdm670-google-sargo.dts     |  95 ++++++++++++++
 arch/arm64/boot/dts/qcom/sdm670.dtsi          |  46 ++++---
 drivers/media/i2c/imx355.c                    | 118 ++++++++++++++++--
 5 files changed, 347 insertions(+), 36 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/media/i2c/sony,imx355.yaml

-- 
2.53.0


