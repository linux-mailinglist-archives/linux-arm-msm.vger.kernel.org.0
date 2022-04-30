Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 27CC6515B5A
	for <lists+linux-arm-msm@lfdr.de>; Sat, 30 Apr 2022 10:11:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230511AbiD3IO2 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 30 Apr 2022 04:14:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44456 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229656AbiD3IO1 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 30 Apr 2022 04:14:27 -0400
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com [IPv6:2a00:1450:4864:20::130])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 334C04B40B
        for <linux-arm-msm@vger.kernel.org>; Sat, 30 Apr 2022 01:11:04 -0700 (PDT)
Received: by mail-lf1-x130.google.com with SMTP id p10so17599964lfa.12
        for <linux-arm-msm@vger.kernel.org>; Sat, 30 Apr 2022 01:11:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=GZFy56yledS7FbOebj4m9u5HtvT4WVnS3R3vI55qw0Y=;
        b=FxBjmuck2yLeExqEqI0/4hM+lFyQKgm6MgQgTDZJWsCgv+WQmHhWJ0+OFyZZatThnC
         h+rP1KUsEIP3jDHHSbIXYE2VChtCjoxzBCHLF96ZiAbwb4isogrggpgc/4cOGERMt4tP
         VAVxX+2h0xBMlMJR0skUcYbI9vJT0GVQs+AH/FjT8kwPsJK98ilsnIGErP185tAPnxZe
         kq7OOSujxRnthquPh14yhykmkeahil3srbXLijco0Xbqa3R2nVxSZeixvtiAgq7wb7uF
         FfXv1E5UPVq/t5GnZtmO8Tb602cXB5sXRxJVFytG7m41iFXvc5SbkI/QoXCUtfUk4iHc
         DRIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=GZFy56yledS7FbOebj4m9u5HtvT4WVnS3R3vI55qw0Y=;
        b=7fU1FuDdufMGNZTcT4AIx5JXU/EJ3DteYN/WTsWcpex48hFgppZm98Mwrj0fC1BYiV
         wScJHczyqpEeluD+0zAMpXNPLb2o9WWP5danbdwgodocaQYD5h2lUhGwfmt+RzpJsdeF
         2gkdHVJ05bF5mvyD5lgSO4/pcgLsB4urlCyhs7zrvCiJVEtDq3v7arYGL751HoVgf1St
         1xZ8Vyh8hLvAslYoKAP38RPxhXctBs36Zed9forEyl4VnmuznV7me1cgUiP5dtwMfuWb
         aHaA1g69yhDEtMfdG0Ub0CoCmy0z/+IlJ02ygMbWEh6MatPMk7sXBil/txX3ij4L9g6f
         k0Kg==
X-Gm-Message-State: AOAM531CVfSStgA87QWPnbpVCmDBolbajOpyu+MYKMRGLny0U+69/fh3
        yE7MEpdGo+IQlHDh1xwsA1if0w==
X-Google-Smtp-Source: ABdhPJxkOTCjGyk9PjuqjQDE8yMj/tC5jWYubB71G3pJVejsP4v96n7KM+iTFlb32edoQpX5qpp/oQ==
X-Received: by 2002:a05:6512:3fa1:b0:44a:f351:5a00 with SMTP id x33-20020a0565123fa100b0044af3515a00mr2335727lfa.19.1651306262449;
        Sat, 30 Apr 2022 01:11:02 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id p15-20020a2e9a8f000000b0024f3d1daed6sm478319lji.94.2022.04.30.01.11.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 30 Apr 2022 01:11:02 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc:     Stephen Boyd <swboyd@chromium.org>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        Vinod Koul <vkoul@kernel.org>,
        kernel test robot <lkp@intel.com>
Subject: [PATCH] drm/msm/dsi: use RMW cycles in dsi_update_dsc_timing
Date:   Sat, 30 Apr 2022 11:11:01 +0300
Message-Id: <20220430081101.3763847-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The downstream uses read-modify-write for updating command mode
compression registers. Let's follow this approach. This also fixes the
following warning:

drivers/gpu/drm/msm/dsi/dsi_host.c:918:23: warning: variable 'reg_ctrl' set but not used [-Wunused-but-set-variable]

Reported-by: kernel test robot <lkp@intel.com>
Fixes: 08802f515c3c ("drm/msm/dsi: Add support for DSC configuration")
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/dsi/dsi_host.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/dsi/dsi_host.c b/drivers/gpu/drm/msm/dsi/dsi_host.c
index c983698d1384..a5619ad82a53 100644
--- a/drivers/gpu/drm/msm/dsi/dsi_host.c
+++ b/drivers/gpu/drm/msm/dsi/dsi_host.c
@@ -961,10 +961,12 @@ static void dsi_update_dsc_timing(struct msm_dsi_host *msm_host, bool is_cmd_mod
 		reg_ctrl = dsi_read(msm_host, REG_DSI_COMMAND_COMPRESSION_MODE_CTRL);
 		reg_ctrl2 = dsi_read(msm_host, REG_DSI_COMMAND_COMPRESSION_MODE_CTRL2);
 
+		reg_ctrl &= ~0xffff;
 		reg_ctrl |= reg;
+		reg_ctrl &= ~DSI_COMMAND_COMPRESSION_MODE_CTRL2_STREAM0_SLICE_WIDTH__MASK;
 		reg_ctrl2 |= DSI_COMMAND_COMPRESSION_MODE_CTRL2_STREAM0_SLICE_WIDTH(bytes_in_slice);
 
-		dsi_write(msm_host, REG_DSI_COMMAND_COMPRESSION_MODE_CTRL, reg);
+		dsi_write(msm_host, REG_DSI_COMMAND_COMPRESSION_MODE_CTRL, reg_ctrl);
 		dsi_write(msm_host, REG_DSI_COMMAND_COMPRESSION_MODE_CTRL2, reg_ctrl2);
 	} else {
 		dsi_write(msm_host, REG_DSI_VIDEO_COMPRESSION_MODE_CTRL, reg);
-- 
2.35.1

