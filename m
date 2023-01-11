Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1158E665B60
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Jan 2023 13:30:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232486AbjAKMaZ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 11 Jan 2023 07:30:25 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44256 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232011AbjAKMaY (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 11 Jan 2023 07:30:24 -0500
Received: from mail-pf1-x42c.google.com (mail-pf1-x42c.google.com [IPv6:2607:f8b0:4864:20::42c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F2E743887
        for <linux-arm-msm@vger.kernel.org>; Wed, 11 Jan 2023 04:30:20 -0800 (PST)
Received: by mail-pf1-x42c.google.com with SMTP id c85so8002862pfc.8
        for <linux-arm-msm@vger.kernel.org>; Wed, 11 Jan 2023 04:30:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=zABXTqnOS+sR0VK+tpmly/TmJdJD8fpPZyXdF/Osuvk=;
        b=ZpVtu/tC+7kESiiDpzePypwP/SBHfWV1Q1lpfMXwgwfHUHxxOIpgU6N4lpj9p4Vsfa
         QT9RcdK8fosGAKDoNV2xikqckVNwHSKqpJSt2tA70diYHYlyLBjjacnWmxDnFBUOju7g
         7nXCyuxkiI0Gz3OlJUA/SWBo4hdMAVBo5TNNWCOmRbPANq+jnQ2YILIYxX4WWVBzuzwt
         qwKTu/uQ88wYL7O3Ux6PjfF70p/5qNbHmvjJOMLFjPw1tnf3FCk2SBfwMTOe/vu6P2N9
         k/ZMLSgOfephCGiu3HL/rG4S+Al7DAYP4PI/5KAAcHobyVD76szr9sm6i/u5jaOhtLvH
         /9dQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zABXTqnOS+sR0VK+tpmly/TmJdJD8fpPZyXdF/Osuvk=;
        b=K2qZC5UMOQMHS3PDEud7FLRCRkoM7wDabdXX+NCdVo0f/Qi7bSYD6KO9QJ18bQAc75
         +Wa+iPo7Uv22p78t54u1nkgdz4+GBzXPnDfRaPWpQJ30XVZKDrolKdVLx73tihShpWTi
         OsJsmg4tIySz0kWHfykHq1AdA0wgiEE/yjkO6C/GZI6rIac3xK+y9vcAtM0XbOd5SDZK
         gfRkLDUfIviafnqT/vrsZbriqiuoQuHOJsvYgdf6CbKbF9vkGf58QBjOuUwdpS9JrXwl
         zvmTtcUvTQhXmrMnsRC/AFg2aVqoXXyiAVVbbxz7mMo3qXTZnIlykUOPkZ0bwiXgecN/
         Vlow==
X-Gm-Message-State: AFqh2kq1yYpIyT0eNONZvl/Ywei/jcbj2DF716qxTiNLNiqAKpW7j9LW
        I3W6IzDSNehQfGsYMxM7QFSm
X-Google-Smtp-Source: AMrXdXuEZXSoRWhbdC7h8lpHjLHieghHad2OGWe1QGcJ68zuacvSMxcyChFDucfQfzbarERJw7DJ5w==
X-Received: by 2002:a05:6a00:a1d:b0:581:73c4:f0bb with SMTP id p29-20020a056a000a1d00b0058173c4f0bbmr65449291pfh.2.1673440220454;
        Wed, 11 Jan 2023 04:30:20 -0800 (PST)
Received: from localhost.localdomain ([117.217.177.1])
        by smtp.gmail.com with ESMTPSA id c15-20020aa7952f000000b005747b59fc54sm8719594pfp.172.2023.01.11.04.30.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Jan 2023 04:30:19 -0800 (PST)
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     andersson@kernel.org, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org
Cc:     bhelgaas@google.com, konrad.dybcio@linaro.org,
        linux-arm-msm@vger.kernel.org, linux-pci@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        lpieralisi@kernel.org,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
        Rob Herring <robh@kernel.org>
Subject: [PATCH 1/2] dt-bindings: PCI: qcom: Allow both GIC-ITS and internal MSI controller
Date:   Wed, 11 Jan 2023 18:00:03 +0530
Message-Id: <20230111123004.21048-1-manivannan.sadhasivam@linaro.org>
X-Mailer: git-send-email 2.25.1
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

The binding should specify both MSI implementations and the OS/driver
should choose the one based on the platform requirements.

Fixes: 2b0d557419cd ("dt-bindings: PCI: qcom: Allow both GIC-ITS and internal MSI controller")
Suggested-by: Rob Herring <robh@kernel.org>
Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
---
 Documentation/devicetree/bindings/pci/qcom,pcie.yaml | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/pci/qcom,pcie.yaml b/Documentation/devicetree/bindings/pci/qcom,pcie.yaml
index 01208450e05c..e106bdf93f09 100644
--- a/Documentation/devicetree/bindings/pci/qcom,pcie.yaml
+++ b/Documentation/devicetree/bindings/pci/qcom,pcie.yaml
@@ -119,7 +119,7 @@ required:
   - clocks
   - clock-names
 
-oneOf:
+anyOf:
   - required:
       - interrupts
       - interrupt-names
-- 
2.25.1

