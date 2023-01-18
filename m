Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6A4D5672C39
	for <lists+linux-arm-msm@lfdr.de>; Thu, 19 Jan 2023 00:05:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229600AbjARXFe (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 18 Jan 2023 18:05:34 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55266 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229459AbjARXFd (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 18 Jan 2023 18:05:33 -0500
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com [IPv6:2a00:1450:4864:20::336])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 88802305FB
        for <linux-arm-msm@vger.kernel.org>; Wed, 18 Jan 2023 15:05:32 -0800 (PST)
Received: by mail-wm1-x336.google.com with SMTP id q10-20020a1cf30a000000b003db0edfdb74so1915056wmq.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 18 Jan 2023 15:05:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=m4PepIMgjunHPFAdcwLkHufzAvLogufkwZaXQ5q9ioM=;
        b=rsFwZUUs/BZI/dJUyY8MiEWoUhj+bNz3VjHaDJHeXz7XYylPZPTiUMqb4hLC41yD/O
         fngXVIRA9ow2YYhGSEMnEKN5gPBKcacPzaW7NKdm14UGyzJQwlbomr7JyO2iUN2wE7xO
         efOQdqKkUbDm8IrPSR/0xD5qXneiEAGIA00X2/hdCJpjacFv4rYt4Wz1KSMmB8dY4xnM
         vo5oM9FnZy2riRhECyQ1LSNb5zE7g1ISwQ7v3x18ZmDXQ5AzxgdjxD72OT89UCcfP5F5
         4ufr5Y0xUVu8btnPZscb1IhsG0f/mB+HCfl/fU1csc9y+tFIvtn8SC6SThc4t592zqag
         j0hA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=m4PepIMgjunHPFAdcwLkHufzAvLogufkwZaXQ5q9ioM=;
        b=jT2c4SvGSWeo6MNVw1ypSshdVrcg5NXXFONzv2qkouUVRA0BedRt8vO48YTw0tuqSh
         arHOMMRwzoYK9qVb2/3AJMoSl8HwEPKhIrEt5GzGh0XCceJ1UUCADQBVf/WBQh3C4am1
         zLhhI5OY/hsSUUZj9O4lPNj6G0Bwgx02EQev0TeAWubL8pmQzzab170bx2T9tCFCOY6z
         PCayb3dVE4qzhXpkBG4zuhM7oqBh8Q2qyyv6vjOo/IH+l1EqDgd0XNzWabZ/ZeUSU/4G
         7lCaj6oZQ21J/2UXXIJbn6reCY/viZ5mPMb2ZsC21OE1fNTcjm7mnMfkU9Gck1tWux58
         1wiA==
X-Gm-Message-State: AFqh2komqnuMVWxq6utRCEidJFH7/bT5X+hCTGxyrEH5jlJpMnN77US8
        fySUriD95t6V15+CgDETSN1Dow==
X-Google-Smtp-Source: AMrXdXvOn5g/rZ2qMOY5PWhwdG/0hZbasik5oaViA2GbP6IJAUe8eaPlnoW/Oct32slxARGRFO9gPg==
X-Received: by 2002:a05:600c:510b:b0:3db:d3f:a919 with SMTP id o11-20020a05600c510b00b003db0d3fa919mr4297232wms.1.1674083131063;
        Wed, 18 Jan 2023 15:05:31 -0800 (PST)
Received: from hackbox.lan ([94.52.112.99])
        by smtp.gmail.com with ESMTPSA id o2-20020a05600c510200b003c6f8d30e40sm3523314wms.31.2023.01.18.15.05.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Jan 2023 15:05:30 -0800 (PST)
From:   Abel Vesa <abel.vesa@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: [PATCH v2 0/2] arm64: dts: qcom: sm8550: Add PCIe HC and PHY support
Date:   Thu, 19 Jan 2023 01:05:24 +0200
Message-Id: <20230118230526.1499328-1-abel.vesa@linaro.org>
X-Mailer: git-send-email 2.34.1
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

This patchset adds PCIe controllers and PHYs support to SM8550 platform
and enables them on the MTP board.

The v1 was here:
https://lore.kernel.org/all/20221116130430.2812173-1-abel.vesa@linaro.org/

Changes since v1:
 * ordered pcie related nodes alphabetically in MTP dts
 * dropped the pipe_mux, phy_pipe and ref clocks from the pcie nodes
 * dropped the child node from the phy nodes, like Johan suggested,
   and updated to use the sc8280xp binding scheme
 * changed "pcie_1_nocsr_com_phy_reset" 2nd reset name of pcie1_phy
   to "nocsr"
 * reordered all pcie nodes properties to look similar to the ones
   from sc8280xp

Abel Vesa (2):
  arm64: dts: qcom: sm8550: Add PCIe PHYs and controllers nodes
  arm64: dts: qcom: sm8550-mtp: Add PCIe PHYs and controllers nodes

 arch/arm64/boot/dts/qcom/sm8550-mtp.dts |  29 ++++
 arch/arm64/boot/dts/qcom/sm8550.dtsi    | 213 +++++++++++++++++++++++-
 2 files changed, 239 insertions(+), 3 deletions(-)

-- 
2.34.1

