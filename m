Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5679334584D
	for <lists+linux-arm-msm@lfdr.de>; Tue, 23 Mar 2021 08:08:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230053AbhCWHH3 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 23 Mar 2021 03:07:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37868 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229504AbhCWHG7 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 23 Mar 2021 03:06:59 -0400
Received: from mail-pj1-x1032.google.com (mail-pj1-x1032.google.com [IPv6:2607:f8b0:4864:20::1032])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A69C0C061763
        for <linux-arm-msm@vger.kernel.org>; Tue, 23 Mar 2021 00:06:59 -0700 (PDT)
Received: by mail-pj1-x1032.google.com with SMTP id s21so9686281pjq.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 23 Mar 2021 00:06:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:content-transfer-encoding:in-reply-to:references
         :subject:from:cc:to:date:message-id:user-agent;
        bh=M7BX2s49auLfbH2gyCi6pSTB77prgu67qQJXhpmUA0U=;
        b=IOUq/keT/pN6NH7JDlFmy0UckH2Ljp+O6AAcAcuFNmV8rABoiI4Ti48EgiYgdkhbbJ
         gKdFzHzBJKOqT5Ob0YoXEPcJTsWVXunJ9mJUGv0imGnWSD4uMLRZquHIaHXA9VX47NTE
         grrCMXoa9q6oDxIvscH/zo4S3EHEfPhggIH0Y=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:content-transfer-encoding
         :in-reply-to:references:subject:from:cc:to:date:message-id
         :user-agent;
        bh=M7BX2s49auLfbH2gyCi6pSTB77prgu67qQJXhpmUA0U=;
        b=idD7yQHbbQxVKpIN2Uh2wt3OYItODCLO6B4jLk30Ixtkqx5pzjthpMdOTLhRMbrj2W
         Wq1Y/iutS72xgV5sH1nfjloSzs8gMq4z6wMd0bBjTBOxzhCAEpSugme7D6l1klCxPFES
         ZSC1OkI0BW9ub1DtUj2/856ol2qAhH849FtCZpC5poOTFKP2veu0iEeMcCnLbP5J2ewa
         NnxOlDUr+1SpfrpPl4A2Lwq2jLej9RN1zgnwo8vjp++mopSLxqe4qskmElMwvpxe754m
         C+49J341ohbojYzORIF/NT5gNrPwQti/qo4IliSyXE3em/j2AzrLZeql8HB8sR0/gfEQ
         OzbA==
X-Gm-Message-State: AOAM530Tw2U+F/sqb3Am+TPLNfEEnDyNMGQDWsYyXsrKoDIWQ6SeUJGN
        6jiVQRmPI+zTyH4KiY0PRAhqP2xKK2O3eQ==
X-Google-Smtp-Source: ABdhPJxIdnipkazekqqUnF8aJGK8AFsaN3fIpLQOc7AxrUpquJI41YX9/l3Ud3NjUtFIoSaPs4V7Bw==
X-Received: by 2002:a17:90a:c207:: with SMTP id e7mr3088269pjt.188.1616483219004;
        Tue, 23 Mar 2021 00:06:59 -0700 (PDT)
Received: from chromium.org ([2620:15c:202:201:e90d:d453:87ae:2e10])
        by smtp.gmail.com with ESMTPSA id j10sm1550508pjs.11.2021.03.23.00.06.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Mar 2021 00:06:58 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <ac4f5cf8-0bf0-b7c3-2d50-ae7d48cbc885@codeaurora.org>
References: <1614773878-8058-1-git-send-email-rnayak@codeaurora.org> <1614773878-8058-6-git-send-email-rnayak@codeaurora.org> <161481625091.1478170.8810587061043612400@swboyd.mtv.corp.google.com> <31bf64c5-26a4-dc23-3769-df7a7559083b@codeaurora.org> <ac4f5cf8-0bf0-b7c3-2d50-ae7d48cbc885@codeaurora.org>
Subject: Re: [PATCH v2 05/14] arm64: dts: qcom: sc7280: Add RSC and PDC devices
From:   Stephen Boyd <swboyd@chromium.org>
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
To:     Maulik Shah <mkshah@codeaurora.org>,
        Rajendra Nayak <rnayak@codeaurora.org>, agross@kernel.org,
        bjorn.andersson@linaro.org, robh+dt@kernel.org
Date:   Tue, 23 Mar 2021 00:06:56 -0700
Message-ID: <161648321678.3012082.421067844814536713@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Maulik Shah (2021-03-07 21:21:04)
> Hi,
>=20
> On 3/5/2021 11:12 AM, Rajendra Nayak wrote:
> >
> > On 3/4/2021 5:34 AM, Stephen Boyd wrote:
> >> Quoting Rajendra Nayak (2021-03-03 04:17:49)
> >>> diff --git a/arch/arm64/boot/dts/qcom/sc7280.dtsi=20
> >>> b/arch/arm64/boot/dts/qcom/sc7280.dtsi
> >>> index 4a56d9c..21c2399 100644
> >>> --- a/arch/arm64/boot/dts/qcom/sc7280.dtsi
> >>> +++ b/arch/arm64/boot/dts/qcom/sc7280.dtsi
> >>> @@ -30,6 +31,18 @@
> >>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 };
> >>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 };
> >>> =C2=A0 +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 reserved_memory: reserve=
d-memory {
> >>
> >> Do we plan to use this label at any point? I'd prefer we remove this
> >> until it becomes useful.
> >
> > sure, i'll drop it
> >
> >>
> >>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 #address-cells =3D <2>;
> >>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 #size-cells =3D <2>;
> >>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 ranges;
> >>> +
> >>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 aop_cmd_db_mem: memory@80860000 {
> >>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 reg =3D =
<0x0 0x80860000 0x0 0x20000>;
> >>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 compatib=
le =3D "qcom,cmd-db";
> >>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 no-map;
> >>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 };
> >>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 };
> >>> +
> >>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 cpus {
> >>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 #address-cells =3D <2>;
> >>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 #size-cells =3D <0>;
> >>> @@ -203,6 +229,7 @@
> >>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
 interrupt-controller;
> >>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
 #interrupt-cells =3D <2>;
> >>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
 gpio-ranges =3D <&tlmm 0 0 175>;
> >>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 wakeup-p=
arent =3D <&pdc>;
> >>> =C2=A0 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 qup_uart5_default: qup-uart5-default {
> >>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 pins =3D "gpio46", "gpio47=
";
> >>> @@ -287,6 +314,23 @@
> >>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 status =3D "disabled";
> >>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
 };
> >>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 };
> >>> +
> >>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 apps_rsc: rsc@18200000 {
> >>
> >> Any better name than 'rsc'? Maybe 'power-controller'?
> >
> > hmm, Maulik, any thoughts? This would perhaps need the bindings docs
> > to be updated as well (and maybe the existing platform DTs using rsc to=
o)
>=20
> I think we should be good with rsc (resource-state-coordinator). RSC=20
> itself don't do any resource power management.
>=20

Maybe 'mailbox' then? Or 'remoteproc'? I am not "good" with rsc as it
isn't part of the standardized nodes names per the DT spec.
