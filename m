Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B67876E5DF0
	for <lists+linux-arm-msm@lfdr.de>; Tue, 18 Apr 2023 11:55:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229610AbjDRJzG (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 18 Apr 2023 05:55:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53358 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229657AbjDRJzF (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 18 Apr 2023 05:55:05 -0400
Received: from mail-ej1-x630.google.com (mail-ej1-x630.google.com [IPv6:2a00:1450:4864:20::630])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4A2536588
        for <linux-arm-msm@vger.kernel.org>; Tue, 18 Apr 2023 02:54:51 -0700 (PDT)
Received: by mail-ej1-x630.google.com with SMTP id a640c23a62f3a-94ef8b88a5bso204524066b.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 18 Apr 2023 02:54:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1681811690; x=1684403690;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=2XjTw2b21Lrfk4Jj+V6+6PBPJM9Xvx/rp1PjUa4gW2g=;
        b=PlTVbNDBEYUnR+2Y6PfJVtcYCczUn6Ca3dFuBncv4GXwgOmqtytA4fs28OTeWM4bsi
         OS7QrnQH1b2vjIE72icuKzcpmJFOseNqLoSXZa12NOGqUkcrdFuaxFnFcg4Du1wpRfal
         lca47bv8Mt7LBSSPs5Fr7c+RZ5PJx2XWoXdBVuIXQHWjPKRqm3z+OFgYuAlHm6PnJvlR
         Y3lyID1XKdRBSd6vHlzn/ntqwltwmDwpMNdTt9OBbHVFz2PJIj+e3ZMtUs7wU1rOx2r0
         XpB07nyyJfMShpJfpsx8Jh9VIi115BHRbvIg+Va21QjlNlkQBIS23un1c4Gj86aeqdf0
         quMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681811690; x=1684403690;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2XjTw2b21Lrfk4Jj+V6+6PBPJM9Xvx/rp1PjUa4gW2g=;
        b=av+jaJm4KOLInVJdgzrdPdGbsc6FuPjivM167xheRGkzMNsYRSTAKgF+pMOk+BBPTF
         3V7+BdUVqh5YK4ki5stoXBVJgyQ+Psj2nfDTqPb2CHixrSA/YA2nCTNKO7lgdPOJ+ApB
         mQP66pv6R93gnLQCcC/qpd47ONyR5GLqqK1HySF3u15IBiRxjkzqxCkWyMBcG5bLCADm
         Y/3qCkINrBtpbObFYgWP7C4NItoXqcECV2f8zwPLe1u4ZghSiAmQggDHui0po1XzjPK/
         D/1WEi8C67Ea8Ab1hFw9zosDAy5mOLYNf4oirXbx+lZMbbLfPioIMhjXr3JIr/KzCJdj
         zblA==
X-Gm-Message-State: AAQBX9eiOdPRetp0wP6J0nX5hdstrZZLini6+AwwH98W0zTK3qrtQRwi
        Fi5FMzgICi6NA5LkhgutLEDCgQ==
X-Google-Smtp-Source: AKy350ZoxJAY3osQymk/xjYIDkdSjS0BzSqPxS/Lm+86HDfHKVxW1WWwARUG2qSTrkpHqDsjf2Kytg==
X-Received: by 2002:a05:6402:748:b0:506:ae87:a36a with SMTP id p8-20020a056402074800b00506ae87a36amr1867913edy.14.1681811690360;
        Tue, 18 Apr 2023 02:54:50 -0700 (PDT)
Received: from krzk-bin.. ([2a02:810d:15c0:828:a276:7d35:5226:1c77])
        by smtp.gmail.com with ESMTPSA id o4-20020a509b04000000b00504d04c939fsm7076578edi.59.2023.04.18.02.54.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Apr 2023 02:54:49 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Vinod Koul <vkoul@kernel.org>,
        Bard Liao <yung-chuan.liao@linux.intel.com>,
        Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
        Sanyog Kale <sanyog.r.kale@intel.com>,
        Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
        Rao Mandadapu <quic_srivasam@quicinc.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, alsa-devel@alsa-project.org
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH v3 0/7] soundwire: qcom: add support for SM8550 (Soundwire v2.0.0)
Date:   Tue, 18 Apr 2023 11:54:40 +0200
Message-Id: <20230418095447.577001-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi,

Changes since v2:
1. Use uint16 for qcom,ports-sinterval.
   DTS will be fixed in separate patchset.
2. Add tags.

Changes since v1:
1. Patch 1: Increase maxItems to 16 for port-related properties.
2. Re-order patch 1 and 2.
3. Patch 3: Drop unneeded semicolon.
4. Patch 5: Fix lang typo in subject.

Best regards,
Krzysztof

Krzysztof Kozlowski (7):
  dt-bindings: soundwire: qcom: add Qualcomm Soundwire v2.0.0
  dt-bindings: soundwire: qcom: add 16-bit sample interval
  soundwire: qcom: allow 16-bit sample interval for ports
  soundwire: qcom: use consistently 'ctrl' as state variable name
  soundwire: qcom: prepare for handling different register layouts
  soundwire: qcom: add support for v2.0.0 controller
  soundwire: qcom: use tabs for indentation in defines

 .../bindings/soundwire/qcom,soundwire.yaml    |  39 +-
 drivers/soundwire/qcom.c                      | 387 ++++++++++++------
 2 files changed, 287 insertions(+), 139 deletions(-)

-- 
2.34.1

