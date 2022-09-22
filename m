Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5FCE75E6112
	for <lists+linux-arm-msm@lfdr.de>; Thu, 22 Sep 2022 13:30:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229886AbiIVLac (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 22 Sep 2022 07:30:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57310 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231177AbiIVLa3 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 22 Sep 2022 07:30:29 -0400
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com [IPv6:2a00:1450:4864:20::133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A02C57677E
        for <linux-arm-msm@vger.kernel.org>; Thu, 22 Sep 2022 04:30:26 -0700 (PDT)
Received: by mail-lf1-x133.google.com with SMTP id x27so14254155lfu.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 22 Sep 2022 04:30:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=Nws0gXLCbPL6X9KoHrtPIHCoOBfOHKZJmB1WauEIFW4=;
        b=Cm4/iCt/4HPFS3Z+l8YA5dr9YKfLde/mEP/bKpfnK8EDu3fqU5JcxrXnl4xV51GOfw
         VBMgy9stx2JauU/DneaXoYQTVxEkn4rGkKYnQ+kLM5LnpmEKdUfuH82cnpaQrNrWSpO5
         DIUupurOi7wGq6ccpfWFxgZGIbBHgbkKfRfg7qp2p5ib72xs/mS69bMPaW4cVagHVG8i
         ebn2Kvfx+cehUdop8aAgjqZGgC1er3Mn8b4o31uIzZenXVNEnUkUSqShTmgvMK+Hly5u
         czKDoKeRri7PEPh9nSBgSd9IaiY83cqbdc9DzEVxHd9YvHFcaZ/o1LeNyngrOGqjCq49
         l9XA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=Nws0gXLCbPL6X9KoHrtPIHCoOBfOHKZJmB1WauEIFW4=;
        b=66kYcnEEdDCFT2ZCjeua5I6lbkKcKS6hE68atwcqc3CNH/0MYmkAstmntQUN6uTNPb
         cQxcrV+iAZfdqUsBb1Tq84eIqqanPXp6IIusCPXfdK8S/KcAzkqXlhVG95v/fI1+zkBj
         xzIueIH5r4Nj1GCAU8MmY0x1/gfAdRkjaL99JMusW+KE6zDslRrvbVHZ3BY0+7lZDxPv
         2jrVv1dolTfZCQ255AaYnZnu5Z4nNsRl9E1RRaEJEMxb8oLBfsbLexAWdnCJmOMMjv0I
         kussg5F1XF79JRnT1eB51dT22s4Rp9qxhJphxsiql947Phohe1KM/HUndwPCmWLLnPQS
         0JPw==
X-Gm-Message-State: ACrzQf2dtEwFfSqjNHTZKnbCPt5NLRSigOn6s+BccuPQ1fXeyQ91MEXp
        JBqEF4D577BwY/j8PoUMa8DGyg==
X-Google-Smtp-Source: AMsMyM4fDheMKM/auohpHSKGpGB20FTYUF2o5KeB20hodt+Cz1FbODPDnrWnGrb7OXwt5uSew3/bzg==
X-Received: by 2002:a05:6512:310:b0:496:a0ca:1613 with SMTP id t16-20020a056512031000b00496a0ca1613mr1155642lfp.394.1663846222847;
        Thu, 22 Sep 2022 04:30:22 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id c4-20020ac25304000000b004996fbfd75esm898527lfh.71.2022.09.22.04.30.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Sep 2022 04:30:22 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc:     Stephen Boyd <swboyd@chromium.org>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Bjorn Andersson <andersson@kernel.org>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org
Subject: [PATCH 5/5] drm/msm: mdss add support for SM8450
Date:   Thu, 22 Sep 2022 14:30:16 +0300
Message-Id: <20220922113016.355188-6-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220922113016.355188-1-dmitry.baryshkov@linaro.org>
References: <20220922113016.355188-1-dmitry.baryshkov@linaro.org>
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

Add support for the MDSS block on SM8450 platform.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/msm_mdss.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/gpu/drm/msm/msm_mdss.c b/drivers/gpu/drm/msm/msm_mdss.c
index e13c5c12b775..9e011762396b 100644
--- a/drivers/gpu/drm/msm/msm_mdss.c
+++ b/drivers/gpu/drm/msm/msm_mdss.c
@@ -219,6 +219,13 @@ static int msm_mdss_enable(struct msm_mdss *msm_mdss)
 	case DPU_HW_VER_720:
 		writel_relaxed(0x101e, msm_mdss->mmio + UBWC_STATIC);
 		break;
+	case DPU_HW_VER_810:
+		/* FIXME: merge with 6.0.0? */
+		/* TODO: 0x102e for LP_DDR4 */
+		writel_relaxed(0x103e, msm_mdss->mmio + UBWC_STATIC);
+		writel_relaxed(2, msm_mdss->mmio + UBWC_CTRL_2);
+		writel_relaxed(1, msm_mdss->mmio + UBWC_PREDICTION_MODE);
+		break;
 	}
 
 	return ret;
@@ -447,6 +454,7 @@ static const struct of_device_id mdss_dt_match[] = {
 	{ .compatible = "qcom,sc8180x-mdss" },
 	{ .compatible = "qcom,sm8150-mdss" },
 	{ .compatible = "qcom,sm8250-mdss" },
+	{ .compatible = "qcom,sm8450-mdss" },
 	{}
 };
 MODULE_DEVICE_TABLE(of, mdss_dt_match);
-- 
2.35.1

