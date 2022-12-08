Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B9AD9646624
	for <lists+linux-arm-msm@lfdr.de>; Thu,  8 Dec 2022 01:55:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229651AbiLHAzH (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 7 Dec 2022 19:55:07 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33584 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229821AbiLHAzE (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 7 Dec 2022 19:55:04 -0500
Received: from mail-lj1-x231.google.com (mail-lj1-x231.google.com [IPv6:2a00:1450:4864:20::231])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 769B089AE7
        for <linux-arm-msm@vger.kernel.org>; Wed,  7 Dec 2022 16:55:03 -0800 (PST)
Received: by mail-lj1-x231.google.com with SMTP id a7so22741792ljq.12
        for <linux-arm-msm@vger.kernel.org>; Wed, 07 Dec 2022 16:55:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qZPnPCur3ovFUOH0LYhAuqFKoVf/x2ysNxNnklkbflE=;
        b=Z0n6nWKpFQW/U3hRqkkWGv/Jb0DbHroQAvTC/kUChu/mZvqVpmao4hqnZUEstRDnar
         jFyyH2TPR3cH1RLq/2o4c4TCgTrYZwOJaw5OZxWvsC9tCWL6BGI+94EYdu507Vppm1NL
         SuKztwVjHMSpFB4FuD3UvvL4Gwj/jHnbJhciHElDwCMG2KfDmEI8FrgNAhd5FMLURQ+5
         CE0RWcJ8ux4Xrq5d1oiGTIpxxVWE3nQJEPd+dtpvRjDvSfIRt1409B4gu6TVKz5fhVTg
         Cr4940woTLVdGDKDR1LupLDIm3xmlNbZXGbOKmc6bpLuC0bsC6mfAIx7l4HKUGcWFxOJ
         qahQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qZPnPCur3ovFUOH0LYhAuqFKoVf/x2ysNxNnklkbflE=;
        b=DHfizEw0C3gM8yOYXnY0AzxAJQqOjVcc/Ml1lyhLGFQoIbFqjY+fAmtMqCbbLPeToX
         f+sd0HEVMPVcEN1bTLOKUwIp8zv+F819LK6NLZ+htm3qllUBTv1JVebLGJLmNeL+C0be
         PbA+MjQMlh29njNU9h5+jeQQ9HjuTbnTVm7EuM4g4vRCmpYJW/PFWBz5MMV5vOiwfE03
         PVc1UvHhITOtNBxf3zCWWVpL4qdE74ionoXbOEXRmYkGUmDK/cIo7Jwg1xvTVLWYSFYo
         j8sNImZ91E8szikxSUTe20JLI0sgMuk2OeCOT4m82SZeUX9DYkGH7OtsqzVDC936Vw1s
         Ukwg==
X-Gm-Message-State: ANoB5plBu0PnUtL/BlA7iXitdcbMXswC+tZieXbd3NXNBqg/Gayu4aZB
        N5WOfBb2JG0PRpH6+bV9mdbNRw==
X-Google-Smtp-Source: AA0mqf7gr4D6xoe4jHfMdSszRKt/ebLETLphZftpO3yonssF15zrpEQCAd1CIHbl/lXZjCwUEqiigA==
X-Received: by 2002:a05:651c:c85:b0:278:f572:c9ac with SMTP id bz5-20020a05651c0c8500b00278f572c9acmr31528058ljb.73.1670460901823;
        Wed, 07 Dec 2022 16:55:01 -0800 (PST)
Received: from eriador.lan (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
        by smtp.gmail.com with ESMTPSA id f27-20020a19381b000000b0049fff3f645esm3064159lfa.70.2022.12.07.16.55.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Dec 2022 16:55:01 -0800 (PST)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     Stephen Boyd <swboyd@chromium.org>,
        David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org
Subject: [PATCH v2 3/4] ARM: dts: qcom-msm8974: add SoC specific compat string to mdp5 node
Date:   Thu,  8 Dec 2022 02:54:57 +0200
Message-Id: <20221208005458.328196-4-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20221208005458.328196-1-dmitry.baryshkov@linaro.org>
References: <20221208005458.328196-1-dmitry.baryshkov@linaro.org>
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

Add SoC-specific compat string to the MDP5 device node to ease
distinguishing between various platforms.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 arch/arm/boot/dts/qcom-msm8974.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/qcom-msm8974.dtsi b/arch/arm/boot/dts/qcom-msm8974.dtsi
index 8d216a3c0851..0cd59088f9c7 100644
--- a/arch/arm/boot/dts/qcom-msm8974.dtsi
+++ b/arch/arm/boot/dts/qcom-msm8974.dtsi
@@ -1549,7 +1549,7 @@ mdss: mdss@fd900000 {
 			ranges;
 
 			mdp: mdp@fd900000 {
-				compatible = "qcom,mdp5";
+				compatible = "qcom,msm8974-mdp5", "qcom,mdp5";
 				reg = <0xfd900100 0x22000>;
 				reg-names = "mdp_phys";
 
-- 
2.35.1

