Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6EA3B6BAD65
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Mar 2023 11:18:23 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232384AbjCOKSV (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 15 Mar 2023 06:18:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60676 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232385AbjCOKSN (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 15 Mar 2023 06:18:13 -0400
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com [IPv6:2a00:1450:4864:20::134])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AEC7F7BA3B
        for <linux-arm-msm@vger.kernel.org>; Wed, 15 Mar 2023 03:17:39 -0700 (PDT)
Received: by mail-lf1-x134.google.com with SMTP id br6so5442144lfb.11
        for <linux-arm-msm@vger.kernel.org>; Wed, 15 Mar 2023 03:17:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1678875453;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4mVib2SQhjnabJuNfanRQuN8OwXyuuhKDz+4R8hh41s=;
        b=EVqfGj/1v4vTp/MAGYJZY73U5VV+Axb2CBGMLBLJC/Dhe6jUarm53oC34Tcr1D736U
         Dmk4Vm2cQWSzzkgdh1fMXn35boqRJ91O57m1zAopjT7mCyXPmEtjP3npaL+e9g3yrMWF
         L4L2cu1mdRqMDAW4rydo7OFT5e11+RIutPgSfFI3D01/BFj+7QmPcPEUSup9nALxhk7A
         riQ7gWULvmcAJqyf9D1SKtJB9RFyUZU+HAPwlpHz0GAgMpIsNHbzCCWyXDuL0QgXD+6L
         gKjZ33R6Yj8v1x7cS+ZmdxAxlN8J2q/I3Zy9mOeP2pldMwkL8HbUWJrEPK7SsnAFln0a
         EUng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678875453;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4mVib2SQhjnabJuNfanRQuN8OwXyuuhKDz+4R8hh41s=;
        b=AETAmVdcy/1LXMAN1ZaRKGnJ7mTHcmCmtMCku6oirBlpMHEgcSK0YcuTpM59oMEbQa
         RnOTWn2gPq/b/mS7Y/hpfZWvJijt4Ji/UsHjcSqNlr65FhfUK253AclRygXV8wNH5bcO
         aIt0T3nuWxOqeLqQBQE005hZpckmeahh2WHm/0q8YPCMlm2zxLVWryWO8UngWa+AlV8q
         5We+9j+Yopci3FDzYaeCi89Uh646haJ5ID1gQCu6efkX7BceicSLf9tiePPIn+poEjs0
         0YqsqHEtzjFiTg00YfL3rKtJFel5bBAlppkTgku8ERiAXVp1cgKT81ZjWME4y3eT+RRz
         tznw==
X-Gm-Message-State: AO0yUKX15MANAf0m8OJ4dNCMM2tBWkhdDs4hnjS4zy1ZQ5m/d7LFJcQM
        bDv3K6yeCcu+T7G2ogWCMBOx/Q==
X-Google-Smtp-Source: AK7set82lRVKIokFqJhumgQRld/lqcG9lKsXxsQ04S/k9Byikbkp0r0wt0C+myotRnHsRHzVLdFoaw==
X-Received: by 2002:ac2:5df6:0:b0:4d5:a0d2:f542 with SMTP id z22-20020ac25df6000000b004d5a0d2f542mr1777512lfq.18.1678875453406;
        Wed, 15 Mar 2023 03:17:33 -0700 (PDT)
Received: from [192.168.1.101] (abyj16.neoplus.adsl.tpnet.pl. [83.9.29.16])
        by smtp.gmail.com with ESMTPSA id f16-20020a19ae10000000b004ccff7c56a8sm764350lfc.27.2023.03.15.03.17.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Mar 2023 03:17:32 -0700 (PDT)
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
Date:   Wed, 15 Mar 2023 11:17:26 +0100
Subject: [PATCH v2 1/2] dt-bindings: arm: qcom,ids: Add IDs for
 QCM2290/QRB2210
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230314-topic-scuba_socinfo-v2-1-44fa1256aa6d@linaro.org>
References: <20230314-topic-scuba_socinfo-v2-0-44fa1256aa6d@linaro.org>
In-Reply-To: <20230314-topic-scuba_socinfo-v2-0-44fa1256aa6d@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     Marijn Suijten <marijn.suijten@somainline.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.12.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1678875450; l=972;
 i=konrad.dybcio@linaro.org; s=20230215; h=from:subject:message-id;
 bh=tDprr0rwAmNhl3ej6q9ZfRmgJ4BbZeyquuUIV9lVLF8=;
 b=reiHLjpjHNVmmApH9V1+ujUwoHvwX0S283+R9SDQfwbIAgKKnYn/KB7KJ6JpUU3GNzfRM6RaecAm
 h3nFMfuCCEEuRRDYYPoKcV68BmN1ZKc/LwBLjVGs4PBfClW4ON0v
X-Developer-Key: i=konrad.dybcio@linaro.org; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=
X-Spam-Status: No, score=-0.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_SORBS_HTTP,RCVD_IN_SORBS_SOCKS,SPF_HELO_NONE,SPF_PASS,
        URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add the missing IDs for scuba and its QRB variant.

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
 include/dt-bindings/arm/qcom,ids.h | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/include/dt-bindings/arm/qcom,ids.h b/include/dt-bindings/arm/qcom,ids.h
index aa95439708dc..0ce2fb3d4ca8 100644
--- a/include/dt-bindings/arm/qcom,ids.h
+++ b/include/dt-bindings/arm/qcom,ids.h
@@ -213,6 +213,7 @@
 #define QCOM_ID_QCM2150			436
 #define QCOM_ID_SDA429W			437
 #define QCOM_ID_SM8350			439
+#define QCOM_ID_QCM2290			441
 #define QCOM_ID_SM6115			444
 #define QCOM_ID_SC8280XP		449
 #define QCOM_ID_IPQ6005			453
@@ -229,6 +230,7 @@
 #define QCOM_ID_SC7180P			495
 #define QCOM_ID_SM6375			507
 #define QCOM_ID_SM8550			519
+#define QCOM_ID_QRB2210			524
 #define QCOM_ID_QRU1000			539
 #define QCOM_ID_QDU1000			545
 #define QCOM_ID_QDU1010			587

-- 
2.39.2

