Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 164FF56AD96
	for <lists+linux-arm-msm@lfdr.de>; Thu,  7 Jul 2022 23:32:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236798AbiGGVcR (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 7 Jul 2022 17:32:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42460 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236587AbiGGVcI (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 7 Jul 2022 17:32:08 -0400
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com [IPv6:2a00:1450:4864:20::135])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8392A32ECC
        for <linux-arm-msm@vger.kernel.org>; Thu,  7 Jul 2022 14:32:07 -0700 (PDT)
Received: by mail-lf1-x135.google.com with SMTP id bu42so13446841lfb.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 07 Jul 2022 14:32:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=7Jn6Iu6IK/cjTsHc82YNQ/VqbemoAFWW2VWGq7e/Oyc=;
        b=DXNw+Lwu0b1c4Q7WGiKJn+tKfkGfrOKlD7rgU61K1kPy51HaIBn/x+JMD9O2sjOz7Q
         4Prp6O0gqeqGU1KBazLNZTgnLTjs/mDFxjQly0CuR6Q1XwiPry6MHhyP81AiNqaijUuz
         FWyxk+urYZTTDnk7nufyM2npOqTRZQ8T0PO3E7dGMcgU1QCbRnDQuo8mMx4xZ79Rzpuw
         QdZOGtWSHRMrjJcGkYadSUzFZQfXxdboJyBBAZMrqjKMzVIApafXsPVwTr1fTVwCv3v/
         VznA2WZVqlw8zvTegoBTgPy1xGXxPcXD0bv0ocNjAJG3743qeBHCIJbNcwwFDvx+FmAq
         6rDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=7Jn6Iu6IK/cjTsHc82YNQ/VqbemoAFWW2VWGq7e/Oyc=;
        b=t/mIvPkMhn6RZOQow+mn8klKKRnjjBB7hRD5+C+6uNviYwWcOS0mKefs9gurQ6uvDu
         HQ7s01ODTOwOoX5dSkBQj7a2hal4wa++yxwHp3c/hkb8zoI+J/yq6dLevzzC0GgzxjTZ
         IMjN94E6q3Uh5Gk4ZoPbEigT8Acx/1x2rQ4KcLT8DB4DVWjEdsQffBL/scZ8cfi2sDd5
         jnb9sGa2elv2QIKbtwdQZWvFG0NoumYK6RLpnk8pWQ0qOojYZqY6I/zTKPBJx35u6s9c
         WtPDgTCRxfDDuLXLMtdJSYyfa5MytRWHKUqdjCRcNazP8Y3dR6l6UbmiDyFM8Qc27IIl
         e7iw==
X-Gm-Message-State: AJIora+eb6Eova/eQnHjwIJy9IN+eIJlP2Nh+O2+msx3vGLDLG9z6cR4
        3gZoLwIopQjgrynZF/JR/qo5OQ==
X-Google-Smtp-Source: AGRyM1vmraEqvsKJOGH5XWV+o6YVlUd7ht5gxF0NEUL44H7Z8+DZYQI+aJN1f5ShgR7NbAP3B4aPfw==
X-Received: by 2002:a19:490c:0:b0:481:4b9e:cbdb with SMTP id w12-20020a19490c000000b004814b9ecbdbmr152799lfa.350.1657229525781;
        Thu, 07 Jul 2022 14:32:05 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id o19-20020ac24e93000000b0047f8cb94004sm7046709lfr.35.2022.07.07.14.32.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 Jul 2022 14:32:05 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
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
Subject: [PATCH 0/9] dt-bindings: msm/dp: cleanup Qualcomm DP and eDP bidndings
Date:   Fri,  8 Jul 2022 00:31:55 +0300
Message-Id: <20220707213204.2605816-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
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

Fix several issues with the DP and eDP bindings on the Qualcomm
platforms. While we are at it, fix several small issues with platform
files declaring these controllers.

Dmitry Baryshkov (9):
  dt-bindings: msm/dp: drop extra p1 region
  dt-bindings: msm/dp: bring back support for legacy DP reg property
  dt-bindings: msm/dp: mark vdda supplies as deprecated
  dt-bindings: msm/dp: add missing properties
  dt-bindings: msm/dp: account for clocks specific for qcom,sc7280-edp
  dt-bindings: msm/dp: handle DP vs eDP difference
  arm64: dts: qcom: sc7180: drop #clock-cells from
    displayport-controller
  arm64: dts: qcom: sc7280: drop #clock-cells from
    displayport-controller
  arm64: dts: qcom: sc7280: drop address/size-cells from eDP node

 .../bindings/display/msm/dp-controller.yaml   | 115 ++++++++++++++----
 arch/arm64/boot/dts/qcom/sc7180.dtsi          |   1 -
 arch/arm64/boot/dts/qcom/sc7280.dtsi          |   5 -
 3 files changed, 91 insertions(+), 30 deletions(-)

-- 
2.35.1

