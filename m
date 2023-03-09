Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 19BD86B1FBF
	for <lists+linux-arm-msm@lfdr.de>; Thu,  9 Mar 2023 10:19:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230224AbjCIJTI (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 9 Mar 2023 04:19:08 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48444 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230037AbjCIJTH (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 9 Mar 2023 04:19:07 -0500
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com [IPv6:2a00:1450:4864:20::32a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E013C69CC7
        for <linux-arm-msm@vger.kernel.org>; Thu,  9 Mar 2023 01:19:04 -0800 (PST)
Received: by mail-wm1-x32a.google.com with SMTP id bg16-20020a05600c3c9000b003eb34e21bdfso3097509wmb.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 09 Mar 2023 01:19:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1678353543;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=LusevUH+SRkUXslUQ5vOufYX7haQVeFO1OhyQy8vqF0=;
        b=DUttmBslMVfOiKE3J4udI8ShvJc34pEqiXtTgUE+SHjQgB3rKA9bN6BI2rrqqhoDMz
         IIMf18QHVfKBx8fBkg/lgBN3bDREoRnUm50vELswc4quXMnGO1zyyej2+vq7Mx2JsQvY
         iJZgE6wPaHjC3q+tN5sskwja4v9jbpglTcDFgZljeS7N9PRKW+Vy4saipk2D/IOOpoPh
         jw8T+50hIC2/kIIUscVIP3XjKeKl2dBnb55sz+VsXJ/k7qn5IBG4BKkLIVMlU3Yyv+v8
         Z9oScWlQkbXY8q5C7fPuE6OzmSsL8u7yH6uJNEZf4BJnD0e+oh67KSrSh2H0JTopj5+4
         oQvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678353543;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LusevUH+SRkUXslUQ5vOufYX7haQVeFO1OhyQy8vqF0=;
        b=BIf44bUHpO97X18jsJzooA5kNphNJhbZNNVqcU2bC10FJ3ZcmlxUlj65E3S8EGdH2A
         m/sWRNSRMGXWMgCPTrKK8KoXFRhZczT9wdFKbCmf0smZoYFKPHNqsYR9gxgjjtBvkmBw
         J/9GE8KRuT1uxEoK4kbaGxq3+mZXEv0XZJmycip/fsNtbqA+LVZbgtqQuqnblo/Ctsmb
         5lZAvyP6xr8dT6OFWN6m5jvgqS/vjPc5671u+avaKwm68U+9Qgi4TPymOvt75QzEp6y5
         s1awmarDxy71MlCkLg6YIo7AJtGAb1FAFVRr6UGMDXCaV9O/fQHeQ6NMQJnVK9FefvzX
         Ii9w==
X-Gm-Message-State: AO0yUKWy8OKX4tly4rNz6IiH1v+4HVZWJeX/H84pDFGoCgFlhFwhV+7P
        ZOgTwauFzz7xhH0H7sfZ8B+YuNkHxnJ6ZC/8ciNlTw==
X-Google-Smtp-Source: AK7set+4o48cfbThwFEajvH+tETOf6lLG/fUBCI1TvKH5P1isYlgRMCZtRozAAq7XRjzRgLJf3CyXw==
X-Received: by 2002:a05:600c:4ecb:b0:3eb:3148:a1b7 with SMTP id g11-20020a05600c4ecb00b003eb3148a1b7mr18522092wmq.12.1678353543380;
        Thu, 09 Mar 2023 01:19:03 -0800 (PST)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:8261:5fff:fe11:bdda])
        by smtp.gmail.com with ESMTPSA id o8-20020a05600c4fc800b003ebfc075eaasm2177066wmq.16.2023.03.09.01.19.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Mar 2023 01:19:03 -0800 (PST)
From:   Neil Armstrong <neil.armstrong@linaro.org>
Subject: [PATCH v4 0/5] arm64: dts: qcom: add DP Controller to SM8350 &
 SM8450 DTS
Date:   Thu, 09 Mar 2023 10:18:59 +0100
Message-Id: <20230206-topic-sm8450-upstream-dp-controller-v4-0-dca33f531e0d@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAIOkCWQC/53OsW7DMAwE0F8JNJcFTVmulan/UWSQLToWoEgG5
 RgpAv97lWxFp2a8G97dXRWWwEUdD3clvIUScqqhfTuocXbpzBB8zYqQNBJ2sOYljFAufWsQrkt
 Zhd0F/AJjTqvkGFmAEE3rBurRs6rS4ArDIC6Nc7XSNcZaLsJTuD2nv041z6GsWb6fT7bm0f5vd
 GsAYWp0a/oPYt/YzxiSk/ye5aweAxu9gFJFDVnviFB35i+qX0B1RTvd8WTZWqvpF7rv+w8/25A
 ulgEAAA==
To:     Rob Clark <robdclark@gmail.com>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Sean Paul <sean@poorly.run>, David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Kuogee Hsieh <quic_khsieh@quicinc.com>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.12.1
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Switch the QMP PHY to the newly documented USB3/DP Combo PHY
bindings at [1] and add the DP controller nodes.

The DP output is shared with the USB3 SuperSpeed lanes and is
usually connected to an USB-C port which Altmode is controlled
by the PMIC Glink infrastructure in discution at [1] & [2].

DT changes tying the DP controller to the USB-C port on the HDK
boards will be sent later.

Bindings dependencies merged into v6.3-rc1.

[1] https://lore.kernel.org/all/20230201041853.1934355-1-quic_bjorande@quicinc.com/
[2] https://lore.kernel.org/all/20230130-topic-sm8450-upstream-pmic-glink-v2-0-71fea256474f@linaro.org/

Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
Changes in v4:
- Updated trailers
- Fixed patch 4 compatible and reg sizes
- Link to v3: https://lore.kernel.org/r/20230206-topic-sm8450-upstream-dp-controller-v3-0-636ef9e99932@linaro.org

Changes in v3:
- Added Reviewed-by, Tested-by tags
- Used QMP PHY constants for phandle parameters
- Dropped reordering of mdp ports
- Added p1 dp regs address space
- Link to v2: https://lore.kernel.org/r/20230206-topic-sm8450-upstream-dp-controller-v2-0-529da2203659@linaro.org

Changes in v2:
- fixed the bindings
- cleaned up the usb_1_qmpphy &  displayport-controller nodes as requested by dmitry
- removed invalid mdss_dp0 change in sm8450-hdk.dts
- Link to v1: https://lore.kernel.org/r/20230206-topic-sm8450-upstream-dp-controller-v1-0-f1345872ed19@linaro.org

---
Neil Armstrong (5):
      dt-bindings: display: msm: dp-controller: document SM8450 compatible
      arm64: dts: qcom: sm8350: switch to combo usb3/dp phy
      arm64: dts: qcom: sm8350: add dp controller
      arm64: dts: qcom: sm8450: switch to usb3/dp combo phy
      arm64: dts: qcom: sm8450: add dp controller

 .../bindings/display/msm/dp-controller.yaml        |  25 +++--
 arch/arm64/boot/dts/qcom/sm8350.dtsi               | 121 ++++++++++++++++-----
 arch/arm64/boot/dts/qcom/sm8450.dtsi               | 121 ++++++++++++++++-----
 3 files changed, 203 insertions(+), 64 deletions(-)
---
base-commit: fe15c26ee26efa11741a7b632e9f23b01aca4cc6
change-id: 20230206-topic-sm8450-upstream-dp-controller-20054ab280de

Best regards,
-- 
Neil Armstrong <neil.armstrong@linaro.org>

