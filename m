Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 167184399A5
	for <lists+linux-arm-msm@lfdr.de>; Mon, 25 Oct 2021 17:07:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233789AbhJYPJa (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 25 Oct 2021 11:09:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49140 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233786AbhJYPJ3 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 25 Oct 2021 11:09:29 -0400
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com [IPv6:2a00:1450:4864:20::431])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 37B9EC061746
        for <linux-arm-msm@vger.kernel.org>; Mon, 25 Oct 2021 08:07:07 -0700 (PDT)
Received: by mail-wr1-x431.google.com with SMTP id a16so12194504wrh.12
        for <linux-arm-msm@vger.kernel.org>; Mon, 25 Oct 2021 08:07:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=r3wknB51IB1YnTAJzsIFZkuKQE3RsPZNmcjzc4IBcDg=;
        b=ORwqpZirW8FsR0ML6vPd1iyQKwDX8LGmP7hvwMIfz4o0N+ZAL8WcEFOHK/LNOU1Pka
         yTneVoSnEgli5MS6Fx/xoEMvylRbQqpcx8u2qhvujpQ4wBPP6XJq9i3mrS1CQSktS4mZ
         sViONSQjOZJFnY5TskRD4CSlFucgsji1y1rksvjNachaIlk+GsW+ym71UFyoloT5Otuu
         /Enr/KQn5HCoapLrPDF7CLfqwnj/w9WyHaX1T6dfreBLfnrC6V6QfUmC+yVIa8PF1//F
         qUGcYDiyQud1qU8wsm6Kme7rtZo72hyaybZoxboFlTH7Xk++8TGc8bHP54Tm6XaaQ4v1
         Y0cQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=r3wknB51IB1YnTAJzsIFZkuKQE3RsPZNmcjzc4IBcDg=;
        b=Q0afCu0G02Kd79Y8aAm9pxzKnhxYSo9jA2zA19C91ALO3v47WwFzuNgctapSVa9EZ1
         DROP8igW1NPN+Q9WRCmb6v4Y+vaYBVeoYG3aORCFieammpgvaTibBh70Nbd2oxQojz90
         REknTOmSGpkTc4Xoo6kOK9kApXJuzdSXZotYuOtjagDCbzHOCas3cbTKz7QtEsTh6j2r
         j1lkTUvBN0BFoT+pmfCnYRSgi2AEILn8xYMR4j31VqaYbLlE6gc/H42P3AqgT9GN+C0J
         NIR5O/XDy76woHTQ+uLwsEr8JHOa85RJLgkah5R1RkGyOkebl71Q+KgMJePRzD1HSFs1
         6YtA==
X-Gm-Message-State: AOAM5305xYEpUONKZEUTMbSld74/JbeGiO1jT5JU01+cVD3SRDXegyAq
        uqSGhdkAXficLMbgaFpi53uUUA==
X-Google-Smtp-Source: ABdhPJy0TLBHbJ825k86gTm3EtWbSekMuzP/+YvTPC6lXpchekFbsp+EVH5b+3G7gYTyRbdBAlJeRQ==
X-Received: by 2002:a5d:4a12:: with SMTP id m18mr23677773wrq.203.1635174425787;
        Mon, 25 Oct 2021 08:07:05 -0700 (PDT)
Received: from sagittarius-a.chello.ie (188-141-3-169.dynamic.upc.ie. [188.141.3.169])
        by smtp.gmail.com with ESMTPSA id f20sm19173554wmq.38.2021.10.25.08.07.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 Oct 2021 08:07:05 -0700 (PDT)
From:   Bryan O'Donoghue <bryan.odonoghue@linaro.org>
To:     linux@roeck-us.net, heikki.krogerus@linux.intel.com,
        gregkh@linuxfoundation.org, bjorn.andersson@linaro.org,
        robh+dt@kernel.org, linux-usb@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
Cc:     wcheng@codeaurora.org, bryan.odonoghue@linaro.org
Subject: [PATCH 0/6] Add pm8150b TPCM driver
Date:   Mon, 25 Oct 2021 16:09:00 +0100
Message-Id: <20211025150906.176686-1-bryan.odonoghue@linaro.org>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

This series adds a set of yaml and a driver to bind together the type-c and
pdphy silicon in qcom's pm8150b block as a Linux type-c port manager.

As part of that we retire the existing qcom-pmic-typec driver and fully
replicate its functionality inside of the new block with the additional
pdphy stuff along with it.

An additional series will follow this one for the SoC and RB5 dtsi and dts
respectively.

A bootable series can be found here

Link: https://git.linaro.org/people/bryan.odonoghue/kernel.git/log/?h=usb-next-25-10-21-pm8150b-tcpm

Bryan O'Donoghue (6):
  dt-bindings: usb: Add qcom,pmic-usb-typec dt-binding header
  dt-bindings: usb: Add Qualcomm PMIC type C controller YAML schema
  dt-bindings: usb: Add qcom,pmic-usb-pdphy dt-binding header
  dt-bindings: usb: Add Qualcomm PMIC PDPHY controller YAML schema
  dt-bindings: usb: Add Qualcomm PMIC TCPM YAML schema
  usb: typec: qcom: Add pm8150b TCPM driver

 .../bindings/usb/qcom,pmic-pdphy.yaml         | 115 ++++
 .../bindings/usb/qcom,pmic-tcpm.yaml          | 110 ++++
 .../bindings/usb/qcom,pmic-typec.yaml         | 116 ++++
 MAINTAINERS                                   |   8 +
 drivers/usb/typec/Makefile                    |   1 -
 drivers/usb/typec/qcom-pmic-typec.c           | 262 --------
 drivers/usb/typec/tcpm/Kconfig                |  11 +
 drivers/usb/typec/tcpm/Makefile               |   1 +
 .../usb/typec/tcpm/qcom/qcom_pmic_tcpm_core.c | 345 ++++++++++
 .../typec/tcpm/qcom/qcom_pmic_tcpm_pdphy.c    | 577 +++++++++++++++++
 .../typec/tcpm/qcom/qcom_pmic_tcpm_pdphy.h    |  85 +++
 .../typec/tcpm/qcom/qcom_pmic_tcpm_typec.c    | 593 ++++++++++++++++++
 .../typec/tcpm/qcom/qcom_pmic_tcpm_typec.h    | 163 +++++
 .../usb/typec/tcpm/qcom,pmic-usb-pdphy.h      |  18 +
 .../usb/typec/tcpm/qcom,pmic-usb-typec.h      |  18 +
 15 files changed, 2160 insertions(+), 263 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/usb/qcom,pmic-pdphy.yaml
 create mode 100644 Documentation/devicetree/bindings/usb/qcom,pmic-tcpm.yaml
 create mode 100644 Documentation/devicetree/bindings/usb/qcom,pmic-typec.yaml
 delete mode 100644 drivers/usb/typec/qcom-pmic-typec.c
 create mode 100644 drivers/usb/typec/tcpm/qcom/qcom_pmic_tcpm_core.c
 create mode 100644 drivers/usb/typec/tcpm/qcom/qcom_pmic_tcpm_pdphy.c
 create mode 100644 drivers/usb/typec/tcpm/qcom/qcom_pmic_tcpm_pdphy.h
 create mode 100644 drivers/usb/typec/tcpm/qcom/qcom_pmic_tcpm_typec.c
 create mode 100644 drivers/usb/typec/tcpm/qcom/qcom_pmic_tcpm_typec.h
 create mode 100644 include/dt-bindings/usb/typec/tcpm/qcom,pmic-usb-pdphy.h
 create mode 100644 include/dt-bindings/usb/typec/tcpm/qcom,pmic-usb-typec.h

-- 
2.33.0

