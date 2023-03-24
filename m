Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 870306C80C0
	for <lists+linux-arm-msm@lfdr.de>; Fri, 24 Mar 2023 16:10:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231215AbjCXPKl (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 24 Mar 2023 11:10:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56630 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231277AbjCXPKk (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 24 Mar 2023 11:10:40 -0400
Received: from mail-ed1-x52e.google.com (mail-ed1-x52e.google.com [IPv6:2a00:1450:4864:20::52e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 71B30DBD6
        for <linux-arm-msm@vger.kernel.org>; Fri, 24 Mar 2023 08:10:37 -0700 (PDT)
Received: by mail-ed1-x52e.google.com with SMTP id b20so9273665edd.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 24 Mar 2023 08:10:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1679670636;
        h=in-reply-to:references:from:subject:cc:to:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GtH3EySMDIrw+lZaElaWD6H77SmUICjB03o3KHw7964=;
        b=4KBk5by17CO5KmKepXBL60mhAyiD0mY6LsmCidHOWe4QrkZTthadwgyShcBCsOHEoS
         uQfOxPiUbuK5espG5oLIC7DvREqJXwfSinDauBZshXoF1nRZQieEmeq9ZfmlAWNMX/NJ
         oUBzPum8EQpnc30fxewPdHJULyQdqwa1YZcF1dYuv4tV5kdxV8be471wG+/NhkXjGYmT
         hPPsmYeB93E7T/jgBPiPzlRXOS9RvRwjJq65YSGUROIyn7SLB3iHf6NC1gbNXQbzLzzu
         NltwrHquLkBZmRygFO+Zh5EH59I3BirP00lBfyS+y2Y/db77OItGdk5OAG+EzCG2MNjy
         vLwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679670636;
        h=in-reply-to:references:from:subject:cc:to:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=GtH3EySMDIrw+lZaElaWD6H77SmUICjB03o3KHw7964=;
        b=DX2/jW9JPCveJrP6IW13nOL7Tc9HyMEPFXrQ3FwvWuPUu4g1QJZ2W4qws4rVTV8CF9
         iJ/sCGZEroGHOrGLxjtuudQc/L+/HqPzthfNQWnTz9gfkWjFkJhgEHHStcLgRBCExOd4
         xnYMvye92qO7WW+ZCpSC9Vz3WLn7OpCAYz9U7g9N8xqo0HSMAIdgxIzJoCYN9hhRxY8v
         flUGclmSAMlDONhg0PLfs6IfIoJs3kDfvNM6aQAJzcM74TL+qvOPj1wV827mh2apq79W
         FG7kXyXDJgCHrc+pCnPvfWN7fOEwkJE4WiWB8gnc1Lkz/57ffS8t52F9Q2Ouocmdevjy
         turw==
X-Gm-Message-State: AAQBX9eWuVrUPjiARDx7/1+rJpHhkxxCDfrE0fiA1Nefg1XtdGh6Z20d
        U99/j9RZDawv7jQbZaWR6HneFA==
X-Google-Smtp-Source: AKy350bgvYQzINUfdVFIAXWRNiS65HRBsyBFtPJc247rP/+q7Cu1ksH9gUnC6Bp8pFlwB0krvX0pQg==
X-Received: by 2002:a17:907:a0b:b0:93e:739f:b0b3 with SMTP id bb11-20020a1709070a0b00b0093e739fb0b3mr2203088ejc.50.1679670635938;
        Fri, 24 Mar 2023 08:10:35 -0700 (PDT)
Received: from localhost (84-115-214-73.cable.dynamic.surfer.at. [84.115.214.73])
        by smtp.gmail.com with ESMTPSA id hb6-20020a170906b88600b0093120a11a5dsm10475739ejb.92.2023.03.24.08.10.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 24 Mar 2023 08:10:35 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date:   Fri, 24 Mar 2023 16:10:34 +0100
Message-Id: <CREPJP5KTX2D.VCM8IIZIP1ZT@otso>
To:     "Bryan O'Donoghue" <bryan.odonoghue@linaro.org>,
        <linux@roeck-us.net>, <heikki.krogerus@linux.intel.com>,
        <gregkh@linuxfoundation.org>, <andersson@kernel.org>,
        <robh+dt@kernel.org>, <krzysztof.kozlowski+dt@linaro.org>,
        <linux-usb@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <devicetree@vger.kernel.org>
Cc:     <wcheng@codeaurora.org>, <caleb.connolly@linaro.org>,
        <konrad.dybcio@linaro.org>, <subbaram@quicinc.com>,
        <jackp@quicinc.com>, <robertom@qti.qualcomm.com>,
        <lujianhua000@gmail.com>
Subject: Re: [PATCH v4 00/18] Add Qualcomm PMIC TPCM support
From:   "Luca Weiss" <luca.weiss@fairphone.com>
X-Mailer: aerc 0.14.0
References: <20230318121828.739424-1-bryan.odonoghue@linaro.org>
In-Reply-To: <20230318121828.739424-1-bryan.odonoghue@linaro.org>
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
        DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Bryan,

On Sat Mar 18, 2023 at 1:18 PM CET, Bryan O'Donoghue wrote:
> Bryan O'Donoghue (17):
>   dt-bindings: regulator: qcom,usb-vbus-regulator: Mark reg as required
>   dt-bindings: regulator: qcom,usb-vbus-regulator: Mark
>     regulator-*-microamp required
>   dt-bindings: phy: qcom,sc7180-qmp-usb3-dp-phy: Add orientation-switch
>     as optional
>   dt-bindings: phy: qcom,sc7180-qmp-usb3-dp-phy: Add port as an optional
>   dt-bindings: usb: Add qcom,pmic-typec dt-binding header
>   dt-bindings: usb: Add Qualcomm PMIC Type-C controller YAML schema
>   dt-bindings: usb: Add qcom,pmic-pdphy dt-binding header
>   dt-bindings: usb: Add Qualcomm PMIC PDPHY controller YAML schema
>   dt-bindings: usb: Add Qualcomm PMIC TCPM YAML schema
>   dt-bindings: mfd: qcom,spmi-pmic: Add pdphy to SPMI device types
>   dt-bindings: mfd: qcom,spmi-pmic: Add typec to SPMI device types
>   usb: typec: qcom: Add Qualcomm PMIC TCPM support
>   arm64: dts: qcom: pm8150b: Add a TCPM description
>   arm64: dts: qcom: qrb5165-rb5: Switch on Type-C VBUS boost
>   arm64: dts: qcom: qrb5165-rb5: Switch on basic TCPM
>   arm64: dts: qcom: qrb5165-rb5: Switch on TCPM usb-role-switching for
>     usb_1
>   arm64: dts: qcom: qrb5165-rb5: Switch on TCPM orientation-switch for
>     usb_1_qmpphy
>
> Dmitry Baryshkov (1):
>   phy: qcom-qmp: Register as a typec switch for orientation detection

I've just given this a spin on sm7225-fairphone-fp4 with pm7250b as the
PMIC (instead of pm8150b).

Overall it seems to work, which is awesome! I think I sent you emails in
the past where I had troubles getting earlier revisions to work.

Still there's some rough edges:

As Jianhua Lu has already reported, I'm also hitting the vbus vsafe5v
message quite often. Returning 0 in that function on error seems to work
around it and everything appears to be fine regardless.

  [  243.939593] qcom,pmic-typec c440000.spmi:pmic@2:typec@1500: vbus vsafe=
5v fail
  [  243.939600] qcom,pmic-tcpm pm7250b-tcpm: set_vbus set: 1 result -110

If you want to take a peek at the schematics for this device, they're
available here:
https://www.fairphone.com/wp-content/uploads/2022/09/FP4_Information-for-re=
pairers-and-recyclers.pdf
USB things you can find on page 57, the pm7250b is on page 49.

When plugging in the device with TCPM on into my PC (peripheral mode)
then the USB device registers and unregisters every couple of seconds,
never stays stable on. No messages in dmesg when this happens. This only
happens with the USB-C plug in one direction, in the other it
works reliable.

Also I've had it that at some point the usb connection seemed to be kind
of stuck on host mode, plugging the device into my PC didn't appear to
do anything.

For host mode I tried using both a USB stick and a USB-C to headphone
jack dongle, both work fine in both directions.

In any case, I look very much forward to this landing, it will be
awesome to have this feature working OOTB! And let me know if you need
anything tested on this hardware.

Regards
Luca

>
>  .../bindings/mfd/qcom,spmi-pmic.yaml          |   8 +
>  .../phy/qcom,sc7180-qmp-usb3-dp-phy.yaml      |  10 +
>  .../regulator/qcom,usb-vbus-regulator.yaml    |  10 +-
>  .../bindings/usb/qcom,pmic-pdphy.yaml         |  89 +++
>  .../bindings/usb/qcom,pmic-typec.yaml         |  88 +++
>  .../bindings/usb/qcom,pmic-virt-tcpm.yaml     |  88 +++
>  MAINTAINERS                                   |  10 +
>  arch/arm64/boot/dts/qcom/pm8150b.dtsi         |  70 ++
>  arch/arm64/boot/dts/qcom/qrb5165-rb5.dts      |  63 +-
>  drivers/phy/qualcomm/Kconfig                  |   8 +
>  drivers/phy/qualcomm/phy-qcom-qmp-combo.c     |  80 ++-
>  drivers/usb/typec/Kconfig                     |  13 -
>  drivers/usb/typec/Makefile                    |   1 -
>  drivers/usb/typec/qcom-pmic-typec.c           | 261 -------
>  drivers/usb/typec/tcpm/Kconfig                |  11 +
>  drivers/usb/typec/tcpm/Makefile               |   1 +
>  drivers/usb/typec/tcpm/qcom/Makefile          |   6 +
>  drivers/usb/typec/tcpm/qcom/qcom_pmic_pdphy.c | 605 +++++++++++++++++
>  drivers/usb/typec/tcpm/qcom/qcom_pmic_pdphy.h |  85 +++
>  drivers/usb/typec/tcpm/qcom/qcom_pmic_typec.c | 637 ++++++++++++++++++
>  drivers/usb/typec/tcpm/qcom/qcom_pmic_typec.h | 163 +++++
>  .../usb/typec/tcpm/qcom/qcom_pmic_virt_tcpm.c | 326 +++++++++
>  .../dt-bindings/usb/typec/qcom,pmic-pdphy.h   |  18 +
>  .../dt-bindings/usb/typec/qcom,pmic-typec.h   |  18 +
>  24 files changed, 2388 insertions(+), 281 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/usb/qcom,pmic-pdphy=
.yaml
>  create mode 100644 Documentation/devicetree/bindings/usb/qcom,pmic-typec=
.yaml
>  create mode 100644 Documentation/devicetree/bindings/usb/qcom,pmic-virt-=
tcpm.yaml
>  delete mode 100644 drivers/usb/typec/qcom-pmic-typec.c
>  create mode 100644 drivers/usb/typec/tcpm/qcom/Makefile
>  create mode 100644 drivers/usb/typec/tcpm/qcom/qcom_pmic_pdphy.c
>  create mode 100644 drivers/usb/typec/tcpm/qcom/qcom_pmic_pdphy.h
>  create mode 100644 drivers/usb/typec/tcpm/qcom/qcom_pmic_typec.c
>  create mode 100644 drivers/usb/typec/tcpm/qcom/qcom_pmic_typec.h
>  create mode 100644 drivers/usb/typec/tcpm/qcom/qcom_pmic_virt_tcpm.c
>  create mode 100644 include/dt-bindings/usb/typec/qcom,pmic-pdphy.h
>  create mode 100644 include/dt-bindings/usb/typec/qcom,pmic-typec.h
>
> --=20
> 2.39.2

