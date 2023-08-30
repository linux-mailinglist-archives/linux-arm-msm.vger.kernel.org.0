Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8550B78D86E
	for <lists+linux-arm-msm@lfdr.de>; Wed, 30 Aug 2023 20:30:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234348AbjH3Sa2 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 30 Aug 2023 14:30:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55560 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S244240AbjH3Msv (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 30 Aug 2023 08:48:51 -0400
Received: from mail-lj1-x22a.google.com (mail-lj1-x22a.google.com [IPv6:2a00:1450:4864:20::22a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 788CB185
        for <linux-arm-msm@vger.kernel.org>; Wed, 30 Aug 2023 05:48:48 -0700 (PDT)
Received: by mail-lj1-x22a.google.com with SMTP id 38308e7fff4ca-2b9338e4695so83920941fa.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 30 Aug 2023 05:48:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1693399727; x=1694004527; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=bY6Ts8AN6wULo96E7oKoB6J6G/OTH3Af15URc3xEMoA=;
        b=n2lmKWfbLfegfvS/Q/G/o9QfsyqNfh1syxUX6fyIpwQmXtIJ7ZNjRslMcqtnJEegYh
         17Q0enxRpgTphYeHKw9nPhg0baqnDzXHgbnbwHjGU1x4qciUOm8vmaEIImzR9Mg5Dgk+
         z4XVmWs+hW1QoKyDzulsWBmELYcvKQIRWxIwNvtljrQo1r3bHPQ+JgBXSQ8toX35REnu
         AJtjFE5zxAUlQ4ds595W4mRJjJ1qR3xBSTTdX2bzL+vrSjNoETnsZqnDg9RGACbAbVZV
         zK0BCbX3VEmrg8svPDZkhnHfqwNPaOqC+5DeHpilZ6uOZQtAjnPUmZn6aGAxlDqTujdX
         8WfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693399727; x=1694004527;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bY6Ts8AN6wULo96E7oKoB6J6G/OTH3Af15URc3xEMoA=;
        b=N5J/iEoW4tr+W8SDi8ZkDDAnDAtFwj14mf6gjRKOM86oqIfbpsUrlrywX2vk5M5WE2
         A5D7Cf1K8TBVxz+JOyCEaQ/MlM8qBursYgeRpa1fYcf7SAaZCs1Rjrrul9xdw8iqlKyE
         1rFOsPQ03Chrzw9O9xDgh5nwg8Rk7HPRnsdVK/44mTVWa8LU4o0OUH8+5jbcDpEuxZBm
         DYZdjOz7vJq3GxK9dytwULWILUuzMw2lDSFe/ArwPUs4H726+HF0el9UhgmLLeOJGS7v
         yTZD7S3GNmV3Q5Y4vcdVVPddg/dMbJSMnYpJeCCj3e52ilnTJ/i4rt2xysHlG1EnzVib
         Y8HQ==
X-Gm-Message-State: AOJu0YyW/hZcOa8eBIwu6wHPVZhbbA/iA1yRLVAeLsWd52TlnASm92Fb
        chU+dBQBV9yW8t036LOLF5qftg==
X-Google-Smtp-Source: AGHT+IG+D0lOo9lrJZs4kvBiHpFPiLDgGrGIGGnT3fYaPcIYMUuKqyNtN8gSy6DepAKYbhlKShZt0w==
X-Received: by 2002:a2e:968c:0:b0:2b6:eb68:fe76 with SMTP id q12-20020a2e968c000000b002b6eb68fe76mr1943138lji.25.1693399726751;
        Wed, 30 Aug 2023 05:48:46 -0700 (PDT)
Received: from [192.168.1.101] (abyl195.neoplus.adsl.tpnet.pl. [83.9.31.195])
        by smtp.gmail.com with ESMTPSA id y23-20020a2e7d17000000b002b94b355527sm2602662ljc.32.2023.08.30.05.48.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Aug 2023 05:48:46 -0700 (PDT)
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
Subject: [PATCH 0/7] 8550 dma coherent and more
Date:   Wed, 30 Aug 2023 14:48:39 +0200
Message-Id: <20230830-topic-8550_dmac2-v1-0-49bb25239fb1@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAKc672QC/x2NWwqDMBAAryL73YU0QRu9SpGSx1oXNEqiRRDv7
 tLPGRjmhEKZqUBXnZDpx4WXJPB8VBBGl76EHIVBK22UNQq3ZeWAtq7VJ84uaHy1tomNNbH1A0j
 mXSH02aUwSpj2aRK5Zhr4+H/e/XXdobsSEXcAAAA=
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Abel Vesa <abel.vesa@linaro.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Sai Prakash Ranjan <quic_saipraka@quicinc.com>,
        Vinod Koul <vkoul@kernel.org>
Cc:     Marijn Suijten <marijn.suijten@somainline.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, dmaengine@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@linaro.org>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1693399725; l=1120;
 i=konrad.dybcio@linaro.org; s=20230215; h=from:subject:message-id;
 bh=Q2YXK69Spz2pE0ISEYTPLsY9leUsqULG9hqpcmUi0EI=;
 b=irxyzxwv56ierVsx6/JI+hChLN2S3zTCLQiO+0kIHxLCtxbluCGgOzIBHGnQshC4bjv2vvMWG
 pIDYsYCpaTzBNE/aq7n33CfICvNyoFIMVO2T0AfwYLFzfMAM9DKFj05
X-Developer-Key: i=konrad.dybcio@linaro.org; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Qualcomm made some under-the-hood changes and made more peripherals
capable of coherent transfers with SM8550.

This series marks them as such and brings fixups to usb and psci-cpuidle.

Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
Konrad Dybcio (7):
      dt-bindings: dmaengine: qcom: gpi: Allow dma-coherent
      dt-bindings: qcom: geni-se: Allow dma-coherent
      arm64: dts: qcom: sm8550: Fix up CPU idle states
      arm64: dts: qcom: sm8550: Mark QUPs and GPI dma-coherent
      arm64: dts: qcom: sm8550: Mark APPS SMMU as dma-coherent
      arm64: dts: qcom: sm8550: Add missing DWC3 quirks
      arm64: dts: qcom: sm8550: Mark DWC3 as dma-coherent

 .../devicetree/bindings/dma/qcom,gpi.yaml          |  2 +
 .../devicetree/bindings/soc/qcom/qcom,geni-se.yaml |  2 +
 arch/arm64/boot/dts/qcom/sm8550.dtsi               | 52 ++++++++++++++++------
 3 files changed, 42 insertions(+), 14 deletions(-)
---
base-commit: 56585460cc2ec44fc5d66924f0a116f57080f0dc
change-id: 20230830-topic-8550_dmac2-7986d683d9bf

Best regards,
-- 
Konrad Dybcio <konrad.dybcio@linaro.org>

