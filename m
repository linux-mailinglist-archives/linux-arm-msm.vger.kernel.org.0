Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 335CB744389
	for <lists+linux-arm-msm@lfdr.de>; Fri, 30 Jun 2023 22:55:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231634AbjF3Uzf (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 30 Jun 2023 16:55:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56462 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232431AbjF3Uze (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 30 Jun 2023 16:55:34 -0400
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com [IPv6:2a00:1450:4864:20::12d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2C6983C29
        for <linux-arm-msm@vger.kernel.org>; Fri, 30 Jun 2023 13:55:33 -0700 (PDT)
Received: by mail-lf1-x12d.google.com with SMTP id 2adb3069b0e04-4fb96e2b573so3891119e87.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 30 Jun 2023 13:55:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1688158531; x=1690750531;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=r18mIVnmzqRHDPtVLwyQfg7CU86v3tvlxJpotfkE8/Y=;
        b=LUyeVfhqY4vehUN7iaSFHM+uoOBODXHG8w7l6Lw7PspLCfPKldR4KAwZ1W9FkwPAuz
         kI/Q+1MxAeU1vP5nHpmXjAfiU9JM2e+/iBsUqH0s5rZGQ5euKH3Yt1cji348QgFhMHIq
         qVrBcQRqzKPK4Aox2BpKJuQiYPSASSiuISu/JXDfBywg65cxJov1vuKP53Moc0HZHebx
         aR4n0XANAHbQWlhFuZM9jYtEGHCdwcxW1Q5gIVMVXI5MdqMXJiucCr0kBkpepibS8Ziy
         JORNtbZtmqE2GoUPVrNwAsrmOQWtVoq4RQYaDs34Y9QzFTZEHdg7FMZzquDPDa+YAvLu
         lluQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688158531; x=1690750531;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=r18mIVnmzqRHDPtVLwyQfg7CU86v3tvlxJpotfkE8/Y=;
        b=WZGhjCfoq2IwmbHo+jjuj5tGr1vVyEavspMLKOPX9hrhvOqiydHkXqfSKeohq38IOY
         T+VAw/h05kfcx4FIiS2ntZuCrBbctMORJSO9DMRclVwCAGW2RdusuTI3LHv1XmhOxegz
         5mxI7hf/vsynVaTlf/ORREnoxKNFIQKwHejH7/qKSTtHrCjGKeWH3jADd1c4ZBc52yPy
         mv2By5nZXoKvhd0BQUSOeiF1MsMsUBaJ3lDkgmKv2IuZ8+2UlqVF9znpFMK+hq2w+rFy
         HkDlpn94MtUxzQjnKv6zyqn5+fw7OA2vpoDega3ZTfGpJwlH+0YsY5FFllwwqaUEqTcy
         XxFg==
X-Gm-Message-State: ABy/qLYYaeEW6Fqcv3ai4XXLO30Yx7ekMgmJAaO1xUnzCI9b0hHsY0MJ
        d1ctPimI40oMxGeKChT0U0ldWA==
X-Google-Smtp-Source: APBJJlE7JZKxqCJN4wJq27EJv5YNxShDUyy9x1y4SLSryjFibDNtFji/MeeW5RVzba70K+QXzWeFZw==
X-Received: by 2002:a05:6512:3c81:b0:4f5:1418:e230 with SMTP id h1-20020a0565123c8100b004f51418e230mr1018104lfv.52.1688158531172;
        Fri, 30 Jun 2023 13:55:31 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id z11-20020ac25deb000000b004fb75943aa0sm2252168lfq.196.2023.06.30.13.55.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Jun 2023 13:55:30 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Marijn Suijten <marijn.suijten@somainline.org>
Cc:     Stephen Boyd <swboyd@chromium.org>,
        David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Bjorn Andersson <andersson@kernel.org>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org
Subject: [PATCH 09/15] drm/msm/hdmi: add runtime PM calls to DDC transfer function
Date:   Fri, 30 Jun 2023 23:55:17 +0300
Message-Id: <20230630205523.76823-10-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230630205523.76823-1-dmitry.baryshkov@linaro.org>
References: <20230630205523.76823-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

We must be sure that the HDMI controller is powered on, while performing
the DDC transfer. Add corresponding runtime PM calls to
msm_hdmi_i2c_xfer().

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/hdmi/hdmi_i2c.c | 14 ++++++++++++--
 1 file changed, 12 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/msm/hdmi/hdmi_i2c.c b/drivers/gpu/drm/msm/hdmi/hdmi_i2c.c
index de182c004843..9c78c6c528be 100644
--- a/drivers/gpu/drm/msm/hdmi/hdmi_i2c.c
+++ b/drivers/gpu/drm/msm/hdmi/hdmi_i2c.c
@@ -107,11 +107,15 @@ static int msm_hdmi_i2c_xfer(struct i2c_adapter *i2c,
 	if (num == 0)
 		return num;
 
+	ret = pm_runtime_resume_and_get(&hdmi->pdev->dev);
+	if (ret)
+		return ret;
+
 	init_ddc(hdmi_i2c);
 
 	ret = ddc_clear_irq(hdmi_i2c);
 	if (ret)
-		return ret;
+		goto fail;
 
 	for (i = 0; i < num; i++) {
 		struct i2c_msg *p = &msgs[i];
@@ -169,7 +173,7 @@ static int msm_hdmi_i2c_xfer(struct i2c_adapter *i2c,
 				hdmi_read(hdmi, REG_HDMI_DDC_SW_STATUS),
 				hdmi_read(hdmi, REG_HDMI_DDC_HW_STATUS),
 				hdmi_read(hdmi, REG_HDMI_DDC_INT_CTRL));
-		return ret;
+		goto fail;
 	}
 
 	ddc_status = hdmi_read(hdmi, REG_HDMI_DDC_SW_STATUS);
@@ -202,7 +206,13 @@ static int msm_hdmi_i2c_xfer(struct i2c_adapter *i2c,
 		}
 	}
 
+	pm_runtime_put(&hdmi->pdev->dev);
+
 	return i;
+
+fail:
+	pm_runtime_put(&hdmi->pdev->dev);
+	return ret;
 }
 
 static u32 msm_hdmi_i2c_func(struct i2c_adapter *adapter)
-- 
2.39.2

