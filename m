Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 422B266BFA6
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Jan 2023 14:22:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230317AbjAPNWL (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 16 Jan 2023 08:22:11 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42588 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229935AbjAPNWH (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 16 Jan 2023 08:22:07 -0500
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com [IPv6:2a00:1450:4864:20::131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3A08A1A48A
        for <linux-arm-msm@vger.kernel.org>; Mon, 16 Jan 2023 05:22:06 -0800 (PST)
Received: by mail-lf1-x131.google.com with SMTP id o20so10731309lfk.5
        for <linux-arm-msm@vger.kernel.org>; Mon, 16 Jan 2023 05:22:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=H2CA3XKJhGIFwYtcjl55qc0rkyBeiiGFyKWG5lDr9yU=;
        b=Zg9f6FuQNN+YMaEOqz4bwO1bAc0JeWaotuTB62rR5Q08caAonlDaFZYmlWB7B7cFaM
         k4QdkVtFIxqZlmvu5aUItkwmSI1V5YYVeT52ctIR+8IukL858upwV34pxaHSuc556jrE
         LQfO79CehGGPEzXctZS51AQ8bTabjAiUBBpvrCUr7lt3qO3qvBX6jIHX/29u4SqtMzx/
         0hueMepetojahUvCV/ZTJYTTzm9YF2Hl7fb5/4L0V0C8IF/u8LB9t2KAs5p5KPn6ltRe
         Y5A0FaSRmvtDDKaJfvDannAzE0HYQ4JPdXs5dsz7gbHW+Pnegh8y21hQL46XzCst9O2Y
         kbuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=H2CA3XKJhGIFwYtcjl55qc0rkyBeiiGFyKWG5lDr9yU=;
        b=GTUBlIQ5kCr+QotgAFl/SzCo5odq20Y0xjdQx1gMTHhSbIHpI6xYi8O7f6fXbTP20U
         Xvn/daWSpuOP4/7rYQd5Rc7FnH6+4YJkdUZHf+r3SnzcF6+ezuE2LnZ+rvP5NbZvVZR7
         SSSVgL0pos5uf9qgQ5qUj0gc6f2hxlIozO2HbRYQuIdR37VMJFf56Jk4zHxSqjytaU0K
         93zmA9SWmG4IpI3XG9EDgUcqyrQK9yZkV8zM3AgX0NyWO1inUUI6/UnlbMxEu3ctEevj
         U0suRlhWwsDN5gwaT6Z2JVnOwYT+pJ+PyIM/e47lTIL1xfFCxgXHUq6QGwgPc4bqvJ+1
         3oeQ==
X-Gm-Message-State: AFqh2kpu6SJKGuSblnPqZUqWrP85sMLxQrR5Fjf3A8wHJPB4QWYhlmWH
        6/j2oyr9BUXDWBb1qDwnOgTeTJ69cVCuP2vi
X-Google-Smtp-Source: AMrXdXtA6YxsaOLMlv2vK4pPp8n/rcrHdhcDgba7HYSGrrBUrK+6zzQojxbsSKxHPNEQO6Pco/xEuQ==
X-Received: by 2002:ac2:538d:0:b0:4bb:d287:1147 with SMTP id g13-20020ac2538d000000b004bbd2871147mr3313598lfh.15.1673875324405;
        Mon, 16 Jan 2023 05:22:04 -0800 (PST)
Received: from localhost.localdomain (abym53.neoplus.adsl.tpnet.pl. [83.9.32.53])
        by smtp.gmail.com with ESMTPSA id p9-20020a05651212c900b004cc58b91177sm5016653lfg.239.2023.01.16.05.22.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Jan 2023 05:22:04 -0800 (PST)
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
To:     linux-arm-msm@vger.kernel.org, andersson@kernel.org,
        agross@kernel.org, krzysztof.kozlowski@linaro.org
Cc:     marijn.suijten@somainline.org, bryan.odonoghue@linaro.org,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Georgi Djakov <djakov@kernel.org>, linux-pm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v3 4/9] interconnect: qcom: Sort kerneldoc entries
Date:   Mon, 16 Jan 2023 14:21:47 +0100
Message-Id: <20230116132152.405535-5-konrad.dybcio@linaro.org>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230116132152.405535-1-konrad.dybcio@linaro.org>
References: <20230116132152.405535-1-konrad.dybcio@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-0.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_SORBS_HTTP,RCVD_IN_SORBS_SOCKS,SPF_HELO_NONE,SPF_PASS
        autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Sort the kerneldoc entries the same way the struct members are
sorted.

Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
 drivers/interconnect/qcom/icc-rpm.h | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/interconnect/qcom/icc-rpm.h b/drivers/interconnect/qcom/icc-rpm.h
index 8aed5400afda..21f440beda86 100644
--- a/drivers/interconnect/qcom/icc-rpm.h
+++ b/drivers/interconnect/qcom/icc-rpm.h
@@ -23,12 +23,12 @@ enum qcom_icc_type {
 /**
  * struct qcom_icc_provider - Qualcomm specific interconnect provider
  * @provider: generic interconnect provider
- * @bus_clks: the clk_bulk_data table of bus clocks
  * @num_clks: the total number of clk_bulk_data entries
  * @type: the ICC provider type
- * @qos_offset: offset to QoS registers
  * @regmap: regmap for QoS registers read/write access
+ * @qos_offset: offset to QoS registers
  * @bus_clk_rate: bus clock rate in Hz
+ * @bus_clks: the clk_bulk_data table of bus clocks
  */
 struct qcom_icc_provider {
 	struct icc_provider provider;
-- 
2.39.0

