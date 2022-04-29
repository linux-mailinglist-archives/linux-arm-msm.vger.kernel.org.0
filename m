Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B48195157D4
	for <lists+linux-arm-msm@lfdr.de>; Sat, 30 Apr 2022 00:04:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239316AbiD2WHN (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 29 Apr 2022 18:07:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37380 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233466AbiD2WHM (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 29 Apr 2022 18:07:12 -0400
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com [IPv6:2a00:1450:4864:20::434])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6E998DC59A
        for <linux-arm-msm@vger.kernel.org>; Fri, 29 Apr 2022 15:03:53 -0700 (PDT)
Received: by mail-wr1-x434.google.com with SMTP id j15so12434198wrb.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 29 Apr 2022 15:03:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=WlKreU/40nqHXZVuM04jB73cOMdB6bCilZH4/EUmsSc=;
        b=n4+px7ACcUlP0Wfx+T6iHCxr1Vc86umHuGfMRGQrobKs8oP6qIIMABXE2sci6KtQ5x
         P2XMRlvR4DTb0ZYnKuKWVtmdZWlCrXoOi47WkyNeciToZnJMCb4JT1S4KrYGGShYBAlg
         GaeJKPYNUtrL3Dk+aCvys5N5viggYDwCRqxGdjnFYL+FS1XwfSqRAV0Njc5UCyb+b0Rv
         dd3kxk3swMQApOibnAll/ohTcRjlHRFrAa9GWYf+l1OO564yPZVCK58VCesMngbZRJcJ
         oFctmt7CezIieGMBj5WlyW9f7T1z6gNxEi41JqYWMbxx2xL+qEzvncQ1dDOBmHDL2kjj
         ME/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=WlKreU/40nqHXZVuM04jB73cOMdB6bCilZH4/EUmsSc=;
        b=ZgdEIO6+jMl1od0HKca5tphYY8PEtSb55YgjtdhglcuhUlGoNjMafL9HjdPlrU/JaZ
         8wBrvO3odSpEahv/rfwhQyeFmqPk2B3dvlG+ARZRIETjv+KxdMYMcaD8htXFLgJzgNFG
         9BcwY+c1x1u0wMakTKMSmZmS7dXZxRBE8beXQ5iaD3fmloBmDQrTWxlfNmUi3RABAwHO
         qcs1D/9VVPHWIc37BetbC3qHPtfYs99KeqvBfKusojQES2mVcF4augCB90EsHGABVeAC
         lh4ReWqcKbkSnI71/bpDLFRtWG49p9DvjBOc2P5p6S1OfILO37ihlb2FTCYd6ivtcFpz
         ETPg==
X-Gm-Message-State: AOAM5301DCTavNXn26OW7rGF0EYe3Vyo+LK3e6rRKw6Nuv7zi/EsMAB8
        lRH/rDy0tCN88CAlf2n3xRr8DA==
X-Google-Smtp-Source: ABdhPJza79uXwOTQLJWxXmqcwnPj+Fq2RYfShAd+r4351XRF8jTdg3JbbWq8/PrrhDZGryRtqmMKQw==
X-Received: by 2002:a5d:4702:0:b0:206:b8d:3dce with SMTP id y2-20020a5d4702000000b002060b8d3dcemr866064wrq.646.1651269832079;
        Fri, 29 Apr 2022 15:03:52 -0700 (PDT)
Received: from sagittarius-a.chello.ie (188-141-3-169.dynamic.upc.ie. [188.141.3.169])
        by smtp.gmail.com with ESMTPSA id k15-20020adfc70f000000b0020c5253d90dsm338311wrg.89.2022.04.29.15.03.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 Apr 2022 15:03:51 -0700 (PDT)
From:   Bryan O'Donoghue <bryan.odonoghue@linaro.org>
To:     srinivas.kandagatla@linaro.org, bjorn.andersson@linaro.org,
        robh+dt@kernel.org, krzk+dt@kernel.org
Cc:     alsa-devel@alsa-project.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, bryan.odonoghue@linaro.org
Subject: [PATCH v3 0/2] Fix apq8016 compat string
Date:   Fri, 29 Apr 2022 23:03:47 +0100
Message-Id: <20220429220349.1142759-1-bryan.odonoghue@linaro.org>
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

V3:
- Marks qcom,lpass-cpu-apq8016 as deprecated instead of removing - Bjorn

V2:
- Adds Reviewed-by: - Srini
- Adds Fixes - Srini

V1:
Reusing the apq8016 on msm8939 I found running checkpatch that the compat
string for the LPASS was throwing a warning.

This is easily fixed by alinging the YAML, DTS and driver to the documented
compat string

-			compatible = "qcom,lpass-cpu-apq8016";
+			compatible = "qcom,apq8016-lpass-cpu";


Bryan O'Donoghue (2):
  ASoC: qcom: lpass: Fix apq8016 compat string to match yaml
  arm64: dts: qcom: Fix apq8016 compat string to match yaml

 arch/arm64/boot/dts/qcom/msm8916.dtsi | 2 +-
 sound/soc/qcom/lpass-apq8016.c        | 1 +
 sound/soc/qcom/lpass-cpu.c            | 5 +++++
 3 files changed, 7 insertions(+), 1 deletion(-)

-- 
2.35.1

