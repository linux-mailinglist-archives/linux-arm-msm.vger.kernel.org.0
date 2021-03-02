Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6DCE932B2E8
	for <lists+linux-arm-msm@lfdr.de>; Wed,  3 Mar 2021 04:49:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242490AbhCCBQP (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 2 Mar 2021 20:16:15 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36228 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1351397AbhCBOWg (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 2 Mar 2021 09:22:36 -0500
Received: from mail-qk1-x730.google.com (mail-qk1-x730.google.com [IPv6:2607:f8b0:4864:20::730])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E4AACC06178C
        for <linux-arm-msm@vger.kernel.org>; Tue,  2 Mar 2021 06:21:44 -0800 (PST)
Received: by mail-qk1-x730.google.com with SMTP id a9so5728348qkn.13
        for <linux-arm-msm@vger.kernel.org>; Tue, 02 Mar 2021 06:21:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=kee+UA5TXDxvMB3TFGxW28m2UMdaJ7A/2xkNq7z3cSI=;
        b=e39Nchv77l+ynKsrYV05zsC5z6zsQblBBCkMmlCS0Nk+KaVDCB7xnU776iswNZ+lJA
         KYt7RKxTtg9tW6RB8dcmff+/5t2frXj84KX4KVfcYsHAvRnn67wHMXFL2Aehc1ZUR37B
         zho9/jeXrsuXN3M2c70W+Rz743MlIx81J6TuVip6IyC6KNC/GAeToDGubkFzNtJBJoBE
         gDzfPEQBw/uOjc+RbxIJsb3OKomRA9ox20taLtf/blzILY0c8JLoMvSjuvt004rIF08p
         MSycZQbp52LGriNe7wP3/hWWtcnrwP7QnltVP3CXMvxzcFBBAdJA2xrd5FrkMULrckDA
         s7wA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=kee+UA5TXDxvMB3TFGxW28m2UMdaJ7A/2xkNq7z3cSI=;
        b=Gl9vpIrbmIHBAUwqvEJ56ZHN1RQWJIT3ab7ZeF7lNKX1DFKRGoP5d/IfThQ8gvfAEB
         ON9H4lf0uvLi2k82gLkj/8Km1dnduyL5ym5ek5QNC9ittKLNxsUcfdWLIElJGuGSsf2P
         gcrEAEg4heDJxHqJzaGmoE7IdbwI57MvVHWoMv5AFEbEhYE4541Wc0iDFIocnDNTX94P
         UDvRmhZxFh8mQXY2Tin3v66w1pOM//fJBlWzQKS3+42GXK0DPbjFP6nPQUiHtIwctxk5
         dAD2wFP/A37gbwYabCOUj51Te87oedv7lo1fzls8KVrFN2MigjHxK6qNu/ue4B2YNeUN
         vxlA==
X-Gm-Message-State: AOAM533tsdNTKogUv48fENG99EqqiCJbqlEEpqObrRITJ7RIjzVmj1z6
        7JbvEDPWg0ox6QkSDx5H9WDBrDOwapy1R2usOMasNQ==
X-Google-Smtp-Source: ABdhPJxkenj6uB7tiL4OOSTfKwQtKOoFyq46EiVACTC79AgprGTPmFGiJwwVefp5vv8K8ecG7PXOoBsuXuElxXANK/U=
X-Received: by 2002:a37:a016:: with SMTP id j22mr7975243qke.486.1614694903823;
 Tue, 02 Mar 2021 06:21:43 -0800 (PST)
MIME-Version: 1.0
References: <1614155592-14060-1-git-send-email-skakit@codeaurora.org>
 <1614155592-14060-4-git-send-email-skakit@codeaurora.org> <50151f4b-298c-f0ee-a88f-7bdd945ad249@linaro.org>
 <51390b828a5d534e308460098f1b9af0@codeaurora.org> <CAA8EJpqN-jb3b3yHTHwrQQj_h3M-yxAvX7Hz7bNSV3_NBCJEwQ@mail.gmail.com>
 <da15c05877c345f2aeb51649c075a95c@codeaurora.org>
In-Reply-To: <da15c05877c345f2aeb51649c075a95c@codeaurora.org>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date:   Tue, 2 Mar 2021 17:21:32 +0300
Message-ID: <CAA8EJprc24gTfLaffsrKeJ9MOv2m8B1L168VV4uNm=xsjnF5ZQ@mail.gmail.com>
Subject: Re: [PATCH 3/7] regulator: qcom-rpmh: Correct the pmic5_hfsmps515 buck
To:     satya priya <skakit@codeaurora.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Rajendra Nayak <rnayak@codeaurora.org>,
        "open list:DRM DRIVER FOR MSM ADRENO GPU" 
        <linux-arm-msm@vger.kernel.org>,
        open list <linux-kernel@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>, kgunda@codeaurora.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hello,

On Mon, 1 Mar 2021 at 13:37, <skakit@codeaurora.org> wrote:
>
> On 2021-02-26 15:57, Dmitry Baryshkov wrote:
> > On Fri, 26 Feb 2021 at 09:59, <skakit@codeaurora.org> wrote:
> >>
> >> Hi,
> >>
> >> On 2021-02-25 16:39, Dmitry Baryshkov wrote:
> >> > On 24/02/2021 11:33, satya priya wrote:
> >> >> Correct the REGULATOR_LINEAR_RANGE and n_voltges for
> >> >> pmic5_hfsmps515 buck.
> >> >>
> >> >> Signed-off-by: satya priya <skakit@codeaurora.org>
> >> >> ---
> >> >>   drivers/regulator/qcom-rpmh-regulator.c | 4 ++--
> >> >>   1 file changed, 2 insertions(+), 2 deletions(-)
> >> >>
> >> >> diff --git a/drivers/regulator/qcom-rpmh-regulator.c
> >> >> b/drivers/regulator/qcom-rpmh-regulator.c
> >> >> index 79a554f..36542c3 100644
> >> >> --- a/drivers/regulator/qcom-rpmh-regulator.c
> >> >> +++ b/drivers/regulator/qcom-rpmh-regulator.c
> >> >> @@ -726,8 +726,8 @@ static const struct rpmh_vreg_hw_data
> >> >> pmic5_ftsmps510 =3D {
> >> >>   static const struct rpmh_vreg_hw_data pmic5_hfsmps515 =3D {
> >> >>      .regulator_type =3D VRM,
> >> >>      .ops =3D &rpmh_regulator_vrm_ops,
> >> >> -    .voltage_range =3D REGULATOR_LINEAR_RANGE(2800000, 0, 4, 16000=
),
> >> >> -    .n_voltages =3D 5,
> >> >> +    .voltage_range =3D REGULATOR_LINEAR_RANGE(320000, 0, 235, 1600=
0),
> >> >> +    .n_voltages =3D 236,
> >> >
> >> > I've checked the docs for pm8009, the chip which also uses hfsmps515
> >> > regulators. The pdf clearly states that the 'Output voltage operatin=
g
> >> > range' is from 2.8 V to 2.85 V.
> >> >
> >> > So we'd probably need to define different versions of HFS515 regulat=
or
> >> > data (like I had to create for pm8009-1).
> >> >
> >> >
> >>
> >> The min-max voltages for S1C (PM8350c) regulator are 2190000-2210000uV
> >> for sc7280(kodiak), so we had to modify this buck to support this
> >> regulator.
> >>
> >> AFAIK, this struct defines the HW constraints of a regulator, but the
> >> platform specific min-max values can be controlled from DT files. So,
> >> can't we modify it like above instead of adding a new definition? the
> >> new min_uV value (32000) is anyway not exceeding the old value
> >> (2800000)
> >> right? please correct me if wrong.
> >
> > As far as I understand for other regulators we put 'output voltage
> > limitations' from the docs into the regulator definition and further
> > constrain it by the platform device tree. Please correct me if I'm
> > wrong.
>
> I see that for most of the regulators, these specifications are specific
> to regulator buck (like HFS515) but not chipset specific, we set the
> chipset specific(like pm8009/pm8350c) requirements from DT files.
>
> For example:
> pmic5_nldo regulator spec mentions LLIMIT=3D 0.32V and ULIMIT =3D1.304V w=
ith
> step 8mV
>
> .voltage_range =3D REGULATOR_LINEAR_RANGE(320000, 0, 123, 8000),
> max output voltage supported by this regulator is 123*8000 + 320000 =3D
> 1304000mV which is same as mentioned in the regulator spec.
>
> > For pm8009 the data from the datasheet matches the regulators defined
> > in the source file. Unfortunately I don't have kodiak specs at hand.
>
>  From the HFS515 spec I got below info
> "HFS510 and lower max output voltage is limited to 2.04V max, and
> Yoda(pm8009) requirement was 2.4V for IOT PA and 2.85V for camera
> application.  Hence, HFS515 added a new register and corresponding HW
> changes to support the higher voltage.  Table 5=E2=80=9124 shows the new
> FB_RANGE bit.  When configured to 0 the buck works as earlier where Vout
> max =3D 2.04V in 8mV steps, but when configured to 1 the buck range
> doubles and can now support a Vout max =3D 4.08V in 16mV steps."
>
> As per above, the max output voltage supported by HFS515 buck is 4.08V
> (which is kodiak pm8350c pmic's requirement).
> So, we have modified the buck data to support pm8350c(palani) along with
> pm8009(yoda).

I'd still prefer to have two different regulator types (as we did for
pm8009 P=3D0 and P=3D1 variants). However it's probably up to the
maintainers to decide.


--=20
With best wishes
Dmitry
