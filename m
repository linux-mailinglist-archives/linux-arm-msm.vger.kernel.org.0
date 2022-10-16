Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 83103600298
	for <lists+linux-arm-msm@lfdr.de>; Sun, 16 Oct 2022 20:04:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229579AbiJPSEL (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 16 Oct 2022 14:04:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42112 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229464AbiJPSEK (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 16 Oct 2022 14:04:10 -0400
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com [IPv6:2a00:1450:4864:20::42a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 70C0031344
        for <linux-arm-msm@vger.kernel.org>; Sun, 16 Oct 2022 11:04:08 -0700 (PDT)
Received: by mail-wr1-x42a.google.com with SMTP id a10so15091400wrm.12
        for <linux-arm-msm@vger.kernel.org>; Sun, 16 Oct 2022 11:04:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=5YevSmK/bM18svAn+LtiUPizVZDtrgjJrFnCkrq9vEk=;
        b=L13UmQrMcAK4nttouV+ufuAkFSQWnM2DJKdlZMdRTO+I3uK7m7t3ibLPGaBkNUb51z
         720nrzts2Zep2iCKnq/rsq28Q4bdwxGlNnov9KYrMc9dGi62obGsujH++vlAuJW0mNto
         6jlPKVfDTam3SLOPRCrg5pGP505UWDSYYsvd4Pfxi9RqB3iHvoPi0n1avyA3qSV2Yf7l
         jCbnfXcJn4xEpLga6BJu+Jmt6yx/nFVyjZdFTGS6eszej51k/otX1iMJj4Khn9gfkbDf
         j4AyUbHVy/sVMZxzBgDkY3whtrEx5rmOzkA7IyzksEitAw0pQUrgclv5cei1WXKrs6HB
         rFeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5YevSmK/bM18svAn+LtiUPizVZDtrgjJrFnCkrq9vEk=;
        b=2T9gon1bw9rNqePCLIIKknXHqoBlQ6UYsXqdIl+Ao3SrX/5Z5Ku7Gii+g/iaPn8WXt
         AthZbvP9n4zKfGqYOORulqlNcYNPh3CfDT7vsNuVo4XPtFIFAGtoKJiMwsTO1frIrmlC
         TCbWcu1G8EkF/dGB00ODjWGkP+CdWQEwbWIFvbvy+7q371UUjPbO4a3PuK2Kn8RZrPZO
         Yb9I5v6gJPKZztfbaIJk4QpzpBBccoGijwMERBoR1vT3ZBCV7IcT3pboD/HGHUnMzwEO
         V5rTb2Rg4sKMV9u688M3Vf6ki3VuczoQkzzU59QKpfg8giGXzh6tVskZk8ELm5JorJjx
         EU4A==
X-Gm-Message-State: ACrzQf0nQQ2CkK8ZrMARL8L1YNhZKBcH7chebnuVKZUqm24e3ME7PsuN
        tKMjHSbRuNNC9fViKQGoJS21JA==
X-Google-Smtp-Source: AMsMyM7Ww1bI1Ew5ytG4r0xPt3LPIh8MsKm890jj5t2xdim4zaxFBHiYTnHGiUJRby5k+nuGW01OsA==
X-Received: by 2002:a05:6000:184d:b0:22f:4ef4:47a7 with SMTP id c13-20020a056000184d00b0022f4ef447a7mr4080891wri.563.1665943445627;
        Sun, 16 Oct 2022 11:04:05 -0700 (PDT)
Received: from localhost.localdomain (cpc76482-cwma10-2-0-cust629.7-3.cable.virginm.net. [86.14.22.118])
        by smtp.gmail.com with ESMTPSA id k5-20020a5d6d45000000b0022e57e66824sm7844181wri.99.2022.10.16.11.04.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 16 Oct 2022 11:04:05 -0700 (PDT)
From:   Caleb Connolly <caleb.connolly@linaro.org>
To:     caleb.connolly@linaro.org
Cc:     Luca Weiss <luca@z3ntu.xyz>, Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        devicetree@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Rob Herring <robh+dt@kernel.org>
Subject: [PATCH 0/5] arm64: dts: qcom: add and enable the pmi8998 RRADC
Date:   Sun, 16 Oct 2022 19:03:24 +0100
Message-Id: <20221016180330.1912214-1-caleb.connolly@linaro.org>
X-Mailer: git-send-email 2.38.0
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

This contains patches 6 through 10 of the series adding a driver
for the RRADC
https://lore.kernel.org/linux-arm-msm/20220429220904.137297-1-caleb.connolly@linaro.org/

The driver and DT bindings have been in mainline for a while.

This introduces a new dtbs_check warning which is fixed in
https://lore.kernel.org/linux-arm-msm/20221016175757.1911016-1-caleb.connolly@linaro.org/
and depends on Luca's series:
https://lore.kernel.org/linux-arm-msm/20220925211744.133947-2-luca@z3ntu.xyz/

  -Caleb

Caleb Connolly (4):
  arm64: dts: qcom: pmi8998: add rradc node
  arm64: dts: qcom: sdm845-oneplus: enable rradc
  arm64: dts: qcom: sdm845-db845c: enable rradc
  arm64: dts: qcom: sdm845-xiaomi-beryllium: enable rradc

Jami Kettunen (1):
  arm64: dts: qcom: msm8998-oneplus-common: enable RRADC

 arch/arm64/boot/dts/qcom/msm8998-oneplus-common.dtsi | 4 ++++
 arch/arm64/boot/dts/qcom/pmi8998.dtsi                | 8 ++++++++
 arch/arm64/boot/dts/qcom/sdm845-db845c.dts           | 4 ++++
 arch/arm64/boot/dts/qcom/sdm845-oneplus-common.dtsi  | 4 ++++
 arch/arm64/boot/dts/qcom/sdm845-xiaomi-beryllium.dts | 4 ++++
 5 files changed, 24 insertions(+)

-- 
2.38.0

