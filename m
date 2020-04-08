Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A2BC41A229E
	for <lists+linux-arm-msm@lfdr.de>; Wed,  8 Apr 2020 15:10:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729029AbgDHNKr (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 8 Apr 2020 09:10:47 -0400
Received: from mail-wm1-f67.google.com ([209.85.128.67]:35937 "EHLO
        mail-wm1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729016AbgDHNKr (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 8 Apr 2020 09:10:47 -0400
Received: by mail-wm1-f67.google.com with SMTP id d202so5394794wmd.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 08 Apr 2020 06:10:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=JYXlDfYBhiWgPgJU0Q/nJhdlPceCvlDUE/4GyWKcH6g=;
        b=QHL4MXPEljvtIQGjunB5zOVtcdXGVKmlw4SZOnXhxkT1G/idNJYDWnJFfBVSZA6ur3
         XLz9bz/BqDPWhdQatlMyK6MmtNW8HxbZeVjK0G1uqi7z9jMag7KM2wUrQWsgkoABLzNs
         oYhqehOttVSx8OlDnxRpDf36Pjdevb/n571RX6/ccykz1GdjpgOarVQkS4Bm9+QTsEy0
         UbUITpFmgxApWyw5xc28x/GA0O2u/y+CJhdZhLfIxQwoqqqjCYFGVNm594e3V6ypu9Lr
         UWvi+6+0ZKt423SaS92K/1Xh7qfhb+YaYr0a0RE4bUjQ2SNqU3UJArWVOsEbiLCXMGU4
         CArg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=JYXlDfYBhiWgPgJU0Q/nJhdlPceCvlDUE/4GyWKcH6g=;
        b=ZDcW80pbV782Axo88GBWtiFf2mE+BOyMmuOmURlgWYBaFC1Q/UZ5DrAz0y8WdJU8qd
         FVO9v7KQUyRLgrWF6obh+e6s+y9lggh9OeAPapbrL3eXMKr+sqJyryqezQ+CN8qKMOWs
         pGHL0/GCKqYU9j3jFbk3dp5MCTG5ORGuB+7Q1hcVY1FviCen1M4NTYWHBANxC3cpYf3B
         30WgvAHF6bewghqmeHNPRDQd6Q6pW/kP4zrxaGR66lzleuTdndk6TpENTWee6P0hngmI
         C6orRP3YVGeFiiFx6iPBgLFk/R0N5tF4BNwXf68kvl+gL7TTGUgKYuZS1n/xW3FmdDlq
         jFgA==
X-Gm-Message-State: AGi0PuZ9bQXi3G3Y7WM9UvzrCHjZDupyW85voQRX6Efm5eM5j2uAQ+r+
        NezzJqDIg+JsXfOsgR5XlucQlA==
X-Google-Smtp-Source: APiQypJze0ARzAXgLTH/rmOlQ2KeFXFto1u/pWx1vCgzC7LIu7QenfXc92GJkM+v/zzhBPo68YSeJA==
X-Received: by 2002:a1c:2c85:: with SMTP id s127mr4663487wms.18.1586351445367;
        Wed, 08 Apr 2020 06:10:45 -0700 (PDT)
Received: from localhost.localdomain ([37.120.50.78])
        by smtp.gmail.com with ESMTPSA id f4sm18428044wrp.80.2020.04.08.06.10.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Apr 2020 06:10:44 -0700 (PDT)
From:   Robert Foss <robert.foss@linaro.org>
To:     agross@kernel.org, bjorn.andersson@linaro.org, robh+dt@kernel.org,
        catalin.marinas@arm.com, will@kernel.org, shawnguo@kernel.org,
        leoyang.li@nxp.com, Anson.Huang@nxp.com, olof@lixom.net,
        leonard.crestez@nxp.com, geert+renesas@glider.be,
        marcin.juszkiewicz@linaro.org, valentin.schneider@arm.com,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        Loic Poulain <loic.poulain@linaro.org>,
        Luca Weiss <luca@z3ntu.xyz>
Cc:     Robert Foss <robert.foss@linaro.org>
Subject: [PATCH v4 0/6] Qualcomm CCI & Camera for db410c & db845c
Date:   Wed,  8 Apr 2020 15:09:53 +0200
Message-Id: <20200408130959.2717409-1-robert.foss@linaro.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

This series depends on the Qualcom CCI I2C driver series:
https://patchwork.kernel.org/project/linux-arm-msm/list/?series=267371

And the ov8856 device tree series:
https://patchwork.kernel.org/project/linux-arm-kernel/list/?series=268013

This series enables basic camera functionality on the Qualcomm db410c and
db845c (RB3) platforms.

This includes building drivers as modules, adding devicetree nodes
for camera controllers, clocks, regulators and sensor nodes.


Loic Poulain (2):
  arm64: dts: msm8916: Add i2c-qcom-cci node
  arm64: dts: apq8016-sbc: Add CCI/Sensor nodes

Robert Foss (4):
  arm64: dts: sdm845: Add i2c-qcom-cci node
  arm64: dts: sdm845-db845c: Add pm_8998 gpio names
  arm64: dts: sdm845-db845c: Add ov8856 & ov7251 camera nodes
  arm64: defconfig: Enable QCOM CAMCC, CAMSS and CCI drivers

 arch/arm64/boot/dts/qcom/apq8016-sbc.dtsi  |  76 ++++++++
 arch/arm64/boot/dts/qcom/msm8916.dtsi      |  27 +++
 arch/arm64/boot/dts/qcom/sdm845-db845c.dts | 204 +++++++++++++++++++++
 arch/arm64/boot/dts/qcom/sdm845.dtsi       |  92 ++++++++++
 arch/arm64/configs/defconfig               |   3 +
 5 files changed, 402 insertions(+)

-- 
2.25.1

