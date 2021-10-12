Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5682A42AC2E
	for <lists+linux-arm-msm@lfdr.de>; Tue, 12 Oct 2021 20:51:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234777AbhJLSlJ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 12 Oct 2021 14:41:09 -0400
Received: from mail-wr1-f49.google.com ([209.85.221.49]:45035 "EHLO
        mail-wr1-f49.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234736AbhJLSlH (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 12 Oct 2021 14:41:07 -0400
Received: by mail-wr1-f49.google.com with SMTP id e3so163784wrc.11
        for <linux-arm-msm@vger.kernel.org>; Tue, 12 Oct 2021 11:38:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=+MzK5n1Jhif+mQxJnLglldcWXS1nPzxCkrew0qXtEOU=;
        b=qn1yIPH7igXgUYvJyNf+lMA5Na1WkDrCtZvVkXDSLw3RYsheB/SjL7h3oe/8VfJRM6
         swQ+pEZhKhXRLK0J7GjaKAw8HyX4RQL9VuhdDJTaw8WEEoFtv3LceihfxBKTEDW1wWlC
         sq9V5PZjA8G/NC1fEC2w00TP3lC+KxQbc7SSQhuj568escPq5duCyLxSNuCPu0umt3bs
         YfDykx8uhUghunO2sbCrnjf+oXClI/6o6kZHLmFv3fSsihcvO2EQKE2JcwNHjRoR6yjz
         e2QWFe5SRnH8cPWNhSD2oK2Xaj6RJsh4PJQqiZPF1BnGyCgSFE3qZOWMQfT9+yo4rqMt
         yGIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=+MzK5n1Jhif+mQxJnLglldcWXS1nPzxCkrew0qXtEOU=;
        b=v+2Tk4G6J7MUQYSTXvW7Vg9Q+jymyoPtYdT40qHja/FwRmScCzMoA9cNqgRyBwx8NK
         bw1qSn6hi8JvzKpKQOkXfLKfjpBqWXredL1XtGocQGaosQw4M/2gjDvMbvaQyAmIvVT8
         mt3Yez7as0a27uk22lVm4aHaFAd6OuzpWH9Ffn59V72zKfkJOKNVkBFW4xcgOCoy8dRo
         XSbmEuTO5AreEBtPGSWsK8H5e26KSqI33RhWJlliJHhXIm7czqb8N6or7BnBQjg8cSOs
         nPBdhk+cSKWEFGjsLUm0t5l94H1pJbNtB7cP2DshzPu8v6KzSlRVZYXewZpxcNqwmt5C
         TZGA==
X-Gm-Message-State: AOAM532MWFAVn1LXhUS6Z+E2vIVr5xmau80q/pOYU9FbbS6bGLnOqVCH
        cdZ32DZmjJuQF7Np4KpTzyDTD1gbO5sb6w==
X-Google-Smtp-Source: ABdhPJzE2frHKu4EaDqt6/zHRBoiXTrb/eEMPkovNnZJcaC+XoHGHrBMDZtJYnqBgCnZDk55XC5iow==
X-Received: by 2002:a7b:c4c8:: with SMTP id g8mr7525574wmk.101.1634063611193;
        Tue, 12 Oct 2021 11:33:31 -0700 (PDT)
Received: from google.com ([95.148.6.175])
        by smtp.gmail.com with ESMTPSA id c7sm4759799wmq.13.2021.10.12.11.33.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Oct 2021 11:33:30 -0700 (PDT)
Date:   Tue, 12 Oct 2021 19:33:28 +0100
From:   Lee Jones <lee.jones@linaro.org>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     Andy Gross <agross@kernel.org>, Rob Herring <robh+dt@kernel.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] mfd: qcom-spmi-pmic: Document eight more PMICs to
 binding
Message-ID: <YWXU+LDZowd4iXcW@google.com>
References: <20211005024812.2038249-1-bjorn.andersson@linaro.org>
 <YWWfkyoV0rF4C4PP@google.com>
 <YWXACBenQ4xrBZvY@builder.lan>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <YWXACBenQ4xrBZvY@builder.lan>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue, 12 Oct 2021, Bjorn Andersson wrote:

> On Tue 12 Oct 09:46 CDT 2021, Lee Jones wrote:
> 
> > On Mon, 04 Oct 2021, Bjorn Andersson wrote:
> > 
> > > Update the binding with eitght more SPMI PMIC compatibles found in the
> > 
> > Spell check.
> > 
> 
> Bummer...
> 
> > > PMIC info list in the Qualcomm socinfo driver.
> > > 
> > > Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
> > > ---
> > >  Documentation/devicetree/bindings/mfd/qcom,spmi-pmic.txt | 8 ++++++++
> > >  1 file changed, 8 insertions(+)
> > > 
> > > diff --git a/Documentation/devicetree/bindings/mfd/qcom,spmi-pmic.txt b/Documentation/devicetree/bindings/mfd/qcom,spmi-pmic.txt
> > > index 5ef79bf3d035..1d2b5f067556 100644
> > > --- a/Documentation/devicetree/bindings/mfd/qcom,spmi-pmic.txt
> > > +++ b/Documentation/devicetree/bindings/mfd/qcom,spmi-pmic.txt
> > > @@ -29,6 +29,8 @@ Required properties:
> > >                     "qcom,pm8916",
> > >                     "qcom,pm8004",
> > >                     "qcom,pm8909",
> > > +                   "qcom,pm8028",
> > > +                   "qcom,pm8901",
> > >                     "qcom,pm8950",
> > >                     "qcom,pmi8950",
> > >                     "qcom,pm8998",
> > > @@ -38,6 +40,12 @@ Required properties:
> > >                     "qcom,pmk8350",
> > >                     "qcom,pm7325",
> > >                     "qcom,pmr735a",
> > > +                   "qcom,pm8150",
> > > +                   "qcom,pm8150l",
> > > +                   "qcom,pm8150b",
> > > +                   "qcom,pmk8002",
> > > +                   "qcom,pm8150c",
> > > +                   "qcom,smb2351",
> > >                     or generalized "qcom,spmi-pmic".
> > >  - reg:             Specifies the SPMI USID slave address for this device.
> > >                     For more information see:
> > 
> > Is there any reason why these can't be in lexicographical order?
> > 
> 
> Definitely not, both this list and the list compatible list in the
> driver would be better of sorted. I just didn't want to sort and add the
> entries in a single commit.
> 
> Do you want me to respin this, adding two patches that sort the
> elements? Or will you fix my awesome spelling of 8 above and I send you
> the patches that shuffles the entries?

If you can fix the spelling and send the whole set, I'll apply it in
one go.

-- 
Lee Jones [李琼斯]
Senior Technical Lead - Developer Services
Linaro.org │ Open source software for Arm SoCs
Follow Linaro: Facebook | Twitter | Blog
