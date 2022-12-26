Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 58E95655F55
	for <lists+linux-arm-msm@lfdr.de>; Mon, 26 Dec 2022 04:11:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231519AbiLZDLI (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 25 Dec 2022 22:11:08 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41748 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229804AbiLZDLG (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 25 Dec 2022 22:11:06 -0500
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com [IPv6:2a00:1450:4864:20::12a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E9A25C15
        for <linux-arm-msm@vger.kernel.org>; Sun, 25 Dec 2022 19:11:01 -0800 (PST)
Received: by mail-lf1-x12a.google.com with SMTP id bq39so6760410lfb.0
        for <linux-arm-msm@vger.kernel.org>; Sun, 25 Dec 2022 19:11:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=xCxzLVf2hWUuKQW8OMy2XQ3RUyeAaq22gTKfh7WKh4U=;
        b=hQIuSbsfbmlPARYuxNQwe4qSwEgYlbiOx6KYQRcH1k0LpsQxmW+FA/gXHE3lcX1p9+
         AKL4BAdnuGZ2VsyqMJlruS4ITeqCC4R5hw3Kt5iSLeAuDHfSvNaru1aXeFba9onDONtm
         U9UusTUy5MT+QGi8a/Zc+2v0n1JhTVNQkyqucWSOsu62dtsRIN2GC1W5DeLp7ssVnDeE
         fi0HIzu86On5zb+1Xk025AiXdDAdmEXvUgKFK1hCsbQOcGSh2qX8HnpC/CnPdZTgdZZB
         MTWZ4BLmSeDcNaoPnkkvC1OTY66x9mTOvvo8hBFAB1xDrwJ4vyStdv1CPWrEYOI52bMR
         NoTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xCxzLVf2hWUuKQW8OMy2XQ3RUyeAaq22gTKfh7WKh4U=;
        b=kJmXnlRwqdI1Ad3WGzHANCU+snYyMNrME3LsVnZPZQH+Q3BljvXUR2UDKKhVMzD7eB
         lXPrFzA7kPjIDRdVUa0ELd0zvApoNJmW+y2EptNlEcBBI5SKICh8lGIL3ZfigYxizml6
         xlnkXbx0toOz83o57eXapMTvfdD8iYl3Q9rKKK1Dh3u/niDEsuhxUcFP/dknbGIDuoo3
         D7Eq47z69VMd2lCaRsWklgEPNdJJ8iKpqh5GD5/6RJMc5GHEYzkMqpW0FY7i/zt+Mjx2
         rTJON9xBMYPUe08Vi3eoV7v3Sw2urV1k8/on9/JyiZodF3gJYgH+IWOyD/UE5GYvCmGA
         PDtw==
X-Gm-Message-State: AFqh2krgWKbPpebk+Wekuwrty5brnOf+kpQGM//c0HTJ6rj0ZMQT0NME
        tGhw42xwiVQDP1bZwfUCcTl2ew==
X-Google-Smtp-Source: AMrXdXsa9LCbzhYW+UV9AYutbv4orTGDloCpOs6CcMUL2eLTERixNfveBNLln72T/fHuKQXP+Tsxsg==
X-Received: by 2002:a05:6512:1527:b0:4ca:f4f2:49ab with SMTP id bq39-20020a056512152700b004caf4f249abmr4081935lfb.39.1672024260274;
        Sun, 25 Dec 2022 19:11:00 -0800 (PST)
Received: from eriador.lan (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
        by smtp.gmail.com with ESMTPSA id a12-20020a2e860c000000b0027f770526ebsm1165388lji.75.2022.12.25.19.10.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 Dec 2022 19:10:59 -0800 (PST)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Vinod Koul <vkoul@kernel.org>,
        Kishon Vijay Abraham I <kishon@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     Philipp Zabel <p.zabel@pengutronix.de>,
        linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org
Subject: [PATCH v2 0/3] phy: qualcomm: pcie2: register as clock provider
Date:   Mon, 26 Dec 2022 05:10:56 +0200
Message-Id: <20221226031059.2563165-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
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

On Qualcomm QCS404 platform the PCIe2 PHY provides PIPE clock to the gcc
(Global Clock Controller). Register the PHY as clock provider.

Changes since v1:
- Dropped 'phandle to' from supply descriptions in schema (Krzysztof),
- Reordered clock-related property definitions in schema as suggested by
  Krzysztof,
- Dropped extra empty line at the end of the schema (reported by
  Krzysztof).

Dmitry Baryshkov (3):
  dt-bindings: phy: qcom,pcie2-phy: convert to YAML format
  phy: qualcomm: pcie2: register as clock provider
  arm64: dts: qcom: qcs404: register PCIe PHY as a clock provider

 .../bindings/phy/qcom,pcie2-phy.yaml          | 87 +++++++++++++++++++
 .../bindings/phy/qcom-pcie2-phy.txt           | 42 ---------
 arch/arm64/boot/dts/qcom/qcs404.dtsi          |  1 +
 drivers/phy/qualcomm/phy-qcom-pcie2.c         |  6 +-
 4 files changed, 93 insertions(+), 43 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/phy/qcom,pcie2-phy.yaml
 delete mode 100644 Documentation/devicetree/bindings/phy/qcom-pcie2-phy.txt

-- 
2.35.1

