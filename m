Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1705D4B1447
	for <lists+linux-arm-msm@lfdr.de>; Thu, 10 Feb 2022 18:33:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240950AbiBJRc0 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 10 Feb 2022 12:32:26 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:43494 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241966AbiBJRcX (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 10 Feb 2022 12:32:23 -0500
Received: from mail-qk1-x732.google.com (mail-qk1-x732.google.com [IPv6:2607:f8b0:4864:20::732])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3C46D264F
        for <linux-arm-msm@vger.kernel.org>; Thu, 10 Feb 2022 09:32:23 -0800 (PST)
Received: by mail-qk1-x732.google.com with SMTP id o25so5560714qkj.7
        for <linux-arm-msm@vger.kernel.org>; Thu, 10 Feb 2022 09:32:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=XQBvPSl6y4HgTBJ44m4InLmSK5KrvPEhwFZg0lx6zO8=;
        b=CbkbpHyjV4UyHeO1BN9RWFbeSTtNOtYW3U/2RZVVUxSft+q5m7tJQjmASRGP30t3jG
         5d+LYYdPEvbOeSxyLkO1l+AEBI+rfxAPsL9lWWDygDCK6pJGno+fT/YHQEeJaaj7NcTA
         hIYzdj/Y/YGtMgR1SyKgfCQzT3T3mvNc52wOKRDFQEektHmnn3hD9vou5OL8FjzxWPMu
         TJFfc3QYKo5PLTP+eXSIVWLAy3dSsoDHSLusCqVphCHxXb8zLF/Ys16LdFAKPpQLfYmQ
         1TuTM3BtTmOQAQBH0Z3ZwDNTyf90iA0LkNx9+z8hBOD8hOy33gZIZ6PG+8czlyyz1AcA
         pb5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=XQBvPSl6y4HgTBJ44m4InLmSK5KrvPEhwFZg0lx6zO8=;
        b=Vut32NOsqBJySNm5hoWFJXeo4vfCAHtaO9TjMZmwf2mG9w8Wg9YnGwb43d2VZQdznw
         zBF/Dvuvl1ac/DD3gsDbUlH/CmAz/qf7ciu5jfAoPK9rydEOQE3we+nZhRttZXKZwx00
         6t6ogcSOd8FQOGG49V2D1W82l52O+FL4vKWVT4KoBSK9klaf2HDD5IkEtzPpyWT/Fcac
         gnqsdT8Sy/dgzRcOKGfDgmm2bQuT/its6cBGVmeqiBhP1qqxe3B3NRVWySWSC1rb7L0K
         N1hbd+8AlKkM6xMj2lfaTpj6fEA5hC/g4yx4/LA8CO8IuFaEqTUP/TitRVyn069spKt6
         ullw==
X-Gm-Message-State: AOAM532M+NTPYRBbc0ysnE1fxN/jHyVPn/YMzjqq+wwfBy/gHkqwHa0Y
        JykUf2KYEsaDJRsphcm4ABrTThc4eNlfs/f4z2dBNQ==
X-Google-Smtp-Source: ABdhPJxBLAayB2WeOWtDpmzDlbhYAGv3r34jrZOIli1AnEOg4RJa3JNJUjcJfqCBJeVvbm89NrFw7mv0a9Qtdr2fM7Q=
X-Received: by 2002:a05:620a:280b:: with SMTP id f11mr4322102qkp.59.1644514340161;
 Thu, 10 Feb 2022 09:32:20 -0800 (PST)
MIME-Version: 1.0
References: <20220203164629.1711958-3-vladimir.zapolskiy@linaro.org>
 <Yf1q+wlXo2LAeZX+@ripper> <Yf1zhojUSxlMNZgV@sirena.org.uk>
 <Yf14LADJ26G9ByZu@ripper> <Yf1/X1rXm4QbyoFN@sirena.org.uk>
 <846cdc17-891d-2ee4-fc89-7cf6fbdebc1d@linaro.org> <YgEvN0lXXu4lDCN5@sirena.org.uk>
 <682b7ffe-e162-bcf7-3c07-36b3a39c25ab@linaro.org> <YgJoX+Ajgt4dweQJ@sirena.org.uk>
 <CAA8EJppEjFqPUBXtdkTsx2U2CjsrjNsXEmrx_DkAS9a9jmB9cg@mail.gmail.com> <YgUy9KMXocSqnv7b@sirena.org.uk>
In-Reply-To: <YgUy9KMXocSqnv7b@sirena.org.uk>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date:   Thu, 10 Feb 2022 20:32:09 +0300
Message-ID: <CAA8EJpqN_T7eAOdLhK-P_0HCuChpE9JhPBg9HVJ=N1kKMbgDjA@mail.gmail.com>
Subject: Re: [PATCH 2/9] dt-bindings: i2c: qcom-cci: add description of a
 vbus-supply property
To:     Mark Brown <broonie@kernel.org>
Cc:     Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Wolfram Sang <wsa@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        linus.walleij@linaro.org, Loic Poulain <loic.poulain@linaro.org>,
        Robert Foss <robert.foss@linaro.org>,
        Rob Herring <robh+dt@kernel.org>, linux-i2c@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu, 10 Feb 2022 at 18:45, Mark Brown <broonie@kernel.org> wrote:
>
> On Thu, Feb 10, 2022 at 06:33:09PM +0300, Dmitry Baryshkov wrote:
> > On Tue, 8 Feb 2022 at 16:16, Mark Brown <broonie@kernel.org> wrote:
> > > On Mon, Feb 07, 2022 at 08:31:30PM +0200, Vladimir Zapolskiy wrote:
> > > > On 2/7/22 4:39 PM, Mark Brown wrote:
>
> > > > > The bindings are ABI, it doesn't seem like a good idea to add new ABI as
> > > > > a temporary bodge.
>
> > It's not a temporary bodge. The i2c-core piece was reverted, but not
> > the mediatek driver code/bindings.
> > Vladimir has provided a replacement for the i2c-core code handling the
> > vbus-regulator. When thee code will be back, the code from i2c-cci can
> > be removed. The bindings will be the same.
>
> I would hope it's a temporary thing given the namespace collision
> issues...

Which collision? CCI doesn't have a separate vbus power input (and
probably never will).

>
> > > There's also the option of representing this as a separate thing on or
> > > part of the bus.
>
> > 4) (which you have implemented in your patch). Add support for  the
> > vbus-supplies property for the I2C CCI controllers.
>
> > This is the option I'd vote for.
>
> Do these controllers actually have a supply called vbus?

No. It's a separate entity, a regulator-controller pull-up for the bus.
So far we'd like to hear better suggestions. Using regulator-always-on
doesn't sound like a good idea, it will increase unnecessary power
drain.

-- 
With best wishes
Dmitry
