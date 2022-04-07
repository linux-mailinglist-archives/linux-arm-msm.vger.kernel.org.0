Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 927C14F8B97
	for <lists+linux-arm-msm@lfdr.de>; Fri,  8 Apr 2022 02:56:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232031AbiDGWy6 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 7 Apr 2022 18:54:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47704 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232274AbiDGWy6 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 7 Apr 2022 18:54:58 -0400
Received: from mail-oi1-f171.google.com (mail-oi1-f171.google.com [209.85.167.171])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E743B16CE71;
        Thu,  7 Apr 2022 15:52:56 -0700 (PDT)
Received: by mail-oi1-f171.google.com with SMTP id k10so7239485oia.0;
        Thu, 07 Apr 2022 15:52:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=wcjcXdrrKeTILsdee3EFxDpF+gt6sT7ltJDO5X75a7E=;
        b=3D6AXBqEgGBl1E15guKnDkOiaGxRfn89HAku3CJAnMu9j1YHH1DbbMDxiposQfYInT
         8VBV2UhDSMjm0hsILaTJ/4UiIJsCfBrq/PVH5kKF5glkj/GnSex1uB+9F/RII4qwYSSm
         QfHZ2viW9GRfrHLzSepN38+R9GqsOmDjHBh1lM3dawdHgIN25N57JZMi9AloYw1A4flX
         HCSwoKI/o2twgnxRxQ9UXkaIGbypKNHwZL8Bs85Tj1zqxRMRS2he2nKZU+3mQrobp+cN
         EallXV6gpZ7eN0VfsmhUr9fHO+9qTCaQodUo9L2GifBc2WWipCQvpRx0a6N0ezU9Z1hr
         BINg==
X-Gm-Message-State: AOAM532Dz2Wc7Rw2JUdztb7kO14pBfqx3iSaZa0gxnJV0HUFKED9Phqg
        r+IMD9mZnJIExk0+B2ukzA==
X-Google-Smtp-Source: ABdhPJyDbvxVfMG2eRw3vUNka/aMqjhgJ4TqyIHAX9Xb+93TaO0KuYqphbYvkb0xvay1F0IAqmEjGQ==
X-Received: by 2002:a05:6808:e82:b0:2d9:a01a:48c1 with SMTP id k2-20020a0568080e8200b002d9a01a48c1mr6997148oil.268.1649371975502;
        Thu, 07 Apr 2022 15:52:55 -0700 (PDT)
Received: from xps15.. (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.googlemail.com with ESMTPSA id y15-20020a056830208f00b005e6bf82e0b6sm421954otq.46.2022.04.07.15.52.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 Apr 2022 15:52:55 -0700 (PDT)
From:   Rob Herring <robh@kernel.org>
To:     soc@kernel.org
Cc:     devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        linux-arm-msm@vger.kernel.org
Subject: [PATCH] arm64: dts: qcom/sdm845-shift-axolotl: Fix boolean properties with values
Date:   Thu,  7 Apr 2022 17:52:54 -0500
Message-Id: <20220407225254.2178644-1-robh@kernel.org>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.2 required=5.0 tests=BAYES_00,
        FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
        HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Boolean properties in DT are present or not present and don't take a value.
A property such as 'foo = <0>;' evaluated to true. IOW, the value doesn't
matter.

It may have been intended that 0 values are false, but there is no change
in behavior with this patch.

Cc: Andy Gross <agross@kernel.org>
Cc: Bjorn Andersson <bjorn.andersson@linaro.org>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org
Signed-off-by: Rob Herring <robh@kernel.org>
---
Please apply for v5.18.

 arch/arm64/boot/dts/qcom/sdm845-shift-axolotl.dts | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/sdm845-shift-axolotl.dts b/arch/arm64/boot/dts/qcom/sdm845-shift-axolotl.dts
index 8553c8bf79bd..103cc40816fd 100644
--- a/arch/arm64/boot/dts/qcom/sdm845-shift-axolotl.dts
+++ b/arch/arm64/boot/dts/qcom/sdm845-shift-axolotl.dts
@@ -563,7 +563,7 @@ mux {
 		config {
 			pins = "gpio6", "gpio11";
 			drive-strength = <8>;
-			bias-disable = <0>;
+			bias-disable;
 		};
 	};
 
-- 
2.32.0

