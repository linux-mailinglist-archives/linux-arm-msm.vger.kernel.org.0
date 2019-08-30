Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id AAEB4A3B16
	for <lists+linux-arm-msm@lfdr.de>; Fri, 30 Aug 2019 17:55:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728093AbfH3Pzk (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 30 Aug 2019 11:55:40 -0400
Received: from mail-pg1-f195.google.com ([209.85.215.195]:34603 "EHLO
        mail-pg1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728117AbfH3Pzj (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 30 Aug 2019 11:55:39 -0400
Received: by mail-pg1-f195.google.com with SMTP id n9so3768583pgc.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 30 Aug 2019 08:55:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=message-id:mime-version:content-transfer-encoding:in-reply-to
         :references:cc:subject:to:from:user-agent:date;
        bh=k6Dxd85KwIwNu5WFF2tT64CAPd/DYpSO5fdfBDFg7GU=;
        b=S5qbrM5gPf2x9uK/Eo2lo06mXjTKn3hbUNHcIY4qU8ukD4NW2tD4jeCK/EstX4U53W
         c4cRGnGohdYxife6HVJSiZnuwSqg//QxDuQwiE7K+7MVm+6pZBo3GhLHOFh+dW4FdXwd
         OKmfZHI2k8iQm0UDRn+WdD8cVazF6sCYFsOQU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:mime-version
         :content-transfer-encoding:in-reply-to:references:cc:subject:to:from
         :user-agent:date;
        bh=k6Dxd85KwIwNu5WFF2tT64CAPd/DYpSO5fdfBDFg7GU=;
        b=AkAtK1mO/wcfZxdQxbFtehRSbmPgqlI7kzwNX+EE1gKGj0H9xs9iC5n4hy5GeKonoE
         zB8rFlOBjDZb5CzX9/VWAW9gOZeLddCLM1CDos6uVs7Clbin6swNhLNJCMgS3f76Q+Vq
         c1oBiQPmBHcfZsR1ALfU2uAq1GCAlLSOLiaYGp6SfkdLWa5hvr4QKLCgJBHOO9rqKFKJ
         DQAfzVSnAP9YE6C5f+i/HRyENGK99NnzZai9tenJ6XwqTHqRiWZRctkQRWOGoN59usKh
         Bd3xFvBPMT6JU4Mtsu3RRGvWx68Sgmb6W/f54v/DOm7rVOg6lCnCQkYTwrsyfWEWZfgm
         s7KQ==
X-Gm-Message-State: APjAAAUHFoN0VFWJC9ZiljQ36oAhypGkHPx0ZzCftJ0QV85XCB9LMktw
        E32Rv4+78kk9bXWF0+VBClYYuw==
X-Google-Smtp-Source: APXvYqybFyMqAGX/6/N4aQQxP1BFIP6ngtzqj/mFI8XAkZsmjEEuuQAleFFpnwf7OgBsHK6zhEs8Iw==
X-Received: by 2002:a62:3681:: with SMTP id d123mr18860617pfa.147.1567180538822;
        Fri, 30 Aug 2019 08:55:38 -0700 (PDT)
Received: from chromium.org ([2620:15c:202:1:fa53:7765:582b:82b9])
        by smtp.gmail.com with ESMTPSA id k5sm10653817pfg.167.2019.08.30.08.55.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Aug 2019 08:55:38 -0700 (PDT)
Message-ID: <5d6946fa.1c69fb81.44ab7.8d72@mx.google.com>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <CAHLCerMmBmS-59eywxkUJ+5-zSccx8Twx2=NELgBgShYhM7TOw@mail.gmail.com>
References: <cover.1566907161.git.amit.kucheria@linaro.org> <66ac3d3707d6296ef85bf1fa321f7f1ee0c02131.1566907161.git.amit.kucheria@linaro.org> <5d65cbe9.1c69fb81.1ceb.2374@mx.google.com> <CAP245DWWKsZBHnvSqC40XOH48kGd-hykd+fr-UZfWTmvuG2KaA@mail.gmail.com> <5d67e6cf.1c69fb81.5aec9.3b71@mx.google.com> <CAP245DVjgnwGn5rUgbYrkBOi3vtyShz0Qbx_opx80xiOV7uXeA@mail.gmail.com> <CAHLCerMmBmS-59eywxkUJ+5-zSccx8Twx2=NELgBgShYhM7TOw@mail.gmail.com>
Cc:     Daniel Lezcano <daniel.lezcano@linaro.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Rob Herring <robh+dt@kernel.org>,
        Zhang Rui <rui.zhang@intel.com>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Eduardo Valentin <edubezval@gmail.com>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Marc Gonzalez <marc.w.gonzalez@free.fr>,
        Brian Masney <masneyb@onstation.org>,
        Linux PM list <linux-pm@vger.kernel.org>,
        DTML <devicetree@vger.kernel.org>
Subject: Re: [PATCH v2 07/15] dt: thermal: tsens: Document interrupt support in tsens driver
To:     Amit Kucheria <amit.kucheria@linaro.org>
From:   Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.8.1
Date:   Fri, 30 Aug 2019 08:55:37 -0700
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Amit Kucheria (2019-08-30 04:32:54)
> On Thu, Aug 29, 2019 at 10:04 PM Amit Kucheria <amit.kucheria@linaro.org>=
 wrote:
> >
> > On Thu, Aug 29, 2019 at 8:23 PM Stephen Boyd <swboyd@chromium.org> wrot=
e:
> > >
> > > Can we get a known quantity of interrupts for a particular compatible
> > > string instead? Let's be as specific as possible. The index matters t=
oo,
> > > so please list them in the order that is desired.
> >
> > I *think* we can predict what platforms have uplow and critical
> > interrupts based on IP version currently[1]. For newer interrupt
> > types, we might need more fine-grained platform compatibles.
> >
> > [1] Caveat: this is based only on the list of platforms I've currently
> > looked at, there might be something internally that breaks these
> > rules.
>=20
> What do you think if we changed the wording to something like the followi=
ng,
>=20
> - interrupt-names: Must be one of the following depending on IP version:
>    For compatibles qcom,msm8916-tsens, qcom,msm8974-tsens,
> qcom,qcs404-tsens, qcom,tsens-v1, use
>               interrupt-names =3D "uplow";
>    For compatibles qcom,msm8996-tsens, qcom,msm8998-tsens,
> qcom,sdm845-tsens, qcom,tsens-v2, use
>               interrupt-names =3D "uplow", "critical";

Ok. I would still prefer YAML/JSON schema for this binding so that it's
much more explicit about numbers and the order of interrupts, etc.

