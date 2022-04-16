Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1EF3050334E
	for <lists+linux-arm-msm@lfdr.de>; Sat, 16 Apr 2022 07:48:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229870AbiDPC13 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 15 Apr 2022 22:27:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47136 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229890AbiDPC1W (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 15 Apr 2022 22:27:22 -0400
Received: from mail-40135.protonmail.ch (mail-40135.protonmail.ch [185.70.40.135])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 86C1B11C3E
        for <linux-arm-msm@vger.kernel.org>; Fri, 15 Apr 2022 19:24:52 -0700 (PDT)
Date:   Sat, 16 Apr 2022 02:24:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
        s=protonmail; t=1650075890;
        bh=Tdm+Gb30KPNB754qZqduqBGa7sQyeNeAfzTKKqNZXbs=;
        h=Date:To:From:Cc:Reply-To:Subject:Message-ID:In-Reply-To:
         References:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
         Message-ID;
        b=K4rC/BNf9O9PzVJkIgSBjKmwtVBD4tr365zNLhuNW7lwgr8yg+r5q1axQOdE51RAY
         9bSTF/dVswV29mCXB55Vx9rJh87EPvTTTuR/Yg95NvN97MwjpPUwbvjWXCXgrpeg3h
         YP/JkmmZB8ZOGubpSSL4PG8KCT711Gq8SlPOgzk3NJwaWGqp6MpeJnnrUVrTx74iWq
         vKiEajVctBV13QCReEfxlVxycV7H0dmMGK6kHR/e4JBk2GyPpclrV8817FhEKKf2mu
         +x1l6AkxUm+6HiFDEL88FzONBUZB2bYtcy5Y/gBwhrG+n9r/VVeM5qnrZS74I+WEei
         6JgP8esv2Ppaw==
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
From:   Yassine Oudjana <y.oudjana@protonmail.com>
Cc:     Andy Gross <agross@kernel.org>, Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Ilia Lin <ilia.lin@kernel.org>,
        Viresh Kumar <vireshk@kernel.org>, Nishanth Menon <nm@ti.com>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Loic Poulain <loic.poulain@linaro.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-pm@vger.kernel.org
Reply-To: Yassine Oudjana <y.oudjana@protonmail.com>
Subject: Re: [PATCH v2 7/9] dt-bindings: arm: qcom: Add MSM8996 Pro compatible
Message-ID: <tGKTZ3SCPjbxYpx8GR11co-CbjZDqbwxIgfZFer3K6Ky8rzHy2Px7r8Zne5A3OZMdMzcWY1MnjYPdeL8LODwEdGRSV6s0yfL4S2FelbUTBY=@protonmail.com>
In-Reply-To: <YlXTZRPcOtM++g57@builder.lan>
References: <RHPEoHDkl9-X9DzB2A9P1Z-EowLK-VscTXgVAorSBWFb6yqJY585bMsVSe8otaj4Ahb9ng-CK5jnTt0wlhY_K1DPV3hRf7xg7pZa0mLgxy0=@protonmail.com> <YlXTZRPcOtM++g57@builder.lan>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_MSPIKE_H5,
        RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

------- Original Message -------
On Tuesday, April 12th, 2022 at 11:30 PM, Bjorn Andersson <bjorn.andersson@=
linaro.org> wrote:
> On Fri 08 Apr 23:18 CDT 2022, Yassine Oudjana wrote:
> > Add a qcom,msm8996pro compatible and move xiaomi,scorpio to the
> > same items list as it.
> >
> > Signed-off-by: Yassine Oudjana y.oudjana@protonmail.com
> > ---
> > Documentation/devicetree/bindings/arm/qcom.yaml | 5 +++++
> > 1 file changed, 5 insertions(+)
> >
> > diff --git a/Documentation/devicetree/bindings/arm/qcom.yaml b/Document=
ation/devicetree/bindings/arm/qcom.yaml
> > index 129cdd246223..dcf2e0102857 100644
> > --- a/Documentation/devicetree/bindings/arm/qcom.yaml
> > +++ b/Documentation/devicetree/bindings/arm/qcom.yaml
> > @@ -186,7 +186,12 @@ properties:
> > - sony,kagura-row
> > - sony,keyaki-row
> > - xiaomi,gemini
> > + - const: qcom,msm8996
> > +
> > + - items:
> > + - enum:
> > - xiaomi,scorpio
> > + - const: qcom,msm8996pro
> > - const: qcom,msm8996
>
>
> So we want both platform compatibles in there?

Instead of adding qcom,msm8996pro to qcom-cpufreq-nvmem and cpufreq-dt-plat=
dev,
I kept qcom,msm8996 as a fallback since pro isn't too different from non-pr=
o 8996
and should run mostly fine if treated as that. I'll remove it if you think =
it
is better.

>
> > - items:
> > --
> > 2.35.1
