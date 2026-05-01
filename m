Return-Path: <linux-arm-msm+bounces-105479-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id bF2WObOw9GmwDgIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-105479-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 01 May 2026 15:54:59 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 8755B4ACE84
	for <lists+linux-arm-msm@lfdr.de>; Fri, 01 May 2026 15:54:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 197273044A73
	for <lists+linux-arm-msm@lfdr.de>; Fri,  1 May 2026 13:53:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EB7333B8D4F;
	Fri,  1 May 2026 13:53:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="krgXH9pU"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F23E3BF692
	for <linux-arm-msm@vger.kernel.org>; Fri,  1 May 2026 13:52:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777643585; cv=none; b=Ft6VpG2Q+FgiwbniP7jHAdz5Nbuvooqydgwvp0b7eTOs2Es2c803+0ineKYnUZMVuJv815SevL2HSFjqzS2cmkEY9W8TbbhmMlL2SzibJYgn8yIdLBQ60s4QHFPjG9CXdDuW9CflrW0DToJhjI3kHYA8CTHRlzUtZ6noOHiwl/k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777643585; c=relaxed/simple;
	bh=DjNX5gZc/D+U2BXi73d2NzYnyku+i1c2bZwR+jErVvg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=s7CrIHxp4vlNRW1iHPfRCIgxiBST9XiXmY+h7GLYBqRvrb610INFsgA8F/tc3v0og7iwiCGyj5lKEv4YalR/W2l6hUsj7eFmWyx7PVg5tIY7DMpPBOz+OkswSDDRXtURgxyFqrVuacAOPziMSXa0og2+h5hUkthDrrp8ddGvmgo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=krgXH9pU; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-4893940bb5eso11229885e9.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 01 May 2026 06:52:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1777643577; x=1778248377; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wlBdgMSaBrvj4nn3fTIofsiAJVqHoduoWGd4wbf6uD4=;
        b=krgXH9pU8b8Ox4OfTuleyRt5XjJMOvbG/NfnAs9cRSJ6jyKFcBWjW49KzhdGWIVQKo
         zXrqWtqAE5c4pTw1w8fnguLGrRXrtIerLBYMGCUkZp99OrC+yZsH+a4sp1n+Se67HjGo
         W4C2DJLTPOdpvyHHKBxkB7FGGe8odzvgBlqzZMc7sVkAJOuE8nPG1cMhuzV72NgD+erd
         7H9mHtzOjEigh/XLVQMWzGYYO4+nFxuN8FiC7Q+TzoJVbvKnxHh77tNsbtNKEDL2QD+S
         8JcAUCcXv1JlabDPFgE3ZoUbzAWaipFpIYwdKMVYY9NVoDbSZzT2+v5DwyKftb+qLaT5
         8LsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777643577; x=1778248377;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=wlBdgMSaBrvj4nn3fTIofsiAJVqHoduoWGd4wbf6uD4=;
        b=o7+24Xah8sqsXjqWoh2Ur/Jbwgn8j/QYmdR7swpT6LnyBUtIlZaPSv3w9mwB3c1B0p
         KVK9VGXl5uOHC52+FsMarOtt+R2ccnnMJ6zcgB7ADATGwSXMHwHv1E5B/AZ2Fxly8q7c
         BGtWgyZA5Mg+hH0YxA213AJy1oyyvBkMoTNiDmx53nhJnpdBY4dJqmaT020BYQfK2HxG
         hL+VEt1OXnvZQujpigUNuiUwz8+fwr5iuL65ExRmdo9q2avFKhSxbaF3+SxqNE07LZYm
         DVyEHdRIc3Ospckr79cNNL+4TLZ65KS9q3LPgOq2etkAN3zN+nUoIaO+DJVWhoJhlGLh
         VnTg==
X-Forwarded-Encrypted: i=1; AFNElJ/IVhPvDLbXKx64zPABOwUVrMrFKttWwfvJp6n/I6ncN2bxvAjfZ3x6BYjY2sDe2gnwcgCLFc6iM/+3ihRJ@vger.kernel.org
X-Gm-Message-State: AOJu0YzM30cj/JYPN1+QJszSq1sLYXLSypDoYUcT/F267XTuFoSJh/gm
	ChaeLO2COZDx+uZCWD3CMcX+0lVsjP6P33vS2vAYXrSqdRdil1sh9Z7mOIILGMgcJOk=
X-Gm-Gg: AeBDiesqYwaIRtUNjsdXD+YqsvVXgi0x5iXhEAg13XjL5W4QruEppU8UfXCjVpWf/OF
	ft8GALQjG0TgiP2ksbKtO2ZFT0TpjTmXzoZkzBfToBN60Pma6t6gKyNRJKEM8EQR+iisIRQS/qz
	PM6ylZ1rrPIWkVmAJ2/i34IcLJMbjnIDIc98qV9uk64+0UsXaPMMaxK3jTDS7lEzXoSdYTJorNd
	y+LHsoHOxFP8J63IbdingLF+jqWmuzlQ1TIejN4Ep9ANMDJUnFHXfzYBt6W7ZqDvcrlquvLGm3d
	UIVmFZDHVu8p2oBm+Wm/3vcNXpmC3s6m5vtMdKV/q0h71d/bzv+K0W/mj6lSDDbVKa3cZGZ7NZ/
	4mupiGXBwkkLX62E8AFBZcHtMePCDPV68B25nAuMDbJUI34W0lnyJF2JevlSEELMqy4uIPNZu/E
	1RAcWJuCXVPGgRbcFWGRlvOX2czFbjnWGgLMFs+N9x91kDLdyIC5fo7+xGBvS0DZagv9hMOAr6k
	gJ0WL9MbSx9AgsJEpE=
X-Received: by 2002:a05:600c:a119:b0:48a:75b9:5e07 with SMTP id 5b1f17b1804b1-48a844f4de3mr89135795e9.11.1777643577053;
        Fri, 01 May 2026 06:52:57 -0700 (PDT)
Received: from [192.168.178.36] (046124199213.public.t-mobile.at. [46.124.199.213])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48a822bf3ffsm143934275e9.7.2026.05.01.06.52.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 01 May 2026 06:52:56 -0700 (PDT)
From: Luca Weiss <luca.weiss@fairphone.com>
Date: Fri, 01 May 2026 15:52:47 +0200
Subject: [PATCH 3/4] arm64: defconfig: Enable Novatek NT37705 panel
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260501-fp6-panel-v1-3-e09cb05651cc@fairphone.com>
References: <20260501-fp6-panel-v1-0-e09cb05651cc@fairphone.com>
In-Reply-To: <20260501-fp6-panel-v1-0-e09cb05651cc@fairphone.com>
To: Neil Armstrong <neil.armstrong@linaro.org>, 
 Jessica Zhang <jesszhan0024@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 Luca Weiss <luca.weiss@fairphone.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1777643570; l=724;
 i=luca.weiss@fairphone.com; s=20250611; h=from:subject:message-id;
 bh=DjNX5gZc/D+U2BXi73d2NzYnyku+i1c2bZwR+jErVvg=;
 b=Y2pJ0AUuHyu+EETploINL6flChxL+nyB3pK50wKvLl3v72jYTSoxvGfIDclaN0/CdVAkrGmir
 NanfOodzP6WDAj8JVb7IBI6qsyJ9NM6FbF9JLWK4/bvdAzjAevbGEwQ
X-Developer-Key: i=luca.weiss@fairphone.com; a=ed25519;
 pk=O1aw+AAust5lEmgrNJ1Bs7PTY0fEsJm+mdkjExA69q8=
X-Rspamd-Queue-Id: 8755B4ACE84
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[fairphone.com,quarantine];
	R_DKIM_ALLOW(-0.20)[fairphone.com:s=fair];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-105479-lists,linux-arm-msm=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_TO(0.00)[linaro.org,gmail.com,linux.intel.com,kernel.org,suse.de,ffwll.ch];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[19];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[fairphone.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[luca.weiss@fairphone.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[fairphone.com:email,fairphone.com:dkim,fairphone.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]

Enable the NT37705 panel driver which is used on Fairphone (Gen. 6).

Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
 arch/arm64/configs/defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index dd1ac01ee29b..cbf62bf623ba 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -1007,6 +1007,7 @@ CONFIG_DRM_PANEL_KHADAS_TS050=m
 CONFIG_DRM_PANEL_MANTIX_MLAF057WE51=m
 CONFIG_DRM_PANEL_NOVATEK_NT36672A=m
 CONFIG_DRM_PANEL_NOVATEK_NT36672E=m
+CONFIG_DRM_PANEL_NOVATEK_NT37705=m
 CONFIG_DRM_PANEL_NOVATEK_NT37801=m
 CONFIG_DRM_PANEL_RAYDIUM_RM67191=m
 CONFIG_DRM_PANEL_RAYDIUM_RM692E5=m

-- 
2.54.0


