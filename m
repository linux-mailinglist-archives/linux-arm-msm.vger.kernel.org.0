Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E4D0C10AD6
	for <lists+linux-arm-msm@lfdr.de>; Wed,  1 May 2019 18:14:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726457AbfEAQOq (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 1 May 2019 12:14:46 -0400
Received: from mail-pf1-f195.google.com ([209.85.210.195]:45895 "EHLO
        mail-pf1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726434AbfEAQOq (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 1 May 2019 12:14:46 -0400
Received: by mail-pf1-f195.google.com with SMTP id e24so8794699pfi.12;
        Wed, 01 May 2019 09:14:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id;
        bh=MtPcWFimi13xS3IBIx9BAJvwvZMDedknu7EfbmKtTWY=;
        b=FQJpgIglCJ0STefvmKylU7hCbm9/3Ti8NdGAjxmYsarjZNYLDciepWCd3aHOjfpkWl
         wmAa5L2N7Y6yFny/vBSqk7W7BI5FhkmYq0U59el4Mybcq9InW0WjBJUGeg1ogQZNkGBt
         GueH03/qpPNvi2UpJ3QBCgx6ZCBgVneWvbOPXk8sqjB3KU3POR5rOPhmSvHQC3weufdw
         kEbZf44EgL+zNX3U/5tonWDsUuEK6IWRuorC++4JOoDBUps2fxX/Hw7Tr26dJOQ3PXif
         T4JTAF72jU1r+mHcH1yvPRUzjMAqDu7MU6iq+Kpv8QgvJu3MNZinuKTzg317rIpVEbHa
         i5jA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=MtPcWFimi13xS3IBIx9BAJvwvZMDedknu7EfbmKtTWY=;
        b=AiT+RGJIme7UINYCCe24wcvJSI6cbSF2mksWBjg1gY7KS1hTX8tZyZ/AxmTXF26uli
         GdMosyXoLIYHN37erIViIBRCT9d1wMYFEYiQrXxoCEyo+z5VZqTIToQXfkVihm54M8ok
         v/Qetm/nxmiUk0Sbi+cMk9Um7voR7wMGLvFW4CTAbpP8TC+NHiB/PkVlOKdH20+jGepG
         8+ZTAMhn1wiprAY5hvIl+FYA/abfcXDSsYvCMB9dBLFi48to43jWE5VAqZhlg0WBrTa4
         lfPqwjHCmCf0VjJY/Ikxe3mbuSKepS03ajWdhBl+ok7Fu6D9Q6GVDs5uykiLZGN1EOmO
         6J7g==
X-Gm-Message-State: APjAAAUhWFPYujBwcuPs3JYY4Bs5DhXBbFAzv2jjmTpKy3Ye1I7L8/8E
        truvwsf6SpoUK1iEtKFEkUaTKSw6
X-Google-Smtp-Source: APXvYqyHYU9WI4SIoemO/0OUMF/xgVkvo4cWypdtmSh6f0UJvj0k5fgpL7UiIzxsX9urC7r36EOPMg==
X-Received: by 2002:a62:2b4e:: with SMTP id r75mr28501975pfr.131.1556727285407;
        Wed, 01 May 2019 09:14:45 -0700 (PDT)
Received: from aw-bldr-10.qualcomm.com (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id 132sm32102040pfw.87.2019.05.01.09.14.44
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 01 May 2019 09:14:44 -0700 (PDT)
From:   Jeffrey Hugo <jeffrey.l.hugo@gmail.com>
To:     robdclark@gmail.com, sean@poorly.run, airlied@linux.ie,
        daniel@ffwll.ch
Cc:     linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        Jeffrey Hugo <jeffrey.l.hugo@gmail.com>
Subject: [PATCH] drm/msm/mdp5: Fix mdp5_cfg_init error return
Date:   Wed,  1 May 2019 09:14:37 -0700
Message-Id: <20190501161437.15728-1-jeffrey.l.hugo@gmail.com>
X-Mailer: git-send-email 2.17.1
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

If mdp5_cfg_init fails because of an unknown major version, a null pointer
dereference occurs.  This is because the caller of init expects error
pointers, but init returns NULL on error.  Fix this by returning the
expected values on error.

Fixes: 2e362e1772b8 (drm/msm/mdp5: introduce mdp5_cfg module)
Signed-off-by: Jeffrey Hugo <jeffrey.l.hugo@gmail.com>
---
 drivers/gpu/drm/msm/disp/mdp5/mdp5_cfg.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/disp/mdp5/mdp5_cfg.c b/drivers/gpu/drm/msm/disp/mdp5/mdp5_cfg.c
index ea8f7d7daf7f..52e23780fce1 100644
--- a/drivers/gpu/drm/msm/disp/mdp5/mdp5_cfg.c
+++ b/drivers/gpu/drm/msm/disp/mdp5/mdp5_cfg.c
@@ -721,7 +721,7 @@ struct mdp5_cfg_handler *mdp5_cfg_init(struct mdp5_kms *mdp5_kms,
 	if (cfg_handler)
 		mdp5_cfg_destroy(cfg_handler);
 
-	return NULL;
+	return ERR_PTR(ret);
 }
 
 static struct mdp5_cfg_platform *mdp5_get_config(struct platform_device *dev)
-- 
2.17.1

