Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 06BB56E0FD1
	for <lists+linux-arm-msm@lfdr.de>; Thu, 13 Apr 2023 16:20:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230099AbjDMOUA (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 13 Apr 2023 10:20:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51278 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230223AbjDMOTv (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 13 Apr 2023 10:19:51 -0400
Received: from mail-ej1-x62b.google.com (mail-ej1-x62b.google.com [IPv6:2a00:1450:4864:20::62b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5B7887D9C
        for <linux-arm-msm@vger.kernel.org>; Thu, 13 Apr 2023 07:19:48 -0700 (PDT)
Received: by mail-ej1-x62b.google.com with SMTP id q23so28367323ejz.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 13 Apr 2023 07:19:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1681395587; x=1683987587;
        h=in-reply-to:references:cc:to:from:subject:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Pb/QYBj5DO4S8x7hRJ0EcLzAuGXstOMjS8bk47CPw2E=;
        b=dyDQtEKltsETKHLJU2vVgS3MK1Rcnh25wvcXpQgWUSByyqk25whjbf5oto0PDg67/T
         OsqN0Uc9VPtMaBArVcebe3sui5BpkY75PCO/8jZ9QvbYWKvHTgOi/rwFafeiYyK4ZV+d
         f7z0v768dhv2YXfeA4baaWlHeK0Mp5Wave202UTpfyIhrLNewApYU5S1SY8Y06PKM5sx
         qVHqy3AGNlag9CZ+/FaRWumtxKn55hBYS8ugWOo/rc07TnZJbo1md3L4fuBF45sg5+7J
         UQbMD8vkNdbCvR8KPLJcIdAb7Alg3YyIRxXhgSJFv/QtpJLFSTqZ5KKSICQehKSlcvrj
         56dg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681395587; x=1683987587;
        h=in-reply-to:references:cc:to:from:subject:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Pb/QYBj5DO4S8x7hRJ0EcLzAuGXstOMjS8bk47CPw2E=;
        b=M+2YgfX7uwCWG3F4Mhj5gmV+c4fm+22SD4qKqWf3buMqc2GVrzjJGk57WIcqE1oK/k
         G/wYGLHi7w3rAnzJPLq79nZXFT2WopzjOaCfAawNWGJitR2jtYF1QiIPxA8HQK7SX7fJ
         vd/qpTkJSB602eosHx26O16Q3zO9kvrFfqcT7a0GDrjWap2duLUvPiqvnxM7gyJ0ZHo+
         kM0Xsrz1fw9Pdn0hhsIduognOU/zgCQWp/WSSUWLv/QKudsGu3Th7CyoQLuSIVVuCB85
         umYmEMCPidQBgZPLXmBYosnzqYT+iPu2RURFXYT16Ahj+FFsE1OHyXO9wK7txf9gaLW6
         FjTA==
X-Gm-Message-State: AAQBX9dg2iZB/aMbb0J/3DrN3ZNzGmN6obxjo0iLXDs2ybhZX09a2d3c
        jfQc0g0a5aNKzKxxP3UXPA41lQ==
X-Google-Smtp-Source: AKy350ZG6s81Qaa8AkdJTOa6y49nPcMfc4Fhj7jq65G3njv0qEv5S7F0xk1OJWGovvDhtWWO1Dn1Gw==
X-Received: by 2002:a17:906:6dc3:b0:94e:7bde:3108 with SMTP id j3-20020a1709066dc300b0094e7bde3108mr3684423ejt.27.1681395586705;
        Thu, 13 Apr 2023 07:19:46 -0700 (PDT)
Received: from localhost (144-178-202-138.static.ef-service.nl. [144.178.202.138])
        by smtp.gmail.com with ESMTPSA id ov5-20020a170906fc0500b00931baabe36csm1048007ejb.63.2023.04.13.07.19.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 13 Apr 2023 07:19:46 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date:   Thu, 13 Apr 2023 16:19:45 +0200
Message-Id: <CRVOZOPMKBX4.2T7FOCWF0RKBJ@otso>
Subject: Re: [PATCH v5 00/14] Add Qualcomm PMIC TPCM support
From:   "Luca Weiss" <luca.weiss@fairphone.com>
To:     "Bryan O'Donoghue" <bryan.odonoghue@linaro.org>,
        <linux@roeck-us.net>, <heikki.krogerus@linux.intel.com>,
        <gregkh@linuxfoundation.org>, <andersson@kernel.org>,
        <robh+dt@kernel.org>, <krzysztof.kozlowski+dt@linaro.org>,
        <linux-usb@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <devicetree@vger.kernel.org>
Cc:     <caleb.connolly@linaro.org>, <konrad.dybcio@linaro.org>,
        <subbaram@quicinc.com>, <jackp@quicinc.com>,
        <robertom@qti.qualcomm.com>
X-Mailer: aerc 0.14.0
References: <20230413113438.1577658-1-bryan.odonoghue@linaro.org>
In-Reply-To: <20230413113438.1577658-1-bryan.odonoghue@linaro.org>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Bryan,

On Thu Apr 13, 2023 at 1:34 PM CEST, Bryan O'Donoghue wrote:
> V5:
> - Amagamates into once device, Heikki, Rob
>
> - Takes feedback on usage form Luka and Jianhua on VSafeV state transitio=
n detection
>   dev_err() -> dev_warn()
>
> - Orientation graph example and general expected bindings
>   I discussed offline with Bjorn the conclusions of the glink/sbu model.
>   The expected orientation-switch path is
>     connector/port@0 <-> phy/port@X <-> dp/port@0
>   This can then be expanded to
>     connector/port@0 <-> redriver/port@0 <-> phy/port@X <->  dp/port@0
>
>   - Rob, Bjorn, Krzysztof
>
> - Data role
>   The data-role path is
>     connector/port@0 <-> dwc3/port@Y=20

I believe I have adjusted my dts correctly for v5 compared to v4 but now
the usb doesn't seem to work anymore in most cases.

Only when having the phone already plugged in during boot in one
orientation does USB come up, but also disappears once you replug the
cable. I still see the same (or at least visually similar) messages when
plugging in the USB cable or the USB stick but nothing more than that
happens.

Not that v4 worked perfectly on pm7250b+sm7225(/sm6350) but at least it
worked in most cases as described in the emails there. Since the driver
structure changed quite a bit, git diff isn't helpful here
unfortunately.

Don't think it matters but worth mentioning that sm6350 uses the new
qmpphy bindings as described in qcom,sc8280xp-qmp-usb43dp-phy.yaml (this
was also the case when testing v4 of this).

Any idea?

Regards
Luca

>
> Previous set:
> https://lore.kernel.org/linux-arm-msm/20230318121828.739424-1-bryan.odono=
ghue@linaro.org/
>
> Bootable:
> https://git.codelinaro.org/bryan.odonoghue/kernel/-/tree/linux-next-23-04=
-12-pm8150b-tcpm-qcom-wrapper-typec-mux
>   =20
> V4:
> - Per Rob's input the pdphy and type-c appear as stadalone blocks
>   inside of the PMIC declaration which is a 1:1 mapping of PMIC hardware.
>   The TCPM virtual device is declared at the top-level.
>   https://lore.kernel.org/all/YY7p7jviA3ZG05gL@robh.at.kernel.org/
>
> - Squashes the removal of the old driver with the addition of the new. - =
Heikki, Gunter
>   https://lore.kernel.org/all/YYVHcHC1Gm92VxEM@kuha.fi.intel.com/
>
> - Reworked Dmitry's old patch for the QMP to account for file renames and
>   very minimal code-drift in the interregnum.
>
> - New yaml checks drive update of PMIC VBUS yaml
>
> - Some housekeeping on the sc7180 yaml side. sc7180 is not supported yet.
>
> - Expands and fixes the examples being added in the PMIC tcpm examples.
>
> Previous set:
> https://lore.kernel.org/all/20211105033558.1573552-1-bryan.odonoghue@lina=
ro.org/
>
> Bootable:
> https://git.codelinaro.org/bryan.odonoghue/kernel/-/commits/linux-next-23=
-03-18-pm8150b-tcpm-qcom-wrapper-typec-mux
>
> V3:
> Rob Herrings review
>
> - Drops use of remote-endpoint and ports to bind
>   tcpm to pdphy and typec replacing with phandle
>
> - Drops pmic-pdphy-* and pmic-typec-* from interrupt names
>   as suggested
>
> - Passes make dt_binding_check DT_CHECKER_FLAGS=3D-m
>
> BOD
> - Noticed qcom_pmic_tcpm_pdphy_enable() was missing a
>   regulator_disable in case of an error, added.
>
> - qcom_pmic_tcpm_pdphy_probe()
>   devm_regulator_get() should come before regmap_get()
>   as is the case in qcom_pmic_tcpm_typec_probe()
>
> - Fixes compatible name in qcom,pmic-typec.yaml should
>   have read qcom,pm8150b-typec not qcom,pm8150b-usb-typec
>
> - Makes sure compat for core is "qcom,pm8150b-tcpm" in
>   docs and driver
>
> - Drops redundant return in void qcom_pmic_tcpm_pdphy_reset_off()
>
> Kernel Robot
> - Drops unused variable debounced in qcom_pmic_tcpm_typec_get_cc()
>
> - Drops unsused variable orientation in qcom_pmic_tcpm_typec_set_cc()
>
> Latest bootable series can be found here:
> Link: https://git.linaro.org/people/bryan.odonoghue/kernel.git/log/?h=3Du=
sb-next-04-11-21-pm8150b-tcpm-v3
>
> git diff usb-next-27-10-21-pm8150b-tcpm-v2 -- drivers/usb/typec/tcpm/qcom=
/
> git diff usb-next-27-10-21-pm8150b-tcpm-v2 -- Documentation/devicetree/bi=
ndings/usb/qcom,pmic*
>
> Previous set:
> Link: https://lore.kernel.org/linux-usb/20211028164941.831918-1-bryan.odo=
noghue@linaro.org/T/#t
>
> V2 resend:
> - Adding omitted devicetree mailing list
>
> V2:
>
> Guenter Roeck's review
> - Converts suggested qcom_pmic_tcpm_core.c into one-liners
>
> - Adds comment on how polarity is set in set_polarity()
>
> - Removes optional set_current_limit()
>
> - regmap_read/regmap_write
>   Reviwing other pm8150b/spmi drivers I then added in checks for all
>   reamap_read()/regmap_write() calls.
>
> - Fixes (type =3D=3D TCPC_TX_CABLE_RESET || TCPC_TX_HARD_RESET)
>   thanks I definitely had the blinkers on there and didn't see that at al=
l
>
> - qcom_pmic_tcpm_pdphy_pd_transmit_payload()
>   Treats regmap_read and read value as separate error paths
>
> - qcom_pmic_tcpm_pdphy_set_pd_rx()
>   Replaces boolean if/else with !on as suggested
>
> - Returns -ENODEV not -EINVAL on dev_get_regmap() error
>
> - qcom_pmic_tcpm_pdphy_pd_receive()
>   Guenter asks: "No error return ?"
>   bod: No we are inside an ISR here if we read data we pass that off to T=
CPM
>        if somehow we don't read the data - it is "junk" there's no value =
IMO
>        in pushing an error upwards back to the handler.
>
> Heikki Krogerus' review
> - Includes Makefile I missed adding to my git index
>
> - Removes old Kconfig entry for remove driver
>
> Randy Dunlap's review=20
> - Rewords drivers/usb/typec/tcpm/Kconfig
>
> - Drops tautology "aggregates togther"
>
> - Corrects spelling typos
>
> BOD's own review
> - Drops redundant include of regmap.h in qcom_pmic_tcpm_core.c
>
> - Propogates qcom_pmic_tcpm_pdphy_disable() error upwards
>
> - Propogates pmic_pdphy_reset() error upwards
>
> - Drops error prints in qcom_pmic_tcpm_pdphy_pd_transmit_payload()
>   I had these in-place during development and don't recall them being
>   triggered even once, they are redundant, remove.
> =20
> Differences between the two can be seen by
> git diff usb-next-27-10-21-pm8150b-tcpm-v2..usb-next-25-10-21-pm8150b-tcp=
m -- drivers/usb/typec/tcpm
>
> Latest bootable series can be found here:
> Link: https://git.linaro.org/people/bryan.odonoghue/kernel.git/log/?h=3Du=
sb-next-27-10-21-pm8150b-tcpm-v2
>
> Previous set:
> Link: https://lore.kernel.org/all/20211025150906.176686-1-bryan.odonoghue=
@linaro.org/T/#t
>
> V1:
> This series adds a set of yaml and a driver to bind together the type-c a=
nd
> pdphy silicon in qcom's pm8150b block as a Linux type-c port manager.
>
> As part of that we retire the existing qcom-pmic-typec driver and fully
> replicate its functionality inside of the new block with the additional
> pdphy stuff along with it.
>
> An additional series will follow this one for the SoC and RB5 dtsi and dt=
s
> respectively.
>
> A bootable series can be found here
>
> Link: https://git.linaro.org/people/bryan.odonoghue/kernel.git/log/?h=3Du=
sb-next-25-10-21-pm8150b-tcpm
>
> Bryan O'Donoghue (13):
>   dt-bindings: regulator: qcom,usb-vbus-regulator: Mark reg as required
>   dt-bindings: regulator: qcom,usb-vbus-regulator: Mark
>     regulator-*-microamp required
>   dt-bindings: phy: qcom,sc7180-qmp-usb3-dp-phy: Add orientation-switch
>     as optional
>   dt-bindings: phy: qcom,sc7180-qmp-usb3-dp-phy: Add ports as an
>     optional
>   dt-bindings: usb: Add Qualcomm PMIC Type-C YAML schema
>   dt-bindings: mfd: qcom,spmi-pmic: Add typec to SPMI device types
>   arm64: dts: qcom: sm8250: Define ports for qmpphy
>     orientation-switching
>   arm64: dts: qcom: pm8150b: Add a TCPM description
>   arm64: dts: qcom: qrb5165-rb5: Switch on Type-C VBUS boost
>   arm64: dts: qcom: qrb5165-rb5: Switch on basic TCPM
>   arm64: dts: qcom: qrb5165-rb5: Switch on TCPM usb-role-switching for
>     usb_1
>   arm64: dts: qcom: qrb5165-rb5: Switch on TCPM orientation-switch for
>     usb_1_qmpphy
>   usb: typec: qcom: Add Qualcomm PMIC TCPM support
>
> Dmitry Baryshkov (1):
>   phy: qcom-qmp: Register as a typec switch for orientation detection
>
>  .../bindings/mfd/qcom,spmi-pmic.yaml          |   4 +
>  .../phy/qcom,sc7180-qmp-usb3-dp-phy.yaml      |  40 ++
>  .../regulator/qcom,usb-vbus-regulator.yaml    |  10 +-
>  .../bindings/usb/qcom,pmic-typec.yaml         | 169 ++++++
>  MAINTAINERS                                   |  10 +
>  arch/arm64/boot/dts/qcom/pm8150b.dtsi         |  40 ++
>  arch/arm64/boot/dts/qcom/qrb5165-rb5.dts      |  57 +-
>  arch/arm64/boot/dts/qcom/sm8250.dtsi          |  13 +
>  drivers/phy/qualcomm/Kconfig                  |   8 +
>  drivers/phy/qualcomm/phy-qcom-qmp-combo.c     |  80 ++-
>  drivers/usb/typec/Kconfig                     |  13 -
>  drivers/usb/typec/Makefile                    |   1 -
>  drivers/usb/typec/qcom-pmic-typec.c           | 261 --------
>  drivers/usb/typec/tcpm/Kconfig                |  11 +
>  drivers/usb/typec/tcpm/Makefile               |   1 +
>  drivers/usb/typec/tcpm/qcom/Makefile          |   6 +
>  drivers/usb/typec/tcpm/qcom/qcom_pmic_typec.c | 362 +++++++++++
>  .../typec/tcpm/qcom/qcom_pmic_typec_pdphy.c   | 528 +++++++++++++++++
>  .../typec/tcpm/qcom/qcom_pmic_typec_pdphy.h   | 115 ++++
>  .../typec/tcpm/qcom/qcom_pmic_typec_port.c    | 560 ++++++++++++++++++
>  .../typec/tcpm/qcom/qcom_pmic_typec_port.h    | 194 ++++++
>  21 files changed, 2202 insertions(+), 281 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/usb/qcom,pmic-typec=
.yaml
>  delete mode 100644 drivers/usb/typec/qcom-pmic-typec.c
>  create mode 100644 drivers/usb/typec/tcpm/qcom/Makefile
>  create mode 100644 drivers/usb/typec/tcpm/qcom/qcom_pmic_typec.c
>  create mode 100644 drivers/usb/typec/tcpm/qcom/qcom_pmic_typec_pdphy.c
>  create mode 100644 drivers/usb/typec/tcpm/qcom/qcom_pmic_typec_pdphy.h
>  create mode 100644 drivers/usb/typec/tcpm/qcom/qcom_pmic_typec_port.c
>  create mode 100644 drivers/usb/typec/tcpm/qcom/qcom_pmic_typec_port.h
>
> --=20
> 2.39.2

