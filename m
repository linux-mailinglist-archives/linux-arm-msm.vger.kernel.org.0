Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3504114C609
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 Jan 2020 06:46:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725993AbgA2Fqm (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 29 Jan 2020 00:46:42 -0500
Received: from mail26.static.mailgun.info ([104.130.122.26]:48837 "EHLO
        mail26.static.mailgun.info" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1725816AbgA2Fqm (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 29 Jan 2020 00:46:42 -0500
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1580276801; h=Content-Transfer-Encoding: Content-Type:
 MIME-Version: Message-ID: Date: Subject: In-Reply-To: References: Cc:
 To: From: Sender; bh=Uia7eHgmOQeOEXkeVdlnBpq8/eBlSOChehhm3LLPNcE=; b=fDMDy6S7fx+y30zheYqszf6o3M5+Eau5NtEx7ZNzB+lg/zw6K3ThZTBrQhlNe1rTcBIy+H3u
 DFFvNJAlBUVyULQLf73+J3ZI4YUd8nd7iV72Niw00wkelQaC9nyqvK6a41qrwaNiLDFwuXuW
 COkK/iKNwnCafTlfhXQ+dUa7awM=
X-Mailgun-Sending-Ip: 104.130.122.26
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171])
 by mxa.mailgun.org with ESMTP id 5e311c40.7fec0ed46148-smtp-out-n01;
 Wed, 29 Jan 2020 05:46:40 -0000 (UTC)
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 27812C4479C; Wed, 29 Jan 2020 05:46:39 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: *
X-Spam-Status: No, score=1.5 required=2.0 tests=ALL_TRUSTED,SPF_NONE,
        URIBL_DBL_ABUSE_MALW autolearn=no autolearn_force=no version=3.4.0
Received: from Pillair (blr-c-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.19.19])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: pillair)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id A407AC43383;
        Wed, 29 Jan 2020 05:46:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org A407AC43383
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=none smtp.mailfrom=pillair@codeaurora.org
From:   <pillair@codeaurora.org>
To:     "'Matthias Kaehlcke'" <mka@chromium.org>
Cc:     <devicetree@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>
References: <1580207617-818-1-git-send-email-pillair@codeaurora.org> <20200128192027.GB46072@google.com>
In-Reply-To: <20200128192027.GB46072@google.com>
Subject: RE: [PATCH v4] arm64: dts: qcom: sc7180: Add WCN3990 WLAN module device node
Date:   Wed, 29 Jan 2020 11:16:32 +0530
Message-ID: <000601d5d667$78f056d0$6ad10470$@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain;
        charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Mailer: Microsoft Outlook 16.0
Thread-Index: AQJpUoH9UNBKfyz7+S0TRz+kcMMVewHZ23B3pstalZA=
Content-Language: en-us
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Matthias,

Please find my replies inline.


> -----Original Message-----
> From: Matthias Kaehlcke <mka@chromium.org>
> Sent: Wednesday, January 29, 2020 12:50 AM
> To: Rakesh Pillai <pillair@codeaurora.org>
> Cc: devicetree@vger.kernel.org; linux-arm-kernel@lists.infradead.org; =
linux-
> kernel@vger.kernel.org; linux-arm-msm@vger.kernel.org
> Subject: Re: [PATCH v4] arm64: dts: qcom: sc7180: Add WCN3990 WLAN
> module device node
>=20
> Hi Rakesh,
>=20
> On Tue, Jan 28, 2020 at 04:03:37PM +0530, Rakesh Pillai wrote:
> > Add device node for the ath10k SNOC platform driver probe
> > and add resources required for WCN3990 on sc7180 soc.
> >
> > Signed-off-by: Rakesh Pillai <pillair@codeaurora.org>
> > ---
> >  arch/arm64/boot/dts/qcom/sc7180-idp.dts |  5 +++++
> >  arch/arm64/boot/dts/qcom/sc7180.dtsi    | 28
> ++++++++++++++++++++++++++++
> >  2 files changed, 33 insertions(+)
> >
> > diff --git a/arch/arm64/boot/dts/qcom/sc7180-idp.dts
> b/arch/arm64/boot/dts/qcom/sc7180-idp.dts
> > index 189254f..151b489 100644
> > --- a/arch/arm64/boot/dts/qcom/sc7180-idp.dts
> > +++ b/arch/arm64/boot/dts/qcom/sc7180-idp.dts
> > @@ -248,6 +248,11 @@
> >  	status =3D "okay";
> >  };
> >
> > +&wifi {
> > +	status =3D "okay";
> > +	qcom,msa-fixed-perm;
> > +};
> > +
> >  /* PINCTRL - additions to nodes defined in sc7180.dtsi */
> >
> >  &qup_i2c2_default {
> > diff --git a/arch/arm64/boot/dts/qcom/sc7180.dtsi
> b/arch/arm64/boot/dts/qcom/sc7180.dtsi
> > index 666e9b9..7efb97f 100644
> > --- a/arch/arm64/boot/dts/qcom/sc7180.dtsi
> > +++ b/arch/arm64/boot/dts/qcom/sc7180.dtsi
> > @@ -42,6 +42,12 @@
> >  			compatible =3D "qcom,cmd-db";
> >  			no-map;
> >  		};
> > +
> > +		wlan_fw_mem: memory@93900000 {
> > +			compatible =3D "removed-dma-pool";
> > +			no-map;
> > +			reg =3D <0 0x93900000 0 0x200000>;
> > +		};
> >  	};
>=20
> This part doesn't apply cleanly on qcom/for-next, looks like you have =
to
> rebase.

[Rakesh]: let me rebase it and send out the next version.

>=20
> >  	cpus {
> > @@ -1119,6 +1125,28 @@
> >  				#clock-cells =3D <1>;
> >  			};
> >  		};
> > +
> > +		wifi: wifi@18800000 {
>=20
> You added this node at the end of the file, outside of the 'soc' node.
> It should be inside the 'soc' node, the sub-nodes are ordered by =
address,
> so (currently) this node should be inserted after 'cpufreq@18323000'.

[Rakesh] Will update this in the next patchset. (Possibly this was =
caused due to rebase conflicts)


>=20
> > +			compatible =3D "qcom,wcn3990-wifi";
> > +			reg =3D <0 0x18800000 0 0x800000>;
> > +			reg-names =3D "membase";
> > +			iommus =3D <&apps_smmu 0xC0 0x1>;
>=20
> nit: the convention is to use lowercase characters for hex adresses.

[Rakesh]: Will change it.

>=20
> > +			interrupts =3D
> > +				<GIC_SPI 414 IRQ_TYPE_LEVEL_HIGH /* CE0
> */ >,
> > +				<GIC_SPI 415 IRQ_TYPE_LEVEL_HIGH /* CE1
> */ >,
> > +				<GIC_SPI 416 IRQ_TYPE_LEVEL_HIGH /* CE2
> */ >,
> > +				<GIC_SPI 417 IRQ_TYPE_LEVEL_HIGH /* CE3
> */ >,
> > +				<GIC_SPI 418 IRQ_TYPE_LEVEL_HIGH /* CE4
> */ >,
> > +				<GIC_SPI 419 IRQ_TYPE_LEVEL_HIGH /* CE5
> */ >,
> > +				<GIC_SPI 420 IRQ_TYPE_LEVEL_HIGH /* CE6
> */ >,
> > +				<GIC_SPI 421 IRQ_TYPE_LEVEL_HIGH /* CE7
> */ >,
> > +				<GIC_SPI 422 IRQ_TYPE_LEVEL_HIGH /* CE8
> */ >,
> > +				<GIC_SPI 423 IRQ_TYPE_LEVEL_HIGH /* CE9
> */ >,
> > +				<GIC_SPI 424 IRQ_TYPE_LEVEL_HIGH /* CE10
> */>,
> > +				<GIC_SPI 425 IRQ_TYPE_LEVEL_HIGH /* CE11
> */>;
>=20
> not sure these 'CEx' comments after each interrupt add much value. =
What
> does
> 'CE' stand for in the first place?

[Rakesh]:   CE stands for Copy engine. These are the copy engine =
interrupts, hence the comments.

>=20
> Thanks
>=20
> Matthias
