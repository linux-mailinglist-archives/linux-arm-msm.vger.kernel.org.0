Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CC9286A6A04
	for <lists+linux-arm-msm@lfdr.de>; Wed,  1 Mar 2023 10:47:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229746AbjCAJrl (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 1 Mar 2023 04:47:41 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60892 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229744AbjCAJrk (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 1 Mar 2023 04:47:40 -0500
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com [IPv6:2a00:1450:4864:20::433])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C1BEF3A84D
        for <linux-arm-msm@vger.kernel.org>; Wed,  1 Mar 2023 01:47:38 -0800 (PST)
Received: by mail-wr1-x433.google.com with SMTP id bw19so12522677wrb.13
        for <linux-arm-msm@vger.kernel.org>; Wed, 01 Mar 2023 01:47:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1677664057;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=K1pni8PEkrIGMBG+jXk+bVH6dacln+AXocrU2+hsam8=;
        b=LaJ7npUADITLVfxDj5CjFSESLEac57tU7PrtsB3MDvLyeucQh/8rn4py00CGBOX7Xq
         SI4zCnIpSoOo1D2X0Pmq0nxxf/IEJkIhbB1yULFW78IVzDypBR1iLHPsPNRwtgaMltIH
         3ccxW2i98kJRQMqHIXdGpU4pOUiISZ0W/Oy/DeGLOl5VMFJ4iGgqBsMrmwX588z1c2Ur
         mWH1HBZlav6W+/pIcqZAks0Swjw4azkcFQiAE5lSeAioYadhNEwd6y4HNAVkqqpb0Piy
         2OkSoBbeBtGtU5B0/3tLJPITkeivD7lDgbVpDBbcLwTpgtMfi6Y4rQxq2bXAVEihhpMQ
         AuOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1677664057;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=K1pni8PEkrIGMBG+jXk+bVH6dacln+AXocrU2+hsam8=;
        b=i2B+iXxIf9Rm40HEoE7uL1BJuAQ3fQcAhg1C+6+DFxiMYWiUIKdeGYn5OUgydMVzX/
         8d8DlNz+A9dPI21XHAZSaCD4krBhthaFdlE41B4ZI1xeAmJ9a9wACNW2H0SzdmMjEYFx
         vDFhVgAmAeCBMliep60xtxm24GflB7ZVpHteY0osIYtu6A5tqnI33TuK6xdkfHgeMN5m
         6D/YiAF16XXkXxQniiJ6OKG8zRHvpR3rhrcIZOSU+UfW9MRu8+1RXAmIw+n9eb+S89CG
         caQoH8+WvaVIxiqviiBH0kb0CELQsb4MN9nLEXkkdnCCoZnv+/b/tfLm685cAbNr3lg0
         feLw==
X-Gm-Message-State: AO0yUKVgcyakSaKD1k9MOzmCmPOlR/4QT/p+nYtauBxnM2kEQdshXWx6
        FFiEJjfQY7yWaXO8TNWQlSRrIw==
X-Google-Smtp-Source: AK7set+L+5GW0GgI9KztlmCUknRctTJccLaZrCPTKnfWNMHzWH7YoENj8bpyyBGhW0pO//0mMQZeBw==
X-Received: by 2002:a5d:6a85:0:b0:2c9:6b87:962d with SMTP id s5-20020a5d6a85000000b002c96b87962dmr4265353wru.15.1677664057170;
        Wed, 01 Mar 2023 01:47:37 -0800 (PST)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:52eb:f6ff:feb3:451a])
        by smtp.gmail.com with ESMTPSA id a10-20020adfe5ca000000b002c3dc4131f5sm11880701wrn.18.2023.03.01.01.47.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Mar 2023 01:47:36 -0800 (PST)
From:   Neil Armstrong <neil.armstrong@linaro.org>
Date:   Wed, 01 Mar 2023 10:47:35 +0100
Subject: [PATCH v2] MAINTAINERS: Add myself as maintainer for DRM Panels
 drivers
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230216-topic-drm-panel-upstream-maintainance-v2-1-ffd262b72f16@linaro.org>
X-B4-Tracking: v=1; b=H4sIADYf/2MC/5WOQQ6CMBREr2K69htaFdGV9zAsSvuBJqVtfgvRE
 O7ulxu4mMWbSWZmFRnJYRaPwyoIF5ddDAzqeBBm1GFAcJZZqEqdKyVrKDE5A5YmSDqghznlQqg
 nmLQLhaWDQajt1WhUjZXNRXBXpzNCR5yN3BZm79lMhL177+Ovlnl0uUT67F8W+XP/nV0kSNAoT
 X9XdaPk7ek5oXiKNIh227YvdFLT0fAAAAA=
To:     Thierry Reding <thierry.reding@gmail.com>,
        Sam Ravnborg <sam@ravnborg.org>
Cc:     Daniel Vetter <daniel@ffwll.ch>, dri-devel@lists.freedesktop.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Jagan Teki <jagan@amarulasolutions.com>,
        Neil Armstrong <neil.armstrong@linaro.org>
X-Mailer: b4 0.12.0
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add myself as co-maintainer for DRM Panel Drivers in order to help
reviewing and getting new panels drivers merged, and Remove Thierry
as he suggested since he wasn't active for a while.

Thanks Thierry for all your work!

Acked-by: Jagan Teki <jagan@amarulasolutions.com>
Acked-by: Sam Ravnborg <sam@ravnborg.org>
Acked-by: Thierry Reding <thierry.reding@gmail.com>
Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
Changes in v2:
- Added Acked-by from Sam, Thierry and Jagan
- Removed Thierry from maintainers list as he suggested, updated commit accordingly
- Link to v1: https://lore.kernel.org/r/20230216-topic-drm-panel-upstream-maintainance-v1-1-ae1cf9268217@linaro.org
---
 MAINTAINERS | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index be167c695c64..f8e1b80bf41f 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -7042,7 +7042,7 @@ F:	Documentation/devicetree/bindings/display/xlnx/
 F:	drivers/gpu/drm/xlnx/
 
 DRM PANEL DRIVERS
-M:	Thierry Reding <thierry.reding@gmail.com>
+M:	Neil Armstrong <neil.armstrong@linaro.org>
 R:	Sam Ravnborg <sam@ravnborg.org>
 L:	dri-devel@lists.freedesktop.org
 S:	Maintained

---
base-commit: 9d9019bcea1aac7eed64a1a4966282b6b7b141c8
change-id: 20230216-topic-drm-panel-upstream-maintainance-6d5cae28d184

Best regards,
-- 
Neil Armstrong <neil.armstrong@linaro.org>

