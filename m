Return-Path: <linux-arm-msm+bounces-108856-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CJVzJl4PDmrB5wUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-108856-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 20 May 2026 21:45:34 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id CA2DA598B4E
	for <lists+linux-arm-msm@lfdr.de>; Wed, 20 May 2026 21:45:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 239A634E56CF
	for <lists+linux-arm-msm@lfdr.de>; Wed, 20 May 2026 16:40:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 193A2352038;
	Wed, 20 May 2026 16:40:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bM2vWTiB"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7EEA221F2F;
	Wed, 20 May 2026 16:40:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779295242; cv=none; b=l6Qp+ERA6Q3FkNi5dxpIDLVvzw1mQRJa3WmvCAzUTMD5Ucf8RcVkMv0L2ajd4ct2Y1m6GEv9R08EugxAVBZWlg+shQlN5hoxXGHfoV8xBxThJBA3gwIH/6943lUDU0FZ07Xa/buitxjUiqJ6VBNxT2nFv9ZLMcaI1Za//PU1GPQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779295242; c=relaxed/simple;
	bh=C+bAsxrO7Hwqd7h3A17Hh+Wk9te7bvjVSu4G652FOSE=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=ft2D4Ze/CRIwovc3hxRrWSIO4xeSuEHpp0Mammf2coCSTMt6wQBp4YPsUcJbwFWp5otqy/9ZUL35OfUrA78ELXsKklcultP4TO5q4veO0q3K+yFeL2t1Qsui3d17EQrIObExpgs2IsiEkW0izfdElxtQKbqCR27KcgASGC4tz9k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bM2vWTiB; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id B3C15C2BCB0;
	Wed, 20 May 2026 16:40:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1779295241;
	bh=C+bAsxrO7Hwqd7h3A17Hh+Wk9te7bvjVSu4G652FOSE=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=bM2vWTiB3uWVR0vB6KYNd9Ft82YThNYWg+mwz5z6zUdP6SltRenR20T2V/wUx9APL
	 DdTSYki+5OMp46KbFrx6w06L2eMbD7hZQmOWk5omXPnoej+wLtGfTSCoYbWjmC2e77
	 iGkd6gL7g+tcSS+lloy8ckbvdOSqj1V9fVyjmhoIQWUOyv0NK0PIjFqT0j1jadHuGa
	 z1H4k17qaQTKvi4HIte71E/JID6isEidTVy/pMcchBMRVFIqCiQKhO1KArKkwRbDjo
	 9GcIoykYJsSDIoR7Rg8OnOcbt8EgseFMfG36QMq9S09niQX3HSvI2isVrMZshdfuAz
	 r91eRTjqQermg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A5F73CD5BA4;
	Wed, 20 May 2026 16:40:41 +0000 (UTC)
From: =?utf-8?q?J=C3=A9r=C3=B4me_de_Bretagne_via_B4_Relay?= <devnull+jerome.debretagne.gmail.com@kernel.org>
Subject: [PATCH 00/11] Microsoft Surface Pro 9 5G update
Date: Wed, 20 May 2026 18:40:04 +0200
Message-Id: <20260520-surface-sp9-5g-for-next-v1-0-9df52552bf87@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAOTjDWoC/x3MwQ6CMAyA4VchPVtTF2HiqxgP2+igl0FaJCSEd
 3d6/A7/f4CxChs8mwOUNzGZS8Xt0kCaQhkZZagGR66j1hHaR3NIjLb02I6YZ8XC+4r+0fsUI+W
 7S1DrRTnL/j+/3tUxGGPUUNL0+23+SnCeX4YdOrKAAAAA
X-Change-ID: 20260520-surface-sp9-5g-for-next-7897cbb0f42c
To: Douglas Anderson <dianders@chromium.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Jessica Zhang <jesszhan0024@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 Krzysztof Kozlowski <krzk@kernel.org>, 
 =?utf-8?q?J=C3=A9r=C3=B4me_de_Bretagne?= <jerome.debretagne@gmail.com>, 
 Jens Glathe <jens.glathe@oldschoolsolutions.biz>, 
 Bartosz Golaszewski <brgl@kernel.org>, Johan Hovold <johan@kernel.org>, 
 Stephan Gerhold <stephan.gerhold@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1779295238; l=1578;
 i=jerome.debretagne@gmail.com; s=20260520; h=from:subject:message-id;
 bh=C+bAsxrO7Hwqd7h3A17Hh+Wk9te7bvjVSu4G652FOSE=;
 b=TxYunP+RMjqX6ztukqcbFSA9ok7XwP4bO3nlR9H9+xVWj1Xay+n9Ee8UnjAKgLVtfFf5+ndDL
 lfsAqQJ15CeBEwbFacPNIhbr5cf+0/QkZR0U+O/1CQ1wqrd3TNeUcLZ
X-Developer-Key: i=jerome.debretagne@gmail.com; a=ed25519;
 pk=3/JYhgYjGg5V9mlFxc0A0+pFiyjsuDB/TtDlNMId9fk=
X-Endpoint-Received: by B4 Relay for jerome.debretagne@gmail.com/20260520
 with auth_id=785
X-Original-From: =?utf-8?q?J=C3=A9r=C3=B4me_de_Bretagne?= <jerome.debretagne@gmail.com>
Reply-To: jerome.debretagne@gmail.com
X-Spamd-Result: default: False [1.96 / 15.00];
	FREEMAIL_REPLYTO_NEQ_FROM(2.00)[];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MIXED_CHARSET(0.63)[subject];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-108856-lists,linux-arm-msm=lfdr.de,jerome.debretagne.gmail.com];
	FREEMAIL_TO(0.00)[chromium.org,linaro.org,gmail.com,linux.intel.com,kernel.org,suse.de,ffwll.ch];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FREEMAIL_REPLYTO(0.00)[gmail.com];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	RCPT_COUNT_TWELVE(0.00)[23];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	HAS_REPLYTO(0.00)[jerome.debretagne@gmail.com];
	RCVD_COUNT_FIVE(0.00)[5];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[devnull@kernel.org,linux-arm-msm@vger.kernel.org];
	FREEMAIL_CC(0.00)[lists.freedesktop.org,vger.kernel.org,kernel.org,gmail.com,oldschoolsolutions.biz,linaro.org];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DKIM_TRACE(0.00)[kernel.org:+];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Queue-Id: CA2DA598B4E
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

This series updates the support for the Microsoft Surface 9 5G
(Arcata), bringing it more up-to-date and aligned with the other
sc8280xp models such as the Lenovo ThinkPad X13s.

As highlights, it finally enables the built-in screen, it fixes
Display Port alt mode on the top left-side USB-C port, it enables
the volume up/down keys and the lid switch.

Signed-off-by: Jérôme de Bretagne <jerome.debretagne@gmail.com>
---
Jérôme de Bretagne (11):
      drm/panel: edp: Add LG LP129WT232166 panel
      arm64: dts: qcom: sc8280xp-arcata: Enable backlight
      arm64: dts: qcom: sc8280xp-arcata: Enable the eDP display
      arm64: dts: qcom: sc8280xp-arcata: add USB-C orientation GPIOs
      arm64: dts: qcom: sc8280xp-arcata: Fix top USB-C DP alt mode
      arm64: dts: qcom: sc8280xp-arcata: Enable 4-lane DP support
      arm64: dts: qcom: sc8280xp-arcata: Add volume up/down GPIO keys
      arm64: dts: qcom: sc8280xp-arcata: Add lid switch
      arm64: dts: qcom: sc8280xp-arcata: model the PMU of the on-board wcn6855
      arm64: dts: qcom: sc8280xp-arcata: Switch to uefi rtc offset
      arm64: dts: qcom: sc8280xp-arcata: Drop duplicate DMIC supplies

 .../boot/dts/qcom/sc8280xp-microsoft-arcata.dts    | 301 ++++++++++++++++++---
 drivers/gpu/drm/panel/panel-edp.c                  |   1 +
 2 files changed, 266 insertions(+), 36 deletions(-)
---
base-commit: 028ef9c96e96197026887c0f092424679298aae8
change-id: 20260520-surface-sp9-5g-for-next-7897cbb0f42c

Best regards,
-- 
Jérôme de Bretagne <jerome.debretagne@gmail.com>



