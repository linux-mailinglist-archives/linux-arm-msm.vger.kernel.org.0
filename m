Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C5CF82CC279
	for <lists+linux-arm-msm@lfdr.de>; Wed,  2 Dec 2020 17:36:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730721AbgLBQfv (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 2 Dec 2020 11:35:51 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33934 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727942AbgLBQfv (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 2 Dec 2020 11:35:51 -0500
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com [IPv6:2a00:1450:4864:20::441])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7DFEFC0613CF
        for <linux-arm-msm@vger.kernel.org>; Wed,  2 Dec 2020 08:35:04 -0800 (PST)
Received: by mail-wr1-x441.google.com with SMTP id r3so4717776wrt.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 02 Dec 2020 08:35:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=YxQYQF1LD7VCcsXVOlfezCcp9MbvQ1IvqiGH/jVfncA=;
        b=AB7jwyDcIJ8WIoS9hG0XuOZSAJlwzKFGEGaHT7shjySdMSSlXXcg3EiM78CcGK/a7b
         skCQQkUQUHxW05+5hR3TtT2QahmRmE9XrwLAqCnRSm7hUJ5fHUhD6H04epaMkb3Kic0/
         589tMeIRGUZ2bw5yBOl5cnTxRubWR7IWwotD4FkULg60eNNncaiN6pZcSEL4/bdrbuGB
         8B6XqOTluSYei6beJn1gfnp01kREIPfrA3dZ5ZQ05KbTtgIjsXpiGEQw/SJuqvrqHHyV
         RO0YYAJcOF1uEIvmysCLW8d5ojbe/c2ClViOj7Wq6j3JpANGBcmY3hIor84BnM1uhU1J
         j4fA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=YxQYQF1LD7VCcsXVOlfezCcp9MbvQ1IvqiGH/jVfncA=;
        b=V9ValrR0mJQk9hJiZWqrnzges1+oRh1gYml0+/ZSkCmDZwX+Wjr5MqfGVIcGgE/Lfq
         2KwtfgSNNjG+r1FkB8yX5EJRpGCo65duEJ7mA1o39hApKpQesxhaYLKZoGsQSBpMWwDN
         HscnufrNnRs2dPKddq29bm8BHYYedcmjS81CYX+qIbO/OsCOW+9vBVzzb/3Y/50ELd6M
         wfXCD6Gs46eSU7flqmpxLLcCja8yugxX7ZXddJYH9Uw2k4EMF+NEzx+fi2Hhr2x2hOWj
         Bcw8rLcRzkNgRrGZh6gvXRakwGaQqXfFt3Ig3R1vftdswjWCU8LxLhvHnzq9cOUUN1ko
         XIyw==
X-Gm-Message-State: AOAM531oAspPaBCRBAjHX0LogIcLYaRm6VUndFZ74dr+buLhQWZVFAIp
        HG1sSCK1UgGwTJbkDR8K7+UnsQ==
X-Google-Smtp-Source: ABdhPJwpdk3b38oDk8xBk5tqbfTHdTdnAQk8e139jw0HXO9hDe5sXz3SQ/nKogQzYb81HO4winiL1g==
X-Received: by 2002:a5d:4f0e:: with SMTP id c14mr4378035wru.422.1606926903076;
        Wed, 02 Dec 2020 08:35:03 -0800 (PST)
Received: from srini-hackbox.lan (cpc86377-aztw32-2-0-cust226.18-1.cable.virginm.net. [92.233.226.227])
        by smtp.gmail.com with ESMTPSA id a21sm2443104wmb.38.2020.12.02.08.35.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Dec 2020 08:35:02 -0800 (PST)
From:   Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
To:     linus.walleij@linaro.org, bjorn.andersson@linaro.org
Cc:     robh+dt@kernel.org, agross@kernel.org,
        linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        srinivas.kandagatla@linaro.org
Subject: [RESEND PATCH v6 0/2] pinctrl: qcom: Add sm8250 lpass lpi pinctrl support
Date:   Wed,  2 Dec 2020 16:34:41 +0000
Message-Id: <20201202163443.26499-1-srinivas.kandagatla@linaro.org>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Sorry for the Noise, Resending this as previous one did not include Linus W email id!!

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

