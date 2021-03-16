Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0D77F33CABA
	for <lists+linux-arm-msm@lfdr.de>; Tue, 16 Mar 2021 02:16:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234225AbhCPBPc (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 15 Mar 2021 21:15:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49882 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234176AbhCPBPT (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 15 Mar 2021 21:15:19 -0400
Received: from mail-pj1-x1031.google.com (mail-pj1-x1031.google.com [IPv6:2607:f8b0:4864:20::1031])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8BA5CC06175F
        for <linux-arm-msm@vger.kernel.org>; Mon, 15 Mar 2021 18:15:19 -0700 (PDT)
Received: by mail-pj1-x1031.google.com with SMTP id k23-20020a17090a5917b02901043e35ad4aso442556pji.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 15 Mar 2021 18:15:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=N8PazbWxeQpma3IK9jRB0TxFsaKkwjN5cuc0b0m+m2M=;
        b=Yucta2XTHd86ALutAlq9i8vYXxo8CaGrEyvfGJ9dgeAaEvR3W6aRRqPI4kdM8RuUWy
         1po+j965cuiAM754oSDUDRwpiwHMV1yuRM4BI2k8jhzdlAVDxiN66/hxGyjuFV+DTS+O
         AfurjumWkxNMUz7cOdZk2jMrmeiESEgJT+S/I=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=N8PazbWxeQpma3IK9jRB0TxFsaKkwjN5cuc0b0m+m2M=;
        b=nmOjiRblhJSS+xpVfaQ2zq6Cbhln6gpwMvxeQ4y4aN1zaIhAJbwPw/+TvwJYASSbyw
         Ein7inDkavWy6w+DIKipIbTPd04qQ+bSCMWbCAWsHEL/S0hCNUsFx/hJlb7hkobSnqB7
         2W9sO42zmbWmLpM0HtPg8NG0HtG/avBcnXfxAa9rUH6yNxOrOSWAIvJN/Om7vQmC1/te
         PJm+dA/W+juKyCVsFAeSj5/4ylCicW1epqsDBuYeNNlCVTpVviE/rSAsafxpmlI4sHq/
         Oj2fvmaN5ZFwAyrlCJ5Dje+X7IP8udPTv1bdABT5uBt2pxcX3iY3KZ32l312dtf0onQy
         /91Q==
X-Gm-Message-State: AOAM532HQ1jvArOpV2Q7RrrzjvbB/szUxIFhhWL+5W7ntrAgdoBDBdOw
        8V6geK0AxknFERlz/Ax1r2oxQw==
X-Google-Smtp-Source: ABdhPJwUXEsQ6bCOeQfni68O7RS1LZO5BRxAyA+VB21PrjYoHi6CoRlKsF2rEpEQRvjV6L/PGeH+HA==
X-Received: by 2002:a17:902:e309:b029:e6:c17b:895a with SMTP id q9-20020a170902e309b02900e6c17b895amr34441plc.74.1615857319034;
        Mon, 15 Mar 2021 18:15:19 -0700 (PDT)
Received: from localhost ([2620:15c:202:1:9867:b969:5d4f:e017])
        by smtp.gmail.com with UTF8SMTPSA id gb1sm811159pjb.21.2021.03.15.18.15.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 15 Mar 2021 18:15:18 -0700 (PDT)
From:   Matthias Kaehlcke <mka@chromium.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>
Cc:     Douglas Anderson <dianders@chromium.org>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, Matthias Kaehlcke <mka@chromium.org>
Subject: [PATCH v3 0/3] arm64: dts: qcom: sc7180: Disable the charger thermal zone on more trogdor boards
Date:   Mon, 15 Mar 2021 18:15:12 -0700
Message-Id: <20210316011516.1314686-1-mka@chromium.org>
X-Mailer: git-send-email 2.31.0.rc2.261.g7f71774620-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

We already disabled the charger thermal zone for lazor to avoid
bogus temperature readings from an unsupported thermistor. Some
revisions of other trogdor boards that are added by Doug's
'arm64: dts: qcom: Update sc7180-trogdor variants from downstream'
series have the same problem. Disable the charger thermal zone for
them too.

This series is based on v2 of the 'arm64: dts: qcom: Update
sc7180-trogdor variants from downstream' series
(https://patchwork.kernel.org/project/linux-arm-msm/list/?series=440315)

(no changes since v1)

Matthias Kaehlcke (3):
  arm64: dts: qcom: sc7180: lazor: Simplify disabling of charger thermal
    zone
  arm64: dts: qcom: sc7180: Add pompom rev3
  arm64: dts: qcom: sc7180: Add CoachZ rev3

 arch/arm64/boot/dts/qcom/Makefile             |  6 ++-
 .../dts/qcom/sc7180-trogdor-coachz-r1-lte.dts |  4 +-
 .../dts/qcom/sc7180-trogdor-coachz-r1.dts     | 13 ++++++-
 ...e.dts => sc7180-trogdor-coachz-r3-lte.dts} |  6 +--
 ...hz-r2.dts => sc7180-trogdor-coachz-r3.dts} |  4 +-
 .../boot/dts/qcom/sc7180-trogdor-lazor-r0.dts |  9 -----
 .../boot/dts/qcom/sc7180-trogdor-lazor-r1.dts |  9 -----
 .../boot/dts/qcom/sc7180-trogdor-lazor-r3.dts |  9 -----
 .../boot/dts/qcom/sc7180-trogdor-lazor.dtsi   |  9 +++++
 .../dts/qcom/sc7180-trogdor-pompom-r1.dts     | 12 ++++++
 .../dts/qcom/sc7180-trogdor-pompom-r2-lte.dts |  4 +-
 .../dts/qcom/sc7180-trogdor-pompom-r2.dts     | 38 +++++--------------
 .../dts/qcom/sc7180-trogdor-pompom-r3-lte.dts | 14 +++++++
 .../dts/qcom/sc7180-trogdor-pompom-r3.dts     | 15 ++++++++
 .../boot/dts/qcom/sc7180-trogdor-pompom.dtsi  | 29 ++++++++++++++
 15 files changed, 112 insertions(+), 69 deletions(-)
 rename arch/arm64/boot/dts/qcom/{sc7180-trogdor-coachz-r2-lte.dts => sc7180-trogdor-coachz-r3-lte.dts} (69%)
 rename arch/arm64/boot/dts/qcom/{sc7180-trogdor-coachz-r2.dts => sc7180-trogdor-coachz-r3.dts} (75%)
 create mode 100644 arch/arm64/boot/dts/qcom/sc7180-trogdor-pompom-r3-lte.dts
 create mode 100644 arch/arm64/boot/dts/qcom/sc7180-trogdor-pompom-r3.dts

-- 
2.31.0.rc2.261.g7f71774620-goog

