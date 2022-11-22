Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 38EB8634B28
	for <lists+linux-arm-msm@lfdr.de>; Wed, 23 Nov 2022 00:37:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234777AbiKVXhK (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 22 Nov 2022 18:37:10 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49580 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235008AbiKVXhD (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 22 Nov 2022 18:37:03 -0500
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com [IPv6:2a00:1450:4864:20::12c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id ED92987A6B
        for <linux-arm-msm@vger.kernel.org>; Tue, 22 Nov 2022 15:37:01 -0800 (PST)
Received: by mail-lf1-x12c.google.com with SMTP id bp15so25775328lfb.13
        for <linux-arm-msm@vger.kernel.org>; Tue, 22 Nov 2022 15:37:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=jiQzjk4U2HBL8m9nCmdH0QqbW0qnEDB7JZce1irB8qw=;
        b=gGKAQKdv563C0u+WXaCrTOxSt4oi0Gzo9xbEyK0chJ5EkTcKRvEG7Chp7zHxOYhqBU
         xuNHeX+I2qzo1Bb65t4nCoto3D19Npd11LkQvCygMMcnblKMIbwQbZe66b1NfkaRBqtU
         NjP7rEVEXms5uh0ocz6cA72tmeEtp/7+DR4ub5CEW/zJTzFn1cxlxxfw6tcDfaQfFr3N
         PiXhHoDN38B5dqHk3D3MlUy68kYLCgGelhayXsDx7XmGEmxoRn3u7UVp5H4+5Nbm9H9K
         x7qG8BPSG/JBj02t2RUFCCNYdVZJj41myreXKfbExEFnTo03HpIYmNkz7iFD5no7/XuX
         6H4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jiQzjk4U2HBL8m9nCmdH0QqbW0qnEDB7JZce1irB8qw=;
        b=N1W4ME0GAWiH4sdOxAL2r7xbPwztAP1LsOf8gPT+snWj0HWmn9PJXLZoqHONJxMxip
         I/5bnsutFr1yWG+poHRD/jay7mSPSGltxmumko64GZMd5OcBl/BG5Fvd6RZLdEItFlZf
         v2kZ79dYGfH/L+juzRFYspLQKBTi4Xau7VYRf13Je6r7M0bg8eP1xv/nh2Ai6B/bwRnw
         s92ngXgM56i6cv3UThBbaslXIpNSBFsepBHRuJ7ZCDUFvw/QnO391Xa/tBS9vPKlEQhh
         Ifj6N1TBJk0oQ5iNAMFsfssfGBZLqhWXJy/3dnMj1BUoTxNG/uTkIkONtnGSoO8L+mtm
         Uw0g==
X-Gm-Message-State: ANoB5plDK17RHlMsBwnB5ZPOQ+FXPwkuA0clKxYZPNrVJfYCptckhtOp
        dTxXXb9LoPVOdpFcyOq2uHaV1w==
X-Google-Smtp-Source: AA0mqf4rbwu1mUCXJ+V4n19yRGiu6bs/kFIOG1QwdiwAGz+l+K+/1xXJzZ04Qsd1evUe7LbbLVzz7g==
X-Received: by 2002:a05:6512:32d0:b0:4b4:b5ed:c71f with SMTP id f16-20020a05651232d000b004b4b5edc71fmr8410539lfg.227.1669160220307;
        Tue, 22 Nov 2022 15:37:00 -0800 (PST)
Received: from eriador.lumag.spb.ru (dzpbkzhtyyyyyyyyyyyyt-3.rev.dnainternet.fi. [2001:14ba:a302:8a1a::1])
        by smtp.gmail.com with ESMTPSA id h3-20020ac250c3000000b00492c463526dsm2666454lfm.186.2022.11.22.15.36.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Nov 2022 15:36:59 -0800 (PST)
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
        freedreno@lists.freedesktop.org
Subject: [PATCH v2 0/5] arm64: dts: qcom: sm8450-hdk: enable HDMI output
Date:   Wed, 23 Nov 2022 01:36:54 +0200
Message-Id: <20221122233659.3308175-1-dmitry.baryshkov@linaro.org>
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

Changes since v1:
- Reorder properties, making status the last one
- Rename opp nodes to follow the schema
- Renamed display-controller and phy device nodes
- Dropped phy-names for DSI PHYs
- Renamed DSI and DSI PHY labels to include mdss_ prefix
- Renamed 3v3 regulator device node to add -regulator suffix

Dmitry Baryshkov (3):
  arm64: dts: qcom: sm8450: add RPMH_REGULATOR_LEVEL_LOW_SVS_D1
  arm64: dts: qcom: sm8450: add display hardware devices
  arm64: dts: qcom: sm8450-hdk: enable display hardware

Vinod Koul (2):
  arm64: dts: qcom: sm8450-hdk: Add LT9611uxc HDMI bridge
  arm64: dts: qcom: sm8450-hdk: Enable HDMI Display

 arch/arm64/boot/dts/qcom/sm8450-hdk.dts | 119 ++++++++++
 arch/arm64/boot/dts/qcom/sm8450.dtsi    | 304 +++++++++++++++++++++++-
 include/dt-bindings/power/qcom-rpmpd.h  |   1 +
 3 files changed, 412 insertions(+), 12 deletions(-)

-- 
2.35.1

