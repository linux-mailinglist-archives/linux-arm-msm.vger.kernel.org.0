Return-Path: <linux-arm-msm+bounces-38409-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E3A89D3314
	for <lists+linux-arm-msm@lfdr.de>; Wed, 20 Nov 2024 06:05:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id D26D1B248DF
	for <lists+linux-arm-msm@lfdr.de>; Wed, 20 Nov 2024 05:05:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 108EE14D70B;
	Wed, 20 Nov 2024 05:04:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Fqogr6nv"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pg1-f169.google.com (mail-pg1-f169.google.com [209.85.215.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4280879CD;
	Wed, 20 Nov 2024 05:04:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732079099; cv=none; b=i8j1n+o2TMYmkRzA6rOnRobtQq6+a7gUr/tqJzpyEvabbCJ/yTUaPMG6f5CY/mY9xuhglEtXRXWa9/Pn5Jn8BcykZb8R2dbJe2SNLjd7q+Em82DSN4eeXL1jA7JSVsvT0QoulA4rgRtS/6qhPyHlsGVyj3F9QiZbACKPll8MM5c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732079099; c=relaxed/simple;
	bh=vwdLdlZBdR2XgCTkCGvmFTzN+2BPVNW04Yb54bofmFY=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=hX07gPRdTPiiqQgnoZaIXL7ZKNfQ2jbGe+oKU70oEolrANazV39KEeWT9gEztEB5uAqA7kWbAAazav6GFICrPV3436k/Pd13WguLG3O0B5AIGNLqfzu7T6EzvJp+KIljjUI07RpfSxopZMbGTVB915OwahuD6nldKJsc9lcLPyA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Fqogr6nv; arc=none smtp.client-ip=209.85.215.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pg1-f169.google.com with SMTP id 41be03b00d2f7-7ee020ec76dso1358995a12.3;
        Tue, 19 Nov 2024 21:04:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1732079096; x=1732683896; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=iDzqRQmbV2PA+ACm5mYhCZYmsznh/BcrPcsNX+5Rzd4=;
        b=Fqogr6nvANL4kA/rUmjAAH2BB3qUFAUEk6UpvSD5q96kDZjpMak4haTS9AHADtPTai
         g9eJMGGFIb7txguNbkoSGWuGF46/8dj5VqoS+FadaXPeEkFHqGfZ35OxeVaZa5d+G6Cn
         QS2g252ZxPcJqAjeC8BHEgoezoBnOGwgBwfcQbeYI88/UF6UaiaRrdz+6fZH9JUN5JYh
         dxge47q5AZ2oHGDBTxbTEGXN9+245CmjAzkDGHlkJHQGushgD7KxQREXtM4MSDRsW29k
         w6RzbikFMniz1vjfiiwDABCzrIotB5IIK6vHUrtQEUX7aQVdj8gfkkmlfD1tJ/XopIpg
         UErQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732079096; x=1732683896;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=iDzqRQmbV2PA+ACm5mYhCZYmsznh/BcrPcsNX+5Rzd4=;
        b=aAb/wrLHmRd0a0Aem7scfEmAaLpuEosoFinA6UTxFT8SZ0toFchMQfEDvXJMYwGnyG
         RuLzIZjaq7TPaMmer8DLOSJdBYoeCT+iWZP71lTvNxFAqJpH4O/TDYZQNKrylnpG9sc1
         M6OeX+yVCxZ8QQQh4afHTL9+agJ9K/XtCDB3CVc+4z+qUCcEzm19bpua/me17zRAXlpZ
         r+ubxhkNbmKxM/0bOJTJQjeff8VDD1RWzTiuaUXdpRcqeP+CFEL3zY4IUwgZPHoR96Sk
         5wjYcd60tX3N7nSvdRyFJjcxI/mB5+oljshwwVySNye6xmiA3JicnOV8huRrCmZJX8lc
         0Fhg==
X-Forwarded-Encrypted: i=1; AJvYcCWvEkyqFMWDQbGlfbMTDyzSwqCYNhooiOmXuVynrSr/eDbE/7Aqzy8Y8FJR7cO1QJY7eGfLxEJeHKHrXZsd@vger.kernel.org, AJvYcCXYCndcnWlv9KKHAWGg0l/WUoVVhMHZ4SLlxnZyeLbm7oNRg27hAxqcnt2QvKcH3BZVsnoTz/HgrLGhWJD0@vger.kernel.org
X-Gm-Message-State: AOJu0Ywt7Yim056PVAGEGu2fKpCyONMOVuLiT/oaJDNfyc1/IqkS3wFn
	wvuaM0xKn+FnQKxGrg7vuQRH3G6y/6Unc9vq7V/BP2gXk3ur0q4B
X-Google-Smtp-Source: AGHT+IGXHKrgOAEXK8lTj10qUqfAMieZLXkbaFv8HzsFgHnzL3kEMyr/0wjhIgmVWuNZ4D1J6pHREg==
X-Received: by 2002:a05:6a21:6d92:b0:1db:f642:8d8b with SMTP id adf61e73a8af0-1ddb09139d4mr2281960637.45.1732079096328;
        Tue, 19 Nov 2024 21:04:56 -0800 (PST)
Received: from HOME-PC ([223.185.132.211])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-724befa6f7fsm623414b3a.134.2024.11.19.21.04.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Nov 2024 21:04:56 -0800 (PST)
From: Dheeraj Reddy Jonnalagadda <dheeraj.linuxdev@gmail.com>
To: robdclark@gmail.com,
	quic_abhinavk@quicinc.com,
	dmitry.baryshkov@linaro.org,
	linux-arm-msm@vger.kernel.org
Cc: sean@poorly.run,
	marijn.suijten@somainline.org,
	airlied@gmail.com,
	simona@ffwll.ch,
	quic_bjorande@quicinc.com,
	quic_parellan@quicinc.com,
	quic_khsieh@quicinc.com,
	dri-devel@lists.freedesktop.org,
	freedreno@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	dianders@chromium.org,
	Dheeraj Reddy Jonnalagadda <dheeraj.linuxdev@gmail.com>
Subject: [PATCH drm-next] drm/msm/dp: Fix potential division by zero issue
Date: Wed, 20 Nov 2024 10:34:51 +0530
Message-Id: <20241120050451.100957-1-dheeraj.linuxdev@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The variable pixel_div can remain zero due to an invalid rate input,
leading to a potential division by zero issue. This patch fixes it and
the function now logs an error and returns early.

Additionally, this patch resolves trailing whitespace issues detected
by checkpatch.pl in the same file.

Signed-off-by: Dheeraj Reddy Jonnalagadda <dheeraj.linuxdev@gmail.com>
---
 drivers/gpu/drm/msm/dp/dp_catalog.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/msm/dp/dp_catalog.c b/drivers/gpu/drm/msm/dp/dp_catalog.c
index b4c8856fb25d..e170f70f1d42 100644
--- a/drivers/gpu/drm/msm/dp/dp_catalog.c
+++ b/drivers/gpu/drm/msm/dp/dp_catalog.c
@@ -225,7 +225,7 @@ int msm_dp_catalog_aux_clear_hw_interrupts(struct msm_dp_catalog *msm_dp_catalog
  * This function reset AUX controller
  *
  * NOTE: reset AUX controller will also clear any pending HPD related interrupts
- * 
+ *
  */
 void msm_dp_catalog_aux_reset(struct msm_dp_catalog *msm_dp_catalog)
 {
@@ -487,8 +487,10 @@ void msm_dp_catalog_ctrl_config_msa(struct msm_dp_catalog *msm_dp_catalog,
 		pixel_div = 2;
 	else if (rate == link_rate_hbr2)
 		pixel_div = 4;
-	else
+	else {
 		DRM_ERROR("Invalid pixel mux divider\n");
+		return;
+	}
 
 	dispcc_input_rate = (rate * 10) / pixel_div;
 
@@ -579,7 +581,7 @@ u32 msm_dp_catalog_hw_revision(const struct msm_dp_catalog *msm_dp_catalog)
  * This function reset the DP controller
  *
  * NOTE: reset DP controller will also clear any pending HPD related interrupts
- * 
+ *
  */
 void msm_dp_catalog_ctrl_reset(struct msm_dp_catalog *msm_dp_catalog)
 {
-- 
2.34.1


