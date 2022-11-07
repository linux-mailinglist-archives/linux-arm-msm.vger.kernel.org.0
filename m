Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 278FB61F6B7
	for <lists+linux-arm-msm@lfdr.de>; Mon,  7 Nov 2022 15:55:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232589AbiKGOzz (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 7 Nov 2022 09:55:55 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36992 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232514AbiKGOzn (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 7 Nov 2022 09:55:43 -0500
Received: from mail-ej1-x632.google.com (mail-ej1-x632.google.com [IPv6:2a00:1450:4864:20::632])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 51EFE1E3E0
        for <linux-arm-msm@vger.kernel.org>; Mon,  7 Nov 2022 06:55:28 -0800 (PST)
Received: by mail-ej1-x632.google.com with SMTP id q9so30929486ejd.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 07 Nov 2022 06:55:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=EOVxQQ/KJuIdX83Yq489JvOvm/XE0A18nnsZpKusNfc=;
        b=OsoPVjOYLsMri2sXv4Hd7GJ2zyBns0DNMhyn6yiUZUzrtw2ijRaBSz9E0vlUpYdsgE
         YsVJ+A1E7AnGs3vAuCzF5cUNjNCu/OyOwM0YsDHo3FNA+SvFgxFn/SHvdKIKyFM8n8Ks
         xxoiPcirZWrN3EBwZYe0mOg29a0/gHdOzQmx2qB8j9BtYnzNnLTlVQvONVJxeR5QzD1J
         B3a1YjUVDLJaHQPg9ci3fOYShbyWFCXGvqV7IsK88pvKqh3YupBvznWXX1twcMOGGjEo
         kM+jGuywW+XX8YzlM7QZQ6z2VzTvUmFD7BTveobUTqTUSJkEs3xWyYbwdwTkzDKjeGsm
         +dQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=EOVxQQ/KJuIdX83Yq489JvOvm/XE0A18nnsZpKusNfc=;
        b=04M1PCdhCsUEcBG5Yjasy46doUTPVUGkTFGITC/EIRvb/cYBVNyZ/bho/ATNB0U4zx
         +1uw9owUqanxunvTuAM1msNiYoSirCQZgpZygJwWgWrUGkkSGM+Tqq5jNcBi09h/7whd
         7U0TOO3S8BWrNZngW6V2ArWg07eN7JcWlLcJO7MJ/PvU0cAp0gSgqa5mIP8rFH5bVnWf
         pNLxKBWdasLMNF88kKcBDBoB1K3lYY/+TYzeTOy3qegdzflFFrjV6s3we4665XQrMj57
         eGaOH11EuA+xiNLHiKgtGJgEF/V4HnX/hV1SJfXHMtWH6SDOUcxQblqUOYKszrKsZVv7
         Gpuw==
X-Gm-Message-State: ACrzQf3OXXWac+ZkGLuuuCsc4FuPO4mmb0Ys0BdM6oxWBRkKj+8sKtsj
        dNYkVUHKZ7+AbI9VRJcxgJ/FARln0Ux+QQ8H
X-Google-Smtp-Source: AMsMyM7OamA26aBlLI14vRHanUHRJLYUBNYc76HEiBrjREZUI94d60oPj4LXq6UcrLS6Nha1FiYb1w==
X-Received: by 2002:a17:906:328c:b0:780:7574:ced2 with SMTP id 12-20020a170906328c00b007807574ced2mr48488850ejw.634.1667832926397;
        Mon, 07 Nov 2022 06:55:26 -0800 (PST)
Received: from localhost.localdomain ([194.29.137.22])
        by smtp.gmail.com with ESMTPSA id d1-20020a1709067f0100b0078907275a44sm3503049ejr.42.2022.11.07.06.55.24
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 07 Nov 2022 06:55:25 -0800 (PST)
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
To:     linux-arm-msm@vger.kernel.org, andersson@kernel.org,
        agross@kernel.org, krzysztof.kozlowski@linaro.org
Cc:     patches@linaro.org, Konrad Dybcio <konrad.dybcio@linaro.org>
Subject: [PATCH 00/11] Minor DT comment cleanups
Date:   Mon,  7 Nov 2022 15:55:10 +0100
Message-Id: <20221107145522.6706-1-konrad.dybcio@linaro.org>
X-Mailer: git-send-email 2.32.0 (Apple Git-132)
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

Ensure the usage of C-style (/* */) comments instead of '//'.
Make sure all multiline C-style commends begin with just '/*' with
the comment text starting on a new line.

I also capitalized some comments differently and trimmed some fluff.

This patchset brings no functional change, purely for cosmetic and
code style purposes.

I also caught a single sneaky raw value with a proper #define constant
sitting next to it in the comment..


Konrad Dybcio (11):
  arm64: dts: qcom: msm/apq8x16-*: Fix up comments
  arm64: dts: qcom: msm/apq8x96-*: Fix up comments
  arm64: dts: qcom: msm8953: Fix up comments
  arm64: dts: qcom: msm8998-*: Fix up comments
  arm64: dts: qcom: sc8280xp-x13s: Fix up comments
  arm64: dts: qcom: sdm845-*: Fix up comments
  arm64: dts: qcom: ipq8074-*: Fix up comments
  arm64: dts: qcom: msm8992-*: Fix up comments
  arm64: dts: qcom: msm8994-*: Fix up comments
  arm64: dts: qcom: qcs404-*: Fix up comments
  arm64: dts: qcom: pm6150/l/pm7325/pms405: Fix up comments

 arch/arm64/boot/dts/qcom/apq8016-sbc.dts      |  2 +-
 arch/arm64/boot/dts/qcom/apq8096-db820c.dts   | 14 +++----
 arch/arm64/boot/dts/qcom/ipq8074-hk01.dts     |  3 +-
 arch/arm64/boot/dts/qcom/ipq8074-hk10-c1.dts  |  3 +-
 arch/arm64/boot/dts/qcom/ipq8074-hk10-c2.dts  |  3 +-
 arch/arm64/boot/dts/qcom/ipq8074.dtsi         | 12 +++---
 .../arm64/boot/dts/qcom/msm8916-huawei-g7.dts |  4 +-
 .../boot/dts/qcom/msm8916-longcheer-l8150.dts |  6 +--
 arch/arm64/boot/dts/qcom/msm8916-pins.dtsi    |  2 +-
 .../dts/qcom/msm8916-samsung-serranove.dts    |  4 +-
 .../dts/qcom/msm8916-wingtech-wt88047.dts     |  4 +-
 arch/arm64/boot/dts/qcom/msm8916.dtsi         | 10 ++---
 arch/arm64/boot/dts/qcom/msm8953.dtsi         |  6 +--
 .../dts/qcom/msm8992-lg-bullhead-rev-10.dts   |  3 +-
 .../dts/qcom/msm8992-lg-bullhead-rev-101.dts  |  3 +-
 .../boot/dts/qcom/msm8992-lg-bullhead.dtsi    | 41 ++++++++++---------
 arch/arm64/boot/dts/qcom/msm8992.dtsi         |  3 +-
 .../qcom/msm8994-huawei-angler-rev-101.dts    |  3 +-
 arch/arm64/boot/dts/qcom/msm8994.dtsi         |  3 +-
 arch/arm64/boot/dts/qcom/msm8996.dtsi         |  3 +-
 .../boot/dts/qcom/msm8998-fxtec-pro1.dts      |  8 +---
 arch/arm64/boot/dts/qcom/msm8998-mtp.dts      |  8 +---
 arch/arm64/boot/dts/qcom/pm6150.dtsi          |  4 +-
 arch/arm64/boot/dts/qcom/pm6150l.dtsi         |  4 +-
 arch/arm64/boot/dts/qcom/pm7325.dtsi          |  4 +-
 arch/arm64/boot/dts/qcom/pms405.dtsi          |  4 +-
 arch/arm64/boot/dts/qcom/qcs404-evb-1000.dts  |  4 +-
 arch/arm64/boot/dts/qcom/qcs404-evb-4000.dts  |  4 +-
 arch/arm64/boot/dts/qcom/qcs404-evb.dtsi      |  4 +-
 arch/arm64/boot/dts/qcom/qcs404.dtsi          |  4 +-
 .../qcom/sc8280xp-lenovo-thinkpad-x13s.dts    |  2 +-
 arch/arm64/boot/dts/qcom/sdm845-db845c.dts    | 38 ++++++++++-------
 .../boot/dts/qcom/sdm845-oneplus-common.dtsi  |  5 ++-
 .../boot/dts/qcom/sdm850-samsung-w737.dts     |  2 +-
 34 files changed, 131 insertions(+), 96 deletions(-)

-- 
2.38.1

