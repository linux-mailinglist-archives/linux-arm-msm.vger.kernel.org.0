Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8E1CA4F98E8
	for <lists+linux-arm-msm@lfdr.de>; Fri,  8 Apr 2022 17:02:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234907AbiDHPC6 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 8 Apr 2022 11:02:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48618 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237414AbiDHPCy (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 8 Apr 2022 11:02:54 -0400
Received: from mail-pj1-x1029.google.com (mail-pj1-x1029.google.com [IPv6:2607:f8b0:4864:20::1029])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CA61A31C41C
        for <linux-arm-msm@vger.kernel.org>; Fri,  8 Apr 2022 08:00:49 -0700 (PDT)
Received: by mail-pj1-x1029.google.com with SMTP id e8-20020a17090a118800b001cb13402ea2so5450583pja.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 08 Apr 2022 08:00:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=HRWUAlNBur3Yy5C0NRAoK2xdzrJ+Jexf+aRU2zrKWJc=;
        b=bf3suufmkspeWIJ1fa0tczHNYnLVzf8qgkWOY7NpPyLB3Rb08foLy5byCD4zs0v+qi
         1oLoJtCuS2OlMoGaeO34Gbl2+HLaUlHo2ymX+6d7SH6eKLpe/RKiqbMtF0MoP5gcYNBy
         K2oZ6T7d6by0XhvAq4hIy3cMTZjsmag6UR9s7y5LBhSemBQ5RPwTvbfNGAzPMXKXs6vt
         zGkaPMMzwxCx+P2WdIJVwu4DzrnG2uwU2Zhdz/Kniuvxxa9YCvBwkow4rZlQX0QFHQ3z
         zBOmOnLPJKGGp96kNae9MY9rE+4FJON/OOXGVaCVau4GbqMKBF/5i+7QJs+0sv41qlAz
         6W7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=HRWUAlNBur3Yy5C0NRAoK2xdzrJ+Jexf+aRU2zrKWJc=;
        b=FGnSDXIzfoUH6ZJAm71pd341RZ3aKq8OsD8fYsKhmOESKmrKPWDv6rL5xgn0RMuthI
         6Q3QGndNWomG4DkjQ5iCkvJslBvQzymQ7YGa1z+GdyjR2vxH3jRt9yXqnl81P6jv6QRk
         ByKkKt6wK6G+RZi64NmVTAi1/K6x3UwvpT+/0aFQtq66eQeX6sf/3yG6zz483FU2llDz
         ZRP+ix8kacBORhWgy/PG4UOqmQqTOXfaHW53e5IYnHRCg1878zbbaoa+wPzX4Jb/EaeU
         h9OVgCmbdEJQklY7xP1fNL5Jgz3OBbMX1tUHV2fMMI218WBLMdBNsKp7ptShuje2qvte
         wrHg==
X-Gm-Message-State: AOAM531gKogfJw1laV0UthUCcV6m8VTxkoIUe4lX4kvUnb1Al3qsRGcb
        lODy+OuL3eIDko3TUroSVKal
X-Google-Smtp-Source: ABdhPJy72wqAoAwBFvzJmgBCIEukHMQLwiiNKaYUPf4htSfYlBfB92ze7uyzufyeXBx3xOxeYOLhMw==
X-Received: by 2002:a17:90b:1c03:b0:1c7:5523:6a27 with SMTP id oc3-20020a17090b1c0300b001c755236a27mr22325188pjb.29.1649430048703;
        Fri, 08 Apr 2022 08:00:48 -0700 (PDT)
Received: from localhost.localdomain ([59.92.100.79])
        by smtp.gmail.com with ESMTPSA id s35-20020a056a001c6300b004fb20b5d6c1sm26214636pfw.40.2022.04.08.08.00.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 Apr 2022 08:00:48 -0700 (PDT)
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     mhi@lists.linux.dev
Cc:     quic_hemantk@quicinc.com, quic_bbhatt@quicinc.com,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        loic.poulain@linaro.org,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
        stable@vger.kernel.org
Subject: [PATCH v2] bus: mhi: host: pci_generic: Flush recovery worker during freeze
Date:   Fri,  8 Apr 2022 20:30:39 +0530
Message-Id: <20220408150039.17297-1-manivannan.sadhasivam@linaro.org>
X-Mailer: git-send-email 2.25.1
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

It is possible that the recovery work might be running while the freeze
gets executed (during hibernation etc.,). Currently, we don't powerdown
the stack if it is not up but if the recovery work completes after freeze,
then the device will be up afterwards. This will not be a sane situation.

So let's flush the recovery worker before trying to powerdown the device.

Cc: stable@vger.kernel.org
Fixes: 5f0c2ee1fe8d ("bus: mhi: pci-generic: Fix hibernation")
Reported-by: Bhaumik Vasav Bhatt <quic_bbhatt@quicinc.com>
Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
---

Changes in v2:

* Switched to flush_work() as the workqueue used is global one.

 drivers/bus/mhi/host/pci_generic.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/bus/mhi/host/pci_generic.c b/drivers/bus/mhi/host/pci_generic.c
index ef85dbfb3216..541ced27d941 100644
--- a/drivers/bus/mhi/host/pci_generic.c
+++ b/drivers/bus/mhi/host/pci_generic.c
@@ -1060,6 +1060,7 @@ static int __maybe_unused mhi_pci_freeze(struct device *dev)
 	 * the intermediate restore kernel reinitializes MHI device with new
 	 * context.
 	 */
+	flush_work(&mhi_pdev->recovery_work);
 	if (test_and_clear_bit(MHI_PCI_DEV_STARTED, &mhi_pdev->status)) {
 		mhi_power_down(mhi_cntrl, true);
 		mhi_unprepare_after_power_down(mhi_cntrl);
-- 
2.25.1

