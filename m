Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E6515546CC7
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Jun 2022 20:55:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1346668AbiFJSzs (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 10 Jun 2022 14:55:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55428 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1350377AbiFJSzr (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 10 Jun 2022 14:55:47 -0400
Received: from mail-lj1-x229.google.com (mail-lj1-x229.google.com [IPv6:2a00:1450:4864:20::229])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6B20C16BE1B
        for <linux-arm-msm@vger.kernel.org>; Fri, 10 Jun 2022 11:55:46 -0700 (PDT)
Received: by mail-lj1-x229.google.com with SMTP id l18so61563lje.13
        for <linux-arm-msm@vger.kernel.org>; Fri, 10 Jun 2022 11:55:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=DL/v6Vwo9BkFl30Z9CxnNgezCjx47K1shb9q1wseJlI=;
        b=DhNyCaZ/swphAvcB34TYeT8JCAeTakrcqQ9LlA5PVt+FLZB1Y7eigx5NvL/XDOK/4D
         mq+fGHRW/oxpyztBvM8I0UcPMPQqZ1mxJv1pDJKc9lMlvqb4pVEnCVF1jgfUEIhR9oO8
         wJDaSt9NWntkB0Bhi8cT37+SxJfXDqKsCNPSmLzbqgijDjWaCWnD8QU/p6EaxNxud6uw
         gbYb3PVa8Cy3K33wl4FQl7eZddwQVlztXuvIpgBomqjGcJIFAz1PV/rhLM92nSwchV7o
         dNu6+Y8nzxR1Dr4gvOLmCBehA+mT9chJiLKb+zigk/l/v0vR7Cq4flWZZPyFEiFpAyRz
         3pMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=DL/v6Vwo9BkFl30Z9CxnNgezCjx47K1shb9q1wseJlI=;
        b=o365b2MvxP8zu1JGC0uLDze7OFKtNeI8u2HIknDyOEYknUyNcj5tW4ffCDZuC/j1mg
         /ewHyqwh1F0zlk9XG1fQDYA0gmIfsZqRiMnfntbKRGlxLdAQtN+XO1AAxGlllynlj9/b
         7I36vW+KqmXxqCCKSF4jg2d6bMKs1Clx2HcrlnSozQYXDLW7968uk9Ux65J0XS/fQn/Y
         jPg/7skKuOHYeL6wDXfpxdJ7y6t4N/Q/9Ag/RbqNCC9IZDs9/wG8GCbHdOv8ptJ339Gv
         /dsV21PjGgHt+TBT1bWhG1sBdlggqpiO83itsYCAlCr4DichUuAbG4F+KolDYUpE+Hwm
         Lxrg==
X-Gm-Message-State: AOAM531jFzbuI+dy+gIS4CKyo/yrHwqSUCH9Qx8y8Z5f5tGC4m6CKUR+
        ZH/74/kB8i6s4/L+Bcm/2zWRLg==
X-Google-Smtp-Source: ABdhPJx7Hd3RcxQarfYg4FmWjPNKIuDJYZ2UWyZWCvRYDmgYaKNWRiAY/3i6g47DheC5CSwwZsz0ow==
X-Received: by 2002:a2e:f12:0:b0:250:bf9c:3d2d with SMTP id 18-20020a2e0f12000000b00250bf9c3d2dmr62932063ljp.452.1654887344730;
        Fri, 10 Jun 2022 11:55:44 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id i14-20020ac2522e000000b0047255d2118esm4816218lfl.189.2022.06.10.11.55.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Jun 2022 11:55:43 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Vinod Koul <vkoul@kernel.org>,
        Kishon Vijay Abraham I <kishon@ti.com>
Cc:     Philipp Zabel <p.zabel@pengutronix.de>,
        linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org
Subject: [PATCH 0/2] phy: qcom-qmp: fix QMP PCIe PHY init
Date:   Fri, 10 Jun 2022 21:55:40 +0300
Message-Id: <20220610185542.3662484-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

These two patches fix PCIe PHY init after the previous QMP PHY rework
([1]). They were generated on top of phy/next, but I'm fine with them
being squashed to the corresponding patches.

Dmitry Baryshkov (2):
  phy: qcom-qmp: fix msm8996 PCIe PHY support
  phy: qcom-qmp: fix PCIe PHY support

 drivers/phy/qualcomm/phy-qcom-qmp-pcie-msm8996.c | 4 ++--
 drivers/phy/qualcomm/phy-qcom-qmp-pcie.c         | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

-- 
2.35.1

