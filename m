Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 927863B0E0F
	for <lists+linux-arm-msm@lfdr.de>; Tue, 22 Jun 2021 22:05:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232236AbhFVUHt (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 22 Jun 2021 16:07:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38174 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231597AbhFVUHt (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 22 Jun 2021 16:07:49 -0400
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com [IPv6:2a00:1450:4864:20::629])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B1C53C061574;
        Tue, 22 Jun 2021 13:05:32 -0700 (PDT)
Received: by mail-ej1-x629.google.com with SMTP id ho18so257846ejc.8;
        Tue, 22 Jun 2021 13:05:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=9sEyzusIpIoy6ANws7r+aDKjofKDHA4aYLWNi0lUzC8=;
        b=rHbE31+btfAAqxgvgAYEL2ibYvqiem8S6X4P8lh5BLYvA7EYnc0euBDI9TFLyrA+Yj
         jm9NNGM+0U0O52SIi2AZsn/xFIeb+PnIkdN9j/FBuVKYUAnwh5hbSy6FP/DnVz25Qimi
         iVHboShrzhkbl2hDkwIfaA5fDM1s+3IqbOBdNOKOTWTFQVADJgUZUTyVYlK/NTF/TSVW
         0XGWuEY3Ycn+j1lmxScVplQxdCXvMr6/8LDDGHD/gsixa1KV0GMfq1qO79FDT9iD4b1B
         Eol2ez+r7t05FbLZpUdhwLhkalBvbs+ZVX1ktJTADBd5tNRRcZza+UbPbt+AKmQQFayN
         cKAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=9sEyzusIpIoy6ANws7r+aDKjofKDHA4aYLWNi0lUzC8=;
        b=q+FtQ6FSG+OPaFmahtYZae2KSX9XUomg9z9qv0zOFGpB7hX86AHFmJG9PAN1hv1WF5
         42uL2n4Qjx+xLTFAq1RprL7I6dVtzNfy2n/ypvObzaX/7l9HkmHrjFn38cj8zH5A74rd
         cFLSzhhH+jcUqwdR19A/lsSmok4z/yoSTgXH+ot3u3r+8Pxi34+586d0cMhorlmQfLQC
         AP8EBACHR2l8LL6q+q82lBc7tENHH6go2WOKG3CweRSFYbQnNDOGFE4VMdpjAo8JclkP
         zh7aRiPmeGcDtPscDzI7mLesa8CYooECKtiuyB6pTpmHNXefME992oFLdTsgVg+/d8nM
         yfIw==
X-Gm-Message-State: AOAM533nkNWWBvlmTzaj3jV2k5VQ8Fa7ndLqCAHrshhZEId7dyGzigS0
        86NG4jt2aOnAXrsnwDV4ZMw=
X-Google-Smtp-Source: ABdhPJwwteP3LmrIsB8wx1COQ/ortvzt7nJzuBnDlKy1aTPseYVJrs2NgyFYUx/YcKRaVSn8jdX1qg==
X-Received: by 2002:a17:906:5294:: with SMTP id c20mr5917072ejm.76.1624392331352;
        Tue, 22 Jun 2021 13:05:31 -0700 (PDT)
Received: from localhost (178-169-161-196.razgrad.ddns.bulsat.com. [178.169.161.196])
        by smtp.gmail.com with ESMTPSA id a2sm6468972ejp.1.2021.06.22.13.05.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 22 Jun 2021 13:05:30 -0700 (PDT)
From:   Iskren Chernev <iskren.chernev@gmail.com>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     Andy Gross <agross@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, phone-devel@vger.kernel.org,
        ~postmarketos/upstreaming@lists.sr.ht,
        Iskren Chernev <iskren.chernev@gmail.com>
Subject: [PATCH v1 0/2] Add GCC for SM4250 and SM6115
Date:   Tue, 22 Jun 2021 23:05:06 +0300
Message-Id: <20210622200508.525669-1-iskren.chernev@gmail.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

This patch adds support for the Global Clock Controller on QCom SM4250 and
SM6115, codename bengal. The code is taken from OnePlus repo [1], and the
keyword bengal corresponds to sm4250 and sm6115, so I'm adding both compat
strings.

[1]: https://github.com/OnePlusOSS/android_kernel_oneplus_sm4250

Iskren Chernev (2):
  dt-bindings: clk: qcom: gcc-sm6115: Document SM6115 GCC
  clk: qcom: Add Global Clock controller (GCC) driver for SM6115

 .../bindings/clock/qcom,gcc-sm6115.yaml       |   74 +
 drivers/clk/qcom/Kconfig                      |    7 +
 drivers/clk/qcom/Makefile                     |    1 +
 drivers/clk/qcom/gcc-sm6115.c                 | 3624 +++++++++++++++++
 include/dt-bindings/clock/qcom,gcc-sm4250.h   |   11 +
 include/dt-bindings/clock/qcom,gcc-sm6115.h   |  201 +
 6 files changed, 3918 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/clock/qcom,gcc-sm6115.yaml
 create mode 100644 drivers/clk/qcom/gcc-sm6115.c
 create mode 100644 include/dt-bindings/clock/qcom,gcc-sm4250.h
 create mode 100644 include/dt-bindings/clock/qcom,gcc-sm6115.h


base-commit: e71e3a48a7e89fa71fb70bf4602367528864d2ff
--
2.31.1

