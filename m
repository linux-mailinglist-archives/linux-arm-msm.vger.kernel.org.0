Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 27DF75749F8
	for <lists+linux-arm-msm@lfdr.de>; Thu, 14 Jul 2022 12:03:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237816AbiGNKD5 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 14 Jul 2022 06:03:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44042 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234085AbiGNKD4 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 14 Jul 2022 06:03:56 -0400
Received: from mail-lj1-x230.google.com (mail-lj1-x230.google.com [IPv6:2a00:1450:4864:20::230])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 80B08C3C
        for <linux-arm-msm@vger.kernel.org>; Thu, 14 Jul 2022 03:03:54 -0700 (PDT)
Received: by mail-lj1-x230.google.com with SMTP id x10so1101913ljj.11
        for <linux-arm-msm@vger.kernel.org>; Thu, 14 Jul 2022 03:03:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=N8ABWZUPcCCucQG+UKNQYiG1U5/O0BpXZdBZ0xGUW7w=;
        b=LLd5RM9DM3b2SwePhXMoNB36/BcC0Mvms1Fu9K61/lEMHpf/lY+Q+VJNHGtqgam/F1
         CuZAefLZnkXZCLI4xZMzDGqdaAhgodBrmr1BETJ3QXUzC8eR5KqAA19OJ+YKbmk/Hdva
         m0sMeG+kAdstp/r2W/YUqJOUSFgIunjsh53qiMrNviMRMNbqQVbfNWAyeHyyZQxhixDE
         +Jhxz2+FMHHlQgRANeEjV86XEM494zJogB3fn8iVQUI8uos5fVEg37oRyJGhBeZVxDyI
         V8cUGfZb35qDL33foDXzHGCIG66/aSr8U+9Xp3fbMh43p3KNjiciaTXIXEuSK3lU4INM
         T4lA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=N8ABWZUPcCCucQG+UKNQYiG1U5/O0BpXZdBZ0xGUW7w=;
        b=cdmTABrCc5yJ2CoI4cF+TqBD0Mx3gbSQbSNBVhWTXMgPBlKgjLHDp7iaL49mb5khpo
         ey463Zpq3FMMGGQ3suteFOkGXpV0WJvl0P8Tmzh21HJoHapQi3a7Y6eTL9kKXs+zDrTE
         YqLmwwiNYvZBySW3fi1SR+UrFpKMs0vNhhEN4EP6f7WO7k6dm00pNQP690vuAxOL+Eg6
         IzhWTulBNBqSOghcx8lf9OOetIfFlePxY9vw4M8xvBJO8bO0poB2bHZVl2Ioltci9yBv
         E734Mi/OyEzpRHHeP98pM1YB+qLMnTiaVeU7EWymGNnocrJ6v75KXPSvpgUHNbWZ352O
         Up+Q==
X-Gm-Message-State: AJIora+b5w/UZGS6eVmDZ+1oJFAKUoo+2KoQeuA6ZKbHrljx8bt36qS8
        b2yfA6XYdASQC5ebaId0IXFd1w==
X-Google-Smtp-Source: AGRyM1tpxZqvRmYWqaIQxqarDQKiqS5dUyFS5PQuL/A5N4FyUAxFit9g/ShVtInE70ch790Wb3aXbA==
X-Received: by 2002:a05:651c:1207:b0:25d:4eba:e247 with SMTP id i7-20020a05651c120700b0025d4ebae247mr4026584lja.100.1657793032827;
        Thu, 14 Jul 2022 03:03:52 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id c9-20020a056512074900b00489c92779f8sm273355lfs.184.2022.07.14.03.03.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 Jul 2022 03:03:52 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Taniya Das <quic_tdas@quicinc.com>
Cc:     linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org,
        Yassine Oudjana <yassine.oudjana@gmail.com>
Subject: [PATCH 0/6] clk: qcom: cpu-8996: additional cleanup for the driver
Date:   Thu, 14 Jul 2022 13:03:45 +0300
Message-Id: <20220714100351.1834711-1-dmitry.baryshkov@linaro.org>
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

This patch series depends on patches 1-5 from [1].

Path 1 is slightly fixed version of patch 6 from the mentioned
patch series (fixed to use parent_hws where applicable). The rest is
minor cleanup of the driver.

[1] https://lore.kernel.org/linux-arm-msm/20220621160621.24415-1-y.oudjana@protonmail.com/


Dmitry Baryshkov (5):
  clk: qcom: cpu-8996: switch to devm_clk_notifier_register
  clk: qcom: cpu-8996: declare ACD clocks
  clk: qcom: cpu-8996: move ACD logic to
    clk_cpu_8996_pmux_determine_rate
  clk: qcom: cpu-8996: don't store parents in clk_cpu_8996_pmux
  clk: qcom: cpu-8996: use constant mask for pmux

Yassine Oudjana (1):
  clk: qcom: msm8996-cpu: Use parent_data/_hws for all clocks

 drivers/clk/qcom/clk-cpu-8996.c | 191 +++++++++++++++++---------------
 1 file changed, 100 insertions(+), 91 deletions(-)


base-commit: ca48adcc40b09d7f26a7754d4d54cfc4bd611f38
prerequisite-patch-id: ff67ff7bea1aef8e367a2589c46cf2c9ebb48664
prerequisite-patch-id: 1fdf02d8161689f3e571816d73ec94b115f51c34
prerequisite-patch-id: 837945fbb40427dac2e95a58b7660a3cf26d7d53
prerequisite-patch-id: df10945929f6f558c1363a23e2993d748a40236f
prerequisite-patch-id: a657a27256ef4be0cb932cb0ca7b3e4768e466f9
-- 
2.35.1

