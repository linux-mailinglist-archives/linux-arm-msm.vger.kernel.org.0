Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E9EC1391163
	for <lists+linux-arm-msm@lfdr.de>; Wed, 26 May 2021 09:27:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232617AbhEZH2n (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 26 May 2021 03:28:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49396 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232978AbhEZH2n (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 26 May 2021 03:28:43 -0400
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com [IPv6:2a00:1450:4864:20::32d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D9A88C06175F
        for <linux-arm-msm@vger.kernel.org>; Wed, 26 May 2021 00:27:10 -0700 (PDT)
Received: by mail-wm1-x32d.google.com with SMTP id u4-20020a05600c00c4b02901774b80945cso14886520wmm.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 26 May 2021 00:27:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=ObaRCurLGiq7gTkLKAKr3kEfw73h6AOzHDoeYUsp2Y0=;
        b=T5wfKDh1UNK2O7MTL704OyW6hZQCfSO1tuylHh4JSPnT877YqB1ydDB6ytMqNOUxCY
         6kxfi2+/1gDy4MLcllXACk1Z5v8VSnKiJtrFtUFXJCvfpPDG2PrC7u5noXl1jN/MLVg2
         5GmNoB1mV3X7wzHXWOcfkHaYPEs0QxGRQOAAEu8qIdTDjIEL2ZVjjIdxvWWk1zeLmSkJ
         thrb5d+FFDTx5ki6+DGMJbmxfE+332vAtMjvD+DYBVR2A/DV4cm60qTFetbftP9RUaRk
         a+XmH9Tog9yKXB2TnkVkPmRl3eqYjKRSGkua4HxCwRoEsIS0SOfZMqvYqWxuXjOK1IFz
         1G+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=ObaRCurLGiq7gTkLKAKr3kEfw73h6AOzHDoeYUsp2Y0=;
        b=Jlt3Gffk0ky5MAeXDrwqVNPm1H281wusj8PY0h0L87160jx+zXvOTsA6mRsGIm/xil
         w6+irZldp8o97tazP+7AehYIi6YdxAnIw8th65M9FLDlKjraL1DDcbei0i2Wr2jpvGra
         BEndE67U1X3G1KLeJdAotAr7lee112Vg+FEcluuxByz8SUm98wADyImhayIYNXGcm8zz
         3fPrbq8f5VvgtIWq1YIYc2V8tGNgu6q3t020TQx7GoE+4xrayYTSmiem2WGu66zUy2dy
         +7jUmzz2qtTzmkea4LJSvQ/oE8K12G2RyUrupEFPJ6/8KuJzGcrBQABX8zr6O5lZWE81
         oxqg==
X-Gm-Message-State: AOAM530F0mNmvxubSLtRIbNKLWxpffLd08vOGvE3q9wFfDjSxZxuYUlw
        flAvGYNbDj2VB1258X4NsSsPDg==
X-Google-Smtp-Source: ABdhPJzYn7l7izgDqJRiSF+iXahrCJQATc3NRCU+ROAee3TuBSNsuvVdyH8MND/tb7mi+q2kQEMCWQ==
X-Received: by 2002:a7b:c041:: with SMTP id u1mr26901132wmc.95.1622014029338;
        Wed, 26 May 2021 00:27:09 -0700 (PDT)
Received: from dell ([91.110.221.223])
        by smtp.gmail.com with ESMTPSA id l188sm505402wmf.27.2021.05.26.00.27.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 May 2021 00:27:08 -0700 (PDT)
Date:   Wed, 26 May 2021 08:27:07 +0100
From:   Lee Jones <lee.jones@linaro.org>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     satya priya <skakit@codeaurora.org>,
        Andy Gross <agross@kernel.org>,
        Rob Herring <robh+dt@kernel.org>, mka@chromium.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, kgunda@codeaurora.org
Subject: Re: [PATCH V5 11/11] mfd: qcom-spmi-pmic: Add support for four
 variants
Message-ID: <20210526072707.GF4005783@dell>
References: <1621937466-1502-1-git-send-email-skakit@codeaurora.org>
 <1621937466-1502-12-git-send-email-skakit@codeaurora.org>
 <YK0udV1Wbm4Hvk72@builder.lan>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <YK0udV1Wbm4Hvk72@builder.lan>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue, 25 May 2021, Bjorn Andersson wrote:

> On Tue 25 May 05:11 CDT 2021, satya priya wrote:
> 
> > Add support for pm8350c, pmk8350, pm7325 and pmr735a PMICS.
> > 
> 
> Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>
> 
> @Lee, will you take this patch through the mfd tree?

I will.

Not sure if Rob would like to review it too - it's pretty simple.

> > Signed-off-by: satya priya <skakit@codeaurora.org>
> > ---
> > Changes in V5:
> >  - Newly added in V5 to add documentation support for pmics of this series.
> > 
> >  Documentation/devicetree/bindings/mfd/qcom,spmi-pmic.txt | 4 ++++
> >  1 file changed, 4 insertions(+)
> > 
> > diff --git a/Documentation/devicetree/bindings/mfd/qcom,spmi-pmic.txt b/Documentation/devicetree/bindings/mfd/qcom,spmi-pmic.txt
> > index 79367a4..5ef79bf 100644
> > --- a/Documentation/devicetree/bindings/mfd/qcom,spmi-pmic.txt
> > +++ b/Documentation/devicetree/bindings/mfd/qcom,spmi-pmic.txt
> > @@ -34,6 +34,10 @@ Required properties:
> >                     "qcom,pm8998",
> >                     "qcom,pmi8998",
> >                     "qcom,pm8005",
> > +                   "qcom,pm8350c",
> > +                   "qcom,pmk8350",
> > +                   "qcom,pm7325",
> > +                   "qcom,pmr735a",
> >                     or generalized "qcom,spmi-pmic".
> >  - reg:             Specifies the SPMI USID slave address for this device.
> >                     For more information see:

-- 
Lee Jones [李琼斯]
Senior Technical Lead - Developer Services
Linaro.org │ Open source software for Arm SoCs
Follow Linaro: Facebook | Twitter | Blog
