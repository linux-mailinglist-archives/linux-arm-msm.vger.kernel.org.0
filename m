Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 84614510CAE
	for <lists+linux-arm-msm@lfdr.de>; Wed, 27 Apr 2022 01:33:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1356111AbiDZXgW (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 26 Apr 2022 19:36:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44910 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240844AbiDZXgU (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 26 Apr 2022 19:36:20 -0400
Received: from mail-ot1-x335.google.com (mail-ot1-x335.google.com [IPv6:2607:f8b0:4864:20::335])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0D67A29837
        for <linux-arm-msm@vger.kernel.org>; Tue, 26 Apr 2022 16:33:12 -0700 (PDT)
Received: by mail-ot1-x335.google.com with SMTP id k29-20020a056830243d00b006040caa0988so18222ots.6
        for <linux-arm-msm@vger.kernel.org>; Tue, 26 Apr 2022 16:33:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=2rWRDWP0a5f/QFMglO+k4EsyMZUyMz/wbOdfsseufEI=;
        b=zLGCBAHdg0gWeCFkr5arjA98SduUEQePrk5yA8MINItmqFvAtFnTX76haYkWEbqQIc
         oj6qzo47XVBFlXjjSk89keHfEV6bvqGYjq2/wxoi2MmXjOcSLe3FNo/icHxtBCdnf8+C
         SHOcAaZnY9YsAg8P9d2a1y0VjPhOHxc4lJ1k8VqB30H56SGH512n5Q2V0sTbFlUTu9dS
         +fzwm4g+KAJKk/sGkf+2eXEGrkGLwSzKTl2Ac0gStaBNOaNjau12aeCd2ytX/VaPbCGP
         Dv58mbS3/Zs9ECBYZFy4KbSbv3Y4rr3+0xMccqGtAHVmOlSYYsO2+86Z34JmZnaxGD3B
         eowg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=2rWRDWP0a5f/QFMglO+k4EsyMZUyMz/wbOdfsseufEI=;
        b=pK0DdJthEacIrH7CFCwHj/Ve1JjvEZXI8GOyjaMwVKcblusNb4z/HXWKDGVddVKn1Z
         7eU86QrdPuvCdIeA77wVwuwsfSSV01b8o5HUYGLwidpA3K+Lv0RkU5povrNtkTCe33qX
         jXcQfPIZxdf+Fczp7ruME8eLzUJb26rSTV6Vt+um3hn5LqPoIB3W+4d4xeob2kQeHS2k
         luEjzEulnS/b7k0DHMS6xvsjpxDw0KLoZ5mSUkV6GUNnwwTvKbAb2e6Yq5a960opvbZZ
         h8SIxsO85fH5Xm/MTaJEgv2CvDkxDQk+zh9gKgA71XtCDjrV68QJbQV3P9xU74E7kXyo
         1BKg==
X-Gm-Message-State: AOAM5316LtCBj86VF8wUPc9Uatcab1/QZLL6EhZvUWMsKhZHD97cPntg
        CSQ2GjCVt/WAj8TLpWmB0tOs6W9MHDdNLFSu
X-Google-Smtp-Source: ABdhPJz3jcPffvaggSe8FfChkFNVgRvkTqkw8eUkmEnYTaivYzF4HopEe36ocJMIopf1mVTasUOPdw==
X-Received: by 2002:a05:6830:408e:b0:605:5af2:b124 with SMTP id x14-20020a056830408e00b006055af2b124mr9129644ott.201.1651015991423;
        Tue, 26 Apr 2022 16:33:11 -0700 (PDT)
Received: from ripper.. ([2600:1700:a0:3dc8:205:1bff:fec0:b9b3])
        by smtp.gmail.com with ESMTPSA id k2-20020a4adfa2000000b0033a3381a7f1sm6151658ook.44.2022.04.26.16.33.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 Apr 2022 16:33:10 -0700 (PDT)
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Johan Hovold <johan+linaro@kernel.org>
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v2 0/3] soc: qcom: rpmhpd: Add sc8280xp and sa8540p
Date:   Tue, 26 Apr 2022 16:35:05 -0700
Message-Id: <20220426233508.1762345-1-bjorn.andersson@linaro.org>
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

Add compatibles and power-domain definitions for the sc8280xp and sa8540p
platforms.

Bjorn Andersson (3):
  dt-bindings: power: rpmpd: Add sc8280xp RPMh power-domains
  soc: qcom: rpmhpd: Don't warn about sparse rpmhpd arrays
  soc: qcom: rpmhpd: add sc8280xp & sa8540p rpmh power-domains

 .../devicetree/bindings/power/qcom,rpmpd.yaml |  2 +
 drivers/soc/qcom/rpmhpd.c                     | 57 ++++++++++++++++++-
 include/dt-bindings/power/qcom-rpmpd.h        | 18 ++++++
 3 files changed, 74 insertions(+), 3 deletions(-)

-- 
2.35.1

