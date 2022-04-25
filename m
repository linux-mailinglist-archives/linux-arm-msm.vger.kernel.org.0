Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9C00150EAF9
	for <lists+linux-arm-msm@lfdr.de>; Mon, 25 Apr 2022 23:07:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S245478AbiDYVKS (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 25 Apr 2022 17:10:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47972 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S245253AbiDYVKQ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 25 Apr 2022 17:10:16 -0400
Received: from mail-pl1-x62e.google.com (mail-pl1-x62e.google.com [IPv6:2607:f8b0:4864:20::62e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B225464713
        for <linux-arm-msm@vger.kernel.org>; Mon, 25 Apr 2022 14:07:11 -0700 (PDT)
Received: by mail-pl1-x62e.google.com with SMTP id k4so16761819plk.7
        for <linux-arm-msm@vger.kernel.org>; Mon, 25 Apr 2022 14:07:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=ho4lFHBriP83EBuh7im6oUALrBEwYKd1HOs+QqrsoEY=;
        b=akQVBkH/VtMlmKfIuInlT+qJDziMVsZPpZ+hQ5uV3NeVNRFOVaH7CY1xTOQH14tJuw
         9+tODS+z8YOYzTHVdwEEGgsej/Zlk7M/54/cctu2l86RumWCo+GvIQ1ryP6QoC8Fzvx0
         WV/ceo4PnlqfPWY3LRXcb3JxC7fsxQyjQwzzE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=ho4lFHBriP83EBuh7im6oUALrBEwYKd1HOs+QqrsoEY=;
        b=jJdv9X9XUG6IkhJfpeOkQDlgPAWLLDTi3XN9uOa6OBDQlV/wqVCsbbgTdhzsg57Xhw
         /EcgYRdcKVG7rJqiSJs0tsxv91QUM5QnQTAv6/V6lT9n3JDmtZfYzy0XR85o8SqS+MBG
         xWS7Ynf4NUVml6AbM4RJqUdfGOSerDBBRB9cr6l9jWSIivAsh5JnqMStTSLuLJowHVa6
         bVRm554lnLNCbsTcaGGrH11jCVMLajiuP/ThUN1wihcW0tvSMh8kv5pRfCHE3xrxSbus
         BIDpiFiTZi96LEQkF6QZxQgSNKF9zAPD7/trxFgJ+Q8QNY4MuZ1Y6jlXIeYaKWfR2d8u
         g8mQ==
X-Gm-Message-State: AOAM532pP0+JiFT9/cHCoQ8zMnk3h4xAjRsjnWJqDzHl1rybiBk/FNN7
        j+VNs65bJhEwLW2oeDCfUFWBuQ==
X-Google-Smtp-Source: ABdhPJz9TipniGjuLfdSJHo77yegNcYEj0amTSj6sKn2dZa2BF4vcvsJfC2yD92BSkXEdeOLzSPIxA==
X-Received: by 2002:a17:903:181:b0:15c:9035:2b18 with SMTP id z1-20020a170903018100b0015c90352b18mr16668520plg.8.1650920831241;
        Mon, 25 Apr 2022 14:07:11 -0700 (PDT)
Received: from tictac2.mtv.corp.google.com ([2620:15c:202:201:b820:7f63:f3dd:3da])
        by smtp.gmail.com with ESMTPSA id b20-20020a62a114000000b0050d231e08ffsm8523202pff.37.2022.04.25.14.07.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 Apr 2022 14:07:10 -0700 (PDT)
From:   Douglas Anderson <dianders@chromium.org>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Vinod Koul <vkoul@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Rob Clark <robdclark@chromium.org>
Cc:     Abhinav Kumar <quic_abhinavk@quicinc.com>,
        linux-phy@lists.infradead.org, Stephen Boyd <swboyd@chromium.org>,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        Kishon Vijay Abraham I <kishon@ti.com>,
        Sankeerth Billakanti <quic_sbillaka@quicinc.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-arm-msm@vger.kernel.org, quic_kalyant@quicinc.com,
        Kuogee Hsieh <quic_khsieh@quicinc.com>,
        Douglas Anderson <dianders@chromium.org>,
        Andy Gross <agross@kernel.org>,
        Daniel Vetter <daniel@ffwll.ch>,
        David Airlie <airlied@linux.ie>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH 0/2] dt-bindings: List supplies needed for sc7280 eDP
Date:   Mon, 25 Apr 2022 14:06:41 -0700
Message-Id: <20220425210643.2420919-1-dianders@chromium.org>
X-Mailer: git-send-email 2.36.0.rc2.479.g8af0fa9b8e-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.7 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

While looking through dts changes for sc7280 eDP I found that none of
the regulators that were being defined were listed in the
bindings. That being said, the current Linux drivers _were_ looking
for regulators. This series tries to document the reality to the best
of my ability.

If someone from Qualcomm has better documentation than I do and wants
to correct anything here then I'd be more than happy. For the PHY
patch especially I don't have a great way to map what I see in
datasheets / schematics to figure out which is the supply for the
"phy" and the "pll".

Assuming these look OK, I'd expect the PHY patch to land through the
PHY tree and the display patch to land through msm-next. I can split
the series up if need be--the two patches are just in one series
because they have a similar topic--there are no actual dependencies
here.


Douglas Anderson (2):
  dt-bindings: msm/dp: List supplies in the bindings
  dt-bindings: phy: List supplies for qcom,edp-phy

 .../devicetree/bindings/display/msm/dp-controller.yaml      | 6 ++++++
 Documentation/devicetree/bindings/phy/qcom,edp-phy.yaml     | 6 ++++++
 2 files changed, 12 insertions(+)

-- 
2.36.0.rc2.479.g8af0fa9b8e-goog

