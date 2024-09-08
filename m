Return-Path: <linux-arm-msm+bounces-31229-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 814B6970A83
	for <lists+linux-arm-msm@lfdr.de>; Mon,  9 Sep 2024 00:41:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 0F2E01F22CB1
	for <lists+linux-arm-msm@lfdr.de>; Sun,  8 Sep 2024 22:41:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D05E417C7BB;
	Sun,  8 Sep 2024 22:40:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cnslHzvY"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E57C17B4FF;
	Sun,  8 Sep 2024 22:40:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725835259; cv=none; b=oRU6MbXaNK2JIsit9VbbfOO5hpmEf0xzpxl6tjBtZkA6nsa0EcAPrc5YA39u0RuTSlhDcAG0eiH50YcxblecHF6htbkF/rzSP0hmc3yv7HarR/1mMIV7xJtOU9Z1oBBtrEGzaXrThO+sSAFwwtEmGyl2VtzGIRIlf2bdoC+vO2E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725835259; c=relaxed/simple;
	bh=hcZiKAgo3FBKzCVElj4Xza/jyWOwWMjFKaTtDB123K4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Rw09qDQaeF17CbYKi6CuwKyYCRutx2PlZxf0zR9wz6cKgb6LrpCBVwigLZAMShgpsKHFTRxIeWYpsEcFQttdEa+F4zXezg/+NoJs1QGucHa9wyzz0w0KBuGM6r0elrp1g6rdu+ZLnDvYyXNbN9Xa43f/ggkazPaen4n7Om+FF9k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cnslHzvY; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-42ba9b47f4eso20935505e9.1;
        Sun, 08 Sep 2024 15:40:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1725835256; x=1726440056; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hPmjhdzlmLv7XWBXwHZtuCKijoRgDONoK6bLpinV7qw=;
        b=cnslHzvYsVjm2e58wQsig3Eplu8zm/T/VzLXD2J3Que47moiGYlMHfW4yAyN33p2lJ
         hUpMaXyrRDaHe+ZbwjKEJFPnKSWgqV+MxtoHUgMvZp7Wc81oXdw8Yftda+2H3PYE1GLH
         iqkmkIbdXFUl9c0MS7NWgQCc3zt5k5TCpDgDKuTcnKllGTb6iqxsPKfQRvOw+pJg0xOK
         q1d0GRgYdnDmrkId0QWw3TaWUFtAy5FUN9K4SnsZIf44mSkNE4V8Vm+qOBqmgKSPVbt6
         qTuQvGBC8V4J5rXHrLfFLBlH26WfEm5ZZ+39s4+a1j4S7J3wgiw7rZ6P11qeEqXNkQqQ
         oQVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725835256; x=1726440056;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hPmjhdzlmLv7XWBXwHZtuCKijoRgDONoK6bLpinV7qw=;
        b=nIW1n0VreFOPATLo1jElHHVimTsbLU/Sqhq3VxlhEzROjAB66+iYbVICLiA9EPB5SA
         +2E5WVsNj5VTIa63I8pxrTxM9AndOthrpCEe6eMsW7CHgKyJGVswaS9x3BeWpMoA0t/0
         stjELM+VA2hiiYPLS0Z9kbNhUPTC8ZeHFFRtBd5VdrgJ9MBstExWuP6QCRGneJIIaamh
         BFFocLWLPrWBxtYGpV1vxI7z+M0vk/I6gJ3YnE+GI+/M5/+lXxAURp8dGLWFyxaZB8Im
         O/rHgOpW7WpOfE/zX1Yv4xYWr9UJY3L57Hp/+8/Yg5oIJxDctlCB2dM6R8AdqGT43LeA
         sBNw==
X-Forwarded-Encrypted: i=1; AJvYcCUtHUpp5thGxnnH2h7yHrjqdBxcA4FZgRNqkRAKUn/t4OA29kHaiB5zQd1ciqeAFd9Mkeg4jijJnjBiy6ZbGg==@vger.kernel.org, AJvYcCVXUU+bZGN7pM1m3tQO0Vg7gwV0C4jQVu1m9tqXuC1meuF74SXazhUdX1fhGgAiFDZW92V0cdvo3Itx1yqd@vger.kernel.org, AJvYcCWyGq6/bGACpiRXOx+A+Re4Q0kYjFDLvR6Bsv8HgSk6kcHCjxCS4mL664I7sDbeLEsFZonPuKgXFl70@vger.kernel.org
X-Gm-Message-State: AOJu0YxmAbqaCMgG1iVXQj4AZFNKQWrWH5Hi5VukrVBGEOR9LxGNgTr+
	Ka59zx1pnQuMopDkwnp0sCFdb/N+W6d26edNqd9YjDcZGPE9EvA=
X-Google-Smtp-Source: AGHT+IG4DoloUS2yYvdscRNdOu3Wk54LOB6v/xrEvaRZ8ITPvM6N0lmvirwIIIzvTAizev8vwAwn5g==
X-Received: by 2002:a05:600c:3501:b0:42c:b81b:c49c with SMTP id 5b1f17b1804b1-42cb81bc6demr6044475e9.10.1725835256181;
        Sun, 08 Sep 2024 15:40:56 -0700 (PDT)
Received: from surface.home (2a01cb080508df00ca9665fffed23409.ipv6.abo.wanadoo.fr. [2a01:cb08:508:df00:ca96:65ff:fed2:3409])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-42ca0600651sm90883925e9.32.2024.09.08.15.40.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Sep 2024 15:40:55 -0700 (PDT)
From: =?UTF-8?q?J=C3=A9r=C3=B4me=20de=20Bretagne?= <jerome.debretagne@gmail.com>
To: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Johan Hovold <johan+linaro@kernel.org>,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Maximilian Luz <luzmaximilian@gmail.com>
Subject: [PATCH v2 3/5] platform/surface: aggregator_registry: Add Surface Pro 9 5G
Date: Mon,  9 Sep 2024 00:35:03 +0200
Message-ID: <20240908223505.21011-4-jerome.debretagne@gmail.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240908223505.21011-1-jerome.debretagne@gmail.com>
References: <20240908223505.21011-1-jerome.debretagne@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Add SAM client device nodes for the Surface Pro 9 5G, with the usual
battery/AC and HID nodes for keyboard and touchpad support.

Signed-off-by: Jérôme de Bretagne <jerome.debretagne@gmail.com>
---
 .../surface/surface_aggregator_registry.c       | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/drivers/platform/surface/surface_aggregator_registry.c b/drivers/platform/surface/surface_aggregator_registry.c
index 25c8aa2131d6..8b34d7e465c2 100644
--- a/drivers/platform/surface/surface_aggregator_registry.c
+++ b/drivers/platform/surface/surface_aggregator_registry.c
@@ -390,6 +390,21 @@ static const struct software_node *ssam_node_group_sp9[] = {
 	NULL,
 };
 
+/* Devices for Surface Pro 9 5G. */
+static const struct software_node *ssam_node_group_sp9_5G[] = {
+	&ssam_node_root,
+	&ssam_node_hub_kip,
+	&ssam_node_bat_ac,
+	&ssam_node_bat_main,
+	&ssam_node_tmp_sensors,
+	&ssam_node_hid_kip_keyboard,
+	&ssam_node_hid_kip_penstash,
+	&ssam_node_hid_kip_touchpad,
+	&ssam_node_hid_kip_fwupd,
+	&ssam_node_hid_sam_sensors,
+	&ssam_node_kip_tablet_switch,
+	NULL,
+};
 
 /* -- SSAM platform/meta-hub driver. ---------------------------------------- */
 
@@ -462,6 +477,8 @@ static const struct acpi_device_id ssam_platform_hub_acpi_match[] = {
 MODULE_DEVICE_TABLE(acpi, ssam_platform_hub_acpi_match);
 
 static const struct of_device_id ssam_platform_hub_of_match[] __maybe_unused = {
+	/* Surface Pro 9 5G */
+	{ .compatible = "microsoft,arcata", (void *)ssam_node_group_sp9_5G },
 	/* Surface Laptop 7 */
 	{ .compatible = "microsoft,romulus13", (void *)ssam_node_group_sl7 },
 	{ .compatible = "microsoft,romulus15", (void *)ssam_node_group_sl7 },
-- 
2.45.2


