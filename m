Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9B0D35E8A58
	for <lists+linux-arm-msm@lfdr.de>; Sat, 24 Sep 2022 11:01:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233601AbiIXJBP (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 24 Sep 2022 05:01:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51790 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233437AbiIXJBM (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 24 Sep 2022 05:01:12 -0400
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com [IPv6:2a00:1450:4864:20::130])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1BA0D2316C
        for <linux-arm-msm@vger.kernel.org>; Sat, 24 Sep 2022 02:01:11 -0700 (PDT)
Received: by mail-lf1-x130.google.com with SMTP id 10so3646077lfy.5
        for <linux-arm-msm@vger.kernel.org>; Sat, 24 Sep 2022 02:01:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date;
        bh=rJGvdlYaB2D+2+O3pVejykwm9NtbzMAkAe36JQ3gsDc=;
        b=PX1MNlMQDANKhuXedAA/leSqjqsqyJLACLFVcaRgFr2ABBbS7xwYHclwczX8OrZe5X
         FgQWAr8lwyYzpSutXUQxmyJfTpQRlWqE8IwFjiVxN2J3B1eeP5Q3IgUPmp2H4QVFKvJn
         Q13IGyfvu6jaWyjh6UoTtpOUtCtQkEmw96Ss5ohSJpTk6Lu/Ww6lL7IaI09/6EYs+lUh
         CzIRUTgs4ZLQhWXH453NuqSnsgn/VBTli0cYoRLzJ5Tac73u3fZJuArzhChAhOyUaPWg
         m+So9mnAH97vkomI8mC70W3t52PLCmtQb+zh8c2cnHAh4Uc8cKzpGaPrtCR/EL7hyawI
         BqPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date;
        bh=rJGvdlYaB2D+2+O3pVejykwm9NtbzMAkAe36JQ3gsDc=;
        b=AMF2Noe0BQwCCxPYTyxTHYbMB5YHaQMSh9QX+bh2VkRvoveYWe1Hwx4TsXtCQpXR1F
         FHlpmmdesKe9iqruDDYS+E2DG46wKd/VNwQvk5pfXjsydZOQn3JFXQp/i5ZXm2K4QOA7
         I5SrYB+VPBp9Ap5j/UBnEATUadCbTAUw2koWCpjQZ+6YkUrJXdvQ5B20e+HCQt5aVsf0
         kSRm5uxnqEVfA8JRKkQcvTvFaLt/wOiMhyEnQuN4emTKHF8cmsUQOyoQkRIM5o3bXCWI
         GCYmY0mE2+05GjPUGVlJyRBOprcIoLNlfqrmydrRhOSSfxxtmDF6r/eP0iK3OZg3o3SJ
         ljBQ==
X-Gm-Message-State: ACrzQf2Njmi9YS1IJOy5s0gIHmRwA+/bFisOypP1shWS9j/NMyFKsj5p
        ahIB61rSHHJdGvlnjrAuGrSpsw==
X-Google-Smtp-Source: AMsMyM6gsMUMwgKSsW9VF8rj0QX9mADjeZM3Zznl0SzcOKlH3Y5sJ4Q5sRc6f8ZYsPhB4zpGzNGocg==
X-Received: by 2002:a05:6512:1153:b0:49d:1d20:ea47 with SMTP id m19-20020a056512115300b0049d1d20ea47mr4560994lfg.342.1664010069508;
        Sat, 24 Sep 2022 02:01:09 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id o4-20020a198c04000000b0049f54a976efsm1830024lfd.29.2022.09.24.02.01.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 24 Sep 2022 02:01:09 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     Stephen Boyd <swboyd@chromium.org>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org
Subject: [PATCH 0/9] arm: dts: qcom: rename DSI PHY nodes
Date:   Sat, 24 Sep 2022 12:00:59 +0300
Message-Id: <20220924090108.166934-1-dmitry.baryshkov@linaro.org>
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

Historically DSI PHY device tree nodes used the dsi-phy@ names. Replace
them with generic phy@ names.

Dmitry Baryshkov (9):
  ARM: dts: qcom-apq8064: change DSI PHY node name to generic one
  ARM: dts: qcom-msm8974: change DSI PHY node name to generic one
  arm64: dts: qcom: msm8916: change DSI PHY node name to generic one
  arm64: dts: qcom: msm8996: change DSI PHY node name to generic one
  arm64: dts: qcom: sc7180: change DSI PHY node name to generic one
  arm64: dts: qcom: sdm630: change DSI PHY node name to generic one
  arm64: dts: qcom: sdm660: change DSI PHY node name to generic one
  arm64: dts: qcom: sdm845: change DSI PHY node name to generic one
  arm64: dts: qcom: sm8250: change DSI PHY node name to generic one

 arch/arm/boot/dts/qcom-apq8064-asus-nexus7-flo.dts | 2 +-
 arch/arm/boot/dts/qcom-apq8064.dtsi                | 2 +-
 arch/arm/boot/dts/qcom-msm8974.dtsi                | 2 +-
 arch/arm64/boot/dts/qcom/msm8916.dtsi              | 2 +-
 arch/arm64/boot/dts/qcom/msm8996.dtsi              | 4 ++--
 arch/arm64/boot/dts/qcom/sc7180.dtsi               | 2 +-
 arch/arm64/boot/dts/qcom/sdm630.dtsi               | 2 +-
 arch/arm64/boot/dts/qcom/sdm660.dtsi               | 2 +-
 arch/arm64/boot/dts/qcom/sdm845.dtsi               | 4 ++--
 arch/arm64/boot/dts/qcom/sm8250.dtsi               | 4 ++--
 10 files changed, 13 insertions(+), 13 deletions(-)

-- 
2.35.1

