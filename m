Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 504604BFB59
	for <lists+linux-arm-msm@lfdr.de>; Tue, 22 Feb 2022 15:59:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233010AbiBVPAJ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 22 Feb 2022 10:00:09 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47478 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232916AbiBVPAI (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 22 Feb 2022 10:00:08 -0500
Received: from smtp-relay-internal-0.canonical.com (smtp-relay-internal-0.canonical.com [185.125.188.122])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0D39F10DA54
        for <linux-arm-msm@vger.kernel.org>; Tue, 22 Feb 2022 06:59:43 -0800 (PST)
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com [209.85.218.69])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id C7E803FCB1
        for <linux-arm-msm@vger.kernel.org>; Tue, 22 Feb 2022 14:59:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1645541981;
        bh=+TIgQRioLLZ9zOW6KKmdTDTPf4m59BMseVHbquTVcCc=;
        h=From:To:Subject:Date:Message-Id:MIME-Version;
        b=Hg3sk6AEE3RSA/qbTAKERDjf8+2yL3I5TGp5O3i6JYvGxHOTthP+9YEIyF8X8HpWb
         /NTvBUHW8fzu9QRd4QnBzztaEypjOO8kBccS7JE9sXY2tauUa3EeXzudym6V3IPmHO
         GFiyQdsTPrTfU2fLAdOVY3ELhwekPbeaf0lcb0o7O04b4W3Le2yAoIe5QNZnfjlkCv
         jxBwaZ8x4PZlaP57r1NxYcc45LnV4IEAUu7DoCd0Me94nlY9BlXX/QAbuCnBJugbL0
         0KTn7XPsyvbdQZpARE/v8obRLzSi6uUOtB9OxJlLIzMRpRHLU94OTO2rNy0sSSP7dG
         RfRJ73HWqA0Zg==
Received: by mail-ej1-f69.google.com with SMTP id sa7-20020a170906eda700b006d1b130d65bso1937677ejb.13
        for <linux-arm-msm@vger.kernel.org>; Tue, 22 Feb 2022 06:59:41 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=+TIgQRioLLZ9zOW6KKmdTDTPf4m59BMseVHbquTVcCc=;
        b=Qdda0jm/64ZfW8JR5JZRNoKF5bj5Iz3YxzCkKWICP/8xhQ4sfWRRssPhkgZUle6KCk
         5ZxdOguhqMjndHeukSkbl4QtgGW838da/5WJUzCyCGRf7LaJxukjMv1ehl4FD2EvtFe8
         6KQbF5GJVH/vTcjrZBdLbMsab5x8sYl2Z9yMcwCKI0CRg6HP7sRP5r6spEPNgAmcGHJz
         uu9D+mGb0och3OV/afYxO4Th7GiC4taUVGG1mA7xxgRQ2BjXy2FT/O8iGjvWKdcsXJmp
         m6O0Y4NsSnJlTj+gNdkMwMO2IfsdOSZweUyJ4TdcxQPNUV2RBHZRmd5yV36VJ595KfSK
         Ky/g==
X-Gm-Message-State: AOAM531eqirt+HVPjdxbOUikoFQjgkSDbGuJPeU0OGyJqqHECHe1wfOF
        9ycnzulXm6keWhjdqJz/FLC2dzspQR50sZPtsc+OeOKGack6FlCRbvJp1OgElLxJnTxl17JGTpj
        ahH7OLFKjQY+K/4Nq/gFq2wOy8Bx9puu63HiI5E+TA5U=
X-Received: by 2002:aa7:c391:0:b0:410:83fb:abab with SMTP id k17-20020aa7c391000000b0041083fbababmr27025534edq.435.1645541980500;
        Tue, 22 Feb 2022 06:59:40 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwFDKifwtFFrCmwLKT4NC984SQd8SdrxWDXIgJnHsNvfVTg37pGq0CPqLSpORQdHqU3VFVDJQ==
X-Received: by 2002:aa7:c391:0:b0:410:83fb:abab with SMTP id k17-20020aa7c391000000b0041083fbababmr27025516edq.435.1645541980307;
        Tue, 22 Feb 2022 06:59:40 -0800 (PST)
Received: from localhost.localdomain (xdsl-188-155-181-108.adslplus.ch. [188.155.181.108])
        by smtp.gmail.com with ESMTPSA id m2sm2467960ejb.20.2022.02.22.06.59.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Feb 2022 06:59:39 -0800 (PST)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To:     Alim Akhtar <alim.akhtar@samsung.com>,
        Avri Altman <avri.altman@wdc.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Wei Xu <xuwei5@hisilicon.com>, Nishanth Menon <nm@ti.com>,
        Vignesh Raghavendra <vigneshr@ti.com>,
        Tero Kristo <kristo@kernel.org>,
        "James E.J. Bottomley" <jejb@linux.ibm.com>,
        "Martin K. Petersen" <martin.petersen@oracle.com>,
        Jan Kotas <jank@cadence.com>, Li Wei <liwei213@huawei.com>,
        Stanley Chu <stanley.chu@mediatek.com>,
        Yaniv Gardi <ygardi@codeaurora.org>,
        linux-scsi@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org,
        linux-mediatek@lists.infradead.org
Subject: [PATCH v2 00/15] dt-bindings: ufs: add common platform bindings + fixes
Date:   Tue, 22 Feb 2022 15:58:39 +0100
Message-Id: <20220222145854.358646-1-krzysztof.kozlowski@canonical.com>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi,

Not tested on hardware, so please kindly test.
Bindings maintainers might need checking - taken from git log.

Changes since v1
================
1. Make freq-table as matrix of tuples (Nishanth).
2. New patches: convert all bindings and fix up DTS files.
3. Several minor fixes in UFS bindings.

Dependencies
============
1. The DTS patches (10-15) depend on scsi/ufs driver change (patch 9), so
   they should go in a following release, after merging driver.

   This is also might affect out-of-tree users of these DTSes (other
   projects, e.g. U-boot).

Best regards,
Krzysztof

Krzysztof Kozlowski (15):
  dt-bindings: ufs: add common platform bindings
  dt-bindings: ufs: samsung,exynos-ufs: use common bindings
  dt-bindings: ufs: cdns,ufshc: convert to dtschema
  dt-bindings: ufs: drop unused/old ufs-qcom PHY bindings
  dt-bindings: ufs: qcom,ufs: convert to dtschema
  dt-bindings: ufs: hisilicon,ufs: convert to dtschema
  dt-bindings: ufs: mediatek,ufs: convert to dtschema
  dt-bindings: ufs: snps,tc-dwc-g210: convert to dtschema
  scsi: ufs: deprecate 'freq-table-hz' property
  arm64: dts: hi3670: use 'freq-table' in UFS node
  arm64: dts: ti: use 'freq-table' in UFS node
  arm64: dts: qcom: use 'freq-table' in UFS node
  arm64: dts: qcom: msm8996: drop unsupported UFS
    vddp-ref-clk-max-microamp
  arm64: dts: qcom: msm8996: correct UFS compatible
  arm64: dts: qcom: sm8350: drop duplicated ref_clk in UFS

 .../devicetree/bindings/ufs/cdns,ufshc.txt    |  32 ---
 .../devicetree/bindings/ufs/cdns,ufshc.yaml   |  68 +++++
 .../bindings/ufs/hisilicon,ufs.yaml           |  90 +++++++
 .../devicetree/bindings/ufs/mediatek,ufs.yaml |  67 +++++
 .../devicetree/bindings/ufs/qcom,ufs.yaml     | 241 ++++++++++++++++++
 .../bindings/ufs/samsung,exynos-ufs.yaml      |  13 +-
 .../bindings/ufs/snps,tc-dwc-g210.yaml        |  51 ++++
 .../bindings/ufs/tc-dwc-g210-pltfrm.txt       |  26 --
 .../devicetree/bindings/ufs/ti,j721e-ufs.yaml |   9 +-
 .../devicetree/bindings/ufs/ufs-common.yaml   |  88 +++++++
 .../devicetree/bindings/ufs/ufs-hisi.txt      |  42 ---
 .../devicetree/bindings/ufs/ufs-mediatek.txt  |  45 ----
 .../devicetree/bindings/ufs/ufs-qcom.txt      |  63 -----
 .../devicetree/bindings/ufs/ufshcd-pltfrm.txt |  90 -------
 MAINTAINERS                                   |   1 +
 arch/arm64/boot/dts/hisilicon/hi3670.dtsi     |   4 +-
 .../boot/dts/qcom/msm8996-xiaomi-common.dtsi  |   1 -
 arch/arm64/boot/dts/qcom/msm8996.dtsi         |   5 +-
 arch/arm64/boot/dts/qcom/msm8998.dtsi         |   2 +-
 arch/arm64/boot/dts/qcom/sdm845.dtsi          |   2 +-
 arch/arm64/boot/dts/qcom/sm8150.dtsi          |   2 +-
 arch/arm64/boot/dts/qcom/sm8250.dtsi          |   2 +-
 arch/arm64/boot/dts/qcom/sm8350.dtsi          |   5 +-
 arch/arm64/boot/dts/qcom/sm8450.dtsi          |   2 +-
 arch/arm64/boot/dts/ti/k3-j721e-main.dtsi     |   4 +-
 drivers/scsi/ufs/ufshcd-pltfrm.c              |  21 +-
 26 files changed, 641 insertions(+), 335 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/ufs/cdns,ufshc.txt
 create mode 100644 Documentation/devicetree/bindings/ufs/cdns,ufshc.yaml
 create mode 100644 Documentation/devicetree/bindings/ufs/hisilicon,ufs.yaml
 create mode 100644 Documentation/devicetree/bindings/ufs/mediatek,ufs.yaml
 create mode 100644 Documentation/devicetree/bindings/ufs/qcom,ufs.yaml
 create mode 100644 Documentation/devicetree/bindings/ufs/snps,tc-dwc-g210.yaml
 delete mode 100644 Documentation/devicetree/bindings/ufs/tc-dwc-g210-pltfrm.txt
 create mode 100644 Documentation/devicetree/bindings/ufs/ufs-common.yaml
 delete mode 100644 Documentation/devicetree/bindings/ufs/ufs-hisi.txt
 delete mode 100644 Documentation/devicetree/bindings/ufs/ufs-mediatek.txt
 delete mode 100644 Documentation/devicetree/bindings/ufs/ufs-qcom.txt
 delete mode 100644 Documentation/devicetree/bindings/ufs/ufshcd-pltfrm.txt

-- 
2.32.0

