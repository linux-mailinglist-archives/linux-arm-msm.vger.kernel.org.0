Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DB4954E7F4D
	for <lists+linux-arm-msm@lfdr.de>; Sat, 26 Mar 2022 07:08:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231401AbiCZGKC (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 26 Mar 2022 02:10:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47192 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231389AbiCZGKB (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 26 Mar 2022 02:10:01 -0400
Received: from mail-pj1-x1030.google.com (mail-pj1-x1030.google.com [IPv6:2607:f8b0:4864:20::1030])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9A66247AF6
        for <linux-arm-msm@vger.kernel.org>; Fri, 25 Mar 2022 23:08:24 -0700 (PDT)
Received: by mail-pj1-x1030.google.com with SMTP id bx24-20020a17090af49800b001c6872a9e4eso10492493pjb.5
        for <linux-arm-msm@vger.kernel.org>; Fri, 25 Mar 2022 23:08:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=0o8tUgy/tAkCZjad7PTAFAjbRmQFE1iM7i3O+lRJLt0=;
        b=JxrXrddtnnoGB067+KIXpxbU/cxGO0pVYhDovDwPpZpm8aDvVr3PIDUCLhiCrvIN5d
         zAbyKuA3LxtlC3vnPxjzujEUleO+8wQaOEzLBQpkqnwuD6hymLDjSr4GD5SaoF5C9vj6
         2e8vJMPdojRuevXXvQndsfVxooSELwwK5zS4zKzMDxjXmq2zfDeuAzAjzBhi7gJLJod/
         8ZeJAhyyDdLJAXy6geo/jkU7gFwFlnsyf7g+m21nnSbPGSus03JlCSDSMVmpO2X2ulUW
         xMYe/gecAQmQrJSgjRxPAtmm+tz2JJ6CvgExRLup9UZqefNviHjiZSCXOTJSQql0MTR/
         i9dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=0o8tUgy/tAkCZjad7PTAFAjbRmQFE1iM7i3O+lRJLt0=;
        b=jKm1+3plGfo52GdiDKWubP5isLB7Pw02DnpYa3u3Rn+7GCubpqb+yz0Xh6yP4ZF2ko
         fiszPEc6DHbvG13p/oVb0y7hlzEx+xIE4ULiXuHBfJpSKSrdyOX/CSaLwMN68pCVaq0/
         xHJnAU419ThPfvTbO3j1MNM2c+D9g14GrPqnplkoYOz2V67vb3JYl+ebCrq9Cq3BvGNj
         XQcY/0AIs6VgxT245J+yEPMI/nZ/ii4jEc/IwWqWanuTZabT0gmqtfe2CN/uOqa242o1
         6a4tHuwe1Db/EJxfB3wpgPR9Y//11qsivnNuXDqWD6+Q+47pjWkcJIJBKzi9V5SwRye6
         /rsA==
X-Gm-Message-State: AOAM532Mz4FCcpU00z3b1Cg5jNk634Hv4HUXqLGquHLFnhfl91kkIjHd
        aRaLcz9H2wpKvlulKO7Go8XpBA==
X-Google-Smtp-Source: ABdhPJy+u4HPcDaXvc6g7SoNQgcuvOV3LSqyksOzn22L/tz50qDSuhzH4okH5/a8LITbCsduZaVSEw==
X-Received: by 2002:a17:902:ecd0:b0:154:8802:7cb1 with SMTP id a16-20020a170902ecd000b0015488027cb1mr15685100plh.132.1648274904022;
        Fri, 25 Mar 2022 23:08:24 -0700 (PDT)
Received: from localhost.localdomain ([223.233.78.42])
        by smtp.gmail.com with ESMTPSA id p26-20020a63951a000000b003826aff3e41sm6944959pgd.33.2022.03.25.23.08.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Mar 2022 23:08:23 -0700 (PDT)
From:   Bhupesh Sharma <bhupesh.sharma@linaro.org>
To:     linux-pci@vger.kernel.org
Cc:     bhupesh.sharma@linaro.org, bhupesh.linux@gmail.com,
        lorenzo.pieralisi@arm.com, agross@kernel.org,
        bjorn.andersson@linaro.org, svarbanov@mm-sol.com,
        bhelgaas@google.com, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        robh+dt@kernel.org
Subject: [PATCH v4 0/2] pci: Add PCIe support for SM8150 SoC
Date:   Sat, 26 Mar 2022 11:38:08 +0530
Message-Id: <20220326060810.1797516-1-bhupesh.sharma@linaro.org>
X-Mailer: git-send-email 2.35.1
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

Changes since v3:
-----------------
- v3 can be found here: https://lore.kernel.org/linux-arm-msm/20220302203045.184500-1-bhupesh.sharma@linaro.org/
- Broke down the patchset into 3 separate patchsets for each tree,
  so that the patch(es) can be easily reviewed and merged by respective
  maintainers.
- This patchset adds the driver / binding related PCIe support for
  SM8150 SoC.

Hi Lorenzo,

This series adds driver / binding support for PCIe controllers found
on Qualcomm SM8150 SoC. There are 2 PCIe instances on this SoC each with
different PHYs. The PCIe controller and PHYs are mostly compatible with
the ones found on SM8250 SoC, hence the old drivers are modified to add
the support.

This series has been tested on SA8155p ADP board with QCA6696 chipset connected
onboard.

Cc: Bjorn Andersson <bjorn.andersson@linaro.org>
Cc: lorenzo.pieralisi@arm.com

Bhupesh Sharma (2):
  dt-bindings: pci: qcom: Document PCIe bindings for SM8150 SoC
  PCI: qcom: Add SM8150 SoC support

 Documentation/devicetree/bindings/pci/qcom,pcie.txt | 5 +++--
 drivers/pci/controller/dwc/pcie-qcom.c              | 8 ++++++++
 2 files changed, 11 insertions(+), 2 deletions(-)

-- 
2.35.1

