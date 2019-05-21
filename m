Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2FC5625606
	for <lists+linux-arm-msm@lfdr.de>; Tue, 21 May 2019 18:49:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728581AbfEUQth (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 21 May 2019 12:49:37 -0400
Received: from mail-pl1-f193.google.com ([209.85.214.193]:35905 "EHLO
        mail-pl1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727817AbfEUQth (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 21 May 2019 12:49:37 -0400
Received: by mail-pl1-f193.google.com with SMTP id d21so8722314plr.3;
        Tue, 21 May 2019 09:49:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id;
        bh=v2SnYdg7A+KRf1CirjBXBSRjCuSa5ZCNOU/wWwgCIfk=;
        b=Ddep7DyHe5OsovWNiAt9kTIMBQlef/9LvJA19PYauVxiR02nikKb24vzLGi03F7nsN
         T2V6VOpn+2U+RJicJhJatRRwwq+azLcIwsHclxn81zlRcai3UATILn6cxNnxzZV/5ehR
         Bu3VpJ6zqJUnJD1T7k2/U+eJTy4iNZg4xoSO25YWBpbTJW9MizL1zJb0hfYqcBUbh1om
         UTxzOpSjyh9aorCUnS7hb3qFRtytTckbMZugXBTXBLRcTpIwnsM/pLy9FuLME7FYojIK
         hA/YL9CdX9tR3PrsCv5SI7noKMNDtvgGrxWGXve6/d66D0l3XoTicIH89o1pUS7QchMo
         bNVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=v2SnYdg7A+KRf1CirjBXBSRjCuSa5ZCNOU/wWwgCIfk=;
        b=LZbjSW/Ytxhz7PXEaWtzcDNCaoYMweuTamvfijHAY3fLMiVS12tvRz0cLBp8h+nbwt
         VvomViT4z2LrV56DO0V9/c8aFE8qdXMNfz9BZqMTY63FZGhERC8jRwmQ5rlQEMJNMMFr
         xrrRX5MtJS8swqnWA0NMRaQdi8z8BtHTG/3OWTyu4pMjMeWGLI3Y1bRL8rdquWIpK1q1
         9ARs+1TBMPiu+/t1XwXCCXeZCl3haZlEC5dkIEFTxZ86D7qhbJZdNIIeGjDDXv0PShTj
         DPXHgc3fjjP1RugqXRAp7m1yGwRt8K+0B5dRJUzaFsUs1H1ECnR2yFihRAlCZJ1w8sFE
         H/Xg==
X-Gm-Message-State: APjAAAVNRLCI/x7zpXQgp2D0xN/0L1JId7H988JKGGFlOK6RPOO4qfyt
        u8PBgBJ7MGpD/qpCG7dZb6Y=
X-Google-Smtp-Source: APXvYqzvYTYoKR4keXPH4jiYbPWg9Rfb6ADPPLBY7qhfTOKHapIWHpV+sbFumzLUsWLGsvVb034/Ng==
X-Received: by 2002:a17:902:2a2b:: with SMTP id i40mr83744999plb.170.1558457376769;
        Tue, 21 May 2019 09:49:36 -0700 (PDT)
Received: from aw-bldr-10.qualcomm.com (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id o7sm32411008pfp.168.2019.05.21.09.49.35
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 21 May 2019 09:49:36 -0700 (PDT)
From:   Jeffrey Hugo <jeffrey.l.hugo@gmail.com>
Cc:     agross@kernel.org, david.brown@linaro.org,
        bjorn.andersson@linaro.org, jcrouse@codeaurora.org,
        lgirdwood@gmail.com, broonie@kernel.org, robh+dt@kernel.org,
        mark.rutland@arm.com, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Jeffrey Hugo <jeffrey.l.hugo@gmail.com>
Subject: [PATCH 0/3] PM8005 regulator support for msm8998 GPU
Date:   Tue, 21 May 2019 09:49:32 -0700
Message-Id: <20190521164932.14265-1-jeffrey.l.hugo@gmail.com>
X-Mailer: git-send-email 2.17.1
To:     unlisted-recipients:; (no To-header on input)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The MSM8998 MTP reference platform supplies VDD_GFX from s1 of the
pm8005 PMIC.  VDD_GFX is needed to turn on the GPU.  As we are looking
to bring up the GPU, add the support for pm8005 and wire up s1 in a
basic manner so that we have this dependency out of the way and can
focus on enabling the GPU driver.

Jeffrey Hugo (3):
  dt-bindings: qcom_spmi: Document PM8005 regulators
  regulator: qcom_spmi: Add support for PM8005
  arm64: dts: msm8998-mtp: Add pm8005_s1 regulator

 .../regulator/qcom,spmi-regulator.txt         |   4 +
 arch/arm64/boot/dts/qcom/msm8998-mtp.dtsi     |  17 ++
 drivers/regulator/qcom_spmi-regulator.c       | 203 +++++++++++++++++-
 3 files changed, 219 insertions(+), 5 deletions(-)

-- 
2.17.1

