Return-Path: <linux-arm-msm+bounces-94024-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CF0XKR+NnmmPWAQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-94024-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Feb 2026 06:48:15 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 51D231922B6
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Feb 2026 06:48:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id E758F3043BDB
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Feb 2026 05:46:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3E2542DC798;
	Wed, 25 Feb 2026 05:46:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CDJWdzj8"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28B862BE641
	for <linux-arm-msm@vger.kernel.org>; Wed, 25 Feb 2026 05:46:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771998387; cv=none; b=pEYJvZRP6MVNTcX0cxRbYU1JExkPZ+6EIO6MFAIb/N1HswBLZVfyInhJ0q4NN6gYT48r3BcNhimiUe8PzoMgYJyVTv/3ytrkbtnyZ0kU+r9xVKPLrZTaaZGkHSg/K3iS4T6BVfgAjY23ntQC+3MEHxX53t7hQYLxYJBHZmG2Lxk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771998387; c=relaxed/simple;
	bh=/vsqzfrz3eqtZqv3MExBp2YVHvuU2KJQQNGsui5yFh0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=oMlcg530EtsB0aXN305rdYVOcnT1nL+UR4cqGkUuo7SKhP8IYBSZSaUsZZQWXKpRTIEABOhj+lXa9bxra2USD4xBgXfXl0QtWXi8LbC1QJuQ2WXUwAR3Pblpl0wrd7BA1n6LhrGQp7a4AsgWxqoz3WR8I4l4Da/9cOZu2eux+9I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CDJWdzj8; arc=none smtp.client-ip=209.85.214.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-2ad3f12a496so1965945ad.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 24 Feb 2026 21:46:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771998385; x=1772603185; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Kz+La1wGtHFyZ5mH4/H9qP4gjS7EzfFPspxjfpbovWA=;
        b=CDJWdzj8LTRELZZDd8jPMFBfjKQ7FqDBiVK3zAkfCjoTAod/zrz/7zX2L8kMjF/htF
         ossJMsyV+1/SEz6pSO1vHDrSJPi6EWBo/i61O0kri0psWFWd9aci84wG0lKW5MRkz9jM
         ooaq5JZwsCXyMXc7+X0SUM6zqWy61c/3XpumtVffRU2+a5/ruYdceYK8G0ohkf8riq9q
         ZgjVhgR5PLJjhcBycBoJCk5Xp6HMjhSdLtiTnPJiuRk4eChG8+YCz23ZWtjJRxPhYKZr
         UwvGeGa4RFW/7k1qAjmDSxQNRKGGQAWsj7VVF6MoXiI4VlcJNg0cxBMj/R0BTxVLUmMN
         dlCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771998385; x=1772603185;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Kz+La1wGtHFyZ5mH4/H9qP4gjS7EzfFPspxjfpbovWA=;
        b=TgvnB8UnwVsExM23SXdDKTncjAkIfVDK55HfS/iz5ppabsZpAvPG8luXII1DBs9NHP
         7295bEcNjpWN+Dkbt3IWSFELvlkDvfbhPvdRPCmo9BtMOEAY7QGYm8V+NkTkiw6phd7N
         7HMrxxiOvx+tieGmq2FAekphjfEOygocZW2XopMsyGvcW9inTWNQ45cdlxVg7zWazWOb
         Wgo2OnS6R2/gLtLtNOZDUDe4YWILQFL5KHdpp8BaqdCwz+7xsuTQTat8b1pYeMSNoJph
         TfKZJIEEZ5bDVQtIY7ugqItv2i2pDXCACMhuLYWMv/wZrf7ATbm+QOg+fAjnYJYaVC0D
         IIrQ==
X-Gm-Message-State: AOJu0Yw04r8+Sx5VOF5jcvfWLCz+pR/ufe9v6sGXUBAY79eLOXr2Wyht
	qk1lRRurh9miYm0yZVKp1ETlASEb/6GMl/G82mwTMMhTiR7vuGvlj+9d
X-Gm-Gg: ATEYQzzTp7c01iVxwgEuZeFAuujhpwEZkVr3pdnhGpW6/3wwnGBcJcIUabZnNXvsytc
	4vwKNRi58JjEkp12tCTQKVEO85vTBIbwaC9D7MKe60f51wolQ/Ad1Mmw/2LXSwSseYOG14IBuXY
	ZHss7mimmSSxXfbiz3UKTt3F7YvZFwMnNGjm6IJgcnbXHfkP8zg9SyfH7RHZDsFaK6QInVdZNh/
	XL7l6kg0C5cSAC8csHxM59JHiGM1y3sqvkabwhHdtwNpyxQXLE6nmSlgpegg+CTeptpBM/cueGu
	o5w7sSC03FzJl+MPpqjr0R/YAz+/KEwPVvubwCiDCkIxQttkxudLYDtzgE3MtA+PhADWDIKQ2aw
	tU6Xk2j5hIX0KeApmcDqe1BykXhJuorAcwn9Caf8gBczMIwtDlXHOP15Yxrovt7bwIvH/XmdNAU
	djZrA8ng==
X-Received: by 2002:a17:903:f83:b0:2a0:fb1c:144e with SMTP id d9443c01a7336-2adbdc3f5d7mr22946505ad.7.1771998385565;
        Tue, 24 Feb 2026 21:46:25 -0800 (PST)
Received: from nuvole.lan ([2408:824c:a17:8230::c83])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ad7500e318sm119665295ad.43.2026.02.24.21.46.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Feb 2026 21:46:25 -0800 (PST)
From: Pengyu Luo <mitltlatltl@gmail.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>,
	Dmitry Baryshkov <lumag@kernel.org>,
	Abhinav Kumar <abhinav.kumar@linux.dev>,
	Jessica Zhang <jesszhan0024@gmail.com>,
	Sean Paul <sean@poorly.run>,
	Marijn Suijten <marijn.suijten@somainline.org>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Krishna Manikandan <quic_mkrishn@quicinc.com>,
	Jonathan Marek <jonathan@marek.ca>
Cc: linux-arm-msm@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	freedreno@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Tianyu Gao <gty0622@gmail.com>,
	White Lewis <liu224806@gmail.com>,
	Pengyu Luo <mitltlatltl@gmail.com>
Subject: [PATCH 4/5] drm/msm/dsi: Add DSI PHY configuration on SC8280XP
Date: Wed, 25 Feb 2026 13:45:24 +0800
Message-ID: <20260225054525.6803-5-mitltlatltl@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260225054525.6803-1-mitltlatltl@gmail.com>
References: <20260225054525.6803-1-mitltlatltl@gmail.com>
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
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-94024-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,kernel.org,linux.dev,gmail.com,poorly.run,somainline.org,linux.intel.com,suse.de,ffwll.ch,quicinc.com,marek.ca];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCPT_COUNT_TWELVE(0.00)[26];
	FREEMAIL_CC(0.00)[vger.kernel.org,lists.freedesktop.org,gmail.com];
	DKIM_TRACE(0.00)[gmail.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mitltlatltl@gmail.com,linux-arm-msm@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	FROM_HAS_DN(0.00)[]
X-Rspamd-Queue-Id: 51D231922B6
X-Rspamd-Action: no action

According to the REG_DSI_7nm_PHY_CMN_GLBL_RESCODE_OFFSET_TOP_CTRL
value(0x3c) on Windows OS, we can confirm that the SC8280XP uses the
5nm (v4.2) DSI PHY.

Since SC8280XP and SA8775P have the same DSI version (v2.5.1), using
SA8775P configuration.

Signed-off-by: Pengyu Luo <mitltlatltl@gmail.com>
---
 drivers/gpu/drm/msm/dsi/phy/dsi_phy.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpu/drm/msm/dsi/phy/dsi_phy.c b/drivers/gpu/drm/msm/dsi/phy/dsi_phy.c
index 7937266de..4a37c50d9 100644
--- a/drivers/gpu/drm/msm/dsi/phy/dsi_phy.c
+++ b/drivers/gpu/drm/msm/dsi/phy/dsi_phy.c
@@ -565,6 +565,8 @@ static const struct of_device_id dsi_phy_dt_match[] = {
 	  .data = &dsi_phy_5nm_sar2130p_cfgs },
 	{ .compatible = "qcom,sc7280-dsi-phy-7nm",
 	  .data = &dsi_phy_7nm_7280_cfgs },
+	{ .compatible = "qcom,sc8280xp-dsi-phy-5nm",
+	  .data = &dsi_phy_5nm_8775p_cfgs },
 	{ .compatible = "qcom,sm6375-dsi-phy-7nm",
 	  .data = &dsi_phy_7nm_6375_cfgs },
 	{ .compatible = "qcom,sm8350-dsi-phy-5nm",
-- 
2.53.0


