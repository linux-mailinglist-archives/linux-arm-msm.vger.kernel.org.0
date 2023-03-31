Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 696F66D2349
	for <lists+linux-arm-msm@lfdr.de>; Fri, 31 Mar 2023 16:58:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232930AbjCaO6z (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 31 Mar 2023 10:58:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46200 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232667AbjCaO6x (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 31 Mar 2023 10:58:53 -0400
Received: from mail-ed1-x52f.google.com (mail-ed1-x52f.google.com [IPv6:2a00:1450:4864:20::52f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BC842B459
        for <linux-arm-msm@vger.kernel.org>; Fri, 31 Mar 2023 07:58:51 -0700 (PDT)
Received: by mail-ed1-x52f.google.com with SMTP id ew6so90667812edb.7
        for <linux-arm-msm@vger.kernel.org>; Fri, 31 Mar 2023 07:58:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1680274730; x=1682866730;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=538xuMSTOYlR94sLXq+YdUeK7qKmrwEQChDpknTA4pI=;
        b=zc0VHKv4XuWqifVy+y0iAXE+wYKrR2yZ/ovW1ZRmEXk9p6WZ7m6gXuUY9f1ECZg2ZP
         yCWrUa3InDd+SXh2nOYo7vygm3UZhj9KYjoEYsqwBqiD+Xzt//zP8eBHNqX9/Vdeuwwe
         5divth+FVaJ4EaIXs2x3OyIBCexz+uCHgC/+uylL+6azuUZJx7HJKnk7y9MGC32n2aJk
         4ZQMIApGF0/eiuLQhnuUvxIWfFchJ76Aw8wSg6cDDcvEYRC7wDRK1lGXz66n1KRa7Fvg
         6bMXZKTwU1JhK0W9yiLwtQhhIgDdPheVRtGVBIac6dQNxj4gjGBkYaxy2QUW9rlo0qe7
         yaTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680274730; x=1682866730;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=538xuMSTOYlR94sLXq+YdUeK7qKmrwEQChDpknTA4pI=;
        b=Ye2bNLmyS84ONYYvZvxHymTlyOftVHmiQbaPEr82Onr5kQqmV04gxm9200rH56Pesw
         U+mccjHUGdpRwqfvqs2wMcy1/GU2Cn4TtUBBDRQO8Q1dA8RHwSKqrqhy9WKZCpnopcoo
         DlhuCKu6S8M0ruqP56uhSREqozK2YfrjNCydjMaaV1UX7VXRUqsT5ZxVxS10RdW62lsK
         Hxcq8BUEXfqccbzTm2+VyTpxPMxsuNDjPWBlJKrdlrXExb495xCuVrjOUQf7fKS1pY3x
         zdakwiNUezY97S75n2TfGJOP9EA3x7ievuLRipHetoH4LfpbbFCR3mlFLWPA//9l1Q9J
         vFHw==
X-Gm-Message-State: AAQBX9cQKl2BSCFxnlZGdf8N/szD/g44xnsISAmvQweJ0bi7Wpa7edbI
        KMdHn9Y2OpId9YgEzr8g8VTnXA==
X-Google-Smtp-Source: AKy350YgDH+b8wsSokfM5mL8lfZ7MC5xS4LMIEZCZtKlP3UNuKBYECFd3V6pJ4f8i4WZCVjAHV7jDA==
X-Received: by 2002:a05:6402:3514:b0:4fc:97d9:18ec with SMTP id b20-20020a056402351400b004fc97d918ecmr8616566edd.21.1680274730271;
        Fri, 31 Mar 2023 07:58:50 -0700 (PDT)
Received: from localhost (144-178-202-138.static.ef-service.nl. [144.178.202.138])
        by smtp.gmail.com with ESMTPSA id v7-20020a170906564700b009447277c26fsm1063251ejr.72.2023.03.31.07.58.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 31 Mar 2023 07:58:50 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date:   Fri, 31 Mar 2023 16:58:49 +0200
Message-Id: <CRKNOI8764EP.1IEYF5GFODE7G@otso>
Cc:     <wcheng@codeaurora.org>, <caleb.connolly@linaro.org>,
        <konrad.dybcio@linaro.org>, <subbaram@quicinc.com>,
        <jackp@quicinc.com>, <robertom@qti.qualcomm.com>,
        <lujianhua000@gmail.com>
Subject: Re: [PATCH v4 00/18] Add Qualcomm PMIC TPCM support
From:   "Luca Weiss" <luca.weiss@fairphone.com>
To:     "Bryan O'Donoghue" <bryan.odonoghue@linaro.org>,
        <linux@roeck-us.net>, <heikki.krogerus@linux.intel.com>,
        <gregkh@linuxfoundation.org>, <andersson@kernel.org>,
        <robh+dt@kernel.org>, <krzysztof.kozlowski+dt@linaro.org>,
        <linux-usb@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <devicetree@vger.kernel.org>
X-Mailer: aerc 0.14.0
References: <20230318121828.739424-1-bryan.odonoghue@linaro.org>
 <CREPJP5KTX2D.VCM8IIZIP1ZT@otso>
 <9c541f81-8501-a142-1df8-6e71509c0d88@linaro.org>
 <CRKFT6BE3AW9.3OH8GRUPW2TLN@otso>
 <233c8e94-d926-c5b2-a0b7-87333d5cdc2a@linaro.org>
In-Reply-To: <233c8e94-d926-c5b2-a0b7-87333d5cdc2a@linaro.org>
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
        DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Fri Mar 31, 2023 at 3:52 PM CEST, Bryan O'Donoghue wrote:
> On 31/03/2023 09:48, Luca Weiss wrote:
> > Hi Bryan,
> >=20
> > On Fri Mar 24, 2023 at 4:28 PM CET, Bryan O'Donoghue wrote:
> >> On 24/03/2023 15:10, Luca Weiss wrote:
> >>> When plugging in the device with TCPM on into my PC (peripheral mode)
> >>> then the USB device registers and unregisters every couple of seconds=
,
> >>> never stays stable on. No messages in dmesg when this happens. This o=
nly
> >>> happens with the USB-C plug in one direction, in the other it
> >>> works reliable.
> >>
> >> Sounds like we need to do some SoC specific debug on orientation
> >> switching in the PHY.
> >=20
> > I also know that the phone has a AW35743 chip in the USB path,
> > controlled by DP_AUX_EN and DP_AUX_SEL gpios but I think this is only
> > for displayport, right?
> >=20
>
> https://www.awinic.com/en/productDetail/AW35743CSR#product-details D+/D-=
=20
> looks like USB 2.x ..
>
> Your DP should go over TX1+/1 TX2+/- depending on orientation and # of=20
> lanes in use.

There's USB0_DP_AUX_P & USB0_DP_AUX_M from the SoC connected on the
D1+/- & D2+/- pins of this awinic chip, and out comes USB_SBU1 and
USB_SBU2 which goes to the USB connector. So just switching polarity of
those pins.
But let's say whatever it does, it's not relevant to this use case now
without DP?

>
> https://www.allaboutcircuits.com/uploads/articles/Fig1m11292018.png
>
> >>
> >> I wonder how many lanes dp_opts->lanes says for your part ?
> >=20
> > Not sure.. Where is this configured?
>
> Heh - now that I look my lane count =3D=3D 0, a bug to be fixed..
>
> Hmm, Luca can you test this change
>
> -       if (orientation =3D=3D TYPEC_ORIENTATION_NONE) {
> -               if (qmp->init_count)
> -                       ret =3D qmp_combo_dp_power_off(dp_phy);
> -       } else {
> -               if (!qmp->init_count)
> -                       ret =3D qmp_combo_dp_power_on(dp_phy);
> -       }
> +       if (orientation =3D=3D TYPEC_ORIENTATION_NONE)
> +               ret =3D qmp_combo_dp_power_off(dp_phy);
> +       else
> +               ret =3D qmp_combo_dp_power_on(dp_phy);

I unfortunately don't really see any change in behavior with this..

>
>
> > But I also don't have DisplayPort over USB-C (video out) configured yet=
.
> > Related question: does video out work on sm8250+pm8150b for you?
>
> Nope - WIP. I see getting TCPM upstream and working as a first step,=20
> then we look at introduction of the redriver, DP work, dt etc.

Clear, I look forward to that landing ;) But also already what the
driver does now is really useful!

Regards
Luca

>
>
> > [ 1722.130836] qcom,pmic-typec c440000.spmi:pmic@2:typec@1500: get_cc: =
misc 0x000000cb cc1 0x00000001 Ra cc2 0x00000002 Rd attached 1 cc=3Dcc1
> >=20
> > - unplug -
> >=20
> > [ 1867.223052] qcom,pmic-typec c440000.spmi:pmic@2:typec@1500: get_cc: =
misc 0x00000042 cc1 0x00000000 Open cc2 0x00000000 Open attached 0 cc=3Dcc1
> > =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > USB unstable (device plug orientation 2):
> > =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D
> >=20
> > [ 1894.263324] qcom,pmic-typec c440000.spmi:pmic@2:typec@1500: get_cc: =
misc 0x000000c9 cc1 0x00000002 Rd cc2 0x00000001 Ra attached 1 cc=3Dcc2
> > - unplug -
> >=20
> > [ 1907.264840] qcom,pmic-typec c440000.spmi:pmic@2:typec@1500: get_cc: =
misc 0x00000040 cc1 0x00000000 Open cc2 0x00000000 Open attached 0 cc=3Dcc2
>
> Normal, correct.
>
> For reference on 8250
>
> Attached orientation reverse / cc2
>
> [   77.719278] qcom,pmic-typec c440000.spmi:pmic@2:typec@1500: set_cc:=20
> currsrc=3D2 Rp-3.0-330uA mode EN_SRC_ONLY debounce 1 attached 1 cc=3Dcc2
>
> Detached orientation (none)
> [   82.475667] qcom,pmic-typec c440000.spmi:pmic@2:typec@1500: get_cc:=20
> misc 0x000000c0 cc1 0x00000000 Open cc2 0x00000000 Open attached 0 cc=3Dc=
c2
>
> Attached orientation normal / cc1
> [   82.485375] qcom,pmic-typec c440000.spmi:pmic@2:typec@1500:=20
> start_toggling: misc 0x00000040 attached 0 port_type 0 current cc 5 new 5
> [   85.247368] qcom,pmic-typec c440000.spmi:pmic@2:typec@1500: get_cc:=20
> misc 0x000000cb cc1 0x00000001 Ra cc2 0x00000002 Rd attached 1 cc=3Dcc1
>
> Anyway I reckon that guard I have in the PHY code is wrong, would=20
> appreciate a test.
>
> ---
> bod

