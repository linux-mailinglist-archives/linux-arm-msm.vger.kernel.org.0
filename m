Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 12326725669
	for <lists+linux-arm-msm@lfdr.de>; Wed,  7 Jun 2023 09:52:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239445AbjFGHwF (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 7 Jun 2023 03:52:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43690 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239345AbjFGHv1 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 7 Jun 2023 03:51:27 -0400
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com [IPv6:2a00:1450:4864:20::334])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E4163173A
        for <linux-arm-msm@vger.kernel.org>; Wed,  7 Jun 2023 00:51:17 -0700 (PDT)
Received: by mail-wm1-x334.google.com with SMTP id 5b1f17b1804b1-3f735bfcbbbso30479265e9.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 07 Jun 2023 00:51:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1686124276; x=1688716276;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=EzplAM1LxKiU0eh2R6kgCo2O1jt9amS2AfC5rUF7aAM=;
        b=U8Rt/BDYcpOw4r3UbZMmvvi6ebAkG1C5Qblgf9MJo2rFf5MA3s6V1bliiZg9xCPFB5
         BwcvShBrsE20s1im5BdgLYd3YcKkRZHbziXAbw52KdqIbuRKlbdE/yX8xv51MI1w5ja3
         vOe+U4nBo/hHmyEOkuYyEPDLmQDzULh3em//H3rcdgW3IqL1FS/HX4KjoCDVCnLKOCz1
         TAZBGbz3fPNW+1Kmti8Y90NH3uRCp7HM4hNK3KZCpRobim7ifG/XC4bKs1UJ1IGBU6mV
         vo9ykPI8J1tRtIL2HiSGjNi2BNQqGt0LVR1fvxESZL4LrVgT96IH+wFybdmRt/dmy6FU
         iV8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686124276; x=1688716276;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=EzplAM1LxKiU0eh2R6kgCo2O1jt9amS2AfC5rUF7aAM=;
        b=EYpVMhRghAI0Hpdlz6hBpt/kwZuLInauQRsUzhTWF3bvIjlofvvaIxDoOlypWqtUTm
         FBJfiyYTL6pLAlP9hnm3fC8zQ6xUS3VvEGzjpH6sLKtNvlpyFGchjP7oiN6giow0sfw3
         x/1rAzLooc4Tq0bYz+3/hId984WUtLNKz/51IzklmRvE71GVUq9aOyYFw3ukeHLVYXNR
         lVJjea54bbO85R66qh64aeZKmyNTrcXGk129UlraIg7fThaKV+ldoTF8n8ln0aneGKJJ
         nkQ80VhKqW7W/skPqFX9xt2GyAjALAKq/Xcgi+zefyiufwvAqJMkftYWSRqHwBnE96fI
         fazw==
X-Gm-Message-State: AC+VfDweAJ57FPzZ+aRGQ/jJvruzZq5lBDhZ/2SHpt9tVyXmf4BwwhBe
        bgduyk6ZFeEZeP5HY6+Hbfrkxw==
X-Google-Smtp-Source: ACHHUZ7pfC+dEFVYTyuW33fMWTlzQDsqFGTLXKH30kGPCgPGpSkNbHlL+DHOerEXTLCtWUjk0QoS+Q==
X-Received: by 2002:a1c:7c05:0:b0:3f7:e34c:522c with SMTP id x5-20020a1c7c05000000b003f7e34c522cmr3991724wmc.2.1686124276297;
        Wed, 07 Jun 2023 00:51:16 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:8261:5fff:fe11:bdda])
        by smtp.gmail.com with ESMTPSA id f9-20020a5d5689000000b0030ae93bd196sm14726343wrv.21.2023.06.07.00.51.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Jun 2023 00:51:15 -0700 (PDT)
From:   Neil Armstrong <neil.armstrong@linaro.org>
Subject: [PATCH v2 0/2] typec: add support for the ON Semiconductor
 nb7vpq904m Type-C Linear Redriver
Date:   Wed, 07 Jun 2023 09:51:07 +0200
Message-Id: <20230601-topic-sm8x50-upstream-redriver-v2-0-dda89b22b1c0@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAOs2gGQC/42OQQ6CMBBFr0K6dkxboVFX3sOwKHSASaAlU2gwh
 LtbOYHL9xb//V1EZMIonsUuGBNFCj6DvhSiHazvEchlFlrqmzRSwRJmaiFO962SsM5xYbQTMDq
 mhAwGtVHoXNU2pcgjjY0IDVvfDnnGr+OY5czY0XZW33XmgeIS+HOeSOpn/+4lBRKMdVrJR9l1p
 nuN5C2Ha+Be1MdxfAGeaM9A4gAAAA==
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Neil Armstrong <neil.armstrong@linaro.org>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2056;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=o5ap0QcyyEUW/eoYzVryzp1HwNxIAAjt0OBZ5vOmbME=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBkgDbyL/T5acuXcNu4eWe9A8Fnuax34OUwwmwg7Iwd
 AP1Kz7SJAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCZIA28gAKCRB33NvayMhJ0fX1EA
 DBed20NoyKhr91zlW45+MksTZSQdVK4p9r8PzgDhEK2wT20RKCEbPYchIFBNmF978Ye2AKFY4jstcy
 YP4ZJtZAUenqhow++hj0uCYou3o4y1htFmFs2qklw8KIcvvFDSl4kQzThWZkRBV+RJro9z82gFO2uV
 oZiLIYeW7UIFjsdOS5Bw1chdfA9EF9ohvqmKh0BkbsXcVN1MkP//+hdDWFGtQNbRBlo+4xaq7Abw6C
 UqKYcgNBpLiom0fyJdOF5UZ1hRCpwftvLGFMfuLindzC7/QFD31AYpjrZf3V1d2XhACAXmOacgUNhb
 Pzs08uuLPfLtDaeA08UYYBpISsSjxb32SzeoNtQ5hyeqexCXPSfm8U3ljOOZCm5FykHJi8VcalFMeO
 D7XyB71pEOEB+/Bv5JEWu3lDGEaRkWLOWMydFwuISgfbIS6DuqLIoYLjEfNNEw83+RQmiA83n0bI1U
 8ACtlwZ5FkDGXfWwWN+tZMp1+7F8PvEhVuDZ0rpy/VSO7yt6D9tAelPrVtrcn1Kyt3ryeYYD5VPC2p
 AWbKlgCtfoJeKsBElsUIj9MIiX1vbl7unesxr5CTwYSLR897igIoM+hWlBfGD1AUq15/eom6TP+Vr/
 ejIu+tbFUERUKF3Pfs8SsFyfQ/zEyXbBauDrL2sUmrRsMw0mcxrF9mD0CHnA==
X-Developer-Key: i=neil.armstrong@linaro.org; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add support for the ON Semiconductor NB7VPQ904M Type-C USB SuperSpeed
and DisplayPort ALT Mode Linear Redriver chip found on some devices
with a Type-C port.

The redriver compensates ultra High-Speeed DisplayPort and USB
Super Speed signal integrity losses mainly due to PCB & transmission
cables.

The redriver doesn't support SuperSpeed lines swapping, but
can support Type-C SBU lines swapping.

Support is designed as a Type-C Switch and Retimer, and can propagate
orientation settings to the source endpoint, which is usually
a Super Speed PHY which does the data lanes swapping.

Bindings are added first and can handle the fact data lanes pairs
can be swapped on the PCB.

Compile-time dependencies:
- svid removal at [1]

[1] https://lore.kernel.org/all/20230526131434.46920-1-heikki.krogerus@linux.intel.com/

Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
Changes in v2:
- Switch to "retimer" infrastructure
- Slight style fixups after switch to retimer
- Bindings updates (did not keep Reviewed-by tag for those reasons)
 - Update maintainer, was using Bjorn with invalid email
 - Fixed swapped lanes mapping
 - Switched to retimer-switch
 - Fixed i2c top node in example
- Link to v1: https://lore.kernel.org/r/20230601-topic-sm8x50-upstream-redriver-v1-0-6ad21094ff6f@linaro.org

---
Dmitry Baryshkov (1):
      usb: typec: add support for the nb7vpq904m Type-C Linear Redriver

Neil Armstrong (1):
      dt-bindings: usb: add ON Semiconductor nb7vpq904m Type-C Linear Redriver bindings

 .../devicetree/bindings/usb/onnn,nb7vpq904m.yaml   | 141 ++++++
 drivers/usb/typec/mux/Kconfig                      |   8 +
 drivers/usb/typec/mux/Makefile                     |   1 +
 drivers/usb/typec/mux/nb7vpq904m.c                 | 529 +++++++++++++++++++++
 4 files changed, 679 insertions(+)
---
base-commit: ac9a78681b921877518763ba0e89202254349d1b
change-id: 20230601-topic-sm8x50-upstream-redriver-6e261edd5cb4

Best regards,
-- 
Neil Armstrong <neil.armstrong@linaro.org>

