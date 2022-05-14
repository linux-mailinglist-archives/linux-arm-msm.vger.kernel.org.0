Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E194152744D
	for <lists+linux-arm-msm@lfdr.de>; Sat, 14 May 2022 23:54:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235482AbiENVyh (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 14 May 2022 17:54:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43320 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232773AbiENVyf (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 14 May 2022 17:54:35 -0400
Received: from mail-pg1-x52e.google.com (mail-pg1-x52e.google.com [IPv6:2607:f8b0:4864:20::52e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 951782CE15
        for <linux-arm-msm@vger.kernel.org>; Sat, 14 May 2022 14:54:34 -0700 (PDT)
Received: by mail-pg1-x52e.google.com with SMTP id 202so10665732pgc.9
        for <linux-arm-msm@vger.kernel.org>; Sat, 14 May 2022 14:54:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=GswRETFJidMZVxHaNKTcPQzDNgyZO4ho0I1hUMCR+HY=;
        b=amQmKg+s2Y4OKXzam2xANiIVRiRd75yDGH7WCFAtow8+LtWrfrkmSnV38kv9Tj11zY
         F0N7dniayEY3OZXPk1a+aHo2pV1jAJvgIKSwtl1yZRuCAMyEuEgjk6kN/DQeHnEOycCp
         xSAf1gAEZSKy6pj+0AlQYwXHVFH94A/uP7oyCRmxGcdKoXclIsW1Ry6MBBMV4IQqWkPO
         cXd97PcPY1OVS1nD9nqDRuAZ/eDD1thEMji+r1dX6nPOtF4soJQbLOkKPsH2xVxSCwwx
         lR7c3L3XIu4JScgBX9q26LREn/oLaCfumjjkEXqzFVn8P4VsAoxKVTYpohg8+BJ4zv8h
         Z0uQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=GswRETFJidMZVxHaNKTcPQzDNgyZO4ho0I1hUMCR+HY=;
        b=J+xTaOkisOZSxTkcfF8fLFp/crN5O1tdcyBDBYNwCGoSqhzu6qLz1tk084sz6x1Zzo
         0XFD5Tfc1efP1S/sHmN8bkjwkwquelmqMpPMzRLSUU309NSfpVriK3vTXF1t5TdROiQD
         i+CjTLwJXAXaqN1k9ft0pqimsgIC3P+408QIl+WpRpbnkAir3QDAT5O9z87ps/cXTZbf
         s9s0TevrKcXmV+NquqkdVFSTo0AoI+exbz+RBc5jO3DFHOgG29SYHLsE4Nr5nn11+suX
         ilWTKwTqrPo9LKLE2KWibIIxVWAnM/CTI9q9g/8nUzX7VVoSNYPnH5oBewaC6hdGwl6V
         QtKA==
X-Gm-Message-State: AOAM532BCawUd9kpUo9/cXB/l9cpudy1w42xGFRsYWBBKyfMbxeFsuht
        8GRkNGt9wPjndudvcuDIX2BnHr+kw00DWw==
X-Google-Smtp-Source: ABdhPJzuL2B+qXfF4Ci1HF4gJXWuuseaViLiqMJ9Wis9wyfnUzOy3NQsdyYPLbCqGA1nL9wrLe5TlA==
X-Received: by 2002:a63:7247:0:b0:3c1:a8ab:fc6 with SMTP id c7-20020a637247000000b003c1a8ab0fc6mr9599969pgn.602.1652565273784;
        Sat, 14 May 2022 14:54:33 -0700 (PDT)
Received: from localhost.localdomain ([2401:4900:1c60:931c:dd30:fa99:963:d0be])
        by smtp.gmail.com with ESMTPSA id m13-20020a170902db0d00b0015e8d4eb2d2sm4189522plx.284.2022.05.14.14.54.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 May 2022 14:54:33 -0700 (PDT)
From:   Bhupesh Sharma <bhupesh.sharma@linaro.org>
To:     linux-arm-msm@vger.kernel.org
Cc:     bhupesh.sharma@linaro.org, bhupesh.linux@gmail.com,
        linux-kernel@vger.kernel.org, bjorn.andersson@linaro.org,
        robh@kernel.org
Subject: [PATCH v2 0/6] arm64: dts: qcom: Fix 'sdhci' nodes for 'make dtbs_check'
Date:   Sun, 15 May 2022 03:24:18 +0530
Message-Id: <20220514215424.1007718-1-bhupesh.sharma@linaro.org>
X-Mailer: git-send-email 2.35.3
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

Changes since v1:
----------------
- v1 can be seen here: https://lore.kernel.org/linux-arm-msm/20220429214420.854335-1-bhupesh.sharma@linaro.org/
- Fixed Bjorn's comments received on v1.
- Added 3 more dts fix-up patches [PATCH 1/6], [PATCH 5/6]
  and [PATCH 6/6] in v2.

Since the change to convert the Qualcomm 'sdhci-msm' device-tree binding
to yaml format has been accepted in linux-next and a fix for the same
was sent as per Rob's review comments, 'make dtbs_check' now
reports several issues with sdhci nodes used across qcom dts files.

This patchset fixes the same.

Cc: Bjorn Andersson <bjorn.andersson@linaro.org>
Cc: Rob Herring <robh@kernel.org>

Bhupesh Sharma (6):
  arm64: dts: qcom: Fix sdhci node names - use 'mmc@'
  arm64: dts: qcom: sdm630: Fix 'interconnect-names' for sdhci nodes
  arm64: dts: qcom: Fix node names for sdhci 'opp-table' nodes (across
    dts files)
  arm64: dts: qcom: Fix ordering of 'clocks' & 'clock-names' for sdhci
    nodes
  arm64: dts: qcom: Fix 'reg-names' for sdhci nodes
  arm64: dts: qcom: ipq8074: Fix 'max-frequency' value for sdhci node

 arch/arm/boot/dts/qcom-apq8084.dtsi   |  4 ++--
 arch/arm/boot/dts/qcom-ipq4019.dtsi   |  2 +-
 arch/arm/boot/dts/qcom-msm8226.dtsi   |  6 +++---
 arch/arm/boot/dts/qcom-msm8974.dtsi   |  6 +++---
 arch/arm/boot/dts/qcom-sdx55.dtsi     |  2 +-
 arch/arm/boot/dts/qcom-sdx65.dtsi     |  2 +-
 arch/arm64/boot/dts/qcom/ipq8074.dtsi | 12 ++++++------
 arch/arm64/boot/dts/qcom/msm8916.dtsi | 16 ++++++++--------
 arch/arm64/boot/dts/qcom/msm8953.dtsi |  4 ++--
 arch/arm64/boot/dts/qcom/msm8994.dtsi | 18 +++++++++---------
 arch/arm64/boot/dts/qcom/msm8996.dtsi |  4 ++--
 arch/arm64/boot/dts/qcom/msm8998.dtsi |  2 +-
 arch/arm64/boot/dts/qcom/qcs404.dtsi  | 10 +++++-----
 arch/arm64/boot/dts/qcom/sc7180.dtsi  | 22 +++++++++++-----------
 arch/arm64/boot/dts/qcom/sc7280.dtsi  | 18 +++++++++---------
 arch/arm64/boot/dts/qcom/sdm630.dtsi  | 25 ++++++++++++++-----------
 arch/arm64/boot/dts/qcom/sdm845.dtsi  |  2 +-
 arch/arm64/boot/dts/qcom/sm6125.dtsi  |  8 ++++----
 arch/arm64/boot/dts/qcom/sm6350.dtsi  | 10 +++++-----
 arch/arm64/boot/dts/qcom/sm8150.dtsi  |  4 ++--
 arch/arm64/boot/dts/qcom/sm8250.dtsi  |  4 ++--
 21 files changed, 92 insertions(+), 89 deletions(-)

-- 
2.35.3

