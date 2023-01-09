Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4FF71661E12
	for <lists+linux-arm-msm@lfdr.de>; Mon,  9 Jan 2023 06:02:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234310AbjAIFB7 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 9 Jan 2023 00:01:59 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50138 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233886AbjAIFB5 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 9 Jan 2023 00:01:57 -0500
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com [IPv6:2a00:1450:4864:20::129])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 907D29FCE
        for <linux-arm-msm@vger.kernel.org>; Sun,  8 Jan 2023 21:01:55 -0800 (PST)
Received: by mail-lf1-x129.google.com with SMTP id bp15so11219551lfb.13
        for <linux-arm-msm@vger.kernel.org>; Sun, 08 Jan 2023 21:01:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Ok+qK488vGNle4t9+FREyJqmLLm1uU83p9UuS5OAb28=;
        b=LjWJQF5RlnaPF15+9Tq7jpic+Kvjlrf3R9ol4KniKkED29v00CN/ba2n0OZVkivs2s
         qhzCmh12DQFbkcgj0gnhWeTBgwpWNvWu25qcraZNX0dq+AEIQwAU3FlcjDBIb5tsJscf
         mbB/8WG8Bj76EebIioeHtlKwW3OQIpAkcN8ZlGoT+3tCf7UizhH4PTOibC4OwQMK3An5
         73BCQ9mvErzeZZbAV0qvQcpE88SpSNORNattXWWSX8zjpb7IER0ftHS8xTzfTkHP90bX
         5so02fD+RRyRSQHmQV6mBa+3RKi0k9h0utam9IIWjlHNdFhoNmlUeKhd/yWfFqSIZe2/
         HHpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Ok+qK488vGNle4t9+FREyJqmLLm1uU83p9UuS5OAb28=;
        b=LAOyFQaJTPpKJ1sZgMpowYKmZubub9yMhhwnIMxrhfzafNi3zvpZY34AN7lXTe1Lc3
         IF6OBVuNjUkEk38hZ1s6gbVDtIiGnEJMsDya34W8lenLWAHP7f8OQTIeo8vnBz13rqHE
         rG3wgni4JpMvn8zOr/FOI6U1MdqKDRnTQhVuy/bDIlpR9kSWwzvJVi9ixCQgMfSxGC4U
         9jMUvWdqIqjqIt1++JbLkwtCUnCT6rgXjxaxG4Qf3Phi7b6lsTfk+nPq9ecCmNhKhq8R
         VZj+CWxlGJ+dxuEy65mzG8Oo0U9Qd6952DVQpjYPiDGuouuvxXO6JbGug3HJDj71cwIN
         hqtQ==
X-Gm-Message-State: AFqh2kq7uWk9rATvgP5wagpknFtYg7J28yegR7iJS/twk0Mgozr3x+ns
        N5fO7Cx/xgROJPb0cyAmBbf55Q==
X-Google-Smtp-Source: AMrXdXtzp41qqG/lszrfNHfC2L92bMUpFeXQtOiWuX952aJY0JwdWMQ8uRD2mPp1CBfrgDMQkk1Jhw==
X-Received: by 2002:ac2:53a3:0:b0:4bc:4ad0:4142 with SMTP id j3-20020ac253a3000000b004bc4ad04142mr19967819lfh.58.1673240513932;
        Sun, 08 Jan 2023 21:01:53 -0800 (PST)
Received: from eriador.lan (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
        by smtp.gmail.com with ESMTPSA id j12-20020a19f50c000000b004b59067142bsm1008257lfb.8.2023.01.08.21.01.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Jan 2023 21:01:53 -0800 (PST)
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
Subject: [PATCH v5 0/4] dt-bindings: display/msm: convert MDP5 schema to YAML format
Date:   Mon,  9 Jan 2023 07:01:48 +0200
Message-Id: <20230109050152.316606-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.0
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

This patch concludes the conversion of display/msm schema from txt files
to YAML format.

The per-SoC compat (new addition) is required to ease migrating platform
support between mdp5 and dpu drivers.

Changes since v4:
- Adjust qcom,mdss.yaml to follow the addition of per-SoC compatibles

Changes since v3:
- Drop MSM8998 completely, it conflicts with qcom,msm8998-dpu.yaml

Changes since v2:
- Fix MSM8998 compatible list: "qcom,msm8998-dpu", "msm,mdp5" to allow
  handling this device by either of the drivers.

Changes since v1:
- Renamed mdp@ to display-controller@ in the example (Krzysztof)
- Extended ports description to mention possible ports (Krzysztof)
- Fixed ports@ regexp to limit to just four ports (Krzysztof)
- Included patches adding per-SoC compat strings to the schema and to
  dtsi files.


Dmitry Baryshkov (4):
  dt-bindings: display/msm: convert MDP5 schema to YAML format
  dt-bindings: display/msm: add SoC-specific compats to qcom,mdp5.yaml
  ARM: dts: qcom-msm8974: add SoC specific compat string to mdp5 node
  arm64: dts: qcom: add SoC specific compat strings to mdp5 nodes

 .../devicetree/bindings/display/msm/mdp5.txt  | 132 ---------------
 .../bindings/display/msm/qcom,mdp5.yaml       | 153 ++++++++++++++++++
 .../bindings/display/msm/qcom,mdss.yaml       |   6 +-
 arch/arm/boot/dts/qcom-msm8974.dtsi           |   2 +-
 arch/arm64/boot/dts/qcom/msm8916.dtsi         |   2 +-
 arch/arm64/boot/dts/qcom/msm8996.dtsi         |   2 +-
 arch/arm64/boot/dts/qcom/sdm630.dtsi          |   2 +-
 arch/arm64/boot/dts/qcom/sdm660.dtsi          |   2 +
 8 files changed, 164 insertions(+), 137 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/display/msm/mdp5.txt
 create mode 100644 Documentation/devicetree/bindings/display/msm/qcom,mdp5.yaml

-- 
2.39.0

