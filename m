Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id EC7A363BA7E
	for <lists+linux-arm-msm@lfdr.de>; Tue, 29 Nov 2022 08:20:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229650AbiK2HUc (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 29 Nov 2022 02:20:32 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55668 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229516AbiK2HUa (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 29 Nov 2022 02:20:30 -0500
Received: from mail-pj1-x102f.google.com (mail-pj1-x102f.google.com [IPv6:2607:f8b0:4864:20::102f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E3A513D92B
        for <linux-arm-msm@vger.kernel.org>; Mon, 28 Nov 2022 23:20:29 -0800 (PST)
Received: by mail-pj1-x102f.google.com with SMTP id mv18so11860406pjb.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 28 Nov 2022 23:20:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=nk7huhcKUdur/bL8fncvnthF1FpIP2fAlI/wrAUM6S8=;
        b=DbpHADt0dG20TTBh9ffFlj+6EL8CwfUV4dpMJqegGzAyeCirCLf76zjIGSLeC9Ofdf
         GUDbP22Go+b/YNqGKhZkn9GDmthMesqLgJgrl5cPRs0gEYPZc/sycMx2bL+JjImij2cH
         lvDOcaPrvKluWfIMKwgZWPpyQSBRd0z4Zyrwd0necIU+uKdvs/Lf4IaKQ3ABINeJpAt0
         gkV/pW+yF8WmFHGh2LdAu9gYK+NCIvx1sRXkm/xAydLMccxmsTUfunobSP8duEFcFEIA
         B8hMNOdJM0lFhHbvjQuM5pAXbvYZOZC4Fhk5KQHkYZcH226X0GKugZECl505oegsG9qz
         9dIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nk7huhcKUdur/bL8fncvnthF1FpIP2fAlI/wrAUM6S8=;
        b=3zUEe8uJYSUHnRt8NNTZUT5JGyeT3GGbgDEWJ9dWn6juns7T8mf2fHv7MfqVxqW0SJ
         sc/o77cpS6Oc4jRAuuUnbgB767WYE1hBjY6Y9xlcFxBnPET9QbbDDhllVodONXT5OVlE
         Lo0RbQGRHP0g2QD0AW9+aiVlg+cm7mqI3U3d/m6Q5WWcbDj7XLhsgb8+cowZYyOGy7Ng
         fqzcL/u1WrcVUcmebHtTy1y6/yelPYofbRSwsIWoCJUOmVNn64uft3ORpBEzvC+GQS2L
         E9f7yvSPB4r/zvmS6Fvk37of775UNZqAoXknlkqz+dtnRWZv8/q0+3i1O7G9wxrBuVjH
         HCAA==
X-Gm-Message-State: ANoB5pn+Jya3vBZoQSyxrixqjn2nMsgrv0lg27J5w+RMN83ct23lVdGw
        HUgo9IbTOlKaUZoJNUosZkhv
X-Google-Smtp-Source: AA0mqf7yHPUObbOx/We3QSPJGxg4z0TOelOSHkx62Muk5DmgOn1/8yBTxuw/rEhrrw2mbsqJyGM0lg==
X-Received: by 2002:a17:90a:4206:b0:213:2039:64c2 with SMTP id o6-20020a17090a420600b00213203964c2mr64619947pjg.165.1669706429415;
        Mon, 28 Nov 2022 23:20:29 -0800 (PST)
Received: from localhost.localdomain ([117.248.1.95])
        by smtp.gmail.com with ESMTPSA id k13-20020aa7998d000000b0056c3d3f5a8dsm9200189pfh.56.2022.11.28.23.20.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Nov 2022 23:20:28 -0800 (PST)
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     krzysztof.kozlowski@linaro.org, andersson@kernel.org
Cc:     konrad.dybcio@somainline.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
        stable@vger.kernel.org
Subject: [PATCH] soc: qcom: Select REMAP_MMIO for ICC_BWMON driver
Date:   Tue, 29 Nov 2022 12:50:22 +0530
Message-Id: <20221129072022.41962-1-manivannan.sadhasivam@linaro.org>
X-Mailer: git-send-email 2.25.1
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

ICC_BWMON driver uses REGMAP_MMIO for accessing the hardware registers.
So select the dependency in Kconfig. Without this, there will be errors
while building the driver with COMPILE_TEST only:

ERROR: modpost: "__devm_regmap_init_mmio_clk" [drivers/soc/qcom/icc-bwmon.ko] undefined!
make[1]: *** [scripts/Makefile.modpost:126: Module.symvers] Error 1
make: *** [Makefile:1944: modpost] Error 2

Cc: <stable@vger.kernel.org> # 6.0
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Fixes: b9c2ae6cac40 ("soc: qcom: icc-bwmon: Add bandwidth monitoring driver")
Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
---
 drivers/soc/qcom/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/soc/qcom/Kconfig b/drivers/soc/qcom/Kconfig
index 024e420f1bb7..75bfdb6f9705 100644
--- a/drivers/soc/qcom/Kconfig
+++ b/drivers/soc/qcom/Kconfig
@@ -236,6 +236,7 @@ config QCOM_ICC_BWMON
 	tristate "QCOM Interconnect Bandwidth Monitor driver"
 	depends on ARCH_QCOM || COMPILE_TEST
 	select PM_OPP
+	select REGMAP_MMIO
 	help
 	  Sets up driver monitoring bandwidth on various interconnects and
 	  based on that voting for interconnect bandwidth, adjusting their
-- 
2.25.1

