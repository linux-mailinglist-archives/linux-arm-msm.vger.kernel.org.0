Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8F96531043A
	for <lists+linux-arm-msm@lfdr.de>; Fri,  5 Feb 2021 05:54:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231194AbhBEExm (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 4 Feb 2021 23:53:42 -0500
Received: from mail-03.mail-europe.com ([91.134.188.129]:55896 "EHLO
        mail-03.mail-europe.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231181AbhBEExZ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 4 Feb 2021 23:53:25 -0500
Date:   Fri, 05 Feb 2021 04:51:54 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
        s=protonmail; t=1612500719;
        bh=T15argtmAt/CR8F8tv3EWr8uxycCuahn7wYhmd3o3pY=;
        h=Date:To:From:Cc:Reply-To:Subject:In-Reply-To:References:From;
        b=ry9aaxHQLOwZGzIkH3q32+tihDZ5O4xx1Bo5C5FstuU/xfG0sbd2dx5rOf9kPrkj2
         o69pQPUBjj3Fv0zubAaBJjZP8mn5VVcgoho/8lmP1jD/0TYQXfrwXpC7OMqhpOpEFC
         43a7qOfiz0AAF1RwjsE1r5ZHMyZDLyWPkjz0/z4M=
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
From:   Yassine Oudjana <y.oudjana@protonmail.com>
Cc:     "agross@kernel.org" <agross@kernel.org>,
        "linux-arm-msm@vger.kernel.org" <linux-arm-msm@vger.kernel.org>
Reply-To: Yassine Oudjana <y.oudjana@protonmail.com>
Subject: Re: [PATCH] arm64: dts: qcom: pm8994: Add resin node to PON
Message-ID: <qlZLjlncIG-fOtti8ZUSOF9ct71-oaDKMJQmDUYXvUoCJMkstc1Gjyuigwo6uK5Q4E2ZKCv70No663d-_qqD0HOnNYEKuWjOByYbG_g4jqE=@protonmail.com>
In-Reply-To: <YBnYi2eMl0xtMcfq@builder.lan>
References: <8WhEzfSgoSe_f8OT9eH_6hLGTqY9k_Cy9ZLr84OJsFctROAlbUEz552XibQxt684Um8E5NS1_0qxIn3tRVSs0ui1mVUKhBFmUjJ_dannvrQ=@protonmail.com> <YBnYi2eMl0xtMcfq@builder.lan>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-1.2 required=10.0 tests=ALL_TRUSTED,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM shortcircuit=no
        autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on
        mailout.protonmail.ch
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Wednesday, February 3, 2021 2:56 AM, Bjorn Andersson <bjorn.andersson@li=
naro.org> wrote:

> On Tue 29 Dec 06:47 CST 2020, Yassine Oudjana wrote:
>
> > From: Yassine Oudjana y.oudjana@protonmail.com
> > Date: Sun, 27 Dec 2020 21:23:40 +0400
> > Add resin as a child node of PON.
> >
> > Signed-off-by: Yassine Oudjana y.oudjana@protonmail.com
> >
> > --------------------------------------------------------
> >
> > arch/arm64/boot/dts/qcom/pm8994.dtsi | 8 ++++++++
> > 1 file changed, 8 insertions(+)
> > diff --git a/arch/arm64/boot/dts/qcom/pm8994.dtsi b/arch/arm64/boot/dts=
/qcom/pm8994.dtsi
> > index 5ffdf37d8e31..334774a38602 100644
> > --- a/arch/arm64/boot/dts/qcom/pm8994.dtsi
> > +++ b/arch/arm64/boot/dts/qcom/pm8994.dtsi
> > @@ -58,6 +58,14 @@ pwrkey {
> > linux,code =3D <KEY_POWER>;
> > };
> >
> > -       =09resin {
> >
> >
> > -       =09=09compatible =3D "qcom,pm8941-resin";
> >
> >
> > -       =09=09interrupts =3D <0x0 0x8 1 IRQ_TYPE_EDGE_BOTH>;
> >
> >
> > -       =09=09debounce =3D <15625>;
> >
> >
> > -       =09=09bias-pull-up;
> >
> >
> > -       =09=09linux,code =3D <KEY_VOLUMEDOWN>;
> >
> >
>
> Is resin always volume down?

I'm not sure, but I haven't found a device that uses it and sets it as anyt=
hing else.

> Also this node is already defined in apq8096-db820c.dtsi, so how about
> moving the common properties here, but leave it status =3D "disabled" and
> then in the device specific file make it status =3D okay?

Sounds good. So have everything other than linux,code defined there, then
add status =3D "disabled" and a label to it?

> Regards,
> Bjorn
>
> > -       =09};
> >
> >
> > -       };
> >
> >         pm8994_temp: temp-alarm@2400 {
> >
> >
> >
> > --
> > 2.29.2
