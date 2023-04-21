Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 735B06EA84E
	for <lists+linux-arm-msm@lfdr.de>; Fri, 21 Apr 2023 12:26:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231267AbjDUK0c (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 21 Apr 2023 06:26:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59334 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230335AbjDUK0a (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 21 Apr 2023 06:26:30 -0400
Received: from mail-ej1-x634.google.com (mail-ej1-x634.google.com [IPv6:2a00:1450:4864:20::634])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5D7D8E63
        for <linux-arm-msm@vger.kernel.org>; Fri, 21 Apr 2023 03:26:28 -0700 (PDT)
Received: by mail-ej1-x634.google.com with SMTP id a640c23a62f3a-94ed7e49541so196446066b.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 21 Apr 2023 03:26:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1682072787; x=1684664787;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Iet7yaiulN1KsP/2/aLjRVmvZfhTeLjdC9dKF+QtX7U=;
        b=Rn3FOi9y++YS9buU9tuOjKmGanEcbXsFTUNuJf4fpERfZx3g30UqZiLc+Wso6HFaiY
         qprwVJRG1AC/bPirQrvm2TM5vl11j842uHuk67x7PpGD+y4NcNWi8ouBvb175uZFY679
         fApgx3TzqpoW8DyHutIhEma0WX9fMFM59RQwSCAXA7lb7El346nR5RCBGsZk9o0j80OR
         I/GxxVatc1+8LvjS/3Eqgjv4GNNY0XAySFJHyGOlFrXMTTfD5ahakjm4BoMMDptjRu+6
         Y9Xg+ZCAxkh6+i9yBw98Xz/tN8PTtNfywf78ndQhlVIVY+sm7877M4oV2dghGk3KZrRK
         xigA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682072787; x=1684664787;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Iet7yaiulN1KsP/2/aLjRVmvZfhTeLjdC9dKF+QtX7U=;
        b=kAGWH9JTAKPZIi26NbOkJTcnuUSYdlx5GPxdGGZyodB3MF7g/3WSdpq1BdQhTwprUQ
         FkIwrebOhlc3Jyo4RVffTt1CD46jrzOcLfUAD0WpbqDUV0WOebk0wQUAwAn40STotG9R
         XFQYIIT5ufILP7XHo4dKzdBXL+gEBaOi3QVGnZfNOXf9vat0XKlm9gJSxvpAf07lPGsY
         C6kwI97EqFpmaPs4Usf2/1MdVoieaGn5N8FPIdRyq9Rs4SDUlJlGWTdKcSfIWLSXM+W6
         lEoS7O2ukyZZiqMKbxSSevIDh7eteAZMKccViTWq0LSj0v1+fnzWxhqpSTQ8rNUDwFHH
         5tJg==
X-Gm-Message-State: AAQBX9cH/HtpGlyV7RxBvf7katIWCm5JXliudAyjwga1p4szdYmrQSY+
        frmnGrYs8fewqBxrgDY0exqnQg==
X-Google-Smtp-Source: AKy350YsMYot67V+M+M4Rk0yTffiTXWyediKG6DRN3K8T+AxlqX8zn/mMqi/cxL30F+7Ol19z9Aa+Q==
X-Received: by 2002:a17:906:a18c:b0:928:796d:71e8 with SMTP id s12-20020a170906a18c00b00928796d71e8mr1664800ejy.3.1682072786738;
        Fri, 21 Apr 2023 03:26:26 -0700 (PDT)
Received: from localhost (144-178-202-138.static.ef-service.nl. [144.178.202.138])
        by smtp.gmail.com with ESMTPSA id l7-20020a1709060e0700b0094ee21fe943sm1862553eji.116.2023.04.21.03.26.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 21 Apr 2023 03:26:26 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date:   Fri, 21 Apr 2023 12:26:25 +0200
Message-Id: <CS2D1E4ZYKZ8.2CWDCP9VR0C11@otso>
Cc:     <caleb.connolly@linaro.org>, <konrad.dybcio@linaro.org>,
        <subbaram@quicinc.com>, <jackp@quicinc.com>,
        <robertom@qti.qualcomm.com>
Subject: Re: [PATCH v5 00/14] Add Qualcomm PMIC TPCM support
From:   "Luca Weiss" <luca.weiss@fairphone.com>
To:     "Bryan O'Donoghue" <bryan.odonoghue@linaro.org>,
        <linux@roeck-us.net>, <heikki.krogerus@linux.intel.com>,
        <gregkh@linuxfoundation.org>, <andersson@kernel.org>,
        <robh+dt@kernel.org>, <krzysztof.kozlowski+dt@linaro.org>,
        <linux-usb@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <devicetree@vger.kernel.org>
X-Mailer: aerc 0.14.0
References: <20230413113438.1577658-1-bryan.odonoghue@linaro.org>
 <CRVOZOPMKBX4.2T7FOCWF0RKBJ@otso>
 <10551f5e-4516-c0cc-0b04-73aa38f80a2c@linaro.org>
 <CRWA2OP2T6KT.RCWAVWF5Q2T2@otso>
 <ccc9fa4c-ca52-d8f3-a8b3-45031bea673f@linaro.org>
 <CRYUWMIJDSB2.BJWEPJEA3Y1D@otso>
 <75d00efb-ff3c-b1f8-a141-3fa78a39557a@linaro.org>
In-Reply-To: <75d00efb-ff3c-b1f8-a141-3fa78a39557a@linaro.org>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Bryan,

On Mon Apr 17, 2023 at 12:04 PM CEST, Bryan O'Donoghue wrote:
> On 17/04/2023 08:35, Luca Weiss wrote:
> > Do you have an idea in which part of the code to start debugging this?
> > Since orientation detection is working is it maybe in the phy code and
> > not in the tcpm driver? Or does that also touch crucial stuff for USB
> > apart from telling phy which direction to use?
>
> PHY - I'd almost just do the following
>
> diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-combo.c=20
> b/drivers/phy/qualcomm/phy-qcom-qmp-combo.c
> index edb788a71edeb..bbac82bd093f8 100644
> --- a/drivers/phy/qualcomm/phy-qcom-qmp-combo.c
> +++ b/drivers/phy/qualcomm/phy-qcom-qmp-combo.c
> @@ -3369,7 +3369,7 @@ static int qmp_combo_typec_switch_set(struct=20
> typec_switch_dev *sw,
>
>          dev_dbg(qmp->dev, "Toggling orientation current %d requested %d\=
n",
>                  qmp->orientation, orientation);
> -
> +return 0;
>
> In that case the PHY should "just work" for host or device in one=20
> orientation.
>
> The other possibility is that the data role message is not hitting dwc3=
=20
> drd on your platform.
>
> If you take the last commit on this branch - plus the updated PHY commit
>
> Commit: 171d7f507511 ("usb: dwc3: drd: Enable user-space triggered=20
> role-switching")
>
> Commit: eb0daa19f3ad ("phy: qcom-qmp: Register as a typec switch for=20
> orientation detection")
>
> https://git.codelinaro.org/bryan.odonoghue/kernel/-/tree/linux-next-23-04=
-17-pm8150b-tcpm-qcom-wrapper-typec-mux
>
> cat /sys/class/usb_role/a600000.usb-role-switch/role
>
> On SM8250 it looks like this
>
> - Attach TypeC accessory with USB key plugged in [1]
>    Mount USB key, read/write some data
>    Unmount USB key
>
>    cat /sys/class/usb_role/a600000.usb-role-switch/role
>    host

It feels like I spent way too much time now trying to understand the
current behavior across the different patch versions, it's a bit messy,
but in short:

With the "user-space triggered role-switching" patch I can see that
whatever scenario the USB-C port is in, the role is stuck on "device".=20

Nothing =3D
    Role: device, Orientation: unknown

USB(-A) cable to laptop (either direction) =3D
    Role: device, Orientation: unknown

USB stick up =3D
    Role: device, Orientation: reverse

USB stick down =3D
    Role: device, Orientation: normal

Sometimes/mostly when the USB cable is attached during boot I get USB
connection to the laptop until I unplug, then it won't reenable itself.

Also the early return in qmp_combo_typec_switch_set doesn't seem to
change much I believe? But for sure normally qmp_combo_dp_power_off/on
does not get called so I wouldn't be suprised if this reinit breaks
something in the phy.

> <snip>
>
> Yep its worth checking out that the data-role switch is working, we=20
> might be looking at the wrong thing for you on the PHY.
>

So this seems to be the case? If that's useful, I can also go back to
the previous (v4?) TCPM revision where the switching mostly worked fine.

(btw the subject has a typo, TPCM instead of TCPM :) )

Regards
Luca
