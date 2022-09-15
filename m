Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A61865B9EB8
	for <lists+linux-arm-msm@lfdr.de>; Thu, 15 Sep 2022 17:26:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230030AbiIOP0e (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 15 Sep 2022 11:26:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58246 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229931AbiIOP0e (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 15 Sep 2022 11:26:34 -0400
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com [IPv6:2a00:1450:4864:20::12a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E4C1E422F9
        for <linux-arm-msm@vger.kernel.org>; Thu, 15 Sep 2022 08:26:32 -0700 (PDT)
Received: by mail-lf1-x12a.google.com with SMTP id u18so30940228lfo.8
        for <linux-arm-msm@vger.kernel.org>; Thu, 15 Sep 2022 08:26:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date;
        bh=NTZcUovtCDdljr2spczeaDTN8WbbFr8UHBMo+ZAGqqg=;
        b=d4hpKrpWtDHuutgapuiTV80C58Cy5UNEW9bp7HnE0S7S9P7RgFPxhzZJgAv2M7V/ji
         KeBLe6gvQJV7ORg8JXsqlZKbcU2EsfqllaTx4senjldIhp7NW9Cz0ku2yKN1SonEdzwS
         JMvcfBXMbvDHvGSe4RYjdYkg9SByF88ZlsYMXarHsFHwee3CJr/oBlow4V3iAH149Gz/
         W0OG6HsdhsXFjkR9XpPqho4q30IyaX8dVLJoMJy6tOhKpwfp4jDGcxC7oToVFyGfK6Ml
         Y7AwMd015W9agI8zFJrC3CHPYMCVrbX1pnfpSXDqu5F5QAom1wZpd4trQrPXHKiPAAeu
         hMIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date;
        bh=NTZcUovtCDdljr2spczeaDTN8WbbFr8UHBMo+ZAGqqg=;
        b=6XZrbt2dF6WiGemJ9wgiuhrL2x4aY2eKKHToVQtReHvdrZauYEkzzEuV1PgfyX5zsX
         cFHWN4LRQam7SA8al1szknjksDnT7jfpFXJaXPMYU1lvcpmAbcRC8wj3tCU8plTvH9rg
         nWISslsWmgTwrP7Eb5x+lGnaKY8RIu2gIF3hOZhjpMkx9Z5eUbdZX21fC2xIcOC55yke
         A9KEIf9hdEnU45NnZH2pMyrLP1OXYyi40vVUKaUeKMlIX/tWa7rqLQSWmo74cAQYG3/T
         mj+0tUH+T6VpLDdygQGIagg6Ps9zBvCVc6x89bXPglAw6tyEoN73qaQCSIj4jxwvwslt
         pwBA==
X-Gm-Message-State: ACrzQf03ruKEO+ISdxqG9L5vGOBARYQC0V6vEWHd1l0wIByGVe0pnW3N
        SritIB0ynwcgMOHACWZ5Jt0VVA==
X-Google-Smtp-Source: AMsMyM4lL1NH8uHnyDasRY+3Sw4cO0S7APiEvlWdmoBJ3nR4V1iGjC2sNIl5sWxi87aw9BDlDKc/0g==
X-Received: by 2002:a05:6512:2592:b0:49c:53de:7eb8 with SMTP id bf18-20020a056512259200b0049c53de7eb8mr131009lfb.401.1663255591259;
        Thu, 15 Sep 2022 08:26:31 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id a18-20020a056512201200b00494813c689dsm3012653lfb.219.2022.09.15.08.26.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Sep 2022 08:26:30 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org
Subject: [RFC PATCH 0/7] arm64: qcom: dts: correct firmware paths
Date:   Thu, 15 Sep 2022 18:26:23 +0300
Message-Id: <20220915152630.133528-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
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

This patchset corrects firmware paths for several Qualcomm-based devices
to include the SoC name. This is sent as an RFC to settle on the
firmware paths for Sony devices.

Dmitry Baryshkov (7):
  arm64: qcom: dts: c630: correct firmware paths
  arm64: qcom: dts: w737: correct firmware paths
  arm64: qcom: dts: miix-630: correct firmware paths
  arm64: qcom: dts: ifc6560: correct firmware paths
  arm64: qcom: dts: sagami: correct firmware paths
  arm64: qcom: dts: pdx223: correct firmware paths
  arm64: qcom: dts: nile: correct firmware paths

 arch/arm64/boot/dts/qcom/msm8998-lenovo-miix-630.dts   |  4 ++--
 arch/arm64/boot/dts/qcom/sda660-inforce-ifc6560.dts    |  2 +-
 arch/arm64/boot/dts/qcom/sdm630-sony-xperia-nile.dtsi  |  2 +-
 arch/arm64/boot/dts/qcom/sdm850-lenovo-yoga-c630.dts   |  8 ++++----
 arch/arm64/boot/dts/qcom/sdm850-samsung-w737.dts       | 10 +++++-----
 .../arm64/boot/dts/qcom/sm8350-sony-xperia-sagami.dtsi | 10 +++++-----
 .../boot/dts/qcom/sm8450-sony-xperia-nagara-pdx223.dts |  6 +++---
 7 files changed, 21 insertions(+), 21 deletions(-)

-- 
2.35.1

