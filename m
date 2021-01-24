Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8A558301DF9
	for <lists+linux-arm-msm@lfdr.de>; Sun, 24 Jan 2021 18:40:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725768AbhAXRkZ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 24 Jan 2021 12:40:25 -0500
Received: from mail.z3ntu.xyz ([128.199.32.197]:51414 "EHLO mail.z3ntu.xyz"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725842AbhAXRkX (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 24 Jan 2021 12:40:23 -0500
X-Greylist: delayed 474 seconds by postgrey-1.27 at vger.kernel.org; Sun, 24 Jan 2021 12:40:21 EST
Received: by mail.z3ntu.xyz (Postfix, from userid 182)
        id EAB30C5AAF; Sun, 24 Jan 2021 17:31:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=z3ntu.xyz; s=z3ntu;
        t=1611509498; bh=geOoglpDjIHmaj5SOU2auJVopCpCCq0/MBKAXre5Feg=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References;
        b=Bwn2m9PbUuVkRkkSMiFqzOjXfTpa99gUrE4/kzj3QmHoocdKxmiZeJK8lbqoYWqUM
         ltHcB/J29t9ZKDGKtMuCaUK/89HnE6zGJUcRMYdlgf1Ew7UckfK22iLz0nFcWlyf3F
         teJ+4aMrrmS9f5uW4DwK5aBKbnsMkHuSSz7LimSo=
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on arch-vps
X-Spam-Level: 
X-Spam-Status: No, score=0.9 required=5.0 tests=ALL_TRUSTED,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FROM_SUSPICIOUS_NTLD,
        PDS_OTHER_BAD_TLD,URIBL_BLOCKED autolearn=no autolearn_force=no
        version=3.4.4
Received: from g550jk.localnet (80-110-106-213.cgn.dynamic.surfer.at [80.110.106.213])
        by mail.z3ntu.xyz (Postfix) with ESMTPSA id 02D11C5AA3;
        Sun, 24 Jan 2021 17:31:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=z3ntu.xyz; s=z3ntu;
        t=1611509495; bh=geOoglpDjIHmaj5SOU2auJVopCpCCq0/MBKAXre5Feg=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References;
        b=YgPkPqxHVHGbn+w5HuiLvEweOP+UvL5L80T/9qT2lGSxIzwhlH0OWvlOUMhq2qM4x
         F1UmgQCSyBIaE1kuu6XJ+Imv+ce0TDE4fyhzRwd9emzW/uLLB3yyFyrqEiOI4XmtgQ
         8Zqb6elJm9coadJ+0joyPWJemuP5wLjEMQMsthEM=
From:   Luca Weiss <luca@z3ntu.xyz>
To:     Iskren Chernev <iskren.chernev@gmail.com>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        ~postmarketos/upstreaming@lists.sr.ht
Cc:     Andy Gross <agross@kernel.org>, Rob Herring <robh+dt@kernel.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        ~postmarketos/upstreaming@lists.sr.ht,
        Samuel Pascua <pascua.samuel.14@gmail.com>,
        Alexey Minnekhanov <alexeymin@postmarketos.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>
Subject: Re: [PATCH 3/4] ARM: dts: qcom: msm8974-klte: add support for display
Date:   Sun, 24 Jan 2021 18:31:34 +0100
Message-ID: <6632821.dtBD41K2ms@g550jk>
In-Reply-To: <282b07a1-2e39-2dbe-dd7b-eed2ae9e25fb@somainline.org>
References: <20210124135610.1779295-1-iskren.chernev@gmail.com> <20210124135610.1779295-3-iskren.chernev@gmail.com> <282b07a1-2e39-2dbe-dd7b-eed2ae9e25fb@somainline.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Konrad,

On Sonntag, 24. J=E4nner 2021 16:04:13 CET Konrad Dybcio wrote:
> > +	mdss@fd900000 {
> > +		status =3D "ok";
> > +
> > +		mdp@fd900000 {
> > +			status =3D "ok";
> > +		};
> > +
> > +		dsi@fd922800 {
> > +			status =3D "ok";
> > +
> > +			vdda-supply =3D <&pma8084_l2>;
> > +			vdd-supply =3D <&pma8084_l22>;
> > +			vddio-supply =3D <&pma8084_l12>;
> > +
> > +			#address-cells =3D <1>;
> > +			#size-cells =3D <0>;
> > +
> > +			ports {
> > +				port@1 {
> > +					endpoint {
> > +						remote-
endpoint =3D <&panel_in>;
> > +						data-lanes=20
=3D <0 1 2 3>;
> > +					};
> > +				};
> > +			};
> > +
> > +			panel: panel@0 {
> > +				reg =3D <0>;
> > +				compatible =3D "samsung,s6e3fa2";
> > +
> > +				pinctrl-names =3D "default";
> > +				pinctrl-0 =3D <&panel_pin>;
> > +
> > +				port {
> > +					panel_in: endpoint {
> > +						remote-
endpoint =3D <&dsi0_out>;
> > +					};
> > +				};
> > +			};
> > +		};
> > +
> > +		dsi-phy@fd922a00 {
> > +			status =3D "ok";
> > +
> > +			vddio-supply =3D <&pma8084_l12>;
> > +		};
> > +	};
> >=20
> >  };
>=20
> Please use &label here. If there's none, add them in msm8974.dtsi.
>=20

All msm8974 dts(i) files use this style. Deviating from it for this doesn't=
=20
make sense. And yes msm8974 should probably be converted to the newer label=
=20
style (as was done with msm8916 a while ago).

>=20
> Konrad

Regards
Luca


