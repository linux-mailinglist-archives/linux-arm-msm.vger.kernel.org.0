Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id F0E21544BBD
	for <lists+linux-arm-msm@lfdr.de>; Thu,  9 Jun 2022 14:24:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237523AbiFIMYB (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 9 Jun 2022 08:24:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39268 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S244064AbiFIMX5 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 9 Jun 2022 08:23:57 -0400
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com [IPv6:2a00:1450:4864:20::134])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 421F72F3AE
        for <linux-arm-msm@vger.kernel.org>; Thu,  9 Jun 2022 05:23:56 -0700 (PDT)
Received: by mail-lf1-x134.google.com with SMTP id u26so36991219lfd.8
        for <linux-arm-msm@vger.kernel.org>; Thu, 09 Jun 2022 05:23:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=EY69blhAfLwlzhpt3ykQvo28dBBPjots5a/LOCelKuM=;
        b=IjpDkqE/seTW6CIHsQ7Hfj04A0JuPKLtjnMjErJkpXYhl3WM7UKcxD0rkphldo8FZC
         Mt4ewdaEMkw0E16QV2L9dZFqPbtQA33ZlEvTfYhrCm9TuHTYZjC6A9Rwby1HFvcu2Q31
         OBEQkbqwpslCgU5lAnkn/2YDYmtsefhglKT72IebkRpVx9KaHI2rGrRIFYginXZUm8ET
         1L170gjwFR5mP4d5WCrlSlsuPeCLhPtT/3RF/E/oK1/wndCGVc5TLkKNS1FsNWvZJh70
         jmZey/NNpZY0X/F4Bmbc7/vjsTjnbiHMzqcX7YXKU78liLB6/BOcSFOprVkZeQiOYJjo
         bKbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=EY69blhAfLwlzhpt3ykQvo28dBBPjots5a/LOCelKuM=;
        b=E3TvChrJJQbimqCkDgc6hImWPC6iy6JxJmTwquHh3Guq5TMSf7zqDu6heZCDmUckCz
         gsyJj2/HjZVv/3gxtcg69dJ0xwWf9HX0PLqkMGgOzPr9aAofkTpTR4wMvpaiKRCYIe/Q
         BauI4fQHFvjTVFwEG6q4US0mFmvFNk5Uw5J4q4ZqNbuXEHGJLC1sXuU7FhYe4+lxAF+8
         6VXmwYi94MHYAW13nRZRNObe34DRChu1BMfZ+Ss8h/XwnusUtdjgn1Zd79yjhDAM7ziQ
         FduPH8JcNdtJTimvGTua1uu1V57VF6f+B/DVFiH/19wdql2XKMhCGvB5vtkWLWg1g9Yx
         Z50w==
X-Gm-Message-State: AOAM533ievsBwnjuE/sF/YybA0bffJpGR/2gLbWrFV5b1OEciDFqrqeH
        +q7eZqvcAOOkuuXdcvsatbSX4A==
X-Google-Smtp-Source: ABdhPJzyp0Hfr5XdSnJVDwteMfnRMn7T+LClAtbpwVJRURvWT0U8/5q5O/b5BG1sUgsG0uwrLVVaUA==
X-Received: by 2002:ac2:5bdd:0:b0:47c:bea8:f254 with SMTP id u29-20020ac25bdd000000b0047cbea8f254mr1682585lfn.407.1654777434599;
        Thu, 09 Jun 2022 05:23:54 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id f11-20020a056512360b00b0047daa133decsm32421lfs.166.2022.06.09.05.23.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Jun 2022 05:23:54 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     Stephen Boyd <swboyd@chromium.org>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH v3 03/14] dt-bindings: display/msm: hdmi: mark hdmi-mux-supply as deprecated
Date:   Thu,  9 Jun 2022 15:23:39 +0300
Message-Id: <20220609122350.3157529-4-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220609122350.3157529-1-dmitry.baryshkov@linaro.org>
References: <20220609122350.3157529-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

hdmi-mux-supply is not used by the SoC's HDMI block, it is thought to
power up the external logic. Thus it should not be a part of HDMI
bindings, but it should be declared at some other device in the DT (like
HDMI mux, bridge, etc). Mark it as deprecated.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Reviewed-by: Stephen Boyd <swboyd@chromium.org>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 Documentation/devicetree/bindings/display/msm/hdmi.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/display/msm/hdmi.yaml b/Documentation/devicetree/bindings/display/msm/hdmi.yaml
index 99b07abcd960..47e97669821c 100644
--- a/Documentation/devicetree/bindings/display/msm/hdmi.yaml
+++ b/Documentation/devicetree/bindings/display/msm/hdmi.yaml
@@ -56,6 +56,7 @@ properties:
 
   hdmi-mux-supply:
     description: phandle to mux regulator
+    deprecated: true
 
   core-vcc-supply:
     description: phandle to VCC supply regulator
-- 
2.35.1

