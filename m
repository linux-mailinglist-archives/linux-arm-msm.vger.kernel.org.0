Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 896F3139ADC
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Jan 2020 21:41:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728682AbgAMUle (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 13 Jan 2020 15:41:34 -0500
Received: from mail-pg1-f194.google.com ([209.85.215.194]:40758 "EHLO
        mail-pg1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728680AbgAMUle (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 13 Jan 2020 15:41:34 -0500
Received: by mail-pg1-f194.google.com with SMTP id k25so5264695pgt.7
        for <linux-arm-msm@vger.kernel.org>; Mon, 13 Jan 2020 12:41:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:mime-version:content-disposition
         :user-agent;
        bh=ZoacZbem6s+7w0Ec1Mbd+0FDMsmCk3yWa/A6VJ8m1VM=;
        b=ebYSiO+A7HY7O1bji6Oi3Odp6Oe9aZSF3TAQy1X1olR0Zd6zehs0EbeeNskpXcnPXu
         OGwq5ilV9YdPj8+0ZwYBGxmymIDin4EUTkFaFY6dP/tEo4a+1OvPFzBbhZ30kXI6hO3I
         jWcHbuHUSQitE1eT5bvPIzR/mkoerX+rIE+aoYt8H1UYomLRaCOoTqAQ4vbuss+xxkqd
         oqF05Oao5d6gKx9DIjlFKtsgR4zrcxMmjV+EQOX7BKk6cwnEwofksW739T8uLCD7seKL
         2hQzjpXCxFNAJxC2rMGZ2q/gAhHjzrxPTgt8ZxiQQTX99VaKflCsEb+p9T4dJ5re43+G
         77yw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
         :content-disposition:user-agent;
        bh=ZoacZbem6s+7w0Ec1Mbd+0FDMsmCk3yWa/A6VJ8m1VM=;
        b=KhOCvXe/MMIHbK7+toJ4vFoQfsyt5et1CBaTqzk3GfOoXATeTC4SgwQySy+gys5ViJ
         z6GLH4//l1vxyM1QKtJ4BcJ5f98YoDzwqigJN/9IfAN50mohWh6Tthhwy/63mUx7vC6F
         AjkpWmTg4qOPrej6cOxRlewds8WjSgSg8sK2bkMyQsjftTUIwVL3UOU385lM42atmKWN
         46e7cHlgszh0ft6bs/n5kttGYfFczJpILrVq7QpyAvr+NyzjDA6JaIpmpO/pKQ7tn+2s
         cLHuwMTzUyZcMYykTgjsrwuhPNqft3rCgfCNbEPq1DkUW7vzCi7MOrAsEr8cZ+TA9oyC
         hxdQ==
X-Gm-Message-State: APjAAAWebppdGQ5hminPjH3upRf9k/lvSmmjvQGUxHlqBUmuY4/QxiEW
        rs5/qFilO/xphtkJCgk5hnH74g==
X-Google-Smtp-Source: APXvYqwGRiL4ieCaRTJHFitI1pbBJvnXc/j2S77WAlRK3OoFxxZ2dMFJUnUd25kHMMKHIv/5x2+fyg==
X-Received: by 2002:a62:1889:: with SMTP id 131mr21370497pfy.250.1578948093458;
        Mon, 13 Jan 2020 12:41:33 -0800 (PST)
Received: from yoga (104-188-17-28.lightspeed.sndgca.sbcglobal.net. [104.188.17.28])
        by smtp.gmail.com with ESMTPSA id t187sm15523096pfd.21.2020.01.13.12.41.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jan 2020 12:41:32 -0800 (PST)
Date:   Mon, 13 Jan 2020 12:41:30 -0800
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     arm@kernel.org, soc@kernel.org
Cc:     linux-arm-msm@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        Andy Gross <agross@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
        Olof Johansson <olof@lixom.net>,
        Kevin Hilman <khilman@baylibre.com>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Jeffrey Hugo <jeffrey.l.hugo@gmail.com>,
        Niklas Cassel <niklas.cassel@linaro.org>,
        Amit Kucheria <amit.kucheria@linaro.org>,
        Jorge Ramirez-Ortiz <jorge.ramirez-ortiz@linaro.org>,
        Lina Iyer <ilina@codeaurora.org>
Subject: [GIT PULL] Qualcomm ARM64 defconfig updates for v5.6
Message-ID: <20200113204130.GA3325@yoga>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.12.2 (2019-09-21)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Olof, I attempted to make the two CPUFREQ drivers =m, but the result is
that CPUfreq doesn't come up on QCS404. We will need to investigate this
further and I will follow up with a patch once this is sorted out.

Regards,
Bjorn

The following changes since commit e42617b825f8073569da76dc4510bfa019b1c35a:

  Linux 5.5-rc1 (2019-12-08 14:57:55 -0800)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux.git tags/qcom-arm64-defconfig-for-5.6

for you to fetch changes up to a7ab9b89af22a8ce68db648759d974a214bc25bd:

  arm64: defconfig: enable CONFIG_ARM_QCOM_CPUFREQ_NVMEM (2020-01-04 23:58:00 -0800)

----------------------------------------------------------------
Qualcomm ARM64 defconfig updates for v5.6

* Enable NVMEM and OSM CPUfreq drivers
* Enable CPR driver
* Enable HFPLL driver
* Enable ATH10k SNOC driver
* Enable PMIC thermal driver
* Enable wakeup controller driver
* Enable watchdog driver
* Enable PRNG driver
* Enable SN65DSI86 DSI to DisplayPort bridge driver
* Enable QCA Bluetooth driver
* Enable Qualcomm SoCinfo driver
* Enable SPI and QSPI drivers
* Enable drivers providing remoteproc dependencies

----------------------------------------------------------------
Amit Kucheria (1):
      arm64: defconfig: Enable QCOM PMIC thermal

Bjorn Andersson (7):
      arm64: defconfig: Enable Qualcomm remoteproc dependencies
      arm64: defconfig: Enable Qualcomm SPI and QSPI controller
      arm64: defconfig: Enable Qualcomm socinfo driver
      arm64: defconfig: Enable Qualcomm CPUfreq HW driver
      arm64: defconfig: Enable Qualcomm pseudo rng
      arm64: defconfig: Enable Qualcomm watchdog driver
      arm64: defconfig: Enable ATH10K_SNOC

Jeffrey Hugo (2):
      arm64: defconfig: Enable QCA Bluetooth over UART
      arm64: defconfig: Enable SN65DSI86 display bridge

Jorge Ramirez-Ortiz (1):
      arm64: defconfig: Enable HFPLL

Lina Iyer (1):
      arm64: defconfig: enable PDC interrupt controller for Qualcomm SDM845

Niklas Cassel (2):
      arm64: defconfig: enable CONFIG_QCOM_CPR
      arm64: defconfig: enable CONFIG_ARM_QCOM_CPUFREQ_NVMEM

 arch/arm64/configs/defconfig | 22 ++++++++++++++++++++++
 1 file changed, 22 insertions(+)
