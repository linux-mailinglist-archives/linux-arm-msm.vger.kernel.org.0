Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4B93D506B4B
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 Apr 2022 13:42:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242717AbiDSLob (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 19 Apr 2022 07:44:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46382 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1345274AbiDSLmW (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 19 Apr 2022 07:42:22 -0400
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com [IPv6:2a00:1450:4864:20::433])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A74C938790
        for <linux-arm-msm@vger.kernel.org>; Tue, 19 Apr 2022 04:37:38 -0700 (PDT)
Received: by mail-wr1-x433.google.com with SMTP id g18so21996975wrb.10
        for <linux-arm-msm@vger.kernel.org>; Tue, 19 Apr 2022 04:37:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=YsXpwpMFkEWbaX+P0166EyFAvuhLI4rTochn4rlRCDQ=;
        b=GVnV72rpuwbtvHVuF0gB/cBwbTgGtRJQQFXx6StJTu+EKJFeYLIvIi93poEHUmX7wr
         G3fBn6lI5yFJmUrN2KLeIi817c8mpInsYOeqKeHD9tC4s9nkmxRtcwBH82LoiE1T6k96
         rf8fsXQasbLX8K6o2abfi2g5KhdehooBUlk1yQDHshSdRqaG9c0fSRqJGIqQhV3NCU9z
         6+XeQUSPFWk4qitsfRFHtIZasFpJmv671mUVjsc8XXC2mp8oYSDCXYuUXc6EGF5KGOOB
         thP2Dib756G1Wos40NUYqZI+8XkyGntQsWl0TM/MLoT0fB5A61p79VgyqaqdDOGr8I8w
         sRGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=YsXpwpMFkEWbaX+P0166EyFAvuhLI4rTochn4rlRCDQ=;
        b=qAgKl6/Qa5/hM8ktgBcbMtePjhskC4Tl+PhbuBywPTw2/sLPUxqTnuca5pVHfKVc5y
         HSM/8jLssDdYCGLPBbFoHfIKVNJVqiStYvn6aTeyYuNLPS0PsO2XpGUGGVTJPbfzFJ6Q
         19lCWg7PfaflU4NJnfL+LMxVFa3h2h85nSY32GUdCVHP0J/Js49cU0ywjFYieMR0vY9v
         QMVNrUTLLx0IO5NI35X4Qj/tx0T0eVH4hFAzVdTbtGWDmRq/ibU+PSY6MA20515TOkO1
         D25rM4a/spQvXc7ZUVbeMYAPZPqsSLjgQVlicLbJM9dZTcqzR57e4QmFK2WrFFdTurRS
         9Abg==
X-Gm-Message-State: AOAM533D97Ok0uGF74LRrUI91/1CGUsKwWN0OPgUqdc8cY+uxh8z52db
        nhuLmWaRWEVebK2pxT0YnwB4Nw==
X-Google-Smtp-Source: ABdhPJyOhd+4jL64KSjXkQiq4sKLkPooVSLEc7eV977FyvIoEP8FG8Mu53ptJcYVRsu1FFza2YQ//w==
X-Received: by 2002:a05:6000:794:b0:20a:93f8:5aa4 with SMTP id bu20-20020a056000079400b0020a93f85aa4mr7612741wrb.540.1650368256779;
        Tue, 19 Apr 2022 04:37:36 -0700 (PDT)
Received: from sagittarius-a.chello.ie (188-141-3-169.dynamic.upc.ie. [188.141.3.169])
        by smtp.gmail.com with ESMTPSA id bk1-20020a0560001d8100b002061d6bdfd0sm14202120wrb.63.2022.04.19.04.37.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Apr 2022 04:37:36 -0700 (PDT)
From:   Bryan O'Donoghue <bryan.odonoghue@linaro.org>
To:     srinivas.kandagatla@linaro.org, robh+dt@kernel.org,
        krzk+dt@kernel.org
Cc:     alsa-devel@alsa-project.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, bryan.odonoghue@linaro.org
Subject: [PATCH v2 0/2] Fix apq8016 compat string
Date:   Tue, 19 Apr 2022 12:37:32 +0100
Message-Id: <20220419113734.3138095-1-bryan.odonoghue@linaro.org>
X-Mailer: git-send-email 2.35.1
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
 sound/soc/qcom/lpass-apq8016.c        | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

-- 
2.35.1

