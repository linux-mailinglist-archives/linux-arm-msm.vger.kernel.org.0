Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id ED2FC1B02E7
	for <lists+linux-arm-msm@lfdr.de>; Mon, 20 Apr 2020 09:27:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726136AbgDTH1c (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 20 Apr 2020 03:27:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40536 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726116AbgDTH1c (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 20 Apr 2020 03:27:32 -0400
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com [IPv6:2a00:1450:4864:20::443])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B35E2C061A41
        for <linux-arm-msm@vger.kernel.org>; Mon, 20 Apr 2020 00:27:31 -0700 (PDT)
Received: by mail-wr1-x443.google.com with SMTP id k11so10790201wrp.5
        for <linux-arm-msm@vger.kernel.org>; Mon, 20 Apr 2020 00:27:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=fLd3utKBUqircZ8XSU/jqQ1o3HOdiOgb+Til4epkr7E=;
        b=Zjs6lkCZP51RU1eaQIhcoO3FB2Z6jXmILC0s2D752dm7NvsQ+tleMbs3JgJ0uCOger
         E/tjxVQyBlWGd8C8KH6qKSy877jK0dOi4ouglmI3EUeSGLveLxJsg2RtwSK7UMdZjCHW
         wFmMR6P5iaO2QXH4ksbOgvB+J3KLMVx+AA8FAPieKGTfyyESTZnp60vvRq2mOL1n6k89
         exxFo80LcTgKlrntlkSIIORBACYyTzHdDPArnuLiOwJFPLXem/gn0Igo6JBXWNAODiUe
         tLRv8q8+adw+2X8p6HhK3S5Eako2xzmyRKxo0WGwjta/t8GubKM8ali0sa3m5En/fezW
         12VQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=fLd3utKBUqircZ8XSU/jqQ1o3HOdiOgb+Til4epkr7E=;
        b=ah8/rfzifZHlmd3woU2YQ2iPnQzd+/9cImvmVjD+d1Mo416iv1pGnoGdTvyUldomsS
         SZmySoklb54PgwOP9IRB0h3k24IM6fF7eBxkornya1nRsR4KEneNbZnhO0crqK2k/+4Q
         GCJZ6DZXjYV+G+SThDpYLvjDPxlSf4MiMq1o04Ongq3ouvbQQOkvoTXcCtzXojF2HBcn
         rWJFjTKaebAF8hSjxP8nUZFmaiuuCLef16Dh20kgg3ONhnIZxoDq5Q/k0moN0neUR/SZ
         MUl5J6fOoymCuFaKFH3wI9p7GjcEVv0gbLswQrEtIp+aGSzYJtlcqGT/8j8hs5zKih1b
         zZig==
X-Gm-Message-State: AGi0PuZosNiOT8mUghBeK3PVsAdOpkd1nGOpg1sF9aHEL8DNF7nmFZ2x
        akMgsXteFZ2NIA5be4l+aotXNA==
X-Google-Smtp-Source: APiQypLZ95duN0TVR/SeVUQItXdNoeinc7W1AvPfKzE2PNLYi2bchw8ulFVhIRvX/oUlL+29V+w4Lg==
X-Received: by 2002:a5d:5224:: with SMTP id i4mr17175368wra.1.1587367650264;
        Mon, 20 Apr 2020 00:27:30 -0700 (PDT)
Received: from dell ([95.149.164.107])
        by smtp.gmail.com with ESMTPSA id v16sm188543wml.30.2020.04.20.00.27.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Apr 2020 00:27:29 -0700 (PDT)
Date:   Mon, 20 Apr 2020 08:27:27 +0100
From:   Lee Jones <lee.jones@linaro.org>
To:     kgunda@codeaurora.org
Cc:     Rob Herring <robh@kernel.org>, bjorn.andersson@linaro.org,
        jingoohan1@gmail.com, b.zolnierkie@samsung.com,
        dri-devel@lists.freedesktop.org, daniel.thompson@linaro.org,
        jacek.anaszewski@gmail.com, pavel@ucw.cz, mark.rutland@arm.com,
        linux-leds@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Dan Murphy <dmurphy@ti.com>,
        linux-arm-msm@vger.kernel.org,
        Subbaraman Narayanamurthy <subbaram@codeaurora.org>
Subject: Re: [PATCH V5 1/4] backlight: qcom-wled: convert the wled bindings
 to .yaml format
Message-ID: <20200420072727.GI3737@dell>
References: <1586274430-28402-1-git-send-email-kgunda@codeaurora.org>
 <1586274430-28402-2-git-send-email-kgunda@codeaurora.org>
 <20200415150904.GA11174@bogus>
 <557e8bd874256271174402b5faba9c90@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <557e8bd874256271174402b5faba9c90@codeaurora.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Fri, 17 Apr 2020, kgunda@codeaurora.org wrote:

> On 2020-04-15 20:39, Rob Herring wrote:
> > On Tue, Apr 07, 2020 at 09:17:07PM +0530, Kiran Gunda wrote:
> > > Convert the qcom-wled bindings from .txt to .yaml format.
> > > Also replace PM8941 to WLED3 and PMI8998 to WLED4.
> > > 
> > > Signed-off-by: Kiran Gunda <kgunda@codeaurora.org>
> > > Signed-off-by: Subbaraman Narayanamurthy <subbaram@codeaurora.org>
> > > Acked-by: Daniel Thompson <daniel.thompson@linaro.org>
> > > ---
> > >  .../bindings/leds/backlight/qcom-wled.txt          | 154
> > > ----------------
> > >  .../bindings/leds/backlight/qcom-wled.yaml         | 201
> > > +++++++++++++++++++++
> > >  2 files changed, 201 insertions(+), 154 deletions(-)
> > >  delete mode 100644
> > > Documentation/devicetree/bindings/leds/backlight/qcom-wled.txt
> > >  create mode 100644
> > > Documentation/devicetree/bindings/leds/backlight/qcom-wled.yaml
[...]

> > > +        interrupt-names:
> > > +          items:
> > > +            - const: ovp
> > > +            - const: short
> > 
> > Move these 2 props to the main section adding a 'minItems: 1'. Then just
> > define 'minItems: 2' here and 'maxItems: 1' in the 'then' clause.
> > 
> > > +
> > > +required:
> > > +  - compatible
> > > +  - reg
> > > +  - label
> > 
> > Add:
> > 
> > additionalProperties: false
> > 
> > > +
> > > +examples:
> > > +  - |
> > > +    backlight@d800 {
> > > +        compatible = "qcom,pm8941-wled";
> > > +        reg = <0xd800 0x100>;
> > > +        label = "backlight";
> > > +
> > > +        qcom,cs-out;
> > > +        qcom,current-limit = <20>;
> > > +        qcom,current-boost-limit = <805>;
> > > +        qcom,switching-freq = <1600>;
> > > +        qcom,ovp = <29>;
> > > +        qcom,num-strings = <2>;
> > > +        qcom,enabled-strings = <0 1>;
> > > +     };
> Thanks for reviewing. I will submit the next revision with all the fixes.

Please trim your replies.

Also, if you agree with all of the review comments, there really is no
need to reply and/or thank the reviewer.  Simply submit a subsequent
set with a bumped version indicator.

-- 
Lee Jones [李琼斯]
Linaro Services Technical Lead
Linaro.org │ Open source software for ARM SoCs
Follow Linaro: Facebook | Twitter | Blog
