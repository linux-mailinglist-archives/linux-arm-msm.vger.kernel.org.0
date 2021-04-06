Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A393B3549E4
	for <lists+linux-arm-msm@lfdr.de>; Tue,  6 Apr 2021 03:09:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232990AbhDFBKB (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 5 Apr 2021 21:10:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38432 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232868AbhDFBJ6 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 5 Apr 2021 21:09:58 -0400
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com [IPv6:2a00:1450:4864:20::12d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4F693C06174A;
        Mon,  5 Apr 2021 18:09:50 -0700 (PDT)
Received: by mail-lf1-x12d.google.com with SMTP id g8so20031062lfv.12;
        Mon, 05 Apr 2021 18:09:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=kZ3de3tHen+IrX3s32+0iqjXHxQleXCQQZ+cp0UblkE=;
        b=jxajCkzIrE8XykpxOIdp7IU4la7tB63+21UtPEbQA6zAIvhg1hM76GTOMCTU//IVjM
         dGyp5wKw2TegtExUVrQFZHLhI+JBTDhQmjinK6IDH2c46knoCE4o56eXUWTNLycRaJ8E
         9Y4Jxh/VKmNQy+oH5th4GF7aexIcS6LVkqWXJy8g0FkCUvRwO0IuhNmcpCyyCqPAnon4
         h/+SthZpx/mBedvSJNWPI3ogWrZcmB7LZ2vDMgbCqhaX6zEjHW2DU6OgLcnjOdREtJJc
         IlmOWApDJVPmoHAly/dCc5SVrAoqFXaoMtw6bn/8ZGCB/STwnk/D0QeGiqUEFltpCtSd
         0j/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=kZ3de3tHen+IrX3s32+0iqjXHxQleXCQQZ+cp0UblkE=;
        b=ttvldcbxDg2WuOmwMWaErxO6Il9FSLoJ9WVmVCL9IE5JgMGoiJ+oK/VzY6P+ocCsxt
         BZGaU7YW1nCDAFof/58lXuylITdCVApfJfxx2W6UviHBq7rMTxsWTnNl1KCmtC+Md908
         Oo9rnkWXYpVdUtOh8j2kYKLcUa70O/JJTarOH0v87xBecBfMtFrpPGr00gQJ3vu5Inzx
         Frq5jeU9e4x+hvLFlC9r/dxuKRA/vM4RLJTUpBL+KP/bawsl5C49XFJSNjB7R15LO01d
         KEBgm4CGPm817Fr6Tntm/ZLCsiP/9bLgOOAP/hX5FWTnhfnmlOsA7qq/7l559SNRB2Gd
         aHWQ==
X-Gm-Message-State: AOAM532GK0YsDH6IXMnBoS2Hgvvee8tA8sKPAo78SWM608T/wIAGaM89
        OL1x6gliRSQOeuBmP39QNJWV3jmzlvo=
X-Google-Smtp-Source: ABdhPJxkecmgjPNtGBwQxxVaji6peqSnx34Qq6kwP9Sx63ty3AeECtOtSgI8ciRiOctgnXuhboFWtg==
X-Received: by 2002:ac2:490b:: with SMTP id n11mr18511886lfi.491.1617671388853;
        Mon, 05 Apr 2021 18:09:48 -0700 (PDT)
Received: from Ryzen-Workstation.localdomain (df76-hyyyyyyyyyyyyyct-3.rev.dnainternet.fi. [2001:14ba:26f5:f300::5])
        by smtp.googlemail.com with ESMTPSA id p24sm1948063lfj.76.2021.04.05.18.09.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Apr 2021 18:09:48 -0700 (PDT)
From:   Jami Kettunen <jamipkettunen@gmail.com>
To:     phone-devel@vger.kernel.org
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, agross@kernel.org,
        bjorn.andersson@linaro.org, robh+dt@kernel.org,
        keescook@chromium.org, anton@enomsg.org, ccross@android.com,
        tony.luck@intel.com, ~postmarketos/upstreaming@lists.sr.ht,
        konrad.dybcio@somainline.org, martin.botka@somainline.org,
        angelogioacchino.delregno@somainline.org,
        marijn.suijten@somainline.org
Subject: OnePlus 5/5T support
Date:   Tue,  6 Apr 2021 04:07:06 +0300
Message-Id: <20210406010708.2376807-1-jamipkettunen@gmail.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add device trees for OnePlus 5 (cheeseburger) and 5T (dumpling)
MSM8998 SoC smartphones.

v2:
-License DT under BSD-3-Clause instead of GPL-2.0
-Drop MSS remoteproc node in favor of disabling it by default (see patch 2/2)
-Shorten and move Wi-Fi disable comment inside wifi node

Jami Kettunen (2):
  arm64: dts: qcom: Add support for OnePlus 5/5T
  arm64: dts: qcom: msm8998: Disable MSS remoteproc by default

 arch/arm64/boot/dts/qcom/Makefile             |   2 +
 .../boot/dts/qcom/msm8998-clamshell.dtsi      |   4 +
 arch/arm64/boot/dts/qcom/msm8998-mtp.dtsi     |   4 +
 .../dts/qcom/msm8998-oneplus-cheeseburger.dts |  42 ++
 .../boot/dts/qcom/msm8998-oneplus-common.dtsi | 514 ++++++++++++++++++
 .../dts/qcom/msm8998-oneplus-dumpling.dts     |  25 +
 arch/arm64/boot/dts/qcom/msm8998.dtsi         |   2 +
 7 files changed, 593 insertions(+)

