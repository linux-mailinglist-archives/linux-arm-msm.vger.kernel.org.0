Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 31B2A4C81B0
	for <lists+linux-arm-msm@lfdr.de>; Tue,  1 Mar 2022 04:38:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229649AbiCADjW (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 28 Feb 2022 22:39:22 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46892 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229517AbiCADjU (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 28 Feb 2022 22:39:20 -0500
Received: from mail-oo1-xc2f.google.com (mail-oo1-xc2f.google.com [IPv6:2607:f8b0:4864:20::c2f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9C620E035
        for <linux-arm-msm@vger.kernel.org>; Mon, 28 Feb 2022 19:38:40 -0800 (PST)
Received: by mail-oo1-xc2f.google.com with SMTP id n5-20020a4a9545000000b0031d45a442feso13535893ooi.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 28 Feb 2022 19:38:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=n40CeBynEW+1ZBWD62UetCPOnT3R4YBx5wB/UbvRqXY=;
        b=KzTh1tBDSqMxLARYauOeyLwcqMELW0TqVEzGSx4BIjVnkFrPHvecXHPiWh2Gw2uVSM
         cQKVEfw5feqnCf+dw/in0nn8PqL8OyyFBYiGeTSBGKKriQdwAfnvTvgPjz5QxYrdSYGp
         aZoB0GbjBoNjzEsDmKVUyh0ZXDSOtungxqmbcSAIuC4z82jmORQpp2gfCQ6rWXE8Ll1C
         tQGcma3rs5B3C/sO8Kmm4xsa2esUekAN49V5N7A4GId0CZwPhyXF1XoLBQT1IcaUTswY
         im1P3yJCc9seJf+WAEijyZ3yy6A+juANXgQZI1GTvY4Acn4aixoCFePgUCmsCyyFfJZo
         2Ngw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=n40CeBynEW+1ZBWD62UetCPOnT3R4YBx5wB/UbvRqXY=;
        b=EmjmmAflMnYMf3GYRjZtN8Wit6Mfb+apqyYJLJvNGdzxL+d98utFPdBCTzT5zichG+
         xywRLCRf4wnFbBGx8wwwsYy6aBUdoojr7rcFudm4lhi+eSWXZeJdZbidVdGwtvd6af5C
         aF00Oinc6LzLP656yd59M5K2NLEklOEdeOYQhkWDnaOvq8qtsgT0cmMf7vGYHgvXpuPO
         +HB5rheFaA+EXhImTaV8rvhf3cEMEILw+BsnCdNK6JzomiPVBt2k//1+watGyg6ZpriC
         eS8otUjNEUXeOkMBKqav2YQdTJyGONDnjmK0BFWDLeDrZGsau2kkxoj5IFM9VwKhM9EG
         pIHw==
X-Gm-Message-State: AOAM532TBnkXdMb7sQAGDB1WJ4T7qNAC3sNoJQXI91n5QDhOASRpUcA3
        JROrKknYvAhlJWNmLwOzV3zJoQ==
X-Google-Smtp-Source: ABdhPJzTz7/sBKrsnpWdsf/YUVOUR+ZRClUh2EgE9Guw6DNIZsTuqk2ufir7z20+aFxwx7zksOeqjg==
X-Received: by 2002:a05:6870:8316:b0:d3:a001:96cf with SMTP id p22-20020a056870831600b000d3a00196cfmr10066982oae.85.1646105919907;
        Mon, 28 Feb 2022 19:38:39 -0800 (PST)
Received: from builder.lan ([2600:1700:a0:3dc8:3697:f6ff:fe85:aac9])
        by smtp.gmail.com with ESMTPSA id t40-20020a05680815a800b002d48ffad94bsm7616153oiw.2.2022.02.28.19.38.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Feb 2022 19:38:39 -0800 (PST)
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     arm@kernel.org, soc@kernel.org
Cc:     linux-arm-msm@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        Andy Gross <agross@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
        Olof Johansson <olof@lixom.net>,
        Kevin Hilman <khilman@baylibre.com>,
        Stanislav Jakubek <stano.jakubek@gmail.com>
Subject: [GIT PULL] Qualcomm DeviceTree fixes for v5.17
Date:   Mon, 28 Feb 2022 21:38:38 -0600
Message-Id: <20220301033838.1801689-1-bjorn.andersson@linaro.org>
X-Mailer: git-send-email 2.32.0
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

The following changes since commit ef5ad2608511596b8bd28f1e2b4fa8fadfd2f536:

  ARM: dts: qcom: Drop input-name property (2021-12-15 16:40:52 -0600)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux.git tags/qcom-dts-fixes-for-5.17

for you to fetch changes up to fc5a40694ba684fb3b7009819965ec38e829118f:

  Revert "dt-bindings: arm: qcom: Document SDX65 platform and boards" (2021-12-23 12:00:24 -0600)

----------------------------------------------------------------
Qualcomm DeviceTree fixes for v5.17

The SDX65 platform and MTP device was added twice to the DT binding,
this drops one of the occurances.

----------------------------------------------------------------
Stanislav Jakubek (1):
      Revert "dt-bindings: arm: qcom: Document SDX65 platform and boards"

 Documentation/devicetree/bindings/arm/qcom.yaml | 6 ------
 1 file changed, 6 deletions(-)
