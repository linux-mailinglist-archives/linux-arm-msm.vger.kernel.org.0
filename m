Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9AABC37124C
	for <lists+linux-arm-msm@lfdr.de>; Mon,  3 May 2021 10:13:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230186AbhECIOg (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 3 May 2021 04:14:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51144 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229817AbhECIOg (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 3 May 2021 04:14:36 -0400
Received: from mail-pl1-x634.google.com (mail-pl1-x634.google.com [IPv6:2607:f8b0:4864:20::634])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C1BFDC06138B
        for <linux-arm-msm@vger.kernel.org>; Mon,  3 May 2021 01:13:43 -0700 (PDT)
Received: by mail-pl1-x634.google.com with SMTP id p17so2377286plf.12
        for <linux-arm-msm@vger.kernel.org>; Mon, 03 May 2021 01:13:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id;
        bh=6l3WZj3YpLSLYBE9dlRHMNdaDR40xxIBOfhqWp69mbg=;
        b=PxTG76pbMhf9gDZV9ObsYKFQOAHw3xCIumGo/a5UrFjqweBEA3ARHUIr3/9jLyUlfM
         ihk2yhBP3z0vCBj6hSOhGNqqHBbn0s7WEbmJ1w0ajHwEpeXL7ByX6+k0TtOC7VPI0urq
         Qt7+bOBU+/qfGiyjdsO2aQ8H95K/ylJBj7g9tds5xvAe+yALmRNCMxv3JJqsw5VtG1bu
         cvUTA1i5jsX9J5Xsv5230RGN4hifxksYC/1/ZTwQjIHK2zmfXPFuoZpYK6f1zNADs4Gv
         ok4+5PbbceFwsfUrz9Fdbivp86VXarUJTNUGO8Y7CXU/oDn7ckFCIEkuqpUZABDrwmsu
         Qygw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=6l3WZj3YpLSLYBE9dlRHMNdaDR40xxIBOfhqWp69mbg=;
        b=EnUrm4Cw0CZ4BbpIrHfMwtgJViR4gV9AO5LKkDwqSlSCDA0/pCb4pnc3/H5UWiOwnr
         tVIIF828QqaIbQ33iKQ8gTiY5INaNltKvWvpvLno5dyUzJ1gqpgnNOSmtdaXOOjvH5EC
         4jfkqLl7WnGCaOd4N+vGb/MgaBzlDteNoxraBe+vJWDI8YjMlNfkJ32j2vUMU7+QaivY
         JnvXeLvrLT3qa3vaKbuiEON79D9lyFA1Xu9Sx69Vi8fa4cvwQuqoJ68/dcfgXOQF01gR
         2D3/qZou2ZTmG73pZAJjN56PreHHrfPGHSV2d42fyQW4Rr/T1a8Pm1py475evCS5NqZo
         3Nmg==
X-Gm-Message-State: AOAM532rSAhgcp/5ZhcgKhUKPbqT+6WVjWDDfN2iX28KBv/R4tOh/7lw
        9FiUmPmAdX3saqDXG47haNcAvg==
X-Google-Smtp-Source: ABdhPJyYPZ8CccDF4nlBAWOKglRbYMUGeH0Fb356HueluTIFPNGSI1/AsIO6EDgbSlp3Son4BOcPTQ==
X-Received: by 2002:a17:902:b28b:b029:ed:19aa:5dec with SMTP id u11-20020a170902b28bb02900ed19aa5decmr19812693plr.78.1620029623187;
        Mon, 03 May 2021 01:13:43 -0700 (PDT)
Received: from localhost.localdomain (80.251.214.228.16clouds.com. [80.251.214.228])
        by smtp.gmail.com with ESMTPSA id fa17sm12031939pjb.17.2021.05.03.01.13.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 May 2021 01:13:42 -0700 (PDT)
From:   Shawn Guo <shawn.guo@linaro.org>
To:     Jassi Brar <jassisinghbrar@gmail.com>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Sivaprakash Murugesan <sivaprak@codeaurora.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Benjamin Li <benl@squareup.com>, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Shawn Guo <shawn.guo@linaro.org>
Subject: [PATCH v2 0/2] Add MSM8939 APCS support
Date:   Mon,  3 May 2021 16:13:32 +0800
Message-Id: <20210503081334.17143-1-shawn.guo@linaro.org>
X-Mailer: git-send-email 2.17.1
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

It's a series to add MSM8939 APCS support into qcom mailbox driver.

Changes for v2:
 - Add MSM8939 APCS compatible.
 - Reword commit log.
 - Add Bjorn's Reviewed-by tag.

v1: https://lkml.org/lkml/2020/10/12/1770

Shawn Guo (2):
  dt-bindings: mailbox: qcom: Add MSM8939 APCS compatible
  mailbox: qcom: Add MSM8939 APCS support

 .../devicetree/bindings/mailbox/qcom,apcs-kpss-global.yaml     | 1 +
 drivers/mailbox/qcom-apcs-ipc-mailbox.c                        | 3 ++-
 2 files changed, 3 insertions(+), 1 deletion(-)

-- 
2.17.1

