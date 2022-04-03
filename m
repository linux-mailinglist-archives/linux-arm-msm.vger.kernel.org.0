Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 879274F0C50
	for <lists+linux-arm-msm@lfdr.de>; Sun,  3 Apr 2022 21:39:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1376346AbiDCTlK (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 3 Apr 2022 15:41:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47194 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1376343AbiDCTlJ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 3 Apr 2022 15:41:09 -0400
Received: from mail-lj1-x231.google.com (mail-lj1-x231.google.com [IPv6:2a00:1450:4864:20::231])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3FC8525C60
        for <linux-arm-msm@vger.kernel.org>; Sun,  3 Apr 2022 12:39:15 -0700 (PDT)
Received: by mail-lj1-x231.google.com with SMTP id h11so10435713ljb.2
        for <linux-arm-msm@vger.kernel.org>; Sun, 03 Apr 2022 12:39:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=5rsvtMMbZoOS+67ZIO2DM9+Ug7jLfSEpG9+8l7xpvVA=;
        b=o+w7bS977Ksu3dfVgd3AOxz/N0DRVj5jCmcaugo1MjwFPlMqGtOz+b/GnY10P1X4Bu
         9Gj6BU4y5uDNvSkv1RXwLm9N01/OMswlrzglyeaEOf2l2ILpI+e9H6hKmFx+YeYqE7N+
         mQdeM96lCpjp/uLniLenv0yl6MUSjsjw8KaV/cIX4yWjAZ1IuMjMcIWVTfOocuhWaAO2
         F/TZb2l2E9v3I6fvpoYMj/d9k2ionD6QfIzZxI0Namg2SNeeYgZ6vAKIITyRngRs/rzQ
         GEypabp0ZU87ttnEQ/QoygPX8QZ2LOLAwCoC1AGO8OokYf5+UqGGH7NS0Tjke68ATM9N
         AS9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=5rsvtMMbZoOS+67ZIO2DM9+Ug7jLfSEpG9+8l7xpvVA=;
        b=AppHR8+XcOturh/UvouFMwY3wO5CTCL2xqTi8+tKWMp0rBa72zrZRVPO6UodhsGV5u
         vqg2DvYH/6G+wSD4mIJs6LW8x4XJbmTDlFLvur/+NWhLPa+1N5d+500rOySJYj6jhHUC
         j29T9G/+++96dmfvd0+QfzCmpwOs5Bxl1yWFWBZqnkmK9ZQ/vtRdGQwz1alW9JeztZf8
         n9b1Zi5UgZbxBtalCRyRNQP9PLQCDjWM7aZolhn4OhwXiS5bw7OiiQs2mC2PRBu5rODL
         IayXfoMpI7zv7q9svNzq4XoEfhRic9sWsE9mhRl/JQYIRE18b3sS3SuveqJvMFR6a/fr
         f6PQ==
X-Gm-Message-State: AOAM5324iU34slAfUW5msn3/N1BJnKFsTwwr6rC3qfW9SQLDAVHLgE8e
        rIPAvMP9TaTygvBCBXy9nHrPHg==
X-Google-Smtp-Source: ABdhPJwgEKG3QCsYO87moN1VdSlYeEa9hwI3c0Ze/ClMkPZtLbOYYwhgWox/HQ3Zp5HKViKm6ur0Lg==
X-Received: by 2002:a2e:a717:0:b0:24b:b51:5809 with SMTP id s23-20020a2ea717000000b0024b0b515809mr5633083lje.498.1649014753484;
        Sun, 03 Apr 2022 12:39:13 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id y37-20020a0565123f2500b0044a1e1c6b37sm900903lfa.53.2022.04.03.12.39.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 03 Apr 2022 12:39:12 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org,
        Yassine Oudjana <y.oudjana@protonmail.com>
Subject: [PATCH 1/2] remoteproc: qcom: q6v5-mss: add powerdomains to MSM8996 config
Date:   Sun,  3 Apr 2022 22:39:10 +0300
Message-Id: <20220403193911.1393920-2-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220403193911.1393920-1-dmitry.baryshkov@linaro.org>
References: <20220403193911.1393920-1-dmitry.baryshkov@linaro.org>
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

MSM8996 follows the rest of MSS devices and requires a vote on MX and CX
power domains. Add corresponding entry to the device data.

Fixes: 4760a896be88 ("remoteproc: q6v5-mss: Vote for rpmh power domains")
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/remoteproc/qcom_q6v5_mss.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/remoteproc/qcom_q6v5_mss.c b/drivers/remoteproc/qcom_q6v5_mss.c
index 43ea8455546c..3b391a196fb4 100644
--- a/drivers/remoteproc/qcom_q6v5_mss.c
+++ b/drivers/remoteproc/qcom_q6v5_mss.c
@@ -2176,6 +2176,11 @@ static const struct rproc_hexagon_res msm8996_mss = {
 			"mnoc_axi",
 			NULL
 	},
+	.proxy_pd_names = (char*[]){
+			"mx",
+			"cx",
+			NULL
+	},
 	.need_mem_protection = true,
 	.has_alt_reset = false,
 	.has_mba_logs = false,
-- 
2.35.1

