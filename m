Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8B5016B9E70
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Mar 2023 19:31:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230416AbjCNSbP (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 14 Mar 2023 14:31:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41182 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230374AbjCNSbK (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 14 Mar 2023 14:31:10 -0400
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com [IPv6:2a00:1450:4864:20::32f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2B2D02202E
        for <linux-arm-msm@vger.kernel.org>; Tue, 14 Mar 2023 11:30:59 -0700 (PDT)
Received: by mail-wm1-x32f.google.com with SMTP id l7-20020a05600c1d0700b003eb5e6d906bso10806633wms.5
        for <linux-arm-msm@vger.kernel.org>; Tue, 14 Mar 2023 11:30:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20210112.gappssmtp.com; s=20210112; t=1678818657;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kIxBA2zlxML9hOs0dvz6DfCwg7oJrI83UIUnR1uCeBs=;
        b=EmK746apIdSh2XdjgbFudbJUw7DZowe3fkKEnVOTcm+/waCIPVsMPo5l9XVIZqhEIO
         QFNPofrD2Wt/8/WEmFgMPOfKG46WUG6a1AgapIsGwUjKpOt/KBWtPBR4QlqpwpZbFzZg
         915V6WTJzBBU9t6rcmlxJaWbjy1PC6Z8GY8HtgmGoxQMMRtEumaRbig0x1hYgs9KzMJm
         zgiEOQC394GKZ+hYtmQ77I4zJ480N9DANqlT9JUtwxGU3AHw2ooJMdDhgIR79U1vQ9Lh
         GaAb6R+5HZaGdjcacVzUNkE695LrM+TKoXodjCh3ZgioY0UgxFcux1eeH0k15P1H/DFc
         Myeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678818657;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kIxBA2zlxML9hOs0dvz6DfCwg7oJrI83UIUnR1uCeBs=;
        b=cCUfjjZJcjv8FDzhRMM1i03FFyIVdlHr0pQl/pvRoQ4k/zWWk/6qg0mITIsGDqaFvB
         E8eelFALBht+Qp2JVU4r7mS5DJwpbmOvAdDBs0eSHa65I54WKQVTuBnEQD0bGHkXS++n
         eX4h9+gvXT0zIbmpb4GeoAaadU9JccHs5KLEbiUvcQSzgB1TA6IT1meKEZYgpeqoNt2m
         lmW9zXiqR0ZoRiZtfxxuoRYy9Gp6JvWCAMloRT61Hf1md1gG7gfALrCGe0/ZZmPAKcSm
         Ddx3HfrvDLJAAeVtW24KLXkg9OWVuKhSuSDASi4/dLIM+aMZ5dq+6iRd+bfgTjWT3cvg
         XGQw==
X-Gm-Message-State: AO0yUKV61axzjR5HQS8PCSM6d4DooKwFn8GSHy7BDkMs7kntKbt0BqJB
        K7mzOrA3eVGr2AFA9K/vaceNLw==
X-Google-Smtp-Source: AK7set84D2+qEChnMMW7hzfFJ0HZv09T5dJ/RFfHz5KNaLX2ov7ZL0fOGx3WxVO4zS+Y8j7bQGU+1w==
X-Received: by 2002:a05:600c:4746:b0:3ed:25c4:9 with SMTP id w6-20020a05600c474600b003ed25c40009mr3150753wmo.15.1678818657622;
        Tue, 14 Mar 2023 11:30:57 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:334:ac00:fd14:bd52:b53b:d94c])
        by smtp.gmail.com with ESMTPSA id k28-20020a05600c1c9c00b003e209b45f6bsm4083938wms.29.2023.03.14.11.30.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Mar 2023 11:30:57 -0700 (PDT)
From:   Bartosz Golaszewski <brgl@bgdev.pl>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
        Lee Jones <lee@kernel.org>
Subject: [PATCH 04/14] dt-bindings: mfd: qcom,spmi-pmic: add compatible for pmm8654au
Date:   Tue, 14 Mar 2023 19:30:33 +0100
Message-Id: <20230314183043.619997-5-brgl@bgdev.pl>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20230314183043.619997-1-brgl@bgdev.pl>
References: <20230314183043.619997-1-brgl@bgdev.pl>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

PMM8654au is the SPMI PMIC variant used on sa8775p-ride. Add a compatible
for it.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Cc: Lee Jones <lee@kernel.org>
---
 Documentation/devicetree/bindings/mfd/qcom,spmi-pmic.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/mfd/qcom,spmi-pmic.yaml b/Documentation/devicetree/bindings/mfd/qcom,spmi-pmic.yaml
index 8f076bb622b1..078d47a6ac83 100644
--- a/Documentation/devicetree/bindings/mfd/qcom,spmi-pmic.yaml
+++ b/Documentation/devicetree/bindings/mfd/qcom,spmi-pmic.yaml
@@ -78,6 +78,7 @@ properties:
           - qcom,pmk8350
           - qcom,pmk8550
           - qcom,pmm8155au
+          - qcom,pmm8654au
           - qcom,pmp8074
           - qcom,pmr735a
           - qcom,pmr735b
-- 
2.37.2

