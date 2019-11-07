Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id DBF2DF32CE
	for <lists+linux-arm-msm@lfdr.de>; Thu,  7 Nov 2019 16:20:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729917AbfKGPUZ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 7 Nov 2019 10:20:25 -0500
Received: from mail-yw1-f66.google.com ([209.85.161.66]:35815 "EHLO
        mail-yw1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727779AbfKGPUZ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 7 Nov 2019 10:20:25 -0500
Received: by mail-yw1-f66.google.com with SMTP id r131so708051ywh.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 07 Nov 2019 07:20:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=softbankrobotics.com; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=18TLb91SzT2x0R/+396U6JSLyNNqAB8XVEkq7aB6mlk=;
        b=DewvGuNhgkHP8qP2WCxwxrCvqhGi0nEa5jNfkHYGmIxj4+NdxIYnac6jrWWkzqSmzd
         JISNZ45acf413XEzpEzO4WDO52DEGQgBK5nGP//TJnli5V4eY6vM9ac/M2CZ1/30H1JV
         uSyYbgqakRYBG2A+rPyZDkMRfeUsYNm1n9ZAIctCyo5K3xPxVOHZF23RjYRXWU4UB0vh
         SX9OGtjLpucTu8hBzpX0RUL/3vQMJVkcv+pV1GtgcpGSALHddoJo0wGRas6kQXoeQUt+
         qddqcCdX2rNsEsxk8UvpJRX8r8poOLIf3ANuWcy4nR5rf5wINPHm2Pa1WyWaN4+OneHu
         c1RA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=18TLb91SzT2x0R/+396U6JSLyNNqAB8XVEkq7aB6mlk=;
        b=WAiAZZjrnanjTjf+2kDwP7AMFXsVkaP/At7Tm9KBP5D+ltnxibQThWM/mVoVI8DWTY
         64yLUgCtaIUzzFeTw+eaiKfHIG4G2VOQjXPK5kRoRWkTAZV9HVfOIushsD5SbCKQRMPs
         tB6G+4czJZHmQclCjZAxqqf6l/coiFWpLejAh5FTL0RfPAAqqu4L8lLvaBp+3drpG51M
         PsRhJjkWRG9C1Efh3yEodoocpd87Dppdj/KeZ+dptWBRg+nmPdnc8Kj13tetQsQ9MV86
         V07DfT4CkqdGyx9SlV3knPvx7/aE2/kpELYVo1XKd7sZ7/fclA1CxfK9vmcmPZslY/2M
         40/g==
X-Gm-Message-State: APjAAAVnMa/xpfOWJv1oKgk/rd1m0BzAQUF7wXHiML12pJrpxUV/dsSh
        Fm4WiqUPvCLGAdP24Qm2T8SMD9MzeORo8YVEWKJr7z9+9ByXkud8vwuPZy7A3fpqS6DtnNLvw3t
        mW7LDn13Q8k+yx0wo+FlOeX0ySaSxpXu0PUXhRw==
X-Google-Smtp-Source: APXvYqxswHnO3u8l/PozS38LwoBMyGav1VM8lSB94X/NFkBvej0uzf7oh1fGSwxh/+CmB/LtdCrgXlQH6bLLfGp+p2Y=
X-Received: by 2002:a0d:f9c6:: with SMTP id j189mr2802766ywf.34.1573140024613;
 Thu, 07 Nov 2019 07:20:24 -0800 (PST)
MIME-Version: 1.0
References: <20191107000917.1092409-1-bjorn.andersson@linaro.org>
In-Reply-To: <20191107000917.1092409-1-bjorn.andersson@linaro.org>
From:   Julien Massot <jmassot@softbankrobotics.com>
Date:   Thu, 7 Nov 2019 16:20:13 +0100
Message-ID: <CADGp=Qd-5oSkWMNzyjpDJhXuS9cmT0g2Ofg=yq+cdVnunf9-hA@mail.gmail.com>
Subject: Re: [PATCH v3 0/5] phy: qcom-qmp: Add SDM845 QMP and QHP PHYs
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     Kishon Vijay Abraham I <kishon@ti.com>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Bjorn,

On Thu, Nov 7, 2019 at 1:09 AM Bjorn Andersson
<bjorn.andersson@linaro.org> wrote:
>
> Add support for the two PCIe PHYs found in Qualcomm SDM845.
>

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
