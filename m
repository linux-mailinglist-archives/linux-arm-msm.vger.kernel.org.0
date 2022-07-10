Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7A02E56CDE2
	for <lists+linux-arm-msm@lfdr.de>; Sun, 10 Jul 2022 10:41:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229598AbiGJIlm (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 10 Jul 2022 04:41:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53374 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229607AbiGJIlk (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 10 Jul 2022 04:41:40 -0400
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com [IPv6:2a00:1450:4864:20::132])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0864318E20
        for <linux-arm-msm@vger.kernel.org>; Sun, 10 Jul 2022 01:41:40 -0700 (PDT)
Received: by mail-lf1-x132.google.com with SMTP id d12so4208640lfq.12
        for <linux-arm-msm@vger.kernel.org>; Sun, 10 Jul 2022 01:41:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=+kCksQy9hyBEb/dg/WClV26pEAyqH6K/Nlp6/fq7zx8=;
        b=elgtiyv/9hE7IpbOInVZGopuJata+DVamrZaV4WwV5m/3OMI4591SMBpZl0melXv7p
         uJArSfXi3yBJHRfX1oH2Cki5ExfLQWFgV3UfA9vrA9d130TxWxPz8TzU2gAebjQQUAO2
         mHY0U9BuPuIBD6Br/qgSoJuqlJRVIJdFUv/dX7WvvXze0uCpA4VmjWexVnWTsHkAXI4t
         3mUjGLS1qoIz8zlTFMjdVOAOnwst25td71oN9hlDmBdCpli4kVGp4DxqyzJo0eeJQVL3
         t8W8EDuHV5uRGPJEfNzuu20a+QwJ2MjOvq8zSyJZxnDOr9WuSy0sktkZ5SEE/j7XODeQ
         6iOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=+kCksQy9hyBEb/dg/WClV26pEAyqH6K/Nlp6/fq7zx8=;
        b=63+1z6IxTQaPJ4S54SpiIs6fuVO3l98/qQgmQ4CVvSi+zCah27NPaW4AOcLxnyLpNl
         2wOi+nKUA+tzVjoWK820E81YJryJfFdAAZsJNR5hg+bRb4X8te7y2JrJcBaMaWQauH2/
         rlb1VZ30p4+BaTU1vOhTqlUQ9B45lzU3SMWq4KEN/uCwiY0WASfIN/DfGAgB9oZAf3Hb
         MC4SzY0/XZd0g0jwq80ZX4XJ6mOpbyJCIKs+YyU8IxJmT9qhtn5GPcHpQZ1ypIG5zXGr
         O1/+fhxXj6BxkBU8tDOIiJswbywL+qLPxz/E0+SQiZZ/5JZkZwkbFE0Af0tNWdfqwtBF
         HOkA==
X-Gm-Message-State: AJIora/ZOwN4gi1Hlnd0doqY+E4cg0Vp0iO2QeXAGZyf6UAg19HPpPyb
        lBeWtOIiUl32ZaI2Tk7ZkEbiZw==
X-Google-Smtp-Source: AGRyM1vU2rzSmqfURkkjagDekzoolslMTCa8n25I0AuNnvrIxF3WNQ+iDXwESlEy+d8b7rttpHxTEQ==
X-Received: by 2002:a05:6512:3408:b0:481:7a4:1919 with SMTP id i8-20020a056512340800b0048107a41919mr8513714lfr.296.1657442498318;
        Sun, 10 Jul 2022 01:41:38 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id i21-20020a2ea235000000b0025d4addbad4sm912536ljm.91.2022.07.10.01.41.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 10 Jul 2022 01:41:37 -0700 (PDT)
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
        freedreno@lists.freedesktop.org,
        Kuogee Hsieh <quic_khsieh@quicinc.com>
Subject: [PATCH v2 3/9] arm64: dts: qcom: sc7280: split register block for DP controller
Date:   Sun, 10 Jul 2022 11:41:27 +0300
Message-Id: <20220710084133.30976-4-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220710084133.30976-1-dmitry.baryshkov@linaro.org>
References: <20220710084133.30976-1-dmitry.baryshkov@linaro.org>
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

Follow the schema for the DP controller and declare 5 register regions
instead of using a single region for all the registers. Note, this
extends the dts by adding p1 region to the DP node (to be used for DP
MST).

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 arch/arm64/boot/dts/qcom/sc7280.dtsi | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/sc7280.dtsi b/arch/arm64/boot/dts/qcom/sc7280.dtsi
index a3def1022ea2..e54c2000b098 100644
--- a/arch/arm64/boot/dts/qcom/sc7280.dtsi
+++ b/arch/arm64/boot/dts/qcom/sc7280.dtsi
@@ -3810,7 +3810,11 @@ mdss_edp_phy: phy@aec2a00 {
 			mdss_dp: displayport-controller@ae90000 {
 				compatible = "qcom,sc7280-dp";
 
-				reg = <0 0x0ae90000 0 0x1400>;
+				reg = <0 0xae90000 0 0x200>,
+				      <0 0xae90200 0 0x200>,
+				      <0 0xae90400 0 0xc00>,
+				      <0 0xae91000 0 0x400>,
+				      <0 0xae91400 0 0x400>;
 
 				interrupt-parent = <&mdss>;
 				interrupts = <12>;
-- 
2.35.1

