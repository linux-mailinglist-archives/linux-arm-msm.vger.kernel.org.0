Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 154BF18180F
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Mar 2020 13:35:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729318AbgCKMfI (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 11 Mar 2020 08:35:08 -0400
Received: from mail-wm1-f67.google.com ([209.85.128.67]:37088 "EHLO
        mail-wm1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729232AbgCKMfH (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 11 Mar 2020 08:35:07 -0400
Received: by mail-wm1-f67.google.com with SMTP id a141so1933424wme.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 11 Mar 2020 05:35:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=kaarF50dxbS3Z8Mh0BzIdcf7YKpiLwN04fKYbKDEJfo=;
        b=mTSFsTwTgQ395aAGTlSYACy3RpEti3lHZ/SdKLzuPJUEhPFwgtcD/0x7JD1LmsEyLz
         vLr8lEFv/uOg5+Hi5xuDDqecCPjxNi02fn6naqQ5/M/q4Q36F88RiOq/ovCCK48Ar+Dc
         0P34UBq5R1Jexx3KgTxx4vBU5PM8e/XP45Dxnf6oz2y0ZKKS2nAfn4tCxyECf+0moQgl
         DBaHI3o9o7jlpRQNCThE0/fSZpqYxbOA8VJE7eSxzaBnqfo+wHr/D/bQrHnsfazug5gC
         5j4YTLOoliD+IuU/K2E8FRl51ekJyN3da0utLjH0xJ/aWYgNoW9EyzQas3GGEipaYAQm
         Vosg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=kaarF50dxbS3Z8Mh0BzIdcf7YKpiLwN04fKYbKDEJfo=;
        b=QNxzU8lsXfPwBAPhai1pkHov5ka+x9vOgCKJIoS3h23QMQUn8S5KPl7iln35dGvSFz
         d1+PjzjHK8lX1me09sbpkhZBisoTkuu8N9J4aZ+mmWr2K97jymokkorgGu4vh23KgO3p
         N2uGn5AjZ8JcBk8T+7LrTLWGI2fSRA+5xYf5X+242eSabVMfxMbbUOjwoamgcDjkMWrI
         RWoDxghw+ZtcOIL1KSjokvWkySyb8SFFBbvqQtF5eGujbkYerFvDRWxtQQIAShBpLfve
         G2AfVm4XDApXoxQKqICEOpyFtsX933RLopoYLs+91TzN7y4zCQ7lRTjyaLMVVK9iu1fP
         mqrw==
X-Gm-Message-State: ANhLgQ1tIgLKtULRWYoAUqQYW4Wh3SWjnNy0RixzoO+BfJGc+7bYQtrm
        Qier8fhXhxzxym9zJKV90jHAT3NcEd5TwQ==
X-Google-Smtp-Source: ADFU+vtijpANu3z4d1JWR353H0zygtSe8oto36au5GoaVFlUBSvVn7Jemj9lTKV4zXVdPkwgCr0WiQ==
X-Received: by 2002:a7b:c5cd:: with SMTP id n13mr3676317wmk.172.1583930105627;
        Wed, 11 Mar 2020 05:35:05 -0700 (PDT)
Received: from xps7590.local ([2a02:2450:102f:13b8:9087:3e80:4ebc:ae7b])
        by smtp.gmail.com with ESMTPSA id m25sm7822732wml.35.2020.03.11.05.35.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Mar 2020 05:35:04 -0700 (PDT)
From:   Robert Foss <robert.foss@linaro.org>
To:     agross@kernel.org, bjorn.andersson@linaro.org, robh+dt@kernel.org,
        mark.rutland@arm.com, catalin.marinas@arm.com, will@kernel.org,
        shawnguo@kernel.org, olof@lixom.net, Anson.Huang@nxp.com,
        maxime@cerno.tech, leonard.crestez@nxp.com, dinguyen@kernel.org,
        marcin.juszkiewicz@linaro.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        Loic Poulain <loic.poulain@linaro.org>
Cc:     Robert Foss <robert.foss@linaro.org>
Subject: [v1 0/6] Qualcomm CCI & Camera for db410c & db845c
Date:   Wed, 11 Mar 2020 13:34:55 +0100
Message-Id: <20200311123501.18202-1-robert.foss@linaro.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

This series depends on the Qualcom CCI I2C driver series:
https://patchwork.kernel.org/cover/10569957/

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

 arch/arm64/boot/dts/qcom/apq8016-sbc.dtsi  |  75 ++++++
 arch/arm64/boot/dts/qcom/msm8916.dtsi      |  27 ++
 arch/arm64/boot/dts/qcom/sdm845-db845c.dts | 273 +++++++++++++++++++++
 arch/arm64/boot/dts/qcom/sdm845.dtsi       | 110 +++++++++
 arch/arm64/configs/defconfig               |   4 +
 5 files changed, 489 insertions(+)

-- 
2.20.1

