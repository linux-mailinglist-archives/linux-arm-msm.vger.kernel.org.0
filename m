Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id EE0BA6F9B13
	for <lists+linux-arm-msm@lfdr.de>; Sun,  7 May 2023 21:07:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229781AbjEGTHr (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 7 May 2023 15:07:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49928 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231368AbjEGTHq (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 7 May 2023 15:07:46 -0400
Received: from mail-lj1-x230.google.com (mail-lj1-x230.google.com [IPv6:2a00:1450:4864:20::230])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9D7803588
        for <linux-arm-msm@vger.kernel.org>; Sun,  7 May 2023 12:07:40 -0700 (PDT)
Received: by mail-lj1-x230.google.com with SMTP id 38308e7fff4ca-2ac831bb762so35569371fa.3
        for <linux-arm-msm@vger.kernel.org>; Sun, 07 May 2023 12:07:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1683486458; x=1686078458;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7f2qMuaQsA4zz+ElXNpZm961GY4Y2a7Auy+y4P4Ssds=;
        b=WntRM6+Jusb/Evmn5zkoZJH9smaCe14lvWdAQ147xzmYVzNhXXVr3gScQIS6C9+peF
         5v9YsI+nOpMOuWZ62z9X0TiMEYskYtNga+bYZZZzpw7GjdVkF1hjEa39dsQ+DzjwcPQj
         uw02plmp4Egh+vni7YET2nSrPwWvr7UuEgiKZt1i1kLOSkJbNYjJ7b81eMkc4L2S9Ho1
         Xg2nyaFMCGWQYhwmcrxNJ4IH+Yd0FnwRhB9pmmuBtLxpXhBgEsGM9NYxPpyMHq4YN4Vh
         zDGiOI4yeQVsG/46mkf52yL5owdZg83vv71zHynLTC9orm/Z4Kv195Ty6Y70TYNjLlk5
         FBvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683486458; x=1686078458;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7f2qMuaQsA4zz+ElXNpZm961GY4Y2a7Auy+y4P4Ssds=;
        b=C83Gwwapeckna+v/hl5jh4jy2+FNJ5Qn9OEcEhHGKFakgWrWJUH15PAw8+b07er+vT
         vrcEvCbH2Im832WMybOaw/2NK3QRKgPi4YVcQ+29QXul7/DI+wmu9/nhgF7W5Ll1zucE
         i+tzNvwa2ha00x9nAfUB07KQ282K15AVulvLY+XhDWj7onmBtnkZpDgPkoG19vnqVlFB
         xb+rTwbfI0993fhPbnVROcgIJlody+2s7WCrkYiV2nw1DmfOEaxIk+uImLXNAJsFo9WX
         k+VdCFDYw56CpWnJgZnrqYy2xjNBUdaDc9XtaZtzoEzgyLkKVdyS8qRopfYmfixLBoyW
         /Ghw==
X-Gm-Message-State: AC+VfDzi5aToPOxg8P/exqfNle2meJu22gW+xPTIKihMsFmArPg1saAK
        qw7fMRa8PUKru8peEUCsQ2oO0w==
X-Google-Smtp-Source: ACHHUZ6weIEbg8nFqO2GvrIbuf/UKWjpC0B3GIkmIEVbX1cI2k12pekwT0owkZDWPuQCp8Z7EUOvbw==
X-Received: by 2002:a05:6512:21a6:b0:4ed:d2be:37e5 with SMTP id c6-20020a05651221a600b004edd2be37e5mr2015448lft.7.1683486458765;
        Sun, 07 May 2023 12:07:38 -0700 (PDT)
Received: from lothlorien.lan (dzdqv0yyyyyyyyyyybm5y-3.rev.dnainternet.fi. [2001:14ba:a0db:1f00::ab2])
        by smtp.gmail.com with ESMTPSA id f8-20020a19ae08000000b004f14ecc03f1sm755841lfc.100.2023.05.07.12.07.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 07 May 2023 12:07:38 -0700 (PDT)
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
Subject: [PATCH 2/4] ARM: dts: qcom: apq8074-dragonboard: Set DMA as remotely controlled
Date:   Sun,  7 May 2023 22:07:33 +0300
Message-Id: <20230507190735.2333145-3-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230507190735.2333145-1-dmitry.baryshkov@linaro.org>
References: <20230507190735.2333145-1-dmitry.baryshkov@linaro.org>
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

Add the qcom,controlled-remotely property for the blsp2_bam
controller node. This board requires this, otherwise the board stalls
during the boot for some reason (most probably because TZ mishandles the
protection error and keeps on looping somewhere inside).

Fixes: 62bc81792223 dts: msm8974: Add blsp2_bam dma node
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 arch/arm/boot/dts/qcom-apq8074-dragonboard.dts | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm/boot/dts/qcom-apq8074-dragonboard.dts b/arch/arm/boot/dts/qcom-apq8074-dragonboard.dts
index 1345df7cbd00..6b047c679370 100644
--- a/arch/arm/boot/dts/qcom-apq8074-dragonboard.dts
+++ b/arch/arm/boot/dts/qcom-apq8074-dragonboard.dts
@@ -23,6 +23,10 @@ &blsp1_uart2 {
 	status = "okay";
 };
 
+&blsp2_dma {
+	qcom,controlled-remotely;
+};
+
 &blsp2_i2c5 {
 	status = "okay";
 	clock-frequency = <200000>;
-- 
2.39.2

