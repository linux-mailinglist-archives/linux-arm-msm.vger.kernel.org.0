Return-Path: <linux-arm-msm+bounces-26596-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D2A29351EB
	for <lists+linux-arm-msm@lfdr.de>; Thu, 18 Jul 2024 20:46:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 26C491F22005
	for <lists+linux-arm-msm@lfdr.de>; Thu, 18 Jul 2024 18:46:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5F7CA1465B0;
	Thu, 18 Jul 2024 18:44:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fW3B3VeT"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pg1-f179.google.com (mail-pg1-f179.google.com [209.85.215.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED7AD1459FD;
	Thu, 18 Jul 2024 18:44:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721328290; cv=none; b=H3QB2ACeG7iGrL+pM0Qrt3ixo3iXQO4/yGSnaJOezWFbi6w27EavkwFqadfRjv6lQFxTFx8+LBgrx2fsLyE3dsJWD4pKPCQa3PLQ+yy0bSjRpmoUoJR1AWhPgeiEpB+IFLtVGtxQwrARk3NurM3EzcF35mcXgTyYBJEfASD4Slc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721328290; c=relaxed/simple;
	bh=1QbLSO/S6eZspmbjJqVZ67PTyAKMuQ+HdZNoXq/GjeM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=U8KyaFAXKAku55e7KNeM4yYKASEP8Ox3H9O++1oRSGNzukGrC2rnLG8g01SO/2c10rSPcgObRiNO6fQueFsOjtzC6A/fLZJcakAMxYijrfY7nPr64I0QRIaQL5daqc5aXAvFKJ3j9yz8TCZGjZOMNMJS/H99dDQJdwK3SXnw1Oc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fW3B3VeT; arc=none smtp.client-ip=209.85.215.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pg1-f179.google.com with SMTP id 41be03b00d2f7-761e0f371f5so1875826a12.1;
        Thu, 18 Jul 2024 11:44:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1721328288; x=1721933088; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=B6bckds3F2bTrLC4vJCbEBeAAMBfQ5LDIiRkb+52rEU=;
        b=fW3B3VeTDAZSIwkQFAPGX3sgHvqXwV/usQMddZNWJV3XpCMjNwn/CD4tStn9K63pfA
         Ht6pNUYUz4+o97UpDvxpy8F/uvxG2aeskl34JaRWrVBxfBTlj5Bhtvc5INS0CeokSjde
         lPvG8L6Mw8M/nNNX8AJq2ocrZ3gX8irRpMeIJIH7IY8lF+HRtgUgQiNYWxB6OuWqK31/
         LX5Nf77j6G+KY/kAgS6+TN2JkhyqT3LIJwXlmutOWYSFKu94Lx0cF6qP+6uRX+6QTyk7
         LGLiKEpZuNZ477zGbn0Doa5zxMjAmPeOhR04NurZQkia9A8gwcqTK1pa216uI4QGnEFZ
         L4IQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721328288; x=1721933088;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=B6bckds3F2bTrLC4vJCbEBeAAMBfQ5LDIiRkb+52rEU=;
        b=ITp0VE6CkT9sn/KaTeP+DKCgLaKqiNKKJWvN4CdsBU0ZhtYpFd5hijIZLFGcYa9Flv
         YF/nZigzBMU4j10SQ9fk2Nzql7JrlfYy0owcfIvDNUbprNxxr7cDDNLYONOBUvlDvO/T
         7EB/NRg6IXGs90p4ZqWlJ9sVLnuAJ0NeXekDtz7CE6C6OOsS93omLXRtwJBm36M/6PD8
         MD7G7JOswCNT5UJI3fPmhuIeOSJNkiIn8TKjhT4WtQBPaEB50I+EB8oUeygptPQn08TZ
         SElWoTArKRJqPCusN63KDk6AozFZ906OCBT0WwCFyvmcW7mWt7Mu0YxGbBtsxwBtS+tU
         B8Kw==
X-Forwarded-Encrypted: i=1; AJvYcCUD6k+SzPLtfwN1gR3ZHX7HVaRDnnMRRrOPYh5XynB/f82vEKRFcsJZ/t4NyKJs6CtOUtfZxaiaRxn3I9EJkEl2FEYoCZ7laXZAHRlg
X-Gm-Message-State: AOJu0Yz+Y0eZE1rCcdZMnjwl1ws7DzUebHHXek1O8ot82gNamfO7xgtR
	HyYwn332azrPaNBcnro7ZQn1W4NO/Nh/sryM7aypGc6zvWonRdW6zyJqDA==
X-Google-Smtp-Source: AGHT+IE4srpDhz6qeMZ/GToHzgbSTlSbJsIqtGRkDmpfTIKTti5W19ftJm39UIGQk16XYiTODIu1+w==
X-Received: by 2002:a17:90b:a05:b0:2c9:90fa:b9f8 with SMTP id 98e67ed59e1d1-2cb7789016fmr2646138a91.10.1721328287612;
        Thu, 18 Jul 2024 11:44:47 -0700 (PDT)
Received: from localhost ([2a00:79e1:2e00:1301:3279:d3cd:5dde:c799])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2cb772c1cb4sm1090023a91.5.2024.07.18.11.44.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Jul 2024 11:44:46 -0700 (PDT)
From: Rob Clark <robdclark@gmail.com>
To: linux-arm-msm@vger.kernel.org
Cc: Doug Anderson <dianders@chromium.org>,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
	Abel Vesa <abel.vesa@linaro.org>,
	Rob Clark <robdclark@chromium.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Jessica Zhang <quic_jesszhan@quicinc.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Daniel Vetter <daniel@ffwll.ch>,
	dri-devel@lists.freedesktop.org (open list:DRM PANEL DRIVERS),
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCH 2/3] drm/panel: samsung,atna33xc20: Add compatible for ATNA45DC02
Date: Thu, 18 Jul 2024 11:44:33 -0700
Message-ID: <20240718184434.6307-2-robdclark@gmail.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240718184434.6307-1-robdclark@gmail.com>
References: <20240718184434.6307-1-robdclark@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Rob Clark <robdclark@chromium.org>

The Samsung ATNA45DC02 panel needs the same power sequencing as the
ATNA45AF01 and ATNA33XC20.

Signed-off-by: Rob Clark <robdclark@chromium.org>
---
 drivers/gpu/drm/panel/panel-samsung-atna33xc20.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/panel/panel-samsung-atna33xc20.c b/drivers/gpu/drm/panel/panel-samsung-atna33xc20.c
index fd56fd02df87..748ce8752f85 100644
--- a/drivers/gpu/drm/panel/panel-samsung-atna33xc20.c
+++ b/drivers/gpu/drm/panel/panel-samsung-atna33xc20.c
@@ -334,6 +334,7 @@ static void atana33xc20_remove(struct dp_aux_ep_device *aux_ep)
 static const struct of_device_id atana33xc20_dt_match[] = {
 	{ .compatible = "samsung,atna33xc20", },
 	{ .compatible = "samsung,atna45af01", },
+	{ .compatible = "samsung,atna45dc02", },
 	{ /* sentinal */ }
 };
 MODULE_DEVICE_TABLE(of, atana33xc20_dt_match);
-- 
2.45.2


