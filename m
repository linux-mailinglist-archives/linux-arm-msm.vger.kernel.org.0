Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DAB227194DD
	for <lists+linux-arm-msm@lfdr.de>; Thu,  1 Jun 2023 09:59:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231997AbjFAH70 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 1 Jun 2023 03:59:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52656 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231830AbjFAH7J (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 1 Jun 2023 03:59:09 -0400
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com [IPv6:2a00:1450:4864:20::134])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 09FBF99
        for <linux-arm-msm@vger.kernel.org>; Thu,  1 Jun 2023 00:56:55 -0700 (PDT)
Received: by mail-lf1-x134.google.com with SMTP id 2adb3069b0e04-4f4453b607eso38328e87.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 01 Jun 2023 00:56:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1685606213; x=1688198213;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Lgwi6HztlYhvnLCf2RcfurAYM0c/zwpTSQRAtCKs2iM=;
        b=SX+LiZsmfwbsmt+1cyEtVTKwRGT0S+flQ1AQduz8QL2bt2odWpdeltY/3XFccHHQ8G
         itLNiACFczj/+SoOBzKM3rXsfI7ShG2VkXWOzur49TaQPfLYmAWD+4CxoK/x839CMsS5
         mDYxtrohBo0LqIgrWx3rgLwcrQbeD0LrGAMVVCZc0cBwaYhnSaL73HREKTQ3biYx4lJ2
         OWBFCs8lLBC4n1panc0sa3y9qijJwFbEsVpDo+Z4QJyeoszfoECZgPIuj2rZFDGJm0MB
         kQoapx+cQ/X9YovdJ0c18duklxZUfMuZluM5FjybHwNmFkKZoc3gK+EdLr7GJlS1lT2M
         Oj+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685606213; x=1688198213;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Lgwi6HztlYhvnLCf2RcfurAYM0c/zwpTSQRAtCKs2iM=;
        b=bBI9Fo16VAtM5qB7X4k9Z200w7rSNOu0S1fXN9h5bHFAG7mE8JaJ+BpF5gFpEj3m4e
         F2vRSb8Rq8hUeVF4UaADe9vmTfQ+R2GP9/W1nAFhm24PpKFFhweAOFFEbqTfhNZ6S4ck
         j4IpTTgma2L8vBlqTvr2/jVFzqfTloo1hviqscKiz9zEQ8ubddx1Phu5eTOh3CqtBVBy
         Mw+im0YtUvOI5FN7dgWC2UaZd3W705jjcpSynuluz26HBYdl69QPO54lq4aeF8y50F+A
         sklwglzAvACimB32IP4AkBPj6DZXb55+yZRAaF8R/PmeM+TShTdRqPtdnvmt7nFxAc+O
         ZSiA==
X-Gm-Message-State: AC+VfDxhSb+P1IqQnUEsZrzUhn+ejwQ6c3uwip8y+wNuFtxM/gEoMuHT
        Z6zwfzEJxPaSQ9nhpvoLWPKUog==
X-Google-Smtp-Source: ACHHUZ6P0apwwxPg8rJAQ+joJuUz3Lc4vs/BdcCsfO/2S5Wh9i2WnDVCjxftRLMx0Rw9+Q+M6TUOVg==
X-Received: by 2002:a19:f712:0:b0:4f3:af9f:3d14 with SMTP id z18-20020a19f712000000b004f3af9f3d14mr1783145lfe.5.1685606213252;
        Thu, 01 Jun 2023 00:56:53 -0700 (PDT)
Received: from localhost.localdomain (88-112-131-206.elisa-laajakaista.fi. [88.112.131.206])
        by smtp.gmail.com with ESMTPSA id q28-20020ac246fc000000b004f60a2429d4sm27160lfo.78.2023.06.01.00.56.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Jun 2023 00:56:52 -0700 (PDT)
From:   Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
To:     Bjorn Andersson <quic_bjorande@quicinc.com>,
        Arnd Bergmann <arnd@arndb.de>
Cc:     Will Deacon <will@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org
Subject: [PATCH v2 0/5] arm64: defconfig: build some essential Qualcomm platform drivers
Date:   Thu,  1 Jun 2023 10:56:45 +0300
Message-Id: <20230601075650.1437184-1-vladimir.zapolskiy@linaro.org>
X-Mailer: git-send-email 2.33.0
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

It's discovered that a kernel image for Qualcomm QCM2290/SM6115 built
from a defconfig misses a few important platform device drivers, the
changeset enables them.

Changes from v1 to v2:
- due to review comments changed building QCM2290 interconnect driver to
  a kernel module and provided a better description in the commit message,
- added tags given by Konrad.

Konrad Dybcio (1):
  arm64: defconfig: Build SM6115 display and GPU clock controller drivers

Vladimir Zapolskiy (4):
  arm64: defconfig: Build MSM power manager driver
  arm64: defconfig: Build Global Clock Controller driver for QCM2290
  arm64: defconfig: Build interconnect driver for QCM2290
  arm64: defconfig: Build display clock controller driver for QCM2290

 arch/arm64/configs/defconfig | 6 ++++++
 1 file changed, 6 insertions(+)

-- 
2.33.0

