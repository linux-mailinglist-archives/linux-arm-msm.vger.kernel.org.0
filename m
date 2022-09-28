Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 099DD5EDD95
	for <lists+linux-arm-msm@lfdr.de>; Wed, 28 Sep 2022 15:20:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233790AbiI1NUZ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 28 Sep 2022 09:20:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40442 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233020AbiI1NUY (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 28 Sep 2022 09:20:24 -0400
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com [IPv6:2a00:1450:4864:20::12b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6CE347823C
        for <linux-arm-msm@vger.kernel.org>; Wed, 28 Sep 2022 06:20:22 -0700 (PDT)
Received: by mail-lf1-x12b.google.com with SMTP id k10so20345562lfm.4
        for <linux-arm-msm@vger.kernel.org>; Wed, 28 Sep 2022 06:20:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=U36NjhsAwog7/X0GNMxs2kFxhhnbeKSocGnUpytYWXI=;
        b=fOYSihQMzyuZDyv4JUnGdl/v+/+kIk2FAZPwNqiSy2uDxtAaQzoYXK8MbFTp9pJyvt
         p/sBRodRkv7xYW58vhqAkdZUkP02VVZjJ8QzNhhxfWBXrG3kBMtGQkaE+vI+lYjd3gSV
         B/a5PqZPVllsDJwdAcv89FE88sFQc8VXV0DGMAwdiMm3L80vyHUDn/aadd4xAJoxAdJr
         EPjNLMDaaRm1wDdy+PC/zVY0FtzOHZKuX/UksYVHjKBH0r52ZBifs4DCviYmRG6Fq0NO
         97CCzK56A3Si7MgXcyGHP613wwSCQfYVtkVUk23zD40sc77RAbRlIYcYTssZOUIbQYEA
         woCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=U36NjhsAwog7/X0GNMxs2kFxhhnbeKSocGnUpytYWXI=;
        b=Piq+O1MgwDNyq0fF8foGzDplCYCbZX2Ejtekogj2jgUwKZd01r+8aqbwYl5VDgh+dn
         pvaNbM5lN/PaBXCrDjP02c3WtH2FAZriwaQXOYTUQlz9eMIm5iYNhVLbXgVwtsaLRInq
         d+TeY9WAc6JvLTcxtjn1wRj3rAMIPn+6y5SrPSSDRp2/7rJfxx0mmC39GRh07uwvUfI9
         axkKaQXnZXVwYjaje4YYuNU69+UL2EXH4jl6Eh08Ch6ko8Je5TTD94/Dss7KBKrIjJ7s
         k+uzdjVTg4xnRiMA2Y3tpkz2V0hefpFCyfw+cb/Im8Yzi9FLGHhUzoODQIXuZDRwShFh
         sUtQ==
X-Gm-Message-State: ACrzQf1/z2WngLKwLIiy9vcjRMez2/liOelR1/Di7GX0BaR0u/8ZeHS9
        lcmmLIFpW2tNfTsb1aKIuXkvBA==
X-Google-Smtp-Source: AMsMyM7MhlrItXEwdt3Vv00VMHy5nJueDqpMgvsGytSWYaxV1mPq5Uux6Ggg9crZH7sLVRMRe8mroQ==
X-Received: by 2002:a05:6512:3052:b0:49e:fcb2:c1e9 with SMTP id b18-20020a056512305200b0049efcb2c1e9mr12355824lfb.260.1664371220823;
        Wed, 28 Sep 2022 06:20:20 -0700 (PDT)
Received: from krzk-bin.. (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
        by smtp.gmail.com with ESMTPSA id p11-20020ac246cb000000b00497ad9ae486sm478484lfo.62.2022.09.28.06.20.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Sep 2022 06:20:20 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
        linux-arm-msm@vger.kernel.org, alsa-devel@alsa-project.org,
        linux-kernel@vger.kernel.org
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH 2/2] slimbus: qcom-ngd-ctrl: drop PM runtime counter on transfer error paths
Date:   Wed, 28 Sep 2022 15:20:11 +0200
Message-Id: <20220928132011.455347-2-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220928132011.455347-1-krzysztof.kozlowski@linaro.org>
References: <20220928132011.455347-1-krzysztof.kozlowski@linaro.org>
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

If transfer in qcom_slim_ngd_xfer_msg_sync() fails, we need to drop the
PM runtime usage counter to have it balanced.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 drivers/slimbus/qcom-ngd-ctrl.c | 14 +++++++++++---
 1 file changed, 11 insertions(+), 3 deletions(-)

diff --git a/drivers/slimbus/qcom-ngd-ctrl.c b/drivers/slimbus/qcom-ngd-ctrl.c
index ba36eb5c0de3..ac84fdc2822f 100644
--- a/drivers/slimbus/qcom-ngd-ctrl.c
+++ b/drivers/slimbus/qcom-ngd-ctrl.c
@@ -919,21 +919,29 @@ static int qcom_slim_ngd_xfer_msg_sync(struct slim_controller *ctrl,
 	DECLARE_COMPLETION_ONSTACK(done);
 	int ret, timeout;
 
-	pm_runtime_get_sync(ctrl->dev);
+	ret = pm_runtime_get_sync(ctrl->dev);
+	if (ret < 0)
+		goto pm_put;
 
 	txn->comp = &done;
 
 	ret = qcom_slim_ngd_xfer_msg(ctrl, txn);
 	if (ret)
-		return ret;
+		goto pm_put;
 
 	timeout = wait_for_completion_timeout(&done, HZ);
 	if (!timeout) {
 		dev_err(ctrl->dev, "TX timed out:MC:0x%x,mt:0x%x", txn->mc,
 				txn->mt);
-		return -ETIMEDOUT;
+		ret = -ETIMEDOUT;
+		goto pm_put;
 	}
 	return 0;
+
+pm_put:
+	pm_runtime_put(ctrl->dev);
+
+	return ret;
 }
 
 static int qcom_slim_ngd_enable_stream(struct slim_stream_runtime *rt)
-- 
2.34.1

