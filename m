Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4E96159E9FB
	for <lists+linux-arm-msm@lfdr.de>; Tue, 23 Aug 2022 19:46:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231489AbiHWRpC (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 23 Aug 2022 13:45:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48078 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231434AbiHWRog (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 23 Aug 2022 13:44:36 -0400
Received: from mail-pj1-x1034.google.com (mail-pj1-x1034.google.com [IPv6:2607:f8b0:4864:20::1034])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D1BA4631A
        for <linux-arm-msm@vger.kernel.org>; Tue, 23 Aug 2022 08:31:59 -0700 (PDT)
Received: by mail-pj1-x1034.google.com with SMTP id r14-20020a17090a4dce00b001faa76931beso17591535pjl.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 23 Aug 2022 08:31:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc;
        bh=qct9z1POCA7Jy2X8nJy6q3YtzWuUbY8HrzeX4jusHq4=;
        b=lVeP3UhkfDNVJUMCfamBrw0VUh/SlY3tf79Q4V3Mo9XPr2BNDN9MDheA7ptj64ryOH
         wnFO33a21kIeFSrxcgIEpY01+baeZxbcxsc5W26g46Y3GvuGFx8A4zPoejNY3gmdMsu5
         5nfSbWWTGThTBHIuSVtp9BFnbj6+UCaCN9w3pTwecQsSD/z041P1WYXqZ2ZW7UzcGQkK
         ZAdFYQr2XywegE2t+DnXm5qHvQ80Fd7vTO3aNBRSxy1PZbeSC0my0ZuIvjb/LelrhF6t
         E5SU5+zR73hH5RBoMKWSYXAfH4zUabq6gQrp0nsSIyKd8RkN8++GuEyK9uMxOqOaezXu
         oJ/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc;
        bh=qct9z1POCA7Jy2X8nJy6q3YtzWuUbY8HrzeX4jusHq4=;
        b=Sg5pQVmt9qcy0mxz+h7AcruBIqSwdKIs0qQexWGCX7R1VcKDkCYHormhaUqlXc+Hl4
         PUVdbmm/eZArmuyzO46cvPQu3RRoEq7lczNLA0PqhxddjOH9D1KjAnk4Z0MfWd8JD54A
         BTCa+q4aJa3Tg5kvjZoUh7I3Gwb7+hZr2MLfWTKu+lyr3uloo6GOq0j+jiXENKKMQeJL
         Zjnd/5PDQ5OtAnLrQZcP7fRuZzKaa/Dolwvekn77QoPZ9JXcVdqplp0a4YlVMGsM0ONx
         QR9B1XnSMFBA4Ze4ks5qGoY8gZRf/vKcGUWhRrkc0lzGqmy15RIsdCeTEjvYsY0bm7qs
         ptFQ==
X-Gm-Message-State: ACgBeo28GWqvOoFatPan0D5pQAQg701QtshDDs+dRu2R+Gr9M4adTiJz
        yvIbaQ4JFn8UIvGFaIHLSR0V
X-Google-Smtp-Source: AA6agR7jcesWlNnD7IhPKRcm+XBvX5f7MQ+5XS2sVM3V8pbihZ1qzUU3KfoXO29qUuES555fpng/8A==
X-Received: by 2002:a17:90b:4a51:b0:1f5:8308:6ed7 with SMTP id lb17-20020a17090b4a5100b001f583086ed7mr3748418pjb.177.1661268719263;
        Tue, 23 Aug 2022 08:31:59 -0700 (PDT)
Received: from thinkpad ([220.158.159.146])
        by smtp.gmail.com with ESMTPSA id b14-20020a170903228e00b001728eb339e2sm10706306plh.286.2022.08.23.08.31.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Aug 2022 08:31:58 -0700 (PDT)
Date:   Tue, 23 Aug 2022 21:01:52 +0530
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     Sai Prakash Ranjan <quic_saipraka@quicinc.com>
Cc:     bjorn.andersson@linaro.org, bp@alien8.de, mchehab@kernel.org,
        james.morse@arm.com, rric@kernel.org,
        linux-arm-msm@vger.kernel.org, linux-edac@vger.kernel.org,
        linux-kernel@vger.kernel.org, quic_tsoni@quicinc.com
Subject: Re: [PATCH v2 1/3] soc: qcom: llcc: Pass SoC specific EDAC register
 offsets to EDAC driver
Message-ID: <20220823153152.GA6371@thinkpad>
References: <20220812060602.7672-1-manivannan.sadhasivam@linaro.org>
 <20220812060602.7672-2-manivannan.sadhasivam@linaro.org>
 <396e6b2e-11d1-a11d-206a-cfd69f6cd358@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <396e6b2e-11d1-a11d-206a-cfd69f6cd358@quicinc.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Mon, Aug 22, 2022 at 05:29:13PM +0530, Sai Prakash Ranjan wrote:
> Hi Mani,
> 
> On 8/12/2022 11:36 AM, Manivannan Sadhasivam wrote:
> > The LLCC EDAC register offsets varies between each SoCs. Until now, the
> > EDAC driver used the hardcoded register offsets. But this caused crash
> > on SM8450 SoC where the register offsets has been changed.
> > 
> > So to avoid this crash and also to make it easy to accomodate changes for
> > new SoCs, let's pass the SoC specific register offsets to the EDAC driver.
> > 
> > Currently, two set of offsets are used. One is SM8450 specific and another
> > one is common to all SoCs.
> > 
> > Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
> 
> <snip> ...
> 
> >   static const struct qcom_llcc_config sm8350_cfg = {
> > @@ -309,6 +370,7 @@ static const struct qcom_llcc_config sm8350_cfg = {
> >   	.size           = ARRAY_SIZE(sm8350_data),
> >   	.need_llcc_cfg	= true,
> >   	.reg_offset	= llcc_v1_2_reg_offset,
> > +	.edac_reg	= &common_edac_reg,
> >   };
> >   static const struct qcom_llcc_config sm8450_cfg = {
> > @@ -316,6 +378,7 @@ static const struct qcom_llcc_config sm8450_cfg = {
> >   	.size           = ARRAY_SIZE(sm8450_data),
> >   	.need_llcc_cfg	= true,
> >   	.reg_offset	= llcc_v21_reg_offset,
> > +	.edac_reg	= &sm8450_edac_reg,
> >   };
> > 
> 
> Can we have LLCC version specific register offsets instead of SoC specific similar to reg_offset callbacks?
> For SM8450, it would be llcc_v21_edac_reg and for others llcc_v1_2_edac_reg instead of common_edac_reg.
> common_edac_reg is very general and is not exactly common for all, its just common for SoCs with same LLCC.
> 

I thought about it but I was not sure if rest of the SoCs are using version
v1.2. I know that reg_offset uses v1.2 but I was skeptical and hence used the
SoC specific offsets.

Can you confirm if rest of the SoCs are using v1.2?

Thanks,
Mani

> Version based is more applicable as multiple SoCs might use same LLCC versions and would reduce SoC specific data
> which would be needed for every SoC in case some newer LLCC comes out. I know you could just call sm8450_edac_reg
> for lets say sm8550 or so on to reduce duplication but that won't look good.
> 
> 
> Thanks,
> Sai

-- 
மணிவண்ணன் சதாசிவம்
