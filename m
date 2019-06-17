Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id EFF1248C09
	for <lists+linux-arm-msm@lfdr.de>; Mon, 17 Jun 2019 20:36:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726005AbfFQSgv (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 17 Jun 2019 14:36:51 -0400
Received: from mail-pf1-f195.google.com ([209.85.210.195]:45842 "EHLO
        mail-pf1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725844AbfFQSgu (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 17 Jun 2019 14:36:50 -0400
Received: by mail-pf1-f195.google.com with SMTP id r1so6134406pfq.12;
        Mon, 17 Jun 2019 11:36:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id;
        bh=LKGeNlPZwIGVNZZsS9uYLIodxN+fkjvFRMre01BWKLg=;
        b=RRJM6381xq6M0GpIu/gfVDCailz8RcvtlHMPnWE8WwYag1fHjW13rFxzw0CbXmwyZU
         y1X5Ovp/uCXCMC4nm+fmGkjfO8CsEY8xPZ/hWcihO+jCtgZLBmlHRCyQqr4qyY6r0P+2
         PtOf3StZ7r09RdG1XVGr0aUH/ylCUi13eS7Ykgmsm+Q6h1xQ0MY39v27A4xA2S9px6Os
         jC7DGXDFVcatK/e/qfkwAtifPNh2mN1wUslDh9b2nKKiAdZtCKlHJXhUGQsLgvCweN7m
         PKYMnUKggWmUHs6KzSfkdgrJ3jnDIIefWfcPidclO7nOgyOuErxQsbLwfvbeNiweySQP
         4A/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=LKGeNlPZwIGVNZZsS9uYLIodxN+fkjvFRMre01BWKLg=;
        b=kfDQ6+OU9BjRLHrnaJZgzYMCZpau/TpeYUxQL3mlPYOmA7rS4bzZU+OqUfoH3xZG7d
         YvK72rIPodzLPJJyVInHoF0wyzaV5SIU04CJ+X8PsmMvffur9A5+ZHxnDe/3jBt4i/Bi
         xbAEjd4/ImjNkiBnXfEFekxmIlkafmzWue3nj8BD6fGu+Yj4GuAeDqcViUMccQ0AHBvq
         AC2W7y+aldcahUxkyDMGXKgnUuP4OMHWDrujcQKVkjBmQf29WgmKAtowum/BnC0OQ9LJ
         84iivVqBo37lPfy3CX/nYhOS8fwhXoGsWaaaYxnnGParOx9UO+jns/+1pMPE4l++SHuD
         4imQ==
X-Gm-Message-State: APjAAAV8nNx9o+xDpca9qZXcZVw00CbKVKZwgTnYFn1Oj69gFzBkG/7z
        aEGPytuol2NxCAli5mZc7Fa1Obsh
X-Google-Smtp-Source: APXvYqyjy89E8tz6+xKj6FtuzHozyTb/rdTmJNYjxAKF9KzFUQVJZImITEuwiEwSuqcRVbLhOh8HXA==
X-Received: by 2002:a62:a511:: with SMTP id v17mr112104356pfm.129.1560796608695;
        Mon, 17 Jun 2019 11:36:48 -0700 (PDT)
Received: from aw-bldr-10.qualcomm.com (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id 137sm13010823pfz.116.2019.06.17.11.36.46
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 17 Jun 2019 11:36:48 -0700 (PDT)
From:   Jeffrey Hugo <jeffrey.l.hugo@gmail.com>
Cc:     agross@kernel.org, bjorn.andersson@linaro.org, lgirdwood@gmail.com,
        broonie@kernel.org, robh+dt@kernel.org, mark.rutland@arm.com,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, Jeffrey Hugo <jeffrey.l.hugo@gmail.com>
Subject: [PATCH v5 0/5] PM8005 and PMS405 regulator support
Date:   Mon, 17 Jun 2019 11:36:43 -0700
Message-Id: <20190617183643.13449-1-jeffrey.l.hugo@gmail.com>
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

v5:
-drop accepted changes
-.get_voltage -> .get_voltage_sel
-made set_mode be 1:1 between API and hw

v4:
-fix the linear range change to use the correct implementation
-mask out the non-mode bits when reading the hardware reg
-correct the pms405 supply pins listing
-correct the pms405 s3 supply name in the match struct
-correct subject names to be more aligned with the subsystem history

v3:
-Allow PMS405 regulators to be enabled and disabled, instead of the
outdated "always on" concept

v2:
-Perform if statement cleanups per review discussion
-Pull in linear range support since its related, and simple
-Rework the PM8005 to minimize special cases in the driver
-"common2" is now ftsmps426 since that design first implemented it
-Reworked the PMS405 changes on top, since they are related to pm8005
and trivial

Jeffrey Hugo (3):
  dt-bindings: qcom_spmi: Document PM8005 regulators
  regulator: qcom_spmi: Add support for PM8005
  arm64: dts: msm8998-mtp: Add pm8005_s1 regulator

Jorge Ramirez (2):
  dt-bindings: qcom_spmi: Document pms405 support
  regulator: qcom_spmi: add PMS405 SPMI regulator

 .../regulator/qcom,spmi-regulator.txt         |  22 ++
 arch/arm64/boot/dts/qcom/msm8998-mtp.dtsi     |  17 ++
 drivers/regulator/qcom_spmi-regulator.c       | 213 ++++++++++++++++++
 3 files changed, 252 insertions(+)

-- 
2.17.1

