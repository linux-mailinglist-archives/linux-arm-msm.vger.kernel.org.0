Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 98598583D96
	for <lists+linux-arm-msm@lfdr.de>; Thu, 28 Jul 2022 13:38:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236226AbiG1LiD (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 28 Jul 2022 07:38:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39150 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236063AbiG1Lh7 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 28 Jul 2022 07:37:59 -0400
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com [IPv6:2a00:1450:4864:20::136])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 82E6451421
        for <linux-arm-msm@vger.kernel.org>; Thu, 28 Jul 2022 04:37:58 -0700 (PDT)
Received: by mail-lf1-x136.google.com with SMTP id b16so2419462lfb.7
        for <linux-arm-msm@vger.kernel.org>; Thu, 28 Jul 2022 04:37:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=6jxkS7/ms1db5yL2dzxTICIKKExj7puACAAi6Hsp2r4=;
        b=BP4WxWJfZP9C0iIqVnO6veQ7kEEeQwbnrYoi//uSqcoG6QACxPT+Hsm4WbZqkDH/Rm
         xy2OeGxKmVE6RgUw36lYlYjPUlr8intYwl8bfAzC5HBFkbCj4v/JLwb6AoxbrhudicaI
         HvJCPzymY8590cxiEZBq+cJhGqlOY5xktGllTMqohiIuCw6nbpD1fsi+lZbp5yUaF0BD
         v9FLRNFzsOzgq2DPWuZGFT7xS+wNTbmnuDpjMhmDU9ZXUVnq6WhzblLR89ORjNJW4/zg
         5/kE2AfKb+ZnrCZZB+ndmQRP5BPTBcB0EFJE3VwdLi3wMNvaLKOs5ZBD7FSIwqH6jPAf
         mDAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=6jxkS7/ms1db5yL2dzxTICIKKExj7puACAAi6Hsp2r4=;
        b=dh3+/sT3InWu/MYqs44cYDGbM1M9UuunPkjomdyPzmh6ISvJtoE07remEAsi/HaLF8
         VchvwkTOn0rndovOYwI3FUPBZGXiv3DkOP5RVF/SQOCLRtVVUm0N4rX0UPa4TKpsnK58
         BCILu4p4wB5+JjFOELmQj1I6R84wEr0Ewu803Qp0bRa6/5AWtcTaJ8z5rJ7s1ozVj6Uq
         z+RPCDP/x/Xs6gQ0Jqrj6HdFJCwyDRP7N4N6qPh9rNvStyibxfoLKeTUlLz21TVSiKqn
         zz5gpbwf7b7b24bZNh+C0yQ6ftlJwm6t9vCjf39aVFtZSxkwMdVXP4xNmBEhosFYudsz
         z+Yw==
X-Gm-Message-State: AJIora/HtknUjJSta1KgerYZZ9DQU7mnGwGgds9DtE6LyY7pKXUTeI6d
        5gTO4OarDcIe15PIswmyBJo0KA==
X-Google-Smtp-Source: AGRyM1vqo2kECSeNqRT/11i8yeK+k68/7tONmD12YcAGOuzStG6+YPxeGukes24HgLmGopZ6zJSjHA==
X-Received: by 2002:a05:6512:1690:b0:48a:c5b6:17cc with SMTP id bu16-20020a056512169000b0048ac5b617ccmr1028550lfb.375.1659008276907;
        Thu, 28 Jul 2022 04:37:56 -0700 (PDT)
Received: from krzk-bin.lan (78-26-46-173.network.trollfjord.no. [78.26.46.173])
        by smtp.gmail.com with ESMTPSA id l12-20020a2ea80c000000b0025e0396786dsm98192ljq.93.2022.07.28.04.37.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 Jul 2022 04:37:56 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Georgi Djakov <djakov@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        linux-arm-msm@vger.kernel.org, linux-pm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     Rajendra Nayak <quic_rjendra@quicinc.com>,
        Sibi Sankar <quic_sibis@quicinc.com>
Subject: [PATCH v2 03/11] soc: qcom: icc-bwmon: drop unused registers
Date:   Thu, 28 Jul 2022 13:37:40 +0200
Message-Id: <20220728113748.170548-4-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220728113748.170548-1-krzysztof.kozlowski@linaro.org>
References: <20220728113748.170548-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

BWMON_GLOBAL_IRQ_STATUS and BWMON_ZONE_COUNT defines are not used.

Cc: Rajendra Nayak <quic_rjendra@quicinc.com>
Cc: Sibi Sankar <quic_sibis@quicinc.com>
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Reviewed-by: Sibi Sankar <quic_sibis@quicinc.com>
---
 drivers/soc/qcom/icc-bwmon.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/soc/qcom/icc-bwmon.c b/drivers/soc/qcom/icc-bwmon.c
index 3415f42523cd..9295ea04356a 100644
--- a/drivers/soc/qcom/icc-bwmon.c
+++ b/drivers/soc/qcom/icc-bwmon.c
@@ -31,7 +31,6 @@
 /* Internal sampling clock frequency */
 #define HW_TIMER_HZ				19200000
 
-#define BWMON_GLOBAL_IRQ_STATUS			0x0
 #define BWMON_GLOBAL_IRQ_CLEAR			0x8
 #define BWMON_GLOBAL_IRQ_ENABLE			0xc
 #define BWMON_GLOBAL_IRQ_ENABLE_ENABLE		BIT(0)
@@ -105,7 +104,6 @@
 
 /* BWMONv4 count registers use count unit of 64 kB */
 #define BWMON_COUNT_UNIT_KB			64
-#define BWMON_ZONE_COUNT			0x2d8
 #define BWMON_ZONE_MAX(zone)			(0x2e0 + 4 * (zone))
 
 struct icc_bwmon_data {
-- 
2.34.1

