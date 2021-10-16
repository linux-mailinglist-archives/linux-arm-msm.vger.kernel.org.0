Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C7C9243034B
	for <lists+linux-arm-msm@lfdr.de>; Sat, 16 Oct 2021 17:27:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233757AbhJPP3a (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 16 Oct 2021 11:29:30 -0400
Received: from mail-4319.protonmail.ch ([185.70.43.19]:39451 "EHLO
        mail-4319.protonmail.ch" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233673AbhJPP3a (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 16 Oct 2021 11:29:30 -0400
Date:   Sat, 16 Oct 2021 15:27:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
        s=protonmail; t=1634398040;
        bh=DYc9clhyibib5RDaqDGVg0SzvaEgBlI6AAPkEKA90D0=;
        h=Date:To:From:Cc:Reply-To:Subject:In-Reply-To:References:From;
        b=hl0/YorjN04SG3vuM79TDLXgHN/2mCjjcOF1TLYa8kLab7l8MlDQ7yyDhgEnAREn0
         3Ggupv17TA//ECHhRYyjdIuujXtdZE2q30m4Gq4nH4xPfQiZpJO9KBfjVN70LW2pRe
         OEGWWTMZOu2TJbrboryUOnrizWOgQM137QLlv/fY=
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
From:   Yassine Oudjana <y.oudjana@protonmail.com>
Cc:     Konrad Dybcio <konrad.dybcio@somainline.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Ilia Lin <ilia.lin@kernel.org>,
        Viresh Kumar <vireshk@kernel.org>, Nishanth Menon <nm@ti.com>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Loic Poulain <loic.poulain@linaro.org>,
        AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@somainline.org>,
        DRM DRIVER FOR MSM ADRENO GPU 
        <linux-arm-msm@vger.kernel.org>
Reply-To: Yassine Oudjana <y.oudjana@protonmail.com>
Subject: Re: [PATCH 7/8] arm64: dts: qcom: msm8996: Add MSM8996 Pro support
Message-ID: <LIT21R.TYWT14SG9N1E2@protonmail.com>
In-Reply-To: <CAA8EJppVVzOmfwqMb==-xcoHGmQrZqD6+2T_+TFtD8tjUC_zNQ@mail.gmail.com>
References: <20211014083016.137441-1-y.oudjana@protonmail.com> <20211014083016.137441-8-y.oudjana@protonmail.com> <a8114098-f700-974b-e17e-54f5baebec46@somainline.org> <ZVR21R.X63CT137R99A3@protonmail.com> <CAA8EJppVVzOmfwqMb==-xcoHGmQrZqD6+2T_+TFtD8tjUC_zNQ@mail.gmail.com>
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


On Sat, Oct 16 2021 at 19:09:43 +0400, Dmitry Baryshkov=20
<dmitry.baryshkov@linaro.org> wrote:
> On Sat, 16 Oct 2021 at 17:51, Yassine Oudjana=20
> <y.oudjana@protonmail.com> wrote:
>>=20
>>=20
>>  On Fri, Oct 15 2021 at 23:01:54 +0400, Konrad Dybcio
>>  <konrad.dybcio@somainline.org> wrote:
>>  >
>>  > On 14.10.2021 10:32, Yassine Oudjana wrote:
>>  >>  Add a new DTSI for MSM8996 Pro (MSM8996SG) with msm-id and=20
>> CPU/GPU
>>  >> OPPs.
>>  >>  CBF OPPs and CPR parameters will be added to it as well once
>>  >> support for
>>  >>  CBF scaling and CPR is introduced.
>>  >>
>>  >>  Signed-off-by: Yassine Oudjana <y.oudjana@protonmail.com>
>>  >>  ---
>>  >>   arch/arm64/boot/dts/qcom/msm8996.dtsi    |  82 +++----
>>  >>   arch/arm64/boot/dts/qcom/msm8996pro.dtsi | 281
>>  >> +++++++++++++++++++++++
>>  >>   2 files changed, 322 insertions(+), 41 deletions(-)
>>  >>   create mode 100644 arch/arm64/boot/dts/qcom/msm8996pro.dtsi
>>  >>
>>  >>  diff --git a/arch/arm64/boot/dts/qcom/msm8996.dtsi
>>  >> b/arch/arm64/boot/dts/qcom/msm8996.dtsi
>>  >>  index 94a846c3f1ee..5b2600a4fb2a 100644
>>  >>  --- a/arch/arm64/boot/dts/qcom/msm8996.dtsi
>>  >>  +++ b/arch/arm64/boot/dts/qcom/msm8996.dtsi
>>  >>  @@ -142,82 +142,82 @@ cluster0_opp: opp_table0 {
>>  >>              /* Nominal fmax for now */
>>  >>              opp-307200000 {
>>  >>                      opp-hz =3D /bits/ 64 <307200000>;
>>  >>  -                   opp-supported-hw =3D <0x77>;
>>  >>  +                   opp-supported-hw =3D <0x7>;
>>  >
>>  > You didn't describe what's the reason for changing this=20
>> everywhere.
>>  >
>>  > If it's been always broken, perhaps make it a separate commit
>>  > describing
>>  >
>>  > the issue.
>>  >
>>  >
>>  > Konrad
>>  >
>>=20
>>  Before removing reading msm-id in qcom_cpufreq_nvmem, bits 0-2=20
>> (0x07)
>>  were MSM8996 speed bins, while bits 4-6 (0x70) were MSM8996 Pro=20
>> speed
>>  bins. Now, only bits 0-2 are used for either one, so basically I=20
>> moved
>>  bits 4-6 into msm8996pro.dtsi after shifting them right to become=20
>> bits
>>  0-2.
>>=20
>>  I'll put this in a separate patch and describe the change.
>=20
> Could you please describe in the commit message why is it changed?
> IOW, what prompted you to split 8996SG support from main msm8996.dtsi?
>=20

I will add that as well. For now it is described in the cover of this=20
series[1].

=09Yassine

> --
> With best wishes
> Dmitry
>=20

[1]=20
https://lore.kernel.org/linux-arm-msm/20211014083016.137441-1-y.oudjana@pro=
tonmail.com/T/#m01711ca6f962760cc9283965c5a82f8455fbe06c



