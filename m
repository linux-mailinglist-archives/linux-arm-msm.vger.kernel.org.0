Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E0335577624
	for <lists+linux-arm-msm@lfdr.de>; Sun, 17 Jul 2022 14:33:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229696AbiGQMdQ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 17 Jul 2022 08:33:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58732 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229621AbiGQMdP (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 17 Jul 2022 08:33:15 -0400
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com [IPv6:2a00:1450:4864:20::434])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B2C9F1572F
        for <linux-arm-msm@vger.kernel.org>; Sun, 17 Jul 2022 05:33:14 -0700 (PDT)
Received: by mail-wr1-x434.google.com with SMTP id d16so13230448wrv.10
        for <linux-arm-msm@vger.kernel.org>; Sun, 17 Jul 2022 05:33:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=BltwYbntlLYN/FN8uiEra+3WKSK9lYLxa1C0HrhOCnE=;
        b=NTtOnIxy22YlP9LTHK3DHdIzjo1LvTaJQmj2nQjsE2ItrHwhXzFDwN2E26JblW1NNA
         DCi8fK8I+UgLddFzn/YeAHQv7zhRmYBUpNc/jUSc2jFUy6Ia8rNh8zgdQOzroHfk0Agd
         AmpGV7JFf4w8emEnFPjez2HglYTz7cKfXi20MltXgRnlEfWgKUvBOiSmJCnP6kOVbn87
         qXTPfYUTRFQfDufsD4MY9c/6+HAkhdqTK3097VCz0jrjihOc1VB3tpVE65PUAMVOT9mK
         z+4QSrSuE2Z8pnKyCsyq2eyirF/4yq2bEmH5trqW/DpVeLSM/K7ufOuW1WUJiuluQral
         kCDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=BltwYbntlLYN/FN8uiEra+3WKSK9lYLxa1C0HrhOCnE=;
        b=AHvdoKtQtFvQcr10JHo9foKtb/u0MYCFVF8qwnImhTR0Mgbz3duKu4kh7feReZdTOQ
         BR8ZnsiId3biHYJFdk/iKSSSsc9VxDiKnnDXRoW9NOzUeocSJ0JjQXZ2rQPK/iIUeoLd
         tS+tDFkhHmqlopR/Ad8xHhRCjJswWf9R1OvEaSoovfHETXWTetQpqEPTCJYuTPB7dxDS
         jPrg9JxUCEQuNnLK6OsXmCEC5aT9KYXkmpzgfRVNEH9wqlwkGjidvSnisQNAnnbgUc5Q
         yU85AvfVZMztSW3dYFYwCTMwDsWH2aPa6/QijqmGBZnjETYeyaAvwZlxIzIT8hAIUx72
         GGpg==
X-Gm-Message-State: AJIora/pwWY6laLyv1vo8le5t+53bbJEzjy32xtHu8T6YnC+DGzy1aTc
        VeDLDhtvAUX/yeGAQwCGIt22QQ==
X-Google-Smtp-Source: AGRyM1tkZtNN0snz0vuu5u1QBiHoiEOdwxJWwjVnvVvCadM/bjgQqmDF/DHtzq5HPO7Yi2MRAMkj6g==
X-Received: by 2002:adf:ec07:0:b0:21d:669c:6a78 with SMTP id x7-20020adfec07000000b0021d669c6a78mr19187241wrn.401.1658061193303;
        Sun, 17 Jul 2022 05:33:13 -0700 (PDT)
Received: from sagittarius-a.chello.ie (188-141-3-169.dynamic.upc.ie. [188.141.3.169])
        by smtp.gmail.com with ESMTPSA id m9-20020adfe949000000b0021d4694fcaesm8146790wrn.107.2022.07.17.05.33.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 17 Jul 2022 05:33:12 -0700 (PDT)
From:   Bryan O'Donoghue <bryan.odonoghue@linaro.org>
To:     agross@kernel.org, bjorn.andersson@linaro.org,
        konrad.dybcio@somainline.org, myungjoo.ham@samsung.com,
        cw00.choi@samsung.com, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        marijn.suijten@somainline.org, bryan.odonoghue@linaro.org
Subject: [PATCH v4 0/2] Fix pm8941-misc extcon interrupt dependency assumptions
Date:   Sun, 17 Jul 2022 13:33:02 +0100
Message-Id: <20220717123304.938259-1-bryan.odonoghue@linaro.org>
X-Mailer: git-send-email 2.36.1
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

V4:
- Added suggested extra log text from Marjin to extcon patch

V3:
- Adds a cover-letter since we are now doing two patches a dt-bindings fix and
  platform_get_irq_byname_optional fix.
- Add Review-by -> Rob Herring, Marijn Suijten
- Add additional patch to negate warning when one of usb_id or usb_vbus
  is not declared in the platform DTS.

Bryan O'Donoghue (2):
  dt-bindings: pm8941-misc: Fix usb_id and usb_vbus definitions
  extcon: qcom-spmi: Switch to platform_get_irq_byname_optional

 .../devicetree/bindings/extcon/qcom,pm8941-misc.yaml | 12 ++++++++----
 drivers/extcon/extcon-qcom-spmi-misc.c               |  4 ++--
 2 files changed, 10 insertions(+), 6 deletions(-)

-- 
2.36.1

