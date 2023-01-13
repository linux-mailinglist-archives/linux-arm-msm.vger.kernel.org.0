Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 62153669C37
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Jan 2023 16:30:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230171AbjAMPam (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 13 Jan 2023 10:30:42 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46708 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230233AbjAMPaF (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 13 Jan 2023 10:30:05 -0500
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com [IPv6:2a00:1450:4864:20::133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C53DF90E5A
        for <linux-arm-msm@vger.kernel.org>; Fri, 13 Jan 2023 07:22:39 -0800 (PST)
Received: by mail-lf1-x133.google.com with SMTP id b3so33604482lfv.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 13 Jan 2023 07:22:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9GR+M9kwc8eT2cs2wW/CNkkocF5x7PXcufqp311RRzs=;
        b=kee0KnZBB5mlhKrW/FuLH+F/KJSsHDofE6f9UQzffSBP4ulfmnjhL4JKmXnaA0DcEs
         TtbdNp5/m+YNQ6Uy8+L6Qua8t1AIj4uLIi7k1i25v0gU4EcH/79FUx+ZRveThzbMRTjv
         himR+KdZNmsmlCyUnJ6koe4eYp8PeC6DjN2sXkH4lh7qtfA3Erp99ayshijaf9HQ/H7Y
         EbVZf9Hg6b2U2+fLNPKU7yD+dfI7FPd2bZfzWfwjZMTNjKnGR7O1CdVA0M7fJqY4hXm4
         mmJ1d17F8BUhH8ArcePVHQ/bVJECXkEpW8Z3Vve6zS4wg5gt0m2bIkThr+DL4+KlAgt/
         BIMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9GR+M9kwc8eT2cs2wW/CNkkocF5x7PXcufqp311RRzs=;
        b=CnWeP+gy+yyELgJT2gWzOmAd9xK5bM4VXmBz72N4S69NMkpJdYgyPoEjPdENq0WvSM
         xpQJF13WcCkDTiI2mBBPrRr2hHb5SEK/j2QwDEkzsVMTOT0dfQl3iVSM71i7WmLq07Ze
         BcBuWswU+mMnhskkvNkQT23xGCUv8jqs6cAhSI9/axInApZTydY/caGMJgx1quWOGRKe
         Exhyf6CCcIfADSrkTNYp7WArUqc5OiBY55/H2jWMu29keUOA8I9ng0cXEmkn0+tgD0Qc
         SGjTSqdCPVYimKUw1i2VTjWZlqTDJ18FuRPIQH3yOr9SzZYmSVCDc8HwTQ28iyXSl2Ii
         zaFQ==
X-Gm-Message-State: AFqh2ko9f2es77bKXC3Rnnq36xf3uVjSEkp9zf1x7AvzV3lQso1Li7Ta
        eqj+Np9DtsfNbX1sIqw9IVfNnTGDcFiHGblC
X-Google-Smtp-Source: AMrXdXsmpGytuMFvVR1ENG/ufgf35vTcwd7b2GrTF6pZoJA4+hamriWabozyn/h59ja0tLIbQknZTw==
X-Received: by 2002:a05:6512:2395:b0:4cb:4344:a786 with SMTP id c21-20020a056512239500b004cb4344a786mr14051198lfv.20.1673623357997;
        Fri, 13 Jan 2023 07:22:37 -0800 (PST)
Received: from localhost.localdomain (abym53.neoplus.adsl.tpnet.pl. [83.9.32.53])
        by smtp.gmail.com with ESMTPSA id c19-20020a056512325300b004cb3d77a936sm3875440lfr.46.2023.01.13.07.22.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Jan 2023 07:22:37 -0800 (PST)
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
To:     linux-arm-msm@vger.kernel.org, andersson@kernel.org,
        agross@kernel.org, krzysztof.kozlowski@linaro.org
Cc:     marijn.suijten@somainline.org,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        devicetree@vger.kernel.org
Subject: [PATCH 2/2] Revert "dt-bindings: power: rpmpd: Add SM4250 support"
Date:   Fri, 13 Jan 2023 16:22:32 +0100
Message-Id: <20230113152232.2624545-2-konrad.dybcio@linaro.org>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230113152232.2624545-1-konrad.dybcio@linaro.org>
References: <20230113152232.2624545-1-konrad.dybcio@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-0.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_SORBS_HTTP,RCVD_IN_SORBS_SOCKS,SPF_HELO_NONE,SPF_PASS
        autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

SM4250 and SM6115 use a shared device tree and the RPMPDs are
identical. There's no need for a separate entry, so remove it.

This reverts commit 45ac44ed10e58cf9b510e6552317ed7d2602346f.

Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
 .../devicetree/bindings/power/qcom,rpmpd.yaml          |  1 -
 include/dt-bindings/power/qcom-rpmpd.h                 | 10 ----------
 2 files changed, 11 deletions(-)

diff --git a/Documentation/devicetree/bindings/power/qcom,rpmpd.yaml b/Documentation/devicetree/bindings/power/qcom,rpmpd.yaml
index 633d49884019..5bb9f59d196f 100644
--- a/Documentation/devicetree/bindings/power/qcom,rpmpd.yaml
+++ b/Documentation/devicetree/bindings/power/qcom,rpmpd.yaml
@@ -39,7 +39,6 @@ properties:
       - qcom,sdm845-rpmhpd
       - qcom,sdx55-rpmhpd
       - qcom,sdx65-rpmhpd
-      - qcom,sm4250-rpmpd
       - qcom,sm6115-rpmpd
       - qcom,sm6125-rpmpd
       - qcom,sm6350-rpmhpd
diff --git a/include/dt-bindings/power/qcom-rpmpd.h b/include/dt-bindings/power/qcom-rpmpd.h
index 278de6df425e..2d22a36c682a 100644
--- a/include/dt-bindings/power/qcom-rpmpd.h
+++ b/include/dt-bindings/power/qcom-rpmpd.h
@@ -307,16 +307,6 @@
 #define SDM660_SSCMX		8
 #define SDM660_SSCMX_VFL	9
 
-/* SM4250 Power Domains */
-#define SM4250_VDDCX		0
-#define SM4250_VDDCX_AO		1
-#define SM4250_VDDCX_VFL	2
-#define SM4250_VDDMX		3
-#define SM4250_VDDMX_AO		4
-#define SM4250_VDDMX_VFL	5
-#define SM4250_VDD_LPI_CX	6
-#define SM4250_VDD_LPI_MX	7
-
 /* SM6115 Power Domains */
 #define SM6115_VDDCX		0
 #define SM6115_VDDCX_AO		1
-- 
2.39.0

