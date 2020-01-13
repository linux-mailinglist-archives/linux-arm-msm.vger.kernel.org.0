Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8F597139AE7
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Jan 2020 21:44:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726587AbgAMUoK (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 13 Jan 2020 15:44:10 -0500
Received: from mail-pg1-f193.google.com ([209.85.215.193]:36047 "EHLO
        mail-pg1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726086AbgAMUoJ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 13 Jan 2020 15:44:09 -0500
Received: by mail-pg1-f193.google.com with SMTP id k3so5275772pgc.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 13 Jan 2020 12:44:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:mime-version:content-disposition
         :user-agent;
        bh=IS3OPRaipGwb6SDedGmvTz6F6ADZoIh+zjI/wxisAKE=;
        b=eTWW69nNpsITRLeUbjhj30qR/Go5gQdI5vug5bH7RaFEpcCxLBdlkcMy9xjfvgl9Md
         WsuPrVhJ8eFnhNESdcvRbbyBppLj5MP+hDi4YDfPIlpedMTf3r2alm2jJ4w/V+cdqk+0
         YOcOEKDPBI5oLJDItd2sV2gXCAjsA+4RmEv9+FYrf0yS1DwBXMW1YS4z0e6CLFGUQ49x
         rJ8R6mzOciG6sLVJ832K9Ek18nH8XyFWWjzsS3WKV6/N7Q9cZuYAvVx3ZJUrqxAu61jO
         /rlkJK1lwhP73pVGH/h67V0xb29G5sgIA4HKw4H4NfX0fve30EzDKb8mPeDahAmovWuk
         1ZCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
         :content-disposition:user-agent;
        bh=IS3OPRaipGwb6SDedGmvTz6F6ADZoIh+zjI/wxisAKE=;
        b=Ve/M2x73Z7FVyFb5Cu7kYFkgIfsi0PR+h/lQLj+YQ3DSTvoQifchiklG+mSS49Jfzn
         mn+CIMkjEpKg9E/FNh8eD2y28X6s+FPAQDYLh/BEdki6panuWoUFVb6PPIUskeFquaLy
         RYbGebaoasS3DdVMod1JV2sOOHXLRTYIgmeItnSlJP0tJcFtCehuwr39Wu7qf/HqPspg
         K5GbkDUiDz824G+L+qF3PIcUtAulBP02bkDs0JXdFu9GceT+qwnl6uVuOnDl+vAMh5XH
         H9LrT+XcNJvcM7aNYolMKYQi07R1bM/NsagAmXLkx+S8KP/wHEnNLl3g4Boqcds1NxsT
         DuIQ==
X-Gm-Message-State: APjAAAUNNcIlBird9eYJn2DpP5e9dlsCYpEr8iSO/ikUfiJkV3AnA+jJ
        vh16hEt0qE4RYsFWICKr/tOTOAGBfr0=
X-Google-Smtp-Source: APXvYqzBlSY6COwVN91zi0NmCeOSR/L97Fhol7ZFksfge4T8I0sw2EYjN1OsJ2Uxz2CoN1+9+LmVKw==
X-Received: by 2002:a63:da4d:: with SMTP id l13mr23826999pgj.106.1578948248559;
        Mon, 13 Jan 2020 12:44:08 -0800 (PST)
Received: from yoga (104-188-17-28.lightspeed.sndgca.sbcglobal.net. [104.188.17.28])
        by smtp.gmail.com with ESMTPSA id v8sm14875557pff.151.2020.01.13.12.44.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jan 2020 12:44:08 -0800 (PST)
Date:   Mon, 13 Jan 2020 12:44:05 -0800
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     arm@kernel.org, soc@kernel.org
Cc:     linux-arm-msm@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        Andy Gross <agross@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
        Olof Johansson <olof@lixom.net>,
        Kevin Hilman <khilman@baylibre.com>,
        Elliot Berman <eberman@codeaurora.org>,
        Sibi Sankar <sibis@codeaurora.org>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Douglas Anderson <dianders@chromium.org>,
        Jeffrey Hugo <jeffrey.l.hugo@gmail.com>,
        Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
Subject: [GIT PULL] Qualcomm driver updates for v5.6
Message-ID: <20200113204405.GD3325@yoga>
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

  https://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux.git tags/qcom-drivers-for-5.6

for you to fetch changes up to 9a434cee773ae15309ac225f27551b5492618e4a:

  firmware: qcom_scm: Dynamically support SMCCC and legacy conventions (2020-01-07 22:14:43 -0800)

----------------------------------------------------------------
Qualcomm driver updates for v5.6

* SCM major refactoring and cleanup
* Properly flag active only power domains as active only
* Add SC7180 and SM8150 RPMH power domains
* Return EPROBE_DEFER from QMI if packet family is not yet available

----------------------------------------------------------------
Douglas Anderson (1):
      soc: qcom: rpmhpd: Set 'active_only' for active only power domains

Elliot Berman (17):
      firmware: qcom_scm: Rename macros and structures
      firmware: qcom_scm: Apply consistent naming scheme to command IDs
      firmware: qcom_scm: Remove unused qcom_scm_get_version
      firmware: qcom_scm-64: Make SMC macros less magical
      firmware: qcom_scm-64: Move svc/cmd/owner into qcom_scm_desc
      firmware: qcom_scm-64: Add SCM results struct
      firmware: qcom_scm-64: Move SMC register filling to qcom_scm_call_smccc
      firmware: qcom_scm-64: Improve SMC convention detection
      firmware: qcom_scm-32: Use SMC arch wrappers
      firmware: qcom_scm-32: Add funcnum IDs
      firmware: qcom_scm-32: Use qcom_scm_desc in non-atomic calls
      firmware: qcom_scm-32: Move SMCCC register filling to qcom_scm_call
      firmware: qcom_scm-32: Create common legacy atomic call
      firmware: qcom_scm-32: Add device argument to atomic calls
      firmware: qcom_scm: Order functions, definitions by service/command
      firmware: qcom_scm: Remove thin wrappers
      firmware: qcom_scm: Dynamically support SMCCC and legacy conventions

Jeffrey Hugo (1):
      soc: qcom: qmi: Return EPROBE_DEFER if no address family

Krzysztof Kozlowski (2):
      soc: qcom: Fix Kconfig indentation
      firmware: scm: Add stubs for OCMEM and restore_sec_cfg_available

Sai Prakash Ranjan (1):
      dt-bindings: msm: Rename cache-controller to system-cache-controller

Sibi Sankar (5):
      dt-bindings: power: Add rpmh power-domain bindings for SM8150
      soc: qcom: rpmhpd: Add SM8150 RPMH power-domains
      dt-bindings: power: Add rpmh power-domain bindings for sc7180
      soc: qcom: rpmhpd: Add SC7180 RPMH power-domains
      dt-bindings: power: rpmpd: Convert rpmpd bindings to yaml

 .../devicetree/bindings/arm/msm/qcom,llcc.yaml     |   2 +-
 .../devicetree/bindings/power/qcom,rpmpd.txt       | 148 ----
 .../devicetree/bindings/power/qcom,rpmpd.yaml      | 170 ++++
 drivers/firmware/Kconfig                           |   8 -
 drivers/firmware/Makefile                          |   5 +-
 drivers/firmware/qcom_scm-32.c                     | 671 ----------------
 drivers/firmware/qcom_scm-64.c                     | 579 --------------
 drivers/firmware/qcom_scm-legacy.c                 | 242 ++++++
 drivers/firmware/qcom_scm-smc.c                    | 151 ++++
 drivers/firmware/qcom_scm.c                        | 854 ++++++++++++++++-----
 drivers/firmware/qcom_scm.h                        | 178 +++--
 drivers/soc/qcom/Kconfig                           |  30 +-
 drivers/soc/qcom/qmi_interface.c                   |   8 +-
 drivers/soc/qcom/rpmhpd.c                          |  56 ++
 include/dt-bindings/power/qcom-rpmpd.h             |  24 +
 include/linux/qcom_scm.h                           | 119 +--
 16 files changed, 1504 insertions(+), 1741 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/power/qcom,rpmpd.txt
 create mode 100644 Documentation/devicetree/bindings/power/qcom,rpmpd.yaml
 delete mode 100644 drivers/firmware/qcom_scm-32.c
 delete mode 100644 drivers/firmware/qcom_scm-64.c
 create mode 100644 drivers/firmware/qcom_scm-legacy.c
 create mode 100644 drivers/firmware/qcom_scm-smc.c

