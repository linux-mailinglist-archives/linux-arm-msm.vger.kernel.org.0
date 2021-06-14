Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4245E3A6BCB
	for <lists+linux-arm-msm@lfdr.de>; Mon, 14 Jun 2021 18:29:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234698AbhFNQbr (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 14 Jun 2021 12:31:47 -0400
Received: from mail-ot1-f53.google.com ([209.85.210.53]:33568 "EHLO
        mail-ot1-f53.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234651AbhFNQbr (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 14 Jun 2021 12:31:47 -0400
Received: by mail-ot1-f53.google.com with SMTP id o17-20020a9d76510000b02903eabfc221a9so11436368otl.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 14 Jun 2021 09:29:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=9CIY8AjuCRy8RieSStx5nb9rNTU57wmjgQb3HVjK27U=;
        b=i663WzaVYh9vcq7ceJqDlWbmey3o6O+WEhi7etvgrLnxsxi8f9kgk9mEDBtlC4Piyy
         7LteFPw1qcz5tkTdJK6vZi1eGrQ91DeQPPH4DWVoTFJ7lipp6uuWFs04mr4qJYjZkhC8
         fDaF0llrx66733fzl44DMSzDRNRjYyaPVXt+hEmldEFM/I3fzU0FgcGx2g3i0dp8hdlb
         Rd7qiOi8MEDfHAuuDyRhwywrohKyktaISRVuR1BVp3URCDxR6LUex6I09mb3eVb2rh0L
         UUWgIKKRnYlVihuCna31RI/TsnF0ger4VBYtMDUjeRv0o6Urogy4ogDh+m8jnO3swO+3
         t4Jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=9CIY8AjuCRy8RieSStx5nb9rNTU57wmjgQb3HVjK27U=;
        b=BN4KU5fy89R2hh4gr1KjbihXLHL+e1wdHXjthWQVb7Tt40zq0/lVecIyWt8A84CsNO
         HqAQK+lihHtksVlySmAcanSIvHBebs6hnNzObHLbGAk97YRreVQeIn1NmVB4QTyvtIr9
         W9hehTzFsVCOkhZZyrAzAKk7T6NYyv7JuW1j936/Hvezqy+nT0r0sQuR59pEfWaXg08P
         y2ZROscJWc+TNXAhm13kvamP6zDkAxwierQRbV4VYnXhv3jrTYpu33BszRzffBbJlMit
         f82tMDtF5HvTaPzHTagH3Eu9MJGjLiZPz+9m9F5KB82KBD+nMUuJ3OM18xe9+JSHQPaS
         OWtA==
X-Gm-Message-State: AOAM532ASDH41ZnDhpT0oS2I/8w7SWD3dwO6fodYBZBOf/EaBWXKobXi
        +7WFIlBkkV6PIE7c+sBg5YBEhA==
X-Google-Smtp-Source: ABdhPJwIXsrftnZxjGMjBdTiMtowSy+ltDxlxiwm7UMHVPBGyAbeWkXvt8Fplt0tpJ3QCoiJRkhHYg==
X-Received: by 2002:a9d:491:: with SMTP id 17mr14139894otm.184.1623688124306;
        Mon, 14 Jun 2021 09:28:44 -0700 (PDT)
Received: from yoga (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id w186sm3058210oib.58.2021.06.14.09.28.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Jun 2021 09:28:43 -0700 (PDT)
Date:   Mon, 14 Jun 2021 11:28:41 -0500
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Bhupesh Sharma <bhupesh.sharma@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org,
        Linus Walleij <linus.walleij@linaro.org>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>, Vinod Koul <vkoul@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Andy Gross <agross@kernel.org>,
        devicetree <devicetree@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        bhupesh.linux@gmail.com
Subject: Re: [PATCH 1/8] dt-bindings: qcom: rpmh-regulator: Add compatible
 for SA8155p-adp board pmics
Message-ID: <YMeDuToX+YG8CJEa@yoga>
References: <20210607113840.15435-1-bhupesh.sharma@linaro.org>
 <20210607113840.15435-2-bhupesh.sharma@linaro.org>
 <YMLO56Rr7UGUy8vo@builder.lan>
 <CAH=2NtyV=qMn32d9nE7qBheTscUejF1UwVZSc99uiv_P65S03Q@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAH=2NtyV=qMn32d9nE7qBheTscUejF1UwVZSc99uiv_P65S03Q@mail.gmail.com>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Mon 14 Jun 03:05 CDT 2021, Bhupesh Sharma wrote:

> Hello Bjorn,
> 
> Thanks for the review comments.
> 
> On Fri, 11 Jun 2021 at 08:18, Bjorn Andersson
> <bjorn.andersson@linaro.org> wrote:
> >
> > On Mon 07 Jun 06:38 CDT 2021, Bhupesh Sharma wrote:
> >
> > > Add compatible strings for pmm8155au_1 and pmm8155au_2 pmics
> > > found on SA8155p-adp board.
> > >
> > > Cc: Linus Walleij <linus.walleij@linaro.org>
> > > Cc: Liam Girdwood <lgirdwood@gmail.com>
> > > Cc: Mark Brown <broonie@kernel.org>
> > > Cc: Bjorn Andersson <bjorn.andersson@linaro.org>
> > > Cc: Vinod Koul <vkoul@kernel.org>
> > > Cc: Rob Herring <robh+dt@kernel.org>
> > > Cc: Andy Gross <agross@kernel.org>
> > > Cc: devicetree@vger.kernel.org
> > > Cc: linux-kernel@vger.kernel.org
> > > Cc: linux-gpio@vger.kernel.org
> > > Cc: bhupesh.linux@gmail.com
> > > Signed-off-by: Bhupesh Sharma <bhupesh.sharma@linaro.org>
> > > ---
> > >  .../devicetree/bindings/regulator/qcom,rpmh-regulator.yaml      | 2 ++
> > >  1 file changed, 2 insertions(+)
> > >
> > > diff --git a/Documentation/devicetree/bindings/regulator/qcom,rpmh-regulator.yaml b/Documentation/devicetree/bindings/regulator/qcom,rpmh-regulator.yaml
> > > index e561a5b941e4..ea5cd71aa0c7 100644
> > > --- a/Documentation/devicetree/bindings/regulator/qcom,rpmh-regulator.yaml
> > > +++ b/Documentation/devicetree/bindings/regulator/qcom,rpmh-regulator.yaml
> > > @@ -55,6 +55,8 @@ properties:
> > >        - qcom,pm8009-1-rpmh-regulators
> > >        - qcom,pm8150-rpmh-regulators
> > >        - qcom,pm8150l-rpmh-regulators
> > > +      - qcom,pmm8155au-1-rpmh-regulators
> > > +      - qcom,pmm8155au-2-rpmh-regulators
> >
> > Looking at the component documentation and the schematics I think the
> > component is "PMM8155AU" and we have two of them.
> >
> > Unless I'm mistaken we should have the compatible describe the single
> > component and we should have DT describe the fact that we have 2 of
> > them.
> 
> If we refer to the PM8155AU device specifications, there are two
> regulators mentioned there PMM8155AU_1 and PMM8155AU_2. Although most
> parameters of the regulators seem similar the smps regulator summary
> for both appear different (Transient Load, mA ratings etc).
> 
> Although most of these differences don't probably matter to the Linux
> world, others like the gpios on the pmic are different.
> 
> So, IMO, it makes sense to mention the different pmic types on the board.
> 
> Please let me know your views on the same.
> 

Afaict, they are both physically the same component, but there is some
configuration differences between them. I don't see any differences that
will show up in Linux, but afaict we would capture those in the DT
anyways.

Let me know if you see anything I'm missing, but I think we should have
a single compatible.

Regards,
Bjorn

> Thanks,
> Bhupesh
> 
> >
> > >        - qcom,pm8350-rpmh-regulators
> > >        - qcom,pm8350c-rpmh-regulators
> > >        - qcom,pm8998-rpmh-regulators
> > > --
> > > 2.31.1
> > >
