Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C5240740116
	for <lists+linux-arm-msm@lfdr.de>; Tue, 27 Jun 2023 18:27:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232243AbjF0Q0z (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 27 Jun 2023 12:26:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46134 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232267AbjF0QY6 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 27 Jun 2023 12:24:58 -0400
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com [IPv6:2a00:1450:4864:20::12e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A0C1730F1
        for <linux-arm-msm@vger.kernel.org>; Tue, 27 Jun 2023 09:24:56 -0700 (PDT)
Received: by mail-lf1-x12e.google.com with SMTP id 2adb3069b0e04-4f865f0e16cso6560287e87.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 27 Jun 2023 09:24:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1687883095; x=1690475095;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xPNg5vny77tvK7IJAfh5JkOu6WowF9wjESyOAY+a1Tg=;
        b=wT4UzEMp3D2z+CEciSOj2hOqJZY5IsO6ESwlLi6JpPKPVleeLPbEYQowD4j6ugDDWT
         Xsekoq3dAMFIe2qSha7QD5qXwQK7uvTB6BiLhhzYloSKH2DUuxfYiK6ynHQf2ri1d2c1
         Yia2iEKdlcVgPDQx2b9Z8S09tPtYnMMz4koijj0kOEogFOMnrkkPJthflCOJDrz34rZ5
         VwnYMEmbL3YNE8ElBGdgiBCOyXavqYtRbS4Z6W3D5oGCPCTo//ykefDkMq0NfHPVL3Zs
         /WmtNQzYvKoXfJ6zYDHEJ1lCyAJ49i1gWKSv1N2fqbVfHVreFhWFLTVqIFYR6dTTqWOv
         B+hQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687883095; x=1690475095;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xPNg5vny77tvK7IJAfh5JkOu6WowF9wjESyOAY+a1Tg=;
        b=doR9J6O9mT1hjXoNOCJfmo+5hJJVbnXX3bW3FriqEbjZSjK7t83QJkcSlxNBY5gCYt
         SeKslC4+eMd4PtcwZaPi7UobyBMTj04JUWTxCLX0RnbyQoejgcZsuYZg1+h19YBr4qwn
         cI03k4rbXC4d/Jb57MW2OTWrk1waP8MwL3QREQdlmg39ehvBFzmjjGXYMsIc/5O6Ks1I
         2yW73lGjNIed9pcwzG6nBdcbgNuXoWHqFfQYFTlJBYBxde0OvrSrcDD+rxI7buuDO+zY
         JxEhWWdwKW5PEtx+VgV5w0fkL9Sxt2zOIqh1TlLvKN7jrFONFWsh+3iVpbpLXvMT1lQ2
         1XVQ==
X-Gm-Message-State: AC+VfDzItWun9m+ysDOYjDrzWHsLDa/pOsGlZsy41HktlkeuDYmGYKM/
        F8PrtybJ+b2OtDEAquw9j7tdnQ==
X-Google-Smtp-Source: ACHHUZ5//rTUoalDl1QqK0Ki39B5TbO1+DYtkIbMhpfMKaAAAhwU2SHZDezjmb3zz2NxqSeNX+6TzQ==
X-Received: by 2002:a05:6512:2824:b0:4fb:7888:7e6d with SMTP id cf36-20020a056512282400b004fb78887e6dmr4544050lfb.46.1687883095019;
        Tue, 27 Jun 2023 09:24:55 -0700 (PDT)
Received: from [192.168.1.101] (abxj103.neoplus.adsl.tpnet.pl. [83.9.3.103])
        by smtp.gmail.com with ESMTPSA id g7-20020a19ac07000000b004fb259a5589sm1190508lfc.104.2023.06.27.09.24.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Jun 2023 09:24:54 -0700 (PDT)
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
Date:   Tue, 27 Jun 2023 18:24:23 +0200
Subject: [PATCH 07/11] dt-bindings: iommu: qcom_iommu: Allow 'tbu' clock
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230627-topic-more_bindings-v1-7-6b4b6cd081e5@linaro.org>
References: <20230627-topic-more_bindings-v1-0-6b4b6cd081e5@linaro.org>
In-Reply-To: <20230627-topic-more_bindings-v1-0-6b4b6cd081e5@linaro.org>
To:     cros-qcom-dts-watchers@chromium.org,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Benjamin Li <benl@squareup.com>,
        James Willcox <jwillcox@squareup.com>,
        Joseph Gates <jgates@squareup.com>,
        Stephan Gerhold <stephan@gerhold.net>,
        Zac Crosby <zac@squareup.com>,
        Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
        Banajit Goswami <bgoswami@quicinc.com>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>, Lee Jones <lee@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Xu Yang <xu.yang_2@nxp.com>, Peng Fan <peng.fan@nxp.com>,
        Christian Marangi <ansuelsmth@gmail.com>,
        Wesley Cheng <quic_wcheng@quicinc.com>,
        Jun Nie <jun.nie@linaro.org>, Max Chen <mchen@squareup.com>,
        Shawn Guo <shawn.guo@linaro.org>,
        Vivek Gautam <vivek.gautam@codeaurora.org>
Cc:     Marijn Suijten <marijn.suijten@somainline.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Vincent Knecht <vincent.knecht@mailoo.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        alsa-devel@alsa-project.org, iommu@lists.linux.dev,
        linux-usb@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Leo Yan <leo.yan@linaro.org>, Rob Herring <robh@kernel.org>,
        Andy Gross <andy.gross@linaro.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1687883074; l=1161;
 i=konrad.dybcio@linaro.org; s=20230215; h=from:subject:message-id;
 bh=dxmGowAABZGGJvN38BvE9OivxrhsE/2mFCf47Qi+lvI=;
 b=wzz2xUcbFtxUiSi4ThrPFbDIaElQBro5YtXx/lBo+PD1GGVfkejB8EYDpam4TZsF1HGcnDTRP
 unvzC8nqkCDCKapltiz8/h5Mv3Va5gUnt0oPVF9FgChKOoZXy8L9VnG
X-Developer-Key: i=konrad.dybcio@linaro.org; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Some IOMMUs on some platforms (there doesn't seem to be a good denominator
for this) require the presence of a third clock, specifically for
accessing the IOMMU's Translation Buffer Unit (TBU). Allow it.

Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
 Documentation/devicetree/bindings/iommu/qcom,iommu.yaml | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/iommu/qcom,iommu.yaml b/Documentation/devicetree/bindings/iommu/qcom,iommu.yaml
index d9fabdf930d9..3b7acb459f8e 100644
--- a/Documentation/devicetree/bindings/iommu/qcom,iommu.yaml
+++ b/Documentation/devicetree/bindings/iommu/qcom,iommu.yaml
@@ -24,14 +24,18 @@ properties:
       - const: qcom,msm-iommu-v1
 
   clocks:
+    minItems: 2
     items:
       - description: Clock required for IOMMU register group access
       - description: Clock required for underlying bus access
+      - description: Clock required for Translation Buffer Unit access
 
   clock-names:
+    minItems: 2
     items:
       - const: iface
       - const: bus
+      - const: tbu
 
   power-domains:
     maxItems: 1

-- 
2.41.0

