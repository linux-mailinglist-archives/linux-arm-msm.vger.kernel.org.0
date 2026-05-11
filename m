Return-Path: <linux-arm-msm+bounces-106961-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uG99GVXsAWpHmQEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-106961-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 11 May 2026 16:48:53 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id DB6C75108B2
	for <lists+linux-arm-msm@lfdr.de>; Mon, 11 May 2026 16:48:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 2674130AD06F
	for <lists+linux-arm-msm@lfdr.de>; Mon, 11 May 2026 14:42:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 667BF3FF89F;
	Mon, 11 May 2026 14:42:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Gb5xXMZE"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pg1-f178.google.com (mail-pg1-f178.google.com [209.85.215.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F0DB3D47A8
	for <linux-arm-msm@vger.kernel.org>; Mon, 11 May 2026 14:42:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778510538; cv=none; b=W3rqnvx0HDrg/KTmvoglXuR6EbPoOYQNThOKHpLaMp3Lff+X1XCsgOXgc9C0m9tN7WTeGouNPaHot+FjkD7xZha4HwMNdmkOCvpPQ7hXZLINDQ+syAV/53LvulW2Gfk+3M3lxnGk9yx5bou6iM5w9sWg2uluFBO147kQkjDp8Tc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778510538; c=relaxed/simple;
	bh=hI7JXboKMjfPa1oYFZjESpo9tO4F16gE5gtA8f8xfxg=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=BEH0+Mqi6sN8/aIoel/dZqVKS1Qcyon2dPjq8iLcWY/ONqqhCwhG/an2wHZl16J3XSzI4KfNKhho2LpEuNKDv+SFmEyxr2DO+n2ftQgQJMqbeqwf8j96uckTED7D/gGqtKGD/RldLBg1jNnhuJHj1qMNSu1prGP6E/6DbdVb880=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Gb5xXMZE; arc=none smtp.client-ip=209.85.215.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pg1-f178.google.com with SMTP id 41be03b00d2f7-c80167f56cdso1686449a12.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 11 May 2026 07:42:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778510536; x=1779115336; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8jn65Vs/XmHD5uCxPgx2o8WJQwPscsdf6beYXOzE4Zg=;
        b=Gb5xXMZEby9HS7vacphsS16uBt6ZavcMuWi7opfiguu0LUOgtUKzH4X4DbYWS9i2jG
         yhXIyR/UCetnaOp3rjIsUxQ7yqO2NJxD4QmYwAqXoj7GD01ye4MqQePdiW+1Ho+9cIWc
         rSh1gCY0KN9T4jsSU+YYgr/4b0lqPx65WtVgZ4uH3x9PLru8GBnSFcaS9gZG1uQ1EpUk
         4A1/i6SVi3gDagUaGf4bBRWsq+byoJ0D69kfk9QSN/IsLmammXfbzyWGxvKxGRnOtiKH
         KvD4xGh43mD3Gd6ks1nQKDC2xXnqTIO3kpQrMrpUPdXZEDGbUY/esanoozAVGrS7kWUg
         ckaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778510536; x=1779115336;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=8jn65Vs/XmHD5uCxPgx2o8WJQwPscsdf6beYXOzE4Zg=;
        b=FPwMIzdPZ+6KyU/RRSoHuK9jaQ1A6O17C53Eq84s/UTvVHtenycfxOiaxvlE8tdxEp
         K220QGn6CC2l4k/jqhG+Rza7Wm3FQL1bXTUd90JV00M13NR7jin8AwdtlisVxm9KN6eU
         eJY1HMGt9L5HzLW9rBAyQLZ3VEk35/IMyVZesxteogSjk8hLhuYzm3yuHzog8ycgrxk5
         zUrMkPGwDH+23zxBr6XVJxFXDcbZC+/wtCvgxmDBR3O7UxWlbCMCbXMOZKWQIx0FcZrz
         r7EFEOZGzg1Vq7oIAgEdPZTcSqFsgCck4B5uYlwmIt5Clmu84PH6vUJ+c7URrNzgAA1s
         cJdA==
X-Gm-Message-State: AOJu0YzXyQxIP5aI5d+1jFQVLLGSpYoDf/s/5QNFHuGfpmOTBC1YNWKN
	miyBZSi+eFJHwzOXM2stoMLbS9SIqRRIa8XuEDjXT2Yyqe8fYEfic7vcuHSltqx4jSo=
X-Gm-Gg: Acq92OGNkj2Rwrxu2I2eOrWMSZ3YE5wdustUH8nR6wV1uDki3gzfmgqTzu6ORDu8xrj
	hB4SloKnkSR6ZgxY4sbO7rBME/zjIgQ4S9nEirv/cLfFge87wPo4SMFzdkqKil/owCYdS/6k1+J
	hyYYnceEggW0ES2tWT2mzeCIxcmEnVzYBSuZQ4e8K0Rm4kFbUlbn5b+QshRpXl8W+tyL4R4Ff+t
	MD6Bx+sQZvigLNAsDCy0oIqoYzZXC/oFL+arZSHv48vT3iJ36OdyyLmCvc5nujxWbjo2hSrt0+/
	iSAI70iDLqHUndDckM1ZQ5UKxizSz8ymREJe8eEvM4ahwlXBrxPmTg+7r22gJJw7HlpmjhGdPgR
	YHWMPIfJyLjbgXHahS31akLnAZgYA4EMW0He6RrDvnM9GJpSEedX0bM48s8sCi3aY62kCZFzmqV
	+oyRK8ayV0nduNoTioWYHv1LxZjXdmOG3EAYcH2K7UA5+RPQJqKDYBnZvfGFnFL/MP7gTufhW1I
	FGVbgkONZrMHvnZiN8qXbjh
X-Received: by 2002:a05:6a21:e097:b0:3a2:d68d:9e83 with SMTP id adf61e73a8af0-3aa5a907649mr27062284637.5.1778510535983;
        Mon, 11 May 2026 07:42:15 -0700 (PDT)
Received: from harrison-Surface-Pro-12in-1st-Ed-with-Snapdragon.lan ([58.164.4.185])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8396563f11csm26012405b3a.3.2026.05.11.07.42.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 May 2026 07:42:15 -0700 (PDT)
From: Harrison Vanderbyl <harrison.vanderbyl@gmail.com>
To: linux-arm-msm@vger.kernel.org,
	Douglas Anderson <dianders@chromium.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Jessica Zhang <jesszhan0024@gmail.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v1 6/8] drm/panel-edp: Add panel for Surface Pro 12in
Date: Tue, 12 May 2026 00:40:55 +1000
Message-ID: <44d976999b592fb4993bd95238e56cc4d9e228f7.1778498477.git.harrison.vanderbyl@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <cover.1778498477.git.harrison.vanderbyl@gmail.com>
References: <cover.1778498477.git.harrison.vanderbyl@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: DB6C75108B2
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[gmail.com:+];
	TO_DN_SOME(0.00)[];
	TAGGED_FROM(0.00)[bounces-106961-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[vger.kernel.org,chromium.org,linaro.org,gmail.com,linux.intel.com,kernel.org,suse.de,ffwll.ch,lists.freedesktop.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[harrisonvanderbyl@gmail.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	RCVD_COUNT_FIVE(0.00)[5];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-0.997];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCPT_COUNT_SEVEN(0.00)[11];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Action: no action

Add an entry for the BOE NE120DRM-N28 panel,
used in the Microsoft Surface Pro 12-inch.

The values chosen were tested to be working fine
for wake from sleep and hibernation.

Signed-off-by: Harrison Vanderbyl <harrison.vanderbyl@gmail.com>
---
 drivers/gpu/drm/panel/panel-edp.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/panel/panel-edp.c b/drivers/gpu/drm/panel/panel-edp.c
index 497dcd48f57b..2cf52f03c217 100644
--- a/drivers/gpu/drm/panel/panel-edp.c
+++ b/drivers/gpu/drm/panel/panel-edp.c
@@ -2020,6 +2020,7 @@ static const struct edp_panel_entry edp_panels[] = {
 	EDP_PANEL_ENTRY('B', 'O', 'E', 0x0c26, &delay_200_500_p2e200, "NV140WUM-T08"),
 	EDP_PANEL_ENTRY('B', 'O', 'E', 0x0c93, &delay_200_500_e200, "Unknown"),
 	EDP_PANEL_ENTRY('B', 'O', 'E', 0x0cb6, &delay_200_500_e200, "NT116WHM-N44"),
+	EDP_PANEL_ENTRY('B', 'O', 'E', 0x0cc9, &delay_200_500_e50, "NE120DRM-N28"),
 	EDP_PANEL_ENTRY('B', 'O', 'E', 0x0cf2, &delay_200_500_e200, "NV156FHM-N4S"),
 	EDP_PANEL_ENTRY('B', 'O', 'E', 0x0cf6, &delay_200_500_e200_d100, "NV140WUM-N64"),
 	EDP_PANEL_ENTRY('B', 'O', 'E', 0x0cfa, &delay_200_500_e50, "NV116WHM-A4D"),
-- 
2.53.0


