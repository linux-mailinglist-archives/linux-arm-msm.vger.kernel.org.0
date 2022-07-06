Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8EB5B568BD5
	for <lists+linux-arm-msm@lfdr.de>; Wed,  6 Jul 2022 16:53:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232625AbiGFOwr (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 6 Jul 2022 10:52:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40664 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233265AbiGFOw0 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 6 Jul 2022 10:52:26 -0400
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com [IPv6:2a00:1450:4864:20::132])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BCCAB25C79
        for <linux-arm-msm@vger.kernel.org>; Wed,  6 Jul 2022 07:52:25 -0700 (PDT)
Received: by mail-lf1-x132.google.com with SMTP id z25so8778514lfr.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 06 Jul 2022 07:52:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=6HBzK/l93JxPEmhI/JaroF5KDLT4SrwcSehWqsU43NQ=;
        b=t5eWjH/Dg2AmKlwx139MJxWOxq1jBDfwI9WMSF9SAsITjUshwwbKTHgMGW7RsPmUEL
         WRjlBA9lYI4N6n9cI/+G6qoCxwnaTGChhWReYDxD7o59MfrLVGgn4kS3kBzwT9QobPUi
         NvVWvkeRTBQrbidYucWeDo0DhaVmV/lpGwP/2gU6MGUM4NDGG4y3Wv5mlQvQLODFDGvR
         vAZlDgycFrQfRjJQBrk96/jBs8pBtl/1NHdKuqiXr7kTk0bs0HfVHUTEC9KW2v0BDt/R
         HzkrRibSmZ2PNYK6/kmlVaBdzaMO0cfX3unVdnk/qwtXt57GyYullp+GmdIhDdMiIAF3
         z7Dg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=6HBzK/l93JxPEmhI/JaroF5KDLT4SrwcSehWqsU43NQ=;
        b=AbyS2ZD9Uj0FH1iWnbAi1vGJSUJACPLIeFZzOvAH2g7PHLoU5V8XEq4Bacd0BBZo3r
         2ve5ZG+EaJ4T7p7LrrewqZ75VZDrJkngDMhhZWjuPRWTx6RkKw+1Q+1rNYIXcqVdwkrn
         WulegNHzPn4ALZzrdcOZbNvlwTJEvGh5zLM50tDzcSf8nnYJrB9oYchqa0XM7Wsvmbl2
         TgaoMqceETQ/5HJr3RBXxfb+ldd10ZM4Yx1ifDhJQkFfxG/Nb0xfmGJY9AALRBv7PhEA
         od8mhRGNpkeNtYhTIEuPQuho27rMY+7w50ytysMjz0oC4Ck1hFGYAF3GveGUCeplMpwG
         5KrA==
X-Gm-Message-State: AJIora9J92tWKV6RFQWwvalA/MLmc6vhHGJmUcWYgnk/8MK1m8aLyZtq
        FNHGFYj2+++sQnt/EaN7HxO5ig==
X-Google-Smtp-Source: AGRyM1tFUXYXbeJILL9shHP73Zaabp7CJDJi2SC1ggS6bSdLsSQuPcyJ0S3/TA7y9BPw7jXiyAx3LA==
X-Received: by 2002:a05:6512:3a91:b0:47f:97fe:fa16 with SMTP id q17-20020a0565123a9100b0047f97fefa16mr25290467lfu.120.1657119144151;
        Wed, 06 Jul 2022 07:52:24 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id v25-20020a056512049900b004855e979abcsm556617lfq.99.2022.07.06.07.52.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 Jul 2022 07:52:23 -0700 (PDT)
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
Subject: [PATCH 0/4] dt-bindings: display/msm: schema fixes for gpu, gmu and mdp4
Date:   Wed,  6 Jul 2022 17:52:18 +0300
Message-Id: <20220706145222.1565238-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
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

Fix several issues in MSM display schema.

Dmitry Baryshkov (4):
  dt-bindings: display/msm/gpu: allow specifying several IOMMU nodes
  dt-bindings: display/msm/gpu: document using the amd,imageon adreno
    too
  dt-bindings: display/msm/gmu: account for different GMU variants
  dt-bindings: display/msm/mdp4: require 4 IOMMUs

 .../devicetree/bindings/display/msm/gmu.yaml  | 166 +++++++++++++++---
 .../devicetree/bindings/display/msm/gpu.yaml  |   9 +-
 .../devicetree/bindings/display/msm/mdp4.yaml |   2 +-
 3 files changed, 155 insertions(+), 22 deletions(-)

-- 
2.35.1

