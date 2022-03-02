Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DD73D4C9A23
	for <lists+linux-arm-msm@lfdr.de>; Wed,  2 Mar 2022 01:52:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238797AbiCBAxA (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 1 Mar 2022 19:53:00 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44342 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238799AbiCBAw6 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 1 Mar 2022 19:52:58 -0500
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com [IPv6:2a00:1450:4864:20::131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 790348F9B5
        for <linux-arm-msm@vger.kernel.org>; Tue,  1 Mar 2022 16:52:16 -0800 (PST)
Received: by mail-lf1-x131.google.com with SMTP id g39so67573lfv.10
        for <linux-arm-msm@vger.kernel.org>; Tue, 01 Mar 2022 16:52:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=cuV5T+xDXxoIpuuof4RZMLElzWdFxHlFrB9qxP2rO7U=;
        b=yCR0+2MguovBLCP54GnVfDr/RPj7egrBpX99xfCWVR/brkxDIkuq9T0kxxgtmB49MW
         8FAqcA7tb0WpbMP6h6/4p00NdPQy/VFlRQhCls4v7YwX5OJygRMRgFcJwGDvqaafKxJx
         dfnYXQLRs4vP8YVNrL7ovXjUiyQc8DpsgDibi+YULzll0rI6BdM/VFc4L8+tldKigLCO
         hyn2gWOdDJiuWYsntq7BG0Ymgd7PKqbRIbwCvkpWIbJUeXbaaznWb7PGNnYFVj6CSVOD
         Vrj+W3QgYmnVpUgPp137OzycqhdiZzRSJC1Ky6CFTWpRJKElPVfQer7RyLLPL+EO6Viq
         Ohcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=cuV5T+xDXxoIpuuof4RZMLElzWdFxHlFrB9qxP2rO7U=;
        b=CwuvsTusQMSDiSHkvzHZMavBMcfOD3gtgQmYwqgPYg6ZhtSM9xO9hgdFUM56Q4u73+
         tr79jugdVPZtv0pKZg6kkoxN4PSv4pfpxY5rkWWDy8CGM81d5ZmJlaOlVpIVoEpPk+zV
         ytfry1jZ3x6rzlKzfSU3DgTmKLPxrIZxWTQVnxFQF8LhDPFUHOgZ5E958FRBFZI2ME40
         Met2NHcBSliEmFx/dZRuntehvUnatSVLjdAnYYfslcEIj2v+81MV9inznpVsO+hRqU+j
         RJI91wA27XSG27RhHGV61YRQ+Npj0EEGtd4ZOLNMSrp5S/Dn0EN8gwvwJp2w8ObfPJ29
         hXYg==
X-Gm-Message-State: AOAM530Cnd68nD48dLiq6IgEPsNVCRcEpZIH6jpcBAg4Xjy/Jw/SiL1D
        U99YnahhQtp6oTBSDzuqfWWwAA==
X-Google-Smtp-Source: ABdhPJwaZ6Tmh1tkbRTMhxj9QmyVBiA/Fq03uK+R7t0pt6RoZngYZHLL6ODNa/NxuEMZddW8yUQukQ==
X-Received: by 2002:ac2:4c34:0:b0:445:6ce3:ed6d with SMTP id u20-20020ac24c34000000b004456ce3ed6dmr16622964lfq.29.1646182334833;
        Tue, 01 Mar 2022 16:52:14 -0800 (PST)
Received: from eriador.lan ([2001:470:dd84:abc0:5258:5528:7624:3edd])
        by smtp.gmail.com with ESMTPSA id n23-20020a19ef17000000b00445b8db3c42sm198171lfh.172.2022.03.01.16.52.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Mar 2022 16:52:14 -0800 (PST)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Cc:     Stephen Boyd <swboyd@chromium.org>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org
Subject: [PATCH 3/5] arm64: dts: qcom: sdm660: Drop flags for mdss irqs
Date:   Wed,  2 Mar 2022 03:52:08 +0300
Message-Id: <20220302005210.2267725-3-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220302005210.2267725-1-dmitry.baryshkov@linaro.org>
References: <20220302005210.2267725-1-dmitry.baryshkov@linaro.org>
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

The number of interrupt cells for the mdss interrupt controller is 1,
meaning there should only be one cell for the interrupt number, not two.
Drop the second cell containing (unused) irq flags.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 arch/arm64/boot/dts/qcom/sdm660.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/sdm660.dtsi b/arch/arm64/boot/dts/qcom/sdm660.dtsi
index eccf6fde16b4..1d748c5305f4 100644
--- a/arch/arm64/boot/dts/qcom/sdm660.dtsi
+++ b/arch/arm64/boot/dts/qcom/sdm660.dtsi
@@ -163,7 +163,7 @@ dsi1: dsi@c996000 {
 		power-domains = <&rpmpd SDM660_VDDCX>;
 
 		interrupt-parent = <&mdss>;
-		interrupts = <5 IRQ_TYPE_LEVEL_HIGH>;
+		interrupts = <5>;
 
 		assigned-clocks = <&mmcc BYTE1_CLK_SRC>,
 					<&mmcc PCLK1_CLK_SRC>;
-- 
2.34.1

