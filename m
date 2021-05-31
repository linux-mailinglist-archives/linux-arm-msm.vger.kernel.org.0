Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6BBEB396754
	for <lists+linux-arm-msm@lfdr.de>; Mon, 31 May 2021 19:45:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233525AbhEaRqk (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 31 May 2021 13:46:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57842 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233301AbhEaRqY (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 31 May 2021 13:46:24 -0400
Received: from mail-oi1-x22f.google.com (mail-oi1-x22f.google.com [IPv6:2607:f8b0:4864:20::22f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 22D5AC09C382
        for <linux-arm-msm@vger.kernel.org>; Mon, 31 May 2021 10:11:42 -0700 (PDT)
Received: by mail-oi1-x22f.google.com with SMTP id s19so12881209oic.7
        for <linux-arm-msm@vger.kernel.org>; Mon, 31 May 2021 10:11:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=x2aDW9EZI5H5rRyb3O7lG0UEKmsbbDC0cZ5mlHu0sWA=;
        b=vlFD3psaHKdwHbxcxpah7p1ZiYQflx73XsKNMOXKrj8oQSsRaY5+6pGihIGwVNQ1F5
         S7D+rLEE2tlYzlTT9tTiil6GUx/MWJifE1nkzfXIY8g46ah2fHNMZrPdkNHl/Nl/rRV3
         uwzhNOd7b+86uNajrR+NBFAPJotTrgMxCIaDprF0OcL0lyLSfO6ceh/+78u992uHWEVJ
         ZV36cDu8AqHka9uZftP6rZezHcChphAuEV+3xmz6bCxr9qnd5cWk5oqVBjon1xdgxx/g
         TGOpyqP03TqKdk3prNUGwV+Dhq2qthzyy04nn5Xm3aeajCmHmNCnfEU+llUcjcyVmOrw
         35Sg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=x2aDW9EZI5H5rRyb3O7lG0UEKmsbbDC0cZ5mlHu0sWA=;
        b=gAc00Gbztl00IUvTFbJBYLYnBDLiCG8yzXe5dLH41MF0KPm9SHth+nxl1JJ5E/FNcn
         QQGCPaFes/BzCXbTZmjkkxOUVmnsPxwAadPvwB5EjNu+ofZv3XG4gm+Of3CVElSSFEl1
         JPYmyL+95uVVuEDncSQtpRyn1CHr0oT5oo5js0XQDDJEXSefI/zmg1sUZ/5UUsUuE32U
         QYzt38OvZhbGi753guMoZXPlDuAxeBIyelKroWL9I4kPq0MnyParhkz4S0srYnFxRFgC
         LYhQ5T7MkBs1DOgmg7sVyDIkQnfEYvwd9PFBDftRpcesmjzr/6d6Uib3uUpLAiAkcpVq
         2AcA==
X-Gm-Message-State: AOAM533HOD9jAKtXzjPrX062GZHuLd4qEwBDoL3sjfBgOjZIS24NVxQi
        jfP/gqWdjzLSMR8SrUukg4gPDg==
X-Google-Smtp-Source: ABdhPJydnirQBauTUayDNSbvt9C25z4tHxFOCcP1Z9XVlVhUkbK/KQEaaNHjaLfuKCI5Egi32LuVjA==
X-Received: by 2002:a54:450a:: with SMTP id l10mr15020983oil.135.1622481101436;
        Mon, 31 May 2021 10:11:41 -0700 (PDT)
Received: from builder.lan (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id m189sm2853465oif.45.2021.05.31.10.11.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 May 2021 10:11:41 -0700 (PDT)
Date:   Mon, 31 May 2021 12:11:39 -0500
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Petr Vorel <petr.vorel@gmail.com>
Cc:     linux-arm-msm@vger.kernel.org, Andy Gross <agross@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Ricardo Ribalda <ribalda@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Konrad Dybcio <konradybcio@gmail.com>,
        devicetree@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@somainline.org>
Subject: Re: [PATCH v4 1/1] arm64: dts: qcom: msm8994-angler: Fix
 gpio-reserved-ranges 85-88
Message-ID: <YLUYy8AwNnqMm/c3@builder.lan>
References: <20210415193913.1836153-1-petr.vorel@gmail.com>
 <YLUVARo3FoQ1LHTP@pevik>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YLUVARo3FoQ1LHTP@pevik>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Mon 31 May 11:55 CDT 2021, Petr Vorel wrote:

> Hi,
> 
> ping please. Anything block this to get merged?
> 

Applied.

Thanks,
Bjorn

> Kind regards,
> Petr
> 
> > Reserve GPIO pins 85-88 as these aren't meant to be accessible from the
> > application CPUs (causes reboot). Yet another fix similar to
> > 9134586715e3, 5f8d3ab136d0, which is needed to allow angler to boot after
> > 3edfb7bd76bd ("gpiolib: Show correct direction from the beginning").
> 
> > Fixes: feeaf56ac78d ("arm64: dts: msm8994 SoC and Huawei Angler (Nexus 6P) support")
> 
> > Signed-off-by: Petr Vorel <petr.vorel@gmail.com>
> > Reviewed-by: Konrad Dybcio <konrad.dybcio@somainline.org>
> > ---
> > Changes v3->v4:
> > * Fix patch title
> 
> > Sorry for so much noise with this simple patch.
> 
> > Kind regards,
> > Petr
> 
> >  arch/arm64/boot/dts/qcom/msm8994-angler-rev-101.dts | 4 ++++
> >  1 file changed, 4 insertions(+)
> 
> > diff --git a/arch/arm64/boot/dts/qcom/msm8994-angler-rev-101.dts b/arch/arm64/boot/dts/qcom/msm8994-angler-rev-101.dts
> > index baa55643b40f..ffe1a9bd8f70 100644
> > --- a/arch/arm64/boot/dts/qcom/msm8994-angler-rev-101.dts
> > +++ b/arch/arm64/boot/dts/qcom/msm8994-angler-rev-101.dts
> > @@ -32,3 +32,7 @@ serial@f991e000 {
> >  		};
> >  	};
> >  };
> > +
> > +&tlmm {
> > +	gpio-reserved-ranges = <85 4>;
> > +};
