Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 95BAB55E265
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 Jun 2022 15:35:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244951AbiF1MFF (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 28 Jun 2022 08:05:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34032 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239597AbiF1MFE (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 28 Jun 2022 08:05:04 -0400
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com [IPv6:2a00:1450:4864:20::42a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 729EF3135A
        for <linux-arm-msm@vger.kernel.org>; Tue, 28 Jun 2022 05:04:40 -0700 (PDT)
Received: by mail-wr1-x42a.google.com with SMTP id v14so17353288wra.5
        for <linux-arm-msm@vger.kernel.org>; Tue, 28 Jun 2022 05:04:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=LasQIcGj2EkLsI4F0d1EwxnNc/TKgEuzRf3skqrfIZI=;
        b=s9ZUAzTUyYk5hf+SfgKWwKzcXBR/n7WUsOu56nmGVfPOme6ObB4rAx5EDI0teyQsim
         bTRPXlG+MonKFrIT/qCb2cG/S3jl8xzYxDrFTfWWjNs6Oq5jVjzRCj0g4YXPE/M7rvFg
         5UF1NuVvcj0EBHiW3Q9W//a90cM43ElnlhSiKtYYjjtFdEj+7WvRJlkyZwvAn95G22sU
         IdnTvWAjWuW/Nr8gYdMJnHIqpxV//RkupCSS0mltfMYtSyHApM4lPS39NsVfZakD+rEw
         rcApGSPFXdYeViFJc5U3dxCo6R5GsqwQf8NRaYM74cs765+g0XNOmcxyiuIwm+LqLC7b
         QHYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=LasQIcGj2EkLsI4F0d1EwxnNc/TKgEuzRf3skqrfIZI=;
        b=Mul/dRiUXz8sqGjEOHbNAOi+eIgaOoFTeEOI+pb5r5W5EdangBPfU2EKWpBrTOVVAL
         Dk2pf6pw8M9ZZlh0a8ePtIcicYGgbaSx8APwuJCy0r4AUgaOyVICQHd3nFSaW+E+eEt+
         L+oiMMzBI/bCvgWHXtBSK48Tc2x2R6nrWoQnT7OyQgnLZpuBRiIZck0u1px/mrb3retW
         YMvuk49IkLz3blzlM3g2AAB7y7iie8iMny9futISl+Z65NHSTQmKZorOzQxd9/le0H+a
         Hr09B5xF4NRvKmikTG9qHv0rMghQb4CW8lQAAke7h254X5J0S8KB7AK5v+cY+juva7C/
         mk7A==
X-Gm-Message-State: AJIora8TqMiIY6iPGnBSFhfzLjOQQinagbr/ZAUG42mIURonavFp+bMU
        IpxWuwP5wmKDq9IZSLdHgaxPRu+WWhi8Kg==
X-Google-Smtp-Source: AGRyM1u0I+sAFnOLTEk6/euxVF6ALxxNfuRv+szBog+hZqVNgGNhJ5pEtFG6+4Vk5Wz6dm3cWezU8w==
X-Received: by 2002:a05:6000:ca:b0:21b:8082:7518 with SMTP id q10-20020a05600000ca00b0021b80827518mr16540229wrx.124.1656417878812;
        Tue, 28 Jun 2022 05:04:38 -0700 (PDT)
Received: from sagittarius-a.chello.ie (188-141-3-169.dynamic.upc.ie. [188.141.3.169])
        by smtp.gmail.com with ESMTPSA id p20-20020a1c7414000000b003a05621dc53sm1457737wmc.29.2022.06.28.05.04.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Jun 2022 05:04:38 -0700 (PDT)
From:   Bryan O'Donoghue <bryan.odonoghue@linaro.org>
To:     lgirdwood@gmail.com, broonie@kernel.org, bjorn.andersson@linaro.org
Cc:     perex@perex.cz, tiwai@suse.com, srinivas.kandagatla@linaro.org,
        robh+dt@kernel.org, krzk+dt@kernel.org,
        alsa-devel@alsa-project.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, bryan.odonoghue@linaro.org
Subject: [PATCH v5 0/2] Fix apq8016 compat string
Date:   Tue, 28 Jun 2022 13:04:33 +0100
Message-Id: <20220628120435.3044939-1-bryan.odonoghue@linaro.org>
X-Mailer: git-send-email 2.36.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

V5:
- Drops Fixes - Mark Brown
- Rebased on *   650516f1c1e0a - (asoc/for-next) Merge remote-tracking branch 'asoc/for-5.20' into asoc-next (2 hours ago)
  https://git.linaro.org/people/bryan.odonoghue/kernel.git/log/?h=8916-for-next
  
V4:
- Adds Bjorn's RB to first patch
- Adds missing people to To/Cc list

V3:
- Marks qcom,lpass-cpu-apq8016 as deprecated instead of removing - Bjorn

V2:
- Adds Reviewed-by: - Srini
- Adds Fixes - Srini

V1:
Reusing the apq8016 on msm8939 I found running checkpatch that the compat
string for the LPASS was throwing a warning.

This is easily fixed by alinging the YAML, DTS and driver to the documented
compat string

-			compatible = "qcom,lpass-cpu-apq8016";
+			compatible = "qcom,apq8016-lpass-cpu";

Bryan O'Donoghue (2):
  ASoC: qcom: lpass: Fix apq8016 compat string to match yaml
  arm64: dts: qcom: Fix apq8016 compat string to match yaml

 arch/arm64/boot/dts/qcom/msm8916.dtsi | 2 +-
 sound/soc/qcom/lpass-apq8016.c        | 1 +
 sound/soc/qcom/lpass-cpu.c            | 5 +++++
 3 files changed, 7 insertions(+), 1 deletion(-)

-- 
2.36.1

