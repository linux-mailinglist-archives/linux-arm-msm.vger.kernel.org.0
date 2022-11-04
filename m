Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 60827619738
	for <lists+linux-arm-msm@lfdr.de>; Fri,  4 Nov 2022 14:14:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231955AbiKDNOJ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 4 Nov 2022 09:14:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48356 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231856AbiKDNOD (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 4 Nov 2022 09:14:03 -0400
Received: from mail-lj1-x229.google.com (mail-lj1-x229.google.com [IPv6:2a00:1450:4864:20::229])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2155F2AE2C
        for <linux-arm-msm@vger.kernel.org>; Fri,  4 Nov 2022 06:14:02 -0700 (PDT)
Received: by mail-lj1-x229.google.com with SMTP id h12so6269268ljg.9
        for <linux-arm-msm@vger.kernel.org>; Fri, 04 Nov 2022 06:14:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=vkNU3+fp0nhaCwixTYlRHoDEFAnLM2EV/3w7IT8vNw4=;
        b=HLaOKFbepOY9VJ3gr1x5NgM/GwvMIHKqUMbknWaeU3h2qGxlJLt4QUvVBnFlRUmY6F
         eNBmATDZ/hDVpS6avJnga+LSbezCUtgOCqQbnBNs2KAMYEiZZB8wm70NXehTJCJWxZzD
         asBbK5cWoixW9xnsJFj3bPbkMUMy3wxxwX4RuQEQ8hgBxit15xHe4O6SRu+xGsse1JhK
         ClJDNO/g2eK3pW3m0WQUYvzdvA1voKqcKCmniH99HmIGzanotBREFZ0HZ9usdyzDKRbX
         pBI/EepxckCd1p3TjMICEAiQtmiaRAN7Q9wrUXvVPwUPaBJOO8tMgosrkPsh1OMYFNbz
         PZrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vkNU3+fp0nhaCwixTYlRHoDEFAnLM2EV/3w7IT8vNw4=;
        b=e4Ab5oLNBaf3v3f6QVlcxEgCUx0z1pIy13SETwPjXdTIjZ1qdgzbXeCcQWFt4gbBaE
         gME/rSfWyTqsQJHwyuHCKfh2IES57BbyH07TimtoTP8s3dNsc7R2h8+HfyzwPwCnkdLC
         FCLe6TDys0gYbstCDmF/tT+01s02lUAZKD3Yu862wC1zZGpsWzM808mkSAeFamZp49U/
         1jqwKW11nVTLBcYXCyly1aShoUE16jbsODb/0Xt30Uk5cSLHFnka1sDBARvKVD8eTHhI
         QHFbIvqoLxzCUWMqzCTW5DHVgjGIKIZbyCcMWvI+auh/nZ3GpgJE6I3pmRGi+oOOgZMh
         AstA==
X-Gm-Message-State: ACrzQf16cT5drmI6NeFExBTG7aSJrlzweroU+39+gK+3M23bTS/DsHT3
        5x8I1zKHuH8ZI6k6xDOCWYc25A==
X-Google-Smtp-Source: AMsMyM6L5kv9idmr6tL6VMZge4A6ccABD2Rf6Tdjxzvbt7trM4M0KMRdHYubn2IjK29mSFCyyDuuHw==
X-Received: by 2002:a05:651c:14f:b0:277:3f46:a034 with SMTP id c15-20020a05651c014f00b002773f46a034mr12664086ljd.529.1667567640496;
        Fri, 04 Nov 2022 06:14:00 -0700 (PDT)
Received: from localhost.localdomain ([195.165.23.90])
        by smtp.gmail.com with ESMTPSA id t27-20020a19911b000000b004a95d5098f2sm457050lfd.226.2022.11.04.06.13.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Nov 2022 06:14:00 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     Stephen Boyd <swboyd@chromium.org>,
        David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, Vinod Koul <vkoul@kernel.org>
Subject: [PATCH v1 0/5] arm64: dts: qcom: sm8450-hdk: enable HDMI output
Date:   Fri,  4 Nov 2022 16:13:53 +0300
Message-Id: <20221104131358.1025987-1-dmitry.baryshkov@linaro.org>
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

Add device tree nodes for MDSS, DPU and DSI devices on Qualcomm SM8450
platform. Enable these devices and add the HDMI bridge configuration on
SM8450 HDK.

Dmitry Baryshkov (3):
  arm64: dts: qcom: sm8450: add RPMH_REGULATOR_LEVEL_LOW_SVS_D1
  arm64: dts: qcom: sm8450: add display hardware devices
  arm64: dts: qcom: sm8450-hdk: enable display hardware

Vinod Koul (2):
  arm64: dts: qcom: sm8450-hdk: Add LT9611uxc HDMI bridge
  arm64: dts: qcom: sm8450-hdk: Enable HDMI Display

 arch/arm64/boot/dts/qcom/sm8450-hdk.dts | 124 ++++++++++
 arch/arm64/boot/dts/qcom/sm8450.dtsi    | 304 +++++++++++++++++++++++-
 include/dt-bindings/power/qcom-rpmpd.h  |   1 +
 3 files changed, 417 insertions(+), 12 deletions(-)

-- 
2.35.1

