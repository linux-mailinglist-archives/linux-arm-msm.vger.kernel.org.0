Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8AA6F73BC34
	for <lists+linux-arm-msm@lfdr.de>; Fri, 23 Jun 2023 17:58:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229673AbjFWP6H (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 23 Jun 2023 11:58:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58712 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232179AbjFWP6F (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 23 Jun 2023 11:58:05 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 04D692113
        for <linux-arm-msm@vger.kernel.org>; Fri, 23 Jun 2023 08:57:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1687535846;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding;
        bh=8yB7HqTroWEhP9efqg+b7pKLnUsqA1PuT3Ijl2qFi+4=;
        b=NxPwH1rdh8GVReKolL0r+HeHdDDt4ZaZYoF6g6i4sWcXb3pqoDmho3pc9yO+1YcSFbbamZ
        0RNlWBY6V2uJ/VNfoCM1u7lp+Ak2zB1jxicoxv52/e7xRpZJ3/9HacK7DrlwPuRYHbHAAA
        EQ0CxGrLr3kAAcUQTTEsp730ozPuAJM=
Received: from mail-ot1-f72.google.com (mail-ot1-f72.google.com
 [209.85.210.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-500-3INbZcR_MH6OIIskiqVNWQ-1; Fri, 23 Jun 2023 11:57:24 -0400
X-MC-Unique: 3INbZcR_MH6OIIskiqVNWQ-1
Received: by mail-ot1-f72.google.com with SMTP id 46e09a7af769-6b4541c5cc5so599093a34.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 23 Jun 2023 08:57:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687535844; x=1690127844;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8yB7HqTroWEhP9efqg+b7pKLnUsqA1PuT3Ijl2qFi+4=;
        b=PSmsPCZurF9c5Ocd2cXMJWwa2wbh2jb+v0R0vnbHuIpQ4UVYb/XTG053gJ2rgyiU/p
         +59oW+Z9elh7mqUCMXrFB9eeoWhgrQFL27iPF1DRqkVRrF8PZBuDYHVPcIF3B8Xc7GPz
         y7+94qTESWb7Q5Z/e+/bKjYHaWNc4DJ8IcAIP2sfw308jyUcUybeXzupcDJApJLW3C2M
         zx4Pnosc3T16ZeNT3lAHoIw7VCRdvadT9+SM+Ur8mwydNQYH4ujNJ9TpRdEcPRd8iaEG
         HQRQZpWX9/MWyuiNdGxJJFPY2bVPN5LW2ZGreQB/2OkCk8ZvTy7gSpngTe6HjsN3rUvq
         F1XQ==
X-Gm-Message-State: AC+VfDzrYkyPIyOObrFQxPFk6j1+qiXwxU7+eT4OfYtKvUu+nrrF1ol4
        KJ8XSUuFtzN7mvyfUdF4HwMZZTxME28QzgT4QR6SPkZGs6DqDuk00LDsBUIWG4urY9dlHmdNp8b
        mSQHHr01qVishlIif/B0qUFIOpA==
X-Received: by 2002:a9d:7414:0:b0:6b7:296d:3d4e with SMTP id n20-20020a9d7414000000b006b7296d3d4emr980458otk.30.1687535843982;
        Fri, 23 Jun 2023 08:57:23 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ6nubFY5xAfbSlXYXWVWjad3VSMli+Q/HTHaXj169kXem2BAiF1sIv7sOY1ukVSIq+NyDYRnA==
X-Received: by 2002:a9d:7414:0:b0:6b7:296d:3d4e with SMTP id n20-20020a9d7414000000b006b7296d3d4emr980442otk.30.1687535843646;
        Fri, 23 Jun 2023 08:57:23 -0700 (PDT)
Received: from halaney-x13s.redhat.com ([2600:1700:1ff0:d0e0::f])
        by smtp.gmail.com with ESMTPSA id w17-20020a9d6391000000b006ac75cff491sm3883758otk.3.2023.06.23.08.57.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Jun 2023 08:57:23 -0700 (PDT)
From:   Andrew Halaney <ahalaney@redhat.com>
To:     linux-kernel@vger.kernel.org
Cc:     linux-pm@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        viresh.kumar@linaro.org, rafael@kernel.org,
        konrad.dybcio@linaro.org, andersson@kernel.org, agross@kernel.org,
        Andrew Halaney <ahalaney@redhat.com>
Subject: [PATCH] cpufreq: qcom-cpufreq-hw: Use dev_err_probe() when failing to get icc paths
Date:   Fri, 23 Jun 2023 10:57:07 -0500
Message-Id: <20230623155707.944272-1-ahalaney@redhat.com>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
Content-type: text/plain
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H5,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

This way, if there's an issue (in this case a -EPROBE_DEFER), you can
get useful output:

    [root@dhcp19-243-150 ~]# cat /sys/kernel/debug/devices_deferred
    18591000.cpufreq        qcom-cpufreq-hw: Failed to find icc paths

Signed-off-by: Andrew Halaney <ahalaney@redhat.com>
---
 drivers/cpufreq/qcom-cpufreq-hw.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/cpufreq/qcom-cpufreq-hw.c b/drivers/cpufreq/qcom-cpufreq-hw.c
index a78d7a27b4b5..f2830371d25f 100644
--- a/drivers/cpufreq/qcom-cpufreq-hw.c
+++ b/drivers/cpufreq/qcom-cpufreq-hw.c
@@ -661,7 +661,7 @@ static int qcom_cpufreq_hw_driver_probe(struct platform_device *pdev)
 
 	ret = dev_pm_opp_of_find_icc_paths(cpu_dev, NULL);
 	if (ret)
-		return ret;
+		return dev_err_probe(dev, ret, "Failed to find icc paths\n");
 
 	for (num_domains = 0; num_domains < MAX_FREQ_DOMAINS; num_domains++)
 		if (!platform_get_resource(pdev, IORESOURCE_MEM, num_domains))
-- 
2.40.1

