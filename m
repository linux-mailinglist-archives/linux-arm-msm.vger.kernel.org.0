Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D4690662C1A
	for <lists+linux-arm-msm@lfdr.de>; Mon,  9 Jan 2023 18:04:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229557AbjAIRDy (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 9 Jan 2023 12:03:54 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55560 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237470AbjAIRCz (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 9 Jan 2023 12:02:55 -0500
Received: from mail-pl1-x630.google.com (mail-pl1-x630.google.com [IPv6:2607:f8b0:4864:20::630])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 19D2B40C18
        for <linux-arm-msm@vger.kernel.org>; Mon,  9 Jan 2023 09:02:41 -0800 (PST)
Received: by mail-pl1-x630.google.com with SMTP id v23so5270211plo.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 09 Jan 2023 09:02:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Nr//lLmsu+5fOQNN1eNl3Pyv0bUQYnhf+WLJs/mJAHU=;
        b=kzBScnJ/PyPuu5Eq8Etlv8BjFlbNi0zTYLdPEipVJArsA9Pmdb2rekLFtesElFTdCq
         nPAX11Ya8Ep4jBWvZEHnzwVpPY8CtPyLjW+xBiIUE2sQkln68RFlGs9ca0KFgoobJL3y
         1F2BhONV/VqSaMUbhjnZoXiwCai//lzxVRE3jc3AllHfAzvwFeU/o9SCfkVYqcDpGiA0
         4fjhgmrmKyrY7DfDjdiLcQXlwbD9EX3pjxxRO+Q/mMt2Fq0Hbm5gDnM5DrZoOiFvHW6K
         fE/cnL/SCiyR5XcMserOkQPh4tv8Z3qilQk9OS2sa1bR5EJmK+7QgikBt9UXZ9j9VBDV
         P++g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Nr//lLmsu+5fOQNN1eNl3Pyv0bUQYnhf+WLJs/mJAHU=;
        b=fFYx3BeTQTtcuE+JBGyMGn26UMT56SK8y7V65zCIZ5zuP2ILIspvsPImS1MJOp1x3X
         MAl9noQM0WxEfzdm0/p2H59khBPYWbRJEUDOZnausfCp5krrmrggEUr6vWG3lfUDobLj
         qumOHcKgYSXKsE6VGsSqPjtvCl7SmXtZyElBLoGnFDUHtrdWES9qQZQD0wHyRBuPyudf
         d9n5avPokCsCMwMxd2HXWuBmPYuGzpkNpd7Na5In7/dqdG5nlzqhb1ZzNT+XtwhrGU+l
         7V9QOLlfGvfd59oayC9f29vVt4K+sKQmoLte2+pu/cbpnr4JdV9M80vj1H1a3ieuRBOc
         58ig==
X-Gm-Message-State: AFqh2kpfVlGkL5RWHJMYLnQ0W4rB3KMjhDI/JTQ7jP/W0sMGmpN1jfw3
        Jo97g4PP92R8itZvLqBTVFQ1WlHjRnaOidg7S1KBCA==
X-Google-Smtp-Source: AMrXdXtTfBIW85jiU1ZUsAeZoqqJKpTV6XQoUlKGw98Ak/vLMOXDXUyNzStoXh3SbqciAfp3lpfsaVp9OD7S8DpXJ1E=
X-Received: by 2002:a17:902:ab45:b0:193:8c1:50d2 with SMTP id
 ij5-20020a170902ab4500b0019308c150d2mr1487012plb.41.1673283760417; Mon, 09
 Jan 2023 09:02:40 -0800 (PST)
MIME-Version: 1.0
References: <20230106164618.1845281-1-vincent.guittot@linaro.org> <20230106182849.kr47mdgokd4qa6zw@builder.lan>
In-Reply-To: <20230106182849.kr47mdgokd4qa6zw@builder.lan>
From:   Vincent Guittot <vincent.guittot@linaro.org>
Date:   Mon, 9 Jan 2023 18:02:29 +0100
Message-ID: <CAKfTPtBJHWfhXCGojZSvS_DM4+bJnQ9j1GwtE5_YYJFHq9cpRA@mail.gmail.com>
Subject: Re: [PATCH] arm64: dts: qcom: sdm845: correct dynamic power coefficients
To:     Bjorn Andersson <andersson@kernel.org>
Cc:     dmitry.baryshkov@linaro.org, agross@kernel.org,
        konrad.dybcio@linaro.org, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, danny@kdrag0n.dev
Content-Type: multipart/mixed; boundary="000000000000263da105f1d7bc09"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

--000000000000263da105f1d7bc09
Content-Type: text/plain; charset="UTF-8"

On Fri, 6 Jan 2023 at 19:28, Bjorn Andersson <andersson@kernel.org> wrote:
>
> On Fri, Jan 06, 2023 at 05:46:18PM +0100, Vincent Guittot wrote:
>
> Seems like using get_maintainer.pl would have saved you some trouble ;)

The worst is that I used it but only checked names and not emails
when I reused the list of the original patch :-(

>
> > While stressing EAS on my dragonboard RB3, I have noticed that LITTLE cores
> > where never selected as the most energy efficient CPU whatever the
> > utilization level of waking task.
> >
> > energy model framework uses its cost field to estimate the energy with
> > the formula:
> >
> >   nrg = cost of the selected OPP * utilization / CPU's max capacity
> >
> > which ends up selecting the CPU with lowest cost / max capacity ration
> > as long as the utilization fits in the OPP's capacity.
> >
> > If we compare the cost of a little OPP with similar capacity of a big OPP
> > like :
> >        OPP(kHz)   OPP capacity    cost     max capacity   cost/max capacity
> > LITTLE 1766400    407             351114   407            863
> > big    1056000    408             520267   1024           508
> >
> > This can be interpreted as the LITTLE core consumes 70% more than big core
> > for the same compute capacity.
> >
> > According to [1], LITTLE consumes 10% less than big core for Coremark
> > benchmark at those OPPs. If we consider that everything else stays
> > unchanged, the dynamic-power-coefficient of LITTLE core should be
> > only 53% of the current value: 290 * 53% = 154
> >
> > Set the dynamic-power-coefficient of CPU0-3 to 154 to fix the energy model.
> >
>
> This is sounds reasonable.
>
> But if the math was wrong for SDM845, I would assume that sm8150 and
> sm8250 are wrong as well, as that's what 0e0a8e35d725 is based on. And
> should I assume that patches for other platforms are off by 53% as well?

I don't think that we can assume that there is an error and in
particular the same 53% error for others.

>
> Can you help me understand how to arrive at this number? (Without
> considering everything else stays unchanged, if needed).

In order to do the full computation, we need the voltage of each OPP
which I don't have as they are provided by the LUT at boot IIUC.
Instead I have used the debugfs output of the energy model and
compared the value of (perf_state->cost/cpu_max_capacity) with the
energy and duration figures available in [1].

In the case of SDM845, it was pretty easy to compare the OPPs of big
and LITTLE because the duration and the perf result were the same for
2 OPPS so we should have :

(little OPP(1766400)->cost / little max capacity (407)) / (big
OPP(1056000)->cost / big max capacity(1024)) = little OPP(1766400)
energy / big OPP(1056000) energy

(little OPP(1766400)->cost / little max capacity (407)) / (big
OPP(1056000)->cost / big max capacity(1024)) = 0.90

but current output gives:

(little OPP(1766400)->cost / little max capacity (407)) / (big
OPP(1056000)->cost / big max capacity(1024)) = 1.70

As we consider everything else constant, it can be simplified by:

correct_little_dynamic-power-coefficient *  const_A  = 0.90

Whereas we currently have

current_little_dynamic-power-coefficient * const_A = 1.70

and we ends up with

correct_little_dynamic-power-coefficient  = 0.90 / 1.70 *
current_little_dynamic-power-coefficient = 154

That being said, it can be simpler as the energy model provide the power figures

little OPP(1766400)->power = 351114 uW
big OPP(1056000)->power = 195991 uW
ration = 1.79

[1] results gives
little OPP(1766400)->power = 193.281 mW
big OPP(1056000)->power = 216.405 mW
ratio = 0.89

The ratios are a bit different and give a
correct_little_dynamic-power-coefficient  = 144 which is different
than when using ->cost. This probably comes from rounding and which
figures have been used to compute the model.

If you have Voltage of OPP, the formula used in energy model is power
(uW) = dynamic-power-coefficient * uV^2 * Freq (Mhz) so you can
compute dynamic-power-coefficient for each OPPs. They should be close
and then you will have to decide which one is the "best"

I don't have access to sdm8150 or sdm8250 boards but you can use the
same process to check that the energy model is aligned with the
figures in [1]

[1] https://github.com/kdrag0n/freqbench/tree/master/results

Regards,
Vincent
>
> Regards,
> Bjorn
>
> > [1] https://github.com/kdrag0n/freqbench/tree/master/results/sdm845/main
> >
> > Fixes: 0e0a8e35d725 ("arm64: dts: qcom: sdm845: correct dynamic power coefficients")
> > Signed-off-by: Vincent Guittot <vincent.guittot@linaro.org>
> > ---
> >  arch/arm64/boot/dts/qcom/sdm845.dtsi | 8 ++++----
> >  1 file changed, 4 insertions(+), 4 deletions(-)
> >
> > diff --git a/arch/arm64/boot/dts/qcom/sdm845.dtsi b/arch/arm64/boot/dts/qcom/sdm845.dtsi
> > index 65032b94b46d..869bdb9bce6e 100644
> > --- a/arch/arm64/boot/dts/qcom/sdm845.dtsi
> > +++ b/arch/arm64/boot/dts/qcom/sdm845.dtsi
> > @@ -198,7 +198,7 @@ CPU0: cpu@0 {
> >                       reg = <0x0 0x0>;
> >                       enable-method = "psci";
> >                       capacity-dmips-mhz = <611>;
> > -                     dynamic-power-coefficient = <290>;
> > +                     dynamic-power-coefficient = <154>;
> >                       qcom,freq-domain = <&cpufreq_hw 0>;
> >                       operating-points-v2 = <&cpu0_opp_table>;
> >                       interconnects = <&gladiator_noc MASTER_APPSS_PROC 3 &mem_noc SLAVE_EBI1 3>,
> > @@ -222,7 +222,7 @@ CPU1: cpu@100 {
> >                       reg = <0x0 0x100>;
> >                       enable-method = "psci";
> >                       capacity-dmips-mhz = <611>;
> > -                     dynamic-power-coefficient = <290>;
> > +                     dynamic-power-coefficient = <154>;
> >                       qcom,freq-domain = <&cpufreq_hw 0>;
> >                       operating-points-v2 = <&cpu0_opp_table>;
> >                       interconnects = <&gladiator_noc MASTER_APPSS_PROC 3 &mem_noc SLAVE_EBI1 3>,
> > @@ -243,7 +243,7 @@ CPU2: cpu@200 {
> >                       reg = <0x0 0x200>;
> >                       enable-method = "psci";
> >                       capacity-dmips-mhz = <611>;
> > -                     dynamic-power-coefficient = <290>;
> > +                     dynamic-power-coefficient = <154>;
> >                       qcom,freq-domain = <&cpufreq_hw 0>;
> >                       operating-points-v2 = <&cpu0_opp_table>;
> >                       interconnects = <&gladiator_noc MASTER_APPSS_PROC 3 &mem_noc SLAVE_EBI1 3>,
> > @@ -264,7 +264,7 @@ CPU3: cpu@300 {
> >                       reg = <0x0 0x300>;
> >                       enable-method = "psci";
> >                       capacity-dmips-mhz = <611>;
> > -                     dynamic-power-coefficient = <290>;
> > +                     dynamic-power-coefficient = <154>;
> >                       qcom,freq-domain = <&cpufreq_hw 0>;
> >                       operating-points-v2 = <&cpu0_opp_table>;
> >                       interconnects = <&gladiator_noc MASTER_APPSS_PROC 3 &mem_noc SLAVE_EBI1 3>,
> > --
> > 2.34.1
> >

--000000000000263da105f1d7bc09
Content-Type: image/png; name="image.png"
Content-Disposition: attachment; filename="image.png"
Content-Transfer-Encoding: base64
Content-ID: <f_lcp16sd00>
X-Attachment-Id: f_lcp16sd00

iVBORw0KGgoAAAANSUhEUgAAAFUAAAARCAYAAACsPOAgAAACmklEQVR4nO2WTUhUURTHf+NoYwv7
EhfTF2MafZAUQUWLiCzICKOij01gZYU1lZQ0RAZthFxEuQimLHBTEFgIlYugoFWbKImQSiiKoi+t
NgM16TT9p/cGh8r3bpD4RubPe3Pnzrn/w7n/Ofecm58UwEcO/wtJ8kc6hNGInKjDAE+J2nMZGqLw
8BG80/xaH2wIDNoHXkNTPVy8A5/yYME6aGmBJRMt++29sPoc/MjwuUz2u+LkGfDd7G7xpeEpUQuK
ofoARHo1HvvNOACnNkHbdOh8CXMTEN0J63drk+0QtNvClDroPiNfNs1fYAnqyk+4+3eMLwOeErW0
CvZojN+0hchA4gV0PIbt52G+nTn7GuFsJbS/goMh6zefdlRYOCiqKT/83d2/U3yZ8JSojkj+ev64
qPj6oatbX0LWvFdZNacD+sfBomo4cRwqigz45Wb+TZA1ovpnwNpZOp4nYUsrzFbhvNAMz3WsK2LW
mvLNcGWbRJ0MsWeqh0dg5VN4IJGnufBN/Jsia0RNneejV+HrIagq1RFUJq5SzVuhplI8yVoSqsxI
KK1pHStx1qhGfoC6oAvfwL8pskdUIVAGzdf12vPYLTUUibFj4d/X58nm15hImPH/1f9Q8JaoOnJx
NYy46liqwPV/Az2MCViN4X0XvBkPM0vg431o3K9ufxg2qiunuvuNSzB1uZJU9lgPnG6AvqXKvKDl
3pFvYHeLLw1Pidrbptq3S0Hb860T9KGAo+rcdaqTffegpkl17jMUhXRH1J0yGla3Ty3WJp+oSdVH
4O0X6/qzWI2qUzWyzG/5c+Qb2N3iS8NTopbU6p+vHdo+TxvsDg9h1DGNdOp18O/IN7C7xZeGp0Qd
LciJOgzIiToMsEVNjmwUoww/AVS2H0CPoSu9AAAAAElFTkSuQmCC
--000000000000263da105f1d7bc09--
