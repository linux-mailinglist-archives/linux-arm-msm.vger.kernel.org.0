Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7B761622E22
	for <lists+linux-arm-msm@lfdr.de>; Wed,  9 Nov 2022 15:42:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229541AbiKIOmD (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 9 Nov 2022 09:42:03 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52722 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231649AbiKIOmC (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 9 Nov 2022 09:42:02 -0500
Received: from mail-lj1-x22d.google.com (mail-lj1-x22d.google.com [IPv6:2a00:1450:4864:20::22d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CB4DE65B8
        for <linux-arm-msm@vger.kernel.org>; Wed,  9 Nov 2022 06:42:01 -0800 (PST)
Received: by mail-lj1-x22d.google.com with SMTP id a15so26080646ljb.7
        for <linux-arm-msm@vger.kernel.org>; Wed, 09 Nov 2022 06:42:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=y3fCCO8OrFqfmlRiJOlN3mcmOILX6073otuJdGgRoSU=;
        b=G+EbcyZhttx2pXBAAVJNBRJtzsNoy3nm8TjOHndnUkffpsMzrYvO0D6yS6LR3w7nRx
         /aJeRFsze++7h3UnGgwtlBBCxvqSHgS+8VFXpP99KOIkOsFuFSI/6rE4zdU7UU/AkZd2
         +fTVyrgIN6LyJvi0OQ77b1q1y99e61njr617i64ozYSiwKAJqzVb89jCUmru4VBgJqen
         Tu6NYzvcvZc0OcJKv2dSdOlOMJUOqajUYOFA2204ABSW9f/WMdoEFllIMO6ASMpvzPAe
         DRkdVuv3Wp3PhMNPZh2f2P6agP5AkwHWoQyfHLyA2aJfuTjtekVn2G9R2q+vFdopt673
         qLTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=y3fCCO8OrFqfmlRiJOlN3mcmOILX6073otuJdGgRoSU=;
        b=gBC0WoDWW8jBoH617HVA7Rx8xI6/zRSAp7YAsJD6bxMijyYEhJPTyeWdk68xnhVyNU
         V4lHwa4GyUxbZ9Tvxm86Q+PLCDVINsVWTCxRvpFdNjfk/Dc2mrn2HaNiFFZHat0GfBJn
         O+VSqkgwJZmt5Izss44d4tCzQ5izJeoytufColaRo/g5v2W7SH4iU04fJeN13UwdwEzQ
         o9amjwZf28P/GCrHxMY2v4oN1V1+sAZxPUmb9tlzjHvd0PU8TMz0VH2FIgXiQX62PBEL
         42H3oJ8/v9NlPBnzF/2/yNhp13wvxnz1q0gUO4xrMd3WUQDwqFERWNHLVE9rl/F7yZpx
         6kEA==
X-Gm-Message-State: ACrzQf3gN/vojIjgvAagCPDl5zi8mc/DWPcWpHZUpXYJ7GhsTmV6kYPd
        +O4jzWrrEo5jWLs31muiHXwHVBn+UD2xCnpB
X-Google-Smtp-Source: AMsMyM5NWMtNShqzTekBu6kStpTBUMQwoOaT1oR4csNEVUuLjqg3YYqbyka+VgbkzPEEPQtwmmzIQA==
X-Received: by 2002:a2e:9e03:0:b0:26d:eb2b:3eb with SMTP id e3-20020a2e9e03000000b0026deb2b03ebmr19189595ljk.300.1668004919959;
        Wed, 09 Nov 2022 06:41:59 -0800 (PST)
Received: from localhost.localdomain ([194.29.137.22])
        by smtp.gmail.com with ESMTPSA id q10-20020a056512210a00b004a478c2f4desm2235229lfr.163.2022.11.09.06.41.58
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 09 Nov 2022 06:41:59 -0800 (PST)
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
To:     linux-arm-msm@vger.kernel.org, andersson@kernel.org,
        agross@kernel.org, krzysztof.kozlowski@linaro.org
Cc:     patches@linaro.org, Konrad Dybcio <konrad.dybcio@linaro.org>
Subject: [PATCH v2 0/3] SM6375 / PDX225 SD Card support
Date:   Wed,  9 Nov 2022 15:41:50 +0100
Message-Id: <20221109144153.53630-1-konrad.dybcio@linaro.org>
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

Add SDHC2 for SM6375 which effectively means SD Card support for
PDX225. Nothing unusual here, some regulator dancing was required,
but that's expected.

Depends on [1] and [2].

[1] https://lore.kernel.org/linux-arm-msm/20221109111236.46003-1-konrad.dybcio@linaro.org/T/#t
[2] https://lore.kernel.org/linux-arm-msm/20221109110846.45789-2-konrad.dybcio@linaro.org/T/#u

Changes since v1:
- remove stray newline
- use mmc@ node name instead of sdhci@
- pick up tags

Konrad Dybcio (3):
  dt-bindings: mmc: sdhci-msm: Document the SM6375 compatible
  arm64: dts: qcom: sm6375: Add SDHCI2
  arm64: dts: qcom: sm6375-pdx225: Enable SD card slot

 .../devicetree/bindings/mmc/sdhci-msm.yaml    |  1 +
 .../qcom/sm6375-sony-xperia-murray-pdx225.dts | 33 +++++++-
 arch/arm64/boot/dts/qcom/sm6375.dtsi          | 82 +++++++++++++++++++
 3 files changed, 114 insertions(+), 2 deletions(-)

-- 
2.38.1

