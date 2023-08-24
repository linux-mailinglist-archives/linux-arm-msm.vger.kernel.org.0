Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1DE827879E7
	for <lists+linux-arm-msm@lfdr.de>; Thu, 24 Aug 2023 23:08:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243049AbjHXVHy (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 24 Aug 2023 17:07:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42082 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S243306AbjHXVHq (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 24 Aug 2023 17:07:46 -0400
Received: from mail-yb1-xb2d.google.com (mail-yb1-xb2d.google.com [IPv6:2607:f8b0:4864:20::b2d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9C0B8E50
        for <linux-arm-msm@vger.kernel.org>; Thu, 24 Aug 2023 14:07:43 -0700 (PDT)
Received: by mail-yb1-xb2d.google.com with SMTP id 3f1490d57ef6-d78328bc2abso48317276.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 24 Aug 2023 14:07:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1692911263; x=1693516063;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yo1M14GunS2jP8EvQRltL0xJmIsZcrk6pcsFA+jBoT4=;
        b=jvDI7YPb8F1A86vMzBjNc6PBNbIvgk/HY2nEtmq3TRAlaLBLP5+sfAAzJ8O2On/Xqf
         ldGxA/KrbPzcg5GxWiejQp6MZCcOBVzjOIDBYjKx0PloimEEUw/E2ry93jqSsNcOmykc
         VsNRYfjlA0iscDEjoRifEI+9tXzCVQcfULeO8qZfRnuw1UZcxKJm36FXOV42HSGfpsCI
         yzLQO3EJpH2xg5cW4BE94dd65z5Ps4E9AKeNrh5bjXjILAMZzrHZf92alsJWeAHSA9hT
         ox2khDETY43n/FUe+J+wTv9De7kdwCGD/30gYW9UaXo1HnbGcfRqEu7gnTNC8GKygWiz
         6I7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692911263; x=1693516063;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yo1M14GunS2jP8EvQRltL0xJmIsZcrk6pcsFA+jBoT4=;
        b=Ouvu+IBZQOsZRnMIkhlYJeVvokxK9QIkhjSIZ6A+qnb2XXx1yMHG1ZCCGvbaPysxeN
         dk94nGeqwmmABTGDoBqGDkIy+HDaEpECEsvQfwzK+KDlIv4vIKSAF78gIZ8YDKAKViuR
         BEogTTO+Of6LgzEXNjv2N3bl/1lklOaf484QUhlAplGlKVlmU0LsyPGJdv+grUy9Q7Eh
         FMdWBcu13vz2tERO/LVtwq+/XG1AqIrGSLItSABZNouQopVwvJQf/sizICcpWie9y+c1
         hifJBaN+YGPxfSTlCiYjTjd3h0ozJE9tBMuz1tSU0N2pXhYFid3AgMjePq7j/nouLq2u
         91tQ==
X-Gm-Message-State: AOJu0YxDG7y7sEsVDw2nYnD6ksZrvUaVcgxV75GLP52POWNYN/FgX9qc
        L9RaJi63op9FPqcJSKJeV4FZrKGbGy3F5SvJivFwRQ==
X-Google-Smtp-Source: AGHT+IHZxYcJ/9SK9J6smOQRyc3mJKLx0RRxErQn97apokncANyoa4Y6OHclziI6RAyEXH7XBqfICtF6/MyCvr5wZY0=
X-Received: by 2002:a25:7490:0:b0:d78:19de:76ee with SMTP id
 p138-20020a257490000000b00d7819de76eemr1959257ybc.62.1692911262816; Thu, 24
 Aug 2023 14:07:42 -0700 (PDT)
MIME-Version: 1.0
References: <20230823222741.89584-1-david@ixit.cz> <20230823222741.89584-2-david@ixit.cz>
 <CAD=FV=WaW5jKwXDTvyXjy45PSWu8LoT0LxYKM_mZAH3LxZPwrQ@mail.gmail.com>
In-Reply-To: <CAD=FV=WaW5jKwXDTvyXjy45PSWu8LoT0LxYKM_mZAH3LxZPwrQ@mail.gmail.com>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date:   Fri, 25 Aug 2023 00:07:31 +0300
Message-ID: <CAA8EJppZG70Xg9qavvnY8VsOk6+uk_uLUXNgfBEVam-j46hRng@mail.gmail.com>
Subject: Re: [PATCH 2/2] arm64: dts: qcom: sdm845: cheza doesn't support LMh node
To:     Doug Anderson <dianders@chromium.org>
Cc:     David Heidelberg <david@ixit.cz>,
        cros-qcom-dts-watchers@chromium.org,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Thara Gopinath <thara.gopinath@linaro.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu, 24 Aug 2023 at 21:25, Doug Anderson <dianders@chromium.org> wrote:
>
> Hi,
>
> On Wed, Aug 23, 2023 at 3:28=E2=80=AFPM David Heidelberg <david@ixit.cz> =
wrote:
> >
> > Cheza firmware doesn't allow controlling LMh from the operating system.
> >
> > Fixes: 36c6581214c4 ("arm64: dts: qcom: sdm845: Add support for LMh nod=
e")
> > Suggested-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > Signed-off-by: David Heidelberg <david@ixit.cz>
> > ---
> >  arch/arm64/boot/dts/qcom/sdm845-cheza.dtsi | 14 ++++++++++++++
> >  1 file changed, 14 insertions(+)
> >
> > diff --git a/arch/arm64/boot/dts/qcom/sdm845-cheza.dtsi b/arch/arm64/bo=
ot/dts/qcom/sdm845-cheza.dtsi
> > index d86b0d112110..8cc8fc290fd3 100644
> > --- a/arch/arm64/boot/dts/qcom/sdm845-cheza.dtsi
> > +++ b/arch/arm64/boot/dts/qcom/sdm845-cheza.dtsi
> > @@ -143,6 +143,10 @@ panel_in_edp: endpoint {
> >         };
> >  };
> >
> > +&cpufreq_hw {
> > +       /delete-property/ interrupts-extended; /* reference to lmh_clus=
ter[01] */
> > +};
> > +
> >  &psci {
> >         /delete-node/ power-domain-cpu0;
> >         /delete-node/ power-domain-cpu1;
> > @@ -275,6 +279,14 @@ &BIG_CPU_SLEEP_1
> >                            &CLUSTER_SLEEP_0>;
> >  };
> >
> > +&lmh_cluster0 {
> > +       status =3D "disabled";
> > +};
> > +
> > +&lmh_cluster1 {
> > +       status =3D "disabled";
> > +};
>
> It's not a huge deal to me, but as I understand it usually you'd put
> the "disabled" in sdm845.dtsi and then it would be up to all the other
> sdm845 boards to mark this as "okay".

That depends. If a device is usually available (like LMH) and only
disabled in some obscure cases, it is better to disable it only in
this obscure case (in my opinion).

> >  /*
> >   * Reserved memory changes
> >   *
> > @@ -338,6 +350,8 @@ flash@0 {
> >
> >
> >  &apps_rsc {
> > +       /delete-property/ power-domains;
> > +
>
> Is the deletion of the "power-domains" here related to LMh? That seems
> like it was added to sdm845.dtsi in a separate commit that doesn't
> talk about LMh at all...

CLUSTER_PD becomes unavailable after the previous patch. So maybe you
are right and this chunk should be moved to the previous patch.

--=20
With best wishes
Dmitry
