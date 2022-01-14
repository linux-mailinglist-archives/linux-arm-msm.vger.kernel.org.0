Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 939C448E1A6
	for <lists+linux-arm-msm@lfdr.de>; Fri, 14 Jan 2022 01:44:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238488AbiANAno (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 13 Jan 2022 19:43:44 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33878 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235741AbiANAnm (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 13 Jan 2022 19:43:42 -0500
Received: from mail-pj1-x1029.google.com (mail-pj1-x1029.google.com [IPv6:2607:f8b0:4864:20::1029])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8AAD6C061574
        for <linux-arm-msm@vger.kernel.org>; Thu, 13 Jan 2022 16:43:42 -0800 (PST)
Received: by mail-pj1-x1029.google.com with SMTP id l16-20020a17090a409000b001b2e9628c9cso12637216pjg.4
        for <linux-arm-msm@vger.kernel.org>; Thu, 13 Jan 2022 16:43:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=DqtNSv4Z9kBGU0LDr3xUR2auo+7Gq8uLx1kqkAz4XQU=;
        b=RVtu2nkywJa1g8nghYyFXFlqS2ka2yS41LPeb0r+UL2+Mau+fRiMQgjl1ZWmktWK4y
         xdZ1VAfEb9AX3ASwGhd+FzHzo2uwK/7sylMJPGopEWzw3K/nfG3AgU3Pu8grSG+E9xo0
         62QXp71/16M7PIjGUbXYT/ovvDFr8gPcsOWJY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=DqtNSv4Z9kBGU0LDr3xUR2auo+7Gq8uLx1kqkAz4XQU=;
        b=ntX6WwbvIcXsvgQsRYDGaKkc8XWCMb238B5H/1dN67co45DTZJDJ+3aiuLqCijIA3o
         WTw61swHgybpbLGBln73R+oaYPr+by13qnA1gwC/qBv2+yrkQALiFGWLHNrTFIyUb6aK
         otDexdjNV6cmO4XbF/glHpmugF4xMvO8JTau7B8VPTA9X6ICl4mD3VrksCYj8I0X5aej
         h6ukpomzY8CfOsllGeYtA4fnK8ndprW2qKkKg7TpCkis6hRim7jSpSspxsoveLLYkH32
         NXdejxQHdm/C4vX2SVE7teEqkRuhBjJ/4TjgqF6sVYnugZsjzCoRuuUHUjf79L1qnhD8
         YN+Q==
X-Gm-Message-State: AOAM533DSqT+vqxVZ6t3VDoTbgbGWDMhSB6ZhFPdbWgE1UpHhU16rKLo
        7FPnfKtGppq4tD0Rld7q4BdbrA==
X-Google-Smtp-Source: ABdhPJxnMElkBrGw7QVbbAwDkb4QfPHO+cq87oWf9ffcSvJcQwgmbzNMLztmzh/Kpif1rE0Q/Rle1g==
X-Received: by 2002:a17:903:245:b0:149:d2a3:ddbf with SMTP id j5-20020a170903024500b00149d2a3ddbfmr6839564plh.3.1642121022107;
        Thu, 13 Jan 2022 16:43:42 -0800 (PST)
Received: from tictac2.mtv.corp.google.com ([2620:15c:202:201:cf6e:9fa9:a398:4c9])
        by smtp.gmail.com with ESMTPSA id j4sm4061498pfj.217.2022.01.13.16.43.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Jan 2022 16:43:41 -0800 (PST)
From:   Douglas Anderson <dianders@chromium.org>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     quic_rjendra@quicinc.com, sibis@codeaurora.org,
        kgodara1@codeaurora.org, mka@chromium.org, swboyd@chromium.org,
        pmaliset@codeaurora.org, Douglas Anderson <dianders@chromium.org>,
        Akhil P Oommen <quic_akhilpo@quicinc.com>,
        Andy Gross <agross@kernel.org>,
        Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH 0/4] arm64: dts: qcom: sc7280: Introduce herobrine-rev1
Date:   Thu, 13 Jan 2022 16:42:59 -0800
Message-Id: <20220114004303.905808-1-dianders@chromium.org>
X-Mailer: git-send-email 2.34.1.703.g22d0c6ccf7-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

This series adds support for herobrine-rev1. Note that it's likely
that with the introduction of -rev1 we can drop -rev0 support, but
we'll keep it for now (though we won't try to "fit it in" and share
code with it).

This series is confirmed to boot herobrine-rev1 atop mainline, commit
fb3b0673b7d5 ("Merge tag 'mailbox-v5.17' of
git://git.linaro.org/landing-teams/working/fujitsu/integration"),
though it requires a hack to work around a misconfigured DMA for
i2c14 (https://crrev.com/c/3378660)


Douglas Anderson (4):
  arm64: dts: qcom: sc7280: Fix gmu unit address
  arm64: dts: qcom: sc7280: Move herobrine-r0 to its own dts
  arm64: dts: qcom: sc7280: Factor out Chrome common fragment
  arm64: dts: qcom: sc7280: Add herobrine-r1

 arch/arm64/boot/dts/qcom/Makefile             |    3 +-
 .../boot/dts/qcom/sc7280-chrome-common.dtsi   |   97 ++
 .../qcom/sc7280-herobrine-herobrine-r0.dts    | 1352 +++++++++++++++++
 .../qcom/sc7280-herobrine-herobrine-r1.dts    |  314 ++++
 arch/arm64/boot/dts/qcom/sc7280-herobrine.dts |   14 -
 .../arm64/boot/dts/qcom/sc7280-herobrine.dtsi | 1045 +++----------
 arch/arm64/boot/dts/qcom/sc7280-idp.dtsi      |   75 +-
 arch/arm64/boot/dts/qcom/sc7280-qcard.dtsi    |  557 +++++++
 arch/arm64/boot/dts/qcom/sc7280.dtsi          |    2 +-
 9 files changed, 2532 insertions(+), 927 deletions(-)
 create mode 100644 arch/arm64/boot/dts/qcom/sc7280-chrome-common.dtsi
 create mode 100644 arch/arm64/boot/dts/qcom/sc7280-herobrine-herobrine-r0.dts
 create mode 100644 arch/arm64/boot/dts/qcom/sc7280-herobrine-herobrine-r1.dts
 delete mode 100644 arch/arm64/boot/dts/qcom/sc7280-herobrine.dts
 create mode 100644 arch/arm64/boot/dts/qcom/sc7280-qcard.dtsi

-- 
2.34.1.703.g22d0c6ccf7-goog

