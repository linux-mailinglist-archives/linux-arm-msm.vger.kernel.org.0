Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 95D6D42AA45
	for <lists+linux-arm-msm@lfdr.de>; Tue, 12 Oct 2021 19:04:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232238AbhJLRGN (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 12 Oct 2021 13:06:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39016 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231717AbhJLRGN (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 12 Oct 2021 13:06:13 -0400
Received: from mail-ot1-x335.google.com (mail-ot1-x335.google.com [IPv6:2607:f8b0:4864:20::335])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3BEEBC061746
        for <linux-arm-msm@vger.kernel.org>; Tue, 12 Oct 2021 10:04:11 -0700 (PDT)
Received: by mail-ot1-x335.google.com with SMTP id u20-20020a9d7214000000b0054e170300adso110632otj.13
        for <linux-arm-msm@vger.kernel.org>; Tue, 12 Oct 2021 10:04:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=Gf0L13uSii7MojEsnWksglO0xsvhFpJcmZAlnq3Pg+E=;
        b=esGdid55ZR9bCKI/QbCUWRXJbIODKcncDyBVDLpTIC30LQz09Agm2+Dtwr0C5okmdb
         ctCca3LEC3jh5MJESKccL8D+yJdnQRdq+/BsuKUUCXLTp4lJTPq9dV8nX72MUobG0Ku0
         5cBZFrh0FCPNUoYZ322S58iUU+03vU33dLDT0M6s4hRVG11s9kOGDOQ7FPuYeo7JFnvc
         z3NFSmzQT6XmO4MQyTTNzXSp4l/IBkWpEbGyreM/U5exAQdwieALtgTRx5ZYgbCz75VR
         +xXgPz9g/CGK5dhRAnUUPWcVxjEQlMbZ3c/VTB66SnlaHlkRDu0cg3kIPUAFo1nnKYDK
         l/iA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=Gf0L13uSii7MojEsnWksglO0xsvhFpJcmZAlnq3Pg+E=;
        b=NmmmDJWcuMvZkG6OIb6iewhECmIKH+QcB/xBCLuVFp9bPbJxUXUe5H3Q2Fse30dPk6
         E5J1opxJ2jeEyUtX/yyKs2wZKwpZjdrH6MkOFHwdr9jSP7VK50KHyGOPK7n2amCgYS6/
         wrdyWu+x9gBdgPB4orkGvoSBzKHJlFiQkSVf+m8O/IfQf3B6f2oO/MoMMAqLcx+0zu1g
         G+9EKdObpsmlgyIXPODChCvrHJxLrFiNNZWLw+9av0zSbdYi2TxvBvbwSCl69ZdsOEj9
         Z8A6xYXum9hsCqcp7GmbjWszsERNQCQWdSIYLfItcN6CFty7ETupIcVnYY1UH7esPDOk
         nTog==
X-Gm-Message-State: AOAM533yP3Y8p7et6+kX7tSwCIFXEIMqRsy+6YtL9+aOqIKEDmFNrPd7
        eoJlpbfSPJzs3HZEqtiDcFzyNQ==
X-Google-Smtp-Source: ABdhPJz21Dp7s6QAAqXmbuotHmAyoTENKlHT9ql5SjsNnd3exHtLWbGEeHfu1fakREawJUYAyRg0JA==
X-Received: by 2002:a9d:4f1a:: with SMTP id d26mr25662931otl.65.1634058250501;
        Tue, 12 Oct 2021 10:04:10 -0700 (PDT)
Received: from builder.lan ([2600:1700:a0:3dc8:3697:f6ff:fe85:aac9])
        by smtp.gmail.com with ESMTPSA id h26sm905877oov.28.2021.10.12.10.04.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Oct 2021 10:04:10 -0700 (PDT)
Date:   Tue, 12 Oct 2021 12:04:08 -0500
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Lee Jones <lee.jones@linaro.org>
Cc:     Andy Gross <agross@kernel.org>, Rob Herring <robh+dt@kernel.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] mfd: qcom-spmi-pmic: Document eight more PMICs to
 binding
Message-ID: <YWXACBenQ4xrBZvY@builder.lan>
References: <20211005024812.2038249-1-bjorn.andersson@linaro.org>
 <YWWfkyoV0rF4C4PP@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YWWfkyoV0rF4C4PP@google.com>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue 12 Oct 09:46 CDT 2021, Lee Jones wrote:

> On Mon, 04 Oct 2021, Bjorn Andersson wrote:
> 
> > Update the binding with eitght more SPMI PMIC compatibles found in the
> 
> Spell check.
> 

Bummer...

> > PMIC info list in the Qualcomm socinfo driver.
> > 
> > Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
> > ---
> >  Documentation/devicetree/bindings/mfd/qcom,spmi-pmic.txt | 8 ++++++++
> >  1 file changed, 8 insertions(+)
> > 
> > diff --git a/Documentation/devicetree/bindings/mfd/qcom,spmi-pmic.txt b/Documentation/devicetree/bindings/mfd/qcom,spmi-pmic.txt
> > index 5ef79bf3d035..1d2b5f067556 100644
> > --- a/Documentation/devicetree/bindings/mfd/qcom,spmi-pmic.txt
> > +++ b/Documentation/devicetree/bindings/mfd/qcom,spmi-pmic.txt
> > @@ -29,6 +29,8 @@ Required properties:
> >                     "qcom,pm8916",
> >                     "qcom,pm8004",
> >                     "qcom,pm8909",
> > +                   "qcom,pm8028",
> > +                   "qcom,pm8901",
> >                     "qcom,pm8950",
> >                     "qcom,pmi8950",
> >                     "qcom,pm8998",
> > @@ -38,6 +40,12 @@ Required properties:
> >                     "qcom,pmk8350",
> >                     "qcom,pm7325",
> >                     "qcom,pmr735a",
> > +                   "qcom,pm8150",
> > +                   "qcom,pm8150l",
> > +                   "qcom,pm8150b",
> > +                   "qcom,pmk8002",
> > +                   "qcom,pm8150c",
> > +                   "qcom,smb2351",
> >                     or generalized "qcom,spmi-pmic".
> >  - reg:             Specifies the SPMI USID slave address for this device.
> >                     For more information see:
> 
> Is there any reason why these can't be in lexicographical order?
> 

Definitely not, both this list and the list compatible list in the
driver would be better of sorted. I just didn't want to sort and add the
entries in a single commit.

Do you want me to respin this, adding two patches that sort the
elements? Or will you fix my awesome spelling of 8 above and I send you
the patches that shuffles the entries?

Thanks,
Bjorn

> -- 
> Lee Jones [?????????]
> Senior Technical Lead - Developer Services
> Linaro.org ??? Open source software for Arm SoCs
> Follow Linaro: Facebook | Twitter | Blog
