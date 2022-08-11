Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D293A58F948
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Aug 2022 10:43:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234617AbiHKInj (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 11 Aug 2022 04:43:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48328 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234603AbiHKIni (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 11 Aug 2022 04:43:38 -0400
Received: from mail-lj1-x229.google.com (mail-lj1-x229.google.com [IPv6:2a00:1450:4864:20::229])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6807E90C5B
        for <linux-arm-msm@vger.kernel.org>; Thu, 11 Aug 2022 01:43:37 -0700 (PDT)
Received: by mail-lj1-x229.google.com with SMTP id x25so18606563ljm.5
        for <linux-arm-msm@vger.kernel.org>; Thu, 11 Aug 2022 01:43:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc;
        bh=NrZYSX3ODzXpebRjPy8XkH0oC+vo00qnzndpmnYi1I4=;
        b=m/bMng6FLs+7CY7pNO/OXjLamFk5vNDVIYCWtUPKj/IkXQzBoV6anAhzutPnrJRFaZ
         HeBjbhXlzaLqXzaPoXjxuRHANKJ6CakE+EI+DM2biMX6tmgK2fBBK7BDU0PEsmPjDf13
         D5tHCuds81IC08ZxRPyiX+gal6ahW1Ax2qm1yYNAY3fIYtGNyRxLckxRL9tz3bPLukwx
         7WRwQKHV+VRBNEdLcNPnOohmhFheYf/P6hcxgRlUCcX/9ZoqmBhrRx5vzZzYTxOt0IMm
         qBKyPtX1sWOIQO6uEWsu2AIt8IalZpmBZUkMNxw0EXH4zfYTsH72+O8OmbA3Kdl80UUq
         ZrfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc;
        bh=NrZYSX3ODzXpebRjPy8XkH0oC+vo00qnzndpmnYi1I4=;
        b=7i9MDdJ0lJJPNt1fs1Naekkk6lreZVZxew3B6d0LcN4kqDt+dBnZreD/k5zCRQDRvz
         GsYJb9fbGMTMsJTTRvQPR6zhF1Zk+TJKeKeJ/RHCyTquePS45p04ezpqKLsn8FKOmN9I
         2+oriithHMynhqJBvplLoIlkWBrU8lh5M9rjXQ92FWl3xPUZ7HssTE43rlOYeG/LK1bc
         2opPSgPbDbMNOOSq/kKJibZuaaiC11Oak2+THpJrP85ghkQ4XaxZ9HBclIA0P+rU3pht
         U309r9LP1FKhj0BYtH9PHhR4qA+kRqadmIA7Ng0wCH95wpwHjqopclOLvUp2I6WVPSzl
         0MfA==
X-Gm-Message-State: ACgBeo3++cF/vmeZe0tlImBbmGI0b/9hUZtlvV3KTNBjTyVFKLoAJ7O1
        t4c5k9ovehCC7qxFqt+kWsZr/A==
X-Google-Smtp-Source: AA6agR7Zr+6RGGNJ3TJfgUxJlv4C80I+M+wAqypsOzqPCjDyqyfXzIF+2P0VGvZu1oKh1YSgGOQsKQ==
X-Received: by 2002:a2e:9056:0:b0:25d:64c0:27b1 with SMTP id n22-20020a2e9056000000b0025d64c027b1mr214976ljg.396.1660207415823;
        Thu, 11 Aug 2022 01:43:35 -0700 (PDT)
Received: from localhost.localdomain ([83.146.140.105])
        by smtp.gmail.com with ESMTPSA id f4-20020a056512360400b0048af379957asm631077lfs.72.2022.08.11.01.43.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Aug 2022 01:43:35 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Rob Clark <robdclark@gmail.com>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Sean Paul <sean@poorly.run>, David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Del Regno <angelogioacchino.delregno@somainline.org>,
        Loic Poulain <loic.poulain@linaro.org>,
        Krishna Manikandan <quic_mkrishn@quicinc.com>,
        Jami Kettunen <jami.kettunen@somainline.org>,
        Stephen Boyd <swboyd@chromium.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH 0/5] dt-bindings: display/msm: dpu: opp-table fixes
Date:   Thu, 11 Aug 2022 11:43:26 +0300
Message-Id: <20220811084331.83715-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi,

There is a conflicting series of
https://lore.kernel.org/all/20220710090040.35193-1-dmitry.baryshkov@linaro.org/
but I think this one here should go before to fix the issue before the
refactoring.

Best regards,
Krzysztof

Cc: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Rob Clark <robdclark@gmail.com>
Cc: Sean Paul <sean@poorly.run>
Cc: Abhinav Kumar <quic_abhinavk@quicinc.com>

Krzysztof Kozlowski (5):
  dt-bindings: display/msm: dpu-msm8998: add missing DPU opp-table
  dt-bindings: display/msm: dpu-qcm2290: add missing DPU opp-table
  dt-bindings: display/msm: dpu-sc7180: add missing DPU opp-table
  dt-bindings: display/msm: dpu-sc7280: add missing DPU opp-table
  dt-bindings: display/msm: dpu-sdm845: add missing DPU opp-table

 Documentation/devicetree/bindings/display/msm/dpu-msm8998.yaml | 3 +++
 Documentation/devicetree/bindings/display/msm/dpu-qcm2290.yaml | 2 ++
 Documentation/devicetree/bindings/display/msm/dpu-sc7180.yaml  | 2 ++
 Documentation/devicetree/bindings/display/msm/dpu-sc7280.yaml  | 2 ++
 Documentation/devicetree/bindings/display/msm/dpu-sdm845.yaml  | 3 +++
 5 files changed, 12 insertions(+)

-- 
2.34.1

