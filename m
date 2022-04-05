Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9268B4F4006
	for <lists+linux-arm-msm@lfdr.de>; Tue,  5 Apr 2022 23:10:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234332AbiDEPYm (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 5 Apr 2022 11:24:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42362 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1350076AbiDEOOW (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 5 Apr 2022 10:14:22 -0400
Received: from mail-pf1-x432.google.com (mail-pf1-x432.google.com [IPv6:2607:f8b0:4864:20::432])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E2301EA34F
        for <linux-arm-msm@vger.kernel.org>; Tue,  5 Apr 2022 05:59:18 -0700 (PDT)
Received: by mail-pf1-x432.google.com with SMTP id x31so11989572pfh.9
        for <linux-arm-msm@vger.kernel.org>; Tue, 05 Apr 2022 05:59:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=YnItvGxT8i10DQes1NCRhX/bTChJJvk7adiGCya/CXU=;
        b=kYd6uPNbAu0E4FGtIi3vUxffLxSDAXLS6yCvqDKpgqCxQOwD87YmeokiiY3ycbDKZg
         pjEN4vbUeMxf6Ij1eqFLn10jBOB9MQxBojm4/l5U+aABqVLNFH9o5ySL4o+soz2I1k4H
         6vB/9oxt9imbUJH/j8Vt5ZvDAciujpAr6VNZDqIRojeSK9fijq9WyjDVVM1VeIAb+hfW
         Yad7IA/e9fM8vkB/rftX2ijFzDYlTZ7EtEaH+3dHonGSZkuxceEenQXjVUfDib758w3f
         eOIu4oeU4SqFYPljUghYYLBI70epYKwCcO9lc7sIJrN2DOg6UAVjmV7iXBhHGZPQ9d/+
         dKEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=YnItvGxT8i10DQes1NCRhX/bTChJJvk7adiGCya/CXU=;
        b=gsu9A2B+nYellN1v3B77iwVsxSagVmlZlayD6BGDl8QwmR1Ek0w+rOfCEFTy3Qh2UY
         F7+VRw2WnZRPrVbEkGbImPlzEqh+Ne4Um8kRIi8V49JqT//xKkx6PTr/4Ts7pxaCef+x
         4jzpSLGeoRgtZTcf3ZLFFdNpKNHAO/fgn9tcaYHPj47j5mALlxLnByd3O2oBWEMqAurd
         AaQU+EFGM/+NMyiG7e5cXG7TvTc2Zx7xse+9Wbgq4cW0gpI97T0+GgOZmbIwwPrEO29u
         SttKOWy9ZMmY3UgsjbfTYRVs/o6UULC4B6r4Pn2kUUTlMOW9uTa+AbK5w8DHndSdspYj
         YCrg==
X-Gm-Message-State: AOAM532JI5sCjgZSKwEzXWCVaQvx5AJo9rPtnPL8zHypTl51Fo7NfnhC
        yFuU8EBK7I/osClpqb5AO4jC
X-Google-Smtp-Source: ABdhPJwbPWA5TgQQhTcEfxswEhUbXEP0D+yJWQtU0Mfoo7/ZuGdjdohoTgBof9AHBKzvU5/03Sz/6Q==
X-Received: by 2002:a65:434b:0:b0:382:4fa9:3be6 with SMTP id k11-20020a65434b000000b003824fa93be6mr2739082pgq.459.1649163558282;
        Tue, 05 Apr 2022 05:59:18 -0700 (PDT)
Received: from localhost.localdomain ([59.92.98.98])
        by smtp.gmail.com with ESMTPSA id j8-20020a17090a060800b001c7936791d1sm2384377pjj.7.2022.04.05.05.59.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Apr 2022 05:59:17 -0700 (PDT)
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     mhi@lists.linux.dev
Cc:     quic_hemantk@quicinc.com, quic_bbhatt@quicinc.com,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        loic.poulain@linaro.org,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
        stable@vger.kernel.org
Subject: [PATCH v2] bus: mhi: host: pci_generic: Add missing poweroff() PM callback
Date:   Tue,  5 Apr 2022 18:29:07 +0530
Message-Id: <20220405125907.5644-1-manivannan.sadhasivam@linaro.org>
X-Mailer: git-send-email 2.25.1
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

During hibernation process, once thaw() stage completes, the MHI endpoint
devices will be in M0 state post recovery. After that, the devices will be
powered down so that the system can enter the target sleep state. During
this stage, the PCI core will put the devices in D3hot. But this transition
is allowed by the MHI spec. The devices can only enter D3hot when it is in
M3 state.

So for fixing this issue, let's add the poweroff() callback that will get
executed before putting the system in target sleep state during
hibernation. This callback will power down the device properly so that it
could be restored during restore() or thaw() stage.

Cc: stable@vger.kernel.org
Fixes: 5f0c2ee1fe8d ("bus: mhi: pci-generic: Fix hibernation")
Reported-by: Hemant Kumar <quic_hemantk@quicinc.com>
Suggested-by: Hemant Kumar <quic_hemantk@quicinc.com>
Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
---

Changes in v2:

* Hemant suggested to use restore function for poweroff() callback as we can
make sure that the device gets powered down properly.

 drivers/bus/mhi/host/pci_generic.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/bus/mhi/host/pci_generic.c b/drivers/bus/mhi/host/pci_generic.c
index 9527b7d63840..ef85dbfb3216 100644
--- a/drivers/bus/mhi/host/pci_generic.c
+++ b/drivers/bus/mhi/host/pci_generic.c
@@ -1085,6 +1085,7 @@ static const struct dev_pm_ops mhi_pci_pm_ops = {
 	.resume = mhi_pci_resume,
 	.freeze = mhi_pci_freeze,
 	.thaw = mhi_pci_restore,
+	.poweroff = mhi_pci_freeze,
 	.restore = mhi_pci_restore,
 #endif
 };
-- 
2.25.1

