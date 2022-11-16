Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A92FD62B7D8
	for <lists+linux-arm-msm@lfdr.de>; Wed, 16 Nov 2022 11:22:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237481AbiKPKWT (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 16 Nov 2022 05:22:19 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57074 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237885AbiKPKV5 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 16 Nov 2022 05:21:57 -0500
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com [IPv6:2a00:1450:4864:20::42c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A2AC4220EF
        for <linux-arm-msm@vger.kernel.org>; Wed, 16 Nov 2022 02:21:55 -0800 (PST)
Received: by mail-wr1-x42c.google.com with SMTP id z14so28963569wrn.7
        for <linux-arm-msm@vger.kernel.org>; Wed, 16 Nov 2022 02:21:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=pv5CcBvM1Y0DmqwfRO50yvVc4LT+eZLqos1FdCMiOYE=;
        b=sNX56Yaa+zhdebatzuNg1q/oOgZqyK47/jJYDv8HGwrlB9RJ5B9k/A+KJAJwj6uWvH
         kXVMwg5mVJyulez1FN1bzC/VaDWDyQddXHLz8D96l7RgQh08thdIETLdXPUkC1EsZKOt
         DUkHxF5msJUPlbmPcbPdLyCTsuawKS0+6zmLNEpDvZTyAv06bjmVH/ypRAqhw7SE7+tP
         Idh9ZydDXdNC06roDDAbmQJNx/OlWkJd6IyQCDvxB0DE/UpX0a2jkBlIehhGCDtWgjSw
         fjffMyuYYRJv4ioS/LhSCsLavArIdobqXIehzw5QAYYBlJ7SD3MgZBXAOxgbsDBMc4Q2
         rkMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pv5CcBvM1Y0DmqwfRO50yvVc4LT+eZLqos1FdCMiOYE=;
        b=xySVj6jQDRz4XCl4kk0WRBMzf5psSS2COjmHaF0H174SciJA2zW9z86mjtkbw3jDRK
         jnYmiuWsYVDg/bXlWfFN+PRLL3796d2n5VwwnYpgPFQKViOtSKQ+0WwdwBPh3vTBksoE
         uw9OeP6SXzO8+cEwW0o26dg7una0W2Aw9zZlJqH3EnhRmTJ42ezI1O/aSwPft+5Dl33q
         l4M19I5d7LofvSOMYXBaHSg2Y3WjZRt4c6EKePzBCFekpsCJzqN9PX4oJ+GyuOEwsB52
         2vRb+pRx+aRZAEGs79eu5nElbMcc5TU4qo4SE4Thce/mNiAateU1aGldQWMv6qav6D/a
         MHJg==
X-Gm-Message-State: ANoB5pmQen4fJiOs31FAKlSl10NEOdad2aVdcDvXntT8zYh46EXEwvyW
        uc9HIReofDgdfdMV1tzqFhl1Bw==
X-Google-Smtp-Source: AA0mqf5O7XLKhkLnRE6lo0qQ5+WVf2QMDkYiVkkmh3KnsQdsDjNuWBtqr9w2Ssw84W3TI1WuDaFMiA==
X-Received: by 2002:adf:fc47:0:b0:22e:4953:9932 with SMTP id e7-20020adffc47000000b0022e49539932mr13484547wrs.486.1668594114246;
        Wed, 16 Nov 2022 02:21:54 -0800 (PST)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:52eb:f6ff:feb3:451a])
        by smtp.gmail.com with ESMTPSA id o5-20020a05600c510500b003b4ff30e566sm6133615wms.3.2022.11.16.02.21.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Nov 2022 02:21:53 -0800 (PST)
From:   Neil Armstrong <neil.armstrong@linaro.org>
Date:   Wed, 16 Nov 2022 11:21:53 +0100
Subject: [PATCH 6/6] i2c: qcom-geni: add support for I2C Master Hub variant
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20221114-narmstrong-sm8550-upstream-i2c-master-hub-v1-6-64449106a148@linaro.org>
References: <20221114-narmstrong-sm8550-upstream-i2c-master-hub-v1-0-64449106a148@linaro.org>
In-Reply-To: <20221114-narmstrong-sm8550-upstream-i2c-master-hub-v1-0-64449106a148@linaro.org>
To:     Rob Herring <robh+dt@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Andy Gross <agross@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>
Cc:     linux-i2c@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Neil Armstrong <neil.armstrong@linaro.org>
X-Mailer: b4 0.10.1
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The I2C Master Hub is a stripped down version of the GENI Serial Engine
QUP Wrapper Controller but only supporting I2C serial engines without
DMA support.

This adds the I2C Master Hub serial engine compatible along the
specific requirements in a new desc struct passed throug the device
match data.

Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 drivers/i2c/busses/i2c-qcom-geni.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/i2c/busses/i2c-qcom-geni.c b/drivers/i2c/busses/i2c-qcom-geni.c
index 75dd0718c5a1..bfe75038bc14 100644
--- a/drivers/i2c/busses/i2c-qcom-geni.c
+++ b/drivers/i2c/busses/i2c-qcom-geni.c
@@ -1026,8 +1026,16 @@ static const struct dev_pm_ops geni_i2c_pm_ops = {
 									NULL)
 };
 
+const struct geni_i2c_desc i2c_master_hub = {
+	.has_core_clk = true,
+	.icc_ddr = NULL,
+	.no_dma_support = true,
+	.tx_fifo_depth = 16,
+};
+
 static const struct of_device_id geni_i2c_dt_match[] = {
 	{ .compatible = "qcom,geni-i2c" },
+	{ .compatible = "qcom,geni-i2c-master-hub", .data = &i2c_master_hub },
 	{}
 };
 MODULE_DEVICE_TABLE(of, geni_i2c_dt_match);

-- 
b4 0.10.1
