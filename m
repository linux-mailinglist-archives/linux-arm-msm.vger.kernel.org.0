Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 98D90620712
	for <lists+linux-arm-msm@lfdr.de>; Tue,  8 Nov 2022 03:59:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230248AbiKHC7K (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 7 Nov 2022 21:59:10 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37980 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230483AbiKHC7I (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 7 Nov 2022 21:59:08 -0500
Received: from mail-il1-x133.google.com (mail-il1-x133.google.com [IPv6:2607:f8b0:4864:20::133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 46E10E63;
        Mon,  7 Nov 2022 18:59:08 -0800 (PST)
Received: by mail-il1-x133.google.com with SMTP id e19so6874042ili.4;
        Mon, 07 Nov 2022 18:59:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=dd4KtU41hGXmzHVze/eO+HNqRRdroUnZSC2vRqE9sso=;
        b=l7mcY0ltQTQLHnJ4/+/f+cryowvZyYJzkpeWV5nosvV00ze+HRgAacrVuNcxqZH+er
         h8B2Gs1o6qoY1XUgXSTBTnfyexbJAQa2XPBaFEpWrn6TcQn7jdvKUDlJRMcegPiIw9GP
         IvcnviQIBKfdtlXmO+1i5k6x1c3ihYkySwjVDIAp4Fg3OtZjj4RQpccn+VKSYB2hHXA5
         18P4Hy+1CQl25d9O94PF8oC+VQnfH5PaXGrZyzl/WMAs9KfHUnu04itCOKiu7i5L40hr
         dvzmfWwX/4Fpc9gA2/PCGE7Dzm8hKD3sF0XlU5eVn/YEN5QWzrQEzbaCAgRUWtowsUAL
         CCiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dd4KtU41hGXmzHVze/eO+HNqRRdroUnZSC2vRqE9sso=;
        b=6kwWMfc9WBeHx/EK207R6+gmUgEPhqpChr4LJlbysfqykutS7q7T0pV0yN5A7vCsvI
         6Cu1IEkWUUKya7asz1/QzfBN0SyEZWlolagwHc1VvV8krOIxvyy/73veCn4Tf6bafNzY
         qkL06Mxeosf0scK4abTtGpmnSJz13v5+bvQdXwdkYlR0GBJQ9TAura90aUld8Lnnm0Ik
         HyRrub1GUFu1is/8e+YW5+hwuLqZ2USzph006vZDpGnkd9BM71FAPL+DXADDaYqZz8RG
         pXg+ENpnzVTi3xcj5KfWRin90s9+pA5Y+g/s4+h2y1NWHsgREsUcMFN+wT89zJQhrfxO
         kgPg==
X-Gm-Message-State: ACrzQf0S6Z/Pcnm84Ffyul+RKUijFqHZCIkLPAH0YvRIUPjN7yliOPQF
        Z2WjtdcrW75fLcJSeg2odA4=
X-Google-Smtp-Source: AMsMyM7ZXYEuZeVcwaYIgiEWOPHHTqVVpW+CsyngneukVkJOTe6835Mr7QQsPey9HjSIaciDmvSiiA==
X-Received: by 2002:a92:bf0e:0:b0:300:cc8e:fe07 with SMTP id z14-20020a92bf0e000000b00300cc8efe07mr17748340ilh.184.1667876347655;
        Mon, 07 Nov 2022 18:59:07 -0800 (PST)
Received: from localhost ([2607:fea8:a2e2:2d00::61cc])
        by smtp.gmail.com with ESMTPSA id k15-20020a02334f000000b00363753f4730sm3328904jak.91.2022.11.07.18.59.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Nov 2022 18:59:07 -0800 (PST)
From:   Richard Acayan <mailingradian@gmail.com>
To:     Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
        Joerg Roedel <joro@8bytes.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev,
        devicetree@vger.kernel.org
Cc:     linux-arm-msm@vger.kernel.org,
        Richard Acayan <mailingradian@gmail.com>
Subject: [PATCH v3 0/1] iommu: SMMU for SDM670
Date:   Mon,  7 Nov 2022 21:58:48 -0500
Message-Id: <20221108025847.58352-1-mailingradian@gmail.com>
X-Mailer: git-send-email 2.38.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Changes since v3:
 - drop driver patch

Changes since v2:
 - rewrite driver patch (2/2)
 - rebase on (1/2):
   https://lore.kernel.org/linux-iommu/20221102184420.534094-1-dmitry.baryshkov@linaro.org/
 - reset review process (1-2/2)

Changes since v1 (no emails related to this series since last week):
 - accumulate tags (both were added because it seems like the discussion
   ended in agreement to keep adding compatible strings to the driver)

This adds the compatible string for the Qualcomm Snapdragon 670's SMMU. The
SMMU is necessary for GENI I2C, included in initial bringup because it
doesn't need non-trivial patches except for patches conventionally added
before the initial device tree (global clock controller and pinctrl).

Richard Acayan (1):
  dt-bindings: iommu: arm-smmu: add sdm670 compatible

 Documentation/devicetree/bindings/iommu/arm,smmu.yaml | 1 +
 1 file changed, 1 insertion(+)

-- 
2.38.1

