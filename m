Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B8FD74B4103
	for <lists+linux-arm-msm@lfdr.de>; Mon, 14 Feb 2022 05:57:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233588AbiBNE5J (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 13 Feb 2022 23:57:09 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:41776 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232176AbiBNE5I (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 13 Feb 2022 23:57:08 -0500
Received: from mail-oo1-xc35.google.com (mail-oo1-xc35.google.com [IPv6:2607:f8b0:4864:20::c35])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B67F251320
        for <linux-arm-msm@vger.kernel.org>; Sun, 13 Feb 2022 20:57:00 -0800 (PST)
Received: by mail-oo1-xc35.google.com with SMTP id u25-20020a4ad0d9000000b002e8d4370689so18057820oor.12
        for <linux-arm-msm@vger.kernel.org>; Sun, 13 Feb 2022 20:57:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=W3k5zzusyfmXH+0ijprZwALJFhBrMH89zfqIbl/b+Cs=;
        b=OtwaZPcpMwZiYR3zL85kTdlA5BG7zQ5KIY4cq5oxg6/knim6wi27MmzsSVUzdkYlT+
         9fElyZwlE8rDiKaVzIW4ajiWECZP3A4XZTv/pI7qu3yNfoiaQvqbYtqu7CRp5lBGoRyv
         VPmAmn76ndOyiH/XoLf0g0JE0xiitOxPP2+PZDPWXbzyFLJcNh1rhmtWNLivt4XMaX/o
         4R4RM+NopwdCuyUTph4ujM580SfWun1ZbpwHvAy60CqmvUotU58qp7sXw7wFNRoT2QvI
         xVv4KO5SSPpsTnes4JUYdVdvh/10gR6zAM0/qMXhNGxAOTa0wXDToGZRjxbNfF4tSXqr
         dFlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=W3k5zzusyfmXH+0ijprZwALJFhBrMH89zfqIbl/b+Cs=;
        b=A7Ocau0onmr+IzPuKQR1yt3IjRBW/UEuEdk8kqEFZwLykPq9tiMtRK9YY8lt0/gawU
         2mARPMbEj7LMtj6lsuU9dzw5TEr/aoGYwuz5r+SgwpHeQmrK1runP+6O9DpDgd7eq4Zw
         T584U0KYP3Rdjom9RoT7GK+WlhwD9OMwcaOUSrzeSZtd530pXXI1xAJU4k95qEW5+Mkq
         tR5L4gmceXysnwfkdwdbhfOPgn+P262Pa3HQybo3rnD3wrVLky/7QGIsmFzdW5rgVR1V
         RJTvcfSI2mJbLYTRbmu/zSDICiZUuDZ48vkBnBQQdk+fpT3A15SVmAZvzC54JHY24Cwz
         Hvww==
X-Gm-Message-State: AOAM530a8NmM+XOSRbW77XsrpYUvzN1TVcV0i2Micz/M5WoQWpVHZ2a3
        zTujPZMAiMHptzEq9eaa+h00zQ==
X-Google-Smtp-Source: ABdhPJxZNoMRt/d77axd4FwIogpjRw7JYlXj4Dqw+q0pO8sRnkMlp/qaxCxi4j8RIZDli6u+YvRRSA==
X-Received: by 2002:a05:6870:1194:: with SMTP id 20mr1240567oau.148.1644814619991;
        Sun, 13 Feb 2022 20:56:59 -0800 (PST)
Received: from ripper ([2600:1700:a0:3dc8:205:1bff:fec0:b9b3])
        by smtp.gmail.com with ESMTPSA id s3sm12778139ois.19.2022.02.13.20.56.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 13 Feb 2022 20:56:59 -0800 (PST)
Date:   Sun, 13 Feb 2022 20:59:11 -0800
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Luca Weiss <luca@z3ntu.xyz>
Cc:     linux-arm-msm@vger.kernel.org,
        ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        Vladimir Lypak <vladimir.lypak@gmail.com>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Andy Gross <agross@kernel.org>,
        Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 13/15] arm64: dts: qcom: Add MSM8953+PM8953 device tree
Message-ID: <Ygnhn54Tl6qYzKv/@ripper>
References: <20220112194118.178026-1-luca@z3ntu.xyz>
 <20220112194118.178026-14-luca@z3ntu.xyz>
 <YfhlCkb3XUvU8ae1@builder.lan>
 <2497719.tdWV9SEqCh@g550jk>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <2497719.tdWV9SEqCh@g550jk>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Sun 13 Feb 12:25 PST 2022, Luca Weiss wrote:

> Hi Bjorn,
> 
> On Montag, 31. Jänner 2022 23:39:06 CET Bjorn Andersson wrote:
> > On Wed 12 Jan 13:41 CST 2022, Luca Weiss wrote:
> > > From: Vladimir Lypak <vladimir.lypak@gmail.com>
> > > 
> > > The combination MSM8953 + PM8953 is commonly used, so add a
> > > device tree where common power supplies etc. can be configured.
> > > 
> > > Signed-off-by: Vladimir Lypak <vladimir.lypak@gmail.com>
> > > Signed-off-by: Luca Weiss <luca@z3ntu.xyz>
> > > Reviewed-by: Konrad Dybcio <konrad.dybcio@somainline.org>
> > 
> > I would prefer if we stick with the current scheme and just push this
> > into the device dts (or possibly some vendor-common dtsi if that's
> > applicable).
> > 
> > Simply just to follow what we do on other platforms.
> 
> Sure, will do in v2.
> 
> > 
> > 
> > PS. I see some patches has been applied, but as you resubmit this
> > series please split it per maintainer to make it obvious to each
> > maintainer that they should pick their part(s).
> 
> What do you mean by this? Send one series per maintainer? Or something else? 
> 

Yes, that's what I'm suggesting.

> Currently when making the patches I don't really "care" about who maintains 
> what, my git send-email setup picks the relevant people for CC.
> 

You technically don't have to care, but as it's not always obvious to a
maintainer if he/she can take the patches destined for their subsystem
it's easy that things ends up sitting on the list for longer than
necessary.

So you're making yourself a favour of splitting things that aren't
dependent as you send it out.

> Sometimes there's also multiple maintainers/trees listed for one file, not sure 
> what to do there... 
> 

Your current approach works, above is just a suggestion of how to make
it easier for the maintainers, which will help you to get your patches
land faster.

Regards,
Bjorn

> Regards
> Luca
> 
> > 
> > Thanks,
> > Bjorn
> > 
> > > ---
> > > 
> > >  arch/arm64/boot/dts/qcom/msm8953-pm8953.dtsi | 50 ++++++++++++++++++++
> > >  1 file changed, 50 insertions(+)
> > >  create mode 100644 arch/arm64/boot/dts/qcom/msm8953-pm8953.dtsi
> > > 
> > > diff --git a/arch/arm64/boot/dts/qcom/msm8953-pm8953.dtsi
> > > b/arch/arm64/boot/dts/qcom/msm8953-pm8953.dtsi new file mode 100644
> > > index 000000000000..b5f20fc9488e
> > > --- /dev/null
> > > +++ b/arch/arm64/boot/dts/qcom/msm8953-pm8953.dtsi
> > > @@ -0,0 +1,50 @@
> > > +// SPDX-License-Identifier: BSD-3-Clause
> > > +/* Copyright (c) 2022, The Linux Foundation. All rights reserved. */
> > > +
> > > +#include "msm8953.dtsi"
> > > +#include "pm8953.dtsi"
> > > +
> > > +&hsusb_phy {
> > > +	vdd-supply = <&pm8953_l3>;
> > > +	vdda-pll-supply = <&pm8953_l7>;
> > > +	vdda-phy-dpdm-supply = <&pm8953_l13>;
> > > +};
> > > +
> > > +&sdhc_1 {
> > > +	vmmc-supply = <&pm8953_l8>;
> > > +	vqmmc-supply = <&pm8953_l5>;
> > > +};
> > > +
> > > +&sdhc_2 {
> > > +	vmmc-supply = <&pm8953_l11>;
> > > +	vqmmc-supply = <&pm8953_l12>;
> > > +};
> > > +
> > > +&rpm_requests {
> > > +	smd_rpm_regulators: pm8953-regulators {
> > > +		compatible = "qcom,rpm-pm8953-regulators";
> > > +
> > > +		pm8953_s1: s1 {};
> > > +		pm8953_s3: s3 {};
> > > +		pm8953_s4: s4 {};
> > > +
> > > +		pm8953_l1: l1 {};
> > > +		pm8953_l2: l2 {};
> > > +		pm8953_l3: l3 {};
> > > +		pm8953_l5: l5 {};
> > > +		pm8953_l6: l6 {};
> > > +		pm8953_l7: l7 {};
> > > +		pm8953_l8: l8 {};
> > > +		pm8953_l9: l9 {};
> > > +		pm8953_l10: l10 {};
> > > +		pm8953_l11: l11 {};
> > > +		pm8953_l12: l12 {};
> > > +		pm8953_l13: l13 {};
> > > +		pm8953_l15: l15 {};
> > > +		pm8953_l16: l16 {};
> > > +		pm8953_l17: l17 {};
> > > +		pm8953_l19: l19 {};
> > > +		pm8953_l22: l22 {};
> > > +		pm8953_l23: l23 {};
> > > +	};
> > > +};
> 
> 
> 
> 
