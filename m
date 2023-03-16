Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 19DA56BC261
	for <lists+linux-arm-msm@lfdr.de>; Thu, 16 Mar 2023 01:23:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229602AbjCPAX4 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 15 Mar 2023 20:23:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53060 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231918AbjCPAXz (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 15 Mar 2023 20:23:55 -0400
Received: from mail-il1-x12d.google.com (mail-il1-x12d.google.com [IPv6:2607:f8b0:4864:20::12d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DA26C76167
        for <linux-arm-msm@vger.kernel.org>; Wed, 15 Mar 2023 17:23:53 -0700 (PDT)
Received: by mail-il1-x12d.google.com with SMTP id j6so126184ilr.7
        for <linux-arm-msm@vger.kernel.org>; Wed, 15 Mar 2023 17:23:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1678926233;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=jlAFS2ptLbb09Z2fk4u0nRnOMwaR/p+cy4WdKwMS5KE=;
        b=O7Ma84nGqQRrwnDGLKZepKEFD5Rxht1S15njoHqb9jkbekoJFYRhIqJZtKSeJz1fCA
         eHD5ZjNJRrz7uxDWX0lq7HkFVtuU40BwtSnof1g8D/TJxn41D7JRWSa01wyQjG9pVqVD
         dSf9z2TTFnXBpm44lI2BZ4Xj+DLAVN1Hx4Srg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678926233;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=jlAFS2ptLbb09Z2fk4u0nRnOMwaR/p+cy4WdKwMS5KE=;
        b=cjoNzlAncqtKM6px+X+RI+MDKxxu5YBUkizx6NMY2lBqGYPqsUpkXRCQRObZ1ps7r3
         w8UUzCwqHWgosj7nma0RbXBVeEPSc3tJLXW4t5ivmHoCC1XyxQKs8yFGBRCzX/BRj26M
         GY1n1KzkyvaidXGbyTlGJFOvCJdrISvWVzljjBXmQBvprp+qbr2WYoZ13u0wMBzk13dG
         avYNpuknpoId31f4BjvBuTAATLmCe/9Ft0sR1mMF6Vbrc/iHOq/2Ut69G1aYIfNKwu51
         CR7KPcfN0iid/pMXRyshvGgonkAdgGzfDbtD/mgABRx87kdZlBwkdFrUiyGKhYuawlj4
         xpeQ==
X-Gm-Message-State: AO0yUKUzzFkHAyHON7X3A/nQIgA1f5R5QDHFUgbxXaAmEcMH0Dflk7av
        FCXnch1HTztgAdI/27POfYle1w==
X-Google-Smtp-Source: AK7set/jVZJYGrNvI1a5w7tJAIRRuOUPioI5Snz6rKF9dWqIzp4qMZlZJdnWHxwzaYJ95W6rLqRDAQ==
X-Received: by 2002:a92:dd08:0:b0:315:4449:cb50 with SMTP id n8-20020a92dd08000000b003154449cb50mr5413182ilm.16.1678926233242;
        Wed, 15 Mar 2023 17:23:53 -0700 (PDT)
Received: from localhost (30.23.70.34.bc.googleusercontent.com. [34.70.23.30])
        by smtp.gmail.com with UTF8SMTPSA id o12-20020a056e02068c00b003179b81610csm1994591ils.17.2023.03.15.17.23.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 15 Mar 2023 17:23:52 -0700 (PDT)
Date:   Thu, 16 Mar 2023 00:23:52 +0000
From:   Matthias Kaehlcke <mka@chromium.org>
To:     Doug Anderson <dianders@chromium.org>
Cc:     Konrad Dybcio <konrad.dybcio@linaro.org>,
        Nikita Travkin <nikita@trvn.ru>, agross@kernel.org,
        andersson@kernel.org, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        ~postmarketos/upstreaming@lists.sr.ht,
        Srinivasa Rao Mandadapu <quic_srivasam@quicinc.com>,
        Judy Hsiao <judyhsiao@chromium.org>
Subject: Re: [PATCH v3 1/4] arm64: dts: qcom: sc7180: Don't enable lpass
 clocks by default
Message-ID: <ZBJhmDd3zK/AiwBD@google.com>
References: <20230315154311.37299-1-nikita@trvn.ru>
 <20230315154311.37299-2-nikita@trvn.ru>
 <3557aa94-6a83-d054-a9d9-81751165eb8a@linaro.org>
 <CAD=FV=WFXS96V=-Edi1f+9UcTuzOdn4W01WeW_yV1m5FyLk-rQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAD=FV=WFXS96V=-Edi1f+9UcTuzOdn4W01WeW_yV1m5FyLk-rQ@mail.gmail.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Wed, Mar 15, 2023 at 05:06:04PM -0700, Doug Anderson wrote:
> Hi,
> 
> On Wed, Mar 15, 2023 at 9:12 AM Konrad Dybcio <konrad.dybcio@linaro.org> wrote:
> >
> >
> >
> > On 15.03.2023 16:43, Nikita Travkin wrote:
> > > lpass clocks are usually blocked from HLOS by the firmware and
> > > instead are managed by the ADSP. Mark them as reserved and explicitly
> > > enable in the CrOS boards that have special, cooperative firmware.
> > >
> > > Signed-off-by: Nikita Travkin <nikita@trvn.ru>
> > > ---
> > +CC Doug
> >
> > Please confirm whether this also applies to IDP (in which case
> > this would have been a bugfix).
> 
> Thanks for the CC! Actually, Judy (and maybe Matthias) might be
> better. The audio stuff makes my head spin a little bit and I know
> they've kept track of it much better than I have. If they don't have
> time, I can dig more into it myself. I also added Srinivasa just in
> case.
>
> In general, though, I think people at Google don't interact with IDP
> very much. It's a reference board from Qualcomm and not the right form
> factor. It also doesn't support most of the tooling that folks at
> Google on the ChromeOS team expect. I don't know if audio was ever
> really supported on IDP. Probably not since there's no "sound" node in
> the IDP device tree file.

I don't know about the history of audio on the IDP either, I share Doug's
assessment that it looks like it was never supported.

> > Konrad
> > >  arch/arm64/boot/dts/qcom/sc7180-trogdor.dtsi | 8 ++++++++
> > >  arch/arm64/boot/dts/qcom/sc7180.dtsi         | 4 ++++
> > >  2 files changed, 12 insertions(+)
> > >
> > > diff --git a/arch/arm64/boot/dts/qcom/sc7180-trogdor.dtsi b/arch/arm64/boot/dts/qcom/sc7180-trogdor.dtsi
> > > index 423630c4d02c..26def6e12723 100644
> > > --- a/arch/arm64/boot/dts/qcom/sc7180-trogdor.dtsi
> > > +++ b/arch/arm64/boot/dts/qcom/sc7180-trogdor.dtsi
> > > @@ -785,6 +785,14 @@ alc5682: codec@1a {
> > >       };
> > >  };
> > >
> > > +&lpasscc {
> > > +     status = "okay";
> > > +};
> > > +
> > > +&lpass_hm {
> > > +     status = "okay";
> > > +};
> > > +
> > >  &lpass_cpu {
> > >       status = "okay";
> > >
> > > diff --git a/arch/arm64/boot/dts/qcom/sc7180.dtsi b/arch/arm64/boot/dts/qcom/sc7180.dtsi
> > > index 53f0076f20f6..f0de177981f9 100644
> > > --- a/arch/arm64/boot/dts/qcom/sc7180.dtsi
> > > +++ b/arch/arm64/boot/dts/qcom/sc7180.dtsi
> > > @@ -3623,6 +3623,8 @@ lpasscc: clock-controller@62d00000 {
> > >                       power-domains = <&lpass_hm LPASS_CORE_HM_GDSCR>;
> > >                       #clock-cells = <1>;
> > >                       #power-domain-cells = <1>;
> > > +
> > > +                     status = "reserved"; /* Controlled by ADSP */
> > >               };
> > >
> > >               lpass_cpu: lpass@62d87000 {
> > > @@ -3671,6 +3673,8 @@ lpass_hm: clock-controller@63000000 {
> > >
> > >                       #clock-cells = <1>;
> > >                       #power-domain-cells = <1>;
> > > +
> > > +                     status = "reserved"; /* Controlled by ADSP */
> > >               };
> > >       };
> > >
