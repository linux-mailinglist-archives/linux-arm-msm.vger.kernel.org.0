Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0BEE31A3E44
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Apr 2020 04:32:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726654AbgDJCc3 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 9 Apr 2020 22:32:29 -0400
Received: from mail-lj1-f195.google.com ([209.85.208.195]:35156 "EHLO
        mail-lj1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725987AbgDJCc2 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 9 Apr 2020 22:32:28 -0400
Received: by mail-lj1-f195.google.com with SMTP id k21so645431ljh.2;
        Thu, 09 Apr 2020 19:32:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=y3VuxceYuEUUlJsbYBT7SQXo9zQ5iQB9Y65lJ+IT+0s=;
        b=RN6/Ni2BXsBtK60cMaFyG/qYNltbZKbNIld95U5YHLMY51fIXy7oPfDZDv2mSVGJ4p
         rpLHorAKjOq8+999QQTP2hgv+cMDzOBjE3nvO8++4Dh2nDs8GetMz53s5fUUIKlSsJ9Y
         yx9yjlMDtYpA6hamMYh8ME7RwlM1T0gCntzANMbnEftLUB/XZdfYexRI5PaWq/mkKZ25
         WAr7HEh9HX3msHVF0Bv8Nc3P96BgknOyIdLkgSexXUJvz7IZpFUyxUHtIkfx25tF0NKU
         VYIL9WgVL8CSA3fRtB9fVSPzyYYCy4gxcOrE28vNAnBkcVoUdLjHdFzzPD/FXoDHjY01
         WxTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=y3VuxceYuEUUlJsbYBT7SQXo9zQ5iQB9Y65lJ+IT+0s=;
        b=Kp33NVhnojmKjtPzm/llHPIXJO5v8b1pvn+ettemQsTxcCvJsqz881ST5kwDlbbNIs
         +O6HejSeSa7jkRnHj14NSCUE8nB+U80umtgZg5yBJ5oGFdnzMSltrTbGSUoOKV2SR57O
         FS1w0MOwbt/f+WWgCCHZTa/fYCFCv6yBz9kA2MmrvA4RBpFbrC0CbwrBPKi+D1hUiOgj
         lmwoRkyl574CdZjE8BtIm1Mr+DtyZaP8AuVq6jIv9pShyjprhgwu6CuzOdFKKVGdCm/h
         rlh2Ta7eq8gfMYdFgrmW34QaSFXSFo8Bdu1IOtZiX/zkSdbWC4X1mP9NPzVIeN4Trnzk
         DjZg==
X-Gm-Message-State: AGi0PuZN8ZP3xl6Tk/TeDN6RlL8yTcDoxoA3lOrxlAAkrKr1y70kbZac
        y+jGdOZIJhQ1vM1WrEJ2OmmgLohFzI0efg==
X-Google-Smtp-Source: APiQypIx8CFN4xqw68wn5cEbI6oAXg1tBkEPgcd+6ZzS9ngznUkbyOVL85jVqJyAt3Udn3B4Bj8qDQ==
X-Received: by 2002:a05:651c:c4:: with SMTP id 4mr1688699ljr.121.1586485944441;
        Thu, 09 Apr 2020 19:32:24 -0700 (PDT)
Received: from localhost ([213.191.183.145])
        by smtp.gmail.com with ESMTPSA id g9sm427427lfc.24.2020.04.09.19.32.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 09 Apr 2020 19:32:23 -0700 (PDT)
From:   Iskren Chernev <iskren.chernev@gmail.com>
To:     linux-arm-msm@vger.kernel.org
Cc:     Daniele Debernardi <drebrez@gmail.com>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        ~postmarketos/upstreaming@lists.sr.ht,
        Iskren Chernev <iskren.chernev@gmail.com>
Subject: [PATCH 0/6] ARM: dts: qcom: klte: Add support for hw keys, flash and usb
Date:   Fri, 10 Apr 2020 05:31:57 +0300
Message-Id: <20200410023203.192048-1-iskren.chernev@gmail.com>
X-Mailer: git-send-email 2.26.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Enable support for gpio-keys (volume up/down + home), internal flash storage
(sdhci), and usb (for usb-ethernet) for the Samsung Galaxy S5, codename klte.

Daniele Debernardi (6):
  ARM: dts: qcom: msm8974: Add pma8084 regulator node
  ARM: dts: qcom: msm8974-klte: Add regulator nodes
  ARM: dts: qcom: msm8974-klte: Add gpio-keys nodes
  ARM: dts: qcom: msm8974-klte: Add sdhci1 node
  ARM: dts: qcom: msm8974-klte: Remove inherited vreg_boost node
  ARM: dts: qcom: msm8974-klte: Add USB node

 .../boot/dts/qcom-msm8974-samsung-klte.dts    | 286 +++++++++++++++++-
 arch/arm/boot/dts/qcom-msm8974.dtsi           |  53 ++++
 2 files changed, 337 insertions(+), 2 deletions(-)


base-commit: 873e37a44b1ee8ad4628ca257dc51c0c7c654326
--
2.26.0

