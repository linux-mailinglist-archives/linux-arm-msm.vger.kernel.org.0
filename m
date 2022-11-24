Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 876A0637787
	for <lists+linux-arm-msm@lfdr.de>; Thu, 24 Nov 2022 12:23:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229662AbiKXLXH (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 24 Nov 2022 06:23:07 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54710 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229644AbiKXLXB (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 24 Nov 2022 06:23:01 -0500
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com [IPv6:2a00:1450:4864:20::434])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A433F240B3
        for <linux-arm-msm@vger.kernel.org>; Thu, 24 Nov 2022 03:22:59 -0800 (PST)
Received: by mail-wr1-x434.google.com with SMTP id cl5so2004793wrb.9
        for <linux-arm-msm@vger.kernel.org>; Thu, 24 Nov 2022 03:22:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=gXR2AhxG13+su5ph3WglxB5pxGBwrnq58ytBv+rrwnQ=;
        b=s3US92QdLLiTMQq2vvm4ejtfW2frUdHcQJUrvMlTD/PRGTszNAARD1E1+L6K/oEqUN
         YHMn6C5RZ00of9L/Le1ayFE5GjNATlrFu7bsYiBzHct54FLEzGaAFH19AdcuFowabMcu
         L9XGanVRI5rVn1i1FwFvjjJmeqqfrDQZj76v1coXpnGiYb9rgMOLsO44uq3KAex1mlKd
         JhWLQDnIuVBmxd6iG/otEC2nbdjzQkQ9Xaaws2U5n2onqlsYmfGCVXUYzdwK4FC44yaR
         rCsfyDZdpqJ5ABNs/GD4LUo128oIB0/fg2M7HdA8qkuH0iYBZQ8fE7qyg5uhb1zw7FrZ
         Rp9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gXR2AhxG13+su5ph3WglxB5pxGBwrnq58ytBv+rrwnQ=;
        b=do0KjPPmqSPYR+CU0EIpRuVew6C5gyYxlp8yDj9iPbUx8TKksj/DjI4VAkwGJ1ZNz7
         T2mTaKvvGoTmlqOjPeOEQXj9xkjWOdnhM2Gq6OkK4fDUQIxbz2QvZtc6JD9PzzNnDvSw
         gvsaE9srG/9EqPPxzZqOTJQRLgkB075/6cbbAtf29yT2H94YI89tCL9FK6JwIHYTG3gI
         xKQWIvzhjgHWb/x31uBoP/Q0rjlFDoScNuWi6W9tnbqFA9Zc3u2Rlp2VOJQWwcFVCyiH
         PuflTMOmxsMvBa6SLK56aC7qMKc4662qvFPGIgxOy/l9lgBE5rthqyWI+O7hSt7KFTx9
         A1vA==
X-Gm-Message-State: ANoB5pmcJk5M9nEIcTNt21VEnfEaK9keAHDBQ4f3WCqS8wTFfDpmjyhy
        3c3DVnxzpvasEowAwzN7eyn3Pg==
X-Google-Smtp-Source: AA0mqf6YluD+y7nO/iNhOLHGQigKyvQkBKWEiM9UOPWWBerS+tO/fQRkdMNV1F6/mmkknY8Lpsvxdg==
X-Received: by 2002:adf:cf0f:0:b0:241:bf8f:789f with SMTP id o15-20020adfcf0f000000b00241bf8f789fmr17400056wrj.684.1669288978195;
        Thu, 24 Nov 2022 03:22:58 -0800 (PST)
Received: from localhost.localdomain ([94.52.112.99])
        by smtp.gmail.com with ESMTPSA id j23-20020a05600c1c1700b003cf57329221sm5839461wms.14.2022.11.24.03.22.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Nov 2022 03:22:57 -0800 (PST)
From:   Abel Vesa <abel.vesa@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Georgi Djakov <djakov@kernel.org>,
        Odelu Kukatla <okukatla@codeaurora.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     Melody Olvera <quic_molvera@quicinc.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-pm@vger.kernel.org
Subject: [PATCH v2 0/3] interconnect: qcom: Add support for SM8550
Date:   Thu, 24 Nov 2022 13:22:29 +0200
Message-Id: <20221124112232.1704144-1-abel.vesa@linaro.org>
X-Mailer: git-send-email 2.34.1
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

This patchset adds interconnect support for SM8550.

First version was here:
https://lore.kernel.org/all/20221116114526.2679041-1-abel.vesa@linaro.org/

Changes since v1:
 * dropped the changes in qcom,rpmh.yaml
 * added dedicated schema file for sm8550
 * dropped the extra spaces/tabs from the bindings header
 * added const where necessary in the driver file
 * switched to dev_err_probe, like Krzysztof suggested

Abel Vesa (3):
  dt-bindings: interconnect: Add schema for SM8550
  dt-bindings: interconnect: Add Qualcomm SM8550
  interconnect: qcom: Add SM8550 interconnect provider driver

 .../interconnect/qcom,sm8550-rpmh.yaml        |  141 +
 drivers/interconnect/qcom/Kconfig             |    9 +
 drivers/interconnect/qcom/Makefile            |    2 +
 drivers/interconnect/qcom/sm8550.c            | 2319 +++++++++++++++++
 drivers/interconnect/qcom/sm8550.h            |  178 ++
 .../dt-bindings/interconnect/qcom,sm8550.h    |  190 ++
 6 files changed, 2839 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/interconnect/qcom,sm8550-rpmh.yaml
 create mode 100644 drivers/interconnect/qcom/sm8550.c
 create mode 100644 drivers/interconnect/qcom/sm8550.h
 create mode 100644 include/dt-bindings/interconnect/qcom,sm8550.h

-- 
2.34.1

