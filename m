Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 46EC37659FC
	for <lists+linux-arm-msm@lfdr.de>; Thu, 27 Jul 2023 19:19:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232640AbjG0RTO (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 27 Jul 2023 13:19:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51136 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232810AbjG0RTA (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 27 Jul 2023 13:19:00 -0400
Received: from mail-pf1-x42e.google.com (mail-pf1-x42e.google.com [IPv6:2607:f8b0:4864:20::42e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D19013594
        for <linux-arm-msm@vger.kernel.org>; Thu, 27 Jul 2023 10:18:42 -0700 (PDT)
Received: by mail-pf1-x42e.google.com with SMTP id d2e1a72fcca58-686b9964ae2so923045b3a.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 27 Jul 2023 10:18:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1690478322; x=1691083122;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZukR9CSekCYtKTsN6DxagPJbUeR97eyTc3MZVOC6Wus=;
        b=LehozSB0PkZqslyfeU+81VdLb4xGnBIE9Q91g2SB5mCOztpPoV+jzWyeJ3K7cQ3TXL
         2NeRYQzg+J1oJlSjDSDkbLzzQnsFrlOGlm3rILR8Ze2X14LBOa3eZxq0zu4F64wbkVFX
         yH2Xb4Cezq3WnmRWxZ9n0P2ESlXBy8TiW2D0w=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690478322; x=1691083122;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZukR9CSekCYtKTsN6DxagPJbUeR97eyTc3MZVOC6Wus=;
        b=Xtno9Pd8lBlg38x3WG7iVvrCMDi2/TUc8i+emSDJrds6L+2m3OLXg2TEbaeF4w5nmn
         cHyjA4cjYeD3/yo/p25c9eE7UQWv2OXOKdUHndpQis00VHpFurWzEy0N0hVxfF7+/UME
         27LywDso7RpqQGhlAtf1F/3fODG4ounAQKKkdIt3bqgkx5a3J/nn6GqOmCIKMrm6RHm7
         mWPQSkpyVUle1EHody2Rg2NhbLsryPAkHaTZmCozhipCkvVPJTPuu/FczcrAsA6v4GJj
         ydzNHhVBoowbYV0GuN7fU/RQQKX2GZ8T20OF0SBD+3uxrpZubbcnbY4aeizhBcqTsxqL
         MFtA==
X-Gm-Message-State: ABy/qLYm3nbw/9H5lvWaWZ8Nl15PMmgFSZb1BMc+GUWqx4ZW7VuDsEKn
        GfGNW9AbjC7fJubchPYF1Ad9pQ==
X-Google-Smtp-Source: APBJJlFU5IsivI5lKrmtYzK327WL6rQ+XVbv/LZPTH5t4heMSRWyV0pSqGzifMaP7GSZQORTiy8paw==
X-Received: by 2002:a05:6a20:1442:b0:134:6aff:ee6c with SMTP id a2-20020a056a20144200b001346affee6cmr6130826pzi.41.1690478322382;
        Thu, 27 Jul 2023 10:18:42 -0700 (PDT)
Received: from tictac2.mtv.corp.google.com ([2620:15c:9d:2:2339:954b:b98f:611a])
        by smtp.gmail.com with ESMTPSA id 17-20020aa79111000000b0064f76992905sm1702524pfh.202.2023.07.27.10.18.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Jul 2023 10:18:41 -0700 (PDT)
From:   Douglas Anderson <dianders@chromium.org>
To:     Jiri Kosina <jikos@kernel.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Frank Rowand <frowand.list@gmail.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Sam Ravnborg <sam@ravnborg.org>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>
Cc:     linux-arm-msm@vger.kernel.org,
        yangcong5@huaqin.corp-partner.google.com,
        devicetree@vger.kernel.org, Daniel Vetter <daniel@ffwll.ch>,
        hsinyi@google.com, Chris Morgan <macroalpha82@gmail.com>,
        linux-input@vger.kernel.org, cros-qcom-dts-watchers@chromium.org,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
        Douglas Anderson <dianders@chromium.org>
Subject: [PATCH v4 05/11] HID: i2c-hid: Switch to SYSTEM_SLEEP_PM_OPS()
Date:   Thu, 27 Jul 2023 10:16:32 -0700
Message-ID: <20230727101636.v4.5.Ib2a2865bd3c0b068432259dfc7d76cebcbb512be@changeid>
X-Mailer: git-send-email 2.41.0.487.g6d72f3e995-goog
In-Reply-To: <20230727171750.633410-1-dianders@chromium.org>
References: <20230727171750.633410-1-dianders@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The SYSTEM_SLEEP_PM_OPS() allows us to get rid of '#ifdef
CONFIG_PM_SLEEP', as talked about in commit 1a3c7bb08826 ("PM: core:
Add new *_PM_OPS macros, deprecate old ones").

This change is expected to have no functional effect.

Reviewed-by: Maxime Ripard <mripard@kernel.org>
Signed-off-by: Douglas Anderson <dianders@chromium.org>
---

(no changes since v1)

 drivers/hid/i2c-hid/i2c-hid-core.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/hid/i2c-hid/i2c-hid-core.c b/drivers/hid/i2c-hid/i2c-hid-core.c
index efbba0465eef..19d985c20a5c 100644
--- a/drivers/hid/i2c-hid/i2c-hid-core.c
+++ b/drivers/hid/i2c-hid/i2c-hid-core.c
@@ -1085,7 +1085,6 @@ void i2c_hid_core_shutdown(struct i2c_client *client)
 }
 EXPORT_SYMBOL_GPL(i2c_hid_core_shutdown);
 
-#ifdef CONFIG_PM_SLEEP
 static int i2c_hid_core_suspend(struct device *dev)
 {
 	struct i2c_client *client = to_i2c_client(dev);
@@ -1138,10 +1137,9 @@ static int i2c_hid_core_resume(struct device *dev)
 
 	return hid_driver_reset_resume(hid);
 }
-#endif
 
 const struct dev_pm_ops i2c_hid_core_pm = {
-	SET_SYSTEM_SLEEP_PM_OPS(i2c_hid_core_suspend, i2c_hid_core_resume)
+	SYSTEM_SLEEP_PM_OPS(i2c_hid_core_suspend, i2c_hid_core_resume)
 };
 EXPORT_SYMBOL_GPL(i2c_hid_core_pm);
 
-- 
2.41.0.487.g6d72f3e995-goog

