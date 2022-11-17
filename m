Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7627762D74F
	for <lists+linux-arm-msm@lfdr.de>; Thu, 17 Nov 2022 10:44:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234669AbiKQJoc (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 17 Nov 2022 04:44:32 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34542 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233270AbiKQJob (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 17 Nov 2022 04:44:31 -0500
Received: from mail-lj1-x22d.google.com (mail-lj1-x22d.google.com [IPv6:2a00:1450:4864:20::22d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 85D69261C
        for <linux-arm-msm@vger.kernel.org>; Thu, 17 Nov 2022 01:44:29 -0800 (PST)
Received: by mail-lj1-x22d.google.com with SMTP id a15so1984901ljb.7
        for <linux-arm-msm@vger.kernel.org>; Thu, 17 Nov 2022 01:44:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=hD1jbAlBvTF7SKXVWN3tM9czI4aFJszt8w8SXv5RNHE=;
        b=T2Yk+dxzJHSPwNAgoVJGwixHAGi/ROC8GnFpC77iF2fqtmYewon14vgnngK6AqiSuQ
         mbWJXcX97Z8G1BpNKARPQ19yMtpvZHHa6bUhluAyj/WHwfJAvXUkMHKikGUycZ5OFBkM
         vYFwIzyVQGkht6FyhEL6wzkXN2ALSgqdGFYOzHDr/t46LIBCEybY852ggeCflMy8/FLh
         qjY8/oiclFPjUVvelW+rEWdbe7944TXc2JoaGiv9FaF+iX1jsTwQCDcwMW0cF/C5V98z
         AUSAFS0wyO2fAyEjb6DO4IXmoy9PolcT/ig8ePnnN1mn42GRllErxNtfbs57fCBHTn3t
         dtEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hD1jbAlBvTF7SKXVWN3tM9czI4aFJszt8w8SXv5RNHE=;
        b=KGUu0NH0ZWlSi3IyoM66W4mECF96F9sUFmtd7N2kJWdyJ+f/mTbh50oqXDOxf3oXP4
         Sm+nR53rVAa/hbsXk3XM9sYA68UE9y8rSrfs8HZZEoHcaZrnYdFKtnXdTWyrcvQ6QFw2
         embHLAH2I2qEfq88sEJM43uWv2vyhcULiL7rX82jajbahdMdIdrbTXtIIgad/5kdoiWd
         pdo8gbbb7igxCaPFsKwb/dEZy44vB0al2yBS+PCZsBDXH6YRnIlmNkvJhKzev0He+6/2
         Dg1nO118Z+GLgFc0TIEAvLQWb8Ae1j9m5+Xk5HzVXTeeNiEELx6daF6UmbwzAxsu4op7
         wvQg==
X-Gm-Message-State: ANoB5pmHVU2ARbGXxUfzQwrJ3MkjJyawE+87+Co2896SxmPhuE72dSIb
        d5H0OVtwUx4wiEcVMpgrRxkfCfkUFsQLz/JV
X-Google-Smtp-Source: AA0mqf4eRbnTAVBZt51qmXyW73W+8vA5ceD6Xn/gDQlwmCKhCNhrcFyk3O3Q53ffQoES6B/K20ACUA==
X-Received: by 2002:a05:651c:2cf:b0:26e:9721:880c with SMTP id f15-20020a05651c02cf00b0026e9721880cmr668881ljo.68.1668678267662;
        Thu, 17 Nov 2022 01:44:27 -0800 (PST)
Received: from localhost.localdomain ([194.29.137.22])
        by smtp.gmail.com with ESMTPSA id a23-20020a2eb557000000b002770f0a742bsm105312ljn.41.2022.11.17.01.44.26
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Thu, 17 Nov 2022 01:44:27 -0800 (PST)
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
To:     linux-arm-msm@vger.kernel.org, andersson@kernel.org,
        agross@kernel.org, krzysztof.kozlowski@linaro.org
Cc:     patches@linaro.org, Konrad Dybcio <konrad.dybcio@linaro.org>
Subject: [PATCH 0/2] SM6350 SMMUv2
Date:   Thu, 17 Nov 2022 10:44:20 +0100
Message-Id: <20221117094422.11000-1-konrad.dybcio@linaro.org>
X-Mailer: git-send-email 2.32.0 (Apple Git-132)
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

Hi,

SM6350 has a SMMUv2-compatible(-ish, obviously) instance that
is responsible for working with Adreno and its GMU.

Recently, it was decided that there is no point in adding more
mmu-500 compatibles to the driver, however after chatting with
Dmitry on IRC, it was concluded that it's okay to add that for v2, as
these older implementations can vary so much from SoC to SoC that
having a common compatible is really not feasible..

Konrad Dybcio (2):
  dt-bindings: arm-smmu: Add SM6350 GPU SMMUv2
  iommu/arm-smmu-qcom: Add SM6350 SMMUv2

 Documentation/devicetree/bindings/iommu/arm,smmu.yaml | 2 ++
 drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c            | 1 +
 2 files changed, 3 insertions(+)

-- 
2.38.1

