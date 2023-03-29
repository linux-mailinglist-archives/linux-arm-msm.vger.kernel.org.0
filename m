Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B3CE56CF2EC
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 Mar 2023 21:17:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230228AbjC2TRt (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 29 Mar 2023 15:17:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53532 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230219AbjC2TRs (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 29 Mar 2023 15:17:48 -0400
Received: from mail-lj1-x229.google.com (mail-lj1-x229.google.com [IPv6:2a00:1450:4864:20::229])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9A65065BA
        for <linux-arm-msm@vger.kernel.org>; Wed, 29 Mar 2023 12:17:37 -0700 (PDT)
Received: by mail-lj1-x229.google.com with SMTP id by8so17242861ljb.12
        for <linux-arm-msm@vger.kernel.org>; Wed, 29 Mar 2023 12:17:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1680117456;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=N7Y/HPqAFT5kZl2+NC7WtMfO4VvsFK7oS+JSs0n+9bA=;
        b=ePy3yHQyUDCk3dHpqjHmBogZ0+Q+dtThapN4Wj1u2xBEVf5B6fJv52k66s3fkG+BWD
         x33wjSmg1zsEDlBuuo0mer0wtFgaOkwA8Yqinlksmsb4wpvRvwQTkBgm5ZdoEszmYd9M
         p2Xgj9DA1sOAlWu//uXK74xxfbzIE3g2dWJTl8dTvDOuJtgC/qybP+rjw3VVU+jSiprW
         NtSHxqj5iuDPMqKoCS7AIpqfRsLsHy2w2izDqFM1vDlRjprLVV2a+17BcYdvwfcircIk
         IjqVCq7j7gIDKQcLRkDdMQdtmzlIRmqu4fI6BA31Ks52xfAw2Cm/pOp1pGhC3AIhsRZD
         uS2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680117456;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=N7Y/HPqAFT5kZl2+NC7WtMfO4VvsFK7oS+JSs0n+9bA=;
        b=lHDWz3C09VTxWw3TIrMGOrVxSRZqJxBDfjqjBbE4JUpSJPNJGmhsTrx///d43jDh2w
         1q2JxvK9oXL1cl/al241/Fv2/oItxDN7cekJELYHpIcbK71/eQDA3EidKBpI4KtsobLo
         ck/XBLhe7tQe4eLTBtSWMcf1XU0j/J2I6pILenOVj9bJwIbHPad9MQX92j08IsEoiH/6
         X51APGZRR8oiZErzebMAsAIh70y4n7UHQBIdd4fgDAErKEMC9fjMMC8SpywteTDeuS/f
         087rMkmJhJ+uywWdasQaTV/XN3yJbvjc+M6QyiKxdm5Zoz8UGkX5OxP3q7747lkTyxMT
         yAFQ==
X-Gm-Message-State: AAQBX9cq0U9K+UWQI5EJdCvn7UWoVYnbEGaWW5bSACEuzfmc7Zqy4oEm
        /UoN7AKY+pQVNmjuD/9nbpZq+A==
X-Google-Smtp-Source: AKy350Z2U0ujU1k6Q52q1QIQ7+3S6n8vrYHszBZErBNcNBWWm5dSisfpw9SOYNkwwcnQSZdTIVmhSA==
X-Received: by 2002:a2e:998c:0:b0:293:4fff:422e with SMTP id w12-20020a2e998c000000b002934fff422emr6607507lji.16.1680117455637;
        Wed, 29 Mar 2023 12:17:35 -0700 (PDT)
Received: from [192.168.1.101] (abxj225.neoplus.adsl.tpnet.pl. [83.9.3.225])
        by smtp.gmail.com with ESMTPSA id f4-20020a2e3804000000b0029ad1fc89b3sm5189658lja.60.2023.03.29.12.17.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Mar 2023 12:17:35 -0700 (PDT)
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
Subject: [PATCH 0/4] Improve some Adreno Device Tree nodes
Date:   Wed, 29 Mar 2023 21:17:27 +0200
Message-Id: <20230329-topic-adreno_opp-v1-0-24d34ac6f007@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAMeOJGQC/x2NWwrCQAwAr1LybaDN+kCvIiLpNtpAyS5ZFaH07
 gY/Z2CYFZq4SoNLt4LLR5sWCxh2HeSZ7SmoUzBQT6lPdMZXqZqRJxcr91IrnuRAw56THBNBZCM
 3wdHZ8hyhvZclZHV56Pf/ud627QdCYcNidwAAAA==
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@somainline.org>,
        Jordan Crouse <jordan@cosmicpenguin.net>,
        Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
        Vivek Gautam <vivek.gautam@codeaurora.org>,
        Vinod Koul <vkoul@kernel.org>, Rob Clark <robdclark@gmail.com>,
        Stephen Boyd <sboyd@codeaurora.org>
Cc:     Marijn Suijten <marijn.suijten@somainline.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Andy Gross <andy.gross@linaro.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1680117452; l=1244;
 i=konrad.dybcio@linaro.org; s=20230215; h=from:subject:message-id;
 bh=R+iZN33iXNE83lVFVAXEpdrjmzEbMXX//N/oquX/lSc=;
 b=aOoG66b4K2f7ANm0dA2l6lBH4bb/0MElCkmExKL9etLcF8nux5IvprDbrGSm6O8y5SlWDZHq+1Dy
 QgjOdLLPAyba4zG1IOukpheImGgU78q3GKZfgh19YZw0p45S25nF
X-Developer-Key: i=konrad.dybcio@linaro.org; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
        DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

There are a couple of issues with some of the existing Adreno DT nodes:
- opp-level is used wrongly instead of required-opps
- the correct power domain for scaling is not always selected
- some frequencies are missing

And up until now, the power domain was not even scaled at all, until
the introduction of commit "Enable optional icc voting from OPP tables".

This series tries to address all of these. 8916 and 8996 didn't explode,
8998 could use some testing.

Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
Konrad Dybcio (4):
      arm64: dts: qcom: msm8998: Improve GPU OPP table
      arm64: dts: qcom: msm8996: Pass VDDMX to gpu in power-domains
      arm64: dts: qcom: msm8996: Improve GPU OPP table
      arm64: dts: qcom: msm8916: Improve GPU OPP table

 arch/arm64/boot/dts/qcom/msm8916.dtsi | 22 ++++++++++++++++----
 arch/arm64/boot/dts/qcom/msm8996.dtsi | 29 +++++++++++++++++++-------
 arch/arm64/boot/dts/qcom/msm8998.dtsi | 39 +++++++++++++++--------------------
 3 files changed, 57 insertions(+), 33 deletions(-)
---
base-commit: 198925fae644b0099b66fac1d972721e6e563b17
change-id: 20230329-topic-adreno_opp-7e5214a3e632

Best regards,
-- 
Konrad Dybcio <konrad.dybcio@linaro.org>

