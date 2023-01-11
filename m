Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 874C6666442
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Jan 2023 21:00:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235895AbjAKUAx (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 11 Jan 2023 15:00:53 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57516 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235290AbjAKUAI (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 11 Jan 2023 15:00:08 -0500
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com [IPv6:2a00:1450:4864:20::132])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 408664319F
        for <linux-arm-msm@vger.kernel.org>; Wed, 11 Jan 2023 11:57:57 -0800 (PST)
Received: by mail-lf1-x132.google.com with SMTP id g13so25195486lfv.7
        for <linux-arm-msm@vger.kernel.org>; Wed, 11 Jan 2023 11:57:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Bv2F71LxOWpxmjVGxEs6OM8T5rI6hsK3n1+ljlzRLro=;
        b=yZNnPAOr21AwlS4drbZdIObzFItqVRkZgyPdym1oxLIGpL+f+gR16gp4BfDcixowxe
         UKXnzZKMbQBUcALVoHO6Kydbd/vNTOx3IDg38WplB2FcT4cv2AANHIinIqi3WE3jmRBg
         tWQ5oYphRhUyDNkWT+O0NcEpZLL0I/zykFC1MLBATDM7l9bkNkqzc1gHhtiBvPznO31b
         iy/ohTRSFBNlNIKSloBEXcDzO+TSev3xXdi8svQBpHrAC9x0o4zSwFEeYUl4tHh2Tc4s
         OxuRszhiEHKJ6slhTme6YuVpCps8nrU42alZkGB9jc4lXI/Sb8/DEnWWu34RrOSrYSyT
         +1mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Bv2F71LxOWpxmjVGxEs6OM8T5rI6hsK3n1+ljlzRLro=;
        b=QypgjUyIN5VhSMtIa5QpePZgA4G5/6HswYPBOXQj1B9QGvlkEMnO2j07UvR3hExaIK
         AjTq3KYyysEe96l9wr7n4OapXaspGu8G6YjAJoGnhjO1BQjlNprP35PRdqeGt9kYHm7K
         LTYlLZFj0TMecInb4Yco2hYdmlaYeYXWfHY1iBNHgmxr8AwggsmPz5ru4py9iCPhGwkz
         8kqgaoPxsjwhv9CccNV0+dTdWTKIvvd3/xa5LQJ3hA0o8nmJPMZKk8Va/7AstnnblxEM
         jFCAIO68xgVFqwHfUBm4Gne5YL2o41y7DLqnAAVV7kNueH/IHXGQI3zOn1qj5IrWnY7b
         Pmdw==
X-Gm-Message-State: AFqh2krWLNtowkuFRSEHOabRFJe2dJpnQ2RBJxKNvPtIh01P3rSrA0ng
        JriWvDgjbNRBS6qn/QuTwR7XdQ==
X-Google-Smtp-Source: AMrXdXtfk7VVOkAW0Lhq9C9eVkfMNFMU6DhQtYYFJ12HNUxa8k4CJuIA5Vjbf7pBdYbmMPNSP54RbA==
X-Received: by 2002:a05:6512:3750:b0:4a4:68b9:66cc with SMTP id a16-20020a056512375000b004a468b966ccmr18314876lfs.23.1673467075921;
        Wed, 11 Jan 2023 11:57:55 -0800 (PST)
Received: from umbar.unikie.fi ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id c3-20020ac25f63000000b0049f54c5f2a4sm2872452lfc.229.2023.01.11.11.57.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Jan 2023 11:57:55 -0800 (PST)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Taniya Das <quic_tdas@quicinc.com>
Cc:     linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org
Subject: [PATCH 0/5] clk: qcom: msm8996: add support for the CBF clock
Date:   Wed, 11 Jan 2023 22:57:49 +0300
Message-Id: <20230111195754.2593134-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On MSM8996 two CPU clusters are interconnected using the Core Bus
Fabric (CBF). In order for the CPU clusters to function properly, it
should be clocked following the core's frequencies to provide adequate
bandwidth. On the other hand the CBF's clock rate can be used by other
drivers (e.g. by the pending SPDM driver to provide input on the CPU
performance).

Thus register CBF as a clock (required for CPU to boot) and add a tiny
interconnect layer on top of it to let cpufreq/opp scale the CBF clock.

Dependencies: [1], [2]

[1] https://lore.kernel.org/linux-arm-msm/20230111191453.2509468-1-dmitry.baryshkov@linaro.org/
[2] https://lore.kernel.org/linux-arm-msm/20230111191634.2509616-1-dmitry.baryshkov@linaro.org/

Dmitry Baryshkov (5):
  dt-bindings: clock: qcom,msm8996-cbf: Describe the MSM8996 CBF clock
    controller
  clk: qcom: add msm8996 Core Bus Framework (CBF) support
  clk: qcom: cbf-msm8996: scale CBF clock according to the CPUfreq
  arm64: dts: qcom: msm8996: add CBF device entry
  arm64: dts: qcom: msm8996: scale CBF clock according to the CPUfreq

 .../bindings/clock/qcom,msm8996-cbf.yaml      |  53 ++
 arch/arm64/boot/dts/qcom/msm8996.dtsi         |  57 +++
 drivers/clk/qcom/Makefile                     |   2 +-
 drivers/clk/qcom/clk-cbf-8996.c               | 457 ++++++++++++++++++
 4 files changed, 568 insertions(+), 1 deletion(-)
 create mode 100644 Documentation/devicetree/bindings/clock/qcom,msm8996-cbf.yaml
 create mode 100644 drivers/clk/qcom/clk-cbf-8996.c

-- 
2.30.2

