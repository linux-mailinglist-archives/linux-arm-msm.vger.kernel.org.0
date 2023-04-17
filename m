Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 40F566E4136
	for <lists+linux-arm-msm@lfdr.de>; Mon, 17 Apr 2023 09:37:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231150AbjDQHhV (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 17 Apr 2023 03:37:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50138 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229915AbjDQHhH (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 17 Apr 2023 03:37:07 -0400
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com [IPv6:2a00:1450:4864:20::629])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B05D64C1A
        for <linux-arm-msm@vger.kernel.org>; Mon, 17 Apr 2023 00:35:54 -0700 (PDT)
Received: by mail-ej1-x629.google.com with SMTP id q23so52156033ejz.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 17 Apr 2023 00:35:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1681716953; x=1684308953;
        h=in-reply-to:references:subject:cc:to:from:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5XFC/9mvzx/O4+6lgw0WJn0uaQEYjzkPhtZfQPhydig=;
        b=HUNbhNW99JActqnQxEFBW8XSlaWGg0MbaAp51GqNl/iqZW/orFbEQDWGJd7LnYcD2G
         enTyvjpxSqOlLy+rHMoYWBYvMAyfQX7p0p3U2O2YlCrXy6u7plHWmfQMqziDmMLpOM7H
         PhewcKOa9xsP5vLUXqrKWw1hiVSVQSSG6f4okIbN7Frmr+drvDGi4L45g+XTK/wS46Zr
         k4z1P9XZhwDM8jNRuriP6wqOXNdPVCiKrysYQQ3vvZRCak+E7z5BkJmAwlIfNY+H9Dds
         h6gS7t735ef1m5k9e47nDQWr/8PjxutS/LcGnBVYGrdXYQiRuYw0OI8Z3zKwuCNx6fq8
         HwAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681716953; x=1684308953;
        h=in-reply-to:references:subject:cc:to:from:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=5XFC/9mvzx/O4+6lgw0WJn0uaQEYjzkPhtZfQPhydig=;
        b=eJUohhdnyYxxxz0vz7MfkrSMS0l6tdxoDVaqXwH1B6i3dd+XcCFaKTnBNSdFY2O6S9
         06KB0ZvalDLH2ucs3vrTsSOPtCeQaiYt3jlU2CZUn9tlZtERSy7pYYbujYmsxkrH4twr
         0FnrHbl2JYlKJxbsZfQ63mY/L7sAVQU0QhaxCJ5zmG3riAYGjhqEufGK+Whk/CmJh3VN
         ezJqsRrpLQjbdMZHUhoEILOAJYqLuMtEkG8E4BtHHheVhTHIoK340q9ed97wGw6d8MOW
         HzbxETQpQQ+lHh8ufjOj57G6eMDAh0AkLUw0GXzE1m6lOM2GtLYCgps+DjpAR+Ab+Fi8
         pbjw==
X-Gm-Message-State: AAQBX9fgXWiiPGFgQLSYUgIOD+vZpaqNOk6X4lRi+0NMgA9oEPKx2eVP
        X2EVEw6YH+Seb3hYgvj1uOAxSIfYuYUs2ptNKfuD0k2M
X-Google-Smtp-Source: AKy350aiszsdDZQNPNMwuj0S2OGQCXnyOKHKInK77illrwKv5Zv4EoM9X2+pYLi40BANUGtxEvocIQ==
X-Received: by 2002:a17:906:70d1:b0:94e:e859:8721 with SMTP id g17-20020a17090670d100b0094ee8598721mr7788806ejk.22.1681716953131;
        Mon, 17 Apr 2023 00:35:53 -0700 (PDT)
Received: from localhost (144-178-202-138.static.ef-service.nl. [144.178.202.138])
        by smtp.gmail.com with ESMTPSA id be5-20020a1709070a4500b0094f282fc29asm2973857ejc.207.2023.04.17.00.35.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 17 Apr 2023 00:35:52 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date:   Mon, 17 Apr 2023 09:35:52 +0200
Message-Id: <CRYUWMIJDSB2.BJWEPJEA3Y1D@otso>
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
Subject: Re: [PATCH v5 00/14] Add Qualcomm PMIC TPCM support
X-Mailer: aerc 0.14.0
References: <20230413113438.1577658-1-bryan.odonoghue@linaro.org>
 <CRVOZOPMKBX4.2T7FOCWF0RKBJ@otso>
 <10551f5e-4516-c0cc-0b04-73aa38f80a2c@linaro.org>
 <CRWA2OP2T6KT.RCWAVWF5Q2T2@otso>
 <ccc9fa4c-ca52-d8f3-a8b3-45031bea673f@linaro.org>
In-Reply-To: <ccc9fa4c-ca52-d8f3-a8b3-45031bea673f@linaro.org>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Mon Apr 17, 2023 at 2:30 AM CEST, Bryan O'Donoghue wrote:
> On 14/04/2023 07:51, Luca Weiss wrote:
> > I see "reverse" and "normal" depending on the direction the USB stick i=
s
> > plugged in. When unplugged but also when plugged into my PC it stays at
> > "unknown".
>
> Right so, this is down to bad behavior on the PHY patch, which is=20
> resolved for me on sm8250 with the below.
>
> Basically when you unplug a device you would transition back to=20
> "TYPEC_ORIENTATION_NONE" but that would turn off the PHY, which is obs=20
> not very useful if you want to subsequently be a gadget.
>
> Anyway thanks for testing this - I'd missed the=20
> host->device->host->device ping-pong breakage.

Hm, unfortunately no improvement with this on my side.. No USB
connection pops up on the host, or USB messages regarding the USB stick
on the device.

Do you have an idea in which part of the code to start debugging this?
Since orientation detection is working is it maybe in the phy code and
not in the tcpm driver? Or does that also touch crucial stuff for USB
apart from telling phy which direction to use?

Regards
Luca

>
> diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-combo.c=20
> b/drivers/phy/qualcomm/phy-qcom-qmp-combo.c
> index b9a30c087423d..edb788a71edeb 100644
> --- a/drivers/phy/qualcomm/phy-qcom-qmp-combo.c
> +++ b/drivers/phy/qualcomm/phy-qcom-qmp-combo.c
> @@ -3372,12 +3372,13 @@ static int qmp_combo_typec_switch_set(struct=20
> typec_switch_dev *sw,
>
>          qmp->orientation =3D orientation;
>
> -       if (orientation =3D=3D TYPEC_ORIENTATION_NONE) {
> -               if (qmp->init_count)
> -                       ret =3D qmp_combo_dp_power_off(dp_phy);
> -       } else {
> -               if (!qmp->init_count)
> -                       ret =3D qmp_combo_dp_power_on(dp_phy);
> +       if (orientation !=3D TYPEC_ORIENTATION_NONE) {
> +               ret =3D qmp_combo_dp_power_off(dp_phy);
> +               if (ret)
> +                       return ret;
> +               ret =3D qmp_combo_dp_power_on(dp_phy);
> +               if (ret)
> +                       return ret;
>          }
>
> ---
> bod

