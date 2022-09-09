Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A72B25B3D0F
	for <lists+linux-arm-msm@lfdr.de>; Fri,  9 Sep 2022 18:34:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231805AbiIIQeW (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 9 Sep 2022 12:34:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34900 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231810AbiIIQeV (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 9 Sep 2022 12:34:21 -0400
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com [IPv6:2a00:1450:4864:20::32e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8DC7A9E104
        for <linux-arm-msm@vger.kernel.org>; Fri,  9 Sep 2022 09:34:20 -0700 (PDT)
Received: by mail-wm1-x32e.google.com with SMTP id h1so1827431wmd.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 09 Sep 2022 09:34:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date;
        bh=uVW2jiD31C988RMPTQ1P3zK85Jo5uekRaWjAtsdVBbE=;
        b=YWllJyDOo8QQxSdyuL5vmOOvqpEilZz/uPE8GCXyCoJMVdH9q3bayMkSgicYokxx4/
         SMj0WfzlsypS6+X44G7M8s7/Kt2zQPboRfmf0u7345z6eJ7yIERfee5qoWjbhnvEOclo
         Z2+RcRcUbhn3sOxBrtLOTkXLZvBWHz1P12duhBo3NfobhELYLDeLh8wb2A5CQdohE7ul
         dOHmIw+Yw18bjqREG6oDCELm7ENjzIASaMnhTbn1We9qRFDuHTUYwktJb8k58lRBrAIt
         JwTbumTLmamfcKpNif4ByEQB28rBV5V2aypn2PRcRpbkgghNOjeMRKDH5O4c755KqKxG
         Eqxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date;
        bh=uVW2jiD31C988RMPTQ1P3zK85Jo5uekRaWjAtsdVBbE=;
        b=4XyWUMnyICTl6EqshwMNON89bKyQOIwrCIc7i0mXCbGCV9i5UwBXoZOH0jJGKzQ67z
         4yUoNeVQl5fMTcLNClXFBH8gj13DG+qsqNEIOxb/qxJCwve8qxnATwylmZLSf96rgntT
         h7JErE9p2ShmaBfCMbhqCYxQCsmb5F7N5W3VRhAnTKf1hceEquEo7w30dcT42NHAq9QA
         OMojwO8oOSPx/m37rWM/xObaknkecmF2AGkACiGCPGCJW7VsPiVSsL2OB7hFUOkPLKWT
         3pnGfyDgTIfHIX2ApGZvD38mEdsWK2fLy8PPHONL0jbhd3wARXoTbiQruXLR6yxYFSro
         lCQg==
X-Gm-Message-State: ACgBeo2O2Lmw6QFY5clpfrA7kKQYXDy0m9lW/oB3gi7mUUH3fo8u5q6/
        VexMSkD5Lg7zhUCzN5QaptUkM5cPW3xFwQ==
X-Google-Smtp-Source: AA6agR4a2OFnWQnq7IGakBhGxO39o4LL7e7ag10YHggU4kdZ3jxBuBYgXmMoWyCycaIl6Jk779xkXg==
X-Received: by 2002:a05:600c:1e88:b0:3a6:2ca3:f7f2 with SMTP id be8-20020a05600c1e8800b003a62ca3f7f2mr6284798wmb.7.1662741259161;
        Fri, 09 Sep 2022 09:34:19 -0700 (PDT)
Received: from sagittarius-a.chello.ie (188-141-3-169.dynamic.upc.ie. [188.141.3.169])
        by smtp.gmail.com with ESMTPSA id c5-20020a5d63c5000000b0022a2e4b2b25sm816849wrw.113.2022.09.09.09.34.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Sep 2022 09:34:18 -0700 (PDT)
From:   Bryan O'Donoghue <bryan.odonoghue@linaro.org>
To:     agross@kernel.org, andersson@kernel.org, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org
Cc:     bryan.odonoghue@linaro.org
Subject: [PATCH 0/1] Update apq8016 lpass-cpu compat string 
Date:   Fri,  9 Sep 2022 17:34:15 +0100
Message-Id: <20220909163416.1021551-1-bryan.odonoghue@linaro.org>
X-Mailer: git-send-email 2.37.3
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

Per discussion with Krzysztof on this yesterday:
https://lore.kernel.org/linux-arm-msm/20220908105720.857294-1-bryan.odonoghue@linaro.org/T/#mb16386b0b6d45de6a7d7e01733d5b6a7d0b85c25

Mark the old lpass compat string as deprecated in yaml and leave a comment
in the commit log to explain new SoC additions should use the corrected
version.

Bryan O'Donoghue (1):
  ASoC: dt-bindings: Mark old binding qcom,cpu-lpass-apq8016 as
    deprecated

 .../devicetree/bindings/sound/qcom,lpass-cpu.yaml    | 12 +++++++-----
 1 file changed, 7 insertions(+), 5 deletions(-)

-- 
2.37.3

