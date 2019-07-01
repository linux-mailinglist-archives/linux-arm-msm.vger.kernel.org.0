Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 36C465C21D
	for <lists+linux-arm-msm@lfdr.de>; Mon,  1 Jul 2019 19:39:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728714AbfGARjK (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 1 Jul 2019 13:39:10 -0400
Received: from mail-pl1-f194.google.com ([209.85.214.194]:44144 "EHLO
        mail-pl1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728550AbfGARjK (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 1 Jul 2019 13:39:10 -0400
Received: by mail-pl1-f194.google.com with SMTP id t7so7700001plr.11;
        Mon, 01 Jul 2019 10:39:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id;
        bh=DQhkAGsy/6JPfkNxr2zd1jyzBxMaKFsuRKGwZutl7JA=;
        b=vMWOV/3HGgdAF44jQmXJfaAWcFy7psRn6BhV081TbnqYfVHuWi7qeLTNGWMWGbBnNj
         ihG+iWJVihKUZUp/Njk1DMAR/86Gbx6123S+32Qmd/xMqBNn4TDFHwHHiz/VzVJhfP0m
         jze3vu1Jr9qht/LfQKtEz7pny3bb0ieCY7cmfTFxMQpxgJe0iC1BaGv6OE9a02LDABlS
         zQWGTJJNIx0qXNLVOM5AwKg/hRwbD8FDxCoqb76qeha/aK/e9L5HNkqHPsiNjfvNNSiS
         Y4DWjvViqOvQyJvQo/Wp2uMmH/FcgEurUloeS2OHUDKPItEDb1kt2VPdnoB8i7WXCdwl
         eqIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=DQhkAGsy/6JPfkNxr2zd1jyzBxMaKFsuRKGwZutl7JA=;
        b=GPaNa/VxUBEQa9qILcxNwdS3c60E6tzSsL93vwxVpLl3k0jqp9G2glcXROwo3X8HH0
         yILmRt/OZpDZzb7Pi/n+g5yACQ52piKmlZC23MOS+mIZ4H5xid/QPbxkl9xOx7Y6/WIT
         cGrSRIXKHdzAcsG7h1f2qC1BPvFDqRkv1b+DCO6Z6Emi6ZdAtQ8Dlr1Dfws4zAyOdPzU
         FR0SKrzqtHICs1A2XVshROjG1sjTBpUMumRxiqxIvQ74sOM3ugeGbJClSz1bgh6XKd2o
         E7xMChqjCLGIvPPtTMZrAfrrMNcuXSBLwWIXGWgLU1pUy9OBm9tTwIjuzGvCJgz04GtU
         NsEw==
X-Gm-Message-State: APjAAAVnxyz0Pl25KQImwDs/4Ur82Y7KwcsNkTBD61Xdpg5FP3lOfGxu
        ttniiRq3XHQnhDlHORwxORo=
X-Google-Smtp-Source: APXvYqwRhIXWsH30plxtznqtrwdmPDUuYj3MEWHr4h3Gg5fNdDluDo1HsfjxDICGKCzzl3XaEDGNjQ==
X-Received: by 2002:a17:902:6b0c:: with SMTP id o12mr29372672plk.113.1562002750002;
        Mon, 01 Jul 2019 10:39:10 -0700 (PDT)
Received: from aw-bldr-10.qualcomm.com (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id j21sm11847091pfh.86.2019.07.01.10.39.08
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 01 Jul 2019 10:39:09 -0700 (PDT)
From:   Jeffrey Hugo <jeffrey.l.hugo@gmail.com>
To:     robdclark@gmail.com, sean@poorly.run, airlied@linux.ie,
        daniel@ffwll.ch
Cc:     bjorn.andersson@linaro.org, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-kernel@vger.kernel.org,
        Jeffrey Hugo <jeffrey.l.hugo@gmail.com>
Subject: [PATCH] drm/msm/mdp5: Use drm_device for creating gem address space
Date:   Mon,  1 Jul 2019 10:39:07 -0700
Message-Id: <20190701173907.15494-1-jeffrey.l.hugo@gmail.com>
X-Mailer: git-send-email 2.17.1
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Creating the msm gem address space requires a reference to the dev where
the iommu is located.  The driver currently assumes this is the same as
the platform device, which breaks when the iommu is outside of the
platform device.  Use the drm_device instead, which happens to always have
a reference to the proper device.

Signed-off-by: Jeffrey Hugo <jeffrey.l.hugo@gmail.com>
---
 drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c b/drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c
index 4a60f5fca6b0..1347a5223918 100644
--- a/drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c
+++ b/drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c
@@ -702,7 +702,7 @@ struct msm_kms *mdp5_kms_init(struct drm_device *dev)
 	mdelay(16);
 
 	if (config->platform.iommu) {
-		aspace = msm_gem_address_space_create(&pdev->dev,
+		aspace = msm_gem_address_space_create(dev->dev,
 				config->platform.iommu, "mdp5");
 		if (IS_ERR(aspace)) {
 			ret = PTR_ERR(aspace);
-- 
2.17.1

