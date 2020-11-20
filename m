Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1F4042BB25F
	for <lists+linux-arm-msm@lfdr.de>; Fri, 20 Nov 2020 19:24:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728676AbgKTSV1 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 20 Nov 2020 13:21:27 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39882 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728551AbgKTSV0 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 20 Nov 2020 13:21:26 -0500
Received: from mail-pf1-x443.google.com (mail-pf1-x443.google.com [IPv6:2607:f8b0:4864:20::443])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BDBE2C0613CF
        for <linux-arm-msm@vger.kernel.org>; Fri, 20 Nov 2020 10:21:26 -0800 (PST)
Received: by mail-pf1-x443.google.com with SMTP id w14so8649931pfd.7
        for <linux-arm-msm@vger.kernel.org>; Fri, 20 Nov 2020 10:21:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:content-transfer-encoding:in-reply-to:references
         :subject:from:cc:to:date:message-id:user-agent;
        bh=7TihohBvATjRksA7mov9AWRj+oCD9R9xDBrKiGdduuI=;
        b=NuTaMD1afS6HSVXRVkpy5vU8PaOP4y1zmjYprXQe2MTyPPXlA1X9fjk118/JpXnJMq
         eArs2vnbkTFu8ig9amQUox5yuAXFz+VmHV6Bi5SPDtLts8Xb4u/3tjmU+K4o839GkSQU
         qTCr+unVsW7MWL7R+lka5GHTuSoCsmA5BT9gY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:content-transfer-encoding
         :in-reply-to:references:subject:from:cc:to:date:message-id
         :user-agent;
        bh=7TihohBvATjRksA7mov9AWRj+oCD9R9xDBrKiGdduuI=;
        b=nkQOw9XwqbsKRKMdCwdS46Tox12sGvrJc7de8Mf+CsULHTK5bxL6BmYdOaOnTc1u/x
         cl2LFffIJcaIdKyQ2ZP89TWL4VWbDxPKt82iINVCjbCPuiRl1M8BAzpHVGJxZuFXtwLL
         Nlt66QF9f5NaKBm1bw0PdcLy4TNdd7VKkC2wDOv5ez9ocitcaYA3hxOsMRkGxxJcsVH3
         aqAVXr3fpA3UMkyWCG7BXjHXu+nIu0+WdplIbt8Yarnklq3tnXRJlHqwU4kVbZ9q1EZz
         SNr5TeunEPI3Nww4BeLnv1WNC0oHK2arNweLnpJsRQGKxvApudX43IA21h55oKCcDGpQ
         itrw==
X-Gm-Message-State: AOAM532PSgUsNx4OXUYYXPhTV27Y8zbWsKftk/lXpCQWmAoGGEXy2pHb
        g1K+IarvC3Mi3agxmD3JL1oKUA==
X-Google-Smtp-Source: ABdhPJzAx7vUpuPKw6BIxJXlTMltXEciSUPQAWSixSxuY6eVPk6Jvpqzjv68QGm4NA5VUAC5PGfSew==
X-Received: by 2002:a63:1445:: with SMTP id 5mr17802087pgu.357.1605896486323;
        Fri, 20 Nov 2020 10:21:26 -0800 (PST)
Received: from chromium.org ([100.99.132.239])
        by smtp.gmail.com with ESMTPSA id q19sm4273789pfh.37.2020.11.20.10.21.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2020 10:21:25 -0800 (PST)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <CAD=FV=WhbAQMm4u9kj7ZrdxSRDX1dWxdopuMx7TGx+wafC1Rjg@mail.gmail.com>
References: <20201120074508.3236616-1-swboyd@chromium.org> <CAD=FV=WhbAQMm4u9kj7ZrdxSRDX1dWxdopuMx7TGx+wafC1Rjg@mail.gmail.com>
Subject: Re: [PATCH v2] arm64: dts: qcom: sc7180: Add prox sensor to LTE sku Lazor boards
From:   Stephen Boyd <swboyd@chromium.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        LKML <linux-kernel@vger.kernel.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        Matthias Kaehlcke <mka@chromium.org>
To:     Doug Anderson <dianders@chromium.org>
Date:   Fri, 20 Nov 2020 10:21:24 -0800
Message-ID: <160589648433.2717324.4950553484725759433@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Doug Anderson (2020-11-20 09:50:38)
> Hi,
>=20
> On Thu, Nov 19, 2020 at 11:45 PM Stephen Boyd <swboyd@chromium.org> wrote:
> >
> > --- a/arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r1-lte.dts
> > +++ b/arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r1-lte.dts
> > @@ -13,6 +13,14 @@ / {
> >         compatible =3D "google,lazor-rev1-sku0", "google,lazor-rev2-sku=
0", "qcom,sc7180";
> >  };
> >
> > +&ap_sar_sensor {
> > +       status =3D "okay";
> > +};
> > +
> > +&ap_sar_sensor_i2c {
> > +       status =3D "okay";
>=20
> Technically you don't need to mark the i2c bus as "okay" upstream
> because it's already "okay" in "sc7180-trogdor.dtsi".  ...or perhaps
> you should add a patch that changes that and makes us match
> downstream.  ;-)

Ok I will resend with that extra part too.
