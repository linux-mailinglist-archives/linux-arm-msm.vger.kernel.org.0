Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B7C4C72F468
	for <lists+linux-arm-msm@lfdr.de>; Wed, 14 Jun 2023 08:05:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243011AbjFNGFd (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 14 Jun 2023 02:05:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33494 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234554AbjFNGFc (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 14 Jun 2023 02:05:32 -0400
Received: from mail-yb1-xb34.google.com (mail-yb1-xb34.google.com [IPv6:2607:f8b0:4864:20::b34])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CFA971AA
        for <linux-arm-msm@vger.kernel.org>; Tue, 13 Jun 2023 23:05:30 -0700 (PDT)
Received: by mail-yb1-xb34.google.com with SMTP id 3f1490d57ef6-bc492cb6475so320385276.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 13 Jun 2023 23:05:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1686722730; x=1689314730;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=biVBa4JIgE5FcyEB7bKg/M4CKmzTCYn6UFynk3gp3zI=;
        b=qUrBHAaVhzLYJ20LYI5W59/UC8DHPTj5IOyoswBfkXdzppEko0ZTASy08tinI3llnx
         10PvkbQ9n/DhvwqIf4t+NjEP++UFiODZ6NGv2LpMfPsBUpNfNlpMeU50l4dehPEyQowO
         tOo/jbujpthe+YIkjL6Mlg1Zzv+LCcKEgQMt1r9mBeuXh6Z6ppnKG4NMkWr1sFi2koZx
         14Epc+q2/RmzOf3hkSBG4CKOrIb/N4UQLsDjdApSZKpNqRutqsZnajdGh8y7+CWoI3Bu
         YnyeoDsB20aMOCcURiVHDDmBTsE9du0HDb7hwkLur/ChgkloRgIKvJr1S4QWDU91A7rH
         Cqkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686722730; x=1689314730;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=biVBa4JIgE5FcyEB7bKg/M4CKmzTCYn6UFynk3gp3zI=;
        b=f1QpkpSZiJ4rir1C280TQOeAIwfdCFV6C8gnNLmQr/em0dNh8537XTpimhC5pmBK4Z
         GLRoghk/yCb11XBTkpX+pIx31obR7bfhP9hb68o3hog4xyAhS5gCpUPa/8ARe7B6rimR
         OUAFOmgAztlHdS70SpU/OlzhMc2aGFWOSauDK9bX/7pKO80KSQRLVRmxav5sPEbFDKAC
         ihO0xiyf9wTZVtf5S5mEN1NmXXgEAbX/2YPqwfw4vHcWQX+GZIMkerY6IrJM3s7SAVKU
         D1hpN1j2qE5dbtPu9zXECrKc1Kd4JWb/i0hJIDH17OQaYliGPrXWrwHc/vIhfAepgUu8
         8iLw==
X-Gm-Message-State: AC+VfDyxc2Vn6nKOVvyrizuuMj2wYIckRxYNGdySwPpATKWmzl5QIFbS
        k189KVzyy8Jtt7/VxOy4ivHknCP7Wu3TRzbUVTfoei3N1pU+Kh521JE=
X-Google-Smtp-Source: ACHHUZ6PdtHPpE8GAEwkxfCWV52YZzhpN0VZf8mm5pPuOZJ0cLCv9hLJBduTOgnwNzhtTpJZAVvXBsw6ioeh0uRMBvg=
X-Received: by 2002:a25:addc:0:b0:bad:1159:1aea with SMTP id
 d28-20020a25addc000000b00bad11591aeamr1102409ybe.8.1686722729966; Tue, 13 Jun
 2023 23:05:29 -0700 (PDT)
MIME-Version: 1.0
References: <20230507175335.2321503-1-dmitry.baryshkov@linaro.org>
 <20230507175335.2321503-2-dmitry.baryshkov@linaro.org> <20230509055044.GA4823@thinkpad>
 <CAA8EJpoJr6gK=7fmwmF4+Xi5Ch_-+8L1q1WHkfVOOg+6qj=P3w@mail.gmail.com>
 <20230511081504.GA12021@thinkpad> <d4e8f17b-78a2-b6c6-36e2-ccc526430df1@linaro.org>
In-Reply-To: <d4e8f17b-78a2-b6c6-36e2-ccc526430df1@linaro.org>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date:   Wed, 14 Jun 2023 09:05:18 +0300
Message-ID: <CAA8EJpp6ekkMWyzri9uSXD4L=w7UcFnRp-3CpJ3h535++uWqwg@mail.gmail.com>
Subject: Re: [PATCH 2/2] clk: qcom: mmcc-msm8974: fix MDSS_GDSC power flags
To:     Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Taniya Das <quic_tdas@quicinc.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue, 30 May 2023 at 02:47, Dmitry Baryshkov
<dmitry.baryshkov@linaro.org> wrote:
>
> On 11/05/2023 11:15, Manivannan Sadhasivam wrote:
> > On Tue, May 09, 2023 at 02:20:07PM +0300, Dmitry Baryshkov wrote:
> >> On Tue, 9 May 2023 at 08:50, Manivannan Sadhasivam
> >> <manivannan.sadhasivam@linaro.org> wrote:
> >>>
> >>> On Sun, May 07, 2023 at 08:53:35PM +0300, Dmitry Baryshkov wrote:
> >>>> Using PWRSTS_RET on msm8974's MDSS_GDSC causes display to stop worki=
ng.
> >>>> The gdsc doesn't fully come out of retention mode. Change it's pwrst=
s
> >>>> flags to PWRSTS_OFF_ON.
> >>>>
> >>>
> >>> What does "stop working" implies? Does it work during boot and random=
ly stopped
> >>> working or it stopped working after resume from suspend?
> >>
> >> It stops working during the boot. I observed the MDP not starting up
> >> properly. Mea culpa, I did not look deep enough into the details, just
> >> stomped upon this change which fixes the problem for me.
> >>
> >
> > IIUC, GDSC will be transitioned to retention mode only if the parent do=
main goes
> > to low power mode. So if the MDSS GDSC goes to retention mode during bo=
ot, then
> > it suggests that the parent domain is not voted properly. Unless I misu=
nderstood
> > something...
>
> Not sure, what is the parent domain here. Note, it is a pretty old
> implementation.

Colleagues, any further feedback on this? I'd like to note that all
other platforms use PWRSTS_OFF_ON for the MDSS_GDSC,
I do not think that msm8974 is particularly different here.

>
> >
> > Or is the GDSC behavior changes between RPM and RPMh?
> >
> > - Mani
> >
> >>>
> >>> Even though reverting to non-retention mode works, I think the issue =
might be
> >>> somewhere else. Like the vote might be missing to get the GDSC out of=
 retention
> >>> mode.
> >>
> >> I don't think there is a vote missing. The driver votes on MDSS_GDSC
> >> before enabling access to any of the registers from the MDSS region.
> >>
> >>>
> >>> - Mani
> >>>
> >>>> Fixes: d399723950c4 ("clk: qcom: gdsc: Fix the handling of PWRSTS_RE=
T support")
> >>>> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> >>>> ---
> >>>>   drivers/clk/qcom/mmcc-msm8974.c | 2 +-
> >>>>   1 file changed, 1 insertion(+), 1 deletion(-)
> >>>>
> >>>> diff --git a/drivers/clk/qcom/mmcc-msm8974.c b/drivers/clk/qcom/mmcc=
-msm8974.c
> >>>> index aa29c79fcd55..277ef0065aae 100644
> >>>> --- a/drivers/clk/qcom/mmcc-msm8974.c
> >>>> +++ b/drivers/clk/qcom/mmcc-msm8974.c
> >>>> @@ -2401,7 +2401,7 @@ static struct gdsc mdss_gdsc =3D {
> >>>>        .pd =3D {
> >>>>                .name =3D "mdss",
> >>>>        },
> >>>> -     .pwrsts =3D PWRSTS_RET_ON,
> >>>> +     .pwrsts =3D PWRSTS_OFF_ON,
> >>>>   };
> >>>>
> >>>>   static struct gdsc camss_jpeg_gdsc =3D {
> >>>> --
> >>>> 2.39.2
> >>>>
> >>>
> >>> --
> >>> =E0=AE=AE=E0=AE=A3=E0=AE=BF=E0=AE=B5=E0=AE=A3=E0=AF=8D=E0=AE=A3=E0=AE=
=A9=E0=AF=8D =E0=AE=9A=E0=AE=A4=E0=AE=BE=E0=AE=9A=E0=AE=BF=E0=AE=B5=E0=AE=
=AE=E0=AF=8D
> >>
> >>
> >>
> >> --
> >> With best wishes
> >> Dmitry
> >
>
> --
> With best wishes
> Dmitry
>


--=20
With best wishes
Dmitry
