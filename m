Return-Path: <linux-arm-msm+bounces-94337-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SCGQBuSPoGkokwQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-94337-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 26 Feb 2026 19:24:36 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 7570D1AD8AF
	for <lists+linux-arm-msm@lfdr.de>; Thu, 26 Feb 2026 19:24:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 4DD3F30526ED
	for <lists+linux-arm-msm@lfdr.de>; Thu, 26 Feb 2026 18:17:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B06853876C3;
	Thu, 26 Feb 2026 18:17:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="P+Xk6s4U";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="co2ZIK75"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB34D355F29
	for <linux-arm-msm@vger.kernel.org>; Thu, 26 Feb 2026 18:17:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772129861; cv=none; b=GuTi4NNU+YNCN0dpqXbdYTHMQhXX/GAooQ8jOML0HQSDXc7GGRuOxWgCrcLAEuFalgCWVhpiK8wbE/GBQs1Djs7kEEb95fmBR6amX13MnvmzPECLAgO5Rabz4TgcfBOWvb+TW8zmB/zGfPBug8M8ks0oX8blj7GZotmH8UYYeRo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772129861; c=relaxed/simple;
	bh=QA/oDtTW/MklJzlzkqeDnO3jkZ3ncrUHMklBQka/GKQ=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=jdBpXWKfHHO9ZxnrpquXp41JZwgGyyYlftpu+0esE1T3dAiGiPdi0fZgvR7DYDMtWOCQjD8w45yk3RYu5/TuVhgHBNvUY/pwCC6Aa6lwbEroD3xaqIbKMDg6jVVimyXGTcO8nSwH+kOyIPVwX+mHzhyhybj8a9ZmlTQxiVw1awk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=P+Xk6s4U; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=co2ZIK75; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1772129858;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=g8QKOBVmvfZrBhcXhbKXa1XP4Mqh3aZ9oHJhophil2g=;
	b=P+Xk6s4Uzg+xL2W+q7w83LKoIh090kjHWMz/W5V6BiPj5sJySnauEi4bqtJ41rQ0PjaRea
	aNNMyr8pYeUhEXhhuw+7pBl8OnhLPomBsEnZktomsbR6j4sAqaNtLAnVl+4NinjX2QvKGA
	sicrj3FzM09vtuEHMDlLUqxBucf3Fcg=
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-206-hGyaOcD7P2KqfGW9796UqA-1; Thu, 26 Feb 2026 13:17:37 -0500
X-MC-Unique: hGyaOcD7P2KqfGW9796UqA-1
X-Mimecast-MFC-AGG-ID: hGyaOcD7P2KqfGW9796UqA_1772129857
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-8c70e610242so888194985a.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 26 Feb 2026 10:17:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1772129857; x=1772734657; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=g8QKOBVmvfZrBhcXhbKXa1XP4Mqh3aZ9oHJhophil2g=;
        b=co2ZIK75zeCG9eWnK95KLtTTewAiG0gIbyP2d/u/xskCX9gThuTumt/Dt9hj6SzFO8
         VlwigE2i0/ijmcnGD4iMcZ2kz/usy9yNZIOW4VZdVIRtzWqWc3npVKlhOCF4WnT7nCHr
         YctyKc0J4dlz1s1xpDqk8gOt1d+S+NkyCBMoOjkczxsLuxlCQmjvCpNlFmYcKAcfCi2t
         HLvmm4hWKumDS9/y5QUnaDLsNVGtr4x77ikMzz2YH+hEJsbexRhqp+2tNwo1TVHqpcZC
         QN6H59iWWT9S21bkYdYRuZTcWBYG+ygi5alGnt3gWI26M3e4tG9bEStxWvwekt6ugCnr
         2Wug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772129857; x=1772734657;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=g8QKOBVmvfZrBhcXhbKXa1XP4Mqh3aZ9oHJhophil2g=;
        b=J4mZCbLkbhUkHTYkl5bsDUxDoNkkowsWXCDP3hI3HnMhYGdB4y8dLAmbhVTDugQAqB
         7a5nHFeRrPE1F3kVqm3FLQZevv2kv95tDNd06ukt21mWAWVJDPEmgZGbvStg7hXZry3t
         JEPjTj8uEtFXdwSoezj/wF1JOlB3ncBLCyQHYVgd6uGM9ZeXy91M06OZjN6/AH3nZJ5F
         1UvP4SD6d79tbRugki2U9XVQy3g4PHFTwR2vutqrd8JOtj+tBERTpKNRvX2+tepWsr3W
         OEeEJE6yqGSX7dkq6sp4eJhkNv/uGDrpT2oUEo7wKv3I+YubV8aiJms6ooQgXsJaLvw+
         5ZuQ==
X-Forwarded-Encrypted: i=1; AJvYcCUMWgQlzPzhByTEep+3jrgv7BJvaTzjiwdQnas+4mszXNeAFwkDRfJz3zp+x937WAusZ40iN4K3OE7u5GnV@vger.kernel.org
X-Gm-Message-State: AOJu0YzvCtseCfpWiAzYm2dzKeKsBX+62vSSkK52BRvcDXpEBiOWtWNk
	LPTHDKJAoc3VnlYG37aPMp++M5co5x3B8cbY/X+DShV+R55xMBpxtOX/UND80dI6wJTzoPl1XSx
	VOmF7VtUd47U6ApaGJ+WuFmcKyWg2PUQCJ2ivcFQfjTUDKfeavbK4C9K4yxbwQffLKW4=
X-Gm-Gg: ATEYQzwN6b3lbYE8S/7Fv43Vq9ly6og0Xwxtv/uEAh49plQEn2P5j1t4VNuUi/luTFZ
	XwTnrVRB9BhvA03TNzAXtqOBuI5QyPCdRL/ay+NW0ZiYOc1nTn4Vwjpkvh6Alleo6bHaTEKE+WP
	XnmeUZDoUYuLRO3HGNreDK4Erw/ebup2OtdCMWeqFZZEHoyrDgV+tuW0OCcjpigLtRmGCk70i08
	sKpMkzCBfbO1TdrUARKJganZXd0Wiupo7iZufj6QQR+hqRFUmyAX1z9N/bc49+bp/0i2IQJtBtU
	W3G/LSnMfT/qEJLY1Iqc1PEdKp+JEShpWBPgQRGIUbA34g+vCbho1P496ukEv9H+zQxw5utw+w9
	nKvadonwEULTgyuquOiKft1ox2iLpzNWhJi1HUy58y//al6UMYatb+qx84x7A
X-Received: by 2002:a05:620a:44cf:b0:8cb:4c:3ad9 with SMTP id af79cd13be357-8cb8ca93060mr2498306585a.80.1772129856818;
        Thu, 26 Feb 2026 10:17:36 -0800 (PST)
X-Received: by 2002:a05:620a:44cf:b0:8cb:4c:3ad9 with SMTP id af79cd13be357-8cb8ca93060mr2498299885a.80.1772129856254;
        Thu, 26 Feb 2026 10:17:36 -0800 (PST)
Received: from [192.168.1.3] (c-73-183-52-120.hsd1.pa.comcast.net. [73.183.52.120])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8cbbf717f2bsm247046685a.35.2026.02.26.10.17.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Feb 2026 10:17:32 -0800 (PST)
From: Brian Masney <bmasney@redhat.com>
Subject: [PATCH 00/13] clk: add new flag CLK_ROUNDING_FW_MANAGED
Date: Thu, 26 Feb 2026 13:16:44 -0500
Message-Id: <20260226-clk-det-rate-fw-managed-v1-0-4421dd2f6dc6@redhat.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/1WNy2oDMQwAf2XxuQbLL8n5lZKDbMnJ0iZNd7cPC
 Pn3ugkUehxJM7qaVZdZV7ObrmbRz3md384D4Gky7cjng9pZBhvvfHbeZ9teX6zoZhfe1PYve+I
 zH1RsrCQuQw9Q1Qz7smifv+/l5/2DF33/GA+2x9BceGvHkd9NqUAhlVYSNybPvgSPEJDFcyevD
 YIvqeZ798+icaWALseCAIJMriVEii4EDtiZRRKU+t8q0LACJWhJEDW52GJpmmuHWEOnSlHJZ/6
 1Kq9q29vpNG+7CSXnDISh55piw5FOSI6jG4vKEiSSF+pmf7v9AG4wZ05XAQAA
X-Change-ID: 20260226-clk-det-rate-fw-managed-4b8d061f31be
To: Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>
Cc: linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Brian Masney <bmasney@redhat.com>, Abel Vesa <abelvesa@kernel.org>, 
 Andrea della Porta <andrea.porta@suse.com>, 
 Baolin Wang <baolin.wang@linux.alibaba.com>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Chanwoo Choi <cw00.choi@samsung.com>, Frank Li <Frank.Li@nxp.com>, 
 Geert Uytterhoeven <geert+renesas@glider.be>, 
 Krzysztof Kozlowski <krzk@kernel.org>, Orson Zhai <orsonzhai@gmail.com>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Sudeep Holla <sudeep.holla@kernel.org>, 
 Sylwester Nawrocki <s.nawrocki@samsung.com>, 
 Tudor Ambarus <tudor.ambarus@linaro.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>, arm-scmi@vger.kernel.org, 
 Chunyan Zhang <zhang.lyra@gmail.com>, 
 Cristian Marussi <cristian.marussi@arm.com>, 
 Fabio Estevam <festevam@gmail.com>, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org, 
 linux-renesas-soc@vger.kernel.org, linux-samsung-soc@vger.kernel.org, 
 Peng Fan <peng.fan@nxp.com>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3457; i=bmasney@redhat.com;
 s=20250903; h=from:subject:message-id;
 bh=QA/oDtTW/MklJzlzkqeDnO3jkZ3ncrUHMklBQka/GKQ=;
 b=owGbwMvMwCW2/dJd9di6A+2Mp9WSGDIX9KnuOuJ6XcNWyYYj7ExcnUvVrhUq6ncvsXXmVDFFv
 53j/0Kho5SFQYyLQVZMkWVJrlFBROoq23t3NFlg5rAygQxh4OIUgIkI2TP8FemuVDc3P32hy/BM
 ysTr7yXqj3mZLhXRVJfPLf4vLnrNnpFhzSUGL9VghpOdinWLVOsKth37reYzn+/qAqe3hxxn+/7
 hBAA=
X-Developer-Key: i=bmasney@redhat.com; a=openpgp;
 fpr=A46D32705865AA3DDEDC2904B7D2DD275D7EC087
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[redhat.com,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[redhat.com:s=mimecast20190719,redhat.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,redhat.com,kernel.org,suse.com,linux.alibaba.com,samsung.com,nxp.com,glider.be,gmail.com,pengutronix.de,linaro.org,arm.com,lists.linux.dev,lists.infradead.org];
	TAGGED_FROM(0.00)[bounces-94337-lists,linux-arm-msm=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[30];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[redhat.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bmasney@redhat.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.979];
	TAGGED_RCPT(0.00)[linux-arm-msm,renesas];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 7570D1AD8AF
X-Rspamd-Action: no action

There are some clocks where the rounding is managed by the hardware, and
the determine_rate() clk ops is just a noop that simply returns 0. Based
on discussions with Stephen at Linux Plumbers Conference, he suggested
adding a flag for this particular case. So let's add a new flag, and
update the clk core so that the determine_rate() clk op is not required
when this flag is set.
    
This series adds the flag, some kunit tests, and updates all of the
relevant drivers under drivers/clk to use the new flag.
    
Once this is merged, and in Linus's tree, I can update the few remaining
clk drivers that are outside of drivers/clk via those subsystems at a
later time.

Merge Strategy
--------------
All of this needs to be directly merged by Stephen as one series into
his tree. Subsystem maintainers: please leave a Reviewed-by or Acked-by.
To reduce the noise, I am only CCing people on their respective drivers.

Note this series depends on 3 previously-posted patches in this git pull
to Stephen for v7.1.
https://lore.kernel.org/linux-clk/aZuK4-QJCXUeSxtL@redhat.com/
Hopefully I set the depeendencies up correctly in b4.

Signed-off-by: Brian Masney <bmasney@redhat.com>
---
Brian Masney (13):
      clk: add new flag CLK_ROUNDING_FW_MANAGED
      clk: test: add test suite for CLK_ROUNDING_FW_MANAGED flag
      clk: rp1: drop determine_rate op and use CLK_ROUNDING_FW_MANAGED flag
      clk: scpi: drop determine_rate op and use CLK_ROUNDING_FW_MANAGED flag
      clk: hisilicon: hi3660-stub: drop determine_rate op and use CLK_ROUNDING_FW_MANAGED flag
      clk: imx: scu: drop redundant init.ops variable assignment
      clk: imx: scu: drop determine_rate op and use CLK_ROUNDING_FW_MANAGED flag
      clk: qcom: rpm: drop determine_rate op and use CLK_ROUNDING_FW_MANAGED flag
      clk: qcom: rpmh: drop determine_rate op and use CLK_ROUNDING_FW_MANAGED flag
      clk: qcom: smd-rpm: drop determine_rate op and use CLK_ROUNDING_FW_MANAGED flag
      clk: renesas: rzg2l-cpg: drop determine_rate op and use CLK_ROUNDING_FW_MANAGED flag
      clk: samsung: acpm: drop determine_rate op and use CLK_ROUNDING_FW_MANAGED flag
      clk: sprd: drop determine_rate op and use CLK_ROUNDING_FW_MANAGED flag

 drivers/clk/clk-rp1.c                   | 11 +----
 drivers/clk/clk-scpi.c                  | 14 +-----
 drivers/clk/clk.c                       | 24 ++++++++--
 drivers/clk/clk_test.c                  | 85 +++++++++++++++++++++++++++++++++
 drivers/clk/hisilicon/clk-hi3660-stub.c | 14 +-----
 drivers/clk/imx/clk-scu.c               | 23 +--------
 drivers/clk/qcom/clk-rpm.c              | 16 ++-----
 drivers/clk/qcom/clk-rpmh.c             |  8 +---
 drivers/clk/qcom/clk-smd-rpm.c          | 15 +-----
 drivers/clk/renesas/rzg2l-cpg.c         |  9 +---
 drivers/clk/samsung/clk-acpm.c          | 14 +-----
 drivers/clk/sprd/pll.c                  |  7 ---
 drivers/clk/sprd/pll.h                  |  2 +-
 include/linux/clk-provider.h            |  2 +
 14 files changed, 123 insertions(+), 121 deletions(-)
---
base-commit: 7d6661873f6b54c75195780a40d66bad3d482d8f
change-id: 20260226-clk-det-rate-fw-managed-4b8d061f31be
prerequisite-patch-id: 59198edc95aca82a29327137ad2af82ec13295b6
prerequisite-patch-id: 8932e170649711d7a80c57784033a37faadd519b
prerequisite-patch-id: 91c7b1851c5d77e504c49ce6bf14b3f8b84e826a

Best regards,
-- 
Brian Masney <bmasney@redhat.com>


