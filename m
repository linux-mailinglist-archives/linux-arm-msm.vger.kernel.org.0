Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2A050590EF2
	for <lists+linux-arm-msm@lfdr.de>; Fri, 12 Aug 2022 12:14:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238261AbiHLKN5 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 12 Aug 2022 06:13:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35082 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237588AbiHLKNc (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 12 Aug 2022 06:13:32 -0400
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com [IPv6:2a00:1450:4864:20::42a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E7BA9AB4D4
        for <linux-arm-msm@vger.kernel.org>; Fri, 12 Aug 2022 03:12:48 -0700 (PDT)
Received: by mail-wr1-x42a.google.com with SMTP id j1so696082wrw.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 12 Aug 2022 03:12:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc;
        bh=VEs6wZWakwgBJ6Ig58MPDjM5leVr1a+Cx/UKYTT/e8E=;
        b=GIKk+3qBSEL6EfjmSjrHeH5Ma5mGoIpw2bysICq5lXUJ6ybITVz9FnUftGajDg55rr
         kARbo48b82RDZ0Prna2NsbdMl9dMUjpq0clLT3PanQZy9v5xTCuuxMiQMFNYUuVEN/E1
         WzFvKyE3lnF2PkGRnSjTH0GU4UkPzLMOKZVaPmlLI2pSWsvwpEwoRYkIuv7n2RzOOage
         LCJ5AX64QYoG64hzg4ryy4svmna7gPnun5qHjGYB+LizPIt9aJt2eTfND0D4XOg8byW+
         droCVyWVo5BNGJPgvVUbmP1YZVQE9fxqXnld2IGKVW3Q2u27jVHAKvnuHVJBrVdrjzx3
         r6hQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
        bh=VEs6wZWakwgBJ6Ig58MPDjM5leVr1a+Cx/UKYTT/e8E=;
        b=HZIe9yM88EN8a5TQoN0tuMhhcv4c97DjuM2Aqb8uT6/jEY8DkGFsxlNlf9YNk5XtQX
         7WESsWr78LxF30g/mMnLgZAp4BMrSSyFAzpZaQcxGgydDFmtyhEfvDFakkp1Tp9I9xe9
         If7R8Z8RZ+NJMXvTJ5vib6LlR1HeDG9NPXZVgAs/IkVFzh7b5V7MkVnJ/gV38gFJoY+7
         lRs5LMZEPx7bnv6Bn5cIS4/trSBrZViI2p5gi4Tl9+v1uFomoO2Z1TF17vSJikFjUVzD
         dSSTohXgC+HsJu4EtsXUnlmPSLrdenE5md5FHpTetU32v5IiA9o0byjEFVzcCOppy126
         ovdA==
X-Gm-Message-State: ACgBeo1N1u5rMt2t0qHQ/WJxKGLyZF+JlxLJ3/6x1Ly4KOPjuhjlM8xM
        naWwKLh5tHoMoxS1N86iqdPPEA==
X-Google-Smtp-Source: AA6agR7gDJATgg6ukxbMjsQmjBn9A+7ptvHxjH7kebGR6YnZiBHSm5UwYxpex2Dx8I2kOJsxvObd2g==
X-Received: by 2002:adf:eb8e:0:b0:223:a1f6:26b2 with SMTP id t14-20020adfeb8e000000b00223a1f626b2mr1428160wrn.216.1660299167448;
        Fri, 12 Aug 2022 03:12:47 -0700 (PDT)
Received: from hackbox.lan ([94.52.112.99])
        by smtp.gmail.com with ESMTPSA id e25-20020a05600c219900b003a541d893desm2193204wme.38.2022.08.12.03.12.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Aug 2022 03:12:46 -0700 (PDT)
From:   Abel Vesa <abel.vesa@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Maulik Shah <quic_mkshah@quicinc.com>
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: [PATCH v2 4/4] dt-bindings: soc: qcom: stats: Document SDM845 compatible
Date:   Fri, 12 Aug 2022 13:12:40 +0300
Message-Id: <20220812101240.1869605-4-abel.vesa@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220812101240.1869605-1-abel.vesa@linaro.org>
References: <20220812101240.1869605-1-abel.vesa@linaro.org>
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

SDM845 is a special case compared to the other platforms that use RPMh
stats, since it only has 2 stats (aosd and cxsd), while the others have
a 3rd one (ddr).

So in order for the driver to use the dedicated stats config, we added
the SDM845 dedicated compatible, which we document here.

Signed-off-by: Abel Vesa <abel.vesa@linaro.org>
---

Changed qcom,rpmh-stats-sdm845 to qcom,sdm845-rpmh-stats, as suggested
by Krzysztof.

 Documentation/devicetree/bindings/soc/qcom/qcom-stats.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/soc/qcom/qcom-stats.yaml b/Documentation/devicetree/bindings/soc/qcom/qcom-stats.yaml
index 473adca4e973..48eda4d0d391 100644
--- a/Documentation/devicetree/bindings/soc/qcom/qcom-stats.yaml
+++ b/Documentation/devicetree/bindings/soc/qcom/qcom-stats.yaml
@@ -20,6 +20,7 @@ properties:
   compatible:
     enum:
       - qcom,rpmh-stats
+      - qcom,sdm845-rpmh-stats
       - qcom,rpm-stats
       # For older RPM firmware versions with fixed offset for the sleep stats
       - qcom,apq8084-rpm-stats
-- 
2.34.1

