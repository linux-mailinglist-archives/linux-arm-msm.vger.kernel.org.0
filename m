Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CACA83D2642
	for <lists+linux-arm-msm@lfdr.de>; Thu, 22 Jul 2021 16:53:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232465AbhGVONK (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 22 Jul 2021 10:13:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51332 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232552AbhGVOMG (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 22 Jul 2021 10:12:06 -0400
Received: from mail-qk1-x731.google.com (mail-qk1-x731.google.com [IPv6:2607:f8b0:4864:20::731])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1B6BEC061760
        for <linux-arm-msm@vger.kernel.org>; Thu, 22 Jul 2021 07:52:35 -0700 (PDT)
Received: by mail-qk1-x731.google.com with SMTP id bm6so5652440qkb.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 22 Jul 2021 07:52:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=8F9aS2bitLy3DUQnf7TGV/UhbX2TURQDr3klee2mdNE=;
        b=TCEmHUnDQ6gGKtpkcfMY8QA+PP7hwAJM99sdFy1TpD6Zxd36UhPg7wDLUpKFOYRFka
         0qgEao99I/oIqcyIhKjAf8RelxNRSKMZLoK5FaVBJAaHw42dmESsP5LHMJN17TSXjyAr
         zgPN521fVJt0ikVchspk6Sik+X+XS/6eHboUc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=8F9aS2bitLy3DUQnf7TGV/UhbX2TURQDr3klee2mdNE=;
        b=AKW0K/jHKcc0HU2XjEjiAbNCHmOeLdEg1CcL2AZjoi+DtoER0yN7HBzKaT/5gaezq9
         aM/sO87F0H+le5d+S46BzO9P2fleMpcQr45Z30723Z663yh0vwqGmhlQXUA2RtOfNZfx
         E0c9qWhFsFIMDO1XHiBzzBqVoPCPNqrsI4Z3m7Uw/8J0KtjGdT46XL5VZ8Q3ZDoSEoMv
         G1xAxIKWUfQq+U4MedomL3DamGcmRbo6dx7bUXyGP3zi1MWm1tMIiAx43NHgtzQLaO7h
         pgOKr93Ouor4aoBieAdiNHOOXM2giZZzM/W2Cm8xDyldiCNepFvW9S6uPV+VdIs1TNuO
         w9sQ==
X-Gm-Message-State: AOAM533r8WtMG3twZEmvC2G8Fb2obqrjc3l1TUHkbCQMcfxqLnb6CCk9
        QaI/GrJnqlV4jkakzOAWF7sXJHLV45ldhg==
X-Google-Smtp-Source: ABdhPJwPMgvqt0EsZwAxZ922j3ihyaAge0ovchY5mGQxQjP9rGxn3oEgW2MGxNw6pjrYvECxHPS0Qg==
X-Received: by 2002:a37:ba03:: with SMTP id k3mr95150qkf.220.1626965554086;
        Thu, 22 Jul 2021 07:52:34 -0700 (PDT)
Received: from mail-yb1-f173.google.com (mail-yb1-f173.google.com. [209.85.219.173])
        by smtp.gmail.com with ESMTPSA id j18sm5694081qkk.78.2021.07.22.07.52.32
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 22 Jul 2021 07:52:32 -0700 (PDT)
Received: by mail-yb1-f173.google.com with SMTP id x192so8717832ybe.6
        for <linux-arm-msm@vger.kernel.org>; Thu, 22 Jul 2021 07:52:32 -0700 (PDT)
X-Received: by 2002:a25:dc50:: with SMTP id y77mr53799516ybe.405.1626965552146;
 Thu, 22 Jul 2021 07:52:32 -0700 (PDT)
MIME-Version: 1.0
References: <20210721084126.14035-1-srivasam@codeaurora.org>
 <20210721084126.14035-3-srivasam@codeaurora.org> <CAD=FV=W3X8W90vPdrDAymzTKj-J7QPyn4ukaLSOhEkCme3+r_Q@mail.gmail.com>
 <c26ac462-6253-3806-0739-7c5149beaaa3@codeaurora.org>
In-Reply-To: <c26ac462-6253-3806-0739-7c5149beaaa3@codeaurora.org>
From:   Doug Anderson <dianders@chromium.org>
Date:   Thu, 22 Jul 2021 07:52:18 -0700
X-Gmail-Original-Message-ID: <CAD=FV=UySPvQCaBL81UTUgCN8ukYv=XcqPDinNN_JBfVAW_Q3g@mail.gmail.com>
Message-ID: <CAD=FV=UySPvQCaBL81UTUgCN8ukYv=XcqPDinNN_JBfVAW_Q3g@mail.gmail.com>
Subject: Re: [PATCH v5 2/2] arm64: dts: qcom: sc7180-trogdor: Add lpass dai
 link for HDMI
To:     Srinivasa Rao Mandadapu <srivasam@codeaurora.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>,
        Rohit kumar <rohitkr@codeaurora.org>,
        Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
        Stephen Boyd <swboyd@chromium.org>,
        Judy Hsiao <judyhsiao@chromium.org>,
        V Sujith Kumar Reddy <vsujithk@codeaurora.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi,


On Thu, Jul 22, 2021 at 7:49 AM Srinivasa Rao Mandadapu
<srivasam@codeaurora.org> wrote:
>
> Thanks for your time Doug!!
>
> On 7/21/2021 9:50 PM, Doug Anderson wrote:
> > Hi,
> >
> > On Wed, Jul 21, 2021 at 1:42 AM Srinivasa Rao Mandadapu
> > <srivasam@codeaurora.org> wrote:
> >> From: V Sujith Kumar Reddy <vsujithk@codeaurora.org>
> >>
> >> Add dai link in sc7180-trogdor.dtsi for supporting audio over DP
> >>
> >> Signed-off-by: V Sujith Kumar Reddy <vsujithk@codeaurora.org>
> >> Signed-off-by: Srinivasa Rao Mandadapu <srivasam@codeaurora.org>
> >> Reviewed-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
> >> ---
> >>   arch/arm64/boot/dts/qcom/sc7180-trogdor.dtsi | 17 +++++++++++++++++
> >>   1 file changed, 17 insertions(+)
> >>
> >> diff --git a/arch/arm64/boot/dts/qcom/sc7180-trogdor.dtsi b/arch/arm64/boot/dts/qcom/sc7180-trogdor.dtsi
> >> index 31bf7c698b8f..a4cb9ee567ff 100644
> >> --- a/arch/arm64/boot/dts/qcom/sc7180-trogdor.dtsi
> >> +++ b/arch/arm64/boot/dts/qcom/sc7180-trogdor.dtsi
> >> @@ -288,6 +288,7 @@ sound: sound {
> >>                          "Headphone Jack", "HPOL",
> >>                          "Headphone Jack", "HPOR";
> >>
> >> +               #sound-dai-cells = <0>;
> > The `#sound-dai-cells` is not in the bindings. The bindings also say
> > `additionalProperties: false`. So either your patch is wrong for
> > including this or the bindings are wrong for omitting it. Which is it?
> > I notice that downstream we don't have this.
> >
> Yes it's wrongly placed Here. Will remove it.
> >> @@ -314,6 +315,18 @@ sound_multimedia1_codec: codec {
> >>                                  sound-dai = <&max98357a>;
> > Ideally you'll want to rebase to make context clean since the above
> > got changed from `max98357a` to `max98360a`.
> >
> >
> >>                          };
> >>                  };
> >> +
> >> +               dai-link@2 {
> >> +                       link-name = "MultiMedia2";
> >> +                       reg = <2>;
> > I am certainly not an expert, but I notice that downstream we have reg
> > as <LPASS_DP_RX>, which makes the node name dai-link@5 instead of @2.
> > Does that matter?
> >
> Yes,Here reg as <LPASS_DP_RX> is correct option. Will change
> accordingly.  But It seems dai-link@2 is appropriate as in this platform

I think you misunderstand. The "@num" is _required_ to match the value
for "reg". So if reg is 5 then you need "@5", not "@2"


> we are using only 3 nodes. i.e. I2S primary, I2S secondary and DP node.
>
> >> @@ -768,6 +781,10 @@ secondary_mi2s: mi2s@1 {
> >>                  reg = <MI2S_SECONDARY>;
> >>                  qcom,playback-sd-lines = <0>;
> >>          };
> >> +
> >> +       hdmi-primary@0 {
> >> +               reg = <LPASS_DP_RX>;
> > Your node name and `reg` don't match. `LPASS_DP_RX` is 5 so the node
> > name should include @5, not @0. I also notice that downstream the node
> > name is called `hdmi`, not `hdmi-primary`. The downstream `hdmi` seems
> > more parallel to the sibling nodes, like `mi2s@0` and `mi2s@1`.
> Yes hdmi@2 is appropriate. will change accordingly.

Same here. Since LPASS_DP_RX is actually the number 5 then you need
@5. I think there was discussion about allowing it to be @LPASS_DP_RX
but last I remember the decision was to keep it as a number.

-Doug
