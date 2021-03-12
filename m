Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EAB4D338256
	for <lists+linux-arm-msm@lfdr.de>; Fri, 12 Mar 2021 01:33:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231395AbhCLAcf (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 11 Mar 2021 19:32:35 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48236 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229636AbhCLAcP (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 11 Mar 2021 19:32:15 -0500
Received: from mail-oo1-xc36.google.com (mail-oo1-xc36.google.com [IPv6:2607:f8b0:4864:20::c36])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 48AA1C061574
        for <linux-arm-msm@vger.kernel.org>; Thu, 11 Mar 2021 16:32:15 -0800 (PST)
Received: by mail-oo1-xc36.google.com with SMTP id c13-20020a4ab18d0000b02901b5b67cff5eso1135991ooo.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 11 Mar 2021 16:32:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=XxSa1u7IyhhucY0ze3n3dBYIqxQ4tI9IFhWrRdx0ULk=;
        b=zWgt1QAsksXwn37LZRT7NIO21xaLAynJ+w5PvmhbectrWotS+n50h0x+Uo5GlhZGiJ
         V4ecIoUP/8fA+uao7odaE+Rhx5x+K7qQ1mGlL3Le3aP2dhIFEB1XDJG4UPW0pMIZKQ39
         2H/RnWfSRrzxf3Shoi0y6i+x3yNXBKQUqLqbjMV/kU2qUb8HxdOVOjLnV50DHurc1fzb
         504DbhhatvTwPWNfMb8OD0DQRcAsIBvigp9+7bLvl8FfzFX3AbpYyeICSfXiZc+2rYw6
         ZePy/D6tmeber9lr/OekoFWDUkpLv+DPWDo21xUItVFCbqa778Zh9dnJ/5TQ/KM8rolB
         K7mA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=XxSa1u7IyhhucY0ze3n3dBYIqxQ4tI9IFhWrRdx0ULk=;
        b=QnFJZNDvagjkSnYlQOzSvr+w9uOtHjzlSRwhmwJz6CFx3sxZoaea1DTzXyXSEX/jYZ
         EFEOJdM7c5cu9Atopbfq/bPthuc62c4FqR4PrGuuPUVCD1IlQz63K0NaFH2ZIRX9TaK0
         1jMC6QdS4zNyu0P7GMXnjjFoCzm9PRUvrNLIkABAH/Ven9+xR6RLsOwiV2XDAPt/GmjW
         vKn6TTMyfAMdgqwNTZlcS/nKwiQPrZPFlhQznufgRPD7Qh5GDnxmJ+R9jw4Y5s3CPb5T
         FYUe0r7Xrop97TaU7C7d1z+NJidV8PUfSjQo5wZmH7/gqq0QuCF6MAJhptEMBhZZqUq9
         t1QQ==
X-Gm-Message-State: AOAM533UJYps+sn/xdYNByczDKG8eZg+r6939VbV+immJOZK/AQPBIV2
        w1pVLXyU+ZeGuJzC5ESFsKSyU6UyUHycYQ==
X-Google-Smtp-Source: ABdhPJz6UIt7SjxfugwIFCAKdOTG8YHF2em4Ltec3Ma2jacxcarQZOOzmo/0z43hYlYZv20QAiPhkA==
X-Received: by 2002:a4a:dc51:: with SMTP id q17mr1259347oov.76.1615509134671;
        Thu, 11 Mar 2021 16:32:14 -0800 (PST)
Received: from localhost.localdomain (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id l190sm670835oig.39.2021.03.11.16.32.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Mar 2021 16:32:14 -0800 (PST)
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Kalle Valo <kvalo@codeaurora.org>,
        "David S. Miller" <davem@davemloft.net>,
        Jakub Kicinski <kuba@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, wcn36xx@lists.infradead.org,
        linux-wireless@vger.kernel.org, netdev@vger.kernel.org
Subject: [PATCH 0/5] qcom: wcnss: Allow overriding firmware form DT
Date:   Thu, 11 Mar 2021 16:33:13 -0800
Message-Id: <20210312003318.3273536-1-bjorn.andersson@linaro.org>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The wireless subsystem found in Qualcomm MSM8974 and MSM8916 among others needs
platform-, and perhaps even board-, specific firmware. Add support for
providing this in devicetree.

Bjorn Andersson (5):
  dt-bindings: soc: qcom: wcnss: Add firmware-name property
  wcn36xx: Allow firmware name to be overridden by DT
  soc: qcom: wcnss_ctrl: Introduce local variable "dev"
  soc: qcom: wcnss_ctrl: Allow reading firmware-name from DT
  arm64: dts: qcom: msm8916: Enable modem and WiFi

 .../devicetree/bindings/soc/qcom/qcom,wcnss.txt   |  7 +++++++
 arch/arm64/boot/dts/qcom/apq8016-sbc.dtsi         | 12 ++++++++++++
 arch/arm64/boot/dts/qcom/msm8916.dtsi             |  2 +-
 drivers/net/wireless/ath/wcn36xx/main.c           |  7 +++++++
 drivers/net/wireless/ath/wcn36xx/smd.c            |  4 ++--
 drivers/net/wireless/ath/wcn36xx/wcn36xx.h        |  1 +
 drivers/soc/qcom/wcnss_ctrl.c                     | 15 ++++++++++-----
 7 files changed, 40 insertions(+), 8 deletions(-)

-- 
2.29.2

