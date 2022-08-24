Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0AF1359FAAB
	for <lists+linux-arm-msm@lfdr.de>; Wed, 24 Aug 2022 14:58:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237761AbiHXM6N (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 24 Aug 2022 08:58:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60122 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237738AbiHXM6K (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 24 Aug 2022 08:58:10 -0400
Received: from mail-pl1-x62b.google.com (mail-pl1-x62b.google.com [IPv6:2607:f8b0:4864:20::62b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7EF9B979E1
        for <linux-arm-msm@vger.kernel.org>; Wed, 24 Aug 2022 05:58:09 -0700 (PDT)
Received: by mail-pl1-x62b.google.com with SMTP id y4so15604596plb.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 24 Aug 2022 05:58:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc;
        bh=70yiztN6uXQ5fsldLLpKAFrDxIzTr1xwNBPm9P0GDyc=;
        b=Ru2RtbOb1NgdRCYjvHZ1yOnHPtkG0Qs4RljqUZ4j29rcK+i3brMPAm9b8s3Kup+9Jy
         /wR1f3QnI7RTlNC8ckjNOEgTIaNXm4uWKwdEZmTkS0FzvmPWcPY2HtLUJbMinSYr1rVW
         jlnGEyWNnJ5oMFbto2y3Sb3e8EYI2Pl55suPHi7TZw8pDel4KKt4GPMvZXxXkK947A06
         SfIQ/8zRNxeTdChiYbD0vl14kEEUCPghTtyhODG81PmkOTxiPARtOs6f/zTy+G+Cm15L
         PxMZundx+HXFaj2HsyckiO2f5+sI75dw1xZGn/WEhvS98VHh56apxWidhsMswz6PQdva
         yN9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc;
        bh=70yiztN6uXQ5fsldLLpKAFrDxIzTr1xwNBPm9P0GDyc=;
        b=2lnsnpjpHgImE+evnkOHSTQH3edJ/X/HcTkAxGfsJ8+7ICNlGWtX/IXx81znwA4opQ
         kRwy2Oz6E5Gm3qJ7iPT34/uFstqYD4u5OOfv1bKG7AUu3W7YJhfq7kQ+cbXpRhMS8vgl
         iOYHjUUSY+pplbAxPcVmDO+Lq4otFcPhyg7qDFb7onElj70YLyDqLSnEKCf2O9hK8XAd
         Nx/V4vWMhLkjAd4ZVSbM/K98G7rHBFwsVmqQN3o7gfxaEpSK8mpdgLajEXnFmPl5kkhe
         jhy9RryIeA6pD/js7CRjY68KbSuT1uAi6E0wABqDEH2kTFqVIwKUqC2OR9XCvxGz4Y8L
         LyzA==
X-Gm-Message-State: ACgBeo0q/9UhQpskmqAzcdTysugiI6n48eVMbiQUo9UVK5jfl3NSnSzC
        7vG6sYIcRanaAOuiuRuWRZb9
X-Google-Smtp-Source: AA6agR50lPVRr4e49CZeQCO2prsXmKmVYJUJgcDxfugwWgYI55rILb3D8RW54XSWg+90kxLjyf/9fQ==
X-Received: by 2002:a17:90b:3ec2:b0:1f7:3f49:17bf with SMTP id rm2-20020a17090b3ec200b001f73f4917bfmr8331854pjb.4.1661345888944;
        Wed, 24 Aug 2022 05:58:08 -0700 (PDT)
Received: from thinkpad ([117.207.24.28])
        by smtp.gmail.com with ESMTPSA id jj9-20020a170903048900b0016d785ef6d2sm12403249plb.223.2022.08.24.05.58.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Aug 2022 05:58:08 -0700 (PDT)
Date:   Wed, 24 Aug 2022 18:27:59 +0530
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     Sai Prakash Ranjan <quic_saipraka@quicinc.com>
Cc:     bjorn.andersson@linaro.org, bp@alien8.de, mchehab@kernel.org,
        james.morse@arm.com, rric@kernel.org,
        linux-arm-msm@vger.kernel.org, linux-edac@vger.kernel.org,
        linux-kernel@vger.kernel.org, quic_tsoni@quicinc.com
Subject: Re: [PATCH v2 1/3] soc: qcom: llcc: Pass SoC specific EDAC register
 offsets to EDAC driver
Message-ID: <20220824125759.GA4767@thinkpad>
References: <20220812060602.7672-1-manivannan.sadhasivam@linaro.org>
 <20220812060602.7672-2-manivannan.sadhasivam@linaro.org>
 <396e6b2e-11d1-a11d-206a-cfd69f6cd358@quicinc.com>
 <20220823153152.GA6371@thinkpad>
 <c96016c8-8992-6c8a-b7c1-0ab3722986e0@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <c96016c8-8992-6c8a-b7c1-0ab3722986e0@quicinc.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Wed, Aug 24, 2022 at 10:43:51AM +0530, Sai Prakash Ranjan wrote:
> On 8/23/2022 9:01 PM, Manivannan Sadhasivam wrote:
> > On Mon, Aug 22, 2022 at 05:29:13PM +0530, Sai Prakash Ranjan wrote:
> > > Hi Mani,
> > > 
> > > On 8/12/2022 11:36 AM, Manivannan Sadhasivam wrote:
> > > > The LLCC EDAC register offsets varies between each SoCs. Until now, the
> > > > EDAC driver used the hardcoded register offsets. But this caused crash
> > > > on SM8450 SoC where the register offsets has been changed.
> > > > 
> > > > So to avoid this crash and also to make it easy to accomodate changes for
> > > > new SoCs, let's pass the SoC specific register offsets to the EDAC driver.
> > > > 
> > > > Currently, two set of offsets are used. One is SM8450 specific and another
> > > > one is common to all SoCs.
> > > > 
> > > > Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
> > > <snip> ...
> > > 
> > > >    static const struct qcom_llcc_config sm8350_cfg = {
> > > > @@ -309,6 +370,7 @@ static const struct qcom_llcc_config sm8350_cfg = {
> > > >    	.size           = ARRAY_SIZE(sm8350_data),
> > > >    	.need_llcc_cfg	= true,
> > > >    	.reg_offset	= llcc_v1_2_reg_offset,
> > > > +	.edac_reg	= &common_edac_reg,
> > > >    };
> > > >    static const struct qcom_llcc_config sm8450_cfg = {
> > > > @@ -316,6 +378,7 @@ static const struct qcom_llcc_config sm8450_cfg = {
> > > >    	.size           = ARRAY_SIZE(sm8450_data),
> > > >    	.need_llcc_cfg	= true,
> > > >    	.reg_offset	= llcc_v21_reg_offset,
> > > > +	.edac_reg	= &sm8450_edac_reg,
> > > >    };
> > > > 
> > > Can we have LLCC version specific register offsets instead of SoC specific similar to reg_offset callbacks?
> > > For SM8450, it would be llcc_v21_edac_reg and for others llcc_v1_2_edac_reg instead of common_edac_reg.
> > > common_edac_reg is very general and is not exactly common for all, its just common for SoCs with same LLCC.
> > > 
> > I thought about it but I was not sure if rest of the SoCs are using version
> > v1.2. I know that reg_offset uses v1.2 but I was skeptical and hence used the
> > SoC specific offsets.
> > 
> > Can you confirm if rest of the SoCs are using v1.2?
> 
> LLCC versioning follows w.x.y.z format and w and y are major and minor versions based
> on which the naming for reg_offsets is chosen.
> 
> Now in above reg_offsets, llcc_v1_2 is not v1.2, it means v1.0 or v2.0 where 1, 2 is a major version
> and 0 is a minor version. llcc_v21 is actually v2.1 where 2 is a major and 1 is a minor version.
> I know the naming is pretty bad, should probably replace llcc_v1_2 with llcc_v1_0_v2_0 and
> llcc_v21 with llcc_v2_1? Note here minor version is important because SM8350 is v2.0 and uses
> old reg offsets.
> 

Yeah it is confusing. I think we should just use the base LLCC version
that got changed with the previous one and add a comment on top of the
definition. For instance, all of the SoCs before SM8450 should use
llcc_v1_reg_offset since the LLCC version starts from v1.0.0 and SM8450 should
use llcc_v2_1_reg_offset since it supports the LLCC reg offset that got changed
since v2.1.0. Thoughts?

Thanks,
Mani

> So coming to your query now, all other SoCs except SM8450(which uses v2.1) are using LLCC v1.0
> or v2.0, so it is valid to use the same logic as reg_offsets for edac_reg.
> 
> Thanks,
> Sai
> 
> > Thanks,
> > Mani
> > 
> > > Version based is more applicable as multiple SoCs might use same LLCC versions and would reduce SoC specific data
> > > which would be needed for every SoC in case some newer LLCC comes out. I know you could just call sm8450_edac_reg
> > > for lets say sm8550 or so on to reduce duplication but that won't look good.
> > > 
> > > 
> > > Thanks,
> > > Sai
> 

-- 
மணிவண்ணன் சதாசிவம்
