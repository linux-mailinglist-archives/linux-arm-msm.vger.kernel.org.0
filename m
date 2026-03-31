Return-Path: <linux-arm-msm+bounces-101153-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id xuErAaIlzGnuQQYAu9opvQ
	(envelope-from <linux-arm-msm+bounces-101153-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 31 Mar 2026 21:50:58 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 59CED370D68
	for <lists+linux-arm-msm@lfdr.de>; Tue, 31 Mar 2026 21:50:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 78806302B39F
	for <lists+linux-arm-msm@lfdr.de>; Tue, 31 Mar 2026 19:43:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AEEA03E559E;
	Tue, 31 Mar 2026 19:43:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="pT6n6T6c"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-qv1-f44.google.com (mail-qv1-f44.google.com [209.85.219.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 522493A5E96
	for <linux-arm-msm@vger.kernel.org>; Tue, 31 Mar 2026 19:43:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774986235; cv=none; b=dWvwKgb4lPNcfhs5jWyRroJ+HThsq4zo1ce16PXfMahiYPvZcBCiyexBnbysRD9GH+DDJGdg4Zk4jMLZNGzssmvGeWFKfTboYJqQx2LbaSVrq4em0DuyXBU/nK5IRC7fsiIMGnMLvMahmN9YSCOrFh88ao3giSnL+O/EvolaShE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774986235; c=relaxed/simple;
	bh=kJtaTp0b2xxkENPXxh32EK3QZ9vMlk40N4Wgu0tyQ1I=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=AfHuzkR/4Dit1krgMrmeafA177ltN1DRPGH485EHjms8D9eRcz+kFX6U0YyYiyRxPb/9svKxaLlE5tR462vpWCsTVmobleO9dZ3BpT0Lq0bEW6TzynpeaS1kQeLSj3tAFCgKaQbvQBBfeGuLD0Ps4WXx5K4rqb35w9P14s/3ioM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=pT6n6T6c; arc=none smtp.client-ip=209.85.219.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qv1-f44.google.com with SMTP id 6a1803df08f44-899d6b7b073so76807106d6.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 31 Mar 2026 12:43:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774986233; x=1775591033; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=q8RpNUxtcPC2Ov0aBHol3C9JLTY+x8Fx+uA5MWYWzms=;
        b=pT6n6T6c8Z+rCjInX2b9vWMzjPLKOEMv+XN7K7tGahLbZ/QSkVRCEdXdwpOapUXPyg
         8FSE+OAX9nWrQOhGQUnCsxJgfzXjMAYJYhh0TocjitjQFEdCkZy2gqQ9l9SLcnvh+yKX
         ADfMdBZ/D5iC/bipJ9ojBBlIaAGDob0kMcj4JvpseB4iSgdNofWe9YhnnGKgOWXRYkZv
         kSQ52KXIbIZBYeCvvjUKorlUgLL2dmDqnnWwyxU8ZelsxxXvQwljnHwHHxV9drcCIxU5
         CosZkqwprGqiARFjlLEEjZYUUlzwMYPpgn4XRx4Qht8XJF80GNo4TjQ8DIR75MSy+Geo
         kKpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774986233; x=1775591033;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=q8RpNUxtcPC2Ov0aBHol3C9JLTY+x8Fx+uA5MWYWzms=;
        b=pnAlByDWBcyF3xdvgKUvpmbI6FqlScn0tyR46ezNzri2vUkgpi1k0A3/a2w0BrE/qV
         DpIZVOqXoVqb6QIOQLWc/NhwL48v+jdLUL2nriyvzrAKM8Pm+KKShCU+DdfR8sa0bufY
         qiYKk8uk8kZD9jzLOJq5QaLqWXE5VJpRBr0TF2uxMIHOnDcPxyQ2vURu9UlkM3U3T8EX
         OsA8IhThSHazpa8EvJKakLSt2xffAnD1AX0ob2HbcDypziDs+gbL1+I9hGa+HtR+Uhkf
         FPPumeM9mHR/5knnYRUPoMhMvA4BdtBeMNVsCexeYHNJAl5CMCb27+yuSTqVnRcF60AQ
         S0tg==
X-Forwarded-Encrypted: i=1; AJvYcCX4ErwW7Y3RvxX7CcOhMZQ/5GD/okiUply51EdTDxvpuq5dt/toVwP7unjLuc/FOoKDxB4kE3g+9LJJ/pps@vger.kernel.org
X-Gm-Message-State: AOJu0YzmFvmAjJW2a2hyf1sz7nJKv/WLaFP+LpZGEqxVKKB3y+Qo3jiM
	Fkt9JZrbo7UaS2UBgazuKm/VSqVsp24iB41hB3yy/dOsv3iQOcU0BxC0
X-Gm-Gg: ATEYQzzB7meXdTbYjtEyyLYKGALYKqpA1lUHFPY2QhHFGcjUXR5txGp/Gil0qjp6Cop
	VD0m84kT/8PsigPsg+AEtIGruuIW89h75RP8nJg1K7VyYDkj/b3nN4npHQh03l9q7fvbJmHux0N
	q3KPVDLrZGIjc/uxqcHbXFf8Fr/z2k4o35b/ZI9u9lLeVXrGO1Y6sNps2bgrC9g40rVHRMx+gOj
	Wk85pJl2e9QqMhh12gdUXvLzodZxvexTWtHyeqcV3PL8cXkRBiYqX+AfiXbmwtQaxARu9iEdZMO
	v/REtjNq6k7Z0osfA7xwJAQWnTpOx47sCyGUHLyI5KFEf8f4EBI9HPDK4EkUS+o6lVrocURGj9C
	cHkJow6VrvrNDb5fo2OfBRLKnCVzxYqv8DTa/iqTAurXgBheJzAInlI3szmqGDPUtQPS+F4tHKl
	5MsNK004Usl9fDRg6wNhvZCyW9Zt7c3XnSUYw=
X-Received: by 2002:a05:6214:2c06:b0:89c:6ab0:3744 with SMTP id 6a1803df08f44-8a439d8dff7mr13268696d6.47.1774986233262;
        Tue, 31 Mar 2026 12:43:53 -0700 (PDT)
Received: from localhost ([199.7.157.124])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-89ed003a918sm101099246d6.44.2026.03.31.12.43.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 31 Mar 2026 12:43:52 -0700 (PDT)
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
Subject: [PATCH v12 0/3] arm64: dts: qcom: sdm670-google-sargo: front camera support
Date: Tue, 31 Mar 2026 15:44:34 -0400
Message-ID: <20260331194437.41041-1-mailingradian@gmail.com>
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
	TAGGED_FROM(0.00)[bounces-101153-lists,linux-arm-msm=lfdr.de];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 59CED370D68
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

This adds support for the IMX355 in devicetree and adds support for the
Pixel 3a front camera.

Changes since v11 (https://lore.kernel.org/r/20260324020132.8683-1-mailingradian@gmail.com):
- mention 24 MHz in mclk2 comment (3/3)
- drop applied patches (previously 1-4/7)

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

Richard Acayan (3):
  arm64: dts: qcom: sdm670: label the camss ports instead of endpoints
  arm64: dts: qcom: sdm670: add camera mclk pins
  arm64: dts: qcom: sdm670-google-sargo: add imx355 front camera

 .../boot/dts/qcom/sdm670-google-sargo.dts     | 100 ++++++++++++++++++
 arch/arm64/boot/dts/qcom/sdm670.dtsi          |  46 +++++---
 2 files changed, 131 insertions(+), 15 deletions(-)

-- 
2.53.0


