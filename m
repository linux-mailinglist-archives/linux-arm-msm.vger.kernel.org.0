Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 60FC237C93
	for <lists+linux-arm-msm@lfdr.de>; Thu,  6 Jun 2019 20:50:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727943AbfFFSuM (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 6 Jun 2019 14:50:12 -0400
Received: from mail-pl1-f195.google.com ([209.85.214.195]:39854 "EHLO
        mail-pl1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727163AbfFFSuM (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 6 Jun 2019 14:50:12 -0400
Received: by mail-pl1-f195.google.com with SMTP id g9so1273088plm.6;
        Thu, 06 Jun 2019 11:50:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id;
        bh=mtDz93Y1TuKw4yabSIG15GQuxtlGSwCV0Vd7oPRbGU8=;
        b=tV5NEkK5Vkx3jlMPQ8U1HYCBlORe1msZGEUTOk3KdWKam1BQA2wPawKlAxsPMrwpfV
         I2n97g+/Wl4YkrerEiVkG8pO/0oG09EqTxUpvDgeObGckju45xi6DBHJyIx95V082691
         rDAnJTKF1G0FapFCJOq7RSt+Mz5707JPgG7o2WWD3vCsFlm9obL1RZ1+4j5a93MvR8sj
         HjnWeBDuYfWqew71uxicPKt+xu18/KW0PzLEnhKLq3KY449AS5AR1zpcRX8d4mm0oIv9
         YxCWYlx4sv0ds+eVfCyflaV9fb1gBc6eYsKoGausVVJI5P7GUmNfIC7Xi08wI9QoD+uR
         bgpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=mtDz93Y1TuKw4yabSIG15GQuxtlGSwCV0Vd7oPRbGU8=;
        b=BqYXa4iXkFHSml7rQxsnWXYBQ6ej8hrxDCEBXWZAQxTa4Dof9ErlsOOH0VAm9lEv6I
         6K2r5G0wQU2avDZW8x20SI7bKIqhqorSRuj4AqbroI9rYjuAk0gE2uL9IG45lsTZWQiK
         Dc6zZUw0G/facSfw6/zASqrvE5kc7G5spVhUXFZlrabs7+7buW6ID43L6BDO4K3cwCZD
         J1C2M/TArb1tcw4eT0mFHX9PeoHDadCsVkyaYWvjB1Np9FFeq3/OlURDip7q0M2kVjjK
         xa4YWUptNlMDnUwABRIsdGERXdFMVFs+ybqqVz/OUinDIxhySkLFUmfSjx7WnM0XMQNH
         YzdA==
X-Gm-Message-State: APjAAAWjGnFPv40ucCcTsKL5WWVww3asgFWzICrPdcVMTzS+I0S1pz7K
        eqeLh635saK1DMhJACxwe5k=
X-Google-Smtp-Source: APXvYqyWePVzgK8bieSmAYEq53trRloEm5KEWW8F8570TMuxUWlRRIC+myDXrQ+R6OVze6JBbsgybg==
X-Received: by 2002:a17:902:f01:: with SMTP id 1mr51442182ply.170.1559847011599;
        Thu, 06 Jun 2019 11:50:11 -0700 (PDT)
Received: from aw-bldr-10.qualcomm.com (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id 26sm2543917pfi.147.2019.06.06.11.50.09
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 06 Jun 2019 11:50:11 -0700 (PDT)
From:   Jeffrey Hugo <jeffrey.l.hugo@gmail.com>
Cc:     agross@kernel.org, david.brown@linaro.org,
        bjorn.andersson@linaro.org, lgirdwood@gmail.com,
        broonie@kernel.org, robh+dt@kernel.org, mark.rutland@arm.com,
        jorge.ramirez-ortiz@linaro.org, niklas.cassel@linaro.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, Jeffrey Hugo <jeffrey.l.hugo@gmail.com>
Subject: [PATCH v2 0/7] PM8005 and PMS405 regulator support
Date:   Thu,  6 Jun 2019 11:48:42 -0700
Message-Id: <20190606184842.39484-1-jeffrey.l.hugo@gmail.com>
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

Both PMICs are very similar in deisgn, so add the base support with one,
and trivially add the support for the other on top.

The PMS405 work has only been compile tested as I don't have the proper
platform.  A tested-by from Jorge or someone with the platform would be
great.

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

