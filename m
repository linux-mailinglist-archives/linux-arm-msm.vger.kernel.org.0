Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B26491D9FF8
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 May 2020 20:50:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726567AbgESSur (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 19 May 2020 14:50:47 -0400
Received: from mail27.static.mailgun.info ([104.130.122.27]:25146 "EHLO
        mail27.static.mailgun.info" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726290AbgESSur (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 19 May 2020 14:50:47 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1589914246; h=Content-Transfer-Encoding: Content-Type:
 MIME-Version: Message-ID: Date: Subject: In-Reply-To: References: Cc:
 To: From: Sender; bh=i1KDNTEcQpMlZ8oYJUcWWelkymnM8rNqtXNDYGMt8AU=; b=MLCWguRQi/BYpTTDy83RqC2qOBfEcJGDySK+tEmEu54QfZAFwBCpQjXrJzzEDpy69T60oaKV
 pB1IhUNmH8TbwRE4xAXwKnIbSJx/Ltwcp4U18LHPDukrIs4ogfWuBLreV8qWNoOoB5hK0i1T
 N3gSoLsIB0/MgpWC48eXoGek4fQ=
X-Mailgun-Sending-Ip: 104.130.122.27
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171])
 by mxa.mailgun.org with ESMTP id 5ec42a85.7f0271097298-smtp-out-n04;
 Tue, 19 May 2020 18:50:45 -0000 (UTC)
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id C271EC433D2; Tue, 19 May 2020 18:50:44 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE,
        URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from Pillair (unknown [183.83.68.41])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: pillair)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 0A23CC433D2;
        Tue, 19 May 2020 18:50:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 0A23CC433D2
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=none smtp.mailfrom=pillair@codeaurora.org
From:   <pillair@codeaurora.org>
To:     "'Evan Green'" <evgreen@chromium.org>
Cc:     "'open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS'" 
        <devicetree@vger.kernel.org>,
        "'linux-arm Mailing List'" <linux-arm-kernel@lists.infradead.org>,
        "'LKML'" <linux-kernel@vger.kernel.org>,
        "'linux-arm-msm'" <linux-arm-msm@vger.kernel.org>
References: <1589712411-26718-1-git-send-email-pillair@codeaurora.org> <CAE=gft577zxP5F6OdFXt6taLuLyye+tdRqZa63mPSRtPXO3Lcw@mail.gmail.com>
In-Reply-To: <CAE=gft577zxP5F6OdFXt6taLuLyye+tdRqZa63mPSRtPXO3Lcw@mail.gmail.com>
Subject: RE: [PATCH v9] arm64: dts: qcom: sc7180: Add WCN3990 WLAN module device node
Date:   Wed, 20 May 2020 00:20:36 +0530
Message-ID: <039201d62e0e$65d16590$317430b0$@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain;
        charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Mailer: Microsoft Outlook 16.0
Thread-Index: AQFK6cBZDXagU4txI1QUeQtvgRsTqwIox4YXqbUCpuA=
Content-Language: en-us
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Evan,


> -----Original Message-----
> From: Evan Green <evgreen@chromium.org>
> Sent: Tuesday, May 19, 2020 10:58 PM
> To: Rakesh Pillai <pillair@codeaurora.org>
> Cc: open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS
> <devicetree@vger.kernel.org>; linux-arm Mailing List <linux-arm-
> kernel@lists.infradead.org>; LKML <linux-kernel@vger.kernel.org>; =
linux-
> arm-msm <linux-arm-msm@vger.kernel.org>
> Subject: Re: [PATCH v9] arm64: dts: qcom: sc7180: Add WCN3990 WLAN
> module device node
>=20
> On Sun, May 17, 2020 at 3:47 AM Rakesh Pillai <pillair@codeaurora.org>
> wrote:
> >
> > Add device node for the ath10k SNOC platform driver probe
> > and add resources required for WCN3990 on sc7180 soc.
> >
> > Signed-off-by: Rakesh Pillai <pillair@codeaurora.org>
> > ---
> > Changes from v8:
> > - Removed the qcom,msa-fixed-perm
> > ---
> >  arch/arm64/boot/dts/qcom/sc7180-idp.dts |  7 +++++++
> >  arch/arm64/boot/dts/qcom/sc7180.dtsi    | 27
> +++++++++++++++++++++++++++
> >  2 files changed, 34 insertions(+)
> >
> > diff --git a/arch/arm64/boot/dts/qcom/sc7180-idp.dts
> b/arch/arm64/boot/dts/qcom/sc7180-idp.dts
> > index 4e9149d..38b102e 100644
> > --- a/arch/arm64/boot/dts/qcom/sc7180-idp.dts
> > +++ b/arch/arm64/boot/dts/qcom/sc7180-idp.dts
> > @@ -389,6 +389,13 @@
> >         };
> >  };
> >
> > +&wifi {
> > +       status =3D "okay";
> > +       wifi-firmware {
> > +               iommus =3D <&apps_smmu 0xc2 0x1>;
> > +       };
> > +};
> > +
> >  /* PINCTRL - additions to nodes defined in sc7180.dtsi */
> >
> >  &qspi_clk {
> > diff --git a/arch/arm64/boot/dts/qcom/sc7180.dtsi
> b/arch/arm64/boot/dts/qcom/sc7180.dtsi
> > index f1280e0..dd4e095 100644
> > --- a/arch/arm64/boot/dts/qcom/sc7180.dtsi
> > +++ b/arch/arm64/boot/dts/qcom/sc7180.dtsi
> > @@ -63,6 +63,11 @@
> >                         clock-frequency =3D <32764>;
> >                         #clock-cells =3D <0>;
> >                 };
> > +
> > +               wlan_fw_mem: memory@94100000 {
> > +                       reg =3D <0 0x94100000 0 0x200000>;
> > +                       no-map;
> > +               };
>=20
> This node is not in the right place. Up through v8, this lived inside
> reserved-memory. Here it seems to apply into the clocks {} node, which
> is not the right spot.

Thanks for spotting this. This was a rebase problem.
I will post the next patchset by fixing this.



>=20
>=20
> >         };
> >
> >         reserved_memory: reserved-memory {
> > @@ -944,6 +949,28 @@
> >                         };
> >                 };
> >
> > +               wifi: wifi@18800000 {
> > +                       compatible =3D "qcom,wcn3990-wifi";
> > +                       reg =3D <0 0x18800000 0 0x800000>;
> > +                       reg-names =3D "membase";
> > +                       iommus =3D <&apps_smmu 0xc0 0x1>;
> > +                       interrupts =3D
> > +                               <GIC_SPI 414 IRQ_TYPE_LEVEL_HIGH /* =
CE0 */ >,
> > +                               <GIC_SPI 415 IRQ_TYPE_LEVEL_HIGH /* =
CE1 */ >,
> > +                               <GIC_SPI 416 IRQ_TYPE_LEVEL_HIGH /* =
CE2 */ >,
> > +                               <GIC_SPI 417 IRQ_TYPE_LEVEL_HIGH /* =
CE3 */ >,
> > +                               <GIC_SPI 418 IRQ_TYPE_LEVEL_HIGH /* =
CE4 */ >,
> > +                               <GIC_SPI 419 IRQ_TYPE_LEVEL_HIGH /* =
CE5 */ >,
> > +                               <GIC_SPI 420 IRQ_TYPE_LEVEL_HIGH /* =
CE6 */ >,
> > +                               <GIC_SPI 421 IRQ_TYPE_LEVEL_HIGH /* =
CE7 */ >,
> > +                               <GIC_SPI 422 IRQ_TYPE_LEVEL_HIGH /* =
CE8 */ >,
> > +                               <GIC_SPI 423 IRQ_TYPE_LEVEL_HIGH /* =
CE9 */ >,
> > +                               <GIC_SPI 424 IRQ_TYPE_LEVEL_HIGH /* =
CE10 */>,
> > +                               <GIC_SPI 425 IRQ_TYPE_LEVEL_HIGH /* =
CE11 */>;
> > +                       memory-region =3D <&wlan_fw_mem>;
>=20
> Should any of the *-supply regulators be specified? Or are they all
> board specific? Or just not needed? The example has these:
> vdd-0.8-cx-mx-supply =3D <&pm8998_l5>;
> vdd-1.8-xo-supply =3D <&vreg_l7a_1p8>;
> vdd-1.3-rfa-supply =3D <&vreg_l17a_1p3>;
> vdd-3.3-ch0-supply =3D <&vreg_l25a_3p3>;

These votes are optional and were required for older targets.
We do not need these proxy votes in host now.


>=20
>=20
>=20
> > +                       status =3D "disabled";
> > +               };
> > +
> >                 config_noc: interconnect@1500000 {
> >                         compatible =3D "qcom,sc7180-config-noc";
> >                         reg =3D <0 0x01500000 0 0x28000>;
> > --
> > 2.7.4
