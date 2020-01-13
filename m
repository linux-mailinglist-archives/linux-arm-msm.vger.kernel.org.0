Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 65386139AEB
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Jan 2020 21:44:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727382AbgAMUow (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 13 Jan 2020 15:44:52 -0500
Received: from mail-pg1-f193.google.com ([209.85.215.193]:42387 "EHLO
        mail-pg1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726778AbgAMUov (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 13 Jan 2020 15:44:51 -0500
Received: by mail-pg1-f193.google.com with SMTP id s64so5264582pgb.9
        for <linux-arm-msm@vger.kernel.org>; Mon, 13 Jan 2020 12:44:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:mime-version:content-disposition
         :user-agent;
        bh=a00SxwkHfm6ZVifQ6iKU+RaUHfIU7yzSAqjw2eCdeog=;
        b=HNZlpwIF7dI1PLL4JVeBl4LpcTopWQh/MvmUrbhzD4++L+w0bvDhdej2qRmk01BcPL
         TSm/TzMHtS+ZjK+rZ1Hc9WbjZOwGFmcA06xrLhFfaSbbDJOrXTbx3YcQ0MXj2FjTjW3V
         NhQt3V2epkwAdVIkw+OTtZ7uuBYe2icwruf8z6Tw4J5NvYcWrxxDPLmXFWX8VKf5ByME
         R2+5al9R3XlT53QiM/0/zZ5UBl9yhM8GHo8InPkCXDb67PUgMtTZOPIPNsbCSpi0CXTn
         2mkk2qc1IMEaKr/lEIeeSRFn0uGaJzDFVeRBx8RGyZUe9hfHsluoVybYvf82A9ayFBND
         psWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
         :content-disposition:user-agent;
        bh=a00SxwkHfm6ZVifQ6iKU+RaUHfIU7yzSAqjw2eCdeog=;
        b=B6QbLJsVIgVb0rL2Z9KB6fG9Ya5t9BN4yFXGtflgz/9In9Cc7Neh6ybln+0l8Ub1m0
         oeerEvqd8bZBwjdZIQzGwZ4PzByvl00gBUgiTTWKH1PdvBKSQiFpz7ZJ48jKfLCIi3fj
         r3gmbWEctcpGHV3r1x8HfuPNmJo0aNjTUqAXlBUi5lEPClFLv/X+02D76z2fzs1t/801
         1tsMQzLruPf7p8pOJ7EOwqOxbsMWkkK+AqBKJQkYc8hzl+sooDJ/0M1hbQtsxip9GYFf
         lCr4yZ6yRapfz0+yVIifdJNBb3wTuXf2erZjh4TU1H/QyATNwBQ4e3lYQQcHwltYIqcb
         2y9g==
X-Gm-Message-State: APjAAAXC7poouCTAvD1eGKNzwKEC519+a3Dmf5baQBeCVnIeQY2zGTHL
        TIutHaIwphyew1JjAGP+QYI/Ig==
X-Google-Smtp-Source: APXvYqy5UAb/06wqSnu1lMkxpHEOFQlm0XR3fn8suaQuLUYIG18xk4SSMjFUOiB/nLtOMdFfCe6fjQ==
X-Received: by 2002:aa7:9115:: with SMTP id 21mr21540453pfh.224.1578948291197;
        Mon, 13 Jan 2020 12:44:51 -0800 (PST)
Received: from yoga (104-188-17-28.lightspeed.sndgca.sbcglobal.net. [104.188.17.28])
        by smtp.gmail.com with ESMTPSA id b128sm14228781pga.43.2020.01.13.12.44.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jan 2020 12:44:50 -0800 (PST)
Date:   Mon, 13 Jan 2020 12:44:48 -0800
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     arm@kernel.org, soc@kernel.org
Cc:     linux-arm-msm@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        Andy Gross <agross@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
        Olof Johansson <olof@lixom.net>,
        Kevin Hilman <khilman@baylibre.com>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Brian Masney <masneyb@onstation.org>,
        Victhor Foster <victhor.foster@ufpe.br>,
        Bjorn Andersson <bjorn.andersson@sonymobile.com>,
        Damir Franusic <damir.franusic@sartura.hr>,
        Luca Weiss <luca@z3ntu.xyz>
Subject: [GIT PULL] Qualcomm ARM dts updates for v5.6
Message-ID: <20200113204448.GE3325@yoga>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.12.2 (2019-09-21)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The following changes since commit e42617b825f8073569da76dc4510bfa019b1c35a:

  Linux 5.5-rc1 (2019-12-08 14:57:55 -0800)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux.git tags/qcom-dts-for-5.6

for you to fetch changes up to 5e4548922009870a38bcf1d887317676d4e08f54:

  ARM: dts: qcom: Add nodes for SMP boot in IPQ40xx (2019-12-28 22:21:24 -0800)

----------------------------------------------------------------
Qualcomm ARM dts updates for v5.6

* Add SAW L2 nodes to boot secondary cpus on IPQ40xx
* Fix remaining IRQ_TYPE_NONE on APQ8084
* Update tsens node to new style
* Add modem remoteproc node to MSM8974
* Move ADSP SMD edge into ADSP remoteproc node for MSM8974
* Add and enable wireless communication subsystem on MSM8974 and Fairphone 2
* Add MSM8974 interconnect provider nodes
* Add MSM8974 OCMEM node

----------------------------------------------------------------
Bjorn Andersson (3):
      ARM: dts: msm8974: Introduce the wcnss remoteproc node
      ARM: dts: msm8974: Add modem remoteproc node
      ARM: dts: msm8974: Move ADSP smd edge to ADSP PIL

Brian Masney (2):
      ARM: dts: qcom: msm8974: add ocmem node
      ARM: dts: qcom: msm8974: add interconnect nodes

Damir Franusic (1):
      ARM: dts: qcom: Add nodes for SMP boot in IPQ40xx

Luca Weiss (1):
      ARM: dts: msm8974-FP2: Introduce the wcnss remoteproc node

Victhor Foster (2):
      ARM: dts: qcom: apq8084: Change tsens definition to new style
      ARM: dts: qcom: apq8084: Remove all instances of IRQ_TYPE_NONE

 arch/arm/boot/dts/qcom-apq8084.dtsi              |  44 ++---
 arch/arm/boot/dts/qcom-ipq4019.dtsi              |   7 +
 arch/arm/boot/dts/qcom-msm8974-fairphone-fp2.dts |  45 +++++
 arch/arm/boot/dts/qcom-msm8974.dtsi              | 222 +++++++++++++++++++++--
 4 files changed, 280 insertions(+), 38 deletions(-)
