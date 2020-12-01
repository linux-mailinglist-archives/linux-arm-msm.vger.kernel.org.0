Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7034E2CA5A6
	for <lists+linux-arm-msm@lfdr.de>; Tue,  1 Dec 2020 15:31:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388950AbgLAOan (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 1 Dec 2020 09:30:43 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46176 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2389089AbgLAOan (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 1 Dec 2020 09:30:43 -0500
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com [IPv6:2a00:1450:4864:20::444])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B4F03C0617A6
        for <linux-arm-msm@vger.kernel.org>; Tue,  1 Dec 2020 06:30:02 -0800 (PST)
Received: by mail-wr1-x444.google.com with SMTP id l1so2919048wrb.9
        for <linux-arm-msm@vger.kernel.org>; Tue, 01 Dec 2020 06:30:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=QmS1AOYTJduZm5RuQkzYgqsOUKH55c+00NGS1pLNVMw=;
        b=U7Achn23CBNyWiH9eyYw/aWefQrW+ASyn4yKEpWMYJUwhlPPUMme07oCKzPf8LUSBZ
         3TW8JV0qltTaXmMPQGHK14uoSVRBiBR09eSUf0dHlpGlyGPIjDroTGYwe9DrsNCCXbWC
         h01ABC+rQE3wLPACeaDRqHLlwx2X+X/36u0MA/M+MnJAnw4cWRoVNxNHC/H0vXTtJwmR
         Pg4tMXkWoMm9H4N/RpY2HbR8j74KBSezAMG61XzGn7Cv4c0S8e/Hfa4DPqnlw/jSQa22
         kD4TbEdj02R8t6OKYhHzsmRBp80GsYktvrurnHZ3Xy14qqivJgDwqoDnZwnz5SZv6krG
         dSAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=QmS1AOYTJduZm5RuQkzYgqsOUKH55c+00NGS1pLNVMw=;
        b=G1bSIIh/SZKUeKwI82hpoz7yIo7LDt1xqZS9raeNMISD5EJAZ4qXmO0THzcHWcx0I0
         GL1oxrqePw1l6E7US/gVXfb6Ep/WFmIFcgLp6VQSdlCWT49nsTT1wNDoMJHTAlmHXAT3
         DUPDOBHyfLt8wcAo+HsGCMZ1/gkLf1HTPWAQ/Gxm4VUVgLr4NJeID6IZIJMp2lg/EoNH
         qcpddchYjeHjNbhDcugj5E7SypkjK8NhTSG0hu1FdFTksZXEE+08VwRRHp42IsK1FUT6
         9GrnZB7Dk5PYtjpclooEReFSJRddHJcHM6MExXI/kEPlmpqpw4e7Q25KIyeqYtJEziUL
         WUJw==
X-Gm-Message-State: AOAM5311oV+Kto50fmhcnLtn8fSztkCT3uLty/9bANQVLYm3QMHBHubS
        gs11UzIB5y50zfAijXWnk9YFKb7GkeCS+Su9
X-Google-Smtp-Source: ABdhPJx/A1S/sUAIDOjXHOpNutH0g6JC8i23aEvaWrE3KOCtK0MgOn3D5mrAp+1vSBZju0YnKfPoEg==
X-Received: by 2002:adf:9124:: with SMTP id j33mr4052062wrj.376.1606833001420;
        Tue, 01 Dec 2020 06:30:01 -0800 (PST)
Received: from srini-hackbox.lan (cpc86377-aztw32-2-0-cust226.18-1.cable.virginm.net. [92.233.226.227])
        by smtp.gmail.com with ESMTPSA id 20sm50488wmk.16.2020.12.01.06.30.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Dec 2020 06:30:00 -0800 (PST)
From:   Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
To:     linus.walleij@linaro.org, bjorn.andersson@linaro.org
Cc:     robh+dt@kernel.org, agross@kernel.org,
        linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        srinivas.kandagatla@linaro.org
Subject: [PATCH v5 0/2] pinctrl: qcom: Add sm8250 lpass lpi pinctrl support
Date:   Tue,  1 Dec 2020 14:28:28 +0000
Message-Id: <20201201142830.13152-1-srinivas.kandagatla@linaro.org>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

This patch adds support for LPASS (Low Power Audio SubSystem)
LPI (Low Power Island) pinctrl on SM8250.

This patch has been tested on support to Qualcomm Robotics RB5 Development
Kit based on QRB5165 Robotics SoC. This board has 2 WSA881X smart speakers
with onboard DMIC connected to internal LPASS codec via WSA  and VA macros
respectively.

Most of the work is derived from downstream Qualcomm kernels.
Credits to various Qualcomm authors from Patrick Lai's team who have
contributed to this code.

Am guessing existing qcom folder should cover maintining this driver too!
If not I can send additional patch to consolidate this along with other
Audio related drivers in Maintainer file!

Changes since v4:
	- added Rob's review
	- updated slew reg range
	- used u32p_replace_bits
	- sorted pin functions and its defines
	- address various trivial comments from Bjorn

Srinivas Kandagatla (2):
  dt-bindings: pinctrl: qcom: Add sm8250 lpass lpi pinctrl bindings
  pinctrl: qcom: Add sm8250 lpass lpi pinctrl driver

 .../pinctrl/qcom,lpass-lpi-pinctrl.yaml       | 132 ++++
 drivers/pinctrl/qcom/Kconfig                  |   8 +
 drivers/pinctrl/qcom/Makefile                 |   1 +
 drivers/pinctrl/qcom/pinctrl-lpass-lpi.c      | 727 ++++++++++++++++++
 4 files changed, 868 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/pinctrl/qcom,lpass-lpi-pinctrl.yaml
 create mode 100644 drivers/pinctrl/qcom/pinctrl-lpass-lpi.c

-- 
2.21.0

