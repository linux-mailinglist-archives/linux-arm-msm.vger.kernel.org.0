Return-Path: <linux-arm-msm+bounces-107713-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EJLXML2yBmqKnAIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-107713-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 15 May 2026 07:44:29 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 42A80549AE9
	for <lists+linux-arm-msm@lfdr.de>; Fri, 15 May 2026 07:44:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 2230D3079565
	for <lists+linux-arm-msm@lfdr.de>; Fri, 15 May 2026 05:42:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E1F013655ED;
	Fri, 15 May 2026 05:42:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="h5Uqhr98"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57DD536495D
	for <linux-arm-msm@vger.kernel.org>; Fri, 15 May 2026 05:42:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778823767; cv=none; b=ehBeWKsod4zDf2f2jE6SPK8SsDJXx+faqsEbNm57K1wL+dyvLfICH2r1LTRJ6TKhuYgQJGYt8Bm7g1DymDa2Yk+++y6rC2lKMfOkNyBw4PXEbC/SNX75m/++K1zoaQaaihnbpUOEylutWXKDkvWjuiAXAGUwZVzpQMEIRgyE034=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778823767; c=relaxed/simple;
	bh=Y73P+DS/FTU/93/7veziKipaMWdTKZWFtdrT9hZPEZ8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=gS35EZ6j2L6dKBV6hoXpfFv1y0gva0TqgiiZoYc4xnalB6xq2sDLE65csfafdIfpi5NLSEnfvFWWyCizg6To8Oxs2xtKp64jmFr637UZ9a4sIsUIw2/eCanDahrpWXpxPutfA2ah0EGJADk5jjivrImul4pelRgsa/HT+GSMMzY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=h5Uqhr98; arc=none smtp.client-ip=209.85.210.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f172.google.com with SMTP id d2e1a72fcca58-837b39eb078so6016110b3a.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 14 May 2026 22:42:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778823766; x=1779428566; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1QMruzNzp/w/H8WMl6Rm7xeR7IZKT2QV9Y6KPDlL64Q=;
        b=h5Uqhr98A/S+sWa891n/nmnzzvr/7o+Kxt+YySgyGIP/67X2XmE6pED4cwveVgY9h4
         hMxNtNMkWN8M0HfhFnJ6Y1K0qZHZ+E85ByyTCh4Biu9psn3h8fTEyzg4JxZMlrEzNjXW
         WdEsY4brrHD1CreJVnYW+gEjohMz1F8teTntonshydl28SBQL0hQjD0Gsald4IFPn2kf
         gVnmoObBr+8R6Iis3BRWgMQlSyL9fMdMfVowozSpmg6iHw6W8oEgm1r6rUHTUpG26WFV
         3Fy/Qqiai9h6wgM/BQxmXsjeLpLogntYV34iSsbUKXgIIekGljwC564i0Mvz8AVvEsVi
         aMHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778823766; x=1779428566;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=1QMruzNzp/w/H8WMl6Rm7xeR7IZKT2QV9Y6KPDlL64Q=;
        b=JHzHBgE8/eX/iRXML5CIR6yah800jV06G5hUP6MKZmei3YqcO+T4i0xFbnS+d6loJo
         fUbBGPCtDnSQicua0eUzLq58jzDajPIUYmZVZx9aOGiGDDxdsBJxGJcYXlt7qSGfntq8
         GXDKIpR7K4VQLhhzmL2uwbEywd1liqHA/SAWyJOANXgoYdQMdW1Bh2ejbELAqUlpJ7qk
         FQNIEzZ1Ah6/GVGVVwMKXAVfrAHzn3WAu8+QJWuXIdK8AYHzoZM9rI61S8DzyMyrGXnb
         UKtYz/x9+J6cQcgrLmixEfMPdqHeFZosIS+YX3U5NYgck7o1E/E1nczHiXRIAM4h6Yjl
         2HNQ==
X-Forwarded-Encrypted: i=1; AFNElJ8Rx3N6c6mGfGZXz078kPR/J+vynPzTd86GonOiCJGiPIycjc4p3jYd5SDdpdKw07T7npXdT6/r7oWnOCBE@vger.kernel.org
X-Gm-Message-State: AOJu0YweppgfREIJ76akzuFaXshrj3jZvGRoOpLfSEs7fmYhqgvWZkZz
	ZXulja1IoUsKyRlqCRggc3Fu6mk7dBL9hBHUely5w6s2B3e4oRCjreUA
X-Gm-Gg: Acq92OHE9qhrRJS/rcK8BKReDgqbf50ZHkyDoCdcU/ckLc1Ahp43Cm4CEeM0NiGXXgd
	GIFSu8DmxDBhpZOL5OStNCYcgYvz/AOgpQ6n3E79B1UmClc0dst4OqcOxRkAEnT1Z6+ORekrrgg
	S0ZdnCAHhQo1W2QZgn0TO4dk/hH4y4McFLrHoO11lErAj1iZr43uftUOvxNc/UOI/UGcLy2nGqj
	Llp1jss46z/Xm3pC/246E5qI4lwBDYvCo3eUgyDHuPXEiuo7bs4J0yeiJXiVZ4EtdKacqmw18Xr
	XEuNulD3PxGSA/4crSwRPnt54OiIh4gQLz4qI3PZXJ70uSWh0FjhMrCxOG29/EQY66C/3F/Dc01
	M+KIifLguTod7+PY1KfLDWIunvB2eOXbQsdiz0UwZIfMKFW4lnNUwsoYyiONxVR7xblHHTwJfxZ
	7BhqtQT+xSVDJC9+PgM6R3OqkN7StAAfOvfSDHKlrLqCfz5jAua+7FLgqQSYe03UR+yWEtwtKSG
	M192dOhBWX0i911fTEMANbHQIY=
X-Received: by 2002:a05:6a00:340c:b0:82c:6b46:271d with SMTP id d2e1a72fcca58-83f33d0a2e5mr2772793b3a.48.1778823765596;
        Thu, 14 May 2026 22:42:45 -0700 (PDT)
Received: from harrison-Surface-Pro-12in-1st-Ed-with-Snapdragon.wework.com ([203.117.161.34])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-83f2b9bec8fsm3106116b3a.33.2026.05.14.22.42.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 May 2026 22:42:45 -0700 (PDT)
From: Harrison Vanderbyl <harrison.vanderbyl@gmail.com>
To: andersson@kernel.org,
	konradybcio@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	Herbert Xu <herbert@gondor.apana.org.au>,
	davem@davemloft.net,
	neil.armstrong@linaro.org,
	maarten.lankhorst@linux.intel.com,
	mripard@kernel.org,
	tzimmermann@suse.de,
	airlied@gmail.com,
	simona@ffwll.ch,
	jikos@kernel.org,
	bentiss@kernel.org,
	luzmaximilian@gmail.com,
	hansg@kernel.org,
	ilpo.jarvinen@linux.intel.com
Cc: Douglas Anderson <dianders@chromium.org>,
	Jessica Zhang <jesszhan0024@gmail.com>,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-crypto@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	linux-input@vger.kernel.org,
	platform-driver-x86@vger.kernel.org
Subject: [PATCH v2 3/7] platform/surface: SAM: Add support for Surface Pro 12in
Date: Fri, 15 May 2026 15:41:48 +1000
Message-ID: <ab458aadea651396d9ea7629419a32dc7510c593.1778822464.git.harrison.vanderbyl@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <cover.1778822464.git.harrison.vanderbyl@gmail.com>
References: <cover.1778822464.git.harrison.vanderbyl@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 42A80549AE9
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[27];
	FREEMAIL_FROM(0.00)[gmail.com];
	TAGGED_FROM(0.00)[bounces-107713-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[chromium.org,gmail.com,vger.kernel.org,lists.freedesktop.org];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[kernel.org,gondor.apana.org.au,davemloft.net,linaro.org,linux.intel.com,suse.de,gmail.com,ffwll.ch];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	FROM_NEQ_ENVFROM(0.00)[harrisonvanderbyl@gmail.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Action: no action

Add a SAM client device node group and registry entry for the
Microsoft Surface Pro, 12-inch with Snapdragon.

This set enables the use of the following devices.
1: cover keyboard
2: cover touchpad
3: pen stash events.

The battery info and charger info devices have been
purposefully omitted as they are also reported by
other drivers and cause conflicts.

Signed-off-by: Harrison Vanderbyl <harrison.vanderbyl@gmail.com>
---
 .../surface/surface_aggregator_registry.c         | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/drivers/platform/surface/surface_aggregator_registry.c b/drivers/platform/surface/surface_aggregator_registry.c
index 0599d5adf02e..884049961415 100644
--- a/drivers/platform/surface/surface_aggregator_registry.c
+++ b/drivers/platform/surface/surface_aggregator_registry.c
@@ -422,6 +422,19 @@ static const struct software_node *ssam_node_group_sp11[] = {
 	NULL,
 };
 
+/* Devices for Surface Pro 12" first edition (ARM/QCOM) */
+static const struct software_node *ssam_node_group_sp12in[] = {
+	&ssam_node_root,
+	&ssam_node_hub_kip,
+	&ssam_node_tmp_sensors,
+	&ssam_node_hid_kip_keyboard,
+	&ssam_node_hid_sam_penstash,
+	&ssam_node_hid_kip_touchpad,
+	&ssam_node_hid_kip_fwupd,
+	&ssam_node_pos_tablet_switch,
+	NULL,
+};
+
 /* -- SSAM platform/meta-hub driver. ---------------------------------------- */
 
 static const struct acpi_device_id ssam_platform_hub_acpi_match[] = {
@@ -500,6 +513,8 @@ static const struct of_device_id ssam_platform_hub_of_match[] __maybe_unused = {
 	{ .compatible = "microsoft,arcata", (void *)ssam_node_group_sp9_5g },
 	/* Surface Pro 11 (ARM/QCOM) */
 	{ .compatible = "microsoft,denali", (void *)ssam_node_group_sp11 },
+	/* Surface Pro 12in First Edition (ARM/QCOM) */
+	{ .compatible = "microsoft,surface-pro-12in", (void *)ssam_node_group_sp12in },
 	/* Surface Laptop 7 */
 	{ .compatible = "microsoft,romulus13", (void *)ssam_node_group_sl7 },
 	{ .compatible = "microsoft,romulus15", (void *)ssam_node_group_sl7 },
-- 
2.53.0


