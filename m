Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 42E136D1ABA
	for <lists+linux-arm-msm@lfdr.de>; Fri, 31 Mar 2023 10:48:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231205AbjCaIsy (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 31 Mar 2023 04:48:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53530 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231134AbjCaIsx (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 31 Mar 2023 04:48:53 -0400
Received: from mail-ed1-x529.google.com (mail-ed1-x529.google.com [IPv6:2a00:1450:4864:20::529])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CB32CD50E
        for <linux-arm-msm@vger.kernel.org>; Fri, 31 Mar 2023 01:48:48 -0700 (PDT)
Received: by mail-ed1-x529.google.com with SMTP id i5so87000972eda.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 31 Mar 2023 01:48:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1680252527; x=1682844527;
        h=in-reply-to:references:subject:cc:to:from:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YKQ8vPs0Dih0iynj4Cmp9T+ba+hL2fXnZWwHnBAcuhg=;
        b=2mnu4yNGGAjxV0UGAgbgJ1AICl1gU3kPVXV/uIz/kc90gY9iQa3ujFi6sTAAZ8ClwO
         mjKn0bPO0uNXpYuQCsDw/XzSTAylNw3KK7AK7CLSRMGSRxAl6qcL/qf9rosRDDyLqCkZ
         HpnLqgf5TgRMf4rXUio9eniDoO7+anKXKnL2Dq2LEUjFgWpKeCB6sUkUNmG73UuZbBXJ
         w/YAdZfEjBd9KjP3fPbtSJ/W432hn77/B31cQVC+vQolyY78Jx2fN1EXoBdLw6rYk9QY
         DbkjVrTStYIS7gDPEpPGq+s1v8EhU+sJIHeaZbiavRhqhav8IdKt3A/sGvEoG5TCBHFa
         04SQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680252527; x=1682844527;
        h=in-reply-to:references:subject:cc:to:from:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=YKQ8vPs0Dih0iynj4Cmp9T+ba+hL2fXnZWwHnBAcuhg=;
        b=kOo1z/AR0BxpysE6sIXvRp2VqcY0wbCEt0siNa3YYLfxhjv75xhQk0YqTT437QvASW
         9GQyHOl1Ab94fbApmEpHROestv2sm+yUBaDAbwqa/dwgSSBZhYnMPSHyqqv4LeNwF6dG
         LMQqa3epno4aPG9sESc/sggj4E0vvvITDZroFopddS0YBPfgji3sldyWfh8FlC/BFcG+
         VnaEuybaly3YsuwTao/x/JyArSqxXnute5bwfLkx2sOS5hbqwMEM0G9OhFPkVydgqzsa
         X/YoaeUO45ybtoZyOWQNm3mVvVdltG6OGOz0FFyd3cuhC45C+iEVucpTsE3vArbXrQ16
         0ILA==
X-Gm-Message-State: AAQBX9eCJx3rlwncSi9+77BZmLO4WsBBlN0AEBbpUkHkfr2fV5R3/uOq
        nRLwHIonXWaFIEQO1mOmWQHz4Q==
X-Google-Smtp-Source: AKy350bnnqqF6nxkO/W28cnGFgJLDt6X6dbSMYLaOR1vQblDBZbqXKF6iRXEJ687TERcv3Ehu+EydA==
X-Received: by 2002:a17:906:4ed8:b0:933:4d37:82b2 with SMTP id i24-20020a1709064ed800b009334d3782b2mr24879381ejv.57.1680252526964;
        Fri, 31 Mar 2023 01:48:46 -0700 (PDT)
Received: from localhost (144-178-202-138.static.ef-service.nl. [144.178.202.138])
        by smtp.gmail.com with ESMTPSA id tg4-20020a1709078dc400b00947a97a42f2sm509942ejc.103.2023.03.31.01.48.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 31 Mar 2023 01:48:46 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date:   Fri, 31 Mar 2023 10:48:46 +0200
Message-Id: <CRKFT6BE3AW9.3OH8GRUPW2TLN@otso>
From:   "Luca Weiss" <luca.weiss@fairphone.com>
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
X-Mailer: aerc 0.14.0
References: <20230318121828.739424-1-bryan.odonoghue@linaro.org>
 <CREPJP5KTX2D.VCM8IIZIP1ZT@otso>
 <9c541f81-8501-a142-1df8-6e71509c0d88@linaro.org>
In-Reply-To: <9c541f81-8501-a142-1df8-6e71509c0d88@linaro.org>
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
        DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Bryan,

On Fri Mar 24, 2023 at 4:28 PM CET, Bryan O'Donoghue wrote:
> On 24/03/2023 15:10, Luca Weiss wrote:
> > When plugging in the device with TCPM on into my PC (peripheral mode)
> > then the USB device registers and unregisters every couple of seconds,
> > never stays stable on. No messages in dmesg when this happens. This onl=
y
> > happens with the USB-C plug in one direction, in the other it
> > works reliable.
>
> Sounds like we need to do some SoC specific debug on orientation=20
> switching in the PHY.

I also know that the phone has a AW35743 chip in the USB path,
controlled by DP_AUX_EN and DP_AUX_SEL gpios but I think this is only
for displayport, right?

>
> I wonder how many lanes dp_opts->lanes says for your part ?

Not sure.. Where is this configured?
But I also don't have DisplayPort over USB-C (video out) configured yet.
Related question: does video out work on sm8250+pm8150b for you?

>
> Also potentially not having "orientation-switch" in &usb_1_qmpphy{} but,=
=20
> I think we discussed that before.

Definitely have that in my device dts in that node.

When unplugged from my PC (USB-C->USB-A cable) I get

  [ 1236.114620] qcom,pmic-typec c440000.spmi:pmic@2:typec@1500: get_vbus: =
0x00000042 detect 0

When plugging in just

  [ 1261.890238] qcom,pmic-typec c440000.spmi:pmic@2:typec@1500: get_vbus: =
0x00000062 detect 1

The same exact message also when plugging the USB-C plug the other way
on the phone.

When testing with a USB-C->USB-C cable the behavior is similar. Only one
orientation on the phone is stable, the other one has the same unstable
behavior. The direction on the laptop doesn't matter, both directions
(when not changing the phone direction) is stable. Not sure if this
indicates where something is wrong, I don't know enough USB-C for this
;)=20

>
> So either
>
> - PHY orientation turn-around isn't working or

Since plugging in a USB stick works both ways, I assume at least some
part of it is working?

> - DTS orientation-switch isn't happening for you

Not sure what this means / how to check.

I'm attaching the USB-C->USB-C logs both ways, maybe they also show
something interesting?

Regards
Luca

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D
USB stable (device plug orientation 1):
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D

[ 1722.130836] qcom,pmic-typec c440000.spmi:pmic@2:typec@1500: get_cc: misc=
 0x000000cb cc1 0x00000001 Ra cc2 0x00000002 Rd attached 1 cc=3Dcc1
[ 1722.331025] qcom-qmp-combo-phy 88e8000.phy: Toggling orientation current=
 0 requested 2
[ 1722.331152] qcom,pmic-usb-pdphy c440000.spmi:pmic@2:pdphy@1700: pdphy_se=
t_roles: data_role_host=3D1 power_role_src=3D1
[ 1722.331182] qcom,pmic-usb-pdphy c440000.spmi:pmic@2:pdphy@1700: set_pd_r=
x: on
[ 1722.331224] qcom,pmic-typec c440000.spmi:pmic@2:typec@1500: set_vconn: o=
rientation 0 control 0x00000003 state on cc cc2 vconn cc1
[ 1722.333742] qcom,pmic-tcpm pm7250b-tcpm: set_vbus set: 1 result 0
[ 1722.333824] qcom,pmic-typec c440000.spmi:pmic@2:typec@1500: set_cc: curr=
src=3D1 Rp-1.5-180uA mode EN_SRC_ONLY debounce 1 attached 1 cc=3Dcc1
[ 1722.340158] qcom,pmic-typec c440000.spmi:pmic@2:typec@1500: Debounce cc =
complete
[ 1722.373839] qcom,pmic-typec c440000.spmi:pmic@2:typec@1500: get_cc: misc=
 0x00000042 cc1 0x00000000 Open cc2 0x00000000 Open attached 0 cc=3Dcc1
[ 1722.373880] qcom,pmic-typec c440000.spmi:pmic@2:typec@1500: get_cc: misc=
 0x00000042 cc1 0x00000000 Open cc2 0x00000000 Open attached 0 cc=3Dcc1
[ 1722.373905] qcom,pmic-usb-pdphy c440000.spmi:pmic@2:pdphy@1700: set_pd_r=
x: off
[ 1722.379037] qcom,pmic-tcpm pm7250b-tcpm: set_vbus set: 0 result 0
[ 1722.379080] qcom,pmic-typec c440000.spmi:pmic@2:typec@1500: set_vconn: o=
rientation 0 control 0x00000000 state off cc cc2 vconn cc1
[ 1722.379098] qcom-qmp-combo-phy 88e8000.phy: Toggling orientation current=
 2 requested 0
[ 1722.379171] qcom,pmic-usb-pdphy c440000.spmi:pmic@2:pdphy@1700: pdphy_se=
t_roles: data_role_host=3D1 power_role_src=3D1
[ 1722.379193] qcom,pmic-typec c440000.spmi:pmic@2:typec@1500: start_toggli=
ng: misc 0x00000042 attached 0 port_type 0 current cc 4 new 4
[ 1722.379234] qcom,pmic-typec c440000.spmi:pmic@2:typec@1500: get_vbus: 0x=
00000042 detect 0
[ 1722.383528] qcom,pmic-typec c440000.spmi:pmic@2:typec@1500: Debounce cc =
complete
[ 1722.448649] xhci-hcd xhci-hcd.1.auto: xHCI Host Controller
[ 1722.448717] xhci-hcd xhci-hcd.1.auto: new USB bus registered, assigned b=
us number 1
[ 1722.449835] xhci-hcd xhci-hcd.1.auto: hcc params 0x0230fe65 hci version =
0x110 quirks 0x0000000000010010
[ 1722.449871] xhci-hcd xhci-hcd.1.auto: irq 188, io mem 0x0a600000
[ 1722.449972] xhci-hcd xhci-hcd.1.auto: xHCI Host Controller
[ 1722.449982] xhci-hcd xhci-hcd.1.auto: new USB bus registered, assigned b=
us number 2
[ 1722.449992] xhci-hcd xhci-hcd.1.auto: Host supports USB 3.0 SuperSpeed
[ 1722.450112] usb usb1: New USB device found, idVendor=3D1d6b, idProduct=
=3D0002, bcdDevice=3D 6.02
[ 1722.450121] usb usb1: New USB device strings: Mfr=3D3, Product=3D2, Seri=
alNumber=3D1
[ 1722.450127] usb usb1: Product: xHCI Host Controller
[ 1722.450132] usb usb1: Manufacturer: Linux 6.2.1-00102-gc2551b66fbe7-dirt=
y xhci-hcd
[ 1722.450138] usb usb1: SerialNumber: xhci-hcd.1.auto
[ 1722.450468] hub 1-0:1.0: USB hub found
[ 1722.450494] hub 1-0:1.0: 1 port detected
[ 1722.451703] usb usb2: We don't know the algorithms for LPM for this host=
, disabling LPM.
[ 1722.451810] usb usb2: New USB device found, idVendor=3D1d6b, idProduct=
=3D0003, bcdDevice=3D 6.02
[ 1722.451822] usb usb2: New USB device strings: Mfr=3D3, Product=3D2, Seri=
alNumber=3D1
[ 1722.451831] usb usb2: Product: xHCI Host Controller
[ 1722.451839] usb usb2: Manufacturer: Linux 6.2.1-00102-gc2551b66fbe7-dirt=
y xhci-hcd
[ 1722.451846] usb usb2: SerialNumber: xhci-hcd.1.auto
[ 1722.452491] hub 2-0:1.0: USB hub found
[ 1722.452524] hub 2-0:1.0: 1 port detected
[ 1722.453143] xhci-hcd xhci-hcd.1.auto: remove, state 1
[ 1722.453153] usb usb2: USB disconnect, device number 1
[ 1722.454619] xhci-hcd xhci-hcd.1.auto: USB bus 2 deregistered
[ 1722.454640] xhci-hcd xhci-hcd.1.auto: remove, state 1
[ 1722.454653] usb usb1: USB disconnect, device number 1
[ 1722.457569] xhci-hcd xhci-hcd.1.auto: USB bus 1 deregistered
[ 1723.255900] qcom,pmic-typec c440000.spmi:pmic@2:typec@1500: get_cc: misc=
 0x000000cb cc1 0x00000001 Ra cc2 0x00000002 Rd attached 1 cc=3Dcc1
[ 1723.255956] qcom,pmic-typec c440000.spmi:pmic@2:typec@1500: get_cc: misc=
 0x000000cb cc1 0x00000001 Ra cc2 0x00000002 Rd attached 1 cc=3Dcc1
[ 1723.456104] qcom-qmp-combo-phy 88e8000.phy: Toggling orientation current=
 0 requested 2
[ 1723.456214] qcom,pmic-usb-pdphy c440000.spmi:pmic@2:pdphy@1700: pdphy_se=
t_roles: data_role_host=3D1 power_role_src=3D1
[ 1723.456238] qcom,pmic-usb-pdphy c440000.spmi:pmic@2:pdphy@1700: set_pd_r=
x: on
[ 1723.456283] qcom,pmic-typec c440000.spmi:pmic@2:typec@1500: set_vconn: o=
rientation 0 control 0x00000003 state on cc cc2 vconn cc1
[ 1723.458727] qcom,pmic-tcpm pm7250b-tcpm: set_vbus set: 1 result 0
[ 1723.458784] qcom,pmic-typec c440000.spmi:pmic@2:typec@1500: set_cc: curr=
src=3D1 Rp-1.5-180uA mode EN_SRC_ONLY debounce 1 attached 1 cc=3Dcc1
[ 1723.466539] qcom,pmic-typec c440000.spmi:pmic@2:typec@1500: Debounce cc =
complete
[ 1723.503200] qcom,pmic-typec c440000.spmi:pmic@2:typec@1500: set_cc: curr=
src=3D2 Rp-3.0-330uA mode EN_SRC_ONLY debounce 1 attached 1 cc=3Dcc1
[ 1723.503241] qcom,pmic-typec c440000.spmi:pmic@2:typec@1500: set_cc: curr=
src=3D1 Rp-1.5-180uA mode EN_SRC_ONLY debounce 1 attached 1 cc=3Dcc1
[ 1723.507535] qcom,pmic-typec c440000.spmi:pmic@2:typec@1500: Debounce cc =
complete
[ 1723.523733] qcom,pmic-typec c440000.spmi:pmic@2:typec@1500: set_cc: curr=
src=3D2 Rp-3.0-330uA mode EN_SRC_ONLY debounce 1 attached 1 cc=3Dcc1
[ 1723.523808] qcom,pmic-typec c440000.spmi:pmic@2:typec@1500: set_cc: curr=
src=3D1 Rp-1.5-180uA mode EN_SRC_ONLY debounce 1 attached 1 cc=3Dcc1
[ 1723.535554] qcom,pmic-typec c440000.spmi:pmic@2:typec@1500: Debounce cc =
complete
[ 1723.543851] qcom,pmic-typec c440000.spmi:pmic@2:typec@1500: set_cc: curr=
src=3D2 Rp-3.0-330uA mode EN_SRC_ONLY debounce 1 attached 1 cc=3Dcc1
[ 1723.543892] qcom,pmic-typec c440000.spmi:pmic@2:typec@1500: set_cc: curr=
src=3D1 Rp-1.5-180uA mode EN_SRC_ONLY debounce 1 attached 1 cc=3Dcc1
[ 1723.551553] qcom,pmic-typec c440000.spmi:pmic@2:typec@1500: Debounce cc =
complete
[ 1723.565097] qcom,pmic-typec c440000.spmi:pmic@2:typec@1500: set_cc: curr=
src=3D2 Rp-3.0-330uA mode EN_SRC_ONLY debounce 1 attached 1 cc=3Dcc1
[ 1723.571515] qcom,pmic-typec c440000.spmi:pmic@2:typec@1500: set_cc: curr=
src=3D2 Rp-3.0-330uA mode EN_SRC_ONLY debounce 1 attached 1 cc=3Dcc1
[ 1723.575554] qcom,pmic-typec c440000.spmi:pmic@2:typec@1500: Debounce cc =
complete
[ 1723.576416] xhci-hcd xhci-hcd.1.auto: xHCI Host Controller
[ 1723.576482] xhci-hcd xhci-hcd.1.auto: new USB bus registered, assigned b=
us number 1
[ 1723.577757] xhci-hcd xhci-hcd.1.auto: hcc params 0x0230fe65 hci version =
0x110 quirks 0x0000000000010010
[ 1723.577850] xhci-hcd xhci-hcd.1.auto: irq 188, io mem 0x0a600000
[ 1723.578172] xhci-hcd xhci-hcd.1.auto: xHCI Host Controller
[ 1723.578216] xhci-hcd xhci-hcd.1.auto: new USB bus registered, assigned b=
us number 2
[ 1723.578258] xhci-hcd xhci-hcd.1.auto: Host supports USB 3.0 SuperSpeed
[ 1723.578680] usb usb1: New USB device found, idVendor=3D1d6b, idProduct=
=3D0002, bcdDevice=3D 6.02
[ 1723.578723] usb usb1: New USB device strings: Mfr=3D3, Product=3D2, Seri=
alNumber=3D1
[ 1723.578747] usb usb1: Product: xHCI Host Controller
[ 1723.578755] usb usb1: Manufacturer: Linux 6.2.1-00102-gc2551b66fbe7-dirt=
y xhci-hcd
[ 1723.578760] usb usb1: SerialNumber: xhci-hcd.1.auto
[ 1723.579187] hub 1-0:1.0: USB hub found
[ 1723.579211] hub 1-0:1.0: 1 port detected
[ 1723.579480] usb usb2: We don't know the algorithms for LPM for this host=
, disabling LPM.
[ 1723.579548] usb usb2: New USB device found, idVendor=3D1d6b, idProduct=
=3D0003, bcdDevice=3D 6.02
[ 1723.579555] usb usb2: New USB device strings: Mfr=3D3, Product=3D2, Seri=
alNumber=3D1
[ 1723.579560] usb usb2: Product: xHCI Host Controller
[ 1723.579564] usb usb2: Manufacturer: Linux 6.2.1-00102-gc2551b66fbe7-dirt=
y xhci-hcd
[ 1723.579569] usb usb2: SerialNumber: xhci-hcd.1.auto
[ 1723.581083] qcom-qmp-combo-phy 88e8000.phy: Toggling orientation current=
 2 requested 2
[ 1723.581144] qcom,pmic-usb-pdphy c440000.spmi:pmic@2:pdphy@1700: pdphy_se=
t_roles: data_role_host=3D0 power_role_src=3D1
[ 1723.581192] qcom,pmic-typec c440000.spmi:pmic@2:typec@1500: set_cc: curr=
src=3D2 Rp-3.0-330uA mode EN_SRC_ONLY debounce 1 attached 1 cc=3Dcc1
[ 1723.581234] qcom,pmic-typec c440000.spmi:pmic@2:typec@1500: set_cc: curr=
src=3D1 Rp-1.5-180uA mode EN_SRC_ONLY debounce 1 attached 1 cc=3Dcc1
[ 1723.581661] hub 2-0:1.0: USB hub found
[ 1723.581690] hub 2-0:1.0: 1 port detected
[ 1723.582636] xhci-hcd xhci-hcd.1.auto: remove, state 1
[ 1723.582659] usb usb2: USB disconnect, device number 1
[ 1723.586362] xhci-hcd xhci-hcd.1.auto: USB bus 2 deregistered
[ 1723.586421] xhci-hcd xhci-hcd.1.auto: remove, state 1
[ 1723.586456] usb usb1: USB disconnect, device number 1
[ 1723.591097] xhci-hcd xhci-hcd.1.auto: USB bus 1 deregistered
[ 1723.591580] qcom,pmic-typec c440000.spmi:pmic@2:typec@1500: Debounce cc =
complete
[ 1723.602619] qcom,pmic-typec c440000.spmi:pmic@2:typec@1500: set_cc: curr=
src=3D2 Rp-3.0-330uA mode EN_SRC_ONLY debounce 1 attached 1 cc=3Dcc1
[ 1723.602793] qcom,pmic-typec c440000.spmi:pmic@2:typec@1500: set_cc: curr=
src=3D1 Rp-1.5-180uA mode EN_SRC_ONLY debounce 1 attached 1 cc=3Dcc1
[ 1723.611512] qcom,pmic-typec c440000.spmi:pmic@2:typec@1500: Debounce cc =
complete
[ 1723.623020] qcom,pmic-typec c440000.spmi:pmic@2:typec@1500: set_cc: curr=
src=3D2 Rp-3.0-330uA mode EN_SRC_ONLY debounce 1 attached 1 cc=3Dcc1
[ 1723.623062] qcom,pmic-typec c440000.spmi:pmic@2:typec@1500: set_cc: curr=
src=3D1 Rp-1.5-180uA mode EN_SRC_ONLY debounce 1 attached 1 cc=3Dcc1
[ 1723.631625] qcom,pmic-typec c440000.spmi:pmic@2:typec@1500: Debounce cc =
complete
[ 1723.644262] qcom,pmic-typec c440000.spmi:pmic@2:typec@1500: set_cc: curr=
src=3D2 Rp-3.0-330uA mode EN_SRC_ONLY debounce 1 attached 1 cc=3Dcc1
[ 1723.650769] qcom,pmic-typec c440000.spmi:pmic@2:typec@1500: set_cc: curr=
src=3D2 Rp-3.0-330uA mode EN_SRC_ONLY debounce 1 attached 1 cc=3Dcc1
[ 1723.651546] qcom,pmic-typec c440000.spmi:pmic@2:typec@1500: Debounce cc =
complete
[ 1723.662850] qcom,pmic-typec c440000.spmi:pmic@2:typec@1500: set_vconn: o=
rientation 0 control 0x00000000 state off cc cc2 vconn cc1

- unplug -

[ 1867.223052] qcom,pmic-typec c440000.spmi:pmic@2:typec@1500: get_cc: misc=
 0x00000042 cc1 0x00000000 Open cc2 0x00000000 Open attached 0 cc=3Dcc1
[ 1867.223277] qcom,pmic-usb-pdphy c440000.spmi:pmic@2:pdphy@1700: set_pd_r=
x: off
[ 1867.226027] qcom,pmic-tcpm pm7250b-tcpm: set_vbus set: 0 result 0
[ 1867.226064] qcom,pmic-typec c440000.spmi:pmic@2:typec@1500: set_vconn: o=
rientation 0 control 0x00000000 state off cc cc2 vconn cc1
[ 1867.226084] qcom-qmp-combo-phy 88e8000.phy: Toggling orientation current=
 2 requested 0
[ 1867.226145] qcom,pmic-usb-pdphy c440000.spmi:pmic@2:pdphy@1700: pdphy_se=
t_roles: data_role_host=3D0 power_role_src=3D1
[ 1867.226167] qcom,pmic-typec c440000.spmi:pmic@2:typec@1500: start_toggli=
ng: misc 0x00000042 attached 0 port_type 0 current cc 5 new 4
[ 1867.226212] qcom,pmic-typec c440000.spmi:pmic@2:typec@1500: get_vbus: 0x=
00000042 detect 0
[ 1867.236933] qcom,pmic-typec c440000.spmi:pmic@2:typec@1500: Debounce cc =
complete

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D
USB unstable (device plug orientation 2):
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D

[ 1894.263324] qcom,pmic-typec c440000.spmi:pmic@2:typec@1500: get_cc: misc=
 0x000000c9 cc1 0x00000002 Rd cc2 0x00000001 Ra attached 1 cc=3Dcc2
[ 1894.463482] qcom-qmp-combo-phy 88e8000.phy: Toggling orientation current=
 0 requested 1
[ 1894.463616] qcom,pmic-usb-pdphy c440000.spmi:pmic@2:pdphy@1700: pdphy_se=
t_roles: data_role_host=3D1 power_role_src=3D1
[ 1894.463646] qcom,pmic-usb-pdphy c440000.spmi:pmic@2:pdphy@1700: set_pd_r=
x: on
[ 1894.463690] qcom,pmic-typec c440000.spmi:pmic@2:typec@1500: set_vconn: o=
rientation 4 control 0x00000007 state on cc cc1 vconn cc2
[ 1894.466173] qcom,pmic-tcpm pm7250b-tcpm: set_vbus set: 1 result 0
[ 1894.466257] qcom,pmic-typec c440000.spmi:pmic@2:typec@1500: set_cc: curr=
src=3D1 Rp-1.5-180uA mode EN_SRC_ONLY debounce 1 attached 1 cc=3Dcc2
[ 1894.474797] qcom,pmic-typec c440000.spmi:pmic@2:typec@1500: Debounce cc =
complete
[ 1894.505894] qcom,pmic-typec c440000.spmi:pmic@2:typec@1500: get_cc: misc=
 0x00000040 cc1 0x00000000 Open cc2 0x00000000 Open attached 0 cc=3Dcc2
[ 1894.505935] qcom,pmic-typec c440000.spmi:pmic@2:typec@1500: get_cc: misc=
 0x00000040 cc1 0x00000000 Open cc2 0x00000000 Open attached 0 cc=3Dcc2
[ 1894.505963] qcom,pmic-usb-pdphy c440000.spmi:pmic@2:pdphy@1700: set_pd_r=
x: off
[ 1894.510880] qcom,pmic-tcpm pm7250b-tcpm: set_vbus set: 0 result 0
[ 1894.510920] qcom,pmic-typec c440000.spmi:pmic@2:typec@1500: set_vconn: o=
rientation 4 control 0x00000000 state off cc cc1 vconn cc2
[ 1894.510940] qcom-qmp-combo-phy 88e8000.phy: Toggling orientation current=
 1 requested 0
[ 1894.511021] qcom,pmic-usb-pdphy c440000.spmi:pmic@2:pdphy@1700: pdphy_se=
t_roles: data_role_host=3D1 power_role_src=3D1
[ 1894.511043] qcom,pmic-typec c440000.spmi:pmic@2:typec@1500: start_toggli=
ng: misc 0x00000040 attached 0 port_type 0 current cc 4 new 4
[ 1894.511084] qcom,pmic-typec c440000.spmi:pmic@2:typec@1500: get_vbus: 0x=
00000000 detect 0
[ 1894.516552] qcom,pmic-typec c440000.spmi:pmic@2:typec@1500: Debounce cc =
complete
[ 1894.581138] xhci-hcd xhci-hcd.1.auto: xHCI Host Controller
[ 1894.581171] xhci-hcd xhci-hcd.1.auto: new USB bus registered, assigned b=
us number 1
[ 1894.582287] xhci-hcd xhci-hcd.1.auto: hcc params 0x0230fe65 hci version =
0x110 quirks 0x0000000000010010
[ 1894.582330] xhci-hcd xhci-hcd.1.auto: irq 188, io mem 0x0a600000
[ 1894.582464] xhci-hcd xhci-hcd.1.auto: xHCI Host Controller
[ 1894.582479] xhci-hcd xhci-hcd.1.auto: new USB bus registered, assigned b=
us number 2
[ 1894.582493] xhci-hcd xhci-hcd.1.auto: Host supports USB 3.0 SuperSpeed
[ 1894.582649] usb usb1: New USB device found, idVendor=3D1d6b, idProduct=
=3D0002, bcdDevice=3D 6.02
[ 1894.582661] usb usb1: New USB device strings: Mfr=3D3, Product=3D2, Seri=
alNumber=3D1
[ 1894.582670] usb usb1: Product: xHCI Host Controller
[ 1894.582677] usb usb1: Manufacturer: Linux 6.2.1-00102-gc2551b66fbe7-dirt=
y xhci-hcd
[ 1894.582685] usb usb1: SerialNumber: xhci-hcd.1.auto
[ 1894.583211] hub 1-0:1.0: USB hub found
[ 1894.583255] hub 1-0:1.0: 1 port detected
[ 1894.583830] usb usb2: We don't know the algorithms for LPM for this host=
, disabling LPM.
[ 1894.583960] usb usb2: New USB device found, idVendor=3D1d6b, idProduct=
=3D0003, bcdDevice=3D 6.02
[ 1894.583975] usb usb2: New USB device strings: Mfr=3D3, Product=3D2, Seri=
alNumber=3D1
[ 1894.583987] usb usb2: Product: xHCI Host Controller
[ 1894.583996] usb usb2: Manufacturer: Linux 6.2.1-00102-gc2551b66fbe7-dirt=
y xhci-hcd
[ 1894.584006] usb usb2: SerialNumber: xhci-hcd.1.auto
[ 1894.584742] hub 2-0:1.0: USB hub found
[ 1894.584782] hub 2-0:1.0: 1 port detected
[ 1894.585437] xhci-hcd xhci-hcd.1.auto: remove, state 1
[ 1894.585452] usb usb2: USB disconnect, device number 1
[ 1894.588024] xhci-hcd xhci-hcd.1.auto: USB bus 2 deregistered
[ 1894.588046] xhci-hcd xhci-hcd.1.auto: remove, state 1
[ 1894.588060] usb usb1: USB disconnect, device number 1
[ 1894.591836] xhci-hcd xhci-hcd.1.auto: USB bus 1 deregistered
[ 1895.388351] qcom,pmic-typec c440000.spmi:pmic@2:typec@1500: get_cc: misc=
 0x000000c9 cc1 0x00000002 Rd cc2 0x00000001 Ra attached 1 cc=3Dcc2
[ 1895.388407] qcom,pmic-typec c440000.spmi:pmic@2:typec@1500: get_cc: misc=
 0x000000c9 cc1 0x00000002 Rd cc2 0x00000001 Ra attached 1 cc=3Dcc2
[ 1895.588568] qcom-qmp-combo-phy 88e8000.phy: Toggling orientation current=
 0 requested 1
[ 1895.588643] qcom,pmic-usb-pdphy c440000.spmi:pmic@2:pdphy@1700: pdphy_se=
t_roles: data_role_host=3D1 power_role_src=3D1
[ 1895.588664] qcom,pmic-usb-pdphy c440000.spmi:pmic@2:pdphy@1700: set_pd_r=
x: on
[ 1895.588705] qcom,pmic-typec c440000.spmi:pmic@2:typec@1500: set_vconn: o=
rientation 4 control 0x00000007 state on cc cc1 vconn cc2
[ 1895.591193] qcom,pmic-tcpm pm7250b-tcpm: set_vbus set: 1 result 0
[ 1895.591250] qcom,pmic-typec c440000.spmi:pmic@2:typec@1500: set_cc: curr=
src=3D1 Rp-1.5-180uA mode EN_SRC_ONLY debounce 1 attached 1 cc=3Dcc2
[ 1895.598187] qcom,pmic-typec c440000.spmi:pmic@2:typec@1500: Debounce cc =
complete
[ 1895.635829] qcom,pmic-typec c440000.spmi:pmic@2:typec@1500: set_cc: curr=
src=3D2 Rp-3.0-330uA mode EN_SRC_ONLY debounce 1 attached 1 cc=3Dcc2
[ 1895.635940] qcom,pmic-typec c440000.spmi:pmic@2:typec@1500: set_cc: curr=
src=3D1 Rp-1.5-180uA mode EN_SRC_ONLY debounce 1 attached 1 cc=3Dcc2
[ 1895.640601] qcom,pmic-typec c440000.spmi:pmic@2:typec@1500: Debounce cc =
complete
[ 1895.657692] qcom,pmic-typec c440000.spmi:pmic@2:typec@1500: set_cc: curr=
src=3D2 Rp-3.0-330uA mode EN_SRC_ONLY debounce 1 attached 1 cc=3Dcc2
[ 1895.657766] qcom,pmic-typec c440000.spmi:pmic@2:typec@1500: set_cc: curr=
src=3D1 Rp-1.5-180uA mode EN_SRC_ONLY debounce 1 attached 1 cc=3Dcc2
[ 1895.664570] qcom,pmic-typec c440000.spmi:pmic@2:typec@1500: Debounce cc =
complete
[ 1895.677799] qcom,pmic-typec c440000.spmi:pmic@2:typec@1500: set_cc: curr=
src=3D2 Rp-3.0-330uA mode EN_SRC_ONLY debounce 1 attached 1 cc=3Dcc2
[ 1895.677836] qcom,pmic-typec c440000.spmi:pmic@2:typec@1500: set_cc: curr=
src=3D1 Rp-1.5-180uA mode EN_SRC_ONLY debounce 1 attached 1 cc=3Dcc2
[ 1895.684618] qcom,pmic-typec c440000.spmi:pmic@2:typec@1500: Debounce cc =
complete
[ 1895.698467] qcom,pmic-typec c440000.spmi:pmic@2:typec@1500: set_cc: curr=
src=3D2 Rp-3.0-330uA mode EN_SRC_ONLY debounce 1 attached 1 cc=3Dcc2
[ 1895.704570] qcom,pmic-typec c440000.spmi:pmic@2:typec@1500: Debounce cc =
complete
[ 1895.705452] xhci-hcd xhci-hcd.1.auto: xHCI Host Controller
[ 1895.705514] xhci-hcd xhci-hcd.1.auto: new USB bus registered, assigned b=
us number 1
[ 1895.706625] xhci-hcd xhci-hcd.1.auto: hcc params 0x0230fe65 hci version =
0x110 quirks 0x0000000000010010
[ 1895.706658] xhci-hcd xhci-hcd.1.auto: irq 188, io mem 0x0a600000
[ 1895.706747] xhci-hcd xhci-hcd.1.auto: xHCI Host Controller
[ 1895.706755] xhci-hcd xhci-hcd.1.auto: new USB bus registered, assigned b=
us number 2
[ 1895.706764] xhci-hcd xhci-hcd.1.auto: Host supports USB 3.0 SuperSpeed
[ 1895.706824] qcom,pmic-typec c440000.spmi:pmic@2:typec@1500: set_cc: curr=
src=3D2 Rp-3.0-330uA mode EN_SRC_ONLY debounce 1 attached 1 cc=3Dcc2
[ 1895.707209] usb usb1: New USB device found, idVendor=3D1d6b, idProduct=
=3D0002, bcdDevice=3D 6.02
[ 1895.707250] usb usb1: New USB device strings: Mfr=3D3, Product=3D2, Seri=
alNumber=3D1
[ 1895.707280] usb usb1: Product: xHCI Host Controller
[ 1895.707305] usb usb1: Manufacturer: Linux 6.2.1-00102-gc2551b66fbe7-dirt=
y xhci-hcd
[ 1895.707331] usb usb1: SerialNumber: xhci-hcd.1.auto
[ 1895.708504] hub 1-0:1.0: USB hub found
[ 1895.708635] hub 1-0:1.0: 1 port detected
[ 1895.709607] usb usb2: We don't know the algorithms for LPM for this host=
, disabling LPM.
[ 1895.709928] usb usb2: New USB device found, idVendor=3D1d6b, idProduct=
=3D0003, bcdDevice=3D 6.02
[ 1895.709970] usb usb2: New USB device strings: Mfr=3D3, Product=3D2, Seri=
alNumber=3D1
[ 1895.709999] usb usb2: Product: xHCI Host Controller
[ 1895.710023] usb usb2: Manufacturer: Linux 6.2.1-00102-gc2551b66fbe7-dirt=
y xhci-hcd
[ 1895.710049] usb usb2: SerialNumber: xhci-hcd.1.auto
[ 1895.711360] hub 2-0:1.0: USB hub found
[ 1895.711392] hub 2-0:1.0: 1 port detected
[ 1895.712739] qcom,pmic-typec c440000.spmi:pmic@2:typec@1500: Debounce cc =
complete
[ 1895.714685] qcom-qmp-combo-phy 88e8000.phy: Toggling orientation current=
 1 requested 1
[ 1895.714749] qcom,pmic-usb-pdphy c440000.spmi:pmic@2:pdphy@1700: pdphy_se=
t_roles: data_role_host=3D0 power_role_src=3D1
[ 1895.714795] qcom,pmic-typec c440000.spmi:pmic@2:typec@1500: set_cc: curr=
src=3D2 Rp-3.0-330uA mode EN_SRC_ONLY debounce 1 attached 1 cc=3Dcc2
[ 1895.714837] qcom,pmic-typec c440000.spmi:pmic@2:typec@1500: set_cc: curr=
src=3D1 Rp-1.5-180uA mode EN_SRC_ONLY debounce 1 attached 1 cc=3Dcc2
[ 1895.715104] xhci-hcd xhci-hcd.1.auto: remove, state 1
[ 1895.715114] usb usb2: USB disconnect, device number 1
[ 1895.718866] xhci-hcd xhci-hcd.1.auto: USB bus 2 deregistered
[ 1895.718889] xhci-hcd xhci-hcd.1.auto: remove, state 1
[ 1895.718901] usb usb1: USB disconnect, device number 1
[ 1895.725858] xhci-hcd xhci-hcd.1.auto: USB bus 1 deregistered
[ 1895.726158] qcom,pmic-typec c440000.spmi:pmic@2:typec@1500: Debounce cc =
complete
[ 1895.735069] qcom,pmic-typec c440000.spmi:pmic@2:typec@1500: set_cc: curr=
src=3D2 Rp-3.0-330uA mode EN_SRC_ONLY debounce 1 attached 1 cc=3Dcc2
[ 1895.735135] qcom,pmic-typec c440000.spmi:pmic@2:typec@1500: set_cc: curr=
src=3D1 Rp-1.5-180uA mode EN_SRC_ONLY debounce 1 attached 1 cc=3Dcc2
[ 1895.744571] qcom,pmic-typec c440000.spmi:pmic@2:typec@1500: Debounce cc =
complete
[ 1895.756079] qcom,pmic-typec c440000.spmi:pmic@2:typec@1500: set_cc: curr=
src=3D2 Rp-3.0-330uA mode EN_SRC_ONLY debounce 1 attached 1 cc=3Dcc2
[ 1895.756119] qcom,pmic-typec c440000.spmi:pmic@2:typec@1500: set_cc: curr=
src=3D1 Rp-1.5-180uA mode EN_SRC_ONLY debounce 1 attached 1 cc=3Dcc2
[ 1895.764615] qcom,pmic-typec c440000.spmi:pmic@2:typec@1500: Debounce cc =
complete
[ 1895.776343] qcom,pmic-typec c440000.spmi:pmic@2:typec@1500: set_cc: curr=
src=3D2 Rp-3.0-330uA mode EN_SRC_ONLY debounce 1 attached 1 cc=3Dcc2
[ 1895.782944] qcom,pmic-typec c440000.spmi:pmic@2:typec@1500: set_cc: curr=
src=3D2 Rp-3.0-330uA mode EN_SRC_ONLY debounce 1 attached 1 cc=3Dcc2
[ 1895.784556] qcom,pmic-typec c440000.spmi:pmic@2:typec@1500: Debounce cc =
complete
[ 1895.795184] qcom,pmic-typec c440000.spmi:pmic@2:typec@1500: set_vconn: o=
rientation 4 control 0x00000000 state off cc cc1 vconn cc2

- unplug -

[ 1907.264840] qcom,pmic-typec c440000.spmi:pmic@2:typec@1500: get_cc: misc=
 0x00000040 cc1 0x00000000 Open cc2 0x00000000 Open attached 0 cc=3Dcc2
[ 1907.264888] qcom,pmic-typec c440000.spmi:pmic@2:typec@1500: get_cc: misc=
 0x00000040 cc1 0x00000000 Open cc2 0x00000000 Open attached 0 cc=3Dcc2
[ 1907.265075] qcom,pmic-usb-pdphy c440000.spmi:pmic@2:pdphy@1700: set_pd_r=
x: off
[ 1907.267897] qcom,pmic-tcpm pm7250b-tcpm: set_vbus set: 0 result 0
[ 1907.267932] qcom,pmic-typec c440000.spmi:pmic@2:typec@1500: set_vconn: o=
rientation 4 control 0x00000000 state off cc cc1 vconn cc2
[ 1907.267951] qcom-qmp-combo-phy 88e8000.phy: Toggling orientation current=
 1 requested 0
[ 1907.268011] qcom,pmic-usb-pdphy c440000.spmi:pmic@2:pdphy@1700: pdphy_se=
t_roles: data_role_host=3D0 power_role_src=3D1
[ 1907.268034] qcom,pmic-typec c440000.spmi:pmic@2:typec@1500: start_toggli=
ng: misc 0x00000040 attached 0 port_type 0 current cc 5 new 4
[ 1907.268081] qcom,pmic-typec c440000.spmi:pmic@2:typec@1500: get_vbus: 0x=
00000040 detect 0
[ 1907.272422] qcom,pmic-typec c440000.spmi:pmic@2:typec@1500: Debounce cc =
complete
