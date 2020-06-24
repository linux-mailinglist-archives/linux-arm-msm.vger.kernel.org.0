Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CE932207647
	for <lists+linux-arm-msm@lfdr.de>; Wed, 24 Jun 2020 17:01:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2390529AbgFXPBT (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 24 Jun 2020 11:01:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55390 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2390251AbgFXPBT (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 24 Jun 2020 11:01:19 -0400
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com [IPv6:2a00:1450:4864:20::444])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 14F74C061573;
        Wed, 24 Jun 2020 08:01:19 -0700 (PDT)
Received: by mail-wr1-x444.google.com with SMTP id g18so2631429wrm.2;
        Wed, 24 Jun 2020 08:01:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=G1/tgFSEPzLGEWgFIjtQpqgS4DnYma/m5Iy4TZnXgTE=;
        b=QoHXRaEjmyXE4GwZkcrNhYwb9HRqV7Q8mETs8rxzB1JXf5BsD8mgNE3HeVTC5mUXDi
         K1LBaNXKyZGkZLGHAGocXP+7I1o7McnZhQEa6J2LmcP3uZxCyTQ+RKWBW+aZ5NKFyspQ
         cw0BQa8lmTIiP+n5sBvadPK5Hx/9qglVQDe+BLkxKGxnH8w+03WdC02dzJqmrt5o5nS4
         QFJl6uSMMazHK3aagVeFAUKWKb0hXvI/TZa+SHGKQUXHp8ApfO4Z+OulB1/nLT/2OUEY
         cdvObYbaIhHUdeqjiX6dYhv6xYKTtABIEiktnI5NhCpRP2+cNO+P767XqIjF9ap8ngmL
         oa8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=G1/tgFSEPzLGEWgFIjtQpqgS4DnYma/m5Iy4TZnXgTE=;
        b=WZd2biuZ9hlgoDwJ159192rFOiCjX5BIJhMt8W4oXPPiunsWzcs+ewC1hdcuIBzlsx
         lJlQ3N1B9Fi9uXN/HEFl77cSDieRk3MUSj3lhowkynJw1+SIkHkOGRZuQwspwWdJk4rn
         kqu0twBhtnf58UhPFnWGLRhuhXFinJm03g+NzOrUuFCSCQz46dtIQgOd7KhDrUlqaDTo
         iOXpqbZzIRvcfAobcZCIlzu99DR7JnZaerXgE70nOEMO3GnJzqFBt/80eCPgLqZWWllj
         bPe1jEhC2u9jOB4nriWddYx0q0K4jyruGARanugc0ZbUo1oQ3H/+EK4/ncwyhJfycK23
         2f+Q==
X-Gm-Message-State: AOAM532BMQ34CgDojp3XslqW6216qclbjkY1lGljyApK8m6Oi8eqVMyu
        aCkJzPrDcCXmpaExpfHqIc0=
X-Google-Smtp-Source: ABdhPJyjovMUsXCbiiflsGu+suhkfBFu9ISRVh9yoncvFWtslrW0/Brooqqrxvu5uZRBKQDjfozwyQ==
X-Received: by 2002:adf:f34c:: with SMTP id e12mr19662863wrp.46.1593010877790;
        Wed, 24 Jun 2020 08:01:17 -0700 (PDT)
Received: from localhost.localdomain (abag196.neoplus.adsl.tpnet.pl. [83.6.170.196])
        by smtp.googlemail.com with ESMTPSA id s8sm21339390wru.38.2020.06.24.08.01.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Jun 2020 08:01:17 -0700 (PDT)
From:   Konrad Dybcio <konradybcio@gmail.com>
To:     skrzynka@konradybcio.pl
Cc:     Konrad Dybcio <konradybcio@gmail.com>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Jassi Brar <jassisinghbrar@gmail.com>,
        Kees Cook <keescook@chromium.org>,
        Anton Vorontsov <anton@enomsg.org>,
        Colin Cross <ccross@android.com>,
        Tony Luck <tony.luck@intel.com>,
        Sivaprakash Murugesan <sivaprak@codeaurora.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v3 0/8] MSM8994 peripheral enablement, DTS updates
Date:   Wed, 24 Jun 2020 17:00:58 +0200
Message-Id: <20200624150107.76234-1-konradybcio@gmail.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

changes since v2:

- drop applied patches
- add msm8994 SCM compat and binding
- declare regulators in device DTs
- make APCS a mailbox

Konrad Dybcio (8):
  firmware: qcom_scm: Add msm8994 compatible
  arm64: dts: qcom: msm8994: Add SCM node
  arm64: dts: qcom: msm8992: Add a label to rpm-requests
  arm64: dts: qcom: msm8992: Remove regulators from SoC DTSI
  mailbox: qcom: Add msm8994 apcs compatible
  arm64: dts: qcom: msm8994: Add support for SMD RPM
  arm64: dts: qcom: Move msm8994-smd-rpm contents to lg-bullhead.
  arm64: dts: qcom: Add support for Sony Xperia Z5 (SoMC Sumire-RoW)

 .../devicetree/bindings/firmware/qcom,scm.txt |   1 +
 .../mailbox/qcom,apcs-kpss-global.yaml        |   1 +
 arch/arm64/boot/dts/qcom/Makefile             |   1 +
 .../dts/qcom/msm8992-bullhead-rev-101.dts     | 225 ++++++++++++++-
 arch/arm64/boot/dts/qcom/msm8992.dtsi         |  48 +---
 arch/arm64/boot/dts/qcom/msm8994-smd-rpm.dtsi | 268 ------------------
 .../msm8994-sony-xperia-kitakami-sumire.dts   |  13 +
 .../qcom/msm8994-sony-xperia-kitakami.dtsi    | 235 +++++++++++++++
 arch/arm64/boot/dts/qcom/msm8994.dtsi         |  49 ++++
 drivers/firmware/qcom_scm.c                   |   1 +
 drivers/mailbox/qcom-apcs-ipc-mailbox.c       |   5 +
 11 files changed, 531 insertions(+), 316 deletions(-)
 delete mode 100644 arch/arm64/boot/dts/qcom/msm8994-smd-rpm.dtsi
 create mode 100644 arch/arm64/boot/dts/qcom/msm8994-sony-xperia-kitakami-sumire.dts
 create mode 100644 arch/arm64/boot/dts/qcom/msm8994-sony-xperia-kitakami.dtsi

-- 
2.27.0

