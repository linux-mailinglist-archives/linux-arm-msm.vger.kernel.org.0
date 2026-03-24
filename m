Return-Path: <linux-arm-msm+bounces-99492-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yP7jE2vwwWkgYAQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-99492-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Mar 2026 03:01:15 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id C3E38300D87
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Mar 2026 03:01:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 324A0303E3BC
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Mar 2026 02:01:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AE71628726D;
	Tue, 24 Mar 2026 02:01:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="s3+OhMXP"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-qv1-f50.google.com (mail-qv1-f50.google.com [209.85.219.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6F0A1BBBFC
	for <linux-arm-msm@vger.kernel.org>; Tue, 24 Mar 2026 02:01:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774317663; cv=none; b=pQw4encdmugSS/Yfo9F95J4cvKslt0uWiLcmCNMNsyWZKWpyfmsAwlypy2Ew5LNpvkr4vzO3edcOwdNeGwIFJ8n+2i40oVTGIqlt0Au81KzOKOmRjts0brUzvLuEq7cgVuQH1pfDKPllHp9HWdkJNS7gHC39lB29xTjJPpWfYjs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774317663; c=relaxed/simple;
	bh=LWCSFF3ibJpKbfEkVWiUPdlPbxt19zLp4I8sL+m5VJU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=H6ZTl8u9BJhKTZOOK8n1gQrzVqTINHrALWGz9QzA0UGMAs4vcrlBHhknqrERKrPWUnKZpbPAAGImveU7qEqNQ8yXSOSry20KfBI/5o+4340wm2eqRo/l1Sh8jOg9u1nV6kBJYqhEKxMZb6SUntC10FMaCod9Ol2kHynkB7rEP1Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=s3+OhMXP; arc=none smtp.client-ip=209.85.219.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qv1-f50.google.com with SMTP id 6a1803df08f44-89a07f66f4eso55099786d6.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 23 Mar 2026 19:01:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774317660; x=1774922460; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=HLlKM68MyIfZMCivznDvoOYbnC+rCJINrjgA82vfkM4=;
        b=s3+OhMXPNSq9XNGEz6bzz83RPf1sckbRO4JF16osupMTqX/4aVyBEJfHT+mRDhRXNb
         Wkix2b/jvs79nMT7nYjmONmLdTwJtgak4TuQLVGEYHcTV+rRbrP8NWNae4cSb+7voCde
         zFDm9JpKjUmzyB/ApH/qX27xAN6MRl9hGjolcotstJEhsU/7HlcMz6Ek8lLV29s8r+Xv
         xvg5/Jv6IrQw4rNXNsQUark2BktUE4WgcZwT4QpvLnH/AFUqn+23Ecs6pRoH1XT1A1n5
         zpUl8yVyJkylBr+9BilloEoSteKvXCdozzq/NprRPSyUNKzvDsc64tQQvHOSRgnsUkjj
         98jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774317660; x=1774922460;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HLlKM68MyIfZMCivznDvoOYbnC+rCJINrjgA82vfkM4=;
        b=moBpOZdu1xOKMfEy5CyNVcqqYYL6lcVkgACw4mKwzLsH5avrOjL8l7Bio7QuolBJr/
         XATArcK9UHMvw+r7NNXa0Cx1ld4Lv5/DgCPerYdycbkRZ8i+q94o1Tun13l3M+ldsRn2
         VsHqMokOFjLq2vL1dOfYy8pL2n6v2+HaPG9Br955Y6WD4T8ey6XI5OZ4NCAeUjAuO4x3
         PqVF2iwaMRooAsD9bUmTnvadLVTeAW1rl/HjUt5HfKbi3dfJQif2dhAuSt0Uhs7vfjAY
         oo7amcBxrOJyb/Nm7mbM24Rbfs3WzeJUsrGhMkdDeSNhee/2KjXtBoyINKdjv0916gB5
         TSog==
X-Forwarded-Encrypted: i=1; AJvYcCVoZx2HROHCCzZtANkgZoumaWrIsLmnECSttOE35NcUwS5YPMnI/vGVf7tK1yHZ3bII59JPeFl5Z+TfUUbA@vger.kernel.org
X-Gm-Message-State: AOJu0YxW8FgreJFG1DiEh8gtwHO20JYAMbwaxmTr+3dPk8/sO74UMwMx
	BbxRXCwhoKdHo8j55SSvv4SZT96eGkNeCLICLQvWUw/LYdMnkUYhX4Z3
X-Gm-Gg: ATEYQzx43cZyKb/zSYtaszY3BIHhjzlBulTgT93jMlgkdNQ43zPpr3SQuzjAoRJ3beK
	nIZJDfAe1ORLqb5En7GjW+R8U2/OzMsRRgDxeZzk/Y1Tjye6ZNijt9OmwxD5+bRbaG7AfHvq6JM
	ekoE2nanlElBfQ9wqD3K438e6OVmxMl6FiAXpFyt/M5STmcm6cs9J9ZDX6v/RXyr+HypAlrm8Xd
	OBG8oqIez6kEU+2OvCQhKNU03CCoidXLry7mdt/MVx5WyAzhpY5UVrwBuT4bCcyUTCJA3UH9Mcy
	ZZlEoLyDqdjwslUK3NpKc5OHSRPJbDA8orytFVcan9w82IJkOZecsk8k6MZDlmitvNAYKG4ZWvV
	hMPlBTopEBHMxkqWoRWoAXcScTBeCsIaa3L2EUypeoS53ZtCoanOoHWpw33/RPhA6fFa/83uUim
	qLsZNaVKTTzN0ztc/k5h4B5q+Vrg==
X-Received: by 2002:a05:6214:5712:b0:89c:610f:fba1 with SMTP id 6a1803df08f44-89c85a7e223mr241573006d6.46.1774317659652;
        Mon, 23 Mar 2026 19:00:59 -0700 (PDT)
Received: from localhost ([184.144.58.243])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-89c85215210sm103060326d6.2.2026.03.23.19.00.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Mar 2026 19:00:59 -0700 (PDT)
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
Subject: [PATCH v11 0/7] media: i2c: IMX355 for the Pixel 3a
Date: Mon, 23 Mar 2026 22:01:25 -0400
Message-ID: <20260324020132.8683-1-mailingradian@gmail.com>
X-Mailer: git-send-email 2.53.0
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
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-99492-lists,linux-arm-msm=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: C3E38300D87
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

This adds support for the IMX355 in devicetree and adds support for the
Pixel 3a front camera.

Changes since v10, 4/7 (https://lore.kernel.org/r/20260311020328.57976-1-mailingradian@gmail.com):
- add data-lanes to dts (everyone's review retained) (7/7)

Changes since v9 (https://lore.kernel.org/r/20260217002738.133534-1-mailingradian@gmail.com):
- reject zero data-lanes (4/7)

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

Richard Acayan (7):
  dt-bindings: media: qcom,sdm670-camss: Remove clock-lanes requirement
  dt-bindings: media: i2c: Add Sony IMX355
  media: i2c: imx355: Support devicetree and power management
  media: i2c: imx355: Restrict data lanes to 4
  arm64: dts: qcom: sdm670: label the camss ports instead of endpoints
  arm64: dts: qcom: sdm670: add camera mclk pins
  arm64: dts: qcom: sdm670-google-sargo: add imx355 front camera

 .../bindings/media/i2c/sony,imx355.yaml       | 111 +++++++++++++++++
 .../bindings/media/qcom,sdm670-camss.yaml     |   3 -
 .../boot/dts/qcom/sdm670-google-sargo.dts     |  97 +++++++++++++++
 arch/arm64/boot/dts/qcom/sdm670.dtsi          |  46 ++++---
 drivers/media/i2c/imx355.c                    | 117 ++++++++++++++++--
 5 files changed, 348 insertions(+), 26 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/media/i2c/sony,imx355.yaml

-- 
2.53.0


