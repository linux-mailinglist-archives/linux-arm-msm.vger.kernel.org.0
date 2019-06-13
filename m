Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id EDBEC4381D
	for <lists+linux-arm-msm@lfdr.de>; Thu, 13 Jun 2019 17:04:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732649AbfFMPDj (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 13 Jun 2019 11:03:39 -0400
Received: from mail-pl1-f195.google.com ([209.85.214.195]:37826 "EHLO
        mail-pl1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727012AbfFMOWC (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 13 Jun 2019 10:22:02 -0400
Received: by mail-pl1-f195.google.com with SMTP id bh12so8227255plb.4;
        Thu, 13 Jun 2019 07:22:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id;
        bh=eKOd4vO1UgFYSd+YAFiidpo1Y+51qTryroNSM0EM6GI=;
        b=eO3M8sdZsGzs0H+XeWXXhP+/9/J3q8AyrU/LKxC0EoDBiBUsZQaEHmvPqze41Hi3Gy
         8T1a9l8xTLBHaDbUedvbWzCxLITXWlKRgaBDKY5LW50hQPiCBSBPuDVumPj+hnzA8+96
         XAlw5oijtu7E4enl0WyVGwT83+MU5lm9Vo8DHEFYChsYFLlJwR/zNB4m+TWDbkDBpP3f
         ZmzobNt4cxnG9eQ4hzUuEGzvyWf5rfjDlJudsfLWnTgLAwxKUHaV4nOpyrEUYyAwuf9T
         HxRUH0dlc+SHqax0Oo6So5xs94pYmCpwCLlWXqLpCDNCU7EYOp8CLvIOyhNWOzeauUKs
         nhVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=eKOd4vO1UgFYSd+YAFiidpo1Y+51qTryroNSM0EM6GI=;
        b=VxYSDtV1j2AFqJrXbBUDETKuBB552yTJKzi5zAaguG6etKk+un2yH6w/xMqFU/1NoR
         Nl7bgjgFZX/aQnGDe5GHASnvOv/9mu+/ZL5DV1tj/iBNg08J7BMzxOBtFfybJ7XhmsuX
         o9Z/tJX7A0zflyExKg45TfdnVPFiNtc3HxW1G0Vs+ABRH0MIo7nl80Sy4kSHyHfyJOgw
         +5XFJ2xZ7mDEKklovtCoYmzMM+/b0+auiK0MU8z3n0kwOHAJm7GNvi9Dg1nSzhIm9rym
         Ha/YeW+nWVNDh8UBUTr9E9rk5IrwpbPc90acWxIQz2uHUNST67gAN4eEuxuaXmZ34g3V
         ghQA==
X-Gm-Message-State: APjAAAXE8pUzSf2AC414nu8F4K0GcZfGXiaE0YQKkYAmiFz7K+3d5XFS
        HHimTZKKbqPSfSufVQx6gzPNYG1x
X-Google-Smtp-Source: APXvYqwhE5ITe5ZjVSgpSHcaRMbgiJJg+SWmf1fmZzODXRPQhGkSQTmLCcwIhDmkBiIyoxFiOIK8fQ==
X-Received: by 2002:a17:902:a5ca:: with SMTP id t10mr81922020plq.98.1560435721094;
        Thu, 13 Jun 2019 07:22:01 -0700 (PDT)
Received: from aw-bldr-10.qualcomm.com (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id c124sm3029689pfa.115.2019.06.13.07.21.59
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 13 Jun 2019 07:22:00 -0700 (PDT)
From:   Jeffrey Hugo <jeffrey.l.hugo@gmail.com>
Cc:     agross@kernel.org, bjorn.andersson@linaro.org, lgirdwood@gmail.com,
        broonie@kernel.org, robh+dt@kernel.org, mark.rutland@arm.com,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, Jeffrey Hugo <jeffrey.l.hugo@gmail.com>
Subject: [PATCH v2 0/7] PM8005 and PMS405 regulator support
Date:   Thu, 13 Jun 2019 07:21:57 -0700
Message-Id: <20190613142157.8674-1-jeffrey.l.hugo@gmail.com>
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

The s3 regulator of PMS405 is used for voltage scaling of the CPU on
QCS404.

Both PMICs are very similar in design, so add the base support with one,
and trivially add the support for the other on top.

v3:
-Allow PMS405 regulators to be enabled and disabled, instead of the
outdated "always on" concept

v2:
-Perform if statement cleanups per review discussion
-Pull in linear range support since its related, and simple
-Rework the PM8005 to minimize special cases in the driver
-"common2" is now ftsmps426 since that design first implemented it
-Reworked the PMS405 changes on top, since they are related to pm8005 and
trivial

Jeffrey Hugo (4):
  drivers: regulator: qcom_spmi: Refactor get_mode/set_mode
  dt-bindings: qcom_spmi: Document PM8005 regulators
  regulator: qcom_spmi: Add support for PM8005
  arm64: dts: msm8998-mtp: Add pm8005_s1 regulator

Jorge Ramirez (2):
  dt-bindings: qcom_spmi: Document pms405 support
  drivers: regulator: qcom: add PMS405 SPMI regulator

Jorge Ramirez-Ortiz (1):
  drivers: regulator: qcom_spmi: enable linear range info

 .../regulator/qcom,spmi-regulator.txt         |  28 +++
 arch/arm64/boot/dts/qcom/msm8998-mtp.dtsi     |  17 ++
 drivers/regulator/qcom_spmi-regulator.c       | 233 +++++++++++++++++-
 3 files changed, 271 insertions(+), 7 deletions(-)

-- 
2.17.1

