Return-Path: <linux-arm-msm+bounces-89889-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UArTHa8BcGmUUgAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-89889-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 20 Jan 2026 23:29:03 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id 43EFB4CF8D
	for <lists+linux-arm-msm@lfdr.de>; Tue, 20 Jan 2026 23:29:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 359EA58E9F9
	for <lists+linux-arm-msm@lfdr.de>; Tue, 20 Jan 2026 21:41:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E443642B757;
	Tue, 20 Jan 2026 21:41:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bpFfmmxH"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF2BB3F23DC;
	Tue, 20 Jan 2026 21:41:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768945264; cv=none; b=gYuGivfpI8x78J6kb53lgnWfGHhbuBGBQQ0tellzXFalzIeFHNHufncByuIIXQmp2KVLvH2LKlJkvp2IK9bnbk9pji2mQ8BPcyHOoc3Y+QSqgoh/wjc4CsMb0U9hnjdfNKn4fBs7U2EOtj1YZ5Iic7i7bJKsKHCoKBXhEYUQ6uE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768945264; c=relaxed/simple;
	bh=YJzJJUi++2uUYfkEQ8T6yu3Qy4wq058C1WeL4Qj82gQ=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=GvENUCi7wXd5SoAX3eRcGIK0U/gdf970M/sd19AfBxdkXgPUoJL4UTRXS4UdCYH2zZp6xsENl2pGimRvNLDRchIyKn7qRIpV51HLTRniEc2+/ybz/jNlZPpVkHZb4Abm+d9cqOKdhQba6nK8V2CtwAIpVfOmyKhCDKKLZPQIV68=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bpFfmmxH; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id EF394C16AAE;
	Tue, 20 Jan 2026 21:41:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768945264;
	bh=YJzJJUi++2uUYfkEQ8T6yu3Qy4wq058C1WeL4Qj82gQ=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=bpFfmmxH04HO+Wio1J56kcbTMV7GG5KKhVT53MYEZah3wB57kpSR03IpsEdEIKEdb
	 +kvdMwWUPLGP3137bN/AHntqQMo2zwfwq9A3W1LQvXeuBCFtvfou963wkLV64kFWGL
	 CITDRwo0l/hHf/CI6a/ysIBTSJftucWN3eduVz2bOXu+KIPRnqXMEUG0m6ynC7qMrj
	 aEKI1cm+rs7VziTpF8ie6uavDS1etfM5XlhJRO+XPVhJX1WYpl3LzprtqvEPWorMxc
	 XS5+oFCZrAtXvEgynQP6mOQh40sHauvwFMWssPLZs/ThBSer0L6320ySPa861xOEdO
	 sQe9bEDTZajiQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DAECCD2629F;
	Tue, 20 Jan 2026 21:41:03 +0000 (UTC)
From: Yedaya Katsman via B4 Relay <devnull+yedaya.ka.gmail.com@kernel.org>
Subject: [PATCH v4 0/3] Support FT3518 touchscreen in xiaomi-laurel
Date: Tue, 20 Jan 2026 23:40:53 +0200
Message-Id: <20260120-touchscreen-patches-v4-0-30145da9d6d3@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/33NTQ6DIBCG4as0rEsDI/jTVe/RdAE4CkkVA9a0M
 d696Mo0psv3S+aZmUQMDiO5nmYScHLR+T6FOJ+Isapvkbo6NQEGOeM8o6N/GRtNQOzpoEZjMVK
 NGiTkupaNJulyCNi496beH6mti6MPn+3JxNf1vzdxyqjirJJFk0Fdl7e2U+55Mb4jqzfB3hDHB
 iRDAJdNJUyptPo1sr1RHhtZMrjJVQGVkajF3liW5QsMz2LjPgEAAA==
X-Change-ID: 20260113-touchscreen-patches-beb2526bd5fb
To: =?utf-8?q?Kamil_Go=C5=82da?= <kamil.golda@protonmail.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-input@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 Yedaya Katsman <yedaya.ka@gmail.com>, SzczurekYT <szczurek@szczurek.yt>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1768945262; l=1661;
 i=yedaya.ka@gmail.com; s=20260113; h=from:subject:message-id;
 bh=YJzJJUi++2uUYfkEQ8T6yu3Qy4wq058C1WeL4Qj82gQ=;
 b=P9IIClJs67VvxEvmdkAc9XXIk6TJyBBK8SZjxJggcpfStBtgXVdTjJnTHYtdHSVJW9WT3q0pW
 mlUti4myNM7ATfiWvqf6d4FeyHa16sOcvwJ5P3UbJIDACWfqGVu/s8s
X-Developer-Key: i=yedaya.ka@gmail.com; a=ed25519;
 pk=CgNmxD3tYSws5dZfpmJfc6re/bV/f47veVijddHLytk=
X-Endpoint-Received: by B4 Relay for yedaya.ka@gmail.com/20260113 with
 auth_id=601
X-Original-From: Yedaya Katsman <yedaya.ka@gmail.com>
Reply-To: yedaya.ka@gmail.com
X-Spamd-Result: default: False [1.54 / 15.00];
	FREEMAIL_REPLYTO_NEQ_FROM(2.00)[];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-89889-lists,linux-arm-msm=lfdr.de,yedaya.ka.gmail.com];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FREEMAIL_REPLYTO(0.00)[gmail.com];
	FREEMAIL_TO(0.00)[protonmail.com,kernel.org];
	RCPT_COUNT_TWELVE(0.00)[12];
	MIME_TRACE(0.00)[0:+];
	DMARC_POLICY_ALLOW(0.00)[kernel.org,quarantine];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	HAS_REPLYTO(0.00)[yedaya.ka@gmail.com];
	R_SPF_SOFTFAIL(0.00)[~all:c];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[devnull@kernel.org,linux-arm-msm@vger.kernel.org];
	FREEMAIL_CC(0.00)[vger.kernel.org,gmail.com,szczurek.yt];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:7979, ipnet:213.196.21.0/24, country:US];
	DKIM_TRACE(0.00)[kernel.org:+];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[ams.mirrors.kernel.org:rdns,ams.mirrors.kernel.org:helo,postmarketos.org:url]
X-Rspamd-Queue-Id: 43EFB4CF8D
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Adds support for the touchscreen in the Xiaomi Mi A3 (xiaomi-laurel)
 smartphone, FocalTech FT3518

Original tree was here:
 Link: https://gitlab.postmarketos.org/SzczurekYT/linux/-/commits/laurel

Signed-off-by: Yedaya Katsman <yedaya.ka@gmail.com>
---
Changes in v4:
- Follow dts coding style for pinctrl nodes
- Don't refrence touchscreen "release" gpio config
- Link to v3: https://lore.kernel.org/r/20260118-touchscreen-patches-v3-0-1c6a729c5eb4@gmail.com

Changes in v3:
- Rename regulator node and reorder nodes
- Add gpio pin configuration for pmx_ts_* in sm6125, and reference in the
  touchscreen configuration as pinctrl-*. Doesn't have configuration for
  the gpio 83 pin since it isn't documented downstream.
- Link to v2: https://lore.kernel.org/r/20260114-touchscreen-patches-v2-0-4215f94c8aba@gmail.com

Changes in v2:
- Fixed name and email in signoffs
- Link to v1: https://lore.kernel.org/r/20260113-touchscreen-patches-v1-0-a10957f32dd8@gmail.com

---
Yedaya Katsman (3):
      dt-bindings: input: touchscreen: edt-ft5x06: Add FocalTech FT3518
      drivers: input: touchscreen: edt-ft5x06: Add FocalTech FT3518
      arm64: dts: qcom: sm6125-xiaomi-laurel-sprout: Add Focaltech FT3518 touchscreen

 .../bindings/input/touchscreen/edt-ft5x06.yaml     |  1 +
 .../boot/dts/qcom/sm6125-xiaomi-laurel-sprout.dts  | 65 ++++++++++++++++++++++
 drivers/input/touchscreen/edt-ft5x06.c             |  6 ++
 3 files changed, 72 insertions(+)
---
base-commit: b71e635feefc852405b14620a7fc58c4c80c0f73
change-id: 20260113-touchscreen-patches-beb2526bd5fb

Best regards,
-- 
Yedaya Katsman <yedaya.ka@gmail.com>



