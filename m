Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 112E448E8C7
	for <lists+linux-arm-msm@lfdr.de>; Fri, 14 Jan 2022 12:02:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240637AbiANLCl (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 14 Jan 2022 06:02:41 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59460 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239554AbiANLCj (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 14 Jan 2022 06:02:39 -0500
Received: from mail-ed1-x534.google.com (mail-ed1-x534.google.com [IPv6:2a00:1450:4864:20::534])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8851FC06173E
        for <linux-arm-msm@vger.kernel.org>; Fri, 14 Jan 2022 03:02:39 -0800 (PST)
Received: by mail-ed1-x534.google.com with SMTP id c71so33601652edf.6
        for <linux-arm-msm@vger.kernel.org>; Fri, 14 Jan 2022 03:02:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=CwOPSI/x6WISy5xaU7A1XOITYlC8CEEnNs70uyu/4VI=;
        b=lzuTvcA0vLRGjWdJGefFU3SwExD2klLSvu84jf3QsHuqXy9tD1ct/VclxTjuFu0Vqp
         04J8cJTwUhAJYvDCH1P8mkJY7LrOrcJXGhgvySbnXRdEqpchFD+ve1CK2fK1rIyP9hyT
         yNjM0WAzvOd0fwmRJblY/9YXgp4hC73JNa8T3NqoPz8CnEmiaIrFWbmylyjxRuk0ewmj
         +r5CeWStEeOFu7NFJin8ndTKQcsTOvmus8PgdjoK3EiiU7f/xffuub3FMctskUT5eDCo
         13II64iddxTPwVeldzmLnBZkObxhlGIlVgDoXjtTxg9yt74K5b2vqZ54nFEnZ9LbklTv
         QE6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=CwOPSI/x6WISy5xaU7A1XOITYlC8CEEnNs70uyu/4VI=;
        b=IiaGXquce32tDIvWflNxrUlbm3v7MLoWNAsnSTBpb/mOcGWaYXCS224EpGz4557Dys
         UcbyVARMYNj7Y84dHVy9W0BvkZ0eMcIbRCfG0azW0R0nqg5G5YElgEe8WZuHqyM/cgim
         kxYmDb9CZZgugAj/R456i2Njush3bveD3ZQ6XJZGsNkCfGtZu8mupPon6qxazb1vu6ia
         Vuz4KnbB9XyOHWVRK5Ygyx/vNX1hX7jx8gx3W6yJpkAgV3apM9l0XfEgUa5Uhwk5Lx0k
         NlP4i+xnbpOOh8y5WDuCFzWFLKkWOQGx2QWfk91GrUHpDXPKBVeMB7/oOBv6Nwa7rlR0
         2CMQ==
X-Gm-Message-State: AOAM532K67jVxTwYKHSlqJ5Wk/SvgYy5VBlCBcPivDGnQuTX3H712dF1
        QaZCCKe8owr4+fR789Zf0t1AwVgVsS9dYSi/
X-Google-Smtp-Source: ABdhPJx1j9WH9qLXW9VT1IwVpHidffKuqTuHnKtBK0Kpxdic00MomCcR6Dm0CVCrpI9PmLCbklcOFw==
X-Received: by 2002:a05:6402:11c9:: with SMTP id j9mr8406792edw.411.1642158157759;
        Fri, 14 Jan 2022 03:02:37 -0800 (PST)
Received: from localhost.localdomain ([2a02:a210:20c5:8c80:7d0a:cd68:c339:f426])
        by smtp.gmail.com with ESMTPSA id 21sm1725718ejz.24.2022.01.14.03.02.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Jan 2022 03:02:36 -0800 (PST)
From:   Luca Weiss <luca.weiss@fairphone.com>
To:     linux-arm-msm@vger.kernel.org
Cc:     ~postmarketos/upstreaming@lists.sr.ht,
        Luca Weiss <luca.weiss@fairphone.com>,
        Stanimir Varbanov <stanimir.varbanov@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH 1/2] media: venus: hfi: Add error message for timeout error
Date:   Fri, 14 Jan 2022 12:02:25 +0100
Message-Id: <20220114110226.130380-1-luca.weiss@fairphone.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

This error can appear with wrong configuration and is difficult to find
as it just returns -ETIMEDOUT with no further message.

Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
 drivers/media/platform/qcom/venus/hfi_venus.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/media/platform/qcom/venus/hfi_venus.c b/drivers/media/platform/qcom/venus/hfi_venus.c
index 3a75a27632fb..9a34662fea38 100644
--- a/drivers/media/platform/qcom/venus/hfi_venus.c
+++ b/drivers/media/platform/qcom/venus/hfi_venus.c
@@ -1583,8 +1583,10 @@ static int venus_suspend_3xx(struct venus_core *core)
 	 */
 	ret = readx_poll_timeout(venus_cpu_and_video_core_idle, hdev, val, val,
 				 1500, 100 * 1500);
-	if (ret)
+	if (ret) {
+		dev_err(dev, "wait for cpu and video core idle fail (%d)\n", ret);
 		return ret;
+	}
 
 	ret = venus_prepare_power_collapse(hdev, false);
 	if (ret) {
-- 
2.34.1

