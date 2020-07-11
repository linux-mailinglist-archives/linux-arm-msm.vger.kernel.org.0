Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7116C21C1EF
	for <lists+linux-arm-msm@lfdr.de>; Sat, 11 Jul 2020 05:37:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727825AbgGKDhQ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 10 Jul 2020 23:37:16 -0400
Received: from mail29.static.mailgun.info ([104.130.122.29]:26397 "EHLO
        mail29.static.mailgun.info" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726707AbgGKDhQ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 10 Jul 2020 23:37:16 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1594438634; h=Content-Transfer-Encoding: Content-Type:
 MIME-Version: Message-ID: Date: Subject: In-Reply-To: References: Cc:
 To: From: Sender; bh=WYsZHFg0/evTrJYo5esTCdWPLshbWMTRzSMvct1drRA=; b=u3YXF1Q5ouRRkEx3vt6jhD747HWa8XrQ47C+1brb4fPOD0oOGiz6j6+lZtFc8zxfd7UfFafF
 DAZ1dROHHQPilNyjPOJjOgOmIa6NKiVMIwJrGRyi62vtv2X+RslYDQdo7zbYmLKM0uOLzcGy
 q3GQNetUidGxOR9TRrmBWufC6Q8=
X-Mailgun-Sending-Ip: 104.130.122.29
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n02.prod.us-east-1.postgun.com with SMTP id
 5f0933ea427cd55766727866 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Sat, 11 Jul 2020 03:37:14
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 2A91AC43387; Sat, 11 Jul 2020 03:37:13 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE,
        URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from Pillair (unknown [183.83.71.149])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: pillair)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 2C9E3C433C6;
        Sat, 11 Jul 2020 03:37:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 2C9E3C433C6
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=none smtp.mailfrom=pillair@codeaurora.org
From:   "Rakesh Pillai" <pillair@codeaurora.org>
To:     "'Doug Anderson'" <dianders@chromium.org>
Cc:     "'open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS'" 
        <devicetree@vger.kernel.org>,
        "'Evan Green'" <evgreen@chromium.org>,
        "'Andy Gross'" <agross@kernel.org>,
        "'Bjorn Andersson'" <bjorn.andersson@linaro.org>,
        "'Rob Herring'" <robh+dt@kernel.org>,
        "'linux-arm-msm'" <linux-arm-msm@vger.kernel.org>,
        "'LKML'" <linux-kernel@vger.kernel.org>,
        "'Sibi Sankar'" <sibis@codeaurora.org>
References: <1594286253-32244-1-git-send-email-pillair@codeaurora.org> <CAD=FV=XQy17ZuKdJXPH20uGTrEtPrDacDXAg+rTA96HBm6hVVw@mail.gmail.com>
In-Reply-To: <CAD=FV=XQy17ZuKdJXPH20uGTrEtPrDacDXAg+rTA96HBm6hVVw@mail.gmail.com>
Subject: RE: [PATCH] arm64: dts: qcom: sc7180: Add missing properties for Wifi node
Date:   Sat, 11 Jul 2020 09:07:05 +0530
Message-ID: <007701d65734$90039c80$b00ad580$@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain;
        charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Mailer: Microsoft Outlook 16.0
Thread-Index: AQFjyE5VI4l7cbK/b4BghJEFxZssywLCt6GuqdDCWpA=
Content-Language: en-us
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org



> -----Original Message-----
> From: Doug Anderson <dianders@chromium.org>
> Sent: Friday, July 10, 2020 1:36 AM
> To: Rakesh Pillai <pillair@codeaurora.org>
> Cc: open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS
> <devicetree@vger.kernel.org>; Evan Green <evgreen@chromium.org>;
> Andy Gross <agross@kernel.org>; Bjorn Andersson
> <bjorn.andersson@linaro.org>; Rob Herring <robh+dt@kernel.org>; linux-
> arm-msm <linux-arm-msm@vger.kernel.org>; LKML <linux-
> kernel@vger.kernel.org>; Sibi Sankar <sibis@codeaurora.org>
> Subject: Re: [PATCH] arm64: dts: qcom: sc7180: Add missing properties =
for
> Wifi node
>=20
> Hi,
>=20
> On Thu, Jul 9, 2020 at 2:18 AM Rakesh Pillai <pillair@codeaurora.org> =
wrote:
> >
> > The wlan firmware memory is statically mapped in
> > the Trusted Firmware, hence the wlan driver does
> > not need to map/unmap this region dynamically.
> >
> > Hence add the property to indicate the wlan driver
> > to not map/unamp the firmware memory region
> > dynamically.
> >
> > Also add the chain1 voltage supply for wlan.
> >
> > Signed-off-by: Rakesh Pillai <pillair@codeaurora.org>
> > ---
> > This patch is created on top of the change by
> > Douglas Anderson.
> > https://lkml.org/lkml/2020/6/25/817
> >
> > Also the dt-bindings for the chain1 voltage supply
> > is added by the below patch series:
> > =
https://patchwork.kernel.org/project/linux-wireless/list/?series=3D309137=

> > ---
> >  arch/arm64/boot/dts/qcom/sc7180-idp.dts | 2 ++
> >  1 file changed, 2 insertions(+)
> >
> > diff --git a/arch/arm64/boot/dts/qcom/sc7180-idp.dts
> b/arch/arm64/boot/dts/qcom/sc7180-idp.dts
> > index 472f7f4..4c64bc1 100644
> > --- a/arch/arm64/boot/dts/qcom/sc7180-idp.dts
> > +++ b/arch/arm64/boot/dts/qcom/sc7180-idp.dts
> > @@ -391,10 +391,12 @@
> >
> >  &wifi {
> >         status =3D "okay";
> > +       qcom,msa-fixed-perm;
>=20
> At one point in time I thought +Sibi said that this wouldn't be needed
> once the firmware was fixed.  ...afterwards you said that it was
> needed for SSR (subsystem reset).  Would be good to get confirmation
> from Sibi that this matches his understanding.

Hi Doug,

This is now needed as the firmware memory mapping was moved to Trusted =
firmware.
This region is now statically mapped to avoid access from driver.

>=20
>=20
> >         vdd-0.8-cx-mx-supply =3D <&vreg_l9a_0p6>;
> >         vdd-1.8-xo-supply =3D <&vreg_l1c_1p8>;
> >         vdd-1.3-rfa-supply =3D <&vreg_l2c_1p3>;
> >         vdd-3.3-ch0-supply =3D <&vreg_l10c_3p3>;
> > +       vdd-3.3-ch1-supply =3D <&vreg_l11c_3p3>;
> >         wifi-firmware {
> >                 iommus =3D <&apps_smmu 0xc2 0x1>;
> >         };
>=20
> Other than the one question this looks good to me.
>=20
> -Doug

