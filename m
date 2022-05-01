Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 941C95163B2
	for <lists+linux-arm-msm@lfdr.de>; Sun,  1 May 2022 12:38:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1345417AbiEAKjZ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 1 May 2022 06:39:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58344 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1345435AbiEAKjC (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 1 May 2022 06:39:02 -0400
Received: from mail-ed1-x52c.google.com (mail-ed1-x52c.google.com [IPv6:2a00:1450:4864:20::52c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2A09EE8C
        for <linux-arm-msm@vger.kernel.org>; Sun,  1 May 2022 03:35:35 -0700 (PDT)
Received: by mail-ed1-x52c.google.com with SMTP id z19so13674645edx.9
        for <linux-arm-msm@vger.kernel.org>; Sun, 01 May 2022 03:35:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=rC1RBfaaxLYiq5iDakFFR3OcWxeEK5RtgKrD6YK+e+w=;
        b=KkTptCIVR37GTgVLSobIw/FK+uwlmuXtDgiLycnNG2JlYGOwLQPoDSnRhqBvzz+6SS
         R9l/gbqlMYdym5zI9lGWG6p2FXtpGD5Qonk7lLky4Z4sNSQ3j9ySpMwUMJ6ydyxig2rD
         hQdo1eoDH52wcHVDanEtNk/2nupfnX1tFlut9LIktJNRtzZqA4rKDuNIlCjJR1G2wrCw
         m1pLFg4bM/+Nei6QG7BdMlCKbbXukaUgNeGxzdW4KmES5dVikXiQp0Ilv8H5VX5Jvd8h
         Bdj8JBWCU9KmeyPNLea5DGGlhNvpyA4BayrrlJeDXr1aipkwQ92fCWOX2LokVFwsTW72
         Pabw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=rC1RBfaaxLYiq5iDakFFR3OcWxeEK5RtgKrD6YK+e+w=;
        b=p/95Cf4A0gyLtbSxUcDPKgAUEiatqthTZC2I1vWfwsj2CWSUWJ1DSkK+pBNGGA4PcX
         q+644EDOpaX/UJA2Im5l8vGtlnv5rY3CquqdizcZWZUZznlQ5TbXTSUp/xqcLtUZbGaW
         D31x7idvbezb/GCt3MueiAG/ndDziS8aAl7425maLBZKll8XlMS/KfsEYS3nYN1OMpPY
         Lbqx0JqyembmuNVExiHgXiXOgpQomapsq4uezMY4npxDBwZWCMFHhZ2CkAEUAvvP80w1
         +g2WNNm9NF7A9KxLqIfQAJL9tH5wugmElq4weO8nEo9DVth/OZxWY8NJaZJj/Chrtud6
         A4lA==
X-Gm-Message-State: AOAM532kykmvl1DC+Im01ZADBpnpUYKbmwsmx/EYqS14prTtC70OwLi8
        fpQrJQqLuDCNxF1xBpW5HjXFoQ==
X-Google-Smtp-Source: ABdhPJzPxoWEYsPQoFqVn0Mn6T9T5bfRt2FN5RA/30mw3XraPQgHBZwCu2LbyVfL7i1/k4t2uEGHEw==
X-Received: by 2002:a05:6402:909:b0:416:6f3c:5c1d with SMTP id g9-20020a056402090900b004166f3c5c1dmr8069640edz.108.1651401333801;
        Sun, 01 May 2022 03:35:33 -0700 (PDT)
Received: from localhost.localdomain (xdsl-188-155-176-92.adslplus.ch. [188.155.176.92])
        by smtp.gmail.com with ESMTPSA id zp1-20020a17090684e100b006f3ef214df1sm2464438ejb.87.2022.05.01.03.35.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 May 2022 03:35:33 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-remoteproc@vger.kernel.org
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH 6/8] rpmsg: qcom: correct kerneldoc
Date:   Sun,  1 May 2022 12:35:18 +0200
Message-Id: <20220501103520.111561-6-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220501103520.111561-1-krzysztof.kozlowski@linaro.org>
References: <20220501103520.111561-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Correct kerneldoc warnings like:

  drivers/rpmsg/qcom_glink_ssr.c:45:
    warning: expecting prototype for G(). Prototype was for GLINK_SSR_DO_CLEANUP() instead

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 drivers/rpmsg/qcom_glink_ssr.c | 2 +-
 drivers/rpmsg/qcom_smd.c       | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/rpmsg/qcom_glink_ssr.c b/drivers/rpmsg/qcom_glink_ssr.c
index dea929c6045d..776d64446879 100644
--- a/drivers/rpmsg/qcom_glink_ssr.c
+++ b/drivers/rpmsg/qcom_glink_ssr.c
@@ -39,7 +39,7 @@ struct cleanup_done_msg {
 	__le32 seq_num;
 };
 
-/**
+/*
  * G-Link SSR protocol commands
  */
 #define GLINK_SSR_DO_CLEANUP	0
diff --git a/drivers/rpmsg/qcom_smd.c b/drivers/rpmsg/qcom_smd.c
index 7c8c29f6c91d..e7e49d972d36 100644
--- a/drivers/rpmsg/qcom_smd.c
+++ b/drivers/rpmsg/qcom_smd.c
@@ -729,7 +729,7 @@ static int qcom_smd_write_fifo(struct qcom_smd_channel *channel,
 }
 
 /**
- * qcom_smd_send - write data to smd channel
+ * __qcom_smd_send - write data to smd channel
  * @channel:	channel handle
  * @data:	buffer of data to write
  * @len:	number of bytes to write
-- 
2.32.0

