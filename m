Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id EC3B16576E7
	for <lists+linux-arm-msm@lfdr.de>; Wed, 28 Dec 2022 14:31:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230464AbiL1NbK (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 28 Dec 2022 08:31:10 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40828 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230508AbiL1NbI (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 28 Dec 2022 08:31:08 -0500
Received: from mail-ej1-x62b.google.com (mail-ej1-x62b.google.com [IPv6:2a00:1450:4864:20::62b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DA0F0F5BE
        for <linux-arm-msm@vger.kernel.org>; Wed, 28 Dec 2022 05:31:03 -0800 (PST)
Received: by mail-ej1-x62b.google.com with SMTP id t17so38374755eju.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 28 Dec 2022 05:31:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QED1aNtpCBA4/YxA776enxTbRIKvec58m1cbK25uDdk=;
        b=hY9OVWNL1DdXi0BZOMdWNCKWqJhqnl5EmLUL6emj93JJTIjUudn2hxgGo5uDxvVYsN
         jI4OuPhoL2pFUk+VvPOOyh1daA6zzr6KFPNXxkcSX9tzC8grRL/dF/Gzl01quGUaEuCp
         eSAduzz5qP9UvMeqrWuqZ8qhBieAV9s7gcYH99svdBj+EKoYQkAV7MQuKTAiFUmQSSSy
         1s+iu3QMEj27ZIsGfNxOMEREfPidwf39On45CjWOfTL3PzykBui/nd6IOmaeskoSxVZf
         EUr7SnJK1zDDAI60R7FTVu9V3sqsLl2YbwHqjcHetYFsDtGX6KsWzJBlCTmEkGS/HnJP
         ep3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QED1aNtpCBA4/YxA776enxTbRIKvec58m1cbK25uDdk=;
        b=tXpe7Xh8DTo5MzYX4T+5ZaahpbnZnF8FKa/L3L18Hg3ddBefIfivPMJ85IOPNF7w/8
         lc3DXEGtX5LrraVFjO5S0EB8oYLB9nwUF+rnzSqTR0RYd1lWzHNuamQDsOjZlOzhVNMw
         H9ewuqeSYm3rm/StaCTsekL/1JnI9qeyHH2gRqa5n7QSTYN1YIK+GS6E7Z5qPAwhI9Cw
         dm5xShIekaq1+xcngd7JY/+UHk8vw0Otoq4rN0V10zv6V8WjsqEQCl1lG7LcgHtCOkwP
         wKnLRtN0ZjLXJwXSDOBbKCr6rMpercn/Vz9ft2+mOZMeKGuj9MhurmcSTADIf2iKt/ZR
         j6wA==
X-Gm-Message-State: AFqh2krrBzoWWpWwGqL023ra+42wGjOz0VbjXaDrNQbDIbFyosdj325N
        Xr+Cd3Z3bw80wFVqOhI0cuAACQ==
X-Google-Smtp-Source: AMrXdXuA4ru4b3mURtizphZay9lVz0mDzfpSmdV5Nc6xFdqWJhqSdXY8yzo5NuIO7AJ0bbSVC62+Ug==
X-Received: by 2002:a17:906:158c:b0:7c4:f752:e959 with SMTP id k12-20020a170906158c00b007c4f752e959mr20022518ejd.33.1672234262421;
        Wed, 28 Dec 2022 05:31:02 -0800 (PST)
Received: from planet9.chello.ie (2001-1c06-2302-5600-85f6-04b5-1651-3b6c.cable.dynamic.v6.ziggo.nl. [2001:1c06:2302:5600:85f6:4b5:1651:3b6c])
        by smtp.gmail.com with ESMTPSA id j15-20020a170906094f00b007add28659b0sm7541393ejd.140.2022.12.28.05.31.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Dec 2022 05:31:02 -0800 (PST)
From:   Bryan O'Donoghue <bryan.odonoghue@linaro.org>
To:     cw00.choi@samsung.com, myungjoo.ham@samsung.com,
        andersson@kernel.org, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, gregkh@linuxfoundation.org,
        agross@kernel.org
Cc:     konrad.dybcio@linaro.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        bryan.odonoghue@linaro.org, Rob Herring <robh@kernel.org>,
        Marijn Suijten <marijn.suijten@somainline.org>
Subject: [PATCH v4 1/2 RESEND] dt-bindings: pm8941-misc: Fix usb_id and usb_vbus definitions
Date:   Wed, 28 Dec 2022 13:30:57 +0000
Message-Id: <20221228133058.213886-2-bryan.odonoghue@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221228133058.213886-1-bryan.odonoghue@linaro.org>
References: <20221228133058.213886-1-bryan.odonoghue@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

dts validation is throwing an error for me on 8916 and 8939 with
extcon@1300. In that case we have usb_vbus but not usb_id.

It wasn't immediately obvious if there was a valid use-case for the
existing code for usb_id in isolation, however discussing further, we
concluded that usb_id, usb_vbus or (usb_id | usb_vbus) are valid
combinations as an external IC may be responsible for usb_id or usb_vbus.

Expand the definition with anyOf to capture the three different valid
modes.

Fixes: 4fcdd677c4ea ("bindings: pm8941-misc: Add support for VBUS detection")
Reviewed-by: Rob Herring <robh@kernel.org>
Reviewed-by: Marijn Suijten <marijn.suijten@somainline.org>
Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
 .../devicetree/bindings/extcon/qcom,pm8941-misc.yaml | 12 ++++++++----
 1 file changed, 8 insertions(+), 4 deletions(-)

diff --git a/Documentation/devicetree/bindings/extcon/qcom,pm8941-misc.yaml b/Documentation/devicetree/bindings/extcon/qcom,pm8941-misc.yaml
index 6a9c96f0352ac..1bc412a4ac5e6 100644
--- a/Documentation/devicetree/bindings/extcon/qcom,pm8941-misc.yaml
+++ b/Documentation/devicetree/bindings/extcon/qcom,pm8941-misc.yaml
@@ -27,10 +27,14 @@ properties:
 
   interrupt-names:
     minItems: 1
-    items:
-      - const: usb_id
-      - const: usb_vbus
-
+    anyOf:
+      - items:
+          - const: usb_id
+          - const: usb_vbus
+      - items:
+          - const: usb_id
+      - items:
+          - const: usb_vbus
 required:
   - compatible
   - reg
-- 
2.34.1

