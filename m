Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4906A44E55
	for <lists+linux-arm-msm@lfdr.de>; Thu, 13 Jun 2019 23:24:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726204AbfFMVYl (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 13 Jun 2019 17:24:41 -0400
Received: from mail-pf1-f196.google.com ([209.85.210.196]:33385 "EHLO
        mail-pf1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725747AbfFMVYl (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 13 Jun 2019 17:24:41 -0400
Received: by mail-pf1-f196.google.com with SMTP id x15so65821pfq.0;
        Thu, 13 Jun 2019 14:24:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id;
        bh=rsm7LFvuu37y6FQOrHWabqcTTRVTcTtnFhU4W3/jN+c=;
        b=jECBnQ21l+bqPpGeJbtj0FnDphGNxH9f9w5tr6ajlf3vI/HhRgN8/AO+O+Ty127Gow
         ws7t8aD0r0aGSnTt/cJ1pGC090MqhVSexfvjbpRtgPVNCJrwsKXvB0w0kth8+20n9PXd
         HjIHj3gPhTqo5+K0Tg4vy1i1T4L8J1Sa9iuPzpuTnLNuVoUERWr3aWYaMyDMB5ro+ZUy
         P5HdB/NYYIrpDlDTIvNJxCDWOxWfKTV2OADf9rVLGyi3C2FoZ8ovf/rtWsN+dSatdatz
         0jqtjjT0PFBIrsQzO41AI+zs2Yl6umhm5pxndx/iobXphSfmBbDUzNcXwBHYSGCKLsNG
         d32w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=rsm7LFvuu37y6FQOrHWabqcTTRVTcTtnFhU4W3/jN+c=;
        b=AU7p3IGEZCrdPgyMdJYtMATlv5WolEQkNYamO2m37FkSKt8R60AQJ1rNzvVhSahKp/
         wdQOLbqXnT31h770JBEMCY5vkHSbY/t+TBsd6KW7En5fSDjlDJEePXns6O9N6tjB6sqD
         5w/3/iMScIkAvfLid64rsNi6X292m2jGbc67ROV8ds7KrU3D+9QQBoPrzD6elqJ8ZCR6
         u+64qtGRpl5L8raqFL/cAZ0jxrdU0cVRL7U5jF24yged7KTk+tFv2PEofKdWGbARft/N
         kdyoAZ8ZssSs/VOdComad50viF7e7AJJm1qCISCvamLj+AiExdZFKWyTFr2YuhFbSpHG
         C9Rw==
X-Gm-Message-State: APjAAAVcXu5D1fxmi8xNCNN/a7Hsn2FoCxjMWBOkRf77w7enH2m5JDDk
        EVyLG+5fBFVYQH0FTCkmsIE=
X-Google-Smtp-Source: APXvYqwiMa+oL9IoDF5KcSiQc6XmV+Wm+okhHVwqSeWnqgbf0LOpJuNn7trSBQ4cqOW7Z+xFO2a/AQ==
X-Received: by 2002:aa7:8ecb:: with SMTP id b11mr55175552pfr.220.1560461080859;
        Thu, 13 Jun 2019 14:24:40 -0700 (PDT)
Received: from aw-bldr-10.qualcomm.com (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id x66sm575791pfx.139.2019.06.13.14.24.38
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 13 Jun 2019 14:24:40 -0700 (PDT)
From:   Jeffrey Hugo <jeffrey.l.hugo@gmail.com>
Cc:     agross@kernel.org, bjorn.andersson@linaro.org, lgirdwood@gmail.com,
        broonie@kernel.org, robh+dt@kernel.org, mark.rutland@arm.com,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, Jeffrey Hugo <jeffrey.l.hugo@gmail.com>
Subject: [PATCH v4 0/7] PM8005 and PMS405 regulator support
Date:   Thu, 13 Jun 2019 14:24:36 -0700
Message-Id: <20190613212436.6940-1-jeffrey.l.hugo@gmail.com>
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
and
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

 .../regulator/qcom,spmi-regulator.txt         |  22 ++
 arch/arm64/boot/dts/qcom/msm8998-mtp.dtsi     |  17 ++
 drivers/regulator/qcom_spmi-regulator.c       | 237 +++++++++++++++++-
 3 files changed, 269 insertions(+), 7 deletions(-)

-- 
2.17.1

