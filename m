Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8E8275A6B61
	for <lists+linux-arm-msm@lfdr.de>; Tue, 30 Aug 2022 19:55:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232164AbiH3RzA (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 30 Aug 2022 13:55:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58524 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231891AbiH3Ryg (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 30 Aug 2022 13:54:36 -0400
Received: from mail-lj1-x229.google.com (mail-lj1-x229.google.com [IPv6:2a00:1450:4864:20::229])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D294113EAE
        for <linux-arm-msm@vger.kernel.org>; Tue, 30 Aug 2022 10:52:17 -0700 (PDT)
Received: by mail-lj1-x229.google.com with SMTP id s15so7045912ljp.5
        for <linux-arm-msm@vger.kernel.org>; Tue, 30 Aug 2022 10:52:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc;
        bh=sc5HxHmlEPh4tH86ykJVfO3JOxEms3jA1Un8zaoNfDc=;
        b=ewGMkAiae9VuZkt4oRyIeJ/oPXeBsBitYVe3mfJD7hFMno1cINAZb4OxH2DS8r+EAn
         i1OkVYlRf9fHLgBcAAfduWzaNibqKm5TjARI9LTYey03wRkAX/3NR2oFjVmNoh4eSJ65
         0yNRuTNsRz51WGkG4aHctkKtRQeNXyY3FfwxE9jYmmFC4GXL8mmvr0DU06/OwMqBDYEQ
         4mA1WcjpJ+wsOH2uuAlTqCLhHjFj/Y65dWMFWkFDMpIkT3ZqwZNA6R2H6vgImijTynGh
         Ymzg8lYvhv7Slk8oUSiyu2uWVL4A6nHoShpudcoCs1SO7reDcunMRvZkudjbA592vsBk
         Yl6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
        bh=sc5HxHmlEPh4tH86ykJVfO3JOxEms3jA1Un8zaoNfDc=;
        b=oQqly7cmbzJUl08ZjVtijdJ99bXchq4AInJdqngzkM5lx/ajjiHRn9jefLW/lEe5/o
         1gSgyhtoQqTHSb/74ch1yoFMzW78GWJbkz04zJe4iv3kJ2+VgeYLAfCELGYJY2aqllL8
         4QM7JNdNXHJhyjfyCBEMSmL4Xz/fNxC+irXBW+vy/0thOqc73aLE0iY8EXzUM/Ze7QqC
         pLMBkjycgzsgKmMATn4dZb0sALYBdczaulAY3m6ovWZy61CeuZTcNfeYhEtxb1imTW6R
         uFPr17jsfYQbDnxDjmJrczUYsvMFXWc5lEoNQi+o0ScP4dL/aZ2pktPPIbHNh9VojyT6
         54Ug==
X-Gm-Message-State: ACgBeo1mLGgf6w3nbVIuJZq4nI9+2C3DTmjC/wXT/2UjeIPNRCXJ6s1y
        eoZM0oNp54G7/0rRsUHAtoh5tw==
X-Google-Smtp-Source: AA6agR7kEED4eOUmvqvRHvp6dhNWSxVrTH8RHc95EoPsVY0hEEJFr94M6PDkfztbkEiF3n4pWIdU4A==
X-Received: by 2002:a2e:b808:0:b0:266:52d9:ac6a with SMTP id u8-20020a2eb808000000b0026652d9ac6amr2201215ljo.14.1661881935998;
        Tue, 30 Aug 2022 10:52:15 -0700 (PDT)
Received: from krzk-bin.. (balticom-73-99-134.balticom.lv. [109.73.99.134])
        by smtp.gmail.com with ESMTPSA id z16-20020a05651c11d000b00266461bf934sm653420ljo.107.2022.08.30.10.52.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Aug 2022 10:52:15 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-arm-msm@vger.kernel.org, alsa-devel@alsa-project.org,
        linux-kernel@vger.kernel.org
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH v2 3/3] slimbus: qcom-ngd: simplify error paths with dev_err_probe
Date:   Tue, 30 Aug 2022 20:52:07 +0300
Message-Id: <20220830175207.13315-3-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220830175207.13315-1-krzysztof.kozlowski@linaro.org>
References: <20220830175207.13315-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Use dev_err_probe to skip printing of deferred probe errors and to
simplify error paths.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

---

Changes since v1:
1. None
---
 drivers/slimbus/qcom-ngd-ctrl.c | 13 +++++--------
 1 file changed, 5 insertions(+), 8 deletions(-)

diff --git a/drivers/slimbus/qcom-ngd-ctrl.c b/drivers/slimbus/qcom-ngd-ctrl.c
index bacc6af1d51e..cec11aa106bf 100644
--- a/drivers/slimbus/qcom-ngd-ctrl.c
+++ b/drivers/slimbus/qcom-ngd-ctrl.c
@@ -1543,10 +1543,8 @@ static int qcom_slim_ngd_ctrl_probe(struct platform_device *pdev)
 
 	ret = devm_request_irq(dev, ret, qcom_slim_ngd_interrupt,
 			       IRQF_TRIGGER_HIGH, "slim-ngd", ctrl);
-	if (ret) {
-		dev_err(&pdev->dev, "request IRQ failed\n");
-		return ret;
-	}
+	if (ret)
+		return dev_err_probe(&pdev->dev, ret, "request IRQ failed\n");
 
 	ctrl->nb.notifier_call = qcom_slim_ngd_ssr_notify;
 	ctrl->notifier = qcom_register_ssr_notifier("lpass", &ctrl->nb);
@@ -1575,15 +1573,14 @@ static int qcom_slim_ngd_ctrl_probe(struct platform_device *pdev)
 
 	ctrl->pdr = pdr_handle_alloc(slim_pd_status, ctrl);
 	if (IS_ERR(ctrl->pdr)) {
-		dev_err(dev, "Failed to init PDR handle\n");
-		ret = PTR_ERR(ctrl->pdr);
+		ret = dev_err_probe(dev, PTR_ERR(ctrl->pdr),
+				    "Failed to init PDR handle\n");
 		goto err_pdr_alloc;
 	}
 
 	pds = pdr_add_lookup(ctrl->pdr, "avs/audio", "msm/adsp/audio_pd");
 	if (IS_ERR(pds) && PTR_ERR(pds) != -EALREADY) {
-		ret = PTR_ERR(pds);
-		dev_err(dev, "pdr add lookup failed: %d\n", ret);
+		ret = dev_err_probe(dev, PTR_ERR(pds), "pdr add lookup failed\n");
 		goto err_pdr_lookup;
 	}
 
-- 
2.34.1

