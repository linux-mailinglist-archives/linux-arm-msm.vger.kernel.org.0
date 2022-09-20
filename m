Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CDEFF5BF057
	for <lists+linux-arm-msm@lfdr.de>; Wed, 21 Sep 2022 00:43:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229917AbiITWlP (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 20 Sep 2022 18:41:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53166 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230011AbiITWlN (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 20 Sep 2022 18:41:13 -0400
Received: from mail-io1-xd2f.google.com (mail-io1-xd2f.google.com [IPv6:2607:f8b0:4864:20::d2f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1AA556745A;
        Tue, 20 Sep 2022 15:41:13 -0700 (PDT)
Received: by mail-io1-xd2f.google.com with SMTP id e205so3648477iof.1;
        Tue, 20 Sep 2022 15:41:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=acW7PJVhTdYkBA5AQtbnFebc9arCNth7+PSPtDUOpfo=;
        b=Z7MfnCYcIcim+qqGvphgdH4M33YcLAgeUBN/vd7YOmveeq0iFnPxHE7TpTg7DEDD6+
         uYFuiywHF3WYbOmv+QL9m+J2pz58MmH7KMs3mF6vE8GyVuJ5Vpkx3/16RgCRPKl1fk7k
         pRqbgW9P6rMxskMJZc1687WQPqkXx9/rN4UwYu9j+PfxKEKGR6V2uJ1Tyar9NIPcuyet
         7jclsmn1PGvzS9U8bK7IUVmoW2ZoGB69YO+HFm6ZlodFQkvXRmqyz0CftzZlF//Zj01j
         oDvuYWgP3FdKx/9DoP8pEwdSJAzQMXJJdLv42/DJ6gUizhZAn9Ig8HZGHHffIi5m7lNR
         h8mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=acW7PJVhTdYkBA5AQtbnFebc9arCNth7+PSPtDUOpfo=;
        b=mbZrWMz4H2u6Q4UwgtBbRLw4oHIH3e7kC2DjmwDQQmBKT2cJ2DuT45PLNPY7/kIhDs
         vm6thH5vpU1Gcdoya7O4rYXnHgUi8VaJ8W8W3wec6PnDFUj21dB5mvIUlY9ZgcbIdeK3
         MNFxbiPpZaocJ4tDyEiuICWrAY8pZ0pg/84IBzXpbdjLRpjpC3/RBngKa2C70M9/TGAt
         TKjVUey1CD6NMI4ybtwfocFjocAFJPNIgKlmDt1AmjgeLrGym9wdgg8m8vUcVpZLQSvt
         2ICTimtA0ZZW5my0Vtl98CKv/AtUcl5Mn0QxaGyg58cvPOfHKxN0DCQu0q0eKl4+Ucq8
         3AcQ==
X-Gm-Message-State: ACgBeo0UtOlGkaQDKMQppEJ9LYzAZMa24dvdM2B0DFhz9e2ib+Qvvf6X
        IaA8QGwJAbMIPw4WQq5ChNtHhcRNQMM=
X-Google-Smtp-Source: AMsMyM4+jkCURRFCGrTl3ABYsRbi62hzjYjzbfVsh34hPDSBdB4BV1fhwMex+w5glFTMlUA8vM0n+Q==
X-Received: by 2002:a05:6638:24c8:b0:35a:41e1:856b with SMTP id y8-20020a05663824c800b0035a41e1856bmr11958362jat.99.1663713672301;
        Tue, 20 Sep 2022 15:41:12 -0700 (PDT)
Received: from localhost ([2607:fea8:a2e2:2d00::a533])
        by smtp.gmail.com with UTF8SMTPSA id t5-20020a026405000000b00349be675e76sm367177jac.131.2022.09.20.15.41.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 20 Sep 2022 15:41:11 -0700 (PDT)
From:   Richard Acayan <mailingradian@gmail.com>
To:     linux-arm-msm@vger.kernel.org
Cc:     Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
        Joerg Roedel <joro@8bytes.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Sai Prakash Ranjan <quic_saipraka@quicinc.com>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Rob Clark <robdclark@chromium.org>,
        Sibi Sankar <sibis@codeaurora.org>,
        Loic Poulain <loic.poulain@linaro.org>,
        Vinod Koul <vkoul@kernel.org>, iommu@lists.linux.dev,
        devicetree@vger.kernel.org,
        Richard Acayan <mailingradian@gmail.com>
Subject: [PATCH 1/2] dt-bindings: iommu: arm-smmu: add sdm670 compatible
Date:   Tue, 20 Sep 2022 18:39:55 -0400
Message-Id: <20220920223955.151507-2-mailingradian@gmail.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20220920223955.151507-1-mailingradian@gmail.com>
References: <20220920223955.151507-1-mailingradian@gmail.com>
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

The Snapdragon 670 needs the IOMMU for GENI I2C. Add a compatible string in
the documentation to represent its support.

Signed-off-by: Richard Acayan <mailingradian@gmail.com>
---
 Documentation/devicetree/bindings/iommu/arm,smmu.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/iommu/arm,smmu.yaml b/Documentation/devicetree/bindings/iommu/arm,smmu.yaml
index 9066e6df1ba1..5ad6dc64e1c4 100644
--- a/Documentation/devicetree/bindings/iommu/arm,smmu.yaml
+++ b/Documentation/devicetree/bindings/iommu/arm,smmu.yaml
@@ -38,6 +38,7 @@ properties:
               - qcom,sc7280-smmu-500
               - qcom,sc8180x-smmu-500
               - qcom,sc8280xp-smmu-500
+              - qcom,sdm670-smmu-500
               - qcom,sdm845-smmu-500
               - qcom,sdx55-smmu-500
               - qcom,sdx65-smmu-500
-- 
2.37.3

