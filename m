Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D58DC68B33C
	for <lists+linux-arm-msm@lfdr.de>; Mon,  6 Feb 2023 01:27:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229508AbjBFA1l (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 5 Feb 2023 19:27:41 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48020 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229457AbjBFA1k (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 5 Feb 2023 19:27:40 -0500
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com [IPv6:2a00:1450:4864:20::62a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1320618142
        for <linux-arm-msm@vger.kernel.org>; Sun,  5 Feb 2023 16:27:39 -0800 (PST)
Received: by mail-ej1-x62a.google.com with SMTP id qw12so29904307ejc.2
        for <linux-arm-msm@vger.kernel.org>; Sun, 05 Feb 2023 16:27:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=gp59R213AIVhf0rg6oz7SOZcDdHcOLWRVoAaATbsRQE=;
        b=MEUCBQISThWH+b2Ucyn3XNV+AMeMMPmsEZVQ7+rHhHXpNkNa+RQoysPG6e5naxWS2Y
         5IJzU83D0bTazSZAQKck+IJuX62oVbGUNmFzCTH0Qa6MWCMfvzLiUXfj8f9vALEPQP3o
         izH2SSsc3SxJ24i0QwXLyW6ZdfAhnuW+fH3bsjdeG50qFmN1Dan40TuYjPHBr89706qw
         6vR6Kw1ySwGjoUSwHXIcP8YXj7QNZEHdcQPtZGzp3l8e2l4BNh8CHMvbmq3dQJCZgrgD
         Lnwxrer7WIahNbmjKkjrqqObaX2zMjpv3Lfc1ExE0tS0JUMfK93nnR6UCkKwPhvaAYdC
         BaeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gp59R213AIVhf0rg6oz7SOZcDdHcOLWRVoAaATbsRQE=;
        b=qpa4htvrzVdBeOkc+E3HI39RvTBiPimASgAjhjycbs+EC7YQcrSu3i9IMnYgdsy6QK
         20AOKpSOuxG7wYfPHb1QU0x7wFReeNzx4DiCB1qg1Ab8lbfhV/2ODsDDPrqS0J7u4PDd
         JtnOjBF+1TVNEZHBw8z62IAmzpVmb4pJi1GMMFvVbW4ZZhLYwCzvAp5KeSQSRYHOSOQS
         dMppHk4LCyMoQskZFh/PVFGUCZ+Js0OEW4287zQvBdf3JoLfsixmqYK1mRgVVlana6Ld
         hxv9nhlk3gg+4Qen2KmT+xfAPbtV/mWCdcN8aXmZJEqbTJXbRk7x4Kc4acd4B7/8h9P3
         7PHg==
X-Gm-Message-State: AO0yUKXZNkToNWqFFih8GDLfzB51eRp1O3yk6EvTGeqdZ8ljPx39V0vV
        zl8ZX3lPJJpmf5jlRPVoqjpx2w==
X-Google-Smtp-Source: AK7set8grDq0upnIL9MazKBpssfMi58EDXVWhNbeRv0+yo9661x6mlbD4FsdAAniDhMUASPf8H68VQ==
X-Received: by 2002:a17:906:5283:b0:879:8752:9fb2 with SMTP id c3-20020a170906528300b0087987529fb2mr19113510ejm.67.1675643257673;
        Sun, 05 Feb 2023 16:27:37 -0800 (PST)
Received: from eriador.lan (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
        by smtp.gmail.com with ESMTPSA id y18-20020a1709063a9200b00878b89075adsm4716085ejd.51.2023.02.05.16.27.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 05 Feb 2023 16:27:37 -0800 (PST)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Taniya Das <quic_tdas@quicinc.com>,
        Rob Clark <robdclark@gmail.com>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Sean Paul <sean@poorly.run>
Cc:     linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, freedreno@lists.freedesktop.org,
        David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        dri-devel@lists.freedesktop.org
Subject: [PATCH 0/8] arm64: dts: qcom: sm8350: enable GPU on the HDK board
Date:   Mon,  6 Feb 2023 02:27:26 +0200
Message-Id: <20230206002735.2736935-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.1
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

Add A660 device to the Qualcomm SM8350 platform and enable it for the
sm8350-hdk board. Unfortunately while adding the GPU & related devices I
noticed that DT nodes on SM8350 are greatly out of the preagreed order,
so patches 4-6 reorder DT nodes to follow the agreement.

Dmitry Baryshkov (8):
  dt-bindings: clock: Merge qcom,gpucc-sm8350 into qcom,gpucc.yaml
  arm64: dts: qcom: sm8350: add RPMH_REGULATOR_LEVEL_LOW_SVS_L1
  dt-bindings: display/msm/gmu: add Adreno 660 support
  arm64: dts: qcom: sm8350: reorder device nodes
  arm64: dts: qcom: sm8350: move more nodes to correct place
  arm64: dts: qcom: sm8350: finish reordering nodes
  arm64: dts: qcom: sm8350: add GPU, GMU, GPU CC and SMMU nodes
  arm64: dts: qcom: sm8350-hdk: enable GPU

 .../bindings/clock/qcom,gpucc-sm8350.yaml     |   71 -
 .../devicetree/bindings/clock/qcom,gpucc.yaml |    2 +
 .../devicetree/bindings/display/msm/gmu.yaml  |    1 +
 arch/arm64/boot/dts/qcom/sm8350-hdk.dts       |    8 +
 arch/arm64/boot/dts/qcom/sm8350.dtsi          | 2515 +++++++++--------
 include/dt-bindings/power/qcom-rpmpd.h        |    1 +
 6 files changed, 1359 insertions(+), 1239 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/clock/qcom,gpucc-sm8350.yaml

-- 
2.39.1

