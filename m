Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 20A51603647
	for <lists+linux-arm-msm@lfdr.de>; Wed, 19 Oct 2022 01:04:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229657AbiJRXD7 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 18 Oct 2022 19:03:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53932 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229687AbiJRXD5 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 18 Oct 2022 19:03:57 -0400
Received: from mail-qk1-x72e.google.com (mail-qk1-x72e.google.com [IPv6:2607:f8b0:4864:20::72e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 908F5BCBBF
        for <linux-arm-msm@vger.kernel.org>; Tue, 18 Oct 2022 16:03:56 -0700 (PDT)
Received: by mail-qk1-x72e.google.com with SMTP id d13so9690494qko.5
        for <linux-arm-msm@vger.kernel.org>; Tue, 18 Oct 2022 16:03:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=oeAzVhwyZLPp4pOGbTzIPOMrEf5YLeMPlDQWrWigIBM=;
        b=Wx0QEAIey6z2YgQv+U50YS8sUgO+KreRxo2xd83lGy9othZ3XU5PbGfXB2+tTt2qJX
         13hjmEHtTveaPAKxTC7D92s8P4QPdioMG2NKDe8D9C5hXIN2vxh6DoxlERdz3+Nc6+aO
         rwJwi/hISggdUV8d90uIh5CCH19/8+39BM3uGWWufFDl/LtuT5ckjRFB+wKu7bdewMbc
         uyzRoTNkQiKhN38603RPMX1IAmyyKK/lzllM72pAVC0jX5zWOPATaJTkO5gyae7X9rSo
         jGc04aN2T8EpXQ2h0NkJeOo8oYq4PFALTb2NTe99NO4Hzif5lOkRQPqun59pUGO1msDH
         auYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=oeAzVhwyZLPp4pOGbTzIPOMrEf5YLeMPlDQWrWigIBM=;
        b=5+ePvmm2t0mr8/Z//nwwIv18S92diT/UlElNom0M7iUKnMQbj/z46KWJeoxv2jYk4s
         AcWywWke+ahc1DdauJtpmowNRY42K7ZfHl08KNl6j49DmK5uMOfV2pF6Vdynnew9vTZ5
         p2hbuPC3HDU4t7Upa0gtEJ04kb8Kss/iD4rVhMaw3vu16Va2vbx5KeGmcJWzkAgxgwvs
         WfNJbM3feP2YVRXy4vkPgM4WecyIBd40OuKVX+zwUEHpt8nFoO3+MYgeoF/pvi4tlznJ
         TnYMDbMM43fN4NuSqNetizn1Kg04tNctanHvp4NbLKB8VbxnXzlc86/uU6gU5nH5mueY
         XVyw==
X-Gm-Message-State: ACrzQf0M9nhPnENInMD7pnpqcfUY0bS4nY1WDz5aDaVzEzBs65ipVU/a
        e2kwI6776e4bkHqD3rt+otGBlQ==
X-Google-Smtp-Source: AMsMyM5R/Cte/NFhGimHeJHnKuTFLzp/W4TRm70uS+gyZImkgd+su2n3i47o3LzbRFjd2EqjoVsW6Q==
X-Received: by 2002:a05:620a:3720:b0:6dd:beba:b3a1 with SMTP id de32-20020a05620a372000b006ddbebab3a1mr3508446qkb.138.1666134235590;
        Tue, 18 Oct 2022 16:03:55 -0700 (PDT)
Received: from krzk-bin.MSRM (pool-72-83-177-149.washdc.east.verizon.net. [72.83.177.149])
        by smtp.gmail.com with ESMTPSA id 134-20020a370a8c000000b006cbcdc6efedsm3279010qkk.41.2022.10.18.16.03.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Oct 2022 16:03:54 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Vinod Koul <vkoul@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-arm-msm@vger.kernel.org, dmaengine@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH v2 0/5] dma/arm64: qcom: use one compatible also for 0x10000 offset
Date:   Tue, 18 Oct 2022 19:03:47 -0400
Message-Id: <20221018230352.1238479-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi,

Changes since v1
================
1. Rebase on v6 of Richard's patch.
2. Add tags.

Dependencies
============
1. DT bindings and DMA driver change depends contextually on:
   https://lore.kernel.org/all/20221018005740.23952-1-mailingradian@gmail.com/

2. DTS patches are independent, although they will spark some dtbs_check
   warnings (due to change in bindings).

Best regards,
Krzysztof

Krzysztof Kozlowski (5):
  dt-bindings: dma: qcom: gpi: Use sm6350 fallback
  dmaengine: qcom: gpi: Document preferred SM6350 binding
  arm64: dts: qcom: sc7280: Add GPI DMA compatible fallback
  arm64: dts: qcom: sm8350: Add GPI DMA compatible fallback
  arm64: dts: qcom: sm8450: Add GPI DMA compatible fallback

 Documentation/devicetree/bindings/dma/qcom,gpi.yaml | 9 ++++++---
 arch/arm64/boot/dts/qcom/sc7280.dtsi                | 4 ++--
 arch/arm64/boot/dts/qcom/sm8350.dtsi                | 6 +++---
 arch/arm64/boot/dts/qcom/sm8450.dtsi                | 6 +++---
 drivers/dma/qcom/gpi.c                              | 7 ++++---
 5 files changed, 18 insertions(+), 14 deletions(-)

-- 
2.34.1

