Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 23DFA5B7C5B
	for <lists+linux-arm-msm@lfdr.de>; Tue, 13 Sep 2022 22:56:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229608AbiIMUz7 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 13 Sep 2022 16:55:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40214 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229601AbiIMUz4 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 13 Sep 2022 16:55:56 -0400
Received: from mail-vk1-xa4a.google.com (mail-vk1-xa4a.google.com [IPv6:2607:f8b0:4864:20::a4a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B769D5FF74
        for <linux-arm-msm@vger.kernel.org>; Tue, 13 Sep 2022 13:55:55 -0700 (PDT)
Received: by mail-vk1-xa4a.google.com with SMTP id h194-20020a1f9ecb000000b003a29cd56380so615159vke.15
        for <linux-arm-msm@vger.kernel.org>; Tue, 13 Sep 2022 13:55:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date;
        bh=u98YH0jx3OdeW4UquaiRdtASz50xZgF9GmW5yVmKS+A=;
        b=MPz2hm1dNp3wtK0Q6VOZj4HijDeEPDlqtG4P+GnwI1ScUXpTtAiMFQURP2+l0rCUxA
         qmrDRKPBY9MbWm16lKVZvzyIUdJdDUkzzrXDRzHRTJ6GX/yvA5wXbbFrPXBsVfmK5Eo4
         9ogkCukA16YVJLYlQyC6GDCLXZsEW5Jth3oYNbG/63WjVVZ1gvealfQW8jCDjky728Oe
         PBJlPLftoNRA5YfGbbYdkSf/WXE0SzNerEGMYnvyd8sR0THOr0GsvrAeMrBEU6VKtlok
         /9MFSeRwtKp+B3qVEYRyAMqDCg2EYB4UlKeFmcJPYJLNDLU7NZi7lqkjGWIHLveewJpg
         hb0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date;
        bh=u98YH0jx3OdeW4UquaiRdtASz50xZgF9GmW5yVmKS+A=;
        b=nNKiLVnCsPp+WKbQvL7WRlYubXuORpMvlIbqGf0E4eZctZjLZlvqhmYDvuk7hDaSf2
         brYXVTeyIy9BoQklATWYgQF2IybNAAI4p+LWV1sXZDn3Hgt33xL4H/OQwTUpvmmpRJQh
         lF/Mxuc6DrOIvNP7i7IB9rW0xgRhdxyqPAmTTLx/h+dEAkHzjDfV0yOZQzl+kCFgkL+l
         BDxPvoosXkwQ0dsCXxONkWIs/LFnPk6dcVSQ1ZJNeEd3W9fUbq2pL6I7druU46mz2zhv
         5Lp1fCCt0dzLRC2HL5TI2rI+VYE4HHHYJqzbMFBEai9QGVG2eSmoff5UikKqs6kQzsr0
         GuIw==
X-Gm-Message-State: ACgBeo2qrbLvYSXWpBaapw0Vz8PyCGRq9oNEswW5m0VwlirgQhEMrKIY
        xUADaFxfxNvAc6K2tdVvkwUDwIqESg==
X-Google-Smtp-Source: AA6agR5NeheBAt2f63oLFPCmdLpznilELhZXE8PxzUyHeV2qLgMAkY7E8Tau4uJxbQ4Q64hU2nMVSO1q4Q==
X-Received: from nhuck.c.googlers.com ([fda3:e722:ac3:cc00:14:4d90:c0a8:39cc])
 (user=nhuck job=sendgmr) by 2002:a1f:2548:0:b0:3a2:5fbb:6485 with SMTP id
 l69-20020a1f2548000000b003a25fbb6485mr3366058vkl.18.1663102554926; Tue, 13
 Sep 2022 13:55:54 -0700 (PDT)
Date:   Tue, 13 Sep 2022 13:55:48 -0700
Mime-Version: 1.0
X-Mailer: git-send-email 2.37.2.789.g6183377224-goog
Message-ID: <20220913205551.155128-1-nhuck@google.com>
Subject: [PATCH] drm/msm: Fix return type of mdp4_lvds_connector_mode_valid
From:   Nathan Huckleberry <nhuck@google.com>
Cc:     Nathan Huckleberry <nhuck@google.com>,
        Dan Carpenter <error27@gmail.com>, llvm@lists.linux.dev,
        Rob Clark <robdclark@gmail.com>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Sean Paul <sean@poorly.run>, David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Nathan Chancellor <nathan@kernel.org>,
        Nick Desaulniers <ndesaulniers@google.com>,
        Tom Rix <trix@redhat.com>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-8.6 required=5.0 tests=BAYES_00,DKIMWL_WL_MED,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,MISSING_HEADERS,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,
        USER_IN_DEF_DKIM_WL autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
To:     unlisted-recipients:; (no To-header on input)
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The mode_valid field in drm_connector_helper_funcs is expected to be of
type:
enum drm_mode_status (* mode_valid) (struct drm_connector *connector,
                                     struct drm_display_mode *mode);

The mismatched return type breaks forward edge kCFI since the underlying
function definition does not match the function hook definition.

The return type of mdp4_lvds_connector_mode_valid should be changed from
int to enum drm_mode_status.

Reported-by: Dan Carpenter <error27@gmail.com>
Link: https://github.com/ClangBuiltLinux/linux/issues/1703
Cc: llvm@lists.linux.dev
Signed-off-by: Nathan Huckleberry <nhuck@google.com>
---
 drivers/gpu/drm/msm/disp/mdp4/mdp4_lvds_connector.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/mdp4/mdp4_lvds_connector.c b/drivers/gpu/drm/msm/disp/mdp4/mdp4_lvds_connector.c
index 7288041dd86a..7444b75c4215 100644
--- a/drivers/gpu/drm/msm/disp/mdp4/mdp4_lvds_connector.c
+++ b/drivers/gpu/drm/msm/disp/mdp4/mdp4_lvds_connector.c
@@ -56,8 +56,9 @@ static int mdp4_lvds_connector_get_modes(struct drm_connector *connector)
 	return ret;
 }
 
-static int mdp4_lvds_connector_mode_valid(struct drm_connector *connector,
-				 struct drm_display_mode *mode)
+static enum drm_mode_status
+mdp4_lvds_connector_mode_valid(struct drm_connector *connector,
+			       struct drm_display_mode *mode)
 {
 	struct mdp4_lvds_connector *mdp4_lvds_connector =
 			to_mdp4_lvds_connector(connector);
-- 
2.37.2.789.g6183377224-goog

