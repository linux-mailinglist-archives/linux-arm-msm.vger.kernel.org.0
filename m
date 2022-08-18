Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DBC4C59902E
	for <lists+linux-arm-msm@lfdr.de>; Fri, 19 Aug 2022 00:09:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240337AbiHRWI5 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 18 Aug 2022 18:08:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49810 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S243146AbiHRWI4 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 18 Aug 2022 18:08:56 -0400
Received: from mail-ed1-x533.google.com (mail-ed1-x533.google.com [IPv6:2a00:1450:4864:20::533])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 00A3467454;
        Thu, 18 Aug 2022 15:08:54 -0700 (PDT)
Received: by mail-ed1-x533.google.com with SMTP id q2so1430298edb.6;
        Thu, 18 Aug 2022 15:08:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc;
        bh=MRnl5EQzqjmZ04r70hPwMB9x2TzaYnZd+rj2RUNUHac=;
        b=XiJCMszoFBkqQLJLgGrong3i9NadbnPsztGlkq5+uFI8nrtaGkT7ttAAc/4HsyCcmB
         MyS0BtFifIrh/bCRRV4tBtp4EH08MZtrjhchWjldTyiLLGHgQT2XMHDnTpkven5vEEL0
         GxV3E8Oerb7xzmKFY8lMFlzPy111YwXhSg/+abKg69uh2n+/FR5XSIRmW+ofgV/5Y9VS
         OvX5cf7Wuxz9WoVUNI5cX4c3CpGXZyXzIBASE2+PaquZyQg8LdOIFKrNGjIGSV8tiMTC
         tDowbKGliw3wB6HQf2woNgJ7tcuHy5KIIcWLCd9SK3TrMQq62WeLN5aXAp+3WswXt5/+
         tShQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
        bh=MRnl5EQzqjmZ04r70hPwMB9x2TzaYnZd+rj2RUNUHac=;
        b=UlrdboPT12cs47yI6FQbUW6TMraXtLEQ2kCSDoUykUTvUNjQ076kT8es6U5j/yBFj8
         o0qOHIhg2vlf91JhLRD2kJvhdEowS71ng80ZcXLOZDAxb+xa0CUvgFpPBjYMVBxoJccH
         NJJrSDpeVYY+NZutd6I23x7sdxpxVHanOM1EsnX2rXWz80y6CWJdzCgYHiYwNYmiiMJg
         dCIkh74jssLOTiajs2+OSRp7u+e8SPnhQ15s6DwurJEuUWf7nYbJ6iR/hOCeQTmTbc9k
         6BffWTHylX1NyvrjN/xrP3Dg1hTMCTCGjbPBaCW9v7xanNDKUgFUU+nSi9bnUSmo9zyP
         mszA==
X-Gm-Message-State: ACgBeo0PTNs9L2FSLptRGTYic4Itj5m2GFRGFZD7hXCQjChadsydC6Id
        8YHB2EiejNFhPSIWeoNxOgE=
X-Google-Smtp-Source: AA6agR45+36GxXVF6+EHwdO0Nw/nAPsNrszkQ2TEnCyW/asocx6zq9YnalVzryTuHnBwsT4PZ89xwA==
X-Received: by 2002:a05:6402:90d:b0:443:ef4c:480f with SMTP id g13-20020a056402090d00b00443ef4c480fmr3714309edz.128.1660860533415;
        Thu, 18 Aug 2022 15:08:53 -0700 (PDT)
Received: from fedora.robimarko.hr (cpe-94-253-165-74.zg.cable.xnet.hr. [94.253.165.74])
        by smtp.googlemail.com with ESMTPSA id j9-20020a17090643c900b00730b61d8a5esm1385022ejn.61.2022.08.18.15.08.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Aug 2022 15:08:53 -0700 (PDT)
From:   Robert Marko <robimarko@gmail.com>
To:     agross@kernel.org, bjorn.andersson@linaro.org,
        konrad.dybcio@somainline.org, jassisinghbrar@gmail.com,
        robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        dmitry.baryshkov@linaro.org
Cc:     Robert Marko <robimarko@gmail.com>
Subject: [PATCH v9 3/4] mailbox: qcom-apcs-ipc: add IPQ8074 APSS clock support
Date:   Fri, 19 Aug 2022 00:08:48 +0200
Message-Id: <20220818220849.339732-3-robimarko@gmail.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20220818220849.339732-1-robimarko@gmail.com>
References: <20220818220849.339732-1-robimarko@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

IPQ8074 has the APSS clock controller utilizing the same register space as
the APCS, so provide access to the APSS utilizing a child device like
IPQ6018.

IPQ6018 and IPQ8074 use the same controller and driver, so just utilize
IPQ6018 match data for IPQ8074.

Signed-off-by: Robert Marko <robimarko@gmail.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
Changes in v7:
* Dont max_register modifications
* Drop custom IPQ8074 match data and use IPQ6018 one as they share the
controller and driver

Changes in v5:
* Use lower case hex for max_register
* Update the APSS clock name to match the new one without commas
---
 drivers/mailbox/qcom-apcs-ipc-mailbox.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mailbox/qcom-apcs-ipc-mailbox.c b/drivers/mailbox/qcom-apcs-ipc-mailbox.c
index 80a54d81412e..f1f0e87a79e6 100644
--- a/drivers/mailbox/qcom-apcs-ipc-mailbox.c
+++ b/drivers/mailbox/qcom-apcs-ipc-mailbox.c
@@ -142,7 +142,7 @@ static int qcom_apcs_ipc_remove(struct platform_device *pdev)
 /* .data is the offset of the ipc register within the global block */
 static const struct of_device_id qcom_apcs_ipc_of_match[] = {
 	{ .compatible = "qcom,ipq6018-apcs-apps-global", .data = &ipq6018_apcs_data },
-	{ .compatible = "qcom,ipq8074-apcs-apps-global", .data = &msm8994_apcs_data },
+	{ .compatible = "qcom,ipq8074-apcs-apps-global", .data = &ipq6018_apcs_data },
 	{ .compatible = "qcom,msm8916-apcs-kpss-global", .data = &msm8916_apcs_data },
 	{ .compatible = "qcom,msm8939-apcs-kpss-global", .data = &msm8916_apcs_data },
 	{ .compatible = "qcom,msm8953-apcs-kpss-global", .data = &msm8994_apcs_data },
-- 
2.37.2

