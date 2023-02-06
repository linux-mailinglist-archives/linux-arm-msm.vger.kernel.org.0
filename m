Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DAD4668C09B
	for <lists+linux-arm-msm@lfdr.de>; Mon,  6 Feb 2023 15:57:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230350AbjBFO5Q (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 6 Feb 2023 09:57:16 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40254 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230353AbjBFO5O (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 6 Feb 2023 09:57:14 -0500
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com [IPv6:2a00:1450:4864:20::62f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9FEF22196E
        for <linux-arm-msm@vger.kernel.org>; Mon,  6 Feb 2023 06:57:10 -0800 (PST)
Received: by mail-ej1-x62f.google.com with SMTP id lu11so34993005ejb.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 06 Feb 2023 06:57:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=cLuf1U+2WjifV8fnrslcwZDFA4TZvCGB2iPkwtWqNUI=;
        b=oq9jViBl3HA8dQj59yZsQcWYKhAEvJWr1Mqzc1nDjWd3kRLMlEJmDIhfOc2l+p9NLd
         sEyjvRaMXAsm/bYtTpQnIz65QqWwNZzD2ixnXeIv/n7h0wwjcYKGqo5UlUhhHj/+UxhN
         Vjip+0N5Gcg9eBr6e9L2FgnlD02pMQtDmefHpu6L6q15uOGJwGLd6Q+iHLS5qDhwcnpv
         jcH/BDXAdXafNKaM0EBgworEii3bTIRcz1nDLBmzdKEdZFuwosxwjqEO4W6y868kqLfD
         btVyftrdECwXZvuYQTLDMsH366OL3edNWQJg4/Ues9yHsG8FHbMc5frF17qLpR6RVgFB
         TLKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=cLuf1U+2WjifV8fnrslcwZDFA4TZvCGB2iPkwtWqNUI=;
        b=LyecmjnWOiC8z1TBE10PLeurT/S/rJfBAr8d1+Bk842iVk/y3F9o3Zlr6YupKooCNW
         w/qNYQWzfb+OskXw80y5MXHOtXE3DCfmtmnzYXDc7Jfidc7kzQ7zKATb2pX9KImjJsI4
         xNGx1FQCwZlqvlDBKwNlHNohRgR5dA3amUxcZrOSPqA2arLYog93ADl4X6hlM7LBpKMj
         9l4bHxe/Pdk8hUE9SmUxwC9DSEbbf07NdAvkAqpn90xmlMkDZD0+j1jSfqDOf3ltp7Dr
         lxIzHq4JhNPOesxBb225qggHJX9cl04LVuyb1SzG5YsYNGsPycbHFk4IF5JCCge8hOEJ
         2kuQ==
X-Gm-Message-State: AO0yUKVeBh+hj4+VsZy4DAmQuGbhIRXhzVTNZfPP7b4zqHB/q3XDvoak
        XY5oR7JLB0/1pm1EvfkfH9I+PA==
X-Google-Smtp-Source: AK7set/oKvZyc+ZrfLJPgnfOVLJVKoAm0Z0SgsTUoA8rN3b3dRK6zhySANFVfe+x2ByyCb7N0W7vLw==
X-Received: by 2002:a17:907:7ba9:b0:87b:d3dd:e0ca with SMTP id ne41-20020a1709077ba900b0087bd3dde0camr13140091ejc.26.1675695429234;
        Mon, 06 Feb 2023 06:57:09 -0800 (PST)
Received: from eriador.lan (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
        by smtp.gmail.com with ESMTPSA id gw1-20020a170906f14100b0087bd4e34eb8sm5495533ejb.203.2023.02.06.06.57.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Feb 2023 06:57:08 -0800 (PST)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Taniya Das <quic_tdas@quicinc.com>
Cc:     linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, Rob Clark <robdclark@gmail.com>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Sean Paul <sean@poorly.run>, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>
Subject: [PATCH v2 0/8] arm64: dts: qcom: sm8350: enable GPU on the HDK board
Date:   Mon,  6 Feb 2023 16:56:59 +0200
Message-Id: <20230206145707.122937-1-dmitry.baryshkov@linaro.org>
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

Changes since v1:
- Fixed the subject and commit message for patch 1
- Fixed GMU's clocks to follow the vendor kernel
- Marked Adreno SMMU as dma-coherent
- Dropped comments targeting sm8350 v1, we do not support that chip
  revision.

Dmitry Baryshkov (8):
  dt-bindings: clock: Merge qcom,gpucc-sm8350 into qcom,gpucc.yaml
  dt-bindings: power: qcom,rpmpd: add RPMH_REGULATOR_LEVEL_LOW_SVS_L1
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
 arch/arm64/boot/dts/qcom/sm8350.dtsi          | 2512 +++++++++--------
 include/dt-bindings/power/qcom-rpmpd.h        |    1 +
 6 files changed, 1357 insertions(+), 1238 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/clock/qcom,gpucc-sm8350.yaml

-- 
2.39.1

