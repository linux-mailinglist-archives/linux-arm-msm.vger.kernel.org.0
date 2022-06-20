Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4886755115F
	for <lists+linux-arm-msm@lfdr.de>; Mon, 20 Jun 2022 09:20:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239288AbiFTHTo (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 20 Jun 2022 03:19:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57108 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239105AbiFTHTn (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 20 Jun 2022 03:19:43 -0400
Received: from mail-lj1-x234.google.com (mail-lj1-x234.google.com [IPv6:2a00:1450:4864:20::234])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 16405DE93
        for <linux-arm-msm@vger.kernel.org>; Mon, 20 Jun 2022 00:19:40 -0700 (PDT)
Received: by mail-lj1-x234.google.com with SMTP id o23so3738013ljg.13
        for <linux-arm-msm@vger.kernel.org>; Mon, 20 Jun 2022 00:19:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=YvU0ddWaU62AtxoUqWfJkMau5khtA7avAQgl9IitmeM=;
        b=V7ju99QAPoAhuAL82T9CPxLITm4V+42j7SpgTiOWYp8izW0XLxiDl//zrDHur/rPgb
         McNMzjrdRH0gZLPp7nRLUEdW2MKK4ecnwPcnf2dRpTdZcoJbvtSCpqGKueJ0AvmFUOuK
         NahVdP9AWt7BGFaI2skSncPZwz/kvxaOr63TMp0ffeCgx3rWtNsJDu8n8o2fKvqfEjrD
         NSu1+bCka+idH6/ViNI6DyI6qlNP2AhYNFePVaccqFrCltXJwgS2V8aQlCv0g/wmGAha
         t2sa7m6Yln8lLmgmP/0QjuOdF56KGp7rl2K9EYzKlzc6PF7kiHQMMANaGG6u0Iuytc3/
         R32w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=YvU0ddWaU62AtxoUqWfJkMau5khtA7avAQgl9IitmeM=;
        b=rUw0rB8oL20MP+cKvtgLPapqCvnfGYFinGjuRunvuMJE2+Bg7cCoJSJMFUNm3su/Wn
         ZE50Izq2bVCQ8dy3H4WLgf6Q8niLUy+cNBKF39tzV56/UNxRA+0YQj43bAEDvwbGTLoT
         RbbPuRf5m2ABL6QAZrA0IPXoRjfw664pB6sjSAWhN3w1YkmAhzxlGtjQ63xY2a0Ksb3F
         +HxoG5/rzY3pk54EH8E4bw1rB66sWyY7wKKnl1x7/aivKmxG7ZJ68v77Qmh9dZ6FEH1x
         0CIkbgPW4+h7RCN1rI9T6/jcJFIwwOqlGXMu1BzrON0Iyp5Knr8lEHVd0RQV8Iwxh7s1
         hP+A==
X-Gm-Message-State: AJIora9xGRS7tLsj2lG/4LGboRcd2s5wmpHB4iJY8W5J8bRVTxl/s9Ph
        YApuzbXljT1pmwOiZwifX6eJsDrUIuLExgsv
X-Google-Smtp-Source: AGRyM1sQ/4tJWW2bG8eJZ014QcyTuZS7YIvViaYCmDqdCF+UTHRa34FP9fDCytUi2uxosXGxfmZL1w==
X-Received: by 2002:a2e:309:0:b0:25a:723c:5740 with SMTP id 9-20020a2e0309000000b0025a723c5740mr739512ljd.110.1655709578413;
        Mon, 20 Jun 2022 00:19:38 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id t16-20020a195f10000000b004795bcfe953sm1649775lfb.214.2022.06.20.00.19.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Jun 2022 00:19:37 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org
Subject: [PATCH 0/4] arm64: dts: qcom: msm8996: add missing clock sources
Date:   Mon, 20 Jun 2022 10:19:32 +0300
Message-Id: <20220620071936.1558906-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
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

Add missing clock sources to the RPM and global clock controllers.

Dmitry Baryshkov (4):
  dt-bindings: clock: qcom,gcc-msm8996: add more GCC clock sources
  arm64: dts: qcom: msm8996: correct #clock-cells for QMP PHY nodes
  arm64: dts: qcom: msm8996: add GCC's optional clock sources
  arm64: dts: qcom: msm8996: add xo clock source to rpmcc

 .../bindings/clock/qcom,gcc-msm8996.yaml      | 16 ++++++++++++
 arch/arm64/boot/dts/qcom/msm8996.dtsi         | 26 ++++++++++++++++---
 2 files changed, 38 insertions(+), 4 deletions(-)

-- 
2.35.1

