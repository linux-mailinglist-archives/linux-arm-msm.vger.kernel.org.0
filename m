Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 26ED6F32D3
	for <lists+linux-arm-msm@lfdr.de>; Thu,  7 Nov 2019 16:21:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729907AbfKGPVK (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 7 Nov 2019 10:21:10 -0500
Received: from mail-yb1-f193.google.com ([209.85.219.193]:35642 "EHLO
        mail-yb1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727779AbfKGPVK (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 7 Nov 2019 10:21:10 -0500
Received: by mail-yb1-f193.google.com with SMTP id i12so1072525ybg.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 07 Nov 2019 07:21:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=softbankrobotics.com; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=1acTtONRgb0usuJaFUKddbXdLV9J2Ws9ySjq9JH1O8w=;
        b=W0xKGXpz7bBo4GhKfvhNjyJ3DWXTjk/DcrakRNDQI8I8isyDwNkdDtEzwiQQTHeGHZ
         FTFUB/PvzAahBWKK+KJMCJ1gV/4Sv7RaNcTleYVw5JPQiXQwq5t73YBeE4iKQhNtFDza
         cOuj0mmsyWz+iuq+OPJloZFi+v//kRxwml1SMeCUFFRKJ5IPZ0FaOS+LvcJyv39A3paX
         2mKn1kYfBeW41EQHEw3PeYAaM6RxeNeRE/30I2tWU9zF5rZabVKOH538QfMoEM8ShmMl
         ZfDbyuf6iqq9/ABZAjD3FIAXCfGW5+2ivDxPrJZGpV/PIfP8RhhPWr+p+mFGQAwIB2JE
         OQHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=1acTtONRgb0usuJaFUKddbXdLV9J2Ws9ySjq9JH1O8w=;
        b=ByAhpV4qA+g6R9AOR3Rb4wpcqTKrQf+4e8UNabbDI/Dem3fjgrzFicAmMtfYktbJLT
         fVAl0z4QZ2i9cXAsTjyiqqHO2Ed+2i7s2DSQVEOeXhe4RUsLErVR9pLKF/aJzyc/v6MI
         DfgkzUS/9YuxMPk6DrmTMBrsMZAen6v+9iOTg9HU7bh7qGUPTOnx4K0AyMzxeWhOc9oV
         dE0cjV/YvPsG3V8OP69hTi+Thf9oqCLbKuyQI2bKPvtzEiXvlODRNmjiAdG8VEK6L5ja
         pc1mqQhWnmlq/rIxQWPqm40Ni2Jkxdly/Xri/OxLxdatiiTBSKX5M6pjUhzP/x5A4fwA
         PX9A==
X-Gm-Message-State: APjAAAUitVWE9uDq8DohhviQPY2S0eUHNTBwnfND/uyqV8Y2CzZx8sBV
        c49q1RF1ExxoogBKXiE4REnRyTk6omeb6c0JbWNybO9+N2vKEhjgyckKwrXK0fkBmRY5NOEa6Z6
        0egUdzDyiIRwaNg/vnAODL9dj7bpLtquu
X-Google-Smtp-Source: APXvYqx7EmjM+t4xin/Z0yi/k2ooVrTiv80qyGjcFmMoKt/Qrm/FEhkrqssKnn5ji0lB0fdEHsnIU6gRF+6cP0q7TxE=
X-Received: by 2002:a25:c791:: with SMTP id w139mr3505225ybe.300.1573140068994;
 Thu, 07 Nov 2019 07:21:08 -0800 (PST)
MIME-Version: 1.0
References: <20191107002247.1127689-1-bjorn.andersson@linaro.org>
In-Reply-To: <20191107002247.1127689-1-bjorn.andersson@linaro.org>
From:   Julien Massot <jmassot@softbankrobotics.com>
Date:   Thu, 7 Nov 2019 16:20:58 +0100
Message-ID: <CADGp=QdLjo_S6_t1t95d5CiHpkHU5qrTmo-eRtFaFga1TLeWhg@mail.gmail.com>
Subject: Re: [PATCH v2 0/3] arm64: dts: qcom: sdm845: Add PCIe nodes
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     Andy Gross <agross@kernel.org>, Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Bjorn,

On Thu, Nov 7, 2019 at 1:22 AM Bjorn Andersson
<bjorn.andersson@linaro.org> wrote:
>
> Add PCIe controller and PHY nodes for SDM845 and enable them for the
> Dragonboard 845c.

Thanks a lot the gen 3 PCIE works on my 845 platform.
Tested-by: Julien Massot <jmassot@softbankrobotics.com>

--=20


*This email and any attachment thereto are confidential and intended=20
solely for the use of the individual or entity to whom they are addressed.

If you are not the intended recipient, please be advised that disclosing,=
=20
copying, distributing or taking any action in reliance on the contents of=
=20
this email is strictly prohibited. In such case, please immediately advise=
=20
the sender, and delete all copies and attachment from your system.
This=20
email shall not be construed and is not tantamount to an offer, an=20
acceptance of offer, or an agreement by SoftBank Robotics Europe on any=20
discussion or contractual document whatsoever. No employee or agent is=20
authorized to represent or bind SoftBank Robotics Europe to third parties=
=20
by email, or act on behalf of SoftBank Robotics Europe by email, without=20
express written confirmation by SoftBank Robotics Europe=E2=80=99 duly auth=
orized=20
representatives.
*



*Ce message =C3=A9lectronique et =C3=A9ventuelles pi=C3=A8ces=20
jointes sont confidentiels, et exclusivement destin=C3=A9s =C3=A0 la person=
ne ou=20
l'entit=C3=A9 =C3=A0 qui ils sont adress=C3=A9s.
Si vous n'=C3=AAtes pas le destinataire vis=C3=A9,=20
vous =C3=AAtes pri=C3=A9 de ne pas divulguer, copier, distribuer ou prendre=
 toute=20
d=C3=A9cision sur la foi de ce message =C3=A9lectronique. Merci d'en aviser=
=20
imm=C3=A9diatement l'exp=C3=A9diteur et de supprimer toutes les copies et =
=C3=A9ventuelles=20
pi=C3=A8ces jointes de votre syst=C3=A8me.
Ce message =C3=A9lectronique n'=C3=A9quivaut pas =C3=A0=20
une offre, =C3=A0 une acceptation d=E2=80=99offre, ou =C3=A0 un accord de S=
oftBank Robotics=20
Europe sur toute discussion ou document contractuel quel qu=E2=80=99il soit=
, et ne=20
peut =C3=AAtre interpr=C3=A9t=C3=A9 comme tel. Aucun employ=C3=A9 ou agent =
de SoftBank Robotics=20
Europe n'est autoris=C3=A9 =C3=A0 repr=C3=A9senter ou =C3=A0 engager la soc=
i=C3=A9t=C3=A9 par email, ou =C3=A0=20
agir au nom et pour le compte de la soci=C3=A9t=C3=A9 par email, sans qu=E2=
=80=99une=20
confirmation =C3=A9crite soit donn=C3=A9e par le repr=C3=A9sentant l=C3=A9g=
al de SoftBank=20
Robotics Europe ou par toute autre personne ayant re=C3=A7u d=C3=A9l=C3=A9g=
ation de=20
pouvoir appropri=C3=A9e.
*

**
