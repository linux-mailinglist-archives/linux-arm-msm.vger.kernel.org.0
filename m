Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CC25132D935
	for <lists+linux-arm-msm@lfdr.de>; Thu,  4 Mar 2021 19:06:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232797AbhCDSFc (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 4 Mar 2021 13:05:32 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52678 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233170AbhCDSFC (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 4 Mar 2021 13:05:02 -0500
Received: from mail-pl1-x62e.google.com (mail-pl1-x62e.google.com [IPv6:2607:f8b0:4864:20::62e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2CFC5C061756
        for <linux-arm-msm@vger.kernel.org>; Thu,  4 Mar 2021 10:04:22 -0800 (PST)
Received: by mail-pl1-x62e.google.com with SMTP id p5so16599973plo.4
        for <linux-arm-msm@vger.kernel.org>; Thu, 04 Mar 2021 10:04:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=uW/ly8R36o7aRCH1pKJ2ec9Gg0w/jrhSJacSJUXbtNI=;
        b=OTu7Nzya+v7xOsnReQljMa7XHYwQqT19wJYcyokB+WfuGTzk2iJbe5OJYCE011NTuY
         2ac3k9jCqbRL2xw3yEhMjIOfi+UBZ/zG3fnHjmz2vSiJF3HJ1Q9WsQaw6LKpVQY/wSvh
         DIPJ/V74dnrx8dmK/CfZJ18HjhGqETYokIalw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=uW/ly8R36o7aRCH1pKJ2ec9Gg0w/jrhSJacSJUXbtNI=;
        b=ZWNnFeBUHnDli9xVbVdxxwnOKP8n5eCmZt7gopwA38MaEkm2rFxXg7T/7glyGLLKhT
         ZYmK0CBLWHlv3vdSU9P7/zABBwTQG3ha3SUqhnHS3EInqHe6aibHXDfBhuoDqWWEd002
         BBhw8huCaeD6Jp63V8C8ph9oYY0BAdVblqV9cKbm/84sctruNbw+OJ8plMF9AqGWzjJo
         Dewr5mrNxZIort+++lsQ/LjG6heS1aceoly+9j0qOGdHnjp4hOr8o1mZ9osmZXIM3+Zj
         SRwGtB/D7ocYg1dsCAnz3QN1mtMqnO8qGOsFa5wZY0mvdIL8Ne3+HZL8bVeqGUSjD5Lb
         H0RQ==
X-Gm-Message-State: AOAM532lv3iqSRq1+kmLmbTh29tnb6gFyxhThEXi92vVAJ9x1rEXMCPD
        NZEuVm+GQS4q+njwBQKzKKABdw==
X-Google-Smtp-Source: ABdhPJxy/Z1wlG3cjYD774SKGDvUsmM+GURdyu24UUWgcBt1J2aXa6lMqUAcTHAjMFsGXqBUOB/6hQ==
X-Received: by 2002:a17:903:31c6:b029:e5:d0a4:97cc with SMTP id v6-20020a17090331c6b02900e5d0a497ccmr4995282ple.52.1614881061745;
        Thu, 04 Mar 2021 10:04:21 -0800 (PST)
Received: from localhost ([2620:15c:202:1:69fe:a9f8:ca53:af2b])
        by smtp.gmail.com with UTF8SMTPSA id s18sm69746pfm.129.2021.03.04.10.04.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 04 Mar 2021 10:04:21 -0800 (PST)
From:   Matthias Kaehlcke <mka@chromium.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>
Cc:     Douglas Anderson <dianders@chromium.org>,
        devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, Matthias Kaehlcke <mka@chromium.org>
Subject: [PATCH 0/4] arm64: dts: qcom: sc7180: Disable the charger thermal zone on more trogdor boards
Date:   Thu,  4 Mar 2021 10:04:11 -0800
Message-Id: <20210304180415.1531430-1-mka@chromium.org>
X-Mailer: git-send-email 2.30.1.766.gb4fecdf3b7-goog
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


Matthias Kaehlcke (4):
  arm64: dts: qcom: sc7180: lazor: Simplify disabling of charger thermal
    zone
  arm64: dts: qcom: sc7180: Add pompom rev3
  arm64: dts: qcom: sc7180: pompom: Disable charger thermal zone for
    rev1 and rev2
  arm64: dts: qcom: sc7180: Disable charger thermal zone for coachz rev1
    and rev2

 .../dts/qcom/sc7180-trogdor-coachz-r1.dts     |  9 ++++
 .../dts/qcom/sc7180-trogdor-coachz-r2.dts     |  9 ++++
 .../boot/dts/qcom/sc7180-trogdor-lazor-r0.dts |  9 ----
 .../boot/dts/qcom/sc7180-trogdor-lazor-r1.dts |  9 ----
 .../boot/dts/qcom/sc7180-trogdor-lazor-r3.dts |  9 ----
 .../boot/dts/qcom/sc7180-trogdor-lazor.dtsi   |  9 ++++
 .../dts/qcom/sc7180-trogdor-pompom-r1.dts     |  9 ++++
 .../dts/qcom/sc7180-trogdor-pompom-r2-lte.dts |  4 +-
 .../dts/qcom/sc7180-trogdor-pompom-r2.dts     | 13 +++++-
 .../dts/qcom/sc7180-trogdor-pompom-r3-lte.dts | 14 ++++++
 .../dts/qcom/sc7180-trogdor-pompom-r3.dts     | 46 +++++++++++++++++++
 11 files changed, 109 insertions(+), 31 deletions(-)
 create mode 100644 arch/arm64/boot/dts/qcom/sc7180-trogdor-pompom-r3-lte.dts
 create mode 100644 arch/arm64/boot/dts/qcom/sc7180-trogdor-pompom-r3.dts

-- 
2.30.1.766.gb4fecdf3b7-goog

