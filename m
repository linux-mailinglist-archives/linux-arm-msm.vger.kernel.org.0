Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E72A72CC249
	for <lists+linux-arm-msm@lfdr.de>; Wed,  2 Dec 2020 17:31:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727750AbgLBQa2 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 2 Dec 2020 11:30:28 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33104 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726307AbgLBQa2 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 2 Dec 2020 11:30:28 -0500
Received: from mail-wm1-x343.google.com (mail-wm1-x343.google.com [IPv6:2a00:1450:4864:20::343])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B34C4C0613D6
        for <linux-arm-msm@vger.kernel.org>; Wed,  2 Dec 2020 08:29:47 -0800 (PST)
Received: by mail-wm1-x343.google.com with SMTP id x22so8812083wmc.5
        for <linux-arm-msm@vger.kernel.org>; Wed, 02 Dec 2020 08:29:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Yn1Qjx2PGSJwTYYFgeQmMkhmsCI6fFdFchM0O3gSgpE=;
        b=Oxja89kUQhtUU10zgOgezzL8wfe85VTysr6EuAyr3ZITywv6U/zP06BAt8iwyXzBur
         G/19m3j+yK+GPCUjH2aEjE4xZNVypmD7J/pa4l2SXBwvSDwBK4omjjkKNl/XlbZsgsiU
         OvyOGJhCHWiaK3pQ2lXBPYc0HP824uLHJ/7NjFc7GSdaB07USD1rq7p3+sY0xkhv1rRP
         wPOLxyzx9d/Y1o5p4LaZ5Qf+EKrQiCD28wK6xsWbkc/g2eHz30MFkKAorYO/G4RIDQGA
         LX9TCgLpsyAsle6yK2oR6/Njg6kbtL3xf4vPrRQooucym0FEBcFn6uuPPpdyC2ra6cL4
         nJcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Yn1Qjx2PGSJwTYYFgeQmMkhmsCI6fFdFchM0O3gSgpE=;
        b=RY5Wt4qeqtM73rrX7Mf9/EhZxNGLT+BVdt6ag1f/N5pgi9vtAjrpwVmbP6AgqdhU9n
         c+leT4Gzjoe3RFIzqRkwztXqOxB3HxJrFE+k3/qAedkaaMCrvtyzQ4zasvhLfBIO1AWS
         Pwhbt5+Auc6OxrUg/3mYqBD0dnnGqzvPTQoAftXssg+Za0iuIn+JoHkVhGJ7P85N41BH
         XFUgDRrm81EgNdUxzNNWOX2Wr0HfFKvLPh1HBgzWMkGPKv0juwKdlQKd0Q6HFpU878aA
         rNYFuTDewcyTGkVrL+IyPlf/u/w4cQ5onR9KIEpPgqthbppvWyLAEtV3QVfAGqA49f4k
         gTiw==
X-Gm-Message-State: AOAM533vxuk1mC72GWshNh9FxsDAA5C8ZbrrVBTFE03KHHBJ/BXpo7Pm
        Cu8p43oTg5kbUprLIk2k+bOtCQ==
X-Google-Smtp-Source: ABdhPJynEg2l1j7vWObk8Q3evf1YLgj6cCwWzmxRb3T4RbYvxKeo6k/YteWX8f/91ZXhz3MiWrBMnw==
X-Received: by 2002:a7b:ca47:: with SMTP id m7mr3946131wml.33.1606926586389;
        Wed, 02 Dec 2020 08:29:46 -0800 (PST)
Received: from srini-hackbox.lan (cpc86377-aztw32-2-0-cust226.18-1.cable.virginm.net. [92.233.226.227])
        by smtp.gmail.com with ESMTPSA id o5sm2569882wmh.8.2020.12.02.08.29.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Dec 2020 08:29:45 -0800 (PST)
From:   Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
To:     bjorn.andersson@linaro.org
Cc:     linux-arm-msm@vger.kernel.org, agross@kernel.org,
        robh+dt@kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Subject: [PATCH v6 0/2] pinctrl: qcom: Add sm8250 lpass lpi pinctrl support
Date:   Wed,  2 Dec 2020 16:29:41 +0000
Message-Id: <20201202162943.15210-1-srinivas.kandagatla@linaro.org>
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

Changes since v5:
	- moved to use FIELD_* or u32_replace/encode apis where possible
	- remove all the SHIFT constants
	- updated function groups as suggested by Bjorn
	- updated setting slew rate as suggested by Bjorn

Srinivas Kandagatla (2):
  dt-bindings: pinctrl: qcom: Add sm8250 lpass lpi pinctrl bindings
  pinctrl: qcom: Add sm8250 lpass lpi pinctrl driver

 .../pinctrl/qcom,lpass-lpi-pinctrl.yaml       | 130 ++++
 drivers/pinctrl/qcom/Kconfig                  |   8 +
 drivers/pinctrl/qcom/Makefile                 |   1 +
 drivers/pinctrl/qcom/pinctrl-lpass-lpi.c      | 695 ++++++++++++++++++
 4 files changed, 834 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/pinctrl/qcom,lpass-lpi-pinctrl.yaml
 create mode 100644 drivers/pinctrl/qcom/pinctrl-lpass-lpi.c

-- 
2.21.0

