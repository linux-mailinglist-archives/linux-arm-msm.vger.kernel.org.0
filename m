Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6B18038D07F
	for <lists+linux-arm-msm@lfdr.de>; Sat, 22 May 2021 00:04:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229512AbhEUWFd (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 21 May 2021 18:05:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60216 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229507AbhEUWFd (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 21 May 2021 18:05:33 -0400
Received: from mail-pf1-x42d.google.com (mail-pf1-x42d.google.com [IPv6:2607:f8b0:4864:20::42d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A93A6C0613ED
        for <linux-arm-msm@vger.kernel.org>; Fri, 21 May 2021 15:04:09 -0700 (PDT)
Received: by mail-pf1-x42d.google.com with SMTP id d78so15024153pfd.10
        for <linux-arm-msm@vger.kernel.org>; Fri, 21 May 2021 15:04:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=fZVsdD5w5dtbGbEEJ61BTCXnjeAcPQ5ciZkXFGTTwac=;
        b=BmJq5PJ91Kt9ueWlXfgGzQb1lvyeJkdvPtPnF1aTg6ImNy0Pe5eSeuMnLnT8NW7mCx
         OBMKULvpyEp6PFq/qxpPh8PHEB09lKSWIDfXHL3aOX2G1YFgQmLWjxqBARLtW+ozJnBS
         4XVhdLVFiR5s3e6g7RxHIS2InHQ/uYTsKhjBM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=fZVsdD5w5dtbGbEEJ61BTCXnjeAcPQ5ciZkXFGTTwac=;
        b=czMsaUpsQC8z8S+MPCEVSV0lUUYOSefP8k3v+/1stjZAt+V2E7dJm4RkLL96izWXb6
         FaFquym2vS6DRLQcZCVXJX5hPQsNlIW51z7wCVvqC+IusAVLJrwD+8+E9ccKezQf/SOw
         FYzs5zIVoAFX4bL57TPMO4zkFfOR5jBiyBOfcZ2XAqxtfXwYy8I+tP6D0vgb/cOx9puY
         Op01FOZlB1n6KEHFEjyCp1sAhPvNhRPiAsIOfH6YTYMdg89nH4kIQzTJshUdl5SXFmu+
         LVTUP6Q7OiC5bEwsyQVlXyv8BtAJXNmKvFj2GP4clAC7sTA8InEa3seW+0oMEOPuYsT1
         TCqg==
X-Gm-Message-State: AOAM531y1N8tqGCpOzYCMe23CIe0k72Ete55w20o80URWkXg6aNJtQIJ
        EbnTdMSuiSHgzYSbb0uiR5dBmg==
X-Google-Smtp-Source: ABdhPJwfj5QFKNrnmLhHknhNHNDuteX9JKlhhDvdG0CFxVyZMRpIv+KuMyWk3myJuifFPv1Lw+3h7Q==
X-Received: by 2002:a63:db01:: with SMTP id e1mr928254pgg.38.1621634649232;
        Fri, 21 May 2021 15:04:09 -0700 (PDT)
Received: from sujitka-glaptop.hsd1.ca.comcast.net ([2601:646:8e00:b2f0:22bd:8c3f:584d:d265])
        by smtp.gmail.com with ESMTPSA id z19sm6478752pjq.11.2021.05.21.15.04.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 May 2021 15:04:08 -0700 (PDT)
From:   Sujit Kautkar <sujitka@chromium.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>
Cc:     Rajendra Nayak <rnayak@codeaurora.org>,
        Doug Anderson <dianders@chromium.org>,
        Sibi Sankar <sibis@codeaurora.org>,
        Sujit Kautkar <sujitka@chromium.org>,
        Mark Rutland <mark.rutland@arm.com>,
        devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v2 0/2] Update sd card pinconf for sc7180 DT
Date:   Fri, 21 May 2021 15:02:45 -0700
Message-Id: <20210521220246.2017976-1-sujitka@chromium.org>
X-Mailer: git-send-email 2.31.1.818.g46aad6cb9e-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

This patch series contains change to move sdc pinconf from SoC specific
DT file to board specific DT file. It also contain change to set sdc
GPIO pin to bias-pull up

Tested sd card working on sc7180 based board

Changes in v2:
- added pull-up for IDP

Sujit Kautkar (2):
  arm64: dts: qcom: sc7180: Move sdc pinconf to board specific DT files
  arm64: dts: qcom: sc7180: trogdor: SD-card GPIO pin set bias-pull up

 arch/arm64/boot/dts/qcom/sc7180-idp.dts      | 102 +++++++++++++++++++
 arch/arm64/boot/dts/qcom/sc7180-trogdor.dtsi | 102 +++++++++++++++++++
 arch/arm64/boot/dts/qcom/sc7180.dtsi         | 102 -------------------
 3 files changed, 204 insertions(+), 102 deletions(-)

-- 
2.31.1.818.g46aad6cb9e-goog

