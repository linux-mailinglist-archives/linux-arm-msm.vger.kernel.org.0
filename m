Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B624A19269D
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Mar 2020 12:05:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727458AbgCYLFF (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 25 Mar 2020 07:05:05 -0400
Received: from mail27.static.mailgun.info ([104.130.122.27]:39945 "EHLO
        mail27.static.mailgun.info" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727129AbgCYLFF (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 25 Mar 2020 07:05:05 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1585134304; h=Content-Transfer-Encoding: Content-Type:
 MIME-Version: Message-ID: Date: Subject: In-Reply-To: References: Cc:
 To: From: Sender; bh=JepPCPGEarX1ss6ZbVvaIoXfTJutoTJE1MiruN2+lF8=; b=gkxn3/JvzBNYUl9VAT2ZR3vql5376nucZF5G6CvwG7ZUpwcN6LXwMKLqBzlJZKfu191nHqZ4
 ARtSt1P96TES5pfKFbXGgF1x6Cr47lM5zlvyOlSC40B0C1i9lTuEBLVPvxCuk64Pf6f2u/Uo
 olammCC4SvYEGvtqq1Oz7yH0kdg=
X-Mailgun-Sending-Ip: 104.130.122.27
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171])
 by mxa.mailgun.org with ESMTP id 5e7b3adf.7f09eaada1b8-smtp-out-n02;
 Wed, 25 Mar 2020 11:05:03 -0000 (UTC)
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 5D206C433BA; Wed, 25 Mar 2020 11:05:02 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE
        autolearn=unavailable autolearn_force=no version=3.4.0
Received: from Pillair (unknown [183.83.66.17])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: pillair)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 83978C433F2;
        Wed, 25 Mar 2020 11:04:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 83978C433F2
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=none smtp.mailfrom=pillair@codeaurora.org
From:   <pillair@codeaurora.org>
To:     "'Evan Green'" <evgreen@chromium.org>
Cc:     "'open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS'" 
        <devicetree@vger.kernel.org>,
        "'linux-arm Mailing List'" <linux-arm-kernel@lists.infradead.org>,
        "'LKML'" <linux-kernel@vger.kernel.org>,
        "'linux-arm-msm'" <linux-arm-msm@vger.kernel.org>
References: <1580822300-4491-1-git-send-email-pillair@codeaurora.org> <CAE=gft7EOALEMUWzoR3+pjoxCUTYWbiXoXY=dXH1BDhS3KwBzg@mail.gmail.com>
In-Reply-To: <CAE=gft7EOALEMUWzoR3+pjoxCUTYWbiXoXY=dXH1BDhS3KwBzg@mail.gmail.com>
Subject: RE: [PATCH v6] arm64: dts: qcom: sc7180: Add WCN3990 WLAN module device node
Date:   Wed, 25 Mar 2020 16:34:54 +0530
Message-ID: <000901d60295$3acc79b0$b0656d10$@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain;
        charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-Mailer: Microsoft Outlook 16.0
Thread-Index: AQIr1eNiqDxek+JigOIeIUW3T4FxSwDFrKGDp6dQ2yA=
Content-Language: en-us
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Evan,

I will send out a v7 for this patchset.
Since I have to configure the S2 SIDs, it is dependent on below ath10k =
patchset.
https://patchwork.kernel.org/project/linux-wireless/list/?series=3D261367=


Thanks,
Rakesh Pillai.

> -----Original Message-----
> From: Evan Green <evgreen@chromium.org>
> Sent: Tuesday, March 24, 2020 11:10 PM
> To: Rakesh Pillai <pillair@codeaurora.org>
> Cc: open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS
> <devicetree@vger.kernel.org>; linux-arm Mailing List <linux-arm-
> kernel@lists.infradead.org>; LKML <linux-kernel@vger.kernel.org>; =
linux-
> arm-msm <linux-arm-msm@vger.kernel.org>
> Subject: Re: [PATCH v6] arm64: dts: qcom: sc7180: Add WCN3990 WLAN
> module device node
>=20
> Hi Rakesh,
>=20
> On Tue, Feb 4, 2020 at 5:21 AM Rakesh Pillai <pillair@codeaurora.org> =
wrote:
> >
> > Add device node for the ath10k SNOC platform driver probe
> > and add resources required for WCN3990 on sc7180 soc.
> >
> > Signed-off-by: Rakesh Pillai <pillair@codeaurora.org>
>=20
> What is the status of this? Looks like you have some feedback from
> Sibi. Can you reply and spin this? Also a comment below:
>=20
> > ---
> >  arch/arm64/boot/dts/qcom/sc7180-idp.dts |  5 +++++
> >  arch/arm64/boot/dts/qcom/sc7180.dtsi    | 27
> +++++++++++++++++++++++++++
> >  2 files changed, 32 insertions(+)
> >
> > diff --git a/arch/arm64/boot/dts/qcom/sc7180-idp.dts
> b/arch/arm64/boot/dts/qcom/sc7180-idp.dts
> > index 388f50a..167f68ac 100644
> > --- a/arch/arm64/boot/dts/qcom/sc7180-idp.dts
> > +++ b/arch/arm64/boot/dts/qcom/sc7180-idp.dts
> > @@ -287,6 +287,11 @@
> >         vdda-pll-supply =3D <&vreg_l4a_0p8>;
> >  };
> >
> > +&wifi {
> > +       status =3D "okay";
> > +       qcom,msa-fixed-perm;
> > +};
> > +
> >  /* PINCTRL - additions to nodes defined in sc7180.dtsi */
> >
> >  &qspi_clk {
> > diff --git a/arch/arm64/boot/dts/qcom/sc7180.dtsi
> b/arch/arm64/boot/dts/qcom/sc7180.dtsi
> > index 8011c5f..e3e8610 100644
> > --- a/arch/arm64/boot/dts/qcom/sc7180.dtsi
> > +++ b/arch/arm64/boot/dts/qcom/sc7180.dtsi
> > @@ -75,6 +75,11 @@
> >                         reg =3D <0x0 0x80900000 0x0 0x200000>;
> >                         no-map;
> >                 };
> > +
> > +               wlan_fw_mem: memory@93900000 {
> > +                       reg =3D <0 0x93900000 0 0x200000>;
> > +                       no-map;
> > +               };
> >         };
> >
> >         cpus {
> > @@ -1490,6 +1495,28 @@
> >
> >                         #freq-domain-cells =3D <1>;
> >                 };
> > +
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
> The clocks are missing:
>=20
> clocks =3D <&rpmhcc RPMH_RF_CLK2>;
> clock-names =3D "cxo_ref_clk_pin";
>=20
> > +                       status =3D "disabled";
> > +               };
> >         };
> >
> >         thermal-zones {
> > --
> > 2.7.4
> >
