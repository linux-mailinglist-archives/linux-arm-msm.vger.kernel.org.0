Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2222D102730
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 Nov 2019 15:45:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728069AbfKSOpX (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 19 Nov 2019 09:45:23 -0500
Received: from mail-lj1-f195.google.com ([209.85.208.195]:35152 "EHLO
        mail-lj1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726736AbfKSOpX (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 19 Nov 2019 09:45:23 -0500
Received: by mail-lj1-f195.google.com with SMTP id r7so23634889ljg.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 19 Nov 2019 06:45:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=XQaroAqPBTv3cn0AH8FgZ1yA4zFjMEz2UzMs9ENgnOY=;
        b=tmFnzR8KAYYT2cz8AM2wpk1wEy0sDjU3EzQf4HEBut+VQLxsepLk3/6/8cpc0VKxLq
         UfBrdhDT0xWQNkjBUnKRlzyypOt/BY5REJAP9S/LmH6jD8CWEHzFu3yh/QI7rrH9c82e
         iOt7YT8gMCBns69s891at8X4YmHIMz2VpY9I1lQAe/X3WWXGwq823m2aLhnBu4X3O85I
         WByjYcsMltQgesQBh6DEP72LIobgzQSZGowIUlSYGAJVCNg2J146FEQgsxz9eta1yCFC
         CTo26Eu8TPrW1IcY/Qsml+CosSfQYjV/nsh+d789DkAOExNjaGSuq32wAlu8OnexIfOF
         2V5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=XQaroAqPBTv3cn0AH8FgZ1yA4zFjMEz2UzMs9ENgnOY=;
        b=Xgbb+m0cJPvX+44xAcjy22S74XJNxU/475pEdAYO2aITqKB2pt9TY/IWWX1nI7HPxe
         9uUYocRIKm0tyGiMZq+7FquSMkN8WlnI0WNwapumLLEoDV4gWYztgzjU5ANPIU+pikvm
         bsaPbv06+XT7lnAsW39T+Hd1utj26fWZHdxG0tww6FEKnxmRV1eVMh+07johM3MLdD1b
         wUGLxVx+/nmr2vE7qJ70VR6Xv8dR9GKq+uMH5c2vJqIOaFZU+np+OUUHXCfY47+ubRSV
         bskyXaL+AUvmK+NK7sxZRHtP72OIzvRZ+36LSj5nZ5bpImVEfDL+Q+TCAZ0fFdzyzOkB
         kGTQ==
X-Gm-Message-State: APjAAAViN+CwOO8l6Njqd2aUB2zZzJ65s3On3RR3Gj2Ts4nuTOkk3Cn/
        WpgEu0iY1lzp96G97f3SvkheXg==
X-Google-Smtp-Source: APXvYqy0eb5ynSNYwUa8gfy7iZEtLluEz02LdKIzvGkrxBilNLqPeX629CLSfKICOpAV0jkH6KffEQ==
X-Received: by 2002:a2e:974a:: with SMTP id f10mr1615866ljj.25.1574174720904;
        Tue, 19 Nov 2019 06:45:20 -0800 (PST)
Received: from centauri.ideon.se ([85.235.10.227])
        by smtp.gmail.com with ESMTPSA id z20sm11772338ljj.85.2019.11.19.06.45.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Nov 2019 06:45:20 -0800 (PST)
Date:   Tue, 19 Nov 2019 15:45:18 +0100
From:   Niklas Cassel <niklas.cassel@linaro.org>
To:     Stanimir Varbanov <stanimir.varbanov@linaro.org>
Cc:     linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        amit.kucheria@linaro.org, sboyd@kernel.org, vireshk@kernel.org,
        bjorn.andersson@linaro.org, ulf.hansson@linaro.org,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>,
        linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v5 5/5] arm64: defconfig: enable
 CONFIG_ARM_QCOM_CPUFREQ_NVMEM
Message-ID: <20191119144518.GA17086@centauri.ideon.se>
References: <20191115121544.2339036-1-niklas.cassel@linaro.org>
 <20191115121544.2339036-6-niklas.cassel@linaro.org>
 <aed0bac0-ca9d-febd-ac57-120e60e99e0d@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aed0bac0-ca9d-febd-ac57-120e60e99e0d@linaro.org>
User-Agent: Mutt/1.12.1 (2019-06-15)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Fri, Nov 15, 2019 at 02:44:03PM +0200, Stanimir Varbanov wrote:
> Hi Niklas,
> 
> On 11/15/19 2:15 PM, Niklas Cassel wrote:
> > Enable CONFIG_ARM_QCOM_CPUFREQ_NVMEM.
> 
> Shouldn't this be selected from qcom-cpr.c Kconfig ?

Hello Stan,

I can see where this is coming from.

If e.g. CONFIG_ARM_QCOM_CPUFREQ_NVMEM is selected but
CONFIG_QCOM_CPR is not, then the cpufreq driver will
return -EPROBE_DEFER, and will never probe successfully.

However, I don't really see a difference to any other
driver using a framework that the user has not enabled.
The driver will then use that framework's stubs, which
usually only return -ENODEV or similar.

So even though these both need to be enabled to work as
intended, they can be compiled/build tested separately.


Kind regards,
Niklas

> 
> > 
> > Signed-off-by: Niklas Cassel <niklas.cassel@linaro.org>
> > ---
> >  arch/arm64/configs/defconfig | 1 +
> >  1 file changed, 1 insertion(+)
> > 
> > diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
> > index 4385033c0a34..09aaffd473a0 100644
> > --- a/arch/arm64/configs/defconfig
> > +++ b/arch/arm64/configs/defconfig
> > @@ -88,6 +88,7 @@ CONFIG_ACPI_CPPC_CPUFREQ=m
> >  CONFIG_ARM_ARMADA_37XX_CPUFREQ=y
> >  CONFIG_ARM_SCPI_CPUFREQ=y
> >  CONFIG_ARM_IMX_CPUFREQ_DT=m
> > +CONFIG_ARM_QCOM_CPUFREQ_NVMEM=y
> >  CONFIG_ARM_QCOM_CPUFREQ_HW=y
> >  CONFIG_ARM_RASPBERRYPI_CPUFREQ=m
> >  CONFIG_ARM_TEGRA186_CPUFREQ=y
> > 
> 
> -- 
> regards,
> Stan
