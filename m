Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 416AA6C8F94
	for <lists+linux-arm-msm@lfdr.de>; Sat, 25 Mar 2023 17:52:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231740AbjCYQwl (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 25 Mar 2023 12:52:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41326 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231766AbjCYQwi (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 25 Mar 2023 12:52:38 -0400
Received: from mail-pj1-x1031.google.com (mail-pj1-x1031.google.com [IPv6:2607:f8b0:4864:20::1031])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 51EBD10A87
        for <linux-arm-msm@vger.kernel.org>; Sat, 25 Mar 2023 09:52:37 -0700 (PDT)
Received: by mail-pj1-x1031.google.com with SMTP id mp3-20020a17090b190300b0023fcc8ce113so7813189pjb.4
        for <linux-arm-msm@vger.kernel.org>; Sat, 25 Mar 2023 09:52:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1679763157;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uLaFipfBdI+W5aTES7xtFhEzUuoToo9NoMDrjkoxe14=;
        b=J8kJ2HWE9zd1qQC2Q2X5bRMa/zPtKkOEXv9gjB84Jeg/lWHFLXnKV5ekJdtvYtK/C1
         FGYa4QxxQivFj/+YtyEUSqlqa0ImCwritZ12bucm5PIS/9b6qUTUDbaoWPfxXOBa2lzg
         nfT+dk3K+3u3VpGS/xkYoP781BgTZxvLi4qQgcBj055VZQowraCum6Kmh7ldoaCpaEVv
         KMqRnSAoSfh7NH2yDTNx8cM13kUOHsVwlnjiVxlB1QttjgjGyBIvS6uxjTWajQXOlZPs
         EkWWPK0Frg4DPAx8pOQ9V3Zs1JkXuyNHuwXGm+AeDeZof91CiQHYwW6IYeq3khdgzJi3
         wkWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679763157;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=uLaFipfBdI+W5aTES7xtFhEzUuoToo9NoMDrjkoxe14=;
        b=BTgUvAxBlYuK9IsbokbYNWARajU2MY2V0yUFTJHXAELi1EnibOKmyKaOTHG8RX95ng
         Zjst030A1o8kvh+C82tnBN5ONVMp3K2tPpOaxg+uN88q41eD9sBUIz9zlLEFJdZPgEVU
         Lx1in7ma5nfazTSLsX9oVCDo2GQKO3sFRY6TzOV0zmPjb81Ut4ATCff0a98rMJ0ET1kt
         AVYhCaOeMn5hxLrqXA5l3UowqgcG9TVueA3zlAF2c1bKqoKanUc1gnPjg3+0cciyIsUi
         Hwtf5J6vggAeC2jaD1fPobrJRA2XLiZIZp/A/brtKLx3mgGpAmcocKi+CBFCb+R1lhPA
         Smpg==
X-Gm-Message-State: AAQBX9cKkZB0bOMYEGFdrEb4mYhSgzGPuDYZkbdBThqzzTVXmhm/dQaM
        B9qRwHKba0f3E3kGxyHpURyH
X-Google-Smtp-Source: AKy350YKKHNCx7DUvd6DRGf99QA2MoJ8mSIFRxicZz7eVqtI5GcFp6aaystUQRGrQRWgNgZ9oZR7eQ==
X-Received: by 2002:a17:903:24d:b0:19e:ecaf:c4b4 with SMTP id j13-20020a170903024d00b0019eecafc4b4mr7805323plh.4.1679763157021;
        Sat, 25 Mar 2023 09:52:37 -0700 (PDT)
Received: from localhost.localdomain ([117.217.184.99])
        by smtp.gmail.com with ESMTPSA id p5-20020a1709026b8500b001a1aeb3a7a9sm14889787plk.137.2023.03.25.09.52.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 25 Mar 2023 09:52:36 -0700 (PDT)
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     andersson@kernel.org, Thinh.Nguyen@synopsys.com,
        gregkh@linuxfoundation.org, mathias.nyman@intel.com
Cc:     konrad.dybcio@linaro.org, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, linux-arm-msm@vger.kernel.org,
        linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Subject: [PATCH 2/5] xhci: host: Use 200ms autosuspend delay for runtime suspend
Date:   Sat, 25 Mar 2023 22:22:14 +0530
Message-Id: <20230325165217.31069-3-manivannan.sadhasivam@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230325165217.31069-1-manivannan.sadhasivam@linaro.org>
References: <20230325165217.31069-1-manivannan.sadhasivam@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
        DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On the Qcom platforms making use of DWC3 IP, xhci IRQs are received after
some delay while resuming from runtime suspend. Due to this, the xhci
driver once resumed, quickly goes into runtime suspend mode again, thus
deferring the usb enumeration.

So let's add a 200ms autosuspend delay to the xhci driver so that it get's
enough time to catch the IRQs.

Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
---
 drivers/usb/host/xhci-plat.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/usb/host/xhci-plat.c b/drivers/usb/host/xhci-plat.c
index b9f9625467d6..f09510d3effe 100644
--- a/drivers/usb/host/xhci-plat.c
+++ b/drivers/usb/host/xhci-plat.c
@@ -173,6 +173,8 @@ int xhci_plat_probe(struct platform_device *pdev, struct device *sysdev, const s
 		return ret;
 
 	pm_runtime_set_active(&pdev->dev);
+	pm_runtime_set_autosuspend_delay(&pdev->dev, 200);
+	pm_runtime_use_autosuspend(&pdev->dev);
 	pm_runtime_enable(&pdev->dev);
 	pm_runtime_get_noresume(&pdev->dev);
 
-- 
2.25.1

