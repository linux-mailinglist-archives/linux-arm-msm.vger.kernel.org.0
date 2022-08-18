Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 167C3597C84
	for <lists+linux-arm-msm@lfdr.de>; Thu, 18 Aug 2022 05:56:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242577AbiHRDvO (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 17 Aug 2022 23:51:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44336 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237518AbiHRDvN (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 17 Aug 2022 23:51:13 -0400
Received: from mail-oi1-x229.google.com (mail-oi1-x229.google.com [IPv6:2607:f8b0:4864:20::229])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 198E36261
        for <linux-arm-msm@vger.kernel.org>; Wed, 17 Aug 2022 20:51:12 -0700 (PDT)
Received: by mail-oi1-x229.google.com with SMTP id v125so416508oie.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 17 Aug 2022 20:51:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kali.org; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc;
        bh=z/kt4xsiqT5uh1tSKfd39tJzduEkjiNNtsPz4ODYScQ=;
        b=hUsX8rTlrvTeQvHroIs2XSAw7rftVr3j4T1DMDpJAOhE75zyhypDjS8nZn2dJ1PAtV
         PyyiE9zWnK4AdZgnzKyYo5SaIU4lzFOnMQhymG4K/BunYWpJmPqfh2ayCKiRVtyMXUSa
         qWJ/8Kn31W0eviW63LQ0bNlJd7r6XSayEsgXrpJrTkzbtn676A0CSZlXget+ct41QgUJ
         6pnc/4akLOnoonrqqS59n0HN3I+svs8h75IiIISyBFN+rKSSBroei3IQKCB+ACuprsL1
         ysf9YPNasyRTNxgNyKrZrBFrU7rRsKPFfAWfn2JKWrr+VV6hdcFI5VeL8KpweMamYNQs
         J9Bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc;
        bh=z/kt4xsiqT5uh1tSKfd39tJzduEkjiNNtsPz4ODYScQ=;
        b=yGjGhyZWWE3rQyJzI3sdJGu1OQj6iqFzcVcKVsj/qWy/CrWwsILNQP3oHD3pmoEdTY
         K8eY6J/kN0JifeeOabuOHrrn6qghtISc2Q217NG0vJnY6euqSI3y5sEpUBb1RRoCBESL
         /P3KLp+JMs9KoMnjCYYBe3ZrRk84cud/WuNOIlosX0/p3QGdeU39EgSeU82qdk23YDGp
         ili43PNGu1Ebg3BXDbZOZ88mJZ22u85M3Fy7i9Hj4vn/nxE6JjKoIPyLCxQPQTBlfX8+
         LLZ9i4sSls2i25zkhA8NPE/HCyrBtnyC59H9PWcX4IxKDCjt+pTY3h452oYss66zD5zJ
         iPGw==
X-Gm-Message-State: ACgBeo1Eo9zvmSiod1JxpwNI1G7qOVHpJJ+xQQpYdAOi2sdjAyb/nXQh
        p0sEioDd4RFy2I2Xir1axgP2HQ==
X-Google-Smtp-Source: AA6agR5nK0pO97s1k3xUg01xcKqTwc3MTVG/hu97TQDzw0VbKl4p+cqjklTjMetgLlKH5V34+pGaOA==
X-Received: by 2002:a05:6808:200f:b0:343:470a:cd22 with SMTP id q15-20020a056808200f00b00343470acd22mr2776801oiw.52.1660794671410;
        Wed, 17 Aug 2022 20:51:11 -0700 (PDT)
Received: from localhost (cpe-173-173-107-246.satx.res.rr.com. [173.173.107.246])
        by smtp.gmail.com with ESMTPSA id b6-20020a9d5d06000000b0063695ad0cbesm142984oti.66.2022.08.17.20.51.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Aug 2022 20:51:10 -0700 (PDT)
From:   Steev Klimaszewski <steev@kali.org>
To:     Steev Klimaszewski <steev@kali.org>
Cc:     Amit Pundir <amit.pundir@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Vinod Koul <vkoul@kernel.org>,
        Bard Liao <yung-chuan.liao@linux.intel.com>,
        Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
        Sanyog Kale <sanyog.r.kale@intel.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Srinivasa Rao Mandadapu <quic_srivasam@quicinc.com>,
        linux-arm-msm@vger.kernel.org, alsa-devel@alsa-project.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH] soundwire: qcom: remove unneeded check
Date:   Wed, 17 Aug 2022 22:51:05 -0500
Message-Id: <20220818035105.5510-1-steev@kali.org>
X-Mailer: git-send-email 2.34.1
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

commit 1fd0d85affe4d6 ("soundwire: qcom: Add flag for software clock gating check") 
added a flag for software clock gating check, however in commit
33ba01788889666 ("soundwire: qcom: Add support for controlling audio CGCR from HLOS")
the same check was added without the flag, so we would still end up failing
the software clock gating check.

Originally reported by Amit Pundir on DB845c, I also saw it on the
Lenovo Yoga C630, right before the splat, we would see

qcom-soundwire wcd934x-soundwire.6.auto: Failed to get audio_cgcr reset required for soundwire-v1.6.0

however, SDM845 has a soundwire-v1.3.0

Since the flag was added in 1fd0d85affe, lets just remove this one.

Fixes: 33ba01788889 ("soundwire: qcom: Add support for controlling audio CGCR from HLOS")
Signed-off-by: Steev Klimaszewski <steev@kali.org>
Reported-by: Amit Pundir <amit.pundir@linaro.org>
---
 drivers/soundwire/qcom.c | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/drivers/soundwire/qcom.c b/drivers/soundwire/qcom.c
index 709a7c1e0704..b621f7fb866f 100644
--- a/drivers/soundwire/qcom.c
+++ b/drivers/soundwire/qcom.c
@@ -1355,10 +1355,6 @@ static int qcom_swrm_probe(struct platform_device *pdev)
 	ctrl->bus.compute_params = &qcom_swrm_compute_params;
 	ctrl->bus.clk_stop_timeout = 300;
 
-	ctrl->audio_cgcr = devm_reset_control_get_exclusive(dev, "swr_audio_cgcr");
-	if (IS_ERR(ctrl->audio_cgcr))
-		dev_err(dev, "Failed to get audio_cgcr reset required for soundwire-v1.6.0\n");
-
 	ret = qcom_swrm_get_port_config(ctrl);
 	if (ret)
 		goto err_clk;
-- 
2.35.1

