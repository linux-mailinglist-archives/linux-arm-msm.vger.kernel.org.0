Return-Path: <linux-arm-msm+bounces-100867-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SMl5GjCqymkG/AUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-100867-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 30 Mar 2026 18:52:00 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id CA35435F119
	for <lists+linux-arm-msm@lfdr.de>; Mon, 30 Mar 2026 18:51:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 3C6053013249
	for <lists+linux-arm-msm@lfdr.de>; Mon, 30 Mar 2026 16:51:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7E7803624B2;
	Mon, 30 Mar 2026 16:51:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="pONveiMG"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-qt1-f176.google.com (mail-qt1-f176.google.com [209.85.160.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0F393D813E
	for <linux-arm-msm@vger.kernel.org>; Mon, 30 Mar 2026 16:51:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774889517; cv=none; b=JkpnIoq7T4dAnsVvhyXTnYMncHg/O2louvPhEarEDIdIrRqbHTOc+qxjyefIxC49g/4jYl5Ij3RL/YrGrLrSTDoFMKDpM3RvynR6/NqHLgYV1s6dnsNMWqP12HWkgd3moHIVAFm02qT32gtVNbvuajQd4KfTOjVxDsnDwzzdnto=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774889517; c=relaxed/simple;
	bh=yzn1qwpZMJkPgigRBzeYMyZVhMPbZ4A5hdI7do7E8HE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=fq/uAXlbyhwcoekl2Au0sw1REU7g5qlaD30B0m6m/5afOm9icgbaOSl8awPW66Ov2F7RiCVJVJvgf7+mS/ySFzIAqPiKc6oKOwhOvhOZZq6rQFqKjEw83shP38gsmwKgrCgc2uK1z6ZKqbYeagVXJ16/GY6TZM5Z/zIc5N+1d2w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=pONveiMG; arc=none smtp.client-ip=209.85.160.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qt1-f176.google.com with SMTP id d75a77b69052e-5094e1d17d3so45973211cf.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 30 Mar 2026 09:51:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774889515; x=1775494315; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ZIZbf+qqROsD0LmW3EiPB41zllSjbGoJgs0L3HB6kjY=;
        b=pONveiMGnp+w9UO+MaWMRMfxNrvO3StceMz80q21u3D+rqPs4+Y8qXBAcVi60DkbbN
         gFvyOdPuJEn9p8yeC6e+avYQvc2wmB7enQtBNYyE2SE7PmS9rEGWj1TfIIYO4Z172258
         UmqXy3n9VvC5F4tE39Z1smHg326yIZLhswPlQT8yH+MWiR0uwOAbEdgBU9iGbCYuTb6Q
         oy5v+o+0S2hwjPh/du5+WXrLWj2vGBTyOySv6WNvFRe2IZn4i2FGTcuYX7T7PP1h9GbV
         sgZTxsvA2cihVohOKUD3IKFFb0lz20jl2KsNMt2gvfqifMQilGD4L8H3d5CKkt/UK4iK
         rUmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774889515; x=1775494315;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZIZbf+qqROsD0LmW3EiPB41zllSjbGoJgs0L3HB6kjY=;
        b=XQ+FRQuRXwcQg11bNazFT5KVVH6AQ9zf0TwTEN/lIywoCYD1DfYhKlxTkAPjCEUyPJ
         3fRnONBs1kiQLd4j3PiCvf7ZzpBqNd1s7aspnEGervXwEKNgNK5pSiOXsCRSWnr2+u8d
         v1lg3M5NaHNOdTW8BkVmG4/fCmSxDHhSmtS2T/9+wwaBskF2B/Jr9NuCzizVB5sYfXhd
         Dd3jy0EJ9c7i3wqBaTa3HxOC2eC5PNys/4Elxay4kQIqZcdPbdtl8dv/bw/dGJLfdKaf
         MIBCIGD6w4ReVRPAq+M4pW/53kEE9zgUGuL96QjHrm+mLOZAC/9uviG8a2recHz7XFdh
         xUdw==
X-Forwarded-Encrypted: i=1; AJvYcCVgl0h3OgGqYuQFxj0RC7qlK6sI0darjIyYD0I3NQr4qwhICGh0wAM/1R4Y2s2mq2SNFkJBbsucu+V4eUud@vger.kernel.org
X-Gm-Message-State: AOJu0YyM/ODY0itLfmVF/YgtmFgey3eAopcv1kLVMNNa55eMXMRWNslB
	AjoiCP5+RZu/SYSXD+VOTDISSqxIit+K0gWyrYziL5hHoiq9A4ICZjO/
X-Gm-Gg: ATEYQzz0T90vk83ZMz1Y4diAIbdXyDdFXsk2ZTaN69ewNgKgoYZIDBJx7PRs2IccRV/
	8y5sycx5ArkwCkuw5+jyqulpsOZi0IDxq8JW5h8zRPryIeCSNo16YnZ5qSoxIejrVfOotxXUi0/
	306w47j/PD99xy3kmIH+2rAM7tHGZCB9BzOuFqETGqKDftQAzVB70dnwtef4DH8AjUSUoHkjxH9
	YCALUbtht0Vkqg0N11MxKyssNV9AAB/GU69muYobhsHeqYiEW/eib60fxYbiBVXYq5DRRt5n2LG
	vkwBK9CXFMe2Op75JJg7Fg++faysV2SP4wbR5zXe1ssLd1mf5Rk6WhKQPsI95NUaWxceU5sBO+K
	MHS8X++KSYZdEIfxRDqWzSZvSh5u7XeKhYaL4tKXa1Lfzz2QoUUPY8BnEhbNjQvJGinAcE64AM1
	EU2Nbwp6LyD2N3zu5OZO0X8k4=
X-Received: by 2002:a05:622a:18a8:b0:509:20de:4ad1 with SMTP id d75a77b69052e-50ba3818222mr175000561cf.10.1774889514877;
        Mon, 30 Mar 2026 09:51:54 -0700 (PDT)
Received: from localhost ([199.7.157.54])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-50bb2cc79d8sm68292771cf.12.2026.03.30.09.51.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Mar 2026 09:51:54 -0700 (PDT)
From: Richard Acayan <mailingradian@gmail.com>
To: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Amit Kucheria <amitk@kernel.org>,
	Thara Gopinath <thara.gopinath@gmail.com>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Daniel Lezcano <daniel.lezcano@linaro.org>,
	Zhang Rui <rui.zhang@intel.com>,
	Lukasz Luba <lukasz.luba@arm.com>,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-pm@vger.kernel.org
Cc: Richard Acayan <mailingradian@gmail.com>
Subject: [PATCH v5 0/2] SDM670 Basic SoC thermal zones
Date: Mon, 30 Mar 2026 12:52:35 -0400
Message-ID: <20260330165237.101045-1-mailingradian@gmail.com>
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
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-100867-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[15];
	MIME_TRACE(0.00)[0:+];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[kernel.org,gmail.com,linaro.org,intel.com,arm.com,vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mailingradian@gmail.com,linux-arm-msm@vger.kernel.org];
	FREEMAIL_CC(0.00)[gmail.com];
	NEURAL_HAM(-0.00)[-0.998];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	FROM_HAS_DN(0.00)[]
X-Rspamd-Queue-Id: CA35435F119
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

This adds support for the thermal sensor, for thermal-based CPU
throttling via LMh, and for thermal zones.

Changes since v4 (https://lore.kernel.org/r/20260328014041.83777-1-mailingradian@gmail.com):
- use simple comparison to differentiate between cluster 0 and 1 (1/2)
- drop applied dt-bindings patches (previously 1-2/4)

Changes since v3 (https://lore.kernel.org/r/20260310002037.1863-1-mailingradian@gmail.com):
- support LMh clusters starting at CPU 6 (dt-bindings tag dropped) (3/4)

Changes since v2 (https://lore.kernel.org/r/20260304014530.27775-1-mailingradian@gmail.com):
- remove cooling from memory thermal zone (3/3)

Changes since v1 (https://lore.kernel.org/r/20260210021607.12576-1-mailingradian@gmail.com):
- add review tag from Krzysztof (1/3)
- replace CPU thermal zones with lmh (2/3, 3/3)

Richard Acayan (2):
  thermal/qcom/lmh: support SDM670 and its CPU clusters
  arm64: dts: qcom: sdm670: add thermal zones and thermal devices

 arch/arm64/boot/dts/qcom/sdm670.dtsi | 400 +++++++++++++++++++++++++++
 drivers/thermal/qcom/lmh.c           |  54 ++--
 2 files changed, 434 insertions(+), 20 deletions(-)

-- 
2.53.0


