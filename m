Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2A6B84EFCFF
	for <lists+linux-arm-msm@lfdr.de>; Sat,  2 Apr 2022 01:11:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1345698AbiDAXNB (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 1 Apr 2022 19:13:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55380 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235504AbiDAXNA (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 1 Apr 2022 19:13:00 -0400
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com [IPv6:2a00:1450:4864:20::12e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6A1571AE231
        for <linux-arm-msm@vger.kernel.org>; Fri,  1 Apr 2022 16:11:09 -0700 (PDT)
Received: by mail-lf1-x12e.google.com with SMTP id e16so7437187lfc.13
        for <linux-arm-msm@vger.kernel.org>; Fri, 01 Apr 2022 16:11:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=aBelTolXdBHgrs8x4WhdW94lmNOFNROJVduSORgOB7o=;
        b=cSJO5Y0WHrvicOzagTdzW8mxEYjtLoEonod/QPZAJ1+rnNH7WrPhfIyLEsUz1LTn1U
         HMYu15v74gwcy/bppNWOwlyIbkowizviinW4I7zNp2IYoAcdxCxiuQhw4tHQ/tJn1Jab
         9vJysKhMOmHn8o54gaTBFtnWb1HuCILeL7NgmD3AM1pcAWMkvCz88wFcIc0nhXylhgH/
         gLfqvMJ6bVTAsHmw1hUIDrF46Gd0efzHu0HrTc85YrIvJk4qBlEty8gg3zQJyF7HhLpq
         8iZCB57UBD4kYrYVVw6xplOJw+M6QEPzIbquGrLocHK40680EXYR7S49ScyVbGZUNTYN
         tDtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=aBelTolXdBHgrs8x4WhdW94lmNOFNROJVduSORgOB7o=;
        b=DnbzTz6lil8al9zhDWoqTY0DUIeSyXH8kzM63XP+euErWdQlALvQ/g4vnMXt8INbAY
         10CyY/igAbpShjwug8kG8LtrnzW+A/ksVKtWhwC1mRnlEjyi3YS8L6MA4zhUOl1MJRNg
         RInQXJMCMhJpMLFtiBRQINLyJIadPkD7mgkezGbLTNAaXOvfRihQe08aTW0F7V2JBb9D
         8GnZD1WXa9Y3/3x9xE4QGALGwwYtQ4Qt+j3TR4Rz56AmPf6nots7smONaOAlJsdiXU/F
         fj8HTx06oYxO03dfgW+57rpfG7V1l+N2B2eNEIsJ/+cbSWmv+W4dnVAXCxCNwlZVJmAp
         vpeA==
X-Gm-Message-State: AOAM5337vsuMSc4AgwramhZqoeOM7a59Oe3UTq3F6vXngFkY/mqFFQCf
        d6KoKlVgOeDciAXA7zjnhuyUdg==
X-Google-Smtp-Source: ABdhPJyP1ntsUFhZ7UVRnsIPgItCfAmAVAJQ1H5AqQQMbem7zgObeIf3ZPKJlaJJdwrfnNaEdQ112g==
X-Received: by 2002:a05:6512:1306:b0:448:5689:2be0 with SMTP id x6-20020a056512130600b0044856892be0mr15309047lfu.57.1648854667651;
        Fri, 01 Apr 2022 16:11:07 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id x23-20020a19e017000000b0044a4820f882sm367413lfg.84.2022.04.01.16.11.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 01 Apr 2022 16:11:06 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc:     Stephen Boyd <swboyd@chromium.org>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        Dan Carpenter <dan.carpenter@oracle.com>
Subject: [PATCH] drm/msm/dsi: fix error checks and return values for DSI xmit functions
Date:   Sat,  2 Apr 2022 02:11:04 +0300
Message-Id: <20220401231104.967193-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

As noticed by Dan ([1] an the followup thread) there are multiple issues
with the return values for MSM DSI command transmission callback. In
the error case it can easily return a positive value when it should
have returned a proper error code.

This commits attempts to fix these issues both in TX and in RX paths.

[1]: https://lore.kernel.org/linux-arm-msm/20211001123617.GH2283@kili/

Fixes: a689554ba6ed ("drm/msm: Initial add DSI connector support")
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/dsi/dsi_host.c | 21 ++++++++++++++-------
 1 file changed, 14 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/msm/dsi/dsi_host.c b/drivers/gpu/drm/msm/dsi/dsi_host.c
index d51e70fab93d..8925f60fd9ec 100644
--- a/drivers/gpu/drm/msm/dsi/dsi_host.c
+++ b/drivers/gpu/drm/msm/dsi/dsi_host.c
@@ -1341,10 +1341,10 @@ static int dsi_cmds2buf_tx(struct msm_dsi_host *msm_host,
 			dsi_get_bpp(msm_host->format) / 8;
 
 	len = dsi_cmd_dma_add(msm_host, msg);
-	if (!len) {
+	if (len < 0) {
 		pr_err("%s: failed to add cmd type = 0x%x\n",
 			__func__,  msg->type);
-		return -EINVAL;
+		return len;
 	}
 
 	/* for video mode, do not send cmds more than
@@ -1363,10 +1363,14 @@ static int dsi_cmds2buf_tx(struct msm_dsi_host *msm_host,
 	}
 
 	ret = dsi_cmd_dma_tx(msm_host, len);
-	if (ret < len) {
-		pr_err("%s: cmd dma tx failed, type=0x%x, data0=0x%x, len=%d\n",
-			__func__, msg->type, (*(u8 *)(msg->tx_buf)), len);
-		return -ECOMM;
+	if (ret < 0) {
+		pr_err("%s: cmd dma tx failed, type=0x%x, data0=0x%x, len=%d, ret=%d\n",
+			__func__, msg->type, (*(u8 *)(msg->tx_buf)), len, ret);
+		return ret;
+	} else if (ret < len) {
+		pr_err("%s: cmd dma tx failed, type=0x%x, data0=0x%x, ret=%d len=%d\n",
+			__func__, msg->type, (*(u8 *)(msg->tx_buf)), ret, len);
+		return -EIO;
 	}
 
 	return len;
@@ -2092,9 +2096,12 @@ int msm_dsi_host_cmd_rx(struct mipi_dsi_host *host,
 		}
 
 		ret = dsi_cmds2buf_tx(msm_host, msg);
-		if (ret < msg->tx_len) {
+		if (ret < 0) {
 			pr_err("%s: Read cmd Tx failed, %d\n", __func__, ret);
 			return ret;
+		} else if (ret < msg->tx_len) {
+			pr_err("%s: Read cmd Tx failed, too short: %d\n", __func__, ret);
+			return -ECOMM;
 		}
 
 		/*
-- 
2.35.1

