Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 018457428C7
	for <lists+linux-arm-msm@lfdr.de>; Thu, 29 Jun 2023 16:47:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230466AbjF2OrK (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 29 Jun 2023 10:47:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40628 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229639AbjF2OrJ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 29 Jun 2023 10:47:09 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C3C0A1FC1
        for <linux-arm-msm@vger.kernel.org>; Thu, 29 Jun 2023 07:46:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1688049984;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=zDXFOarJFkvxNU7P1GHKG3noUeFa/ZYuvulMUbxlN1A=;
        b=UiBlvWvoeXa/QYHbksOx3L97BWXeTwJjNFqIXhx7G8W7g9CP2/bbOYavLeRhOMX8EZcE4Z
        PB5oQ53Myid8d6jbB9lmN72OtqN7qd8QlK0zijpzhU6NGq5hndvbQBPg0sIrFJHn8JRlqi
        WmL7QOm41fJAuMB/RM1hWDMk0RLOsVo=
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com
 [209.85.219.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-92-zdRNmAAUNaGtGp7kyGy1ZA-1; Thu, 29 Jun 2023 10:46:22 -0400
X-MC-Unique: zdRNmAAUNaGtGp7kyGy1ZA-1
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-63511adcf45so8712586d6.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 29 Jun 2023 07:46:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688049981; x=1690641981;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zDXFOarJFkvxNU7P1GHKG3noUeFa/ZYuvulMUbxlN1A=;
        b=XpeM0yCQoY8FI3GoBJ0UhuGmFZAqJP/UVkNDl46gdCqynLhhXxogKZUXnGUXg3lw4L
         rJqXYylWOhOtqObE2n3ip9cnbV7Bz/5GS+o/UK2+V2wyTrVMmQbGI/fB04INSl9ReRnT
         tj/gwMTqs2/j666k3UotlFyqRBSscEq2BNeW0T/fKcf4Q6ecPbV/Uk4Pf4tWdf89z9Y8
         Eq1EQ3r1XI05hUDQEd3amtLoKd+2qA37kMGH9LgNT9tkFbvZyPa80SpFpPpu6Sn4Kdi3
         Y/Jm04NNg/HYSF2NMy87P70JBTjQP6l3Znq2XYJcV9QDdr3TILzMpG1cCfuWL7ZTB7PS
         7dpA==
X-Gm-Message-State: AC+VfDzkfv9jwRhSdm3ex44+4I9fhVF0ZcnncNgbCgoZeC80z75dZ++D
        eiZ2YW28xnztgHwyKOhjwt2vtxLrTk2w59GJYEk0BaUSqFL9FjeNoPOGA4zqJuvI9wpGewJBpNb
        WD5p4H9z4YAGOgXCIH5O/BcQ9KQ==
X-Received: by 2002:a05:6214:2483:b0:635:dbb4:853e with SMTP id gi3-20020a056214248300b00635dbb4853emr15923413qvb.54.1688049981101;
        Thu, 29 Jun 2023 07:46:21 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ7CgQm3B3HQ8J0z+gAS6H/08cIkKpo/GCX/poZibomgLtQPS418bo46ORUPF/WAp8JuwB//QA==
X-Received: by 2002:a05:6214:2483:b0:635:dbb4:853e with SMTP id gi3-20020a056214248300b00635dbb4853emr15923392qvb.54.1688049980886;
        Thu, 29 Jun 2023 07:46:20 -0700 (PDT)
Received: from fedora.redhat.com ([107.171.218.122])
        by smtp.gmail.com with ESMTPSA id a17-20020a0ccdd1000000b005dd8b9345b4sm7055590qvn.76.2023.06.29.07.46.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Jun 2023 07:46:20 -0700 (PDT)
From:   Adrien Thierry <athierry@redhat.com>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Vinod Koul <vkoul@kernel.org>,
        Kishon Vijay Abraham I <kishon@kernel.org>
Cc:     Adrien Thierry <athierry@redhat.com>,
        linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org
Subject: [PATCH v4 1/3] phy: qcom-snps-femto-v2: keep cfg_ahb_clk enabled during runtime suspend
Date:   Thu, 29 Jun 2023 10:45:38 -0400
Message-Id: <20230629144542.14906-2-athierry@redhat.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230629144542.14906-1-athierry@redhat.com>
References: <20230629144542.14906-1-athierry@redhat.com>
MIME-Version: 1.0
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

In the dwc3 core, both system and runtime suspend end up calling
dwc3_suspend_common(). From there, what happens for the PHYs depends on
the USB mode and whether the controller is entering system or runtime
suspend.

HOST mode:
  (1) system suspend on a non-wakeup-capable controller

  The [1] if branch is taken. dwc3_core_exit() is called, which ends up
  calling phy_power_off() and phy_exit(). Those two functions decrease the
  PM runtime count at some point, so they will trigger the PHY runtime
  sleep (assuming the count is right).

  (2) runtime suspend / system suspend on a wakeup-capable controller

  The [1] branch is not taken. dwc3_suspend_common() calls
  phy_pm_runtime_put_sync(). Assuming the ref count is right, the PHY
  runtime suspend op is called.

DEVICE mode:
  dwc3_core_exit() is called on both runtime and system sleep
  unless the controller is already runtime suspended.

OTG mode:
  (1) system suspend : dwc3_core_exit() is called

  (2) runtime suspend : do nothing

In host mode, the code seems to make a distinction between 1) runtime
sleep / system sleep for wakeup-capable controller, and 2) system sleep
for non-wakeup-capable controller, where phy_power_off() and phy_exit()
are only called for the latter. This suggests the PHY is not supposed to
be in a fully powered-off state for runtime sleep and system sleep for
wakeup-capable controller.

Moreover, downstream, cfg_ahb_clk only gets disabled for system suspend.
The clocks are disabled by phy->set_suspend() [2] which is only called
in the system sleep path through dwc3_core_exit() [3].

With that in mind, don't disable the clocks during the femto PHY runtime
suspend callback. The clocks will only be disabled during system suspend
for non-wakeup-capable controllers, through dwc3_core_exit().

[1] https://elixir.bootlin.com/linux/v6.4/source/drivers/usb/dwc3/core.c#L1988
[2] https://git.codelinaro.org/clo/la/kernel/msm-5.4/-/blob/LV.AU.1.2.1.r2-05300-gen3meta.0/drivers/usb/phy/phy-msm-snps-hs.c#L524
[3] https://git.codelinaro.org/clo/la/kernel/msm-5.4/-/blob/LV.AU.1.2.1.r2-05300-gen3meta.0/drivers/usb/dwc3/core.c#L1915

Signed-off-by: Adrien Thierry <athierry@redhat.com>
---
 drivers/phy/qualcomm/phy-qcom-snps-femto-v2.c | 9 ---------
 1 file changed, 9 deletions(-)

diff --git a/drivers/phy/qualcomm/phy-qcom-snps-femto-v2.c b/drivers/phy/qualcomm/phy-qcom-snps-femto-v2.c
index 6c237f3cc66d..3335480fc395 100644
--- a/drivers/phy/qualcomm/phy-qcom-snps-femto-v2.c
+++ b/drivers/phy/qualcomm/phy-qcom-snps-femto-v2.c
@@ -165,22 +165,13 @@ static int qcom_snps_hsphy_suspend(struct qcom_snps_hsphy *hsphy)
 					   0, USB2_AUTO_RESUME);
 	}
 
-	clk_disable_unprepare(hsphy->cfg_ahb_clk);
 	return 0;
 }
 
 static int qcom_snps_hsphy_resume(struct qcom_snps_hsphy *hsphy)
 {
-	int ret;
-
 	dev_dbg(&hsphy->phy->dev, "Resume QCOM SNPS PHY, mode\n");
 
-	ret = clk_prepare_enable(hsphy->cfg_ahb_clk);
-	if (ret) {
-		dev_err(&hsphy->phy->dev, "failed to enable cfg ahb clock\n");
-		return ret;
-	}
-
 	return 0;
 }
 
-- 
2.40.1

